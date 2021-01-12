Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633EA2F29DB
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 09:18:46 +0100 (CET)
Received: from localhost ([::1]:41186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzEt3-0000T5-GM
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 03:18:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzErJ-0007zP-CX
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 03:16:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzErF-0003Nh-JQ
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 03:16:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610439411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r5utnp0g7dp7iLx/yTzTRhE7yaZ0OBDp2Ccfg4GAaGo=;
 b=N5fyL1auAXDh7PreQIrTT+ZrJoSqkviSL9akBLezKScB+Y67xVcuLeSTxVBq8wOas3rKx5
 sfqXCIsovULxc8PLTXuED1rWh9W+Qjr1cGg5Pv37/NTuGjxVHSbUSX1I/SPk+7kaV3otC+
 ArEvCaCujyca4Jyj84SJ1KEwfyuoyak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-YzVO1zQeNp6zuGsymckzSw-1; Tue, 12 Jan 2021 03:16:47 -0500
X-MC-Unique: YzVO1zQeNp6zuGsymckzSw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA03A1934101;
 Tue, 12 Jan 2021 08:16:46 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-184.ams2.redhat.com [10.36.112.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6335210023B5;
 Tue, 12 Jan 2021 08:16:42 +0000 (UTC)
Subject: Re: [PATCH v3 4/5] tests/tcg/s390x: Fix EXRL tests
To: David Hildenbrand <david@redhat.com>
References: <fdb64ad0-463a-3a35-e68d-4ce0d0de95b5@redhat.com>
 <0171718F-8768-49AB-8018-E1307AB19292@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b01bc81a-c79a-d1c5-a85f-95939c7d8e72@redhat.com>
Date: Tue, 12 Jan 2021 09:16:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <0171718F-8768-49AB-8018-E1307AB19292@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
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

On 12/01/2021 08.47, David Hildenbrand wrote:
> 
>> Am 12.01.2021 um 08:41 schrieb Thomas Huth <thuth@redhat.com>:
>>
>> ﻿On 11/01/2021 17.38, David Hildenbrand wrote:
>>> The current EXRL tests crash on real machines: we must not use r0 as a base
>>> register for trt/trtr, otherwise the content gets ignored. Also, we must
>>> not use r0 for exrl, otherwise it gets ignored.
>>> Let's use the "a" constraint so we get a general purpose register != r0.
>>> For op2, we can simply specify a memory operand directly via "Q" (Memory
>>> reference without index register and with short displacement).
>>> Fixes: ad8c851d2e77 ("target/s390x: add EX support for TRT and TRTR")
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>> ---
>>>   tests/tcg/s390x/exrl-trt.c  | 8 ++++----
>>>   tests/tcg/s390x/exrl-trtr.c | 8 ++++----
>>>   2 files changed, 8 insertions(+), 8 deletions(-)
>>> diff --git a/tests/tcg/s390x/exrl-trt.c b/tests/tcg/s390x/exrl-trt.c
>>> index 3c5323aecb..16711a3181 100644
>>> --- a/tests/tcg/s390x/exrl-trt.c
>>> +++ b/tests/tcg/s390x/exrl-trt.c
>>> @@ -19,7 +19,7 @@ int main(void)
>>>       }
>>>       asm volatile(
>>>           "    j 2f\n"
>>> -        "1:  trt 0(1,%[op1]),0(%[op2])\n"
>>> +        "1:  trt 0(1,%[op1]),%[op2]\n"
>>>           "2:  exrl %[op1_len],1b\n"
>>>           "    lgr %[r1],%%r1\n"
>>>           "    lgr %[r2],%%r2\n"
>>> @@ -27,9 +27,9 @@ int main(void)
>>>           : [r1] "+r" (r1),
>>>             [r2] "+r" (r2),
>>>             [cc] "=r" (cc)
>>> -        : [op1] "r" (&op1),
>>> -          [op1_len] "r" (5),
>>> -          [op2] "r" (&op2)
>>> +        : [op1] "a" (&op1),
>>> +          [op1_len] "a" (5),
>>
>> I think op1_len could still stay with "r" instead of "a" ... OTOH "a" also does not hurt here, so:
>>
> 
> No, otherwise exrl ignores the register content  if it ends up being r0.

Ah, well, sorry, I've got fooled by the description of "EXECUTE RELATIVE 
LONG" in the Principles of Operation since it is talking about "R1" and not 
"B" there ... but you're right, the detailed description there then talks 
about "When the R1 field is not zero ...", so we need the "a" instead of the 
"r" for op1_len here indeed.

  Thomas


