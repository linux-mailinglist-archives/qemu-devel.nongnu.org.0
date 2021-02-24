Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 047C33246CF
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 23:26:36 +0100 (CET)
Received: from localhost ([::1]:36354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF2c7-0003Vn-IU
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 17:26:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lF2aK-0002yo-W7
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:24:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lF2aH-0004Hk-Ne
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:24:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614205476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hivRdI2B8yYXyCTS/Dtz2ijLrXqfBd9iPZw+NvYXeGs=;
 b=YxLH2D6iKVq0Q1Rg0XOPqve1nTbvOUhL8WhIvpDjz/TlSogn/pq35FfRezrM4XyIlGCYG4
 gEnAqSKMW8JjueH8ZYaWlvvZzf58G+fn7h7mnSn/5L60RKx7QdQT3NUiv7ntuZs5cg+sMz
 HsN8STBSP6HbJSHr8H5UxjW/2Fr2JOE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-tKmeHHLkMAqnOI1cosYP5w-1; Wed, 24 Feb 2021 17:24:33 -0500
X-MC-Unique: tKmeHHLkMAqnOI1cosYP5w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 260EE18C35BD;
 Wed, 24 Feb 2021 22:24:32 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79E3860BE5;
 Wed, 24 Feb 2021 22:24:31 +0000 (UTC)
Subject: Re: [PATCH v3 07/16] qapi/expr.py: Add casts in a few select cases
To: Markus Armbruster <armbru@redhat.com>
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-8-jsnow@redhat.com>
 <87zgzt1w9w.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <9b9b1b1d-1988-2bbd-4f6e-6374ebd3cd88@redhat.com>
Date: Wed, 24 Feb 2021 17:24:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87zgzt1w9w.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

On 2/24/21 7:32 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> Casts are instructions to the type checker only, they aren't "safe" and
>> should probably be avoided in general. In this case, when we perform
>> type checking on a nested structure, the type of each field does not
>> "stick".
>>
>> We don't need to assert that something is a str if we've already checked
>> that it is -- use a cast instead for these cases.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>> Reviewed-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>   scripts/qapi/expr.py | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>> index afa6bd07769..f45d6be1f4c 100644
>> --- a/scripts/qapi/expr.py
>> +++ b/scripts/qapi/expr.py
>> @@ -15,7 +15,7 @@
>>   # See the COPYING file in the top-level directory.
>>   
>>   import re
>> -from typing import MutableMapping, Optional
>> +from typing import MutableMapping, Optional, cast
>>   
>>   from .common import c_name
>>   from .error import QAPISemError
>> @@ -232,7 +232,7 @@ def check_enum(expr, info):
>>   
>>   
>>   def check_struct(expr, info):
>> -    name = expr['struct']
>> +    name = cast(str, expr['struct'])  # Asserted in check_exprs
>>       members = expr['data']
>>   
> 
> I believe you need this only so you can declare check_type()'s
> allow_dict to be Optional[str].  More busy-work around allow_dict...
> 
> I'm tempted to ask for allow_dict: Any and call it a day.
> 

You're right, this is because of the signature for the allow_dict 
argument. Ultimately, the pragma is a collection of strings and we need 
to prove we are looking up a string somewhere or other.

(Or tell the type checker to leave us alone.)

Unfortunately, the "check" in check_exprs falls off almost immediately. 
Working with dictly-typed objects is a little annoying for this reason.

This works for now; but finding a better way to do the pragma checks is 
probably the more correct thing. (And not something I really want to try 
and get through review until we're done typing, I think.)

>>       check_type(members, info, "'data'", allow_dict=name)
>> @@ -240,7 +240,7 @@ def check_struct(expr, info):
>>   
>>   
>>   def check_union(expr, info):
>> -    name = expr['union']
>> +    name = cast(str, expr['union'])  # Asserted in check_exprs
>>       base = expr.get('base')
>>       discriminator = expr.get('discriminator')
>>       members = expr['data']
> 
> Likwewise.
> 
>> @@ -337,7 +337,7 @@ def check_exprs(exprs):
>>           else:
>>               raise QAPISemError(info, "expression is missing metatype")
>>   
>> -        name = expr[meta]
>> +        name = cast(str, expr[meta])  # Asserted right below:
> 
> "Checked", not "asserted".
> 

Oh, yes.

>>           check_name_is_str(name, info, "'%s'" % meta)
>>           info.set_defn(meta, name)
>>           check_defn_name_str(name, info, meta)
> 
> 
> Cast before check gives me a queasy feeling.  It's lying to the type
> checker.
> 
> Hamfisted way to avoid lying:
> 
>             check_name_is_str(expr[meta], ...)
>             name = cast(str, expr[meta])
> 
> Something like
> 
>             name = check_name_is_str(name, ...)
> 
> might be neater, but then we'd have to find a better function name.
> 

OK, I'll look into re-ordering this.


