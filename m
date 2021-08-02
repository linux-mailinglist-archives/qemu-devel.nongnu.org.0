Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0CB3DD2E6
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 11:23:35 +0200 (CEST)
Received: from localhost ([::1]:35124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAUAX-0006iS-N3
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 05:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mAU94-00061t-Ex
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 05:22:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mAU8z-0006aC-Vw
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 05:22:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627896115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nd6r+aV0fL1LBvAIX+yajbm8bOd+Vau+wWzPI6Ag04U=;
 b=b6xcHL4VeBfUO279wZ3zYNdtqBFaG7+2uXxh2Fuo5XPAdM1LlTcjWEhW/bpHRBl8C6X+iK
 a0V64/5iUy/oj+nE9d+Kut88wWgglG/Tg0VNgOO9VBDEU2cLgWEhbtMGkNFMBTLEog1qfY
 EOXY/Kl8jJQlpswGdgwSbF4bjz1tKmc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-HVrS0TpvOlu9OGGOCeF3fQ-1; Mon, 02 Aug 2021 05:21:43 -0400
X-MC-Unique: HVrS0TpvOlu9OGGOCeF3fQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B25E3639F
 for <qemu-devel@nongnu.org>; Mon,  2 Aug 2021 09:21:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B8CC60C4A;
 Mon,  2 Aug 2021 09:21:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EAFFC11380A0; Mon,  2 Aug 2021 11:21:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v6 02/11] qapi: wrap Sequence[str] in an object
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
 <20210618102507.3761128-3-marcandre.lureau@redhat.com>
Date: Mon, 02 Aug 2021 11:21:32 +0200
In-Reply-To: <20210618102507.3761128-3-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Fri, 18 Jun 2021 14:24:58 +0400")
Message-ID: <87czqwtd5v.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Eric Blake <eblake@redhat.com>, jsnow@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Except for the special casing assert in _make_implicit_object_type(),
> which needs to handle schema objects, it's a mechanical change.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  docs/sphinx/qapidoc.py         | 10 +++---
>  scripts/qapi/commands.py       |  4 +--
>  scripts/qapi/events.py         |  5 +--
>  scripts/qapi/gen.py            | 14 ++++----
>  scripts/qapi/introspect.py     | 26 +++++++-------
>  scripts/qapi/schema.py         | 66 +++++++++++++++++++++-------------
>  scripts/qapi/types.py          | 33 ++++++++---------
>  scripts/qapi/visit.py          | 23 ++++++------
>  tests/qapi-schema/test-qapi.py |  4 +--
>  9 files changed, 103 insertions(+), 82 deletions(-)
>
> diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
> index 87c67ab23f..0eac3308b2 100644
> --- a/docs/sphinx/qapidoc.py
> +++ b/docs/sphinx/qapidoc.py
> @@ -116,7 +116,7 @@ def _nodes_for_ifcond(self, ifcond, with_if=3DTrue):
>          the conditions are in literal-text and the commas are not.
>          If with_if is False, we don't return the "(If: " and ")".
>          """
> -        condlist =3D intersperse([nodes.literal('', c) for c in ifcond],
> +        condlist =3D intersperse([nodes.literal('', c) for c in ifcond.i=
fcond],

Mechanical pattern #1: ifcond becomes ifcond.ifcond to peel off the new
wrapper.  ifcond.ifcond is ugly, but almost all instances go away in
this series.  I'm okay with the remainder.

>                                 nodes.Text(', '))
>          if not with_if:
>              return condlist
> @@ -139,7 +139,7 @@ def _nodes_for_one_member(self, member):
>              term.append(nodes.literal('', member.type.doc_type()))
>          if member.optional:
>              term.append(nodes.Text(' (optional)'))
> -        if member.ifcond:
> +        if member.ifcond.ifcond:
>              term.extend(self._nodes_for_ifcond(member.ifcond))
>          return term
> =20
> @@ -154,7 +154,7 @@ def _nodes_for_variant_when(self, variants, variant):
>                  nodes.literal('', variants.tag_member.name),
>                  nodes.Text(' is '),
>                  nodes.literal('', '"%s"' % variant.name)]
> -        if variant.ifcond:
> +        if variant.ifcond.ifcond:
>              term.extend(self._nodes_for_ifcond(variant.ifcond))
>          return term
> =20
> @@ -209,7 +209,7 @@ def _nodes_for_enum_values(self, doc):
>          dlnode =3D nodes.definition_list()
>          for section in doc.args.values():
>              termtext =3D [nodes.literal('', section.member.name)]
> -            if section.member.ifcond:
> +            if section.member.ifcond.ifcond:
>                  termtext.extend(self._nodes_for_ifcond(section.member.if=
cond))
>              # TODO drop fallbacks when undocumented members are outlawed
>              if section.text:
> @@ -277,7 +277,7 @@ def _nodes_for_sections(self, doc):
>      def _nodes_for_if_section(self, ifcond):
>          """Return list of doctree nodes for the "If" section"""
>          nodelist =3D []
> -        if ifcond:
> +        if ifcond.ifcond:
>              snode =3D self._make_section('If')
>              snode +=3D nodes.paragraph(
>                  '', '', *self._nodes_for_ifcond(ifcond, with_if=3DFalse)
> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> index 0e13d51054..3654825968 100644
> --- a/scripts/qapi/commands.py
> +++ b/scripts/qapi/commands.py
> @@ -17,7 +17,6 @@
>      Dict,
>      List,
>      Optional,
> -    Sequence,
>      Set,
>  )
> =20
> @@ -31,6 +30,7 @@
>  from .schema import (
>      QAPISchema,
>      QAPISchemaFeature,
> +    QAPISchemaIfCond,
>      QAPISchemaObjectType,
>      QAPISchemaType,
>  )
> @@ -301,7 +301,7 @@ def visit_end(self) -> None:
>      def visit_command(self,
>                        name: str,
>                        info: Optional[QAPISourceInfo],
> -                      ifcond: Sequence[str],
> +                      ifcond: QAPISchemaIfCond,
>                        features: List[QAPISchemaFeature],
>                        arg_type: Optional[QAPISchemaObjectType],
>                        ret_type: Optional[QAPISchemaType],

Mechanical pattern #2: Sequence[str] becomes QAPISchemaIfCond.  Also
obvious import adjustments.

> diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
> index fee8c671e7..82475e84ec 100644
> --- a/scripts/qapi/events.py
> +++ b/scripts/qapi/events.py
> @@ -12,7 +12,7 @@
>  See the COPYING file in the top-level directory.
>  """
> =20
> -from typing import List, Optional, Sequence
> +from typing import List, Optional
> =20
>  from .common import c_enum_const, c_name, mcgen
>  from .gen import QAPISchemaModularCVisitor, build_params, ifcontext
> @@ -20,6 +20,7 @@
>      QAPISchema,
>      QAPISchemaEnumMember,
>      QAPISchemaFeature,
> +    QAPISchemaIfCond,
>      QAPISchemaObjectType,
>  )
>  from .source import QAPISourceInfo
> @@ -227,7 +228,7 @@ def visit_end(self) -> None:
>      def visit_event(self,
>                      name: str,
>                      info: Optional[QAPISourceInfo],
> -                    ifcond: Sequence[str],
> +                    ifcond: QAPISchemaIfCond,
>                      features: List[QAPISchemaFeature],
>                      arg_type: Optional[QAPISchemaObjectType],
>                      boxed: bool) -> None:
> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> index 1fa503bdbd..1c5b190276 100644
> --- a/scripts/qapi/gen.py
> +++ b/scripts/qapi/gen.py
> @@ -18,7 +18,6 @@
>      Dict,
>      Iterator,
>      Optional,
> -    Sequence,
>      Tuple,
>  )
> =20
> @@ -32,6 +31,7 @@
>      mcgen,
>  )
>  from .schema import (
> +    QAPISchemaIfCond,
>      QAPISchemaModule,
>      QAPISchemaObjectType,
>      QAPISchemaVisitor,
> @@ -85,7 +85,7 @@ def write(self, output_dir: str) -> None:
>                  fp.write(text)
> =20
> =20
> -def _wrap_ifcond(ifcond: Sequence[str], before: str, after: str) -> str:
> +def _wrap_ifcond(ifcond: QAPISchemaIfCond, before: str, after: str) -> s=
tr:
>      if before =3D=3D after:
>          return after   # suppress empty #if ... #endif
> =20
> @@ -95,9 +95,9 @@ def _wrap_ifcond(ifcond: Sequence[str], before: str, af=
ter: str) -> str:
>      if added[0] =3D=3D '\n':
>          out +=3D '\n'
>          added =3D added[1:]
> -    out +=3D gen_if(ifcond)
> +    out +=3D gen_if(ifcond.ifcond)
>      out +=3D added
> -    out +=3D gen_endif(ifcond)
> +    out +=3D gen_endif(ifcond.ifcond)
>      return out
> =20
> =20
> @@ -127,9 +127,9 @@ def build_params(arg_type: Optional[QAPISchemaObjectT=
ype],
>  class QAPIGenCCode(QAPIGen):
>      def __init__(self, fname: str):
>          super().__init__(fname)
> -        self._start_if: Optional[Tuple[Sequence[str], str, str]] =3D Non=
e
> +        self._start_if: Optional[Tuple[QAPISchemaIfCond, str, str]] =3D =
None
> =20
> -    def start_if(self, ifcond: Sequence[str]) -> None:
> +    def start_if(self, ifcond: QAPISchemaIfCond) -> None:
>          assert self._start_if is None
>          self._start_if =3D (ifcond, self._body, self._preamble)
> =20
> @@ -187,7 +187,7 @@ def _bottom(self) -> str:
> =20
> =20
>  @contextmanager
> -def ifcontext(ifcond: Sequence[str], *args: QAPIGenCCode) -> Iterator[No=
ne]:
> +def ifcontext(ifcond: QAPISchemaIfCond, *args: QAPIGenCCode) -> Iterator=
[None]:
>      """
>      A with-statement context manager that wraps with `start_if()` / `end=
_if()`.
> =20
> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> index 9a348ca2e5..77a8c33ad4 100644
> --- a/scripts/qapi/introspect.py
> +++ b/scripts/qapi/introspect.py
> @@ -15,11 +15,9 @@
>      Any,
>      Dict,
>      Generic,
> -    Iterable,
>      List,
>      Optional,
>      Sequence,
> -    Tuple,
>      TypeVar,
>      Union,
>  )
> @@ -38,6 +36,7 @@
>      QAPISchemaEntity,
>      QAPISchemaEnumMember,
>      QAPISchemaFeature,
> +    QAPISchemaIfCond,
>      QAPISchemaObjectType,
>      QAPISchemaObjectTypeMember,
>      QAPISchemaType,
> @@ -91,11 +90,11 @@ class Annotated(Generic[_ValueT]):
>      """
>      # TODO: Remove after Python 3.7 adds @dataclass:
>      # pylint: disable=3Dtoo-few-public-methods
> -    def __init__(self, value: _ValueT, ifcond: Iterable[str],
> +    def __init__(self, value: _ValueT, ifcond: QAPISchemaIfCond,

Here, we have Iterable[str] instead of Sequence[str] before the patch.
I figure use of Iterable was an attempt to be more general.  Minor
variation of pattern #2.

>                   comment: Optional[str] =3D None):
>          self.value =3D value
>          self.comment: Optional[str] =3D comment
> -        self.ifcond: Tuple[str, ...] =3D tuple(ifcond)
> +        self.ifcond =3D ifcond

Hmm.  Here we change from Tuple, not from Sequence.

I believe the next hunk has its only uses:

> =20
> =20
>  def _tree_to_qlit(obj: JSONValue,
> @@ -125,10 +124,10 @@ def indent(level: int) -> str:
>          if obj.comment:
>              ret +=3D indent(level) + f"/* {obj.comment} */\n"
>          if obj.ifcond:
> -            ret +=3D gen_if(obj.ifcond)
> +            ret +=3D gen_if(obj.ifcond.ifcond)
>          ret +=3D _tree_to_qlit(obj.value, level)
>          if obj.ifcond:
> -            ret +=3D '\n' + gen_endif(obj.ifcond)
> +            ret +=3D '\n' + gen_endif(obj.ifcond.ifcond)
>          return ret
> =20
>      ret =3D ''

You update obj.ifcond to obj.ifcond.ifcond when used as argument of
gen_if() and gen_endif().  This changes the argument from Tuple to
Sequence.  Fine, because Tuple is a special Sequence.

Digression: I don't (anymore) understand why we made self.ifcond Tuple.
John, do you remember?

You don't update obj.ifcond when used as conditional.  The code now
calls gen_if() and gen_endif() even for an empty Sequence.

I believe this can't actually happen because check_if() rejects [] with
"'if' condition [] of %s is useless".

Still, the mechanical change should update to obj.ifcond even when used
as conditional.

Are there other, possibly not so harmless uses of values that change
from Sequence to QAPISchemaIfCond the patch doesn't update?

Or asked differently: how did you find what to update?

> @@ -254,7 +253,7 @@ def _gen_features(features: Sequence[QAPISchemaFeatur=
e]
>          return [Annotated(f.name, f.ifcond) for f in features]
> =20
>      def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object],
> -                  ifcond: Sequence[str] =3D (),
> +                  ifcond: QAPISchemaIfCond =3D QAPISchemaIfCond(),

Mechanical pattern #3: wrap QAPISchemaIfCond around the Sequence.

For readability, you simplify the pure wrap QAPISchemaIfCond(()) to just
QAPISchemaIfCond(), relying on QAPISchemaIfCond.__init__()'s default.

However, it's also a subtle change from () to [].  I believe that's
okay, because we both are empty Sequences.  Might be worth a mention in
the commit message.

>                    features: Sequence[QAPISchemaFeature] =3D ()) -> None:
>          """
>          Build and append a SchemaInfo object to self._trees.
> @@ -305,7 +304,7 @@ def visit_builtin_type(self, name: str, info: Optiona=
l[QAPISourceInfo],
>          self._gen_tree(name, 'builtin', {'json-type': json_type})
> =20
>      def visit_enum_type(self, name: str, info: Optional[QAPISourceInfo],
> -                        ifcond: Sequence[str],
> +                        ifcond: QAPISchemaIfCond,
>                          features: List[QAPISchemaFeature],
>                          members: List[QAPISchemaEnumMember],
>                          prefix: Optional[str]) -> None:
> @@ -316,14 +315,14 @@ def visit_enum_type(self, name: str, info: Optional=
[QAPISourceInfo],
>          )
> =20
>      def visit_array_type(self, name: str, info: Optional[QAPISourceInfo]=
,
> -                         ifcond: Sequence[str],
> +                         ifcond: QAPISchemaIfCond,
>                           element_type: QAPISchemaType) -> None:
>          element =3D self._use_type(element_type)
>          self._gen_tree('[' + element + ']', 'array', {'element-type': el=
ement},
>                         ifcond)
> =20
>      def visit_object_type_flat(self, name: str, info: Optional[QAPISourc=
eInfo],
> -                               ifcond: Sequence[str],
> +                               ifcond: QAPISchemaIfCond,
>                                 features: List[QAPISchemaFeature],
>                                 members: List[QAPISchemaObjectTypeMember]=
,
>                                 variants: Optional[QAPISchemaVariants]) -=
> None:
> @@ -336,7 +335,7 @@ def visit_object_type_flat(self, name: str, info: Opt=
ional[QAPISourceInfo],
>          self._gen_tree(name, 'object', obj, ifcond, features)
> =20
>      def visit_alternate_type(self, name: str, info: Optional[QAPISourceI=
nfo],
> -                             ifcond: Sequence[str],
> +                             ifcond: QAPISchemaIfCond,
>                               features: List[QAPISchemaFeature],
>                               variants: QAPISchemaVariants) -> None:
>          self._gen_tree(
> @@ -348,7 +347,7 @@ def visit_alternate_type(self, name: str, info: Optio=
nal[QAPISourceInfo],
>          )
> =20
>      def visit_command(self, name: str, info: Optional[QAPISourceInfo],
> -                      ifcond: Sequence[str],
> +                      ifcond: QAPISchemaIfCond,
>                        features: List[QAPISchemaFeature],
>                        arg_type: Optional[QAPISchemaObjectType],
>                        ret_type: Optional[QAPISchemaType], gen: bool,
> @@ -367,7 +366,8 @@ def visit_command(self, name: str, info: Optional[QAP=
ISourceInfo],
>          self._gen_tree(name, 'command', obj, ifcond, features)
> =20
>      def visit_event(self, name: str, info: Optional[QAPISourceInfo],
> -                    ifcond: Sequence[str], features: List[QAPISchemaFeat=
ure],
> +                    ifcond: QAPISchemaIfCond,
> +                    features: List[QAPISchemaFeature],
>                      arg_type: Optional[QAPISchemaObjectType],
>                      boxed: bool) -> None:
>          assert self._schema is not None
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index d1d27ff7ee..5e44164bd1 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -25,6 +25,11 @@
>  from .parser import QAPISchemaParser
> =20
> =20
> +class QAPISchemaIfCond:
> +    def __init__(self, ifcond=3DNone):
> +        self.ifcond =3D ifcond or []
> +
> +
>  class QAPISchemaEntity:
>      meta: Optional[str] =3D None
> =20
> @@ -42,7 +47,7 @@ def __init__(self, name: str, info, doc, ifcond=3DNone,=
 features=3DNone):
>          # such place).
>          self.info =3D info
>          self.doc =3D doc
> -        self._ifcond =3D ifcond or []
> +        self._ifcond =3D ifcond or QAPISchemaIfCond()

This is an instance of mechanical pattern #3 where we wrap the value
without changing it.

Before the patch we use both () and [] as "no conditions".  After the
patch, we always use [], unless something passes another empty sequence
to QAPISchemaIfCond.__init__(), which I don't think is the case.
Observation, not a request.


>          self.features =3D features or []
>          self._checked =3D False
> =20
> @@ -78,6 +83,7 @@ def set_module(self, schema):
>      @property
>      def ifcond(self):
>          assert self._checked
> +        assert isinstance(self._ifcond, QAPISchemaIfCond)
>          return self._ifcond

Non-mechanical hunk.  The commit message claims to list them ("Except
for ..., it's a mechanical change"), but it doesn't.  Easy enough to
fix.

> =20
>      def is_implicit(self):
> @@ -593,7 +599,7 @@ def check(self, schema, seen):
>                      self.info,
>                      "discriminator member '%s' of %s must not be optiona=
l"
>                      % (self._tag_name, base))
> -            if self.tag_member.ifcond:
> +            if self.tag_member.ifcond.ifcond:
>                  raise QAPISemError(
>                      self.info,
>                      "discriminator member '%s' of %s must not be conditi=
onal"
> @@ -601,7 +607,7 @@ def check(self, schema, seen):
>          else:                   # simple union
>              assert isinstance(self.tag_member.type, QAPISchemaEnumType)
>              assert not self.tag_member.optional
> -            assert self.tag_member.ifcond =3D=3D []
> +            assert self.tag_member.ifcond.ifcond =3D=3D []
>          if self._tag_name:    # flat union
>              # branches that are not explicitly covered get an empty type
>              cases =3D {v.name for v in self.variants}
> @@ -646,7 +652,7 @@ def __init__(self, name, info, ifcond=3DNone):
>          assert isinstance(name, str)
>          self.name =3D name
>          self.info =3D info
> -        self.ifcond =3D ifcond or []
> +        self.ifcond =3D ifcond or QAPISchemaIfCond()
>          self.defined_in =3D None
> =20
>      def set_defined_in(self, name):
> @@ -968,11 +974,13 @@ def _def_predefineds(self):
>      def _make_features(self, features, info):
>          if features is None:
>              return []
> -        return [QAPISchemaFeature(f['name'], info, f.get('if'))
> +        return [QAPISchemaFeature(f['name'], info,
> +                                  QAPISchemaIfCond(f.get('if')))
>                  for f in features]
> =20
>      def _make_enum_members(self, values, info):
> -        return [QAPISchemaEnumMember(v['name'], info, v.get('if'))
> +        return [QAPISchemaEnumMember(v['name'], info,
> +                                     QAPISchemaIfCond(v.get('if')))
>                  for v in values]
> =20

Two more instances of pattern #3, only here we wrap values we get from
the JSON parser.  These are either None or non-empty lists.

>      def _make_implicit_enum_type(self, name, info, ifcond, values):
> @@ -1008,7 +1016,10 @@ def _make_implicit_object_type(self, name, info, i=
fcond, role, members):
           if typ:
               # The implicit object type has multiple users.  This can
               # happen only for simple unions' implicit wrapper types.
               # Its ifcond should be the disjunction of its user's
               # ifconds.  Not implemented.  Instead, we always pass the
               # wrapped type's ifcond, which is trivially the same for all
               # users.  It's also necessary for the wrapper to compile.
               # But it's not tight: the disjunction need not imply it.  We
               # may end up compiling useless wrapper types.
>              # TODO kill simple unions or implement the disjunction
> =20
>              # pylint: disable=3Dprotected-access
> -            assert (ifcond or []) =3D=3D typ._ifcond
> +            if isinstance(ifcond, QAPISchemaIfCond):
> +                assert ifcond.ifcond =3D=3D typ._ifcond.ifcond
> +            else:
> +                assert ifcond =3D=3D typ._ifcond
>          else:
>              self._def_entity(QAPISchemaObjectType(
>                  name, info, None, ifcond, None, None, members, None))

This is the non-mechanical change mentioned in the commit message.

Can you explain where the two cases come from?

> @@ -1018,7 +1029,7 @@ def _def_enum_type(self, expr, info, doc):
>          name =3D expr['enum']
>          data =3D expr['data']
>          prefix =3D expr.get('prefix')
> -        ifcond =3D expr.get('if')
> +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
>          features =3D self._make_features(expr.get('features'), info)
>          self._def_entity(QAPISchemaEnumType(
>              name, info, doc, ifcond, features,
> @@ -1036,7 +1047,8 @@ def _make_member(self, name, typ, ifcond, features,=
 info):
>                                            self._make_features(features, =
info))
> =20
>      def _make_members(self, data, info):
> -        return [self._make_member(key, value['type'], value.get('if'),
> +        return [self._make_member(key, value['type'],
> +                                  QAPISchemaIfCond(value.get('if')),
>                                    value.get('features'), info)
>                  for (key, value) in data.items()]
> =20
> @@ -1044,7 +1056,7 @@ def _def_struct_type(self, expr, info, doc):
>          name =3D expr['struct']
>          base =3D expr.get('base')
>          data =3D expr['data']
> -        ifcond =3D expr.get('if')
> +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
>          features =3D self._make_features(expr.get('features'), info)
>          self._def_entity(QAPISchemaObjectType(
>              name, info, doc, ifcond, features, base,
> @@ -1067,7 +1079,7 @@ def _def_union_type(self, expr, info, doc):
>          name =3D expr['union']
>          data =3D expr['data']
>          base =3D expr.get('base')
> -        ifcond =3D expr.get('if')
> +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
>          features =3D self._make_features(expr.get('features'), info)
>          tag_name =3D expr.get('discriminator')
>          tag_member =3D None
> @@ -1076,15 +1088,19 @@ def _def_union_type(self, expr, info, doc):
>                  name, info, ifcond,
>                  'base', self._make_members(base, info))
>          if tag_name:
> -            variants =3D [self._make_variant(key, value['type'],
> -                                           value.get('if'), info)
> -                        for (key, value) in data.items()]
> +            variants =3D [
> +                self._make_variant(key, value['type'],
> +                                   QAPISchemaIfCond(value.get('if')),
> +                                   info)
> +                for (key, value) in data.items()]
>              members =3D []
>          else:
> -            variants =3D [self._make_simple_variant(key, value['type'],
> -                                                  value.get('if'), info)
> -                        for (key, value) in data.items()]
> -            enum =3D [{'name': v.name, 'if': v.ifcond} for v in variants=
]
> +            variants =3D [
> +                self._make_simple_variant(key, value['type'],
> +                                          QAPISchemaIfCond(value.get('if=
')),
> +                                          info)
> +                for (key, value) in data.items()]
> +            enum =3D [{'name': v.name, 'if': v.ifcond.ifcond} for v in v=
ariants]
>              typ =3D self._make_implicit_enum_type(name, info, ifcond, en=
um)
>              tag_member =3D QAPISchemaObjectTypeMember('type', info, typ,=
 False)
>              members =3D [tag_member]
> @@ -1097,11 +1113,13 @@ def _def_union_type(self, expr, info, doc):
>      def _def_alternate_type(self, expr, info, doc):
>          name =3D expr['alternate']
>          data =3D expr['data']
> -        ifcond =3D expr.get('if')
> +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
>          features =3D self._make_features(expr.get('features'), info)
> -        variants =3D [self._make_variant(key, value['type'], value.get('=
if'),
> -                                       info)
> -                    for (key, value) in data.items()]
> +        variants =3D [
> +            self._make_variant(key, value['type'],
> +                               QAPISchemaIfCond(value.get('if')),
> +                               info)
> +            for (key, value) in data.items()]
>          tag_member =3D QAPISchemaObjectTypeMember('type', info, 'QType',=
 False)
>          self._def_entity(
>              QAPISchemaAlternateType(name, info, doc, ifcond, features,
> @@ -1118,7 +1136,7 @@ def _def_command(self, expr, info, doc):
>          allow_oob =3D expr.get('allow-oob', False)
>          allow_preconfig =3D expr.get('allow-preconfig', False)
>          coroutine =3D expr.get('coroutine', False)
> -        ifcond =3D expr.get('if')
> +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
>          features =3D self._make_features(expr.get('features'), info)
>          if isinstance(data, OrderedDict):
>              data =3D self._make_implicit_object_type(
> @@ -1137,7 +1155,7 @@ def _def_event(self, expr, info, doc):
>          name =3D expr['event']
>          data =3D expr.get('data')
>          boxed =3D expr.get('boxed', False)
> -        ifcond =3D expr.get('if')
> +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
>          features =3D self._make_features(expr.get('features'), info)
>          if isinstance(data, OrderedDict):
>              data =3D self._make_implicit_object_type(
> diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
> index 20d572a23a..3673cf0f49 100644
> --- a/scripts/qapi/types.py
> +++ b/scripts/qapi/types.py
> @@ -13,7 +13,7 @@
>  # See the COPYING file in the top-level directory.
>  """
> =20
> -from typing import List, Optional, Sequence
> +from typing import List, Optional
> =20
>  from .common import (
>      c_enum_const,
> @@ -27,6 +27,7 @@
>      QAPISchema,
>      QAPISchemaEnumMember,
>      QAPISchemaFeature,
> +    QAPISchemaIfCond,
>      QAPISchemaObjectType,
>      QAPISchemaObjectTypeMember,
>      QAPISchemaType,
> @@ -50,13 +51,13 @@ def gen_enum_lookup(name: str,
>  ''',
>                  c_name=3Dc_name(name))
>      for memb in members:
> -        ret +=3D gen_if(memb.ifcond)
> +        ret +=3D gen_if(memb.ifcond.ifcond)
>          index =3D c_enum_const(name, memb.name, prefix)
>          ret +=3D mcgen('''
>          [%(index)s] =3D "%(name)s",
>  ''',
>                       index=3Dindex, name=3Dmemb.name)
> -        ret +=3D gen_endif(memb.ifcond)
> +        ret +=3D gen_endif(memb.ifcond.ifcond)
> =20
>      ret +=3D mcgen('''
>      },
> @@ -80,12 +81,12 @@ def gen_enum(name: str,
>                  c_name=3Dc_name(name))
> =20
>      for memb in enum_members:
> -        ret +=3D gen_if(memb.ifcond)
> +        ret +=3D gen_if(memb.ifcond.ifcond)
>          ret +=3D mcgen('''
>      %(c_enum)s,
>  ''',
>                       c_enum=3Dc_enum_const(name, memb.name, prefix))
> -        ret +=3D gen_endif(memb.ifcond)
> +        ret +=3D gen_endif(memb.ifcond.ifcond)
> =20
>      ret +=3D mcgen('''
>  } %(c_name)s;
> @@ -125,7 +126,7 @@ def gen_array(name: str, element_type: QAPISchemaType=
) -> str:
>  def gen_struct_members(members: List[QAPISchemaObjectTypeMember]) -> str=
:
>      ret =3D ''
>      for memb in members:
> -        ret +=3D gen_if(memb.ifcond)
> +        ret +=3D gen_if(memb.ifcond.ifcond)
>          if memb.optional:
>              ret +=3D mcgen('''
>      bool has_%(c_name)s;
> @@ -135,11 +136,11 @@ def gen_struct_members(members: List[QAPISchemaObje=
ctTypeMember]) -> str:
>      %(c_type)s %(c_name)s;
>  ''',
>                       c_type=3Dmemb.type.c_type(), c_name=3Dc_name(memb.n=
ame))
> -        ret +=3D gen_endif(memb.ifcond)
> +        ret +=3D gen_endif(memb.ifcond.ifcond)
>      return ret
> =20
> =20
> -def gen_object(name: str, ifcond: Sequence[str],
> +def gen_object(name: str, ifcond: QAPISchemaIfCond,
>                 base: Optional[QAPISchemaObjectType],
>                 members: List[QAPISchemaObjectTypeMember],
>                 variants: Optional[QAPISchemaVariants]) -> str:
> @@ -158,7 +159,7 @@ def gen_object(name: str, ifcond: Sequence[str],
>      ret +=3D mcgen('''
> =20
>  ''')
> -    ret +=3D gen_if(ifcond)
> +    ret +=3D gen_if(ifcond.ifcond)
>      ret +=3D mcgen('''
>  struct %(c_name)s {
>  ''',
> @@ -192,7 +193,7 @@ def gen_object(name: str, ifcond: Sequence[str],
>      ret +=3D mcgen('''
>  };
>  ''')
> -    ret +=3D gen_endif(ifcond)
> +    ret +=3D gen_endif(ifcond.ifcond)
> =20
>      return ret
> =20
> @@ -219,13 +220,13 @@ def gen_variants(variants: QAPISchemaVariants) -> s=
tr:
>      for var in variants.variants:
>          if var.type.name =3D=3D 'q_empty':
>              continue
> -        ret +=3D gen_if(var.ifcond)
> +        ret +=3D gen_if(var.ifcond.ifcond)
>          ret +=3D mcgen('''
>          %(c_type)s %(c_name)s;
>  ''',
>                       c_type=3Dvar.type.c_unboxed_type(),
>                       c_name=3Dc_name(var.name))
> -        ret +=3D gen_endif(var.ifcond)
> +        ret +=3D gen_endif(var.ifcond.ifcond)
> =20
>      ret +=3D mcgen('''
>      } u;
> @@ -307,7 +308,7 @@ def _gen_type_cleanup(self, name: str) -> None:
>      def visit_enum_type(self,
>                          name: str,
>                          info: Optional[QAPISourceInfo],
> -                        ifcond: Sequence[str],
> +                        ifcond: QAPISchemaIfCond,
>                          features: List[QAPISchemaFeature],
>                          members: List[QAPISchemaEnumMember],
>                          prefix: Optional[str]) -> None:
> @@ -318,7 +319,7 @@ def visit_enum_type(self,
>      def visit_array_type(self,
>                           name: str,
>                           info: Optional[QAPISourceInfo],
> -                         ifcond: Sequence[str],
> +                         ifcond: QAPISchemaIfCond,
>                           element_type: QAPISchemaType) -> None:
>          with ifcontext(ifcond, self._genh, self._genc):
>              self._genh.preamble_add(gen_fwd_object_or_array(name))
> @@ -328,7 +329,7 @@ def visit_array_type(self,
>      def visit_object_type(self,
>                            name: str,
>                            info: Optional[QAPISourceInfo],
> -                          ifcond: Sequence[str],
> +                          ifcond: QAPISchemaIfCond,
>                            features: List[QAPISchemaFeature],
>                            base: Optional[QAPISchemaObjectType],
>                            members: List[QAPISchemaObjectTypeMember],
> @@ -351,7 +352,7 @@ def visit_object_type(self,
>      def visit_alternate_type(self,
>                               name: str,
>                               info: Optional[QAPISourceInfo],
> -                             ifcond: Sequence[str],
> +                             ifcond: QAPISchemaIfCond,
>                               features: List[QAPISchemaFeature],
>                               variants: QAPISchemaVariants) -> None:
>          with ifcontext(ifcond, self._genh):
> diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
> index 9e96f3c566..67721b2470 100644
> --- a/scripts/qapi/visit.py
> +++ b/scripts/qapi/visit.py
> @@ -13,7 +13,7 @@
>  See the COPYING file in the top-level directory.
>  """
> =20
> -from typing import List, Optional, Sequence
> +from typing import List, Optional
> =20
>  from .common import (
>      c_enum_const,
> @@ -29,6 +29,7 @@
>      QAPISchemaEnumMember,
>      QAPISchemaEnumType,
>      QAPISchemaFeature,
> +    QAPISchemaIfCond,
>      QAPISchemaObjectType,
>      QAPISchemaObjectTypeMember,
>      QAPISchemaType,
> @@ -78,7 +79,7 @@ def gen_visit_object_members(name: str,
> =20
>      for memb in members:
>          deprecated =3D 'deprecated' in [f.name for f in memb.features]
> -        ret +=3D gen_if(memb.ifcond)
> +        ret +=3D gen_if(memb.ifcond.ifcond)
>          if memb.optional:
>              ret +=3D mcgen('''
>      if (visit_optional(v, "%(name)s", &obj->has_%(c_name)s)) {
> @@ -111,7 +112,7 @@ def gen_visit_object_members(name: str,
>              ret +=3D mcgen('''
>      }
>  ''')
> -        ret +=3D gen_endif(memb.ifcond)
> +        ret +=3D gen_endif(memb.ifcond.ifcond)
> =20
>      if variants:
>          tag_member =3D variants.tag_member
> @@ -125,7 +126,7 @@ def gen_visit_object_members(name: str,
>          for var in variants.variants:
>              case_str =3D c_enum_const(tag_member.type.name, var.name,
>                                      tag_member.type.prefix)
> -            ret +=3D gen_if(var.ifcond)
> +            ret +=3D gen_if(var.ifcond.ifcond)
>              if var.type.name =3D=3D 'q_empty':
>                  # valid variant and nothing to do
>                  ret +=3D mcgen('''
> @@ -141,7 +142,7 @@ def gen_visit_object_members(name: str,
>                               case=3Dcase_str,
>                               c_type=3Dvar.type.c_name(), c_name=3Dc_name=
(var.name))
> =20
> -            ret +=3D gen_endif(var.ifcond)
> +            ret +=3D gen_endif(var.ifcond.ifcond)
>          ret +=3D mcgen('''
>      default:
>          abort();
> @@ -227,7 +228,7 @@ def gen_visit_alternate(name: str, variants: QAPISche=
maVariants) -> str:
>                  c_name=3Dc_name(name))
> =20
>      for var in variants.variants:
> -        ret +=3D gen_if(var.ifcond)
> +        ret +=3D gen_if(var.ifcond.ifcond)
>          ret +=3D mcgen('''
>      case %(case)s:
>  ''',
> @@ -253,7 +254,7 @@ def gen_visit_alternate(name: str, variants: QAPISche=
maVariants) -> str:
>          ret +=3D mcgen('''
>          break;
>  ''')
> -        ret +=3D gen_endif(var.ifcond)
> +        ret +=3D gen_endif(var.ifcond.ifcond)
> =20
>      ret +=3D mcgen('''
>      case QTYPE_NONE:
> @@ -352,7 +353,7 @@ def _begin_user_module(self, name: str) -> None:
>      def visit_enum_type(self,
>                          name: str,
>                          info: Optional[QAPISourceInfo],
> -                        ifcond: Sequence[str],
> +                        ifcond: QAPISchemaIfCond,
>                          features: List[QAPISchemaFeature],
>                          members: List[QAPISchemaEnumMember],
>                          prefix: Optional[str]) -> None:
> @@ -363,7 +364,7 @@ def visit_enum_type(self,
>      def visit_array_type(self,
>                           name: str,
>                           info: Optional[QAPISourceInfo],
> -                         ifcond: Sequence[str],
> +                         ifcond: QAPISchemaIfCond,
>                           element_type: QAPISchemaType) -> None:
>          with ifcontext(ifcond, self._genh, self._genc):
>              self._genh.add(gen_visit_decl(name))
> @@ -372,7 +373,7 @@ def visit_array_type(self,
>      def visit_object_type(self,
>                            name: str,
>                            info: Optional[QAPISourceInfo],
> -                          ifcond: Sequence[str],
> +                          ifcond: QAPISchemaIfCond,
>                            features: List[QAPISchemaFeature],
>                            base: Optional[QAPISchemaObjectType],
>                            members: List[QAPISchemaObjectTypeMember],
> @@ -394,7 +395,7 @@ def visit_object_type(self,
>      def visit_alternate_type(self,
>                               name: str,
>                               info: Optional[QAPISourceInfo],
> -                             ifcond: Sequence[str],
> +                             ifcond: QAPISchemaIfCond,
>                               features: List[QAPISchemaFeature],
>                               variants: QAPISchemaVariants) -> None:
>          with ifcontext(ifcond, self._genh, self._genc):
> diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi=
.py
> index f1c4deb9a5..7907b4ac3a 100755
> --- a/tests/qapi-schema/test-qapi.py
> +++ b/tests/qapi-schema/test-qapi.py
> @@ -94,8 +94,8 @@ def _print_variants(variants):
> =20
>      @staticmethod
>      def _print_if(ifcond, indent=3D4):
> -        if ifcond:
> -            print('%sif %s' % (' ' * indent, ifcond))
> +        if ifcond.ifcond:
> +            print('%sif %s' % (' ' * indent, ifcond.ifcond))
> =20
>      @classmethod
>      def _print_features(cls, features, indent=3D4):


