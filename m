Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D16B43245F4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 22:48:12 +0100 (CET)
Received: from localhost ([::1]:45432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF20x-0000Uy-J8
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 16:48:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lF1zO-0008Qn-SJ
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 16:46:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lF1zM-0003XT-Gs
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 16:46:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614203190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qDBaInQoI294fzyw0jMWrPWMFfFpYJMOjZ6nrTJckxw=;
 b=aYZgERsnYCnUEQNGHX0RwU9ye+knYBfV/Jd9EnIxxmFvTgA18bygKm1JiufUwILjoNsvtn
 HMCIHvdDJuSV2GGdn6DGrHq/+k0bhZhZmp8c4vVfKWiwCfuUVaStNLLzPfg9MvTv7fJxD5
 8svtFXEz7XLzGIfB+gRbAct4TjhOlQE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-xxkBzi2oOQOrbXqkW6KHdA-1; Wed, 24 Feb 2021 16:46:27 -0500
X-MC-Unique: xxkBzi2oOQOrbXqkW6KHdA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 997BB100CCCC;
 Wed, 24 Feb 2021 21:46:26 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C335160BF3;
 Wed, 24 Feb 2021 21:46:25 +0000 (UTC)
Subject: Re: [PATCH v3 03/16] qapi/expr.py: constrain incoming expression types
To: Markus Armbruster <armbru@redhat.com>
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-4-jsnow@redhat.com>
 <8735xl7pit.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <14af160f-7a06-7b9e-a770-13c1fef86ae4@redhat.com>
Date: Wed, 24 Feb 2021 16:46:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <8735xl7pit.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
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

On 2/24/21 5:01 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> mypy does not know the types of values stored in Dicts that masquerade
>> as objects. Help the type checker out by constraining the type.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>> Reviewed-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>   scripts/qapi/expr.py | 25 ++++++++++++++++++++++---
>>   1 file changed, 22 insertions(+), 3 deletions(-)
>>
>> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>> index 5694c501fa3..783282b53ce 100644
>> --- a/scripts/qapi/expr.py
>> +++ b/scripts/qapi/expr.py
>> @@ -15,9 +15,17 @@
>>   # See the COPYING file in the top-level directory.
>>   
>>   import re
>> +from typing import MutableMapping, Optional
>>   
>>   from .common import c_name
>>   from .error import QAPISemError
>> +from .parser import QAPIDoc
>> +from .source import QAPISourceInfo
>> +
>> +
>> +# Expressions in their raw form are JSON-like structures with arbitrary forms.
>> +# Minimally, their top-level form must be a mapping of strings to values.
>> +Expression = MutableMapping[str, object]
> 
> MutableMapping, fancy.  It's only ever dict.  Why abstract from that?
> 

I don't know! I referenced this in the cover letter. I cannot remember 
the reason anymore. It had R-Bs on it so I left it alone.

There are some differences, but I no longer remember why I thought they 
applied. Maybe some of my more exploratory work wanted it. Dunno.

> The use of object is again owed to mypy's inability to do recursive
> types.  What we really have here is something like
> 
>     Expression = Union[bool, str, dict[str, Expression], list[Expression]]
> 
> with the root further constrained to the Union's dict branch.  Spell
> that out in a bit more detail, like you did in introspect.py?
> 

Terminology problem?

I am using "Expression" to mean very specifically a top-level object as 
returned from parser.py, which *must* be an Object, so it *must* be a 
mapping of str => yaddayadda.

The type as I intended it is Expression = Dict[str, yaddayadda]

where yaddayadda is
Union[int, str, bool, List[yaddayadda], Dict[str, yaddayadda]]
expr.py is what validates the yaddayadda, so there's no point in trying 
to type it further, I think.

Probably worth a better comment.

> Hmm, there you used Any, not object.  I guess that's because mypy lets
> you get away with object here, but not there.  Correct?
> 

Yep. I can get away with the stricter type here because of how we use 
it, so I did. That's an artifact of it not being recursive and how 
expr.py's entire raison d'etre is using isinstance() checks to 
effectively downcast for us everywhere already.

> Also, PEP 8 comment line length.
> 

Augh.

Is there a way to set emacs mode highlighting in Python such that it 
highlights when I run past the 72-col margin, but only for comments?

I have the general-purpose highlighter on for the 80-col margin.

I'm not familiar with any setting like this for any of the linters or 
pycharm right away either.

>>   
>>   
>>   # Names must be letters, numbers, -, and _.  They must start with letter,
>> @@ -287,9 +295,20 @@ def check_event(expr, info):
>>   
>>   def check_exprs(exprs):
>>       for expr_elem in exprs:
>> -        expr = expr_elem['expr']
>> -        info = expr_elem['info']
>> -        doc = expr_elem.get('doc')
>> +        # Expression
>> +        assert isinstance(expr_elem['expr'], dict)
>> +        for key in expr_elem['expr'].keys():
>> +            assert isinstance(key, str)
>> +        expr: Expression = expr_elem['expr']
> 
> You're fine with repeating exp_elem['expr'] here, and ...
> 
>> +
>> +        # QAPISourceInfo
>> +        assert isinstance(expr_elem['info'], QAPISourceInfo)
>> +        info: QAPISourceInfo = expr_elem['info']
> 
> ... expr_elem['info'] here, but ...
> 
>> +
>> +        # Optional[QAPIDoc]
>> +        tmp = expr_elem.get('doc')
>> +        assert tmp is None or isinstance(tmp, QAPIDoc)
>> +        doc: Optional[QAPIDoc] = tmp
> 
> ... you avoid repetition of expr_elem.get('doc') here.  Any particular
> reason?
> 

Because this looks like garbage written by a drunkard:

assert expr_elem.get('doc') is None or isinstance(expr_elem.get('doc'), 
QAPIDoc)
doc: Optional[QAPIDoc] = expr_elem.get('doc')

>>   
>>           if 'include' in expr:
>>               continue


