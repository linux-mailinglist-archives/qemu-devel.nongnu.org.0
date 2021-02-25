Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC8D325104
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 14:58:05 +0100 (CET)
Received: from localhost ([::1]:56310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFH9Y-0004JJ-Gs
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 08:58:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@pond.sub.org>)
 id 1lFH8Y-0003rb-1c
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 08:57:02 -0500
Received: from oxygen.pond.sub.org ([94.130.129.15]:41080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@pond.sub.org>)
 id 1lFH8U-00063s-9r
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 08:57:01 -0500
Received: from blackfin.pond.sub.org
 (p200300d36f2e0300dacb8afffee0c842.dip0.t-ipconnect.de
 [IPv6:2003:d3:6f2e:300:dacb:8aff:fee0:c842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by oxygen.pond.sub.org (Postfix) with ESMTPSA id 9611920C8D;
 Thu, 25 Feb 2021 14:56:51 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 42DEF113860F; Thu, 25 Feb 2021 14:56:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 08/16] qapi/expr.py: add type hint annotations
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-9-jsnow@redhat.com>
Date: Thu, 25 Feb 2021 14:56:51 +0100
Message-ID: <87wnuwb68s.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=94.130.129.15; envelope-from=armbru@pond.sub.org;
 helo=oxygen.pond.sub.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Annotations do not change runtime behavior.
> This commit *only* adds annotations.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> ---
>  scripts/qapi/expr.py  | 71 ++++++++++++++++++++++++++++---------------
>  scripts/qapi/mypy.ini |  5 ---
>  2 files changed, 46 insertions(+), 30 deletions(-)
>
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index f45d6be1f4c..df6c64950fa 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -15,7 +15,14 @@
>  # See the COPYING file in the top-level directory.
>  
>  import re
> -from typing import MutableMapping, Optional, cast
> +from typing import (
> +    Iterable,
> +    List,
> +    MutableMapping,
> +    Optional,
> +    Union,
> +    cast,
> +)
>  
>  from .common import c_name
>  from .error import QAPISemError
> @@ -23,9 +30,10 @@
>  from .source import QAPISourceInfo
>  
>  
> -# Expressions in their raw form are JSON-like structures with arbitrary forms.
> -# Minimally, their top-level form must be a mapping of strings to values.
> -Expression = MutableMapping[str, object]
> +# Arbitrary form for a JSON-like object.
> +_JSObject = MutableMapping[str, object]
> +# Expressions in their raw form are (just) JSON-like objects.
> +Expression = _JSObject

We solved a similar, slightly more involved typing problem in
introspect.py.

Whereas expr.py uses Python dict, list, and scalars to represent the
output of a JSON parser, introspect.py uses them to represent the input
of a quasi-JSON formatter ("quasi-JSON" because it spits out a C
initializer for a C representation of JSON, but that's detail).

introspect.py additionally supports comments and #if conditionals.

This is the solution we're using in introspect.py.  The Annotated[] part
is for comments and conditionals; ignore that.

  # This module constructs a tree data structure that is used to
  # generate the introspection information for QEMU. It is shaped
  # like a JSON value.
  #
  # A complexity over JSON is that our values may or may not be annotated.
  #
  # Un-annotated values may be:
  #     Scalar: str, bool, None.
  #     Non-scalar: List, Dict
  # _value = Union[str, bool, None, Dict[str, JSONValue], List[JSONValue]]
  #
  # With optional annotations, the type of all values is:
  # JSONValue = Union[_Value, Annotated[_Value]]
  #
  # Sadly, mypy does not support recursive types; so the _Stub alias is used to
  # mark the imprecision in the type model where we'd otherwise use JSONValue.
  _Stub = Any
  _Scalar = Union[str, bool, None]
  _NonScalar = Union[Dict[str, _Stub], List[_Stub]]
  _Value = Union[_Scalar, _NonScalar]
  JSONValue = Union[_Value, 'Annotated[_Value]']

introspect.py then adds some more type aliases to convey meaning:

  # These types are based on structures defined in QEMU's schema, so we
  # lack precise types for them here. Python 3.6 does not offer
  # TypedDict constructs, so they are broadly typed here as simple
  # Python Dicts.
  SchemaInfo = Dict[str, object]
  SchemaInfoObject = Dict[str, object]
  SchemaInfoObjectVariant = Dict[str, object]
  SchemaInfoObjectMember = Dict[str, object]
  SchemaInfoCommand = Dict[str, object]

I'm not asking you to factor out common typing.

I'm not even asking you to rework expr.py to maximize similarity.

I am asking you to consider stealing applicable parts from
introspect.py's comments.

_JSObject seems to serve the same purpose as JSONValue.  Correct?

Expression seems to serve a comparable purpose as SchemaInfo.  Correct?

[...]

