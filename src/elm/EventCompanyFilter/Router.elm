module EventCompanyFilter.Router where

import EventCompanyFilter.Model as EventCompanyFilter exposing (initialModel, Model)

import RouteHash exposing (HashUpdate)
import String exposing (toInt)

type alias Model = EventCompanyFilter.Model

delta2update : Model -> Model -> Maybe HashUpdate
delta2update previous current =
  let
    url =
      case current.selectedCompany of
        Just companyId -> [ toString (companyId) ]
        Nothing -> []
  in
    Just <| RouteHash.set url

location2company : List String -> Maybe Int
location2company list =
  case List.head list of
    Just eventId ->
      case String.toInt eventId of
        Ok val ->
          Just val
        Err _ ->
          Nothing

    Nothing ->
      Nothing
