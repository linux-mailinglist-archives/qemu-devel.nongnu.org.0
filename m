Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 278FE27F22B
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 21:02:02 +0200 (CEST)
Received: from localhost ([::1]:44998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNhMW-0004zc-M0
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 15:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kNhJC-00032L-9x
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 14:58:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kNhJA-0002bS-4y
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 14:58:34 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601492311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5LtZAc3MO0i8ymZtPSEo4azqRMupd/0/21nuguaSv40=;
 b=ABdyGgcDXzzaihCYoTxJw+qKd+TRxJYf1T+Q9aviu5F7tFtArtNi2GpsDDpEU2FcHBvg4x
 fvPLU4ULhHGWlOshxsG2y+uUcm8DTsSMkx8wTz0uN7AU1QB2s5azKUAOu/qMPbc3JCZd5K
 w4U8x5gptQjhXYF9j5fCRVegDjVAW+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-hn50z7I6Mt6gmgvQ7atAmg-1; Wed, 30 Sep 2020 14:58:10 -0400
X-MC-Unique: hn50z7I6Mt6gmgvQ7atAmg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69E5064084;
 Wed, 30 Sep 2020 18:58:09 +0000 (UTC)
Received: from [10.10.119.140] (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DECF702E7;
 Wed, 30 Sep 2020 18:58:05 +0000 (UTC)
Subject: Re: [PATCH v4 41/46] qapi/introspect.py: create a typed 'Node' data
 structure
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20200930043150.1454766-1-jsnow@redhat.com>
 <20200930043150.1454766-42-jsnow@redhat.com>
 <20200930183918.GY3717385@habkost.net>
From: John Snow <jsnow@redhat.com>
Message-ID: <4282f45c-b5e2-6c60-8010-a9858098f395@redhat.com>
Date: Wed, 30 Sep 2020 14:58:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200930183918.GY3717385@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:26:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/30/20 2:39 PM, Eduardo Habkost wrote:
> On Wed, Sep 30, 2020 at 12:31:45AM -0400, John Snow wrote:
>> This replaces _make_tree with Node.__init__(), effectively. By creating
>> it as a generic container, we can more accurately describe the exact
>> nature of this particular Node.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/introspect.py | 77 +++++++++++++++++++-------------------
>>   1 file changed, 38 insertions(+), 39 deletions(-)
>>
>> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>> index 43b6ba5df1f..86286e755ca 100644
>> --- a/scripts/qapi/introspect.py
>> +++ b/scripts/qapi/introspect.py
>> @@ -12,11 +12,12 @@
>>   
>>   from typing import (
>>       Dict,
>> +    Generic,
>> +    Iterable,
>>       List,
>>       Optional,
>>       Sequence,
>> -    Tuple,
>> -    Union,
>> +    TypeVar,
>>   )
>>   
>>   from .common import (
>> @@ -43,42 +44,42 @@
>>   
>>   
>>   # The correct type for TreeNode is actually:
>> -# Union[AnnotatedNode, List[TreeNode], Dict[str, TreeNode], str, bool]
>> +# Union[Node[TreeNode], List[TreeNode], Dict[str, TreeNode], str, bool]
>>   # but mypy does not support recursive types yet.
>>   TreeNode = object
>> +_NodeType = TypeVar('_NodeType', bound=TreeNode)
>>   _DObject = Dict[str, object]
>> -Extra = Dict[str, object]
>> -AnnotatedNode = Tuple[TreeNode, Extra]
> 
> Do you have plans to make Node replace TreeNode completely?
> 
> I'd understand this patch as a means to reach that goal, but I'm
> not sure the intermediate state of having both Node and TreeNode
> types (that can be confused with each other) is desirable.
> 

The problem is that _tree_to_qlit still accepts a broad array of types. 
The "TreeNode" comment above explains that those types are:

Node[TreeNode], List[TreeNode], Dict[str, TreeNode], str, bool

Three are containers, two are leaf values.
of the containers, the Node container is special in that it houses 
explicitly one of the four other types (but never itself.)

Even if I somehow always enforced Node[T] heading into _tree_to_qlit, I 
would still need to describe what 'T' is, which is another recursive 
type that I cannot exactly describe with mypy's current descriptive power:

INNER_TYPE = List[Node[INNER_TYPE]], Dict[str, Node[INNER_TYPE]], str, bool

And that's not really a huge win, or indeed any different to the 
existing TreeNode being an "object".

So ... no, I felt like I was going to stop here, where we have 
fundamentally:

1. Undecorated nodes (list, dict, str, bool) ("TreeNode")
2. Decorated nodes (Node[T])                 ("Node")

which leads to the question: Why bother swapping Tuple for Node at that 
point?

My answer is simply that having a strong type name allows us to 
distinguish this from garden-variety Tuples that might sneak in for 
other reasons in other data types.

Maybe we want a different nomenclature though, like Node vs AnnotatedNode?

--js

(Also: 'TreeNode' is just an alias for object, it doesn't mean anything 
grammatically. I could just as soon erase it entirely if you felt it 
provided no value. It doesn't enforce that it only takes objects we 
declared were 'TreeNode' types, for instance. It's just a preprocessor 
name, basically.)

>>   
>>   
>> -def _make_tree(obj: Union[_DObject, str], ifcond: List[str],
>> -               comment: Optional[str] = None) -> AnnotatedNode:
>> -    extra: Extra = {
>> -        'if': ifcond,
>> -        'comment': comment,
>> -    }
>> -    return (obj, extra)
>> +class Node(Generic[_NodeType]):
>> +    """
>> +    Node generally contains a SchemaInfo-like type (as a dict),
>> +    But it also used to wrap comments/ifconds around leaf value types.
>> +    """
>> +    # Remove after 3.7 adds @dataclass:
>> +    # pylint: disable=too-few-public-methods
>> +    def __init__(self, data: _NodeType, ifcond: Iterable[str],
>> +                 comment: Optional[str] = None):
>> +        self.data = data
>> +        self.comment: Optional[str] = comment
>> +        self.ifcond: Sequence[str] = tuple(ifcond)
>>   
>>   
>> -def _tree_to_qlit(obj: TreeNode,
>> -                  level: int = 0,
>> +def _tree_to_qlit(obj: TreeNode, level: int = 0,
>>                     suppress_first_indent: bool = False) -> str:
>>   
>>       def indent(level: int) -> str:
>>           return level * 4 * ' '
>>   
>> -    if isinstance(obj, tuple):
>> -        ifobj, extra = obj
>> -        ifcond = extra.get('if')
>> -        comment = extra.get('comment')
>> +    if isinstance(obj, Node):
>>           ret = ''
>> -        if comment:
>> -            ret += indent(level) + '/* %s */\n' % comment
>> -        if ifcond:
>> -            ret += gen_if(ifcond)
>> -        ret += _tree_to_qlit(ifobj, level)
>> -        if ifcond:
>> -            ret += '\n' + gen_endif(ifcond)
>> +        if obj.comment:
>> +            ret += indent(level) + '/* %s */\n' % obj.comment
>> +        if obj.ifcond:
>> +            ret += gen_if(obj.ifcond)
>> +        ret += _tree_to_qlit(obj.data, level)
>> +        if obj.ifcond:
>> +            ret += '\n' + gen_endif(obj.ifcond)
>>           return ret
>>   
>>       ret = ''
>> @@ -125,7 +126,7 @@ def __init__(self, prefix: str, unmask: bool):
>>               ' * QAPI/QMP schema introspection', __doc__)
>>           self._unmask = unmask
>>           self._schema: Optional[QAPISchema] = None
>> -        self._trees: List[AnnotatedNode] = []
>> +        self._trees: List[Node[_DObject]] = []
>>           self._used_types: List[QAPISchemaType] = []
>>           self._name_map: Dict[str, str] = {}
>>           self._genc.add(mcgen('''
>> @@ -192,9 +193,8 @@ def _use_type(self, typ: QAPISchemaType) -> str:
>>   
>>       @classmethod
>>       def _gen_features(cls,
>> -                      features: List[QAPISchemaFeature]
>> -                      ) -> List[AnnotatedNode]:
>> -        return [_make_tree(f.name, f.ifcond) for f in features]
>> +                      features: List[QAPISchemaFeature]) -> List[Node[str]]:
>> +        return [Node(f.name, f.ifcond) for f in features]
>>   
>>       def _gen_tree(self, name: str, mtype: str, obj: _DObject,
>>                     ifcond: List[str],
>> @@ -210,10 +210,10 @@ def _gen_tree(self, name: str, mtype: str, obj: _DObject,
>>           obj['meta-type'] = mtype
>>           if features:
>>               obj['features'] = self._gen_features(features)
>> -        self._trees.append(_make_tree(obj, ifcond, comment))
>> +        self._trees.append(Node(obj, ifcond, comment))
>>   
>>       def _gen_member(self,
>> -                    member: QAPISchemaObjectTypeMember) -> AnnotatedNode:
>> +                    member: QAPISchemaObjectTypeMember) -> Node[_DObject]:
>>           obj: _DObject = {
>>               'name': member.name,
>>               'type': self._use_type(member.type)
>> @@ -222,19 +222,19 @@ def _gen_member(self,
>>               obj['default'] = None
>>           if member.features:
>>               obj['features'] = self._gen_features(member.features)
>> -        return _make_tree(obj, member.ifcond)
>> +        return Node(obj, member.ifcond)
>>   
>>       def _gen_variants(self, tag_name: str,
>>                         variants: List[QAPISchemaVariant]) -> _DObject:
>>           return {'tag': tag_name,
>>                   'variants': [self._gen_variant(v) for v in variants]}
>>   
>> -    def _gen_variant(self, variant: QAPISchemaVariant) -> AnnotatedNode:
>> +    def _gen_variant(self, variant: QAPISchemaVariant) -> Node[_DObject]:
>>           obj: _DObject = {
>>               'case': variant.name,
>>               'type': self._use_type(variant.type)
>>           }
>> -        return _make_tree(obj, variant.ifcond)
>> +        return Node(obj, variant.ifcond)
>>   
>>       def visit_builtin_type(self, name: str, info: Optional[QAPISourceInfo],
>>                              json_type: str) -> None:
>> @@ -245,8 +245,7 @@ def visit_enum_type(self, name: str, info: QAPISourceInfo,
>>                           members: List[QAPISchemaEnumMember],
>>                           prefix: Optional[str]) -> None:
>>           self._gen_tree(name, 'enum',
>> -                       {'values': [_make_tree(m.name, m.ifcond, None)
>> -                                   for m in members]},
>> +                       {'values': [Node(m.name, m.ifcond) for m in members]},
>>                          ifcond, features)
>>   
>>       def visit_array_type(self, name: str, info: Optional[QAPISourceInfo],
>> @@ -274,9 +273,9 @@ def visit_alternate_type(self, name: str, info: QAPISourceInfo,
>>                                variants: QAPISchemaVariants) -> None:
>>           self._gen_tree(name, 'alternate',
>>                          {'members': [
>> -                           _make_tree({'type': self._use_type(m.type)},
>> -                                      m.ifcond, None)
>> -                           for m in variants.variants]},
>> +                           Node({'type': self._use_type(m.type)}, m.ifcond)
>> +                           for m in variants.variants
>> +                       ]},
>>                          ifcond, features)
>>   
>>       def visit_command(self, name: str, info: QAPISourceInfo, ifcond: List[str],
>> -- 
>> 2.26.2
>>
> 


