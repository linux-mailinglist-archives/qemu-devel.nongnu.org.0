Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD5E3AC7C4
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 11:36:52 +0200 (CEST)
Received: from localhost ([::1]:35262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luAvj-0006iN-N3
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 05:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1luAuQ-00054x-PK
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 05:35:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1luAuG-000322-US
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 05:35:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624008919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iBEDalvdj1Kp0cnBKhNLa0/ONvMb7Kuv0m8RUKu2eeA=;
 b=FYjs/jppaAuY3H4sjfhC86zWNO7rseMjTWV2y794AXgulpaRBtyfw3iJJw2cxN6PlVuf0b
 bGB8x9r+N0Z6wLnW8aP2bdlPq+e5Qqim/uDmNwP68IHAMNt0CJmaqca/BvvQ7em8OazbPX
 ELYaJiQiEIpG+BnZn9SIbfsSNk3M8W8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-6mXgNwlhMHGcJ0LAOfsNcQ-1; Fri, 18 Jun 2021 05:35:14 -0400
X-MC-Unique: 6mXgNwlhMHGcJ0LAOfsNcQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E4AA80294F;
 Fri, 18 Jun 2021 09:35:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8168F60CC9;
 Fri, 18 Jun 2021 09:35:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0D19A113865F; Fri, 18 Jun 2021 11:35:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v5 2/9] qapi: replace List[str] by QAPISchemaIfCond
References: <20210608120723.2268181-1-marcandre.lureau@redhat.com>
 <20210608120723.2268181-3-marcandre.lureau@redhat.com>
 <87im2g1vug.fsf@dusky.pond.sub.org>
 <CAJ+F1CKiO9TMbdu1dFShv-iEED0nXwnDD7UbrK92by9T_aLdXg@mail.gmail.com>
Date: Fri, 18 Jun 2021 11:35:11 +0200
In-Reply-To: <CAJ+F1CKiO9TMbdu1dFShv-iEED0nXwnDD7UbrK92by9T_aLdXg@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Wed, 16 Jun 2021
 14:28:41 +0400")
Message-ID: <87sg1ftt0w.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> Hi
>
> On Mon, Jun 14, 2021 at 4:20 PM Markus Armbruster <armbru@redhat.com> wro=
te:
>
>> marcandre.lureau@redhat.com writes:
>>
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > Wrap the 'if' condition in a higher-level object. Not only does this
>>
>> I can see "wrap in an object".  I'm afraid don't get what makes it
>> "higher-level".
>>
>
> ok
>
>
>> > provide more type safety but it also enables further refactoring witho=
ut
>> > too much churn.
>>
>> I figure by "more type safety" you mean "can't accidentally confuse some
>> other list of strings with a conditional", which is true, but isn't
>> really about *type* safety.
>>
>> Maybe:
>>
>>   Wrap the 'if' condition in an object.  Not only is this a bit safer,
>>   it also enables further refactoring without too much churn.
>>
>>
> ok
>
>> > The following patches will change the syntax of the schema 'if'
>> > conditions to be predicate expressions, and will generate code for
>> > different target languages (C, and Rust in another series).
>>
>> Since different target languages aren't actually generated in this
>> series, I'd say "and will enable generating code for different target
>> languages, such as Rust."
>>
>
> ok
>
>
>> >
>> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> > Tested-by: John Snow <jsnow@redhat.com>
>> > ---
>> >  docs/sphinx/qapidoc.py         |  2 +-
>> >  scripts/qapi/commands.py       |  4 +-
>> >  scripts/qapi/events.py         |  5 ++-
>> >  scripts/qapi/gen.py            | 14 +++----
>> >  scripts/qapi/introspect.py     | 26 ++++++------
>> >  scripts/qapi/schema.py         | 74 +++++++++++++++++++++++----------=
-
>> >  scripts/qapi/types.py          | 33 +++++++--------
>> >  scripts/qapi/visit.py          | 23 ++++++-----
>> >  tests/qapi-schema/test-qapi.py |  2 +-
>> >  9 files changed, 106 insertions(+), 77 deletions(-)
>> >
>> > diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
>> > index 87c67ab23f..b737949007 100644
>> > --- a/docs/sphinx/qapidoc.py
>> > +++ b/docs/sphinx/qapidoc.py
>> > @@ -116,7 +116,7 @@ def _nodes_for_ifcond(self, ifcond, with_if=3DTrue=
):
>> >          the conditions are in literal-text and the commas are not.
>> >          If with_if is False, we don't return the "(If: " and ")".
>> >          """
>> > -        condlist =3D intersperse([nodes.literal('', c) for c in ifcon=
d],
>> > +        condlist =3D intersperse([nodes.literal('', c) for c in ifcon=
d.ifcond],
>> >                                 nodes.Text(', '))
>> >          if not with_if:
>> >              return condlist
>>
>> Note for later: many hunks replace ifcond (the unwrapped Sequence[str])
>> by ifcond.ifcond (the wrapped one, with the wrapper peeled off).
>> Mechanical.
>>
>> > diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
>> > index 0e13d51054..3654825968 100644
>> > --- a/scripts/qapi/commands.py
>> > +++ b/scripts/qapi/commands.py
>> > @@ -17,7 +17,6 @@
>> >      Dict,
>> >      List,
>> >      Optional,
>> > -    Sequence,
>> >      Set,
>> >  )
>> >
>> > @@ -31,6 +30,7 @@
>> >  from .schema import (
>> >      QAPISchema,
>> >      QAPISchemaFeature,
>> > +    QAPISchemaIfCond,
>> >      QAPISchemaObjectType,
>> >      QAPISchemaType,
>> >  )
>> > @@ -301,7 +301,7 @@ def visit_end(self) -> None:
>> >      def visit_command(self,
>> >                        name: str,
>> >                        info: Optional[QAPISourceInfo],
>> > -                      ifcond: Sequence[str],
>> > +                      ifcond: QAPISchemaIfCond,
>> >                        features: List[QAPISchemaFeature],
>> >                        arg_type: Optional[QAPISchemaObjectType],
>> >                        ret_type: Optional[QAPISchemaType],
>>
>> Note for later: many hunks replace ifcond: Sequence[str] or
>> Iterable[str] by ifcond: QAPISchemaIfCond.  Mechanical.
>>
>> > diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
>> > index fee8c671e7..82475e84ec 100644
>> > --- a/scripts/qapi/events.py
>> > +++ b/scripts/qapi/events.py
>> > @@ -12,7 +12,7 @@
>> >  See the COPYING file in the top-level directory.
>> >  """
>> >
>> > -from typing import List, Optional, Sequence
>> > +from typing import List, Optional
>> >
>> >  from .common import c_enum_const, c_name, mcgen
>> >  from .gen import QAPISchemaModularCVisitor, build_params, ifcontext
>> > @@ -20,6 +20,7 @@
>> >      QAPISchema,
>> >      QAPISchemaEnumMember,
>> >      QAPISchemaFeature,
>> > +    QAPISchemaIfCond,
>> >      QAPISchemaObjectType,
>> >  )
>> >  from .source import QAPISourceInfo
>> > @@ -227,7 +228,7 @@ def visit_end(self) -> None:
>> >      def visit_event(self,
>> >                      name: str,
>> >                      info: Optional[QAPISourceInfo],
>> > -                    ifcond: Sequence[str],
>> > +                    ifcond: QAPISchemaIfCond,
>> >                      features: List[QAPISchemaFeature],
>> >                      arg_type: Optional[QAPISchemaObjectType],
>> >                      boxed: bool) -> None:
>> > diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
>> > index 1fa503bdbd..1c5b190276 100644
>> > --- a/scripts/qapi/gen.py
>> > +++ b/scripts/qapi/gen.py
>> > @@ -18,7 +18,6 @@
>> >      Dict,
>> >      Iterator,
>> >      Optional,
>> > -    Sequence,
>> >      Tuple,
>> >  )
>> >
>> > @@ -32,6 +31,7 @@
>> >      mcgen,
>> >  )
>> >  from .schema import (
>> > +    QAPISchemaIfCond,
>> >      QAPISchemaModule,
>> >      QAPISchemaObjectType,
>> >      QAPISchemaVisitor,
>> > @@ -85,7 +85,7 @@ def write(self, output_dir: str) -> None:
>> >                  fp.write(text)
>> >
>> >
>> > -def _wrap_ifcond(ifcond: Sequence[str], before: str, after: str) -> s=
tr:
>> > +def _wrap_ifcond(ifcond: QAPISchemaIfCond, before: str, after: str) -=
> str:
>> >      if before =3D=3D after:
>> >          return after   # suppress empty #if ... #endif
>> >
>> > @@ -95,9 +95,9 @@ def _wrap_ifcond(ifcond: Sequence[str], before: str,=
 after: str) -> str:
>> >      if added[0] =3D=3D '\n':
>> >          out +=3D '\n'
>> >          added =3D added[1:]
>> > -    out +=3D gen_if(ifcond)
>> > +    out +=3D gen_if(ifcond.ifcond)
>> >      out +=3D added
>> > -    out +=3D gen_endif(ifcond)
>> > +    out +=3D gen_endif(ifcond.ifcond)
>> >      return out
>> >
>> >
>> > @@ -127,9 +127,9 @@ def build_params(arg_type: Optional[QAPISchemaObje=
ctType],
>> >  class QAPIGenCCode(QAPIGen):
>> >      def __init__(self, fname: str):
>> >          super().__init__(fname)
>> > -        self._start_if: Optional[Tuple[Sequence[str], str, str]] =3D =
None
>> > +        self._start_if: Optional[Tuple[QAPISchemaIfCond, str, str]] =
=3D None
>> >
>> > -    def start_if(self, ifcond: Sequence[str]) -> None:
>> > +    def start_if(self, ifcond: QAPISchemaIfCond) -> None:
>> >          assert self._start_if is None
>> >          self._start_if =3D (ifcond, self._body, self._preamble)
>> >
>> > @@ -187,7 +187,7 @@ def _bottom(self) -> str:
>> >
>> >
>> >  @contextmanager
>> > -def ifcontext(ifcond: Sequence[str], *args: QAPIGenCCode) -> Iterator=
[None]:
>> > +def ifcontext(ifcond: QAPISchemaIfCond, *args: QAPIGenCCode) -> Itera=
tor[None]:
>> >      """
>> >      A with-statement context manager that wraps with `start_if()` / `=
end_if()`.
>> >
>> > diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>> > index 9a348ca2e5..77a8c33ad4 100644
>> > --- a/scripts/qapi/introspect.py
>> > +++ b/scripts/qapi/introspect.py
>> > @@ -15,11 +15,9 @@
>> >      Any,
>> >      Dict,
>> >      Generic,
>> > -    Iterable,
>> >      List,
>> >      Optional,
>> >      Sequence,
>> > -    Tuple,
>> >      TypeVar,
>> >      Union,
>> >  )
>> > @@ -38,6 +36,7 @@
>> >      QAPISchemaEntity,
>> >      QAPISchemaEnumMember,
>> >      QAPISchemaFeature,
>> > +    QAPISchemaIfCond,
>> >      QAPISchemaObjectType,
>> >      QAPISchemaObjectTypeMember,
>> >      QAPISchemaType,
>> > @@ -91,11 +90,11 @@ class Annotated(Generic[_ValueT]):
>> >      """
>> >      # TODO: Remove after Python 3.7 adds @dataclass:
>> >      # pylint: disable=3Dtoo-few-public-methods
>> > -    def __init__(self, value: _ValueT, ifcond: Iterable[str],
>> > +    def __init__(self, value: _ValueT, ifcond: QAPISchemaIfCond,
>> >                   comment: Optional[str] =3D None):
>> >          self.value =3D value
>> >          self.comment: Optional[str] =3D comment
>> > -        self.ifcond: Tuple[str, ...] =3D tuple(ifcond)
>> > +        self.ifcond =3D ifcond
>> >
>> >
>> >  def _tree_to_qlit(obj: JSONValue,
>> > @@ -125,10 +124,10 @@ def indent(level: int) -> str:
>> >          if obj.comment:
>> >              ret +=3D indent(level) + f"/* {obj.comment} */\n"
>> >          if obj.ifcond:
>> > -            ret +=3D gen_if(obj.ifcond)
>> > +            ret +=3D gen_if(obj.ifcond.ifcond)
>> >          ret +=3D _tree_to_qlit(obj.value, level)
>> >          if obj.ifcond:
>> > -            ret +=3D '\n' + gen_endif(obj.ifcond)
>> > +            ret +=3D '\n' + gen_endif(obj.ifcond.ifcond)
>> >          return ret
>> >
>> >      ret =3D ''
>> > @@ -254,7 +253,7 @@ def _gen_features(features: Sequence[QAPISchemaFea=
ture]
>> >          return [Annotated(f.name, f.ifcond) for f in features]
>> >
>> >      def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object]=
,
>> > -                  ifcond: Sequence[str] =3D (),
>> > +                  ifcond: QAPISchemaIfCond =3D QAPISchemaIfCond(),
>>
>> The same QAPISchemaIfCond object gets reused every time we don't pass an
>> @ifcond argument.  Looks a bit scary, but works, because we don't ever
>> mutate it.
>>
>> Elsewhere, we None as default, though: QAPISchemaEntity.__init__(),
>> QAPISchemaMember.__init__().
>>
>
> A mechanical change, isn't it?

We do the same thing in two different ways.

One: default parameter ifcond to QAPISchemaIfCond(), done.

Two: default it to None, use it like ifcond or QAPISchemaIfCond().

The first way is less verbose, but looks like a Python rookie mistake at
a glance.

Can we agree on one way to do this?

>> >                    features: Sequence[QAPISchemaFeature] =3D ()) -> No=
ne:
>> >          """
>> >          Build and append a SchemaInfo object to self._trees.
>> > @@ -305,7 +304,7 @@ def visit_builtin_type(self, name: str, info: Opti=
onal[QAPISourceInfo],
>> >          self._gen_tree(name, 'builtin', {'json-type': json_type})
>> >
>> >      def visit_enum_type(self, name: str, info: Optional[QAPISourceInf=
o],
>> > -                        ifcond: Sequence[str],
>> > +                        ifcond: QAPISchemaIfCond,
>> >                          features: List[QAPISchemaFeature],
>> >                          members: List[QAPISchemaEnumMember],
>> >                          prefix: Optional[str]) -> None:
>> > @@ -316,14 +315,14 @@ def visit_enum_type(self, name: str, info: Optio=
nal[QAPISourceInfo],
>> >          )
>> >
>> >      def visit_array_type(self, name: str, info: Optional[QAPISourceIn=
fo],
>> > -                         ifcond: Sequence[str],
>> > +                         ifcond: QAPISchemaIfCond,
>> >                           element_type: QAPISchemaType) -> None:
>> >          element =3D self._use_type(element_type)
>> >          self._gen_tree('[' + element + ']', 'array', {'element-type':=
 element},
>> >                         ifcond)
>> >
>> >      def visit_object_type_flat(self, name: str, info: Optional[QAPISo=
urceInfo],
>> > -                               ifcond: Sequence[str],
>> > +                               ifcond: QAPISchemaIfCond,
>> >                                 features: List[QAPISchemaFeature],
>> >                                 members: List[QAPISchemaObjectTypeMemb=
er],
>> >                                 variants: Optional[QAPISchemaVariants]=
) -> None:
>> > @@ -336,7 +335,7 @@ def visit_object_type_flat(self, name: str, info: =
Optional[QAPISourceInfo],
>> >          self._gen_tree(name, 'object', obj, ifcond, features)
>> >
>> >      def visit_alternate_type(self, name: str, info: Optional[QAPISour=
ceInfo],
>> > -                             ifcond: Sequence[str],
>> > +                             ifcond: QAPISchemaIfCond,
>> >                               features: List[QAPISchemaFeature],
>> >                               variants: QAPISchemaVariants) -> None:
>> >          self._gen_tree(
>> > @@ -348,7 +347,7 @@ def visit_alternate_type(self, name: str, info: Op=
tional[QAPISourceInfo],
>> >          )
>> >
>> >      def visit_command(self, name: str, info: Optional[QAPISourceInfo]=
,
>> > -                      ifcond: Sequence[str],
>> > +                      ifcond: QAPISchemaIfCond,
>> >                        features: List[QAPISchemaFeature],
>> >                        arg_type: Optional[QAPISchemaObjectType],
>> >                        ret_type: Optional[QAPISchemaType], gen: bool,
>> > @@ -367,7 +366,8 @@ def visit_command(self, name: str, info: Optional[=
QAPISourceInfo],
>> >          self._gen_tree(name, 'command', obj, ifcond, features)
>> >
>> >      def visit_event(self, name: str, info: Optional[QAPISourceInfo],
>> > -                    ifcond: Sequence[str], features: List[QAPISchemaF=
eature],
>> > +                    ifcond: QAPISchemaIfCond,
>> > +                    features: List[QAPISchemaFeature],
>> >                      arg_type: Optional[QAPISchemaObjectType],
>> >                      boxed: bool) -> None:
>> >          assert self._schema is not None
>> > diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
>> > index d1d27ff7ee..bc357ebbfa 100644
>> > --- a/scripts/qapi/schema.py
>> > +++ b/scripts/qapi/schema.py
>> > @@ -25,6 +25,20 @@
>> >  from .parser import QAPISchemaParser
>> >
>> >
>> > +class QAPISchemaIfCond:
>> > +    def __init__(self, ifcond=3DNone):
>> > +        self.ifcond =3D ifcond or []
>> > +
>> > +    # Returns true if the condition is not void
>> > +    def __bool__(self):
>> > +        return bool(self.ifcond)
>>
>> I'm not sure I like this one.
>>
>> In the two places where we default parameter icond=3DNone, we use
>>
>>     ifcond or QAPISchemaIfCond()
>>
>> to flip to the default value we actually want.  Works as intended for
>> None and for non-empty QAPISchemaIfCond.  For empty QAPISchemaIfCond, it
>> throws away the value and creates a new, equivalent one.  Works, but
>> kind of by accident.
>>
>> This is an instance of a more general problem: when I see an
>> Optional[ObjectType], I expect it to be falsy if and only if it's None.
>> Perhaps I shouldn't.  Doesn't mean we should press __bool__() into
>> service for checking "is there a condition".  A boring non-dunder method
>> might be clearer.
>>
>> I understand what you mean by "condition is void", but it sounds a bit
>> odd to me.  How do you like "Is a condition present?"
>>
>
> The current code uses falsy values for ifcond (whether it is [], (), None
> whatever). Implementing __bool__() allowed to keep the existing condition
> code (ie: if ifcond).
>
> After the wrapping object is introduced, we have "if ifcond.ifcond", whic=
h
> is quite ugly.

It is.

> If you think "if ifcond" isn't clear enough (with __bool__()), we can hav=
e
> "if ifcond.is_present()". I don't have a preference.

I think I'd prefer .is_present().  I'm kind of wary of overriding
dunders when it can make innocent-looking code behave in possibly
surprising ways.  Perhaps I just haven't been steeped in the Python
sauce long enough.

John, what do you think?

>> > +
>> > +    def __eq__(self, other):
>> > +        if not isinstance(other, QAPISchemaIfCond):
>> > +            return NotImplemented
>> > +        return self.ifcond =3D=3D other.ifcond
>>
>> Stupid question: why do we need to override __eq__()?
>>
>> Hmm, probably for _make_implicit_object_type().
>>
>>
> Yes, the code works with schema objects and ifcond. I'll special case the
> assertion for now, and remove that method.
>
>
>> Why raise on type mismatch?  Feels rather un-pythonic to me.
>>
>
> What else should it do? Could probably be removed for now.

Python lets me compare arbitrary objects regardless of type.  Different
objects are unqual, unless __eq__ makes them equal.

You want to make different QAPISchemaIfCond wrapping the equal .ifcond
equal.  Makes sense to me.  But I don't see a need for also changing the
case "@other is not a QAPISchemaIfCond" from False to NotImplemented.

>> > +
>> > +
>> >  class QAPISchemaEntity:
>> >      meta: Optional[str] =3D None
>> >
>> > @@ -42,7 +56,7 @@ def __init__(self, name: str, info, doc, ifcond=3DNo=
ne, features=3DNone):
>> >          # such place).
>> >          self.info =3D info
>> >          self.doc =3D doc
>> > -        self._ifcond =3D ifcond or []
>> > +        self._ifcond =3D ifcond or QAPISchemaIfCond()
>> >          self.features =3D features or []
>> >          self._checked =3D False
>> >
>> > @@ -77,7 +91,7 @@ def set_module(self, schema):
>> >
>> >      @property
>> >      def ifcond(self):
>> > -        assert self._checked
>> > +        assert self._checked and isinstance(self._ifcond, QAPISchemaI=
fCond)
>> >          return self._ifcond
>> >
>> >      def is_implicit(self):
>> > @@ -601,7 +615,7 @@ def check(self, schema, seen):
>> >          else:                   # simple union
>> >              assert isinstance(self.tag_member.type, QAPISchemaEnumTyp=
e)
>> >              assert not self.tag_member.optional
>> > -            assert self.tag_member.ifcond =3D=3D []
>> > +            assert not self.tag_member.ifcond
>> >          if self._tag_name:    # flat union
>> >              # branches that are not explicitly covered get an empty t=
ype
>> >              cases =3D {v.name for v in self.variants}
>> > @@ -646,7 +660,7 @@ def __init__(self, name, info, ifcond=3DNone):
>> >          assert isinstance(name, str)
>> >          self.name =3D name
>> >          self.info =3D info
>> > -        self.ifcond =3D ifcond or []
>> > +        self.ifcond =3D ifcond or QAPISchemaIfCond()
>> >          self.defined_in =3D None
>> >
>> >      def set_defined_in(self, name):
>> > @@ -968,11 +982,13 @@ def _def_predefineds(self):
>> >      def _make_features(self, features, info):
>> >          if features is None:
>> >              return []
>> > -        return [QAPISchemaFeature(f['name'], info, f.get('if'))
>> > +        return [QAPISchemaFeature(f['name'], info,
>> > +                                  QAPISchemaIfCond(f.get('if')))
>> >                  for f in features]
>> >
>> >      def _make_enum_members(self, values, info):
>> > -        return [QAPISchemaEnumMember(v['name'], info, v.get('if'))
>> > +        return [QAPISchemaEnumMember(v['name'], info,
>> > +                                     QAPISchemaIfCond(v.get('if')))
>> >                  for v in values]
>> >
>>
>> Note for later: several hunks wrap condition expressions in an object
>> like this.  Mechanical.
>>
>> >      def _make_implicit_enum_type(self, name, info, ifcond, values):
>> > @@ -1008,7 +1024,7 @@ def _make_implicit_object_type(self, name, info,=
 ifcond, role, members):
>> >              # TODO kill simple unions or implement the disjunction
>> >
>> >              # pylint: disable=3Dprotected-access
>> > -            assert (ifcond or []) =3D=3D typ._ifcond
>> > +            assert ifcond =3D=3D typ._ifcond
>>
>> I'm not sure I understand this part.  Leaving for later.
>>
>> >          else:
>> >              self._def_entity(QAPISchemaObjectType(
>> >                  name, info, None, ifcond, None, None, members, None))
>> > @@ -1018,7 +1034,7 @@ def _def_enum_type(self, expr, info, doc):
>> >          name =3D expr['enum']
>> >          data =3D expr['data']
>> >          prefix =3D expr.get('prefix')
>> > -        ifcond =3D expr.get('if')
>> > +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
>> >          features =3D self._make_features(expr.get('features'), info)
>> >          self._def_entity(QAPISchemaEnumType(
>> >              name, info, doc, ifcond, features,
>> > @@ -1036,7 +1052,8 @@ def _make_member(self, name, typ, ifcond, featur=
es, info):
>> >                                            self._make_features(feature=
s, info))
>> >
>> >      def _make_members(self, data, info):
>> > -        return [self._make_member(key, value['type'], value.get('if')=
,
>> > +        return [self._make_member(key, value['type'],
>> > +                                  QAPISchemaIfCond(value.get('if')),
>> >                                    value.get('features'), info)
>> >                  for (key, value) in data.items()]
>> >
>> > @@ -1044,7 +1061,7 @@ def _def_struct_type(self, expr, info, doc):
>> >          name =3D expr['struct']
>> >          base =3D expr.get('base')
>> >          data =3D expr['data']
>> > -        ifcond =3D expr.get('if')
>> > +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
>> >          features =3D self._make_features(expr.get('features'), info)
>> >          self._def_entity(QAPISchemaObjectType(
>> >              name, info, doc, ifcond, features, base,
>> > @@ -1067,7 +1084,7 @@ def _def_union_type(self, expr, info, doc):
>> >          name =3D expr['union']
>> >          data =3D expr['data']
>> >          base =3D expr.get('base')
>> > -        ifcond =3D expr.get('if')
>> > +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
>> >          features =3D self._make_features(expr.get('features'), info)
>> >          tag_name =3D expr.get('discriminator')
>> >          tag_member =3D None
>> > @@ -1076,15 +1093,21 @@ def _def_union_type(self, expr, info, doc):
>> >                  name, info, ifcond,
>> >                  'base', self._make_members(base, info))
>> >          if tag_name:
>> > -            variants =3D [self._make_variant(key, value['type'],
>> > -                                           value.get('if'), info)
>> > -                        for (key, value) in data.items()]
>> > +            variants =3D [
>> > +                self._make_variant(key, value['type'],
>> > +                                   QAPISchemaIfCond(value.get('if')),
>> > +                                   info)
>> > +                for (key, value) in data.items()
>> > +            ]
>>
>> I think we more usually put the closing parenthesis like this:
>>
>>                variants =3D [
>>                   ...
>>                   for (key, value) in data.items()]
>>
>> More of the same below.
>>
>
> Works for me.
>
>
>> >              members =3D []
>> >          else:
>> > -            variants =3D [self._make_simple_variant(key, value['type'=
],
>> > -                                                  value.get('if'), in=
fo)
>> > -                        for (key, value) in data.items()]
>> > -            enum =3D [{'name': v.name, 'if': v.ifcond} for v in varia=
nts]
>> > +            variants =3D [
>> > +                self._make_simple_variant(key, value['type'],
>> > +                                          QAPISchemaIfCond(value.get(=
'if')),
>> > +                                          info)
>> > +                for (key, value) in data.items()
>> > +            ]
>> > +            enum =3D [{'name': v.name, 'if': v.ifcond.ifcond} for v i=
n variants]
>> >              typ =3D self._make_implicit_enum_type(name, info, ifcond,=
 enum)
>> >              tag_member =3D QAPISchemaObjectTypeMember('type', info, t=
yp, False)
>> >              members =3D [tag_member]
>> > @@ -1097,11 +1120,14 @@ def _def_union_type(self, expr, info, doc):
>> >      def _def_alternate_type(self, expr, info, doc):
>> >          name =3D expr['alternate']
>> >          data =3D expr['data']
>> > -        ifcond =3D expr.get('if')
>> > +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
>> >          features =3D self._make_features(expr.get('features'), info)
>> > -        variants =3D [self._make_variant(key, value['type'], value.ge=
t('if'),
>> > -                                       info)
>> > -                    for (key, value) in data.items()]
>> > +        variants =3D [
>> > +            self._make_variant(key, value['type'],
>> > +                               QAPISchemaIfCond(value.get('if')),
>> > +                               info)
>> > +            for (key, value) in data.items()
>> > +        ]
>> >          tag_member =3D QAPISchemaObjectTypeMember('type', info, 'QTyp=
e', False)
>> >          self._def_entity(
>> >              QAPISchemaAlternateType(name, info, doc, ifcond, features=
,
>> > @@ -1118,7 +1144,7 @@ def _def_command(self, expr, info, doc):
>> >          allow_oob =3D expr.get('allow-oob', False)
>> >          allow_preconfig =3D expr.get('allow-preconfig', False)
>> >          coroutine =3D expr.get('coroutine', False)
>> > -        ifcond =3D expr.get('if')
>> > +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
>> >          features =3D self._make_features(expr.get('features'), info)
>> >          if isinstance(data, OrderedDict):
>> >              data =3D self._make_implicit_object_type(
>> > @@ -1137,7 +1163,7 @@ def _def_event(self, expr, info, doc):
>> >          name =3D expr['event']
>> >          data =3D expr.get('data')
>> >          boxed =3D expr.get('boxed', False)
>> > -        ifcond =3D expr.get('if')
>> > +        ifcond =3D QAPISchemaIfCond(expr.get('if'))
>> >          features =3D self._make_features(expr.get('features'), info)
>> >          if isinstance(data, OrderedDict):
>> >              data =3D self._make_implicit_object_type(
>> > diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
>> > index 20d572a23a..3673cf0f49 100644
>> > --- a/scripts/qapi/types.py
>> > +++ b/scripts/qapi/types.py
>> > @@ -13,7 +13,7 @@
>> >  # See the COPYING file in the top-level directory.
>> >  """
>> >
>> > -from typing import List, Optional, Sequence
>> > +from typing import List, Optional
>> >
>> >  from .common import (
>> >      c_enum_const,
>> > @@ -27,6 +27,7 @@
>> >      QAPISchema,
>> >      QAPISchemaEnumMember,
>> >      QAPISchemaFeature,
>> > +    QAPISchemaIfCond,
>> >      QAPISchemaObjectType,
>> >      QAPISchemaObjectTypeMember,
>> >      QAPISchemaType,
>> > @@ -50,13 +51,13 @@ def gen_enum_lookup(name: str,
>> >  ''',
>> >                  c_name=3Dc_name(name))
>> >      for memb in members:
>> > -        ret +=3D gen_if(memb.ifcond)
>> > +        ret +=3D gen_if(memb.ifcond.ifcond)
>> >          index =3D c_enum_const(name, memb.name, prefix)
>> >          ret +=3D mcgen('''
>> >          [%(index)s] =3D "%(name)s",
>> >  ''',
>> >                       index=3Dindex, name=3Dmemb.name)
>> > -        ret +=3D gen_endif(memb.ifcond)
>> > +        ret +=3D gen_endif(memb.ifcond.ifcond)
>> >
>> >      ret +=3D mcgen('''
>> >      },
>> > @@ -80,12 +81,12 @@ def gen_enum(name: str,
>> >                  c_name=3Dc_name(name))
>> >
>> >      for memb in enum_members:
>> > -        ret +=3D gen_if(memb.ifcond)
>> > +        ret +=3D gen_if(memb.ifcond.ifcond)
>> >          ret +=3D mcgen('''
>> >      %(c_enum)s,
>> >  ''',
>> >                       c_enum=3Dc_enum_const(name, memb.name, prefix))
>> > -        ret +=3D gen_endif(memb.ifcond)
>> > +        ret +=3D gen_endif(memb.ifcond.ifcond)
>> >
>> >      ret +=3D mcgen('''
>> >  } %(c_name)s;
>> > @@ -125,7 +126,7 @@ def gen_array(name: str, element_type: QAPISchemaT=
ype) -> str:
>> >  def gen_struct_members(members: List[QAPISchemaObjectTypeMember]) -> =
str:
>> >      ret =3D ''
>> >      for memb in members:
>> > -        ret +=3D gen_if(memb.ifcond)
>> > +        ret +=3D gen_if(memb.ifcond.ifcond)
>> >          if memb.optional:
>> >              ret +=3D mcgen('''
>> >      bool has_%(c_name)s;
>> > @@ -135,11 +136,11 @@ def gen_struct_members(members: List[QAPISchemaO=
bjectTypeMember]) -> str:
>> >      %(c_type)s %(c_name)s;
>> >  ''',
>> >                       c_type=3Dmemb.type.c_type(), c_name=3Dc_name(mem=
b.name))
>> > -        ret +=3D gen_endif(memb.ifcond)
>> > +        ret +=3D gen_endif(memb.ifcond.ifcond)
>> >      return ret
>> >
>> >
>> > -def gen_object(name: str, ifcond: Sequence[str],
>> > +def gen_object(name: str, ifcond: QAPISchemaIfCond,
>> >                 base: Optional[QAPISchemaObjectType],
>> >                 members: List[QAPISchemaObjectTypeMember],
>> >                 variants: Optional[QAPISchemaVariants]) -> str:
>> > @@ -158,7 +159,7 @@ def gen_object(name: str, ifcond: Sequence[str],
>> >      ret +=3D mcgen('''
>> >
>> >  ''')
>> > -    ret +=3D gen_if(ifcond)
>> > +    ret +=3D gen_if(ifcond.ifcond)
>> >      ret +=3D mcgen('''
>> >  struct %(c_name)s {
>> >  ''',
>> > @@ -192,7 +193,7 @@ def gen_object(name: str, ifcond: Sequence[str],
>> >      ret +=3D mcgen('''
>> >  };
>> >  ''')
>> > -    ret +=3D gen_endif(ifcond)
>> > +    ret +=3D gen_endif(ifcond.ifcond)
>> >
>> >      return ret
>> >
>> > @@ -219,13 +220,13 @@ def gen_variants(variants: QAPISchemaVariants) -=
> str:
>> >      for var in variants.variants:
>> >          if var.type.name =3D=3D 'q_empty':
>> >              continue
>> > -        ret +=3D gen_if(var.ifcond)
>> > +        ret +=3D gen_if(var.ifcond.ifcond)
>> >          ret +=3D mcgen('''
>> >          %(c_type)s %(c_name)s;
>> >  ''',
>> >                       c_type=3Dvar.type.c_unboxed_type(),
>> >                       c_name=3Dc_name(var.name))
>> > -        ret +=3D gen_endif(var.ifcond)
>> > +        ret +=3D gen_endif(var.ifcond.ifcond)
>> >
>> >      ret +=3D mcgen('''
>> >      } u;
>> > @@ -307,7 +308,7 @@ def _gen_type_cleanup(self, name: str) -> None:
>> >      def visit_enum_type(self,
>> >                          name: str,
>> >                          info: Optional[QAPISourceInfo],
>> > -                        ifcond: Sequence[str],
>> > +                        ifcond: QAPISchemaIfCond,
>> >                          features: List[QAPISchemaFeature],
>> >                          members: List[QAPISchemaEnumMember],
>> >                          prefix: Optional[str]) -> None:
>> > @@ -318,7 +319,7 @@ def visit_enum_type(self,
>> >      def visit_array_type(self,
>> >                           name: str,
>> >                           info: Optional[QAPISourceInfo],
>> > -                         ifcond: Sequence[str],
>> > +                         ifcond: QAPISchemaIfCond,
>> >                           element_type: QAPISchemaType) -> None:
>> >          with ifcontext(ifcond, self._genh, self._genc):
>> >              self._genh.preamble_add(gen_fwd_object_or_array(name))
>> > @@ -328,7 +329,7 @@ def visit_array_type(self,
>> >      def visit_object_type(self,
>> >                            name: str,
>> >                            info: Optional[QAPISourceInfo],
>> > -                          ifcond: Sequence[str],
>> > +                          ifcond: QAPISchemaIfCond,
>> >                            features: List[QAPISchemaFeature],
>> >                            base: Optional[QAPISchemaObjectType],
>> >                            members: List[QAPISchemaObjectTypeMember],
>> > @@ -351,7 +352,7 @@ def visit_object_type(self,
>> >      def visit_alternate_type(self,
>> >                               name: str,
>> >                               info: Optional[QAPISourceInfo],
>> > -                             ifcond: Sequence[str],
>> > +                             ifcond: QAPISchemaIfCond,
>> >                               features: List[QAPISchemaFeature],
>> >                               variants: QAPISchemaVariants) -> None:
>> >          with ifcontext(ifcond, self._genh):
>> > diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
>> > index 9e96f3c566..67721b2470 100644
>> > --- a/scripts/qapi/visit.py
>> > +++ b/scripts/qapi/visit.py
>> > @@ -13,7 +13,7 @@
>> >  See the COPYING file in the top-level directory.
>> >  """
>> >
>> > -from typing import List, Optional, Sequence
>> > +from typing import List, Optional
>> >
>> >  from .common import (
>> >      c_enum_const,
>> > @@ -29,6 +29,7 @@
>> >      QAPISchemaEnumMember,
>> >      QAPISchemaEnumType,
>> >      QAPISchemaFeature,
>> > +    QAPISchemaIfCond,
>> >      QAPISchemaObjectType,
>> >      QAPISchemaObjectTypeMember,
>> >      QAPISchemaType,
>> > @@ -78,7 +79,7 @@ def gen_visit_object_members(name: str,
>> >
>> >      for memb in members:
>> >          deprecated =3D 'deprecated' in [f.name for f in memb.features=
]
>> > -        ret +=3D gen_if(memb.ifcond)
>> > +        ret +=3D gen_if(memb.ifcond.ifcond)
>> >          if memb.optional:
>> >              ret +=3D mcgen('''
>> >      if (visit_optional(v, "%(name)s", &obj->has_%(c_name)s)) {
>> > @@ -111,7 +112,7 @@ def gen_visit_object_members(name: str,
>> >              ret +=3D mcgen('''
>> >      }
>> >  ''')
>> > -        ret +=3D gen_endif(memb.ifcond)
>> > +        ret +=3D gen_endif(memb.ifcond.ifcond)
>> >
>> >      if variants:
>> >          tag_member =3D variants.tag_member
>> > @@ -125,7 +126,7 @@ def gen_visit_object_members(name: str,
>> >          for var in variants.variants:
>> >              case_str =3D c_enum_const(tag_member.type.name, var.name,
>> >                                      tag_member.type.prefix)
>> > -            ret +=3D gen_if(var.ifcond)
>> > +            ret +=3D gen_if(var.ifcond.ifcond)
>> >              if var.type.name =3D=3D 'q_empty':
>> >                  # valid variant and nothing to do
>> >                  ret +=3D mcgen('''
>> > @@ -141,7 +142,7 @@ def gen_visit_object_members(name: str,
>> >                               case=3Dcase_str,
>> >                               c_type=3Dvar.type.c_name(), c_name=3Dc_n=
ame(var.name))
>> >
>> > -            ret +=3D gen_endif(var.ifcond)
>> > +            ret +=3D gen_endif(var.ifcond.ifcond)
>> >          ret +=3D mcgen('''
>> >      default:
>> >          abort();
>> > @@ -227,7 +228,7 @@ def gen_visit_alternate(name: str, variants: QAPIS=
chemaVariants) -> str:
>> >                  c_name=3Dc_name(name))
>> >
>> >      for var in variants.variants:
>> > -        ret +=3D gen_if(var.ifcond)
>> > +        ret +=3D gen_if(var.ifcond.ifcond)
>> >          ret +=3D mcgen('''
>> >      case %(case)s:
>> >  ''',
>> > @@ -253,7 +254,7 @@ def gen_visit_alternate(name: str, variants: QAPIS=
chemaVariants) -> str:
>> >          ret +=3D mcgen('''
>> >          break;
>> >  ''')
>> > -        ret +=3D gen_endif(var.ifcond)
>> > +        ret +=3D gen_endif(var.ifcond.ifcond)
>> >
>> >      ret +=3D mcgen('''
>> >      case QTYPE_NONE:
>> > @@ -352,7 +353,7 @@ def _begin_user_module(self, name: str) -> None:
>> >      def visit_enum_type(self,
>> >                          name: str,
>> >                          info: Optional[QAPISourceInfo],
>> > -                        ifcond: Sequence[str],
>> > +                        ifcond: QAPISchemaIfCond,
>> >                          features: List[QAPISchemaFeature],
>> >                          members: List[QAPISchemaEnumMember],
>> >                          prefix: Optional[str]) -> None:
>> > @@ -363,7 +364,7 @@ def visit_enum_type(self,
>> >      def visit_array_type(self,
>> >                           name: str,
>> >                           info: Optional[QAPISourceInfo],
>> > -                         ifcond: Sequence[str],
>> > +                         ifcond: QAPISchemaIfCond,
>> >                           element_type: QAPISchemaType) -> None:
>> >          with ifcontext(ifcond, self._genh, self._genc):
>> >              self._genh.add(gen_visit_decl(name))
>> > @@ -372,7 +373,7 @@ def visit_array_type(self,
>> >      def visit_object_type(self,
>> >                            name: str,
>> >                            info: Optional[QAPISourceInfo],
>> > -                          ifcond: Sequence[str],
>> > +                          ifcond: QAPISchemaIfCond,
>> >                            features: List[QAPISchemaFeature],
>> >                            base: Optional[QAPISchemaObjectType],
>> >                            members: List[QAPISchemaObjectTypeMember],
>> > @@ -394,7 +395,7 @@ def visit_object_type(self,
>> >      def visit_alternate_type(self,
>> >                               name: str,
>> >                               info: Optional[QAPISourceInfo],
>> > -                             ifcond: Sequence[str],
>> > +                             ifcond: QAPISchemaIfCond,
>> >                               features: List[QAPISchemaFeature],
>> >                               variants: QAPISchemaVariants) -> None:
>> >          with ifcontext(ifcond, self._genh, self._genc):
>> > diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-q=
api.py
>> > index f1c4deb9a5..2ec328b22e 100755
>> > --- a/tests/qapi-schema/test-qapi.py
>> > +++ b/tests/qapi-schema/test-qapi.py
>> > @@ -95,7 +95,7 @@ def _print_variants(variants):
>> >      @staticmethod
>> >      def _print_if(ifcond, indent=3D4):
>> >          if ifcond:
>> > -            print('%sif %s' % (' ' * indent, ifcond))
>> > +            print('%sif %s' % (' ' * indent, ifcond.ifcond))
>> >
>> >      @classmethod
>> >      def _print_features(cls, features, indent=3D4):
>>
>> If feel this is a bit harder to review than necessary, because you take
>> two steps at once:
>>
>> 1. Wrap Sequence[str] in an object
>>
>> 2. Add methods to the object to clean up the resulting mess some
>>
>> Step 1. by itself should be pretty much mechanical: adjust the type
>> hints, create the wrapper object on write, peel it off on read.  The
>> result will be slightly ugly in places.
>>
>> I'd expect step 2 to be much smaller, and easier to understand.  It
>> could perhaps be split into one patch per method, but I hope it's
>> reviewable just fine even without.

Hope you didn't miss this remark.


