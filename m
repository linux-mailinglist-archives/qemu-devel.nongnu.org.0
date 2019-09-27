Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CAAC0A8E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 19:45:48 +0200 (CEST)
Received: from localhost ([::1]:55260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDuJP-000203-AP
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 13:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42630)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iDsuo-0002zw-J4
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 12:16:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iDsun-0007xs-E0
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 12:16:18 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:45321)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iDsum-0007rA-8F
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 12:16:17 -0400
Received: by mail-pf1-x444.google.com with SMTP id y72so1857592pfb.12
 for <qemu-devel@nongnu.org>; Fri, 27 Sep 2019 09:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uRihloK9Ooa2TxA25RO3VjjScERCQTxhPV2Wqeygv/U=;
 b=QjtNu2t1P0yWiHFaEZqr34y287uQ2dJOyuc3GqE9RwBbLuCKgO7/EK0SxJrDDbgxuc
 ZeMsytbFe7WC2vdAhRvcWEWnVJwB7x+5aImteWisPN7G7UD6w9GyLoPCuCqqpoHVES5a
 VFO41jcZ1WDQSypqsV3JRMXEs4URFtxc0vLOCHFUUhDe2zRXf9KWm6ZfrryL7+bAejXn
 JKrHuHOF7WuX3tUohFqRcuE60UvfR+N/qDHMfv3OTDgPUXnbFYMTgRk1CQnQobuQHuJ9
 1q8eZvvOeqBK/ey16WOlpyBqdLQf193nJbPwZnoD/liPqO7IsAW891L5n+k/DjYckluS
 zsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uRihloK9Ooa2TxA25RO3VjjScERCQTxhPV2Wqeygv/U=;
 b=eM/tTojbAYxv6ISf113NqZCbbsW4D1JOoX0vfJRXTlo1+dgebFGp8F2dYY6n/q1UQ2
 pb0mDp3Ml31lsEtGmFFoFTn/QPEOc6FrTIAdva0S7Bd0YGEkPF/xdGXrYcAFwomYBrAp
 CkteWtEWunZBM6gJy/u8d7w1DY2/uS7Oxe2YmyyINolHfUmv0a9TQJ4O2JeVWumkMXiw
 wZHyrzj6wxO98Pg7uhocGYgeXF4xh6Zk8Opy7hFFS0+b93ULE6+ygI784rLdsF8cmnQm
 MB60FnUcnhf4Kclbd2DTjnnJdsXLbkAbe1Vt6BU2vrqUuorQiktxKBpFUJBkOQRMbhQb
 4Xew==
X-Gm-Message-State: APjAAAX6LJoFURHE4FUHDODEmbsJBdH2WYgS/zdr4OTSG4x70k1almHk
 MRnrK4LoDx5jaPHcH5A5R2uovQ==
X-Google-Smtp-Source: APXvYqyLo659V2qHAQMQWYNwd07KgXikDnOssPZZdHWG4Wl3OfhulEatDA2Q/w5CZ7IY3/Z+8/6ljQ==
X-Received: by 2002:aa7:8656:: with SMTP id a22mr5316836pfo.249.1569600974807; 
 Fri, 27 Sep 2019 09:16:14 -0700 (PDT)
Received: from [172.20.32.216] ([12.157.10.118])
 by smtp.gmail.com with ESMTPSA id x20sm4655664pfp.120.2019.09.27.09.16.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Sep 2019 09:16:14 -0700 (PDT)
Subject: Re: [PATCH v3 14/18] target/s390x: Rely on unwinding in
 s390_cpu_tlb_fill
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190926162615.31168-1-richard.henderson@linaro.org>
 <20190926162615.31168-15-richard.henderson@linaro.org>
 <f3277035-17b8-59a6-e4ae-7b1a95ea0c84@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <fb1096e8-1b3d-ff46-97c5-c03e8f838e34@linaro.org>
Date: Fri, 27 Sep 2019 09:16:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f3277035-17b8-59a6-e4ae-7b1a95ea0c84@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/19 4:02 AM, David Hildenbrand wrote:
> On 26.09.19 18:26, Richard Henderson wrote:
>> We currently set ilen to AUTO, then overwrite that during
>> unwinding, then overwrite that for the code access case.
>>
>> This can be simplified to setting ilen to our arbitrary
>> value for the (undefined) code access case, then rely on
>> unwinding to overwrite that with the correct value for
>> the data access case.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/s390x/excp_helper.c | 23 +++++++----------------
>>  1 file changed, 7 insertions(+), 16 deletions(-)
>>
>> diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
>> index 98a1ee8317..8ce992e639 100644
>> --- a/target/s390x/excp_helper.c
>> +++ b/target/s390x/excp_helper.c
>> @@ -96,7 +96,7 @@ bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>>  {
>>      S390CPU *cpu = S390_CPU(cs);
>>  
>> -    trigger_pgm_exception(&cpu->env, PGM_ADDRESSING, ILEN_AUTO);
>> +    trigger_pgm_exception(&cpu->env, PGM_ADDRESSING, ILEN_UNWIND);
> 
> Hmm, we always trigger a pgm exceptions, meaning we set
> cs->exception_index even if we have probe = true. Confused by that.

This is the CONFIG_USER_ONLY version, for which probe is always false.  Perhaps
I shouldn't have made the function interface identical, but it did appear to
make things cleaner for most targets.

>> +    trigger_pgm_exception(env, excp, 2);
> 
> I wonder if it is still worth setting this only conditionally. Most
> probably not.

I don't see that it would be.  I hope the comment is clear about this arbitrary
value is overwritten during unwinding.


r~

