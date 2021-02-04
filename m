Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B4C30F7CA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 17:28:49 +0100 (CET)
Received: from localhost ([::1]:34716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7hUq-0003Tp-T4
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 11:28:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7hNO-0005Sf-Qg
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:21:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7hNK-000454-Tq
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:21:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612455657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qK1/RCTsD0n/mkJWTAuC6fzy3GxAICPpud0x4USovmc=;
 b=jFUC7mUgcQ4JQ46zL8kR/8o9a1viI7LeeUe7itMozjG9nbbvTPQCUJuukHMhCRumez8qJX
 vkTr60yor2CZTKL3vhN0sbs+GrxPnm9L7HVwp2SQinI3qTZL2NWn1Zww3D4/k3WG0yRnQq
 CJ+LpksxH207NVnpep+OrBIZfZFkwD0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255--qM6dMNxNBODco3ki54EBA-1; Thu, 04 Feb 2021 11:20:51 -0500
X-MC-Unique: -qM6dMNxNBODco3ki54EBA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE6CE8030B3;
 Thu,  4 Feb 2021 16:20:49 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3655D60BF1;
 Thu,  4 Feb 2021 16:20:49 +0000 (UTC)
Subject: Re: [PATCH v4 08/14] qapi/introspect.py: create a typed 'Annotated'
 data strutcure
To: Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20210202174651.2274166-1-jsnow@redhat.com>
 <20210202174651.2274166-9-jsnow@redhat.com>
 <878s85tdh3.fsf@dusky.pond.sub.org> <20210203215026.GB126021@habkost.net>
 <87a6sjdet2.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <77cc0262-3192-130f-81d8-a72193bf1020@redhat.com>
Date: Thu, 4 Feb 2021 11:20:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87a6sjdet2.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 10:37 AM, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
>> On Wed, Feb 03, 2021 at 03:47:36PM +0100, Markus Armbruster wrote:
>>> John Snow <jsnow@redhat.com> writes:
>>>
>>>> Presently, we use a tuple to attach a dict containing annotations
>>>> (comments and compile-time conditionals) to a tree node. This is
>>>> undesirable because dicts are difficult to strongly type; promoting it
>>>> to a real class allows us to name the values and types of the
>>>> annotations we are expecting.
>>>>
>>>> In terms of typing, the Annotated<T> type serves as a generic container
>>>> where the annotated node's type is preserved, allowing for greater
>>>> specificity than we'd be able to provide without a generic.
>>>>
>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>> [...]
>>>> +class Annotated(Generic[_NodeT]):
>>>> +    """
>>>> +    Annotated generally contains a SchemaInfo-like type (as a dict),
>>>> +    But it also used to wrap comments/ifconds around scalar leaf values,
>>>> +    for the benefit of features and enums.
>>>> +    """
>>>> +    # Remove after 3.7 adds @dataclass:
>>>
>>> Make this
>>>
>>>         # TODO Remove after Python 3.7 ...
>>>
>>> to give us a fighting chance to remember.
>>>
>>>> +    # pylint: disable=too-few-public-methods
>>>> +    def __init__(self, value: _NodeT, ifcond: Iterable[str],
>>>> +                 comment: Optional[str] = None):
>>>
>>> Why not simply value: _value?
>>
>> Example:
>>    x = C(1)
>>    y: C[int]
>>    y = C('x')  # mistake
>>
>> Declaring value as _NodeT does:
>> - Make the inferred type of x be Annotated[int].
>> - Catch the mistake above.
> 
> I smell overengineering.  I may well be wrong.
> 
> Without doubt, there are uses for using the type system for keeping
> SomeGenericType[SomeType] and SomeGenericType[AnotherType] apart.
> 
> But what do we gain by keeping the Annotated[T] for the possible T
> apart?
> 
> _tree_to_qlit() doesn't care: it peels off the wrapper holding ifcond
> and comment, and recurses for the JSON so wrapped.  Regardless of what
> was wrapped, i.e. what kind of T we got.
> 
> Heck, it works just fine even if you wrap your JSON multiple times.  It
> doesn't give a hoot whether that makes sense.  Making sense is the
> caller's business.
> 
> So what does care?
> 
> Or am I simply confused?
> 
> 
> PS: As far as I can tell, _tree_to_qlit() doesn't give a hoot whether a
> dictionary's values are wrapped, either.
> 

You're right that it offers no necessary power to the automated 
checking, I cede as much in my other replies to you.

(1) I hope the explanation was helpful, because the technique will 
return for structures like QAPISchemaMember where it does become more 
obviously useful to disambiguate the wrapped types.

(2) It still has a notational benefit to the human for documentation and 
IDE purposes, e.g. at the end of this series:

```
self._trees: List[Annotated[SchemaInfo]] = []
```

That's nice! It tells us exactly what's in there.

Does it work if I dumb it down to just:

```
self.trees: List[AnnotatedThingy] = []
```

Yes, but it's worse to the human and the IDE both. I consider type hints 
as serving a dual purpose; both provability and declaration of intent.

--js


