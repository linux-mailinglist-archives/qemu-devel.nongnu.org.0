Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4688830E6E3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 00:14:02 +0100 (CET)
Received: from localhost ([::1]:58428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7RLU-000870-RK
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 18:14:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7RK5-0007Y9-0h
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 18:12:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7RK0-0007wA-U0
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 18:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612393946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DWG0Yyir+UxaPLzvwWk9dodquvkvpUI9dLi6m9Kw73w=;
 b=O4GFhlVtyNUUsPdpZeDry1zUBhAXJPG3DyoGCVY5+jTYL4ceDsgEnd2z4/Tapf4rJ7vr/G
 V6iHASZ7uQRlMNKgT4PkGTn98L0DjZXuC+ex017lCuFCJ1jezZNcfzS1RHBaetOc7gmanI
 g+MjjNb8Qcp5HFE43cBlcRYjDmRM24I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-ETXMcXrpNeyf097HevRixg-1; Wed, 03 Feb 2021 18:12:22 -0500
X-MC-Unique: ETXMcXrpNeyf097HevRixg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 373B1192AB79;
 Wed,  3 Feb 2021 23:12:21 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8508F19C66;
 Wed,  3 Feb 2021 23:12:20 +0000 (UTC)
Subject: Re: [PATCH v4 08/14] qapi/introspect.py: create a typed 'Annotated'
 data strutcure
To: Markus Armbruster <armbru@redhat.com>
References: <20210202174651.2274166-1-jsnow@redhat.com>
 <20210202174651.2274166-9-jsnow@redhat.com>
 <878s85tdh3.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <a62d8293-8779-0f62-21e9-442b2e03b8c8@redhat.com>
Date: Wed, 3 Feb 2021 18:12:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <878s85tdh3.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 9:47 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> Presently, we use a tuple to attach a dict containing annotations
>> (comments and compile-time conditionals) to a tree node. This is
>> undesirable because dicts are difficult to strongly type; promoting it
>> to a real class allows us to name the values and types of the
>> annotations we are expecting.
>>
>> In terms of typing, the Annotated<T> type serves as a generic container
>> where the annotated node's type is preserved, allowing for greater
>> specificity than we'd be able to provide without a generic.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/introspect.py | 77 ++++++++++++++++++++++----------------
>>   1 file changed, 44 insertions(+), 33 deletions(-)
>>
>> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>> index b82efe16f6e..2b90a52f016 100644
>> --- a/scripts/qapi/introspect.py
>> +++ b/scripts/qapi/introspect.py
>> @@ -13,8 +13,12 @@
>>   from typing import (
>>       Any,
>>       Dict,
>> +    Generic,
>> +    Iterable,
>>       List,
>>       Optional,
>> +    Tuple,
>> +    TypeVar,
>>       Union,
>>   )
>>   
>> @@ -51,15 +55,25 @@
>>   _scalar = Union[str, bool, None]
>>   _nonscalar = Union[Dict[str, _stub], List[_stub]]
>>   _value = Union[_scalar, _nonscalar]
>> -# TreeValue = Union[_value, 'Annotated[_value]']
>> +TreeValue = Union[_value, 'Annotated[_value]']
> 
> You need to quote 'Annotated[_value]', because it's a forward
> reference.
> 
> Dependency cycle:
> 
>          +-----------------------------------------------+
>          |                                               |
>      TreeValue = Union[_value, 'Annotated[_value]']      |
>                                     |                    |
>          +--------------------------+                    |
>          |                                               |
>      Annotated(Generic[_NodeT])                          |
>                           |                              |
>         +-----------------+                              |
>         |                                                |
>      _NodeT = TypeVar('_NodeT', bound=TreeValue          |
>                                           |              |
>                                           +--------------+
> 
> Meh.  We'll live.
> 

Python 3.10 (!) will fix this sort of thing. It fixes it in a funny way, 
though: all annotations are treated as delayed-evaluation strings. :)

See https://www.python.org/dev/peps/pep-0563/ which now becomes the 
*default* behavior.

We do not gain access to this behavior at all, because it is exclusive 
to 3.7+. Boo.

For now, (and for the foreseeable future of the QEMU project, as Python 
3.7 support will not be available to us for many, many, many more years 
[1]) forward references in the global scope need to be quoted.

>>   
>> -def _make_tree(obj, ifcond, comment=None):
>> -    extra = {
>> -        'if': ifcond,
>> -        'comment': comment,
>> -    }
>> -    return (obj, extra)
>> +_NodeT = TypeVar('_NodeT', bound=TreeValue)
> 
> Can you teach me what NodeT is about?
> 

It's a TypeVar. If you're a TAPL sort of person, canonically you use 
T,U,V and so on. Relevant tutorial section for mypy is here: 
https://mypy.readthedocs.io/en/stable/generics.html

(Yes, a weird thing about Generics in Python is that you have to declare 
them. No, I don't know why. Yes, it's weird.)

I have bound it to TreeValue, indicating that this type variable may 
only *ever* represent something that isa TreeValue. Because of this, I 
use "NodeT" to indicate that it's a Generic type T, but with some 
constraint.

(Though, it really should have been bound to _value instead ... my 
mistake. I shouldn't allow for nested annotations ...!)

Using it allows me to define the Annotated class below in terms of some 
input parameter instead of a fixed, opaque type.

>> +
>> +
>> +class Annotated(Generic[_NodeT]):

Annotated here is defined as Annotated[T], but T is our special _NodeT, 
so Annotated may only hold other TreeValues*.

(* Again, as per above, this is an oopsie.)

>> +    """
>> +    Annotated generally contains a SchemaInfo-like type (as a dict),
>> +    But it also used to wrap comments/ifconds around scalar leaf values,
>> +    for the benefit of features and enums.
>> +    """
>> +    # Remove after 3.7 adds @dataclass:
> 
> Make this
> 
>         # TODO Remove after Python 3.7 ...
> 
> to give us a fighting chance to remember.
> 

Having done a lot of the python 2 excision work, I only ever grepped for 
e.g. "3.7" or "sys.version". I was targeting that.

Adding TODO seems fine enough to do, and I'm here anyway.

>> +    # pylint: disable=too-few-public-methods
>> +    def __init__(self, value: _NodeT, ifcond: Iterable[str],
>> +                 comment: Optional[str] = None):
> 
> Why not simply value: _value?
> 

This is what connects back with the Generic instantiation of this 
annotation. `class Annotated(Generic[_NodeT])` says that this class is a 
higher-kinded type parameterized on ... something. We don't know yet.

In the initializer, we use the TypeVar to describe which argument 
determines that parameterization.

>> +        self.value = value

That parameter flows down and connects to this property. Thus, this 
field actually has a dynamic type that will track the original type used 
to instantiate it. If it was a Dict, this will also be a Dict.

(Of course, it's limited to what mypy knows about the constraint of that 
value when passed. It isn't interrogated at runtime.)

This is a way to achieve dynamism in container-style classes without 
losing precision in data types. It allows us to declare and keep a more 
specific "inner type" that survives the boxing and unboxing process.

e.g. Annotated[Dict[str, object]] and Annotated[str] are two different 
types, and can be differentiated by mypy.

(*cough*, and yes, if you have a function that takes Annotated[Any], you 
lose that precision at that point. So, we aren't taking full advantage 
of that power here in introspect.py, but it still seemed like the 
"right" way to type something like this.)

>> +        self.comment: Optional[str] = comment
>> +        self.ifcond: Tuple[str, ...] = tuple(ifcond)
>>   
>>   
>>   def _tree_to_qlit(obj, level=0, suppress_first_indent=False):
>> @@ -67,24 +81,20 @@ def _tree_to_qlit(obj, level=0, suppress_first_indent=False):
>>       def indent(level):
>>           return level * 4 * ' '
>>   
>> -    if isinstance(obj, tuple):
>> -        ifobj, extra = obj
>> -        ifcond = extra.get('if')
>> -        comment = extra.get('comment')
>> -
>> +    if isinstance(obj, Annotated):
>>           # NB: _tree_to_qlit is called recursively on the values of a key:value
>>           # pair; those values can't be decorated with comments or conditionals.
>>           msg = "dict values cannot have attached comments or if-conditionals."
>>           assert not suppress_first_indent, msg
>>   
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
>> +        ret += _tree_to_qlit(obj.value, level, suppress_first_indent)
> 
> Why do you need to pass suppress_first_indent now?
> 

UH, technically I guess I don't. Holdover from when that was maybe not 
clear.

>> +        if obj.ifcond:
>> +            ret += '\n' + gen_endif(obj.ifcond)
>>           return ret
>>   
>>       ret = ''
>> @@ -201,7 +211,7 @@ def _use_type(self, typ):
>>   
>>       @staticmethod
>>       def _gen_features(features):
>> -        return [_make_tree(f.name, f.ifcond) for f in features]
>> +        return [Annotated(f.name, f.ifcond) for f in features]
>>   
>>       def _gen_tree(self, name, mtype, obj, ifcond, features):
>>           comment: Optional[str] = None
>> @@ -215,7 +225,7 @@ def _gen_tree(self, name, mtype, obj, ifcond, features):
>>           obj['meta-type'] = mtype
>>           if features:
>>               obj['features'] = self._gen_features(features)
>> -        self._trees.append(_make_tree(obj, ifcond, comment))
>> +        self._trees.append(Annotated(obj, ifcond, comment))
>>   
>>       def _gen_member(self, member):
>>           obj = {'name': member.name, 'type': self._use_type(member.type)}
>> @@ -223,7 +233,7 @@ def _gen_member(self, member):
>>               obj['default'] = None
>>           if member.features:
>>               obj['features'] = self._gen_features(member.features)
>> -        return _make_tree(obj, member.ifcond)
>> +        return Annotated(obj, member.ifcond)
>>   
>>       def _gen_variants(self, tag_name, variants):
>>           return {'tag': tag_name,
>> @@ -231,16 +241,17 @@ def _gen_variants(self, tag_name, variants):
>>   
>>       def _gen_variant(self, variant):
>>           obj = {'case': variant.name, 'type': self._use_type(variant.type)}
>> -        return _make_tree(obj, variant.ifcond)
>> +        return Annotated(obj, variant.ifcond)
>>   
>>       def visit_builtin_type(self, name, info, json_type):
>>           self._gen_tree(name, 'builtin', {'json-type': json_type}, [], None)
>>   
>>       def visit_enum_type(self, name, info, ifcond, features, members, prefix):
>> -        self._gen_tree(name, 'enum',
>> -                       {'values': [_make_tree(m.name, m.ifcond, None)
>> -                                   for m in members]},
>> -                       ifcond, features)
>> +        self._gen_tree(
>> +            name, 'enum',
>> +            {'values': [Annotated(m.name, m.ifcond) for m in members]},
>> +            ifcond, features
>> +        )
>>   
>>       def visit_array_type(self, name, info, ifcond, element_type):
>>           element = self._use_type(element_type)
>> @@ -257,12 +268,12 @@ def visit_object_type_flat(self, name, info, ifcond, features,
>>           self._gen_tree(name, 'object', obj, ifcond, features)
>>   
>>       def visit_alternate_type(self, name, info, ifcond, features, variants):
>> -        self._gen_tree(name, 'alternate',
>> -                       {'members': [
>> -                           _make_tree({'type': self._use_type(m.type)},
>> -                                      m.ifcond, None)
>> -                           for m in variants.variants]},
>> -                       ifcond, features)
>> +        self._gen_tree(name, 'alternate', {'members': [
> 
> I think I'd prefer another line break after 'alternate', to get
> {'members': align...
> 
>> +                Annotated({'type': self._use_type(m.type)}, m.ifcond)
>> +                for m in variants.variants
>> +            ]},
> 
> ... with ]}.
> 

How's about

```
self._gen_tree(
     name, 'alternate',
     {'members': [Annotated({'type': self._use_type(m.type)}, m.ifcond)
                  for m in variants.variants]},
     ifcond, features
)
```

(It'd look cooler if I re-arranged the other short parameters first, or 
I could create a temporary local. In-line objects with in-line 
comprehensions are bound to look sorta ugly. I'm going with what I wrote 
above for now, though.)

>> +            ifcond, features
>> +        )
>>   
>>       def visit_command(self, name, info, ifcond, features,
>>                         arg_type, ret_type, gen, success_response, boxed,

[1] Python 3.6 EOL is this December, but OpenSuSE Leap 15.2 was released 
2020-07-02 and only offers Python 3.6. Ouch! It is not clear if they 
will add support for Python 3.7 at any point, but otherwise we are stuck 
supporting 15.2 for two years after the next OpenSUSE is released, which 
hasn't happened yet. Ouch!!! So we don't even have a date on the tin for 
when we might conceivably inch up our requirements again.

I think the situation for RHEL and Debian is also sad, IIRC.


