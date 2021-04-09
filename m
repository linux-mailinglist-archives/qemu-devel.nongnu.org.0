Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A9535A0EE
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 16:21:25 +0200 (CEST)
Received: from localhost ([::1]:48732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUs0h-0003ZM-KE
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 10:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lUrzR-0002rL-0T
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 10:20:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lUrzO-0002Ou-FH
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 10:20:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617978000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L+relNjYSKG65bcFVjsgpkrfPA/jLjJdRDNwh9JWUWI=;
 b=aEgZaQPZCU15tz5ZXcZL9gjYhByPAxTAhupfDnwP3JR+DEosrItNTyCBsAhLhkzugEO5xQ
 +pQWLSONPkN6pXSimFe5yzVwXBQPTnJBr8uAC8ldOgRL1tkFdiZMfOecBJGD4J97oYrVck
 NreKGnpmbQZhXd3Vm6vbdvifJGRPt08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-zkFO0VXwOCyb7kQBsp3yKw-1; Fri, 09 Apr 2021 10:19:58 -0400
X-MC-Unique: zkFO0VXwOCyb7kQBsp3yKw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72FEA87A826;
 Fri,  9 Apr 2021 14:19:57 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-67.ams2.redhat.com
 [10.36.114.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E1991B400;
 Fri,  9 Apr 2021 14:19:52 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] block/rbd: Add an escape-aware strchr helper
To: Connor Kuehl <ckuehl@redhat.com>, qemu-block@nongnu.org
References: <20210401210150.2127670-1-ckuehl@redhat.com>
 <20210401210150.2127670-3-ckuehl@redhat.com>
 <bc5865f8-bb7f-58b5-5f1c-9ec3e5c09ad9@redhat.com>
 <ad6beb34-7e80-3e60-7c2d-faa2836febf9@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <168d5be8-8769-39f5-61ac-91cd93822298@redhat.com>
Date: Fri, 9 Apr 2021 16:19:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <ad6beb34-7e80-3e60-7c2d-faa2836febf9@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
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
Cc: kwolf@redhat.com, dillaman@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.04.21 16:05, Connor Kuehl wrote:
> On 4/6/21 9:24 AM, Max Reitz wrote:
>> On 01.04.21 23:01, Connor Kuehl wrote:
>>> [..]
>>> diff --git a/block/rbd.c b/block/rbd.c
>>> index 9071a00e3f..c0e4d4a952 100644
>>> --- a/block/rbd.c
>>> +++ b/block/rbd.c
>>> @@ -134,6 +134,22 @@ static char *qemu_rbd_next_tok(char *src, char 
>>> delim, char **p)
>>>       return src;
>>>   }
>>> +static char *qemu_rbd_strchr(char *src, char delim)
>>> +{
>>> +    char *p;
>>> +
>>> +    for (p = src; *p; ++p) {
>>> +        if (*p == delim) {
>>> +            return p;
>>> +        }
>>> +        if (*p == '\\') {
>>> +            ++p;
>>> +        }
>>> +    }
>>> +
>>> +    return NULL;
>>> +}
>>> +
>>
>> So I thought you could make qemu_rbd_do_next_tok() to do this.  (I 
>> didn’t say you should, but bear with me.)  That would be possible by 
>> giving it a new parameter (e.g. @find), and if that is set, return 
>> @end if *end == delim after the loop, and NULL otherwise.
>>
>> Now, if you add wrapper functions to make it nice, there’s not much 
>> more difference in lines added compared to just adding a new function, 
>> but it does mean your function should basically be the same as 
>> qemu_rbd_next_tok(), except that no splitting happens, that there is 
>> no *p, and that @end is returned instead of @src.
> 
> Do you have a strong preference for this? I agree that 
> qemu_rbd_next_tok() could grow this functionality, but I think it'd be 
> simpler to keep it separate in the form of qemu_rbd_strchr().

Oh, no, no.  I mostly said this so it would be clear why both functions 
should basically have the same structure, i.e. why a difference in 
structure might be a sign that something’s wrong.

Sorry if I came across as too verbose.

>> So there is one difference, and that is that qemu_rbd_next_tok() has 
>> this condition to skip escaped characters:
>>
>>      if (*end == '\\' && end[1] != '\0') {
>>
>> where qemu_rbd_strchr() has only:
>>
>>      if (*p == '\\') {
>>
>> And I think qemu_rbd_next_tok() is right; if the string in question 
>> has a trailing backslash, qemu_rbd_strchr() will ignore the final NUL 
>> and continue searching past the end of the string.
> 
> Aha, good catch. I'll fix this up.

Thanks!

Max


