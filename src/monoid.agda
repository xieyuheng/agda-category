{-# OPTIONS --type-in-type #-}
{-# OPTIONS --prop #-}
{-# OPTIONS --allow-unsolved-metas #-}

module monoid where

open import basic
open eqv-reasoning

open import category
open category-t

record monoid-t : type where
  field
    elem-t : type
    mul : elem-t -> elem-t -> elem-t
    mul-associative :
      (x y z : elem-t) ->
      the-eqv-t elem-t
        (mul x (mul y z))
        (mul (mul x y) z)
    id : elem-t
    id-left : (x : elem-t) -> the-eqv-t elem-t (mul id x) x
    id-right : (x : elem-t) -> the-eqv-t elem-t (mul x id) x

module _ (monoid : monoid-t) where
  open monoid-t
  monoid-as-category : category-t
  monoid-as-category .object-t = unit-t
  monoid-as-category .morphism-t unit unit = monoid .elem-t
  monoid-as-category .id unit = monoid .id
  monoid-as-category .compose {unit} {unit} {unit} = monoid .mul
  monoid-as-category .id-left {unit} {unit} = monoid .id-left
  monoid-as-category .id-right {unit} {unit} = monoid .id-right
  monoid-as-category .compose-associative {unit} {unit} {unit} {unit} x y z =
    monoid .mul-associative x y z

  k : (cat : category-t) -> cat .object-t
  k = {!!}
