Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0682F2D3C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:54:25 +0100 (CET)
Received: from localhost ([::1]:43018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzHJg-0004sB-6P
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:54:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kzGXb-00032c-4l
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 05:04:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kzGXT-0006Yq-4r
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 05:04:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610445872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ayGrgkN2iMX03KL0GIarf9C6/dHJuxKWOu6lONsDJXE=;
 b=JpNomAaXaWdfEv1WhnEaiHjf11DL7P85UL7aUoGt92VsPqBv68tM5/6Bh7JChdjC7LfndN
 zTEN1EzPsr71EVZeNFF2gI+vwPxmdxTneBA+reJDWmA7IRWmMPe6OA/sy3d+FBIsDlh5dd
 krHhFSF7bEIaYfqo/1VjI7oRq3CYVok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-c1hJezvkOvq8SH39MGzZlw-1; Tue, 12 Jan 2021 05:04:30 -0500
X-MC-Unique: c1hJezvkOvq8SH39MGzZlw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D3871800D42;
 Tue, 12 Jan 2021 10:04:29 +0000 (UTC)
Received: from [10.36.115.140] (ovpn-115-140.ams2.redhat.com [10.36.115.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E37050C0D;
 Tue, 12 Jan 2021 10:04:28 +0000 (UTC)
Subject: Re: [PATCH v3 4/5] tests/tcg/s390x: Fix EXRL tests
To: Thomas Huth <thuth@redhat.com>
References: <fdb64ad0-463a-3a35-e68d-4ce0d0de95b5@redhat.com>
 <0171718F-8768-49AB-8018-E1307AB19292@redhat.com>
 <b01bc81a-c79a-d1c5-a85f-95939c7d8e72@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <636eb0c5-b217-c550-f84d-4f849d901501@redhat.com>
Date: Tue, 12 Jan 2021 11:04:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <b01bc81a-c79a-d1c5-a85f-95939c7d8e72@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.01.21 09:16, Thomas Huth wrote:
> On 12/01/2021 08.47, David Hildenbrand wrote:
>>
>>> Am 12.01.2021 um 08:41 schrieb Thomas Huth <thuth@redhat.com>:
>>>
>>> ﻿On 11/01/2021 17.38, David Hildenbrand wrote:
>>>> The current EXRL tests crash on real machines: we must not use r0 as a base
>>>> register for trt/trtr, otherwise the content gets ignored. Also, we must
>>>> not use r0 for exrl, otherwise it gets ignored.
>>>> Let's use the "a" constraint so we get a general purpose register != r0.
>>>> For op2, we can simply specify a memory operand directly via "Q" (Memory
>>>> reference without index register and with short displacement).
>>>> Fixes: ad8c851d2e77 ("target/s390x: add EX support for TRT and TRTR")
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>> ---
>>>>   tests/tcg/s390x/exrl-trt.c  | 8 ++++----
>>>>   tests/tcg/s390x/exrl-trtr.c | 8 ++++----
>>>>   2 files changed, 8 insertions(+), 8 deletions(-)
>>>> diff --git a/tests/tcg/s390x/exrl-trt.c b/tests/tcg/s390x/exrl-trt.c
>>>> index 3c5323aecb..16711a3181 100644
>>>> --- a/tests/tcg/s390x/exrl-trt.c
>>>> +++ b/tests/tcg/s390x/exrl-trt.c
>>>> @@ -19,7 +19,7 @@ int main(void)
>>>>       }
>>>>       asm volatile(
>>>>           "    j 2f\n"
>>>> -        "1:  trt 0(1,%[op1]),0(%[op2])\n"
>>>> +        "1:  trt 0(1,%[op1]),%[op2]\n"
>>>>           "2:  exrl %[op1_len],1b\n"
>>>>           "    lgr %[r1],%%r1\n"
>>>>           "    lgr %[r2],%%r2\n"
>>>> @@ -27,9 +27,9 @@ int main(void)
>>>>           : [r1] "+r" (r1),
>>>>             [r2] "+r" (r2),
>>>>             [cc] "=r" (cc)
>>>> -        : [op1] "r" (&op1),
>>>> -          [op1_len] "r" (5),
>>>> -          [op2] "r" (&op2)
>>>> +        : [op1] "a" (&op1),
>>>> +          [op1_len] "a" (5),
>>>
>>> I think op1_len could still stay with "r" instead of "a" ... OTOH "a" also does not hurt here, so:
>>>
>>
>> No, otherwise exrl ignores the register content  if it ends up being r0.
> 
> Ah, well, sorry, I've got fooled by the description of "EXECUTE RELATIVE 
> LONG" in the Principles of Operation since it is talking about "R1" and not 
> "B" there ... but you're right, the detailed description there then talks 
> about "When the R1 field is not zero ...", so we need the "a" instead of the 
> "r" for op1_len here indeed.

I actually stumbled over that while fixing the test. Converting op1 and
op2 suddenly made the test fail with "bad cc" instead of segfault. The
compiler decided to use r0 for op1_len when not being able to use it for
op1 and op2 ... :)


-- 
Thanks,

David / dhildenb


