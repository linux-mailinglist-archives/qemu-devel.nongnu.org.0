Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B04D93A666A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 14:22:13 +0200 (CEST)
Received: from localhost ([::1]:59630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lslbY-00014Z-8e
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 08:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lsla3-00088b-VB
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 08:20:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lslZy-0007qh-Q2
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 08:20:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623673233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=95twoMzN1HZullFRBFacJW3p1AFHy3xoE97OWi0Rz1E=;
 b=G9PuUMrZnmZzP+7vYdT5zPwVnH3RZFq6g+mctpVxnMhc7xokaLd2D45rLfKtpgNvap2fGr
 PVGEjA6cipkYbrNvIwgnKvUpkIl3LwIuI/ysTEOY0l6rPOue7ZvFa0PTNXgNKB2IkjDAmr
 GA0E/0xt9cB1O8nr2uSNhve6TK9KE70=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-z5oLSAfdO8CwXuwMr8l-HQ-1; Mon, 14 Jun 2021 08:20:29 -0400
X-MC-Unique: z5oLSAfdO8CwXuwMr8l-HQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A176679EDD
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 12:20:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF569100164C;
 Mon, 14 Jun 2021 12:20:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5B4E6113865F; Mon, 14 Jun 2021 14:20:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v5 2/9] qapi: replace List[str] by QAPISchemaIfCond
References: <20210608120723.2268181-1-marcandre.lureau@redhat.com>
 <20210608120723.2268181-3-marcandre.lureau@redhat.com>
Date: Mon, 14 Jun 2021 14:20:23 +0200
In-Reply-To: <20210608120723.2268181-3-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Tue, 8 Jun 2021 16:07:16 +0400")
Message-ID: <87im2g1vug.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
> Wrap the 'if' condition in a higher-level object. Not only does this

I can see "wrap in an object".  I'm afraid don't get what makes it
"higher-level".

> provide more type safety but it also enables further refactoring without
> too much churn.

I figure by "more type safety" you mean "can't accidentally confuse some
other list of strings with a conditional", which is true, but isn't
really about *type* safety.

Maybe:

  Wrap the 'if' condition in an object.  Not only is this a bit safer,
  it also enables further refactoring without too much churn.

> The following patches will change the syntax of the schema 'if'
> conditions to be predicate expressions, and will generate code for
> different target languages (C, and Rust in another series).

Since different target languages aren't actually generated in this
series, I'd say "and will enable generating code for different target
languages, such as Rust."

>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Tested-by: John Snow <jsnow@redhat.com>
> ---
>  docs/sphinx/qapidoc.py         |  2 +-
>  scripts/qapi/commands.py       |  4 +-
>  scripts/qapi/events.py         |  5 ++-
>  scripts/qapi/gen.py            | 14 +++----
>  scripts/qapi/introspect.py     | 26 ++++++------
>  scripts/qapi/schema.py         | 74 +++++++++++++++++++++++-----------
>  scripts/qapi/types.py          | 33 +++++++--------
>  scripts/qapi/visit.py          | 23 ++++++-----
>  tests/qapi-schema/test-qapi.py |  2 +-
>  9 files changed, 106 insertions(+), 77 deletions(-)
>
> diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
> index 87c67ab23f..b737949007 100644
> --- a/docs/sphinx/qapidoc.py
> +++ b/docs/sphinx/qapidoc.py
> @@ -116,7 +116,7 @@ def _nodes_for_ifcond(self, ifcond, with_if=3DTrue):
>          the conditions are in literal-text and the commas are not.
>          If with_if is False, we don't return the "(If: " and ")".
>          """
> -        condlist =3D intersperse([nodes.literal('', c) for c in ifcond],
> +        condlist =3D intersperse([nodes.literal('', c) for c in ifcond.i=
fcond],
>                                 nodes.Text(', '))
>          if not with_if:
>              return condlist

Note for later: many hunks replace ifcond (the unwrapped Sequence[str])
by ifcond.ifcond (the wrapped one, with the wrapper peeled off).
Mechanical.

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

Note for later: many hunks replace ifcond: Sequence[str] or
Iterable[str] by ifcond: QAPISchemaIfCond.  Mechanical.

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
>                   comment: Optional[str] =3D None):
>          self.value =3D value
>          self.comment: Optional[str] =3D comment
> -        self.ifcond: Tuple[str, ...] =3D tuple(ifcond)
> +        self.ifcond =3D ifcond
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
> @@ -254,7 +253,7 @@ def _gen_features(features: Sequence[QAPISchemaFeatur=
e]
>          return [Annotated(f.name, f.ifcond) for f in features]
> =20
>      def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object],
> -                  ifcond: Sequence[str] =3D (),
> +                  ifcond: QAPISchemaIfCond =3D QAPISchemaIfCond(),

The same QAPISchemaIfCond object gets reused every time we don't pass an
@ifcond argument.  Looks a bit scary, but works, because we don't ever
mutate it.

Elsewhere, we None as default, though: QAPISchemaEntity.__init__(),
QAPISchemaMember.__init__().

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
> index d1d27ff7ee..bc357ebbfa 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -25,6 +25,20 @@
>  from .parser import QAPISchemaParser
> =20
> =20
> +class QAPISchemaIfCond:
> +    def __init__(self, ifcond=3DNone):
> +        self.ifcond =3D ifcond or []
> +
> +    # Returns true if the condition is not void
> +    def __bool__(self):
> +        return bool(self.ifcond)

I'm not sure I like this one.

In the two places where we default parameter icond=3DNone, we use

    ifcond or QAPISchemaIfCond()

to flip to the default value we actually want.  Works as intended for
None and for non-empty QAPISchemaIfCond.  For empty QAPISchemaIfCond, it
throws away the value and creates a new, equivalent one.  Works, but
kind of by accident.

This is an instance of a more general problem: when I see an
Optional[ObjectType], I expect it to be falsy if and only if it's None.
Perhaps I shouldn't.  Doesn't mean we should press __bool__() into
service for checking "is there a condition".  A boring non-dunder method
might be clearer.

I understand what you mean by "condition is void", but it sounds a bit
odd to me.  How do you like "Is a condition present?"

> +
> +    def __eq__(self, other):
> +        if not isinstance(other, QAPISchemaIfCond):
> +            return NotImplemented
> +        return self.ifcond =3D=3D other.ifcond

Stupid question: why do we need to override __eq__()?

Hmm, probably for _make_implicit_object_type().

Why raise on type mismatch?  Feels rather un-pythonic to me.

> +
> +
>  class QAPISchemaEntity:
>      meta: Optional[str] =3D None
> =20
> @@ -42,7 +56,7 @@ def __init__(self, name: str, info, doc, ifcond=3DNone,=
 features=3DNone):
>          # such place).
>          self.info =3D info
>          self.doc =3D doc
> -        self._ifcond =3D ifcond or []
> +        self._ifcond =3D ifcond or QAPISchemaIfCond()
>          self.features =3D features or []
>          self._checked =3D False
> =20
> @@ -77,7 +91,7 @@ def set_module(self, schema):
> =20
>      @property
>      def ifcond(self):
> -        assert self._checked
> +        assert self._checked and isinstance(self._ifcond, QAPISchemaIfCo=
nd)
>          return self._ifcond
> =20
>      def is_implicit(self):
> @@ -601,7 +615,7 @@ def check(self, schema, seen):
>          else:                   # simple union
>              assert isinstance(self.tag_member.type, QAPISchemaEnumType)
>              assert not self.tag_member.optional
> -            assert self.tag_member.ifcond =3D=3D []
> +            assert not self.tag_member.ifcond
>          if self._tag_name:    # flat union
>              # branches that are not explicitly covered get an empty type
>              cases =3D {v.name for v in self.variants}
> @@ -646,7 +660,7 @@ def __init__(self, name, info, ifcond=3DNone):
>          assert isinstance(name, str)
>          self.name =3D name
>          self.info =3D info
> -        self.ifcond =3D ifcond or []
> +        self.ifcond =3D ifcond or QAPISchemaIfCond()
>          self.defined_in =3D None
> =20
>      def set_defined_in(self, name):
> @@ -968,11 +982,13 @@ def _def_predefineds(self):
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

Note for later: several hunks wrap condition expressions in an object
like this.  Mechanical.

>      def _make_implicit_enum_type(self, name, info, ifcond, values):
> @@ -1008,7 +1024,7 @@ def _make_implicit_object_type(self, name, info, if=
cond, role, members):
>              # TODO kill simple unions or implement the disjunction
> =20
>              # pylint: disable=3Dprotected-access
> -            assert (ifcond or []) =3D=3D typ._ifcond
> +            assert ifcond =3D=3D typ._ifcond

I'm not sure I understand this part.  Leaving for later.

>          else:
>              self._def_entity(QAPISchemaObjectType(
>                  name, info, None, ifcond, None, None, members, None))
> @@ -1018,7 +1034,7 @@ def _def_enum_type(self, expr, info, doc):
>          name =3D expr['enum']
>          data =3D expr['data']
>          prefix =3D expr.get('prefix')
> -        ifcond =3D expr.get('if')
> +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
>          features =3D self._make_features(expr.get('features'), info)
>          self._def_entity(QAPISchemaEnumType(
>              name, info, doc, ifcond, features,
> @@ -1036,7 +1052,8 @@ def _make_member(self, name, typ, ifcond, features,=
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
> @@ -1044,7 +1061,7 @@ def _def_struct_type(self, expr, info, doc):
>          name =3D expr['struct']
>          base =3D expr.get('base')
>          data =3D expr['data']
> -        ifcond =3D expr.get('if')
> +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
>          features =3D self._make_features(expr.get('features'), info)
>          self._def_entity(QAPISchemaObjectType(
>              name, info, doc, ifcond, features, base,
> @@ -1067,7 +1084,7 @@ def _def_union_type(self, expr, info, doc):
>          name =3D expr['union']
>          data =3D expr['data']
>          base =3D expr.get('base')
> -        ifcond =3D expr.get('if')
> +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
>          features =3D self._make_features(expr.get('features'), info)
>          tag_name =3D expr.get('discriminator')
>          tag_member =3D None
> @@ -1076,15 +1093,21 @@ def _def_union_type(self, expr, info, doc):
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
> +                for (key, value) in data.items()
> +            ]

I think we more usually put the closing parenthesis like this:

               variants =3D [
                  ...
                  for (key, value) in data.items()]

More of the same below.

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
> +                for (key, value) in data.items()
> +            ]
> +            enum =3D [{'name': v.name, 'if': v.ifcond.ifcond} for v in v=
ariants]
>              typ =3D self._make_implicit_enum_type(name, info, ifcond, en=
um)
>              tag_member =3D QAPISchemaObjectTypeMember('type', info, typ,=
 False)
>              members =3D [tag_member]
> @@ -1097,11 +1120,14 @@ def _def_union_type(self, expr, info, doc):
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
> +            for (key, value) in data.items()
> +        ]
>          tag_member =3D QAPISchemaObjectTypeMember('type', info, 'QType',=
 False)
>          self._def_entity(
>              QAPISchemaAlternateType(name, info, doc, ifcond, features,
> @@ -1118,7 +1144,7 @@ def _def_command(self, expr, info, doc):
>          allow_oob =3D expr.get('allow-oob', False)
>          allow_preconfig =3D expr.get('allow-preconfig', False)
>          coroutine =3D expr.get('coroutine', False)
> -        ifcond =3D expr.get('if')
> +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
>          features =3D self._make_features(expr.get('features'), info)
>          if isinstance(data, OrderedDict):
>              data =3D self._make_implicit_object_type(
> @@ -1137,7 +1163,7 @@ def _def_event(self, expr, info, doc):
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
> index f1c4deb9a5..2ec328b22e 100755
> --- a/tests/qapi-schema/test-qapi.py
> +++ b/tests/qapi-schema/test-qapi.py
> @@ -95,7 +95,7 @@ def _print_variants(variants):
>      @staticmethod
>      def _print_if(ifcond, indent=3D4):
>          if ifcond:
> -            print('%sif %s' % (' ' * indent, ifcond))
> +            print('%sif %s' % (' ' * indent, ifcond.ifcond))
> =20
>      @classmethod
>      def _print_features(cls, features, indent=3D4):

If feel this is a bit harder to review than necessary, because you take
two steps at once:

1. Wrap Sequence[str] in an object

2. Add methods to the object to clean up the resulting mess some

Step 1. by itself should be pretty much mechanical: adjust the type
hints, create the wrapper object on write, peel it off on read.  The
result will be slightly ugly in places.

I'd expect step 2 to be much smaller, and easier to understand.  It
could perhaps be split into one patch per method, but I hope it's
reviewable just fine even without.


