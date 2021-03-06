// Copyright (c) 2020, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'constants_lib.dart' as lib;

typedef F1<T> = T Function(T);
typedef F2 = T Function<T>(T);

const objectTypeLiteral = Object;
const int Function(int) partialInstantiation = lib.id;
const instance = const lib.Class<int>(0);
const functionTypeLiteral = F1;
const genericFunctionTypeLiteral = F2;
const listLiteral = <int>[0];
const setLiteral = <int>{0};
const mapLiteral = <int, String>{0: 'foo'};
const listConcatenation = <int>[...listLiteral];
const setConcatenation = <int>{...setLiteral};
const mapConcatenation = <int, String>{...mapLiteral};

const objectTypeLiteralIdentical =
    identical(objectTypeLiteral, lib.objectTypeLiteral);
const partialInstantiationIdentical =
    identical(partialInstantiation, lib.partialInstantiation);
const instanceIdentical = identical(instance, lib.instance);
const functionTypeLiteralIdentical =
    identical(functionTypeLiteral, lib.functionTypeLiteral);
const genericFunctionTypeLiteralIdentical =
    identical(genericFunctionTypeLiteral, lib.genericFunctionTypeLiteral);
const listLiteralIdentical = identical(listLiteral, lib.listLiteral);
const setLiteralIdentical = identical(setLiteral, lib.setLiteral);
const mapLiteralIdentical = identical(mapLiteral, lib.mapLiteral);
const listConcatenationIdentical =
    identical(listConcatenation, lib.listConcatenation);
const setConcatenationIdentical =
    identical(setConcatenation, lib.setConcatenation);
const mapConcatenationIdentical =
    identical(mapConcatenation, lib.mapConcatenation);

final bool inStrongMode = _inStrongMode();

bool _inStrongMode() {
  const List<int?> list = const <int?>[];
  return list is! List<int>;
}

main() {
  test(objectTypeLiteral, lib.objectTypeLiteral);
  test(partialInstantiation, lib.partialInstantiation);
  test(instance, lib.instance);
  test(functionTypeLiteral, lib.functionTypeLiteral);
  test(genericFunctionTypeLiteral, lib.genericFunctionTypeLiteral);
  test(listLiteral, lib.listLiteral);
  test(setLiteral, lib.setLiteral);
  test(mapLiteral, lib.mapLiteral);
  test(listConcatenation, lib.listConcatenation);
  test(setConcatenation, lib.setConcatenation);
  test(mapConcatenation, lib.mapConcatenation);

  test(true, objectTypeLiteralIdentical);
  test(true, partialInstantiationIdentical);
  test(true, instanceIdentical);
  test(true, functionTypeLiteralIdentical);
  test(true, genericFunctionTypeLiteralIdentical);
  test(true, listLiteralIdentical);
  test(true, setLiteralIdentical);
  test(true, mapLiteralIdentical);
  test(true, listConcatenationIdentical);
  test(true, setConcatenationIdentical);
  test(true, mapConcatenationIdentical);
}

test(expected, actual) {
  print('test($expected, $actual)');
  if (inStrongMode) {
    if (identical(expected, actual)) {
      throw 'Unexpected identical for $expected and $actual';
    }
  } else {
    if (!identical(expected, actual)) {
      throw 'Expected $expected, actual $actual';
    }
  }
}
