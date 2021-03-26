Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7674534AD2F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 18:14:17 +0100 (CET)
Received: from localhost ([::1]:43836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPq2K-0007VN-18
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 13:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPq16-0006pb-LV
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 13:13:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPq13-0000qR-Bs
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 13:12:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616778775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oOpqHBScIqijqhWe5Gvq8Z+6UJ3bSwaV+DMA47a17yI=;
 b=OY50TECD1g48ggJ/+Ecmj3IkJm1ENgnGaXDUUzSaqEeG+wLibsZ6ziS7q8zDSEh77abdx6
 QPYKWFgqrFwAL80sZPnVWA6XhvvLsp6fw4E2PZ+qMKxoLCm4TKaxxC38wd0SpQD7X39Bj/
 XvwRPFcIeHIDGj7bDL4xNKyvEnkfQVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-KRx9uwqcNQO9EW9cglmMJw-1; Fri, 26 Mar 2021 13:12:51 -0400
X-MC-Unique: KRx9uwqcNQO9EW9cglmMJw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0251107ACCA;
 Fri, 26 Mar 2021 17:12:50 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 237FF5D6DC;
 Fri, 26 Mar 2021 17:12:50 +0000 (UTC)
Subject: Re: [PATCH v4 05/19] qapi/expr.py: constrain incoming expression types
To: Markus Armbruster <armbru@redhat.com>
References: <20210325060356.4040114-1-jsnow@redhat.com>
 <20210325060356.4040114-6-jsnow@redhat.com>
 <871rc3tjlt.fsf@dusky.pond.sub.org>
 <a2e23408-1885-3ce1-8328-47f5d837971c@redhat.com>
 <87sg4ia2wz.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <75da83c0-5d57-1070-a3d3-3f683563b6a1@redhat.com>
Date: Fri, 26 Mar 2021 13:12:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87sg4ia2wz.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:40 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 3/25/21 10:04 AM, Markus Armbruster wrote:
>>> John Snow <jsnow@redhat.com> writes:
>>>
>>>> mypy does not know the types of values stored in Dicts that masquerade
>>>> as objects. Help the type checker out by constraining the type.
>>>>
>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>> ---
>>>>    scripts/qapi/expr.py | 26 +++++++++++++++++++++++---
>>>>    1 file changed, 23 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>>>> index b4bbcd54c0..b75c85c160 100644
>>>> --- a/scripts/qapi/expr.py
>>>> +++ b/scripts/qapi/expr.py
>>>> @@ -15,9 +15,18 @@
>>>>    # See the COPYING file in the top-level directory.
>>>>    
>>>>    import re
>>>> +from typing import Dict, Optional
>>>>    
>>>>    from .common import c_name
>>>>    from .error import QAPISemError
>>>> +from .parser import QAPIDoc
>>>> +from .source import QAPISourceInfo
>>>> +
>>>> +
>>>> +# Deserialized JSON objects as returned by the parser;
>>>> +# The values of this mapping are not necessary to exhaustively type
>>>
>>> Not necessary and also not practical with current mypy.  Correct?
>>
>> Neither necessary nor practical. Typing as 'object' guarantees that
>> these values will never be used in a manner not supported by all python
>> objects. Mypy does not complain, so we know that we don't misuse the type.
>>
>> This is helpful for proving the validity of the expr.py validator
>> itself: we know that we are not forgetting to perform type narrowing and
>> using the value contained therein inappropriately.
>>
>> Adding a more exhaustive typing here is impractical (for reasons we
>> learned during introspect.py), but also provides no benefit to the
>> static analysis here anyway.
>>
>> (None of the functions written here *assume* the shape of the structure,
>> so there are no functions that benefit from having a more laboriously
>> specified type.)
>>
>> If the comment needs more work, suggest away -- I tried to follow our
>> last discussion here as best as I was able.
> 
> "Needs more work" sounds like "inadequate", which isn't the case.
> 
> The comment focuses on what we need from mypy here.  We may or may not
> want to hint at the other aspect: what mypy can provide.
> 
>>>> +# here, because the purpose of this module is to interrogate that type.
>>>> +_JSONObject = Dict[str, object]
> [...]
> 
> If we want to, maybe:
> 
>       # Deserialized JSON objects as returned by the parser.
>       # The values of this mapping are not necessary to exhaustively type
>       # here (and also not practical as long as mypy lacks recursive
>       # types), because the purpose of this module is to interrogate that
>       # type.
> 
> Thoughts?
> 

If it occurs to you to want the extra explanation, I won't say no to it. 
I will fold it in.

--js


