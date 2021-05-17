Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCCB383A88
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:51:18 +0200 (CEST)
Received: from localhost ([::1]:44568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligSb-000088-8z
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lig8K-0004Ac-Ax
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:30:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lig8H-0005zA-Do
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:30:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621269016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=myqScNGfVFDcjyCEpMOy9YF5FZOolezQYKocSoKEcfo=;
 b=Y4S/dswTGAbunW2BW6MZrC+2Fb6BuGWkIPjqYJMesfKezkguaqa9Lbl7VLekQBUGR2fOYu
 iynIFf2SkqzSDPcCU3ZhYPVk8cxGmjnBUx1LCslhnqVGfECJ/7J1r03CJmA4w6e7fDKI4q
 /8XRMm+itg11HLMoR5imCxsG4SvFVxc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-2ZvXvUavO4O-uuP38n9ecw-1; Mon, 17 May 2021 12:30:14 -0400
X-MC-Unique: 2ZvXvUavO4O-uuP38n9ecw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F32CC9F7CA
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 16:30:12 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67C00179B3;
 Mon, 17 May 2021 16:30:07 +0000 (UTC)
Subject: Re: [PATCH v3 1/9] qapi: replace List[str] by QAPISchemaIfCond
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
 <20210429134032.1125111-2-marcandre.lureau@redhat.com>
 <e1782f26-8ceb-f79e-19d9-3714ad79aa0f@redhat.com>
 <CAMxuvaxZDZF_=CY6h41QktAqAwHZvGwqvpTb3hfTCgxE73H3eg@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <676860f9-efa7-6e17-f356-c1ca512ab9fc@redhat.com>
Date: Mon, 17 May 2021 12:30:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAMxuvaxZDZF_=CY6h41QktAqAwHZvGwqvpTb3hfTCgxE73H3eg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, "Armbruster,
 Markus" <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 7:17 AM, Marc-André Lureau wrote:
> Hi
> 
> On Thu, May 13, 2021 at 12:53 AM John Snow <jsnow@redhat.com 
> <mailto:jsnow@redhat.com>> wrote:
> 
>     On 4/29/21 9:40 AM, marcandre.lureau@redhat.com
>     <mailto:marcandre.lureau@redhat.com> wrote:
>      > From: Marc-André Lureau <marcandre.lureau@redhat.com
>     <mailto:marcandre.lureau@redhat.com>>
>      >
>      > Wrap the 'if' condition in a higher-level object. Not only this
>     allows
>      > more type safety but also further refactoring without too much churn.
>      >
> 
>     Would have done it myself if I had gotten to it first. I like having a
>     named type for this, it matches the other properties we have.
> 
>      > The following patches will change the syntax of the schema 'if'
>      > conditions to be predicate expressions, and will generate code for
>      > different target languages (C, and Rust in another series).
>      >
>      > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com
>     <mailto:marcandre.lureau@redhat.com>>
>      > ---
>      >   docs/sphinx/qapidoc.py     |  2 +-
>      >   scripts/qapi/commands.py   |  4 +-
>      >   scripts/qapi/events.py     |  5 ++-
>      >   scripts/qapi/gen.py        | 14 +++----
>      >   scripts/qapi/introspect.py | 26 ++++++-------
>      >   scripts/qapi/schema.py     | 78
>     +++++++++++++++++++++++++++-----------
>      >   scripts/qapi/types.py      | 33 ++++++++--------
>      >   scripts/qapi/visit.py      | 23 +++++------
>      >   8 files changed, 110 insertions(+), 75 deletions(-)
>      >
>      > diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
>      > index 87c67ab23f..b737949007 100644
>      > --- a/docs/sphinx/qapidoc.py
>      > +++ b/docs/sphinx/qapidoc.py
>      > @@ -116,7 +116,7 @@ def _nodes_for_ifcond(self, ifcond,
>     with_if=True):
>      >           the conditions are in literal-text and the commas are not.
>      >           If with_if is False, we don't return the "(If: " and ")".
>      >           """
>      > -        condlist = intersperse([nodes.literal('', c) for c in
>     ifcond],
>      > +        condlist = intersperse([nodes.literal('', c) for c in
>     ifcond.ifcond],
>      >                                  nodes.Text(', '))
>      >           if not with_if:
>      >               return condlist
>      > diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
>      > index 0e13d51054..3654825968 100644
>      > --- a/scripts/qapi/commands.py
>      > +++ b/scripts/qapi/commands.py
>      > @@ -17,7 +17,6 @@
>      >       Dict,
>      >       List,
>      >       Optional,
>      > -    Sequence,
>      >       Set,
>      >   )
>      >
>      > @@ -31,6 +30,7 @@
>      >   from .schema import (
>      >       QAPISchema,
>      >       QAPISchemaFeature,
>      > +    QAPISchemaIfCond,
>      >       QAPISchemaObjectType,
>      >       QAPISchemaType,
>      >   )
>      > @@ -301,7 +301,7 @@ def visit_end(self) -> None:
>      >       def visit_command(self,
>      >                         name: str,
>      >                         info: Optional[QAPISourceInfo],
>      > -                      ifcond: Sequence[str],
>      > +                      ifcond: QAPISchemaIfCond,
>      >                         features: List[QAPISchemaFeature],
>      >                         arg_type: Optional[QAPISchemaObjectType],
>      >                         ret_type: Optional[QAPISchemaType],
>      > diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
>      > index fee8c671e7..82475e84ec 100644
>      > --- a/scripts/qapi/events.py
>      > +++ b/scripts/qapi/events.py
>      > @@ -12,7 +12,7 @@
>      >   See the COPYING file in the top-level directory.
>      >   """
>      >
>      > -from typing import List, Optional, Sequence
>      > +from typing import List, Optional
>      >
>      >   from .common import c_enum_const, c_name, mcgen
>      >   from .gen import QAPISchemaModularCVisitor, build_params, ifcontext
>      > @@ -20,6 +20,7 @@
>      >       QAPISchema,
>      >       QAPISchemaEnumMember,
>      >       QAPISchemaFeature,
>      > +    QAPISchemaIfCond,
>      >       QAPISchemaObjectType,
>      >   )
>      >   from .source import QAPISourceInfo
>      > @@ -227,7 +228,7 @@ def visit_end(self) -> None:
>      >       def visit_event(self,
>      >                       name: str,
>      >                       info: Optional[QAPISourceInfo],
>      > -                    ifcond: Sequence[str],
>      > +                    ifcond: QAPISchemaIfCond,
>      >                       features: List[QAPISchemaFeature],
>      >                       arg_type: Optional[QAPISchemaObjectType],
>      >                       boxed: bool) -> None:
>      > diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
>      > index 1fa503bdbd..1c5b190276 100644
>      > --- a/scripts/qapi/gen.py
>      > +++ b/scripts/qapi/gen.py
>      > @@ -18,7 +18,6 @@
>      >       Dict,
>      >       Iterator,
>      >       Optional,
>      > -    Sequence,
>      >       Tuple,
>      >   )
>      >
>      > @@ -32,6 +31,7 @@
>      >       mcgen,
>      >   )
>      >   from .schema import (
>      > +    QAPISchemaIfCond,
>      >       QAPISchemaModule,
>      >       QAPISchemaObjectType,
>      >       QAPISchemaVisitor,
>      > @@ -85,7 +85,7 @@ def write(self, output_dir: str) -> None:
>      >                   fp.write(text)
>      >
>      >
>      > -def _wrap_ifcond(ifcond: Sequence[str], before: str, after: str)
>     -> str:
>      > +def _wrap_ifcond(ifcond: QAPISchemaIfCond, before: str, after:
>     str) -> str:
>      >       if before == after:
>      >           return after   # suppress empty #if ... #endif
>      >
>      > @@ -95,9 +95,9 @@ def _wrap_ifcond(ifcond: Sequence[str], before:
>     str, after: str) -> str:
>      >       if added[0] == '\n':
>      >           out += '\n'
>      >           added = added[1:]
>      > -    out += gen_if(ifcond)
>      > +    out += gen_if(ifcond.ifcond)
>      >       out += added
>      > -    out += gen_endif(ifcond)
>      > +    out += gen_endif(ifcond.ifcond)
>      >       return out
>      >
>      >
>      > @@ -127,9 +127,9 @@ def build_params(arg_type:
>     Optional[QAPISchemaObjectType],
>      >   class QAPIGenCCode(QAPIGen):
>      >       def __init__(self, fname: str):
>      >           super().__init__(fname)
>      > -        self._start_if: Optional[Tuple[Sequence[str], str, str]]
>     = None
>      > +        self._start_if: Optional[Tuple[QAPISchemaIfCond, str,
>     str]] = None
>      >
>      > -    def start_if(self, ifcond: Sequence[str]) -> None:
>      > +    def start_if(self, ifcond: QAPISchemaIfCond) -> None:
>      >           assert self._start_if is None
>      >           self._start_if = (ifcond, self._body, self._preamble)
>      >
>      > @@ -187,7 +187,7 @@ def _bottom(self) -> str:
>      >
>      >
>      >   @contextmanager
>      > -def ifcontext(ifcond: Sequence[str], *args: QAPIGenCCode) ->
>     Iterator[None]:
>      > +def ifcontext(ifcond: QAPISchemaIfCond, *args: QAPIGenCCode) ->
>     Iterator[None]:
>      >       """
>      >       A with-statement context manager that wraps with
>     `start_if()` / `end_if()`.
>      >
>      > diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>      > index 9a348ca2e5..77a8c33ad4 100644
>      > --- a/scripts/qapi/introspect.py
>      > +++ b/scripts/qapi/introspect.py
>      > @@ -15,11 +15,9 @@
>      >       Any,
>      >       Dict,
>      >       Generic,
>      > -    Iterable,
>      >       List,
>      >       Optional,
>      >       Sequence,
>      > -    Tuple,
>      >       TypeVar,
>      >       Union,
>      >   )
>      > @@ -38,6 +36,7 @@
>      >       QAPISchemaEntity,
>      >       QAPISchemaEnumMember,
>      >       QAPISchemaFeature,
>      > +    QAPISchemaIfCond,
>      >       QAPISchemaObjectType,
>      >       QAPISchemaObjectTypeMember,
>      >       QAPISchemaType,
>      > @@ -91,11 +90,11 @@ class Annotated(Generic[_ValueT]):
>      >       """
>      >       # TODO: Remove after Python 3.7 adds @dataclass:
>      >       # pylint: disable=too-few-public-methods
>      > -    def __init__(self, value: _ValueT, ifcond: Iterable[str],
>      > +    def __init__(self, value: _ValueT, ifcond: QAPISchemaIfCond,
>      >                    comment: Optional[str] = None):
>      >           self.value = value
>      >           self.comment: Optional[str] = comment
>      > -        self.ifcond: Tuple[str, ...] = tuple(ifcond)
>      > +        self.ifcond = ifcond
>      >
>      >
>      >   def _tree_to_qlit(obj: JSONValue,
>      > @@ -125,10 +124,10 @@ def indent(level: int) -> str:
>      >           if obj.comment:
>      >               ret += indent(level) + f"/* {obj.comment} */\n"
>      >           if obj.ifcond:
>      > -            ret += gen_if(obj.ifcond)
>      > +            ret += gen_if(obj.ifcond.ifcond)
>      >           ret += _tree_to_qlit(obj.value, level)
>      >           if obj.ifcond:
>      > -            ret += '\n' + gen_endif(obj.ifcond)
>      > +            ret += '\n' + gen_endif(obj.ifcond.ifcond)
>      >           return ret
>      >
>      >       ret = ''
>      > @@ -254,7 +253,7 @@ def _gen_features(features:
>     Sequence[QAPISchemaFeature]
>      >           return [Annotated(f.name <http://f.name>, f.ifcond) for
>     f in features]
>      >
>      >       def _gen_tree(self, name: str, mtype: str, obj: Dict[str,
>     object],
>      > -                  ifcond: Sequence[str] = (),
>      > +                  ifcond: QAPISchemaIfCond = QAPISchemaIfCond(),
>      >                     features: Sequence[QAPISchemaFeature] = ())
>     -> None:
>      >           """
>      >           Build and append a SchemaInfo object to self._trees.
>      > @@ -305,7 +304,7 @@ def visit_builtin_type(self, name: str, info:
>     Optional[QAPISourceInfo],
>      >           self._gen_tree(name, 'builtin', {'json-type': json_type})
>      >
>      >       def visit_enum_type(self, name: str, info:
>     Optional[QAPISourceInfo],
>      > -                        ifcond: Sequence[str],
>      > +                        ifcond: QAPISchemaIfCond,
>      >                           features: List[QAPISchemaFeature],
>      >                           members: List[QAPISchemaEnumMember],
>      >                           prefix: Optional[str]) -> None:
>      > @@ -316,14 +315,14 @@ def visit_enum_type(self, name: str, info:
>     Optional[QAPISourceInfo],
>      >           )
>      >
>      >       def visit_array_type(self, name: str, info:
>     Optional[QAPISourceInfo],
>      > -                         ifcond: Sequence[str],
>      > +                         ifcond: QAPISchemaIfCond,
>      >                            element_type: QAPISchemaType) -> None:
>      >           element = self._use_type(element_type)
>      >           self._gen_tree('[' + element + ']', 'array',
>     {'element-type': element},
>      >                          ifcond)
>      >
>      >       def visit_object_type_flat(self, name: str, info:
>     Optional[QAPISourceInfo],
>      > -                               ifcond: Sequence[str],
>      > +                               ifcond: QAPISchemaIfCond,
>      >                                  features: List[QAPISchemaFeature],
>      >                                  members:
>     List[QAPISchemaObjectTypeMember],
>      >                                  variants:
>     Optional[QAPISchemaVariants]) -> None:
>      > @@ -336,7 +335,7 @@ def visit_object_type_flat(self, name: str,
>     info: Optional[QAPISourceInfo],
>      >           self._gen_tree(name, 'object', obj, ifcond, features)
>      >
>      >       def visit_alternate_type(self, name: str, info:
>     Optional[QAPISourceInfo],
>      > -                             ifcond: Sequence[str],
>      > +                             ifcond: QAPISchemaIfCond,
>      >                                features: List[QAPISchemaFeature],
>      >                                variants: QAPISchemaVariants) -> None:
>      >           self._gen_tree(
>      > @@ -348,7 +347,7 @@ def visit_alternate_type(self, name: str,
>     info: Optional[QAPISourceInfo],
>      >           )
>      >
>      >       def visit_command(self, name: str, info:
>     Optional[QAPISourceInfo],
>      > -                      ifcond: Sequence[str],
>      > +                      ifcond: QAPISchemaIfCond,
>      >                         features: List[QAPISchemaFeature],
>      >                         arg_type: Optional[QAPISchemaObjectType],
>      >                         ret_type: Optional[QAPISchemaType], gen:
>     bool,
>      > @@ -367,7 +366,8 @@ def visit_command(self, name: str, info:
>     Optional[QAPISourceInfo],
>      >           self._gen_tree(name, 'command', obj, ifcond, features)
>      >
>      >       def visit_event(self, name: str, info:
>     Optional[QAPISourceInfo],
>      > -                    ifcond: Sequence[str], features:
>     List[QAPISchemaFeature],
>      > +                    ifcond: QAPISchemaIfCond,
>      > +                    features: List[QAPISchemaFeature],
>      >                       arg_type: Optional[QAPISchemaObjectType],
>      >                       boxed: bool) -> None:
>      >           assert self._schema is not None
>      > diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
>      > index 3a4172fb74..7d6f390fa6 100644
>      > --- a/scripts/qapi/schema.py
>      > +++ b/scripts/qapi/schema.py
>      > @@ -25,6 +25,22 @@
>      >   from .parser import QAPISchemaParser
>      >
>      >
>      > +class QAPISchemaIfCond:
>      > +    def __init__(self, ifcond=None):
>      > +        self.ifcond = ifcond or []
>      > +
>      > +    def __bool__(self):
>      > +        return bool(self.ifcond)
>      > +
>      > +    def __repr__(self):
>      > +        return repr(self.ifcond)
>      > +
> 
>     I suggest using:
> 
>     f"QAPISchemaIfCond({self.ifcond!r})"
> 
>     unless future patches make that weirder. It's nice when repr() returns
>     something you can use to make a new, equivalent object.
> 
>     eval(repr(x)) == x
> 
> 
> I implemented it this way for compatibility with test-qapi output. But 
> it is simpler to actually no implement __repr__ and just change the test.
> 

I like having the __repr__ methods personally, but if it's for test 
output purposes, probably best to change the test, yeah.

You can use __str__ instead and have the tests print str(node) or 
{node!s} without worrying about __repr__ hygiene.

>      > +    def __eq__(self, other):
>      > +        if not isinstance(other, QAPISchemaIfCond):
>      > +            return NotImplemented
>      > +        return self.ifcond == other.ifcond
>      > +
>      > +
> 
>     Missing annotations, but ... yeah, schema.py isn't typed yet so I will
>     handle it myself in pt6. No biggie.
> 
> 
> There used to be annotations all over in earlier versions, but I rebased 
> and had to drop most of them.
> 

Yep, don't worry about it for now. I'll get to it.


