Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9AA3258B4
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 22:35:59 +0100 (CET)
Received: from localhost ([::1]:38574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFOIg-0005An-7P
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 16:35:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lFOH4-0004Et-QZ
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 16:34:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lFOH0-0000bJ-Ck
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 16:34:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614288848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OfKN+4ePLLujTIhS/BbgCUhnEKAMynDAVe4aOyk0+1w=;
 b=eNDLd8+kLFDMOOjka+nWIto7SGJ8VLsHehxYlCuTMUoxhKRx5B6iYV0LYcAfc60+D00fHM
 85bzsNhHkSJwQ4GHRw9RyMq+7rkdOXDhtgVsPN2GCY0lgBy3mj6YZhjkE0CucjPBToOZ0M
 HTt16IbYnq+kWJwZP7PEuQ3d9qYMi8Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-jCWHq0UFP7-VfdQF0BhaHQ-1; Thu, 25 Feb 2021 16:34:06 -0500
X-MC-Unique: jCWHq0UFP7-VfdQF0BhaHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 984D76D4E6;
 Thu, 25 Feb 2021 21:34:05 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA26C5D9D2;
 Thu, 25 Feb 2021 21:34:04 +0000 (UTC)
Subject: Re: [PATCH v3 09/16] qapi/expr.py: Consolidate check_if_str calls in
 check_if
To: Markus Armbruster <armbru@redhat.com>
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-10-jsnow@redhat.com>
 <87a6rsb50a.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <0b9b080e-afda-ed57-7dc8-62d0b12c77a2@redhat.com>
Date: Thu, 25 Feb 2021 16:34:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87a6rsb50a.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

On 2/25/21 9:23 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> This is a small rewrite to address some minor style nits.
>>
>> Don't compare against the empty list to check for the empty condition, and
>> move the normalization forward to unify the check on the now-normalized
>> structure.
>>
>> With the check unified, the local nested function isn't needed anymore
>> and can be brought down into the normal flow of the function. With the
>> nesting level changed, shuffle the error strings around a bit to get
>> them to fit in 79 columns.
>>
>> Note: though ifcond is typed as Sequence[str] elsewhere, we *know* that
>> the parser will produce real, bona-fide lists. It's okay to check
>> isinstance(ifcond, list) here.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/expr.py | 36 ++++++++++++++++--------------------
>>   1 file changed, 16 insertions(+), 20 deletions(-)
>>
>> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>> index df6c64950fa..3235a3b809e 100644
>> --- a/scripts/qapi/expr.py
>> +++ b/scripts/qapi/expr.py
>> @@ -128,30 +128,26 @@ def check_flags(expr: Expression, info: QAPISourceInfo) -> None:
>>   
>>   def check_if(expr: _JSObject, info: QAPISourceInfo, source: str) -> None:
>>   
>> -    def check_if_str(ifcond: object) -> None:
>> -        if not isinstance(ifcond, str):
>> -            raise QAPISemError(
>> -                info,
>> -                "'if' condition of %s must be a string or a list of strings"
>> -                % source)
>> -        if ifcond.strip() == '':
>> -            raise QAPISemError(
>> -                info,
>> -                "'if' condition '%s' of %s makes no sense"
>> -                % (ifcond, source))
>> -
>>       ifcond = expr.get('if')
>>       if ifcond is None:
>>           return
>> -    if isinstance(ifcond, list):
>> -        if ifcond == []:
>> +
>> +    # Normalize to a list
>> +    if not isinstance(ifcond, list):
>> +        ifcond = [ifcond]
>> +        expr['if'] = ifcond
>> +
>> +    if not ifcond:
>> +        raise QAPISemError(info, f"'if' condition [] of {source} is useless")
> 
> In the old code, the connection between the conditional and the error
> message was a bit more obvious.
> 

I will admit to that being true.

Do you think it's still worth the change? I do need to get rid of the 
comparison against "[]", the rest was just "Ah, while I'm here, ..." and 
I thought it was nice to get rid of the nested function.

(I think it's still worth it.)

>> +
>> +    for element in ifcond:
> 
> @element is rather long.  If you hate @elt, what about @ifc?
> 

Hate's a strong word, It just wasn't obvious to me at the time. I 
decided to expand it to what you said it stood for.

I can undo that if you are attached to 'elt', but I don't share the view 
that 'element' is somehow burdensomely long.

>> +        if not isinstance(element, str):
>> +            raise QAPISemError(info, (
>> +                f"'if' condition of {source}"
>> +                " must be a string or a list of strings"))
>> +        if element.strip() == '':
>>               raise QAPISemError(
>> -                info, "'if' condition [] of %s is useless" % source)
>> -        for elt in ifcond:
>> -            check_if_str(elt)
>> -    else:
>> -        check_if_str(ifcond)
>> -        expr['if'] = [ifcond]
>> +                info, f"'if' condition '{element}' of {source} makes no sense")
>>   
>>   
>>   def normalize_members(members: object) -> None:
> 
> Perhaps:
> 
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index df6c64950f..e904924599 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -128,30 +128,26 @@ def check_flags(expr: Expression, info: QAPISourceInfo) -> None:
>   
>   def check_if(expr: _JSObject, info: QAPISourceInfo, source: str) -> None:
>   
> -    def check_if_str(ifcond: object) -> None:
> -        if not isinstance(ifcond, str):
> -            raise QAPISemError(
> -                info,
> -                "'if' condition of %s must be a string or a list of strings"
> -                % source)
> -        if ifcond.strip() == '':
> -            raise QAPISemError(
> -                info,
> -                "'if' condition '%s' of %s makes no sense"
> -                % (ifcond, source))
> -
>       ifcond = expr.get('if')
>       if ifcond is None:
>           return
> +
>       if isinstance(ifcond, list):
>           if ifcond == []:

Should be "if not ifcond", though I suppose pylint does not actually 
whine about this. Guido lives in my head rent-free.

>               raise QAPISemError(
>                   info, "'if' condition [] of %s is useless" % source)
> -        for elt in ifcond:
> -            check_if_str(elt)
>       else:
> -        check_if_str(ifcond)
> -        expr['if'] = [ifcond]
> +        # Normalize to a list
> +        ifcond = expr['if'] = [ifcond]

You know, I didn't actually know this worked in Python, because I didn't 
think "x = 3" was an expression that had a value. I thought that was the 
entire reason they added the := operator in Python 3.8.

Neat, I guess.

> +
> +    for elt in ifcond:
> +        if not isinstance(elt, str):
> +            raise QAPISemError(info, (
> +                f"'if' condition of {source}"
> +                " must be a string or a list of strings"))
> +        if elt.strip() == '':
> +            raise QAPISemError(
> +                info, f"'if' condition '{elt}' of {source} makes no sense")
>   
>   
>   def normalize_members(members: object) -> None:
> 
> 
> Bonus: slightly less churn.
> 

Looks OK, I'll test with it.


