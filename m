Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F53D3A6929
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 16:40:05 +0200 (CEST)
Received: from localhost ([::1]:44086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsnky-0006Yd-De
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 10:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lsnjU-0004sM-2V
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:38:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lsnjQ-0001Xp-JP
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:38:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623681508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6RmQ2zMEbcCU66lGBFYavf+9NinZRPtzRglLZo9PDnk=;
 b=ViLZAbHhNI1eTGJccp+O+B/gUvXoAMY6mQGFIu3dvqmAOBgNtJqNJTxrYQt1knghfzDWF5
 To4TDar1u1vRcHRGdESC5K8jeFv+fZcNtA4YGHwMH2EtJiRfjvTHxTAa7Ab6D0dHfSoFHk
 g/yefeoUKyXIAcMm5WLJajVtb8d7LQU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-_9fuvmiBNti0gkA2-Bho0w-1; Mon, 14 Jun 2021 10:38:26 -0400
X-MC-Unique: _9fuvmiBNti0gkA2-Bho0w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A41EC100C668
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 14:38:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 036FD1962D;
 Mon, 14 Jun 2021 14:38:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8889F113865F; Mon, 14 Jun 2021 16:38:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v5 4/9] qapi: start building an 'if' predicate tree
References: <20210608120723.2268181-1-marcandre.lureau@redhat.com>
 <20210608120723.2268181-5-marcandre.lureau@redhat.com>
Date: Mon, 14 Jun 2021 16:38:19 +0200
In-Reply-To: <20210608120723.2268181-5-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Tue, 8 Jun 2021 16:07:18 +0400")
Message-ID: <87bl88y0is.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jsnow@redhat.com, Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following patches are going to express schema 'if' conditions in a
> target language agnostic way. For that, let's start building a predicate
> tree of the configuration options.
>
> This intermediary steps still uses C-preprocessor expressions as
> the predicates:
>
> "if: [STR, ..]" is translated to a "IfCond -> IfAll ->
> [IfOption, ..]" tree, which will generate "#if STR && .." C code.
>
> Once the boolean operation tree nodes are introduced, the 'if'
> expressions will be converted to replace the C syntax (no more
> !defined(), &&, ...) and based only on option identifiers.
>
> For now, the condition tree will be less expressive than a full C macro
> expression as it will only support these operations: 'all', 'any' and
> 'not', the only ones needed so far.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Tested-by: John Snow <jsnow@redhat.com>
> ---
>  docs/sphinx/qapidoc.py                 |  6 +--
>  scripts/qapi/common.py                 | 53 ++++++++++++++++++++++-
>  scripts/qapi/schema.py                 | 17 ++++++--
>  tests/qapi-schema/doc-good.out         | 12 +++---
>  tests/qapi-schema/qapi-schema-test.out | 58 +++++++++++++-------------
>  tests/qapi-schema/test-qapi.py         |  2 +-
>  6 files changed, 103 insertions(+), 45 deletions(-)
>
> diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
> index b737949007..0f87fb16ce 100644
> --- a/docs/sphinx/qapidoc.py
> +++ b/docs/sphinx/qapidoc.py
> @@ -112,12 +112,10 @@ def _make_section(self, title):
>      def _nodes_for_ifcond(self, ifcond, with_if=3DTrue):
>          """Return list of Text, literal nodes for the ifcond
> =20
> -        Return a list which gives text like ' (If: cond1, cond2, cond3)'=
, where
> -        the conditions are in literal-text and the commas are not.
> +        Return a list which gives text like ' (If: condition)'.
>          If with_if is False, we don't return the "(If: " and ")".
>          """
> -        condlist =3D intersperse([nodes.literal('', c) for c in ifcond.i=
fcond],
> -                               nodes.Text(', '))
> +        condlist =3D [nodes.literal('', ifcond.docgen())]
>          if not with_if:
>              return condlist
> =20
> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> index c305aaf2f1..01e3203545 100644
> --- a/scripts/qapi/common.py
> +++ b/scripts/qapi/common.py
> @@ -12,7 +12,7 @@
>  # See the COPYING file in the top-level directory.
> =20
>  import re
> -from typing import Match, Optional
> +from typing import Match, Optional, Sequence
> =20
> =20
>  #: Magic string that gets removed along with all space to its right.
> @@ -214,3 +214,54 @@ def must_match(pattern: str, string: str) -> Match[s=
tr]:
>      match =3D re.match(pattern, string)
>      assert match is not None
>      return match
> +
> +
> +class IfPredicate:

This is the abstract base class of the two (soon four) forms 'if'.
qapi-code-gen.txt calls them "conditionals", and the code so far uses
names like @ifcond.  I'd prefer not to throw "predicate" into the
cauldron.  IfCond?  IfConditional?

> +    """An 'if' condition predicate"""
> +
> +    def cgen(self) -> str:
> +        raise NotImplementedError()
> +
> +    def docgen(self) -> str:
> +        raise NotImplementedError()
> +
> +
> +class IfOption(IfPredicate):

The name IfOption tells me nothing.

At this point in the series, the IfOption are arbitrary C preprocessor
expressions.

At the end of the series, they are operands of the C preprocessor's
unary operator defined, i.e. a C macro name.

Once I know that, IfOption kind of makes sense.  Hmm.  IfConfigOption?
IfIdentifier?  IfLeaf?  I'm not quite sure which one I dislike the least
:)

> +    def __init__(self, option: str):
> +        self.option =3D option
> +
> +    def cgen(self) -> str:
> +        return self.option
> +
> +    def docgen(self) -> str:
> +        return self.option
> +
> +    def __repr__(self) -> str:
> +        return f"{type(self).__name__}({self.option!r})"

Intended use?

> +
> +    def __eq__(self, other: object) -> bool:
> +        if not isinstance(other, IfOption):
> +            return NotImplemented
> +        return self.option =3D=3D other.option

Why raise on type mismatch?  Feels rather un-pythonic to me.

> +
> +
> +class IfAll(IfPredicate):
> +    def __init__(self, pred_list: Sequence[IfPredicate]):
> +        self.pred_list =3D pred_list
> +
> +    def cgen(self) -> str:
> +        return " && ".join([p.cgen() for p in self.pred_list])

Fragile.  See my review of PATCH 3.

> +
> +    def docgen(self) -> str:
> +        return " and ".join([p.docgen() for p in self.pred_list])
> +
> +    def __bool__(self) -> bool:
> +        return bool(self.pred_list)

Not as confusing as QAPISchemaIfCond.__bool__() as long as it's kept
well away from None.  Still, I'm not sure I like it.

> +
> +    def __repr__(self) -> str:
> +        return f"{type(self).__name__}({self.pred_list!r})"
> +
> +    def __eq__(self, other: object) -> bool:
> +        if not isinstance(other, IfAll):
> +            return NotImplemented
> +        return self.pred_list =3D=3D other.pred_list

Same as above.

Why are these classes in common.py?

> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index aa4715c519..f52caaeecc 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -19,7 +19,12 @@
>  import re
>  from typing import Optional
> =20
> -from .common import POINTER_SUFFIX, c_name
> +from .common import (
> +    POINTER_SUFFIX,
> +    IfAll,
> +    IfOption,
> +    c_name,
> +)
>  from .error import QAPIError, QAPISemError, QAPISourceError
>  from .expr import check_exprs
>  from .parser import QAPISchemaParser
> @@ -28,18 +33,22 @@
>  class QAPISchemaIfCond:
>      def __init__(self, ifcond=3DNone):
>          self.ifcond =3D ifcond or []
> +        self.pred =3D IfAll([IfOption(opt) for opt in self.ifcond])

In the common case of just one element, we get a no-op IfAll wrapped
around it.  Okay.

self.ifcond goes away in PATCH 7.  Okay.

> +
> +    def docgen(self):
> +        return self.pred.docgen()
> =20
>      def cgen(self):
> -        return ' && '.join(self.ifcond)
> +        return self.pred.cgen()
> =20
>      # Returns true if the condition is not void
>      def __bool__(self):
> -        return bool(self.ifcond)
> +        return bool(self.pred)
> =20
>      def __eq__(self, other):
>          if not isinstance(other, QAPISchemaIfCond):
>              return NotImplemented
> -        return self.ifcond =3D=3D other.ifcond
> +        return self.pred =3D=3D other.pred

Not much left in this class, and it's going to get even thinner.

> =20
> =20
>  class QAPISchemaEntity:
> diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.=
out
> index 8f54ceff2e..db1d23c6bf 100644
> --- a/tests/qapi-schema/doc-good.out
> +++ b/tests/qapi-schema/doc-good.out
> @@ -12,15 +12,15 @@ enum QType
>  module doc-good.json
>  enum Enum
>      member one
> -        if ['defined(IFONE)']
> +        if IfAll([IfOption('defined(IFONE)')])
>      member two
> -    if ['defined(IFCOND)']
> +    if IfAll([IfOption('defined(IFCOND)')])
>      feature enum-feat
>  object Base
>      member base1: Enum optional=3DFalse
>  object Variant1
>      member var1: str optional=3DFalse
> -        if ['defined(IFSTR)']
> +        if IfAll([IfOption('defined(IFSTR)')])
>          feature member-feat
>      feature variant1-feat
>  object Variant2
> @@ -29,7 +29,7 @@ object Object
>      tag base1
>      case one: Variant1
>      case two: Variant2
> -        if ['IFTWO']
> +        if IfAll([IfOption('IFTWO')])
>      feature union-feat1
>  object q_obj_Variant1-wrapper
>      member data: Variant1 optional=3DFalse
> @@ -38,13 +38,13 @@ object q_obj_Variant2-wrapper
>  enum SugaredUnionKind
>      member one
>      member two
> -        if ['IFTWO']
> +        if IfAll([IfOption('IFTWO')])
>  object SugaredUnion
>      member type: SugaredUnionKind optional=3DFalse
>      tag type
>      case one: q_obj_Variant1-wrapper
>      case two: q_obj_Variant2-wrapper
> -        if ['IFTWO']
> +        if IfAll([IfOption('IFTWO')])
>      feature union-feat2
>  alternate Alternate
>      tag type
> diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/q=
api-schema-test.out
> index e0b8a5f0b6..e4e0fb173a 100644
> --- a/tests/qapi-schema/qapi-schema-test.out
> +++ b/tests/qapi-schema/qapi-schema-test.out
> @@ -298,65 +298,65 @@ command __org.qemu_x-command q_obj___org.qemu_x-com=
mand-arg -> __org.qemu_x-Unio
>  object TestIfStruct
>      member foo: int optional=3DFalse
>      member bar: int optional=3DFalse
> -        if ['defined(TEST_IF_STRUCT_BAR)']
> -    if ['defined(TEST_IF_STRUCT)']
> +        if IfAll([IfOption('defined(TEST_IF_STRUCT_BAR)')])
> +    if IfAll([IfOption('defined(TEST_IF_STRUCT)')])
>  enum TestIfEnum
>      member foo
>      member bar
> -        if ['defined(TEST_IF_ENUM_BAR)']
> -    if ['defined(TEST_IF_ENUM)']
> +        if IfAll([IfOption('defined(TEST_IF_ENUM_BAR)')])
> +    if IfAll([IfOption('defined(TEST_IF_ENUM)')])
>  object q_obj_TestStruct-wrapper
>      member data: TestStruct optional=3DFalse
>  enum TestIfUnionKind
>      member foo
>      member bar
> -        if ['defined(TEST_IF_UNION_BAR)']
> -    if ['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)']
> +        if IfAll([IfOption('defined(TEST_IF_UNION_BAR)')])
> +    if IfAll([IfOption('defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT=
)')])
>  object TestIfUnion
>      member type: TestIfUnionKind optional=3DFalse
>      tag type
>      case foo: q_obj_TestStruct-wrapper
>      case bar: q_obj_str-wrapper
> -        if ['defined(TEST_IF_UNION_BAR)']
> -    if ['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)']
> +        if IfAll([IfOption('defined(TEST_IF_UNION_BAR)')])
> +    if IfAll([IfOption('defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT=
)')])
>  object q_obj_test-if-union-cmd-arg
>      member union-cmd-arg: TestIfUnion optional=3DFalse
> -    if ['defined(TEST_IF_UNION)']
> +    if IfAll([IfOption('defined(TEST_IF_UNION)')])
>  command test-if-union-cmd q_obj_test-if-union-cmd-arg -> None
>      gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preconf=
ig=3DFalse
> -    if ['defined(TEST_IF_UNION)']
> +    if IfAll([IfOption('defined(TEST_IF_UNION)')])
>  alternate TestIfAlternate
>      tag type
>      case foo: int
>      case bar: TestStruct
> -        if ['defined(TEST_IF_ALT_BAR)']
> -    if ['defined(TEST_IF_ALT) && defined(TEST_IF_STRUCT)']
> +        if IfAll([IfOption('defined(TEST_IF_ALT_BAR)')])
> +    if IfAll([IfOption('defined(TEST_IF_ALT) && defined(TEST_IF_STRUCT)'=
)])
>  object q_obj_test-if-alternate-cmd-arg
>      member alt-cmd-arg: TestIfAlternate optional=3DFalse
> -    if ['defined(TEST_IF_ALT)']
> +    if IfAll([IfOption('defined(TEST_IF_ALT)')])
>  command test-if-alternate-cmd q_obj_test-if-alternate-cmd-arg -> None
>      gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preconf=
ig=3DFalse
> -    if ['defined(TEST_IF_ALT)']
> +    if IfAll([IfOption('defined(TEST_IF_ALT)')])
>  object q_obj_test-if-cmd-arg
>      member foo: TestIfStruct optional=3DFalse
>      member bar: TestIfEnum optional=3DFalse
> -        if ['defined(TEST_IF_CMD_BAR)']
> -    if ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)']
> +        if IfAll([IfOption('defined(TEST_IF_CMD_BAR)')])
> +    if IfAll([IfOption('defined(TEST_IF_CMD)'), IfOption('defined(TEST_I=
F_STRUCT)')])
>  command test-if-cmd q_obj_test-if-cmd-arg -> UserDefThree
>      gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preconf=
ig=3DFalse
> -    if ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)']
> +    if IfAll([IfOption('defined(TEST_IF_CMD)'), IfOption('defined(TEST_I=
F_STRUCT)')])
>  command test-cmd-return-def-three None -> UserDefThree
>      gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preconf=
ig=3DFalse
>  array TestIfEnumList TestIfEnum
> -    if ['defined(TEST_IF_ENUM)']
> +    if IfAll([IfOption('defined(TEST_IF_ENUM)')])
>  object q_obj_TEST_IF_EVENT-arg
>      member foo: TestIfStruct optional=3DFalse
>      member bar: TestIfEnumList optional=3DFalse
> -        if ['defined(TEST_IF_EVT_BAR)']
> -    if ['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)']
> +        if IfAll([IfOption('defined(TEST_IF_EVT_BAR)')])
> +    if IfAll([IfOption('defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)'=
)])
>  event TEST_IF_EVENT q_obj_TEST_IF_EVENT-arg
>      boxed=3DFalse
> -    if ['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)']
> +    if IfAll([IfOption('defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)'=
)])
>  object FeatureStruct0
>      member foo: int optional=3DFalse
>  object FeatureStruct1
> @@ -379,17 +379,17 @@ object FeatureStruct4
>  object CondFeatureStruct1
>      member foo: int optional=3DFalse
>      feature feature1
> -        if ['defined(TEST_IF_FEATURE_1)']
> +        if IfAll([IfOption('defined(TEST_IF_FEATURE_1)')])
>  object CondFeatureStruct2
>      member foo: int optional=3DFalse
>      feature feature1
> -        if ['defined(TEST_IF_FEATURE_1)']
> +        if IfAll([IfOption('defined(TEST_IF_FEATURE_1)')])
>      feature feature2
> -        if ['defined(TEST_IF_FEATURE_2)']
> +        if IfAll([IfOption('defined(TEST_IF_FEATURE_2)')])
>  object CondFeatureStruct3
>      member foo: int optional=3DFalse
>      feature feature1
> -        if ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)']
> +        if IfAll([IfOption('defined(TEST_IF_COND_1)'), IfOption('defined=
(TEST_IF_COND_2)')])
>  enum FeatureEnum1
>      member eins
>      member zwei
> @@ -429,17 +429,17 @@ command test-command-features3 None -> None
>  command test-command-cond-features1 None -> None
>      gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preconf=
ig=3DFalse
>      feature feature1
> -        if ['defined(TEST_IF_FEATURE_1)']
> +        if IfAll([IfOption('defined(TEST_IF_FEATURE_1)')])
>  command test-command-cond-features2 None -> None
>      gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preconf=
ig=3DFalse
>      feature feature1
> -        if ['defined(TEST_IF_FEATURE_1)']
> +        if IfAll([IfOption('defined(TEST_IF_FEATURE_1)')])
>      feature feature2
> -        if ['defined(TEST_IF_FEATURE_2)']
> +        if IfAll([IfOption('defined(TEST_IF_FEATURE_2)')])
>  command test-command-cond-features3 None -> None
>      gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preconf=
ig=3DFalse
>      feature feature1
> -        if ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)']
> +        if IfAll([IfOption('defined(TEST_IF_COND_1)'), IfOption('defined=
(TEST_IF_COND_2)')])
>  event TEST_EVENT_FEATURES0 FeatureStruct1
>      boxed=3DFalse
>  event TEST_EVENT_FEATURES1 None
> diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi=
.py
> index 2ec328b22e..631e255fba 100755
> --- a/tests/qapi-schema/test-qapi.py
> +++ b/tests/qapi-schema/test-qapi.py
> @@ -95,7 +95,7 @@ def _print_variants(variants):
>      @staticmethod
>      def _print_if(ifcond, indent=3D4):
>          if ifcond:
> -            print('%sif %s' % (' ' * indent, ifcond.ifcond))
> +            print('%sif %s' % (' ' * indent, ifcond.pred))
> =20
>      @classmethod
>      def _print_features(cls, features, indent=3D4):


