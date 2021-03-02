Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96518329659
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 07:03:50 +0100 (CET)
Received: from localhost ([::1]:41812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGy8L-0004Wd-JJ
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 01:03:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lGy2W-0005ms-Cu
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 00:57:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lGy2U-0003Gv-Bg
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 00:57:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614664665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xw/B0/L/IO2PvJ+s1KJph5wj8FMNXaBM4/XZwTGILJQ=;
 b=bOJ6K+Yz0I+cXeGBW7qYMw1zM1XVZuKg7kfDojwmXr6T7X8JOYdb7h8JplCPXr/j+gDoe+
 guKhjMm4Hzng1XatUVbZKwH8Qbz/VRsv7O3x/QaTU8/VVGMemlfwcSX4R960a/12+L03cu
 OIz9iGKoIYXLd7DCmdxyqM0cYi+mnEc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-hn071yzRNoKO2mQXlu_tKg-1; Tue, 02 Mar 2021 00:57:44 -0500
X-MC-Unique: hn071yzRNoKO2mQXlu_tKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB4B4803F48;
 Tue,  2 Mar 2021 05:57:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BD315C737;
 Tue,  2 Mar 2021 05:57:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 148CA113860F; Tue,  2 Mar 2021 06:57:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 09/16] qapi/expr.py: Consolidate check_if_str calls
 in check_if
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-10-jsnow@redhat.com>
 <87a6rsb50a.fsf@dusky.pond.sub.org>
 <0b9b080e-afda-ed57-7dc8-62d0b12c77a2@redhat.com>
Date: Tue, 02 Mar 2021 06:57:40 +0100
In-Reply-To: <0b9b080e-afda-ed57-7dc8-62d0b12c77a2@redhat.com> (John Snow's
 message of "Thu, 25 Feb 2021 16:34:04 -0500")
Message-ID: <87pn0im71n.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 2/25/21 9:23 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> This is a small rewrite to address some minor style nits.
>>>
>>> Don't compare against the empty list to check for the empty condition, and
>>> move the normalization forward to unify the check on the now-normalized
>>> structure.
>>>
>>> With the check unified, the local nested function isn't needed anymore
>>> and can be brought down into the normal flow of the function. With the
>>> nesting level changed, shuffle the error strings around a bit to get
>>> them to fit in 79 columns.
>>>
>>> Note: though ifcond is typed as Sequence[str] elsewhere, we *know* that
>>> the parser will produce real, bona-fide lists. It's okay to check
>>> isinstance(ifcond, list) here.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> ---
>>>   scripts/qapi/expr.py | 36 ++++++++++++++++--------------------
>>>   1 file changed, 16 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>>> index df6c64950fa..3235a3b809e 100644
>>> --- a/scripts/qapi/expr.py
>>> +++ b/scripts/qapi/expr.py
>>> @@ -128,30 +128,26 @@ def check_flags(expr: Expression, info: QAPISourceInfo) -> None:
>>>   
>>>   def check_if(expr: _JSObject, info: QAPISourceInfo, source: str) -> None:
>>>   
>>> -    def check_if_str(ifcond: object) -> None:
>>> -        if not isinstance(ifcond, str):
>>> -            raise QAPISemError(
>>> -                info,
>>> -                "'if' condition of %s must be a string or a list of strings"
>>> -                % source)
>>> -        if ifcond.strip() == '':
>>> -            raise QAPISemError(
>>> -                info,
>>> -                "'if' condition '%s' of %s makes no sense"
>>> -                % (ifcond, source))
>>> -
>>>       ifcond = expr.get('if')
>>>       if ifcond is None:
>>>           return
>>> -    if isinstance(ifcond, list):
>>> -        if ifcond == []:
>>> +
>>> +    # Normalize to a list
>>> +    if not isinstance(ifcond, list):
>>> +        ifcond = [ifcond]
>>> +        expr['if'] = ifcond
>>> +
>>> +    if not ifcond:
>>> +        raise QAPISemError(info, f"'if' condition [] of {source} is useless")
>> 
>> In the old code, the connection between the conditional and the error
>> message was a bit more obvious.
>> 
>
> I will admit to that being true.
>
> Do you think it's still worth the change? I do need to get rid of the 
> comparison against "[]", the rest was just "Ah, while I'm here, ..." and 
> I thought it was nice to get rid of the nested function.
>
> (I think it's still worth it.)
>
>>> +
>>> +    for element in ifcond:
>> 
>> @element is rather long.  If you hate @elt, what about @ifc?
>> 
>
> Hate's a strong word, It just wasn't obvious to me at the time. I 
> decided to expand it to what you said it stood for.
>
> I can undo that if you are attached to 'elt', but I don't share the view 
> that 'element' is somehow burdensomely long.

I like my loop control variables *short*.

@elt is short.  It's also inexpressive.  That's why I offered @ifc as an
alternative.  I believe "for ifc in ifcond" reads fine.  The abbreviation
is obvious.

@element isn't short, and just as inexpressive as @elt.  It pushes one
line right to PEP 8's length limit.

>>> +        if not isinstance(element, str):
>>> +            raise QAPISemError(info, (
>>> +                f"'if' condition of {source}"
>>> +                " must be a string or a list of strings"))
>>> +        if element.strip() == '':
>>>               raise QAPISemError(
>>> -                info, "'if' condition [] of %s is useless" % source)
>>> -        for elt in ifcond:
>>> -            check_if_str(elt)
>>> -    else:
>>> -        check_if_str(ifcond)
>>> -        expr['if'] = [ifcond]
>>> +                info, f"'if' condition '{element}' of {source} makes no sense")
>>>   
>>>   
>>>   def normalize_members(members: object) -> None:
>> 
>> Perhaps:
>> 
>> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>> index df6c64950f..e904924599 100644
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
>> +
>>       if isinstance(ifcond, list):
>>           if ifcond == []:
>
> Should be "if not ifcond", though I suppose pylint does not actually 
> whine about this. Guido lives in my head rent-free.

I guess it doesn't whine because it doesn't take context into account.

Where @ifcond could be anything, "ifcond == []" and "not ifcond" are not
the same, and a whine could well be a false positive.

Here, @ifcond can only be list, so the two are the same.

Squashing in the style cleanup should be okay.

>>               raise QAPISemError(
>>                   info, "'if' condition [] of %s is useless" % source)
>> -        for elt in ifcond:
>> -            check_if_str(elt)
>>       else:
>> -        check_if_str(ifcond)
>> -        expr['if'] = [ifcond]
>> +        # Normalize to a list
>> +        ifcond = expr['if'] = [ifcond]
>
> You know, I didn't actually know this worked in Python, because I didn't 
> think "x = 3" was an expression that had a value.

It's not!

Section 7.2. Assignment statements:

    assignment_stmt ::=  (target_list "=")+ (starred_expression | yield_expression)

Note the +.  Further down:

    An assignment statement evaluates the expression list [...] and
    assigns the single resulting object to each of the target lists,
    from left to right.

>                                                   I thought that was the 
> entire reason they added the := operator in Python 3.8.

Statements are stupid.  The list of languages that failed to learn from
Lisp is long.  Python is on the list of languages that are still
learning from Lisp ;)

> Neat, I guess.
>
>> +
>> +    for elt in ifcond:
>> +        if not isinstance(elt, str):
>> +            raise QAPISemError(info, (
>> +                f"'if' condition of {source}"
>> +                " must be a string or a list of strings"))
>> +        if elt.strip() == '':
>> +            raise QAPISemError(
>> +                info, f"'if' condition '{elt}' of {source} makes no sense")
>>   
>>   
>>   def normalize_members(members: object) -> None:
>> 
>> 
>> Bonus: slightly less churn.
>> 
>
> Looks OK, I'll test with it.


