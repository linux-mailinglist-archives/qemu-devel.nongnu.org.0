Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3FD349B3F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 21:51:20 +0100 (CET)
Received: from localhost ([::1]:37334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPWwp-0001Fg-2Y
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 16:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPWui-0000mT-6m
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 16:49:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPWue-0002QQ-CX
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 16:49:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616705342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=63t1ss4GvozKDoRhMgicEPT6yxnYUlgXLEeg9PZfqyM=;
 b=ePW5Kq3ArPmNPFw/B8pYga+JmTiigbYiq7KyxIcHEZLIZqL91AU5Tl5OAf3uL7+fFn3/9M
 +tdQS4wET04HZ/XhKlOEXdYNWI/COJcQM/2RSeJn889Doj+3US7PHIN/uycgBlzt/X01ew
 pZhAiZbZfwCsKYRx0I60iY0Bx2jk9qM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-uLQNWvZXM4uJGRkmxiQ0FQ-1; Thu, 25 Mar 2021 16:48:59 -0400
X-MC-Unique: uLQNWvZXM4uJGRkmxiQ0FQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F9F4180FCA6;
 Thu, 25 Mar 2021 20:48:58 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DB9261F49;
 Thu, 25 Mar 2021 20:48:57 +0000 (UTC)
Subject: Re: [PATCH v4 05/19] qapi/expr.py: constrain incoming expression types
To: Markus Armbruster <armbru@redhat.com>
References: <20210325060356.4040114-1-jsnow@redhat.com>
 <20210325060356.4040114-6-jsnow@redhat.com>
 <871rc3tjlt.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <a2e23408-1885-3ce1-8328-47f5d837971c@redhat.com>
Date: Thu, 25 Mar 2021 16:48:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <871rc3tjlt.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/21 10:04 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> mypy does not know the types of values stored in Dicts that masquerade
>> as objects. Help the type checker out by constraining the type.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/expr.py | 26 +++++++++++++++++++++++---
>>   1 file changed, 23 insertions(+), 3 deletions(-)
>>
>> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>> index b4bbcd54c0..b75c85c160 100644
>> --- a/scripts/qapi/expr.py
>> +++ b/scripts/qapi/expr.py
>> @@ -15,9 +15,18 @@
>>   # See the COPYING file in the top-level directory.
>>   
>>   import re
>> +from typing import Dict, Optional
>>   
>>   from .common import c_name
>>   from .error import QAPISemError
>> +from .parser import QAPIDoc
>> +from .source import QAPISourceInfo
>> +
>> +
>> +# Deserialized JSON objects as returned by the parser;
>> +# The values of this mapping are not necessary to exhaustively type
> 
> Not necessary and also not practical with current mypy.  Correct?
> 

Neither necessary nor practical. Typing as 'object' guarantees that 
these values will never be used in a manner not supported by all python 
objects. Mypy does not complain, so we know that we don't misuse the type.

This is helpful for proving the validity of the expr.py validator 
itself: we know that we are not forgetting to perform type narrowing and 
using the value contained therein inappropriately.

Adding a more exhaustive typing here is impractical (for reasons we 
learned during introspect.py), but also provides no benefit to the 
static analysis here anyway.

(None of the functions written here *assume* the shape of the structure, 
so there are no functions that benefit from having a more laboriously 
specified type.)

If the comment needs more work, suggest away -- I tried to follow our 
last discussion here as best as I was able.

>> +# here, because the purpose of this module is to interrogate that type.
>> +_JSONObject = Dict[str, object]
>>   
>>   
>>   # Names consist of letters, digits, -, and _, starting with a letter.
>> @@ -315,9 +324,20 @@ def check_event(expr, info):
>>   
>>   def check_exprs(exprs):
>>       for expr_elem in exprs:
>> -        expr = expr_elem['expr']
>> -        info = expr_elem['info']
>> -        doc = expr_elem.get('doc')
>> +        # Expression
>> +        assert isinstance(expr_elem['expr'], dict)
> 
> I dislike relaxing OrderedDict to dict here.  I'm going to accept it
> anyway, because the difference between the two is going away in 3.7, and
> because so far order actually matters only in certain sub-expressions,
> not top-level expressions.
> 

Right, there is a semantic piece of information missing from this type.

You've asked if we care if we ditch OrderedDict and claim that we only 
support CPython -- I don't know. I assume nobody uses anything else, but 
I sincerely don't know. My hunch is that I really doubt it, but I don't 
see a reason to complicate ./configure et al and don't think it needs to 
be messed with.

I am content with leaving OrderedDict in parser.py, but it does make it 
easier for me to play with the pieces to not impose a constraint on a 
specific *type name* and there is no way (that I am presently aware of) 
to write a type constraint on just the semantic information that the 
keys are ordered.

The largest loss I am aware of here is that a newcomer to this file *may 
not know* that these keys are ordered, however, the order of the keys in 
and of itself has no impact on the operation of expr.py itself, so I am 
not sure if it is necessary to repeat that fact for a theoretical 
visitor here. parser.py of course still uses OrderedDict and will 
continue to do so for the forseeable future.

"Why bother relaxing the type at all, then?"

Strictly it makes life easier for me, because I am experimenting with 
different validation backends, different parsers, and so on.

Can I just patch it out in every branch I want to play with these 
changes? I could, yes.

I am asking for a favor in exchange for my continued diligence in adding 
documentation and static time type analysis to a critical component used 
for generating the API interface for QEMU.

>> +        for key in expr_elem['expr'].keys():
>> +            assert isinstance(key, str)
>> +        expr: _JSONObject = expr_elem['expr']
>> +
>> +        # QAPISourceInfo
>> +        assert isinstance(expr_elem['info'], QAPISourceInfo)
>> +        info: QAPISourceInfo = expr_elem['info']
>> +
>> +        # Optional[QAPIDoc]
>> +        tmp = expr_elem.get('doc')
>> +        assert tmp is None or isinstance(tmp, QAPIDoc)
>> +        doc: Optional[QAPIDoc] = tmp
>>   
>>           if 'include' in expr:
>>               continue
> 
> I see you didn't bite on the idea to do less checking here.  Okay.
> 

Almost all of this goes away in part 5, because I add a typed structure 
that parser returns and we no longer have to do the runtime type 
narrowing here as a result.

I started to shift things around a bit here, but it'll just cause more 
work to rebase it again anyway, so I left it alone. I did reorder one of 
the other checks here, but wound up leaving this one alone.

(I will admit to liking the assertion in the interim because it 
convinced me I was on terra-firma. Through all of the rebase churn, some 
more brain-dead looking bits help keep my expectations tethered to the 
current reality.)


