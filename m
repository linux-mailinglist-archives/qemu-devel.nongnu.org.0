Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A592F6BD265
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 15:30:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcobj-0004ty-M9; Thu, 16 Mar 2023 10:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pcobg-0004tl-VF
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 10:29:29 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pcobf-0007At-2x
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 10:29:28 -0400
Received: by mail-pj1-x1032.google.com with SMTP id rj10so1802864pjb.4
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 07:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678976965;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+jEKeCYmVfUq+ca3NYj8cXNaGdU/mfVklaoXwGKVY8g=;
 b=pXCZybsXelVz1jnyXA8KmtjIsvpZVEQxIzyN5T6CTWnFYKvt02V2p8s2JQeGVbgpYN
 Ly7cc8DHiP59x5FzLmGjnubmbosnZPlPEi07gBagd3fOoPx0Bw6pGPUAkqiKzEzvC0lM
 RSFgJn1LL9dThOb4ZBCDnLzNdcxxoyYFSf34yNEsOrdOZsnCLgpgcjTmDzeYfPX716/K
 qJrMuUPSuyJhNOcEpH9MHthMGAg8KS9cN700Vws8yC938t8FB43UCpIKJbpgsrE3cl5H
 /Ta8oYRchkRd44KTz/yNVvL+nEi9xuLFX3+GMXrZ0ct5sLMZ/XgBk8PzeDgzgfpSwJsU
 lqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678976965;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+jEKeCYmVfUq+ca3NYj8cXNaGdU/mfVklaoXwGKVY8g=;
 b=kMraHGqAc2XwC+Gmbv11GcQH1GM3zA0Y5Zr1V3q60BBajRU664+1UWYhOzZY7DoJAt
 MZXvkJSmH+x2bxg83hzmp+7WHDwiZ5a9sZ5X4DhqYq5asW8V3ObY8Wmwxb5wPQY+4Kfj
 h9ZzoXX554j/BN6aOnXaDrziF92wewD/QmNR4Q95QH8S8L/vcOoFD7o9EWKM+ByWdb15
 Lu+7o0zc5l+RuAfxFQ9ZCugNYa5u3RmW7e0Jd+IUJcOl8or/E3jjutYc9mK1t3M//2ph
 CWsdPFl+g2YQuI+JfPy4TLNp/sDTrH2XtL6XSKA9p5dRNlbNVZRNR3mI6sFCWKJwOJ8R
 X6pQ==
X-Gm-Message-State: AO0yUKXefDwxeVPn9PRhUM06mp9ysAqpk4qgB1w0u6yqnbi1OAXGZarm
 R1C4GnesaTqbVRDhnvI/q8fymQ==
X-Google-Smtp-Source: AK7set8ua04b4eM+XDU/tg6AnFKNPiuW2bSDYfCUda0hsEVgysPrQKTo1YLHTEB+gY04gkxfWfub6Q==
X-Received: by 2002:a17:90b:4f90:b0:23a:5f51:6ee5 with SMTP id
 qe16-20020a17090b4f9000b0023a5f516ee5mr4268325pjb.12.1678976964697; 
 Thu, 16 Mar 2023 07:29:24 -0700 (PDT)
Received: from [192.168.57.227] (96-82-119-43-static.hfc.comcastbusiness.net.
 [96.82.119.43]) by smtp.gmail.com with ESMTPSA id
 s1-20020a17090aad8100b00227223c58ecsm3283435pjq.42.2023.03.16.07.29.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 07:29:24 -0700 (PDT)
Message-ID: <827834f4-f87c-b0a7-6e61-68cd3c48c8e1@linaro.org>
Date: Thu, 16 Mar 2023 07:29:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/7] target/s390x: Fix s390_probe_access for user-only
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: david@redhat.com
References: <20230109201856.3916639-1-richard.henderson@linaro.org>
 <20230109201856.3916639-2-richard.henderson@linaro.org>
 <646d6c84-4004-6fce-20de-6f327b3975db@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <646d6c84-4004-6fce-20de-6f327b3975db@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/15/23 08:30, Thomas Huth wrote:
> On 09/01/2023 21.18, Richard Henderson wrote:
>> In db9aab5783a2 we broke the contract of s390_probe_access, in that it
>> no longer returned an exception code, nor set __excp_addr.  Fix both.
>>
>> Reported-by: David Hildenbrand <david@redhat.com>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/s390x/tcg/mem_helper.c | 31 ++++++++++++++++++-------------
>>   1 file changed, 18 insertions(+), 13 deletions(-)
>>
>> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
>> index cb82cd1c1d..5c0a7b1961 100644
>> --- a/target/s390x/tcg/mem_helper.c
>> +++ b/target/s390x/tcg/mem_helper.c
>> @@ -138,23 +138,27 @@ typedef struct S390Access {
>>    * For !CONFIG_USER_ONLY, the TEC is stored stored to env->tlb_fill_tec.
>>    * For CONFIG_USER_ONLY, the faulting address is stored to env->__excp_addr.
>>    */
>> -static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
>> -                             MMUAccessType access_type, int mmu_idx,
>> -                             bool nonfault, void **phost, uintptr_t ra)
>> +static inline int s390_probe_access(CPUArchState *env, target_ulong addr,
>> +                                    int size, MMUAccessType access_type,
>> +                                    int mmu_idx, bool nonfault,
>> +                                    void **phost, uintptr_t ra)
>>   {
>> -#if defined(CONFIG_USER_ONLY)
>> -    return probe_access_flags(env, addr, access_type, mmu_idx,
>> -                              nonfault, phost, ra);
>> -#else
>> -    int flags;
>> +    int flags = probe_access_flags(env, addr, access_type, mmu_idx,
>> +                                   nonfault, phost, ra);
>> -    env->tlb_fill_exc = 0;
>> -    flags = probe_access_flags(env, addr, access_type, mmu_idx, nonfault, phost,
>> -                               ra);
>> -    if (env->tlb_fill_exc) {
>> +    if (unlikely(flags & TLB_INVALID_MASK)) {
>> +        assert(!nonfault);
> 
>   Hi Richard,
> 
> qemu-system-s390x now triggers on this assert() if running the
> kvm-unit-tests in TCG mode:
> 
> $ qemu-system-s390x -nographic -kernel s390x/mvpg.elf
> ...
> PASS: mvpg: exceptions: specification: Key Function Control value 27
> PASS: mvpg: exceptions: specification: Key Function Control value 28
> PASS: mvpg: exceptions: specification: Key Function Control value 29
> PASS: mvpg: exceptions: specification: Key Function Control value 30
> PASS: mvpg: exceptions: specification: Key Function Control value 31
> qemu-system-s390x: ../../devel/qemu/target/s390x/tcg/mem_helper.c:152: s390_probe_access: 
> Assertion `!nonfault' failed.
> Aborted (core dumped)
> 
> If I've got the test right, it tries to do a "mvpg" with an illegal
> address and expects to see an addressing exception.
> 
> It seems to work when I remove the assert() statement. Could we maybe
> replace it with a qemu_log_mask(LOG_GUEST_ERROR, ...) instead?

This is a pre-coffee guess, but the assert looks backward.

We should only arrive there if nonfault was true for the probe (otherwise the probe would 
have raised the exception directly).  I would think we could just remove the assert.


r~

