Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DED62DC5C2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:55:19 +0100 (CET)
Received: from localhost ([::1]:54570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpb1B-0007IC-Sv
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:55:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpazd-0006Hq-Nn
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:53:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpazZ-00053W-Hg
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:53:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608141216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQqQoXu1znNQE6GTCwWeD1gp6pQ9piVz/xMRYp+YPPQ=;
 b=AW+AZVgK2tKVFwuw46QNHXYuPept79EukMwzjqXhZGyec/OYo0m7/BVn78svMTzBEwqCQM
 /KcqyQF0Ia7G36WXZvgBEE0Ub0rn8hifuIcPCaEy00V1mG7/z84CYWFfcLpS2o+SZ7j4zD
 2Fia6kEuQun4Weu7p11y4BJFlI7na1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-9X1QXrQNNX2VtqVUgW0-jQ-1; Wed, 16 Dec 2020 12:53:34 -0500
X-MC-Unique: 9X1QXrQNNX2VtqVUgW0-jQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E19AE8030B0
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 17:53:33 +0000 (UTC)
Received: from [10.10.120.103] (ovpn-120-103.rdu2.redhat.com [10.10.120.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0AE0918993;
 Wed, 16 Dec 2020 17:53:29 +0000 (UTC)
Subject: Re: [PATCH 06/12] qapi/source: Add builtin null-object sentinel
To: Markus Armbruster <armbru@redhat.com>
References: <20201214235327.1007124-1-jsnow@redhat.com>
 <20201214235327.1007124-7-jsnow@redhat.com>
 <87r1nqrtp7.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <d8f468e9-a17d-6ff7-4cf1-369085d8edd3@redhat.com>
Date: Wed, 16 Dec 2020 12:53:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <87r1nqrtp7.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 4:22 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> We use None to represent an object that has no source information
>> because it's a builtin. This complicates interface typing, since many
>> interfaces expect that there is an info object available to print errors
>> with.
>>
>> Introduce a special QAPISourceInfo that represents these built-ins so
>> that if an error should so happen to occur relating to one of these
>> builtins that we will be able to print its information, and interface
>> typing becomes simpler: you will always have a source info object.
> 
> Two aspects mixed up:
> 
> 1. Represent "no source info" as special QAPISourceInfo instead of
>     None
> 
>     This is what de-complicates interface typing.
> 

Yup.

> 2. On error with "no source info", don't crash.
> 
>     I have my doubts on this one.
> 
>     Such an error means the QAPI code generator screwed up, at least in
>     theory.  Crashing is only proper.  It gets the screwup fixed.
> 
>     In practice, errors due to interactions between built-in stuff and
>     user-defined stuff could conceivably escape testing.  I can't
>     remember such a case offhand.
> 
>     Will the "no source info" error be more useful than a crash?
>     Possibly.  Will it get the screwup fixed?  Maybe not.
> 
> Can we separate the two aspects?
> 

We can add an intentional assertion, if you'd like, that makes such 
cases obvious -- but if we are already in the error printer, QAPI is 
likely already in the process of crashing and printing an error.

So, Is this really an issue?

>>
>> This object will evaluate as False, so "if info" is a valid idiomatic
>> construct.
> 
> Suggest s/is a valid/remains a valid/.
> 
> Not 100% sure we'll want to keep this idiom, but now is not the time to
> worry about that.
> 

OK.

>>
>> NB: It was intentional to not allow empty constructors or similar to
>> create "empty" source info objects; callers must explicitly invoke
>> 'builtin()' to pro-actively opt into using the sentinel. This should
>> prevent use-by-accident.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/source.py | 20 +++++++++++++++++++-
>>   1 file changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/qapi/source.py b/scripts/qapi/source.py
>> index d7a79a9b8aee..64af7318cb67 100644
>> --- a/scripts/qapi/source.py
>> +++ b/scripts/qapi/source.py
>> @@ -11,7 +11,12 @@
>>   
>>   import copy
>>   import sys
>> -from typing import List, Optional, TypeVar
>> +from typing import (
>> +    List,
>> +    Optional,
>> +    Type,
>> +    TypeVar,
>> +)
>>   
>>   
>>   class QAPISchemaPragma:
>> @@ -41,6 +46,17 @@ def __init__(self, fname: str, line: int,
>>           self.defn_meta: Optional[str] = None
>>           self.defn_name: Optional[str] = None
>>   
>> +    @classmethod
>> +    def builtin(cls: Type[T]) -> T:
>> +        """
>> +        Create a SourceInfo object corresponding to a builtin definition.
> 
> Let's spell it built-in for consistency with existing comments.
> 
> Could perhaps shorten "a SourceInfo object" to "an instance".
> 

OK.

>> +        """
>> +        return cls('', -1, None)
> 
> No users?  Peeking ahead... aha, they are in Patch 08.  Any particular
> reason for putting PATCH 07 between the two?  Could PATCH 08 be squashed
> into this one?
> 

Too much soup in one pot: this patch highlights the "trick" and the 
subsequent patch shows the adoption of it. Seemed safe.

Goofy ordering, though. I've pushed the genc/genh patch downwards 
instead; you can squash them on commit if you'd like.

>> +
>> +    def __bool__(self) -> bool:
>> +        # "if info: ..." is false if info is the builtin sentinel.
>> +        return bool(self.fname)
> 
> Nitpicking...  "The builtin sentinel" suggests there is just one.  PATCH
> 08 creates several.  I don't mind, but let's say something like "if
> @info corresponds to a built-in definition".
> 

Fair enough. I don't mind nitpicks on comments and docstrings so much if 
it helps make things clearer for more people.

(And they don't cause me rebase pain as much as other nitpicks ;)

>> +
>>       def set_defn(self, meta: str, name: str) -> None:
>>           self.defn_meta = meta
>>           self.defn_name = name
>> @@ -73,4 +89,6 @@ def include_path(self) -> str:
>>           return ret
>>   
>>       def __str__(self) -> str:
>> +        if not bool(self):
>> +            return '[builtin]'
>>           return self.include_path() + self.in_defn() + self.loc()
> 
> Looks like we can separate the two aspects easily:
> 
>         def __str__(self) -> str:
>    +        assert not bool(self)
>             return self.include_path() + self.in_defn() + self.loc()
> 

Feels like abusing __str__ to prevent application logic we don't like 
elsewhere and unrelated to this class; I am still leaning on "If we are 
printing this, it's likely we're already crashing" unless you have news 
to the contrary for me.


