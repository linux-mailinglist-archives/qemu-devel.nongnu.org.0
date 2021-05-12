Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A630337D451
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 22:54:37 +0200 (CEST)
Received: from localhost ([::1]:59672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgvsK-00077m-71
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 16:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgvrG-0005fi-9D
 for qemu-devel@nongnu.org; Wed, 12 May 2021 16:53:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgvrA-0006Cf-Rr
 for qemu-devel@nongnu.org; Wed, 12 May 2021 16:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620852803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=maoqqT6VgdSlDqf76+u5EGPAeP4bfJZQmU/bUq71+gw=;
 b=c4SfjVl9+o6oBk7R6tMGxx/htH5BJvE8n/s3kU+qt/+VDwwEZD6pTXCoQDB4ohpb0/O8tI
 O0ihDQnw4oD1A03Jauq5iMh2sUpMCKdqsZb2wqIxrG02Z1hl0Sj2Ud+fA4NqZEctNdMcaC
 XctzAeRDmwpEa9GPxU5qKc9BqiG/Zww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-2p3fBq6sPyGVXC_2TQCJyQ-1; Wed, 12 May 2021 16:53:17 -0400
X-MC-Unique: 2p3fBq6sPyGVXC_2TQCJyQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 453411007477
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 20:53:16 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA74B60657;
 Wed, 12 May 2021 20:53:11 +0000 (UTC)
Subject: Re: [PATCH v3 1/9] qapi: replace List[str] by QAPISchemaIfCond
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
 <20210429134032.1125111-2-marcandre.lureau@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <e1782f26-8ceb-f79e-19d9-3714ad79aa0f@redhat.com>
Date: Wed, 12 May 2021 16:53:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210429134032.1125111-2-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/21 9:40 AM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Wrap the 'if' condition in a higher-level object. Not only this allows
> more type safety but also further refactoring without too much churn.
> 

Would have done it myself if I had gotten to it first. I like having a 
named type for this, it matches the other properties we have.

> The following patches will change the syntax of the schema 'if'
> conditions to be predicate expressions, and will generate code for
> different target languages (C, and Rust in another series).
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   docs/sphinx/qapidoc.py     |  2 +-
>   scripts/qapi/commands.py   |  4 +-
>   scripts/qapi/events.py     |  5 ++-
>   scripts/qapi/gen.py        | 14 +++----
>   scripts/qapi/introspect.py | 26 ++++++-------
>   scripts/qapi/schema.py     | 78 +++++++++++++++++++++++++++-----------
>   scripts/qapi/types.py      | 33 ++++++++--------
>   scripts/qapi/visit.py      | 23 +++++------
>   8 files changed, 110 insertions(+), 75 deletions(-)
> 
> diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
> index 87c67ab23f..b737949007 100644
> --- a/docs/sphinx/qapidoc.py
> +++ b/docs/sphinx/qapidoc.py
> @@ -116,7 +116,7 @@ def _nodes_for_ifcond(self, ifcond, with_if=True):
>           the conditions are in literal-text and the commas are not.
>           If with_if is False, we don't return the "(If: " and ")".
>           """
> -        condlist = intersperse([nodes.literal('', c) for c in ifcond],
> +        condlist = intersperse([nodes.literal('', c) for c in ifcond.ifcond],
>                                  nodes.Text(', '))
>           if not with_if:
>               return condlist
> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> index 0e13d51054..3654825968 100644
> --- a/scripts/qapi/commands.py
> +++ b/scripts/qapi/commands.py
> @@ -17,7 +17,6 @@
>       Dict,
>       List,
>       Optional,
> -    Sequence,
>       Set,
>   )
>   
> @@ -31,6 +30,7 @@
>   from .schema import (
>       QAPISchema,
>       QAPISchemaFeature,
> +    QAPISchemaIfCond,
>       QAPISchemaObjectType,
>       QAPISchemaType,
>   )
> @@ -301,7 +301,7 @@ def visit_end(self) -> None:
>       def visit_command(self,
>                         name: str,
>                         info: Optional[QAPISourceInfo],
> -                      ifcond: Sequence[str],
> +                      ifcond: QAPISchemaIfCond,
>                         features: List[QAPISchemaFeature],
>                         arg_type: Optional[QAPISchemaObjectType],
>                         ret_type: Optional[QAPISchemaType],
> diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
> index fee8c671e7..82475e84ec 100644
> --- a/scripts/qapi/events.py
> +++ b/scripts/qapi/events.py
> @@ -12,7 +12,7 @@
>   See the COPYING file in the top-level directory.
>   """
>   
> -from typing import List, Optional, Sequence
> +from typing import List, Optional
>   
>   from .common import c_enum_const, c_name, mcgen
>   from .gen import QAPISchemaModularCVisitor, build_params, ifcontext
> @@ -20,6 +20,7 @@
>       QAPISchema,
>       QAPISchemaEnumMember,
>       QAPISchemaFeature,
> +    QAPISchemaIfCond,
>       QAPISchemaObjectType,
>   )
>   from .source import QAPISourceInfo
> @@ -227,7 +228,7 @@ def visit_end(self) -> None:
>       def visit_event(self,
>                       name: str,
>                       info: Optional[QAPISourceInfo],
> -                    ifcond: Sequence[str],
> +                    ifcond: QAPISchemaIfCond,
>                       features: List[QAPISchemaFeature],
>                       arg_type: Optional[QAPISchemaObjectType],
>                       boxed: bool) -> None:
> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> index 1fa503bdbd..1c5b190276 100644
> --- a/scripts/qapi/gen.py
> +++ b/scripts/qapi/gen.py
> @@ -18,7 +18,6 @@
>       Dict,
>       Iterator,
>       Optional,
> -    Sequence,
>       Tuple,
>   )
>   
> @@ -32,6 +31,7 @@
>       mcgen,
>   )
>   from .schema import (
> +    QAPISchemaIfCond,
>       QAPISchemaModule,
>       QAPISchemaObjectType,
>       QAPISchemaVisitor,
> @@ -85,7 +85,7 @@ def write(self, output_dir: str) -> None:
>                   fp.write(text)
>   
>   
> -def _wrap_ifcond(ifcond: Sequence[str], before: str, after: str) -> str:
> +def _wrap_ifcond(ifcond: QAPISchemaIfCond, before: str, after: str) -> str:
>       if before == after:
>           return after   # suppress empty #if ... #endif
>   
> @@ -95,9 +95,9 @@ def _wrap_ifcond(ifcond: Sequence[str], before: str, after: str) -> str:
>       if added[0] == '\n':
>           out += '\n'
>           added = added[1:]
> -    out += gen_if(ifcond)
> +    out += gen_if(ifcond.ifcond)
>       out += added
> -    out += gen_endif(ifcond)
> +    out += gen_endif(ifcond.ifcond)
>       return out
>   
>   
> @@ -127,9 +127,9 @@ def build_params(arg_type: Optional[QAPISchemaObjectType],
>   class QAPIGenCCode(QAPIGen):
>       def __init__(self, fname: str):
>           super().__init__(fname)
> -        self._start_if: Optional[Tuple[Sequence[str], str, str]] = None
> +        self._start_if: Optional[Tuple[QAPISchemaIfCond, str, str]] = None
>   
> -    def start_if(self, ifcond: Sequence[str]) -> None:
> +    def start_if(self, ifcond: QAPISchemaIfCond) -> None:
>           assert self._start_if is None
>           self._start_if = (ifcond, self._body, self._preamble)
>   
> @@ -187,7 +187,7 @@ def _bottom(self) -> str:
>   
>   
>   @contextmanager
> -def ifcontext(ifcond: Sequence[str], *args: QAPIGenCCode) -> Iterator[None]:
> +def ifcontext(ifcond: QAPISchemaIfCond, *args: QAPIGenCCode) -> Iterator[None]:
>       """
>       A with-statement context manager that wraps with `start_if()` / `end_if()`.
>   
> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> index 9a348ca2e5..77a8c33ad4 100644
> --- a/scripts/qapi/introspect.py
> +++ b/scripts/qapi/introspect.py
> @@ -15,11 +15,9 @@
>       Any,
>       Dict,
>       Generic,
> -    Iterable,
>       List,
>       Optional,
>       Sequence,
> -    Tuple,
>       TypeVar,
>       Union,
>   )
> @@ -38,6 +36,7 @@
>       QAPISchemaEntity,
>       QAPISchemaEnumMember,
>       QAPISchemaFeature,
> +    QAPISchemaIfCond,
>       QAPISchemaObjectType,
>       QAPISchemaObjectTypeMember,
>       QAPISchemaType,
> @@ -91,11 +90,11 @@ class Annotated(Generic[_ValueT]):
>       """
>       # TODO: Remove after Python 3.7 adds @dataclass:
>       # pylint: disable=too-few-public-methods
> -    def __init__(self, value: _ValueT, ifcond: Iterable[str],
> +    def __init__(self, value: _ValueT, ifcond: QAPISchemaIfCond,
>                    comment: Optional[str] = None):
>           self.value = value
>           self.comment: Optional[str] = comment
> -        self.ifcond: Tuple[str, ...] = tuple(ifcond)
> +        self.ifcond = ifcond
>   
>   
>   def _tree_to_qlit(obj: JSONValue,
> @@ -125,10 +124,10 @@ def indent(level: int) -> str:
>           if obj.comment:
>               ret += indent(level) + f"/* {obj.comment} */\n"
>           if obj.ifcond:
> -            ret += gen_if(obj.ifcond)
> +            ret += gen_if(obj.ifcond.ifcond)
>           ret += _tree_to_qlit(obj.value, level)
>           if obj.ifcond:
> -            ret += '\n' + gen_endif(obj.ifcond)
> +            ret += '\n' + gen_endif(obj.ifcond.ifcond)
>           return ret
>   
>       ret = ''
> @@ -254,7 +253,7 @@ def _gen_features(features: Sequence[QAPISchemaFeature]
>           return [Annotated(f.name, f.ifcond) for f in features]
>   
>       def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object],
> -                  ifcond: Sequence[str] = (),
> +                  ifcond: QAPISchemaIfCond = QAPISchemaIfCond(),
>                     features: Sequence[QAPISchemaFeature] = ()) -> None:
>           """
>           Build and append a SchemaInfo object to self._trees.
> @@ -305,7 +304,7 @@ def visit_builtin_type(self, name: str, info: Optional[QAPISourceInfo],
>           self._gen_tree(name, 'builtin', {'json-type': json_type})
>   
>       def visit_enum_type(self, name: str, info: Optional[QAPISourceInfo],
> -                        ifcond: Sequence[str],
> +                        ifcond: QAPISchemaIfCond,
>                           features: List[QAPISchemaFeature],
>                           members: List[QAPISchemaEnumMember],
>                           prefix: Optional[str]) -> None:
> @@ -316,14 +315,14 @@ def visit_enum_type(self, name: str, info: Optional[QAPISourceInfo],
>           )
>   
>       def visit_array_type(self, name: str, info: Optional[QAPISourceInfo],
> -                         ifcond: Sequence[str],
> +                         ifcond: QAPISchemaIfCond,
>                            element_type: QAPISchemaType) -> None:
>           element = self._use_type(element_type)
>           self._gen_tree('[' + element + ']', 'array', {'element-type': element},
>                          ifcond)
>   
>       def visit_object_type_flat(self, name: str, info: Optional[QAPISourceInfo],
> -                               ifcond: Sequence[str],
> +                               ifcond: QAPISchemaIfCond,
>                                  features: List[QAPISchemaFeature],
>                                  members: List[QAPISchemaObjectTypeMember],
>                                  variants: Optional[QAPISchemaVariants]) -> None:
> @@ -336,7 +335,7 @@ def visit_object_type_flat(self, name: str, info: Optional[QAPISourceInfo],
>           self._gen_tree(name, 'object', obj, ifcond, features)
>   
>       def visit_alternate_type(self, name: str, info: Optional[QAPISourceInfo],
> -                             ifcond: Sequence[str],
> +                             ifcond: QAPISchemaIfCond,
>                                features: List[QAPISchemaFeature],
>                                variants: QAPISchemaVariants) -> None:
>           self._gen_tree(
> @@ -348,7 +347,7 @@ def visit_alternate_type(self, name: str, info: Optional[QAPISourceInfo],
>           )
>   
>       def visit_command(self, name: str, info: Optional[QAPISourceInfo],
> -                      ifcond: Sequence[str],
> +                      ifcond: QAPISchemaIfCond,
>                         features: List[QAPISchemaFeature],
>                         arg_type: Optional[QAPISchemaObjectType],
>                         ret_type: Optional[QAPISchemaType], gen: bool,
> @@ -367,7 +366,8 @@ def visit_command(self, name: str, info: Optional[QAPISourceInfo],
>           self._gen_tree(name, 'command', obj, ifcond, features)
>   
>       def visit_event(self, name: str, info: Optional[QAPISourceInfo],
> -                    ifcond: Sequence[str], features: List[QAPISchemaFeature],
> +                    ifcond: QAPISchemaIfCond,
> +                    features: List[QAPISchemaFeature],
>                       arg_type: Optional[QAPISchemaObjectType],
>                       boxed: bool) -> None:
>           assert self._schema is not None
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index 3a4172fb74..7d6f390fa6 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -25,6 +25,22 @@
>   from .parser import QAPISchemaParser
>   
>   
> +class QAPISchemaIfCond:
> +    def __init__(self, ifcond=None):
> +        self.ifcond = ifcond or []
> +
> +    def __bool__(self):
> +        return bool(self.ifcond)
> +
> +    def __repr__(self):
> +        return repr(self.ifcond)
> +

I suggest using:

f"QAPISchemaIfCond({self.ifcond!r})"

unless future patches make that weirder. It's nice when repr() returns 
something you can use to make a new, equivalent object.

eval(repr(x)) == x

> +    def __eq__(self, other):
> +        if not isinstance(other, QAPISchemaIfCond):
> +            return NotImplemented
> +        return self.ifcond == other.ifcond
> +
> +

Missing annotations, but ... yeah, schema.py isn't typed yet so I will 
handle it myself in pt6. No biggie.

>   class QAPISchemaEntity:
>       meta: Optional[str] = None
>   
> @@ -42,7 +58,7 @@ def __init__(self, name: str, info, doc, ifcond=None, features=None):
>           # such place).
>           self.info = info
>           self.doc = doc
> -        self._ifcond = ifcond or []
> +        self._ifcond = ifcond or QAPISchemaIfCond()
>           self.features = features or []
>           self._checked = False
>   
> @@ -77,7 +93,7 @@ def set_module(self, schema):
>   
>       @property
>       def ifcond(self):
> -        assert self._checked
> +        assert self._checked and isinstance(self._ifcond, QAPISchemaIfCond)
>           return self._ifcond
>   
>       def is_implicit(self):
> @@ -601,7 +617,7 @@ def check(self, schema, seen):
>           else:                   # simple union
>               assert isinstance(self.tag_member.type, QAPISchemaEnumType)
>               assert not self.tag_member.optional
> -            assert self.tag_member.ifcond == []
> +            assert not self.tag_member.ifcond
>           if self._tag_name:    # flat union
>               # branches that are not explicitly covered get an empty type
>               cases = {v.name for v in self.variants}
> @@ -646,7 +662,7 @@ def __init__(self, name, info, ifcond=None):
>           assert isinstance(name, str)
>           self.name = name
>           self.info = info
> -        self.ifcond = ifcond or []
> +        self.ifcond = ifcond or QAPISchemaIfCond()
>           self.defined_in = None
>   
>       def set_defined_in(self, name):
> @@ -958,14 +974,20 @@ def _def_predefineds(self):
>           self._def_entity(QAPISchemaEnumType('QType', None, None, None, None,
>                                               qtype_values, 'QTYPE'))
>   
> +    def _get_if(self, f) -> QAPISchemaIfCond:
> +        ifcond = f.get('if')
> +        if isinstance(ifcond, QAPISchemaIfCond):

would "is not None" suffice here?

> +            return ifcond
> +        return QAPISchemaIfCond(ifcond)

Under which circumstances do we expect 'ifcond' here to be something 
other than None but *not* a QAPISchemaIfCond?

This helper seems a little suspect in the sense that it appears to be 
taking liberties with the dynamic runtime object system.

> + >       def _make_features(self, features, info):
>           if features is None:
>               return []
> -        return [QAPISchemaFeature(f['name'], info, f.get('if'))
> +        return [QAPISchemaFeature(f['name'], info, self._get_if(f))
>                   for f in features]
>   
>       def _make_enum_members(self, values, info):
> -        return [QAPISchemaEnumMember(v['name'], info, v.get('if'))
> +        return [QAPISchemaEnumMember(v['name'], info, self._get_if(v))
>                   for v in values]
>   
>       def _make_implicit_enum_type(self, name, info, ifcond, values):
> @@ -1001,7 +1023,7 @@ def _make_implicit_object_type(self, name, info, ifcond, role, members):
>               # TODO kill simple unions or implement the disjunction
>   
>               # pylint: disable=protected-access
> -            assert (ifcond or []) == typ._ifcond
> +            assert ifcond == typ._ifcond
>           else:
>               self._def_entity(QAPISchemaObjectType(
>                   name, info, None, ifcond, None, None, members, None))
> @@ -1011,7 +1033,7 @@ def _def_enum_type(self, expr, info, doc):
>           name = expr['enum']
>           data = expr['data']
>           prefix = expr.get('prefix')
> -        ifcond = expr.get('if')
> +        ifcond = QAPISchemaIfCond(expr.get('if'))
>           features = self._make_features(expr.get('features'), info)
>           self._def_entity(QAPISchemaEnumType(
>               name, info, doc, ifcond, features,
> @@ -1029,7 +1051,8 @@ def _make_member(self, name, typ, ifcond, features, info):
>                                             self._make_features(features, info))
>   
>       def _make_members(self, data, info):
> -        return [self._make_member(key, value['type'], value.get('if'),
> +        return [self._make_member(key, value['type'],
> +                                  QAPISchemaIfCond(value.get('if')),
>                                     value.get('features'), info)
>                   for (key, value) in data.items()]
>   
> @@ -1037,7 +1060,7 @@ def _def_struct_type(self, expr, info, doc):
>           name = expr['struct']
>           base = expr.get('base')
>           data = expr['data']
> -        ifcond = expr.get('if')
> +        ifcond = QAPISchemaIfCond(expr.get('if'))
>           features = self._make_features(expr.get('features'), info)
>           self._def_entity(QAPISchemaObjectType(
>               name, info, doc, ifcond, features, base,
> @@ -1060,7 +1083,7 @@ def _def_union_type(self, expr, info, doc):
>           name = expr['union']
>           data = expr['data']
>           base = expr.get('base')
> -        ifcond = expr.get('if')
> +        ifcond = QAPISchemaIfCond(expr.get('if'))
>           features = self._make_features(expr.get('features'), info)
>           tag_name = expr.get('discriminator')
>           tag_member = None
> @@ -1069,14 +1092,20 @@ def _def_union_type(self, expr, info, doc):
>                   name, info, ifcond,
>                   'base', self._make_members(base, info))
>           if tag_name:
> -            variants = [self._make_variant(key, value['type'],
> -                                           value.get('if'), info)
> -                        for (key, value) in data.items()]
> +            variants = [
> +                self._make_variant(key, value['type'],
> +                                   QAPISchemaIfCond(value.get('if')),
> +                                   info)
> +                for (key, value) in data.items()
> +            ]
>               members = []
>           else:
> -            variants = [self._make_simple_variant(key, value['type'],
> -                                                  value.get('if'), info)
> -                        for (key, value) in data.items()]
> +            variants = [
> +                self._make_simple_variant(key, value['type'],
> +                                          QAPISchemaIfCond(value.get('if')),
> +                                          info)
> +                for (key, value) in data.items()
> +            ]
>               enum = [{'name': v.name, 'if': v.ifcond} for v in variants]
>               typ = self._make_implicit_enum_type(name, info, ifcond, enum)
>               tag_member = QAPISchemaObjectTypeMember('type', info, typ, False)
> @@ -1090,11 +1119,14 @@ def _def_union_type(self, expr, info, doc):
>       def _def_alternate_type(self, expr, info, doc):
>           name = expr['alternate']
>           data = expr['data']
> -        ifcond = expr.get('if')
> +        ifcond = QAPISchemaIfCond(expr.get('if'))
>           features = self._make_features(expr.get('features'), info)
> -        variants = [self._make_variant(key, value['type'], value.get('if'),
> -                                       info)
> -                    for (key, value) in data.items()]
> +        variants = [
> +            self._make_variant(key, value['type'],
> +                               QAPISchemaIfCond(value.get('if')),
> +                               info)
> +            for (key, value) in data.items()
> +        ]
>           tag_member = QAPISchemaObjectTypeMember('type', info, 'QType', False)
>           self._def_entity(
>               QAPISchemaAlternateType(name, info, doc, ifcond, features,
> @@ -1111,7 +1143,7 @@ def _def_command(self, expr, info, doc):
>           allow_oob = expr.get('allow-oob', False)
>           allow_preconfig = expr.get('allow-preconfig', False)
>           coroutine = expr.get('coroutine', False)
> -        ifcond = expr.get('if')
> +        ifcond = QAPISchemaIfCond(expr.get('if'))
>           features = self._make_features(expr.get('features'), info)
>           if isinstance(data, OrderedDict):
>               data = self._make_implicit_object_type(
> @@ -1130,7 +1162,7 @@ def _def_event(self, expr, info, doc):
>           name = expr['event']
>           data = expr.get('data')
>           boxed = expr.get('boxed', False)
> -        ifcond = expr.get('if')
> +        ifcond = QAPISchemaIfCond(expr.get('if'))
>           features = self._make_features(expr.get('features'), info)
>           if isinstance(data, OrderedDict):
>               data = self._make_implicit_object_type(
> diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
> index 20d572a23a..3673cf0f49 100644
> --- a/scripts/qapi/types.py
> +++ b/scripts/qapi/types.py
> @@ -13,7 +13,7 @@
>   # See the COPYING file in the top-level directory.
>   """
>   
> -from typing import List, Optional, Sequence
> +from typing import List, Optional
>   
>   from .common import (
>       c_enum_const,
> @@ -27,6 +27,7 @@
>       QAPISchema,
>       QAPISchemaEnumMember,
>       QAPISchemaFeature,
> +    QAPISchemaIfCond,
>       QAPISchemaObjectType,
>       QAPISchemaObjectTypeMember,
>       QAPISchemaType,
> @@ -50,13 +51,13 @@ def gen_enum_lookup(name: str,
>   ''',
>                   c_name=c_name(name))
>       for memb in members:
> -        ret += gen_if(memb.ifcond)
> +        ret += gen_if(memb.ifcond.ifcond)
>           index = c_enum_const(name, memb.name, prefix)
>           ret += mcgen('''
>           [%(index)s] = "%(name)s",
>   ''',
>                        index=index, name=memb.name)
> -        ret += gen_endif(memb.ifcond)
> +        ret += gen_endif(memb.ifcond.ifcond)
>   
>       ret += mcgen('''
>       },
> @@ -80,12 +81,12 @@ def gen_enum(name: str,
>                   c_name=c_name(name))
>   
>       for memb in enum_members:
> -        ret += gen_if(memb.ifcond)
> +        ret += gen_if(memb.ifcond.ifcond)
>           ret += mcgen('''
>       %(c_enum)s,
>   ''',
>                        c_enum=c_enum_const(name, memb.name, prefix))
> -        ret += gen_endif(memb.ifcond)
> +        ret += gen_endif(memb.ifcond.ifcond)
>   
>       ret += mcgen('''
>   } %(c_name)s;
> @@ -125,7 +126,7 @@ def gen_array(name: str, element_type: QAPISchemaType) -> str:
>   def gen_struct_members(members: List[QAPISchemaObjectTypeMember]) -> str:
>       ret = ''
>       for memb in members:
> -        ret += gen_if(memb.ifcond)
> +        ret += gen_if(memb.ifcond.ifcond)
>           if memb.optional:
>               ret += mcgen('''
>       bool has_%(c_name)s;
> @@ -135,11 +136,11 @@ def gen_struct_members(members: List[QAPISchemaObjectTypeMember]) -> str:
>       %(c_type)s %(c_name)s;
>   ''',
>                        c_type=memb.type.c_type(), c_name=c_name(memb.name))
> -        ret += gen_endif(memb.ifcond)
> +        ret += gen_endif(memb.ifcond.ifcond)
>       return ret
>   
>   
> -def gen_object(name: str, ifcond: Sequence[str],
> +def gen_object(name: str, ifcond: QAPISchemaIfCond,
>                  base: Optional[QAPISchemaObjectType],
>                  members: List[QAPISchemaObjectTypeMember],
>                  variants: Optional[QAPISchemaVariants]) -> str:
> @@ -158,7 +159,7 @@ def gen_object(name: str, ifcond: Sequence[str],
>       ret += mcgen('''
>   
>   ''')
> -    ret += gen_if(ifcond)
> +    ret += gen_if(ifcond.ifcond)
>       ret += mcgen('''
>   struct %(c_name)s {
>   ''',
> @@ -192,7 +193,7 @@ def gen_object(name: str, ifcond: Sequence[str],
>       ret += mcgen('''
>   };
>   ''')
> -    ret += gen_endif(ifcond)
> +    ret += gen_endif(ifcond.ifcond)
>   
>       return ret
>   
> @@ -219,13 +220,13 @@ def gen_variants(variants: QAPISchemaVariants) -> str:
>       for var in variants.variants:
>           if var.type.name == 'q_empty':
>               continue
> -        ret += gen_if(var.ifcond)
> +        ret += gen_if(var.ifcond.ifcond)
>           ret += mcgen('''
>           %(c_type)s %(c_name)s;
>   ''',
>                        c_type=var.type.c_unboxed_type(),
>                        c_name=c_name(var.name))
> -        ret += gen_endif(var.ifcond)
> +        ret += gen_endif(var.ifcond.ifcond)
>   
>       ret += mcgen('''
>       } u;
> @@ -307,7 +308,7 @@ def _gen_type_cleanup(self, name: str) -> None:
>       def visit_enum_type(self,
>                           name: str,
>                           info: Optional[QAPISourceInfo],
> -                        ifcond: Sequence[str],
> +                        ifcond: QAPISchemaIfCond,
>                           features: List[QAPISchemaFeature],
>                           members: List[QAPISchemaEnumMember],
>                           prefix: Optional[str]) -> None:
> @@ -318,7 +319,7 @@ def visit_enum_type(self,
>       def visit_array_type(self,
>                            name: str,
>                            info: Optional[QAPISourceInfo],
> -                         ifcond: Sequence[str],
> +                         ifcond: QAPISchemaIfCond,
>                            element_type: QAPISchemaType) -> None:
>           with ifcontext(ifcond, self._genh, self._genc):
>               self._genh.preamble_add(gen_fwd_object_or_array(name))
> @@ -328,7 +329,7 @@ def visit_array_type(self,
>       def visit_object_type(self,
>                             name: str,
>                             info: Optional[QAPISourceInfo],
> -                          ifcond: Sequence[str],
> +                          ifcond: QAPISchemaIfCond,
>                             features: List[QAPISchemaFeature],
>                             base: Optional[QAPISchemaObjectType],
>                             members: List[QAPISchemaObjectTypeMember],
> @@ -351,7 +352,7 @@ def visit_object_type(self,
>       def visit_alternate_type(self,
>                                name: str,
>                                info: Optional[QAPISourceInfo],
> -                             ifcond: Sequence[str],
> +                             ifcond: QAPISchemaIfCond,
>                                features: List[QAPISchemaFeature],
>                                variants: QAPISchemaVariants) -> None:
>           with ifcontext(ifcond, self._genh):
> diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
> index 9e96f3c566..67721b2470 100644
> --- a/scripts/qapi/visit.py
> +++ b/scripts/qapi/visit.py
> @@ -13,7 +13,7 @@
>   See the COPYING file in the top-level directory.
>   """
>   
> -from typing import List, Optional, Sequence
> +from typing import List, Optional
>   
>   from .common import (
>       c_enum_const,
> @@ -29,6 +29,7 @@
>       QAPISchemaEnumMember,
>       QAPISchemaEnumType,
>       QAPISchemaFeature,
> +    QAPISchemaIfCond,
>       QAPISchemaObjectType,
>       QAPISchemaObjectTypeMember,
>       QAPISchemaType,
> @@ -78,7 +79,7 @@ def gen_visit_object_members(name: str,
>   
>       for memb in members:
>           deprecated = 'deprecated' in [f.name for f in memb.features]
> -        ret += gen_if(memb.ifcond)
> +        ret += gen_if(memb.ifcond.ifcond)
>           if memb.optional:
>               ret += mcgen('''
>       if (visit_optional(v, "%(name)s", &obj->has_%(c_name)s)) {
> @@ -111,7 +112,7 @@ def gen_visit_object_members(name: str,
>               ret += mcgen('''
>       }
>   ''')
> -        ret += gen_endif(memb.ifcond)
> +        ret += gen_endif(memb.ifcond.ifcond)
>   
>       if variants:
>           tag_member = variants.tag_member
> @@ -125,7 +126,7 @@ def gen_visit_object_members(name: str,
>           for var in variants.variants:
>               case_str = c_enum_const(tag_member.type.name, var.name,
>                                       tag_member.type.prefix)
> -            ret += gen_if(var.ifcond)
> +            ret += gen_if(var.ifcond.ifcond)
>               if var.type.name == 'q_empty':
>                   # valid variant and nothing to do
>                   ret += mcgen('''
> @@ -141,7 +142,7 @@ def gen_visit_object_members(name: str,
>                                case=case_str,
>                                c_type=var.type.c_name(), c_name=c_name(var.name))
>   
> -            ret += gen_endif(var.ifcond)
> +            ret += gen_endif(var.ifcond.ifcond)
>           ret += mcgen('''
>       default:
>           abort();
> @@ -227,7 +228,7 @@ def gen_visit_alternate(name: str, variants: QAPISchemaVariants) -> str:
>                   c_name=c_name(name))
>   
>       for var in variants.variants:
> -        ret += gen_if(var.ifcond)
> +        ret += gen_if(var.ifcond.ifcond)
>           ret += mcgen('''
>       case %(case)s:
>   ''',
> @@ -253,7 +254,7 @@ def gen_visit_alternate(name: str, variants: QAPISchemaVariants) -> str:
>           ret += mcgen('''
>           break;
>   ''')
> -        ret += gen_endif(var.ifcond)
> +        ret += gen_endif(var.ifcond.ifcond)
>   
>       ret += mcgen('''
>       case QTYPE_NONE:
> @@ -352,7 +353,7 @@ def _begin_user_module(self, name: str) -> None:
>       def visit_enum_type(self,
>                           name: str,
>                           info: Optional[QAPISourceInfo],
> -                        ifcond: Sequence[str],
> +                        ifcond: QAPISchemaIfCond,
>                           features: List[QAPISchemaFeature],
>                           members: List[QAPISchemaEnumMember],
>                           prefix: Optional[str]) -> None:
> @@ -363,7 +364,7 @@ def visit_enum_type(self,
>       def visit_array_type(self,
>                            name: str,
>                            info: Optional[QAPISourceInfo],
> -                         ifcond: Sequence[str],
> +                         ifcond: QAPISchemaIfCond,
>                            element_type: QAPISchemaType) -> None:
>           with ifcontext(ifcond, self._genh, self._genc):
>               self._genh.add(gen_visit_decl(name))
> @@ -372,7 +373,7 @@ def visit_array_type(self,
>       def visit_object_type(self,
>                             name: str,
>                             info: Optional[QAPISourceInfo],
> -                          ifcond: Sequence[str],
> +                          ifcond: QAPISchemaIfCond,
>                             features: List[QAPISchemaFeature],
>                             base: Optional[QAPISchemaObjectType],
>                             members: List[QAPISchemaObjectTypeMember],
> @@ -394,7 +395,7 @@ def visit_object_type(self,
>       def visit_alternate_type(self,
>                                name: str,
>                                info: Optional[QAPISourceInfo],
> -                             ifcond: Sequence[str],
> +                             ifcond: QAPISchemaIfCond,
>                                features: List[QAPISchemaFeature],
>                                variants: QAPISchemaVariants) -> None:
>           with ifcontext(ifcond, self._genh, self._genc):
> 

looks good.

Tested-by: John Snow <jsnow@redhat.com>


