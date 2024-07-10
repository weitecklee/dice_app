import 'dart:math';
import 'package:flutter/material.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var diceRoll = [1];
  var numberOfDice = 1;

  void rollDice() {
    setState(() {
      diceRoll = [
        for (var i = 0; i < numberOfDice; i++) Random().nextInt(6) + 1
      ];
    });
  }

  void changeNumberOfDice(int n) {
    setState(() {
      numberOfDice = n;
      rollDice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            ...diceRoll.map((d) {
              return Image.asset('assets/images/dice-$d.png', width: 200.0);
            })
          ],
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
          ),
          child: const Text(
            'Roll!',
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Number of dice: ',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            DropdownButton(
              items: [
                for (var i = 1; i < 5; i++)
                  DropdownMenuItem(
                    value: i,
                    child: Text(
                      i.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  )
              ],
              onChanged: (v) {
                changeNumberOfDice(v!);
              },
              value: numberOfDice,
              dropdownColor: Colors.black,
            ),
          ],
        ),
      ],
    );
  }
}
