Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 790C63A6959
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 16:51:52 +0200 (CEST)
Received: from localhost ([::1]:41686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsnwN-0007nl-ID
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 10:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsntr-0004a9-Ql
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:49:15 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:34557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsntq-0006gL-1s
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:49:15 -0400
Received: by mail-pf1-x432.google.com with SMTP id g6so10722478pfq.1
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 07:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZB8Z6grPIWUHABQmhECDOglvuejo57FJCxoTvLT3MOo=;
 b=D5K4seYhRC+oJGgyka6F9ZjIZvRAOuUFLi387XaSq3bPl+Nvo30/Tg7GKklv3giKjN
 zKqclKzQZ09Pj1oYaE1eCodtip+NZ9DOKm2oo3HkTqUfCCJ41QRpHaeaulzC3+Nu0fbZ
 /vKK/KHeMJzPyN+Gx+261QRl/qZWyjs4jJKC999YsKR2sG/tdH1O+yEqfgjr2lkFOhEc
 aaidHfH4KZ9BjHlLoy/zYtQoTXOoztoorz6BAZbxmqnfdPeF6i5nzHZ3lDERsDtw3HDi
 DaHB1FPmpU0mh7z0+4qIyeShAIbUJrHjlYxLva+SjOL40uO+pH4dE1J8XpzgvmS/1NKM
 6uPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZB8Z6grPIWUHABQmhECDOglvuejo57FJCxoTvLT3MOo=;
 b=IZSeoNwo+PnqfH71wFZSacKmc1IURSTMqHlgmAhwpShoTscO6gRBGo2zZTx6pOoqqM
 c+L/6aDSJEGo2DNxiO7YtVVObZOphD51h8zx6Ia+1vKpBJshWCXmj6re1a/DauuH1PkP
 qe25U13QU9HOxBctxLp8k5m0z957CJRIOWCAbDUja7e+eeOIurgGIkwdGcRc8S1aoKIf
 iaGslxHaIf3L3TIQC03/ztZT4GFQyL5hWDSuhx8pYg5q+tp+HHt+bswfrXZRhUtjKg0J
 7lsqBrxQKFo+LLrCB7Lblli0HDTi1+XvWFsi/9Xgh6WXw/gaknt5TN4SSawlzhcdr4AP
 tBBg==
X-Gm-Message-State: AOAM530NV+kf9kHF4Stp3o9EUHXgfKVlWEFFbixms9/B/6PTnC+JFjGc
 +DllUAR6iPd1Z8DX5k3Apo7ggv4CoN2N1g==
X-Google-Smtp-Source: ABdhPJwBd43Yhuep8JHavAxnICHodWv6+eypGpxuqMehYOkHMsbvLPe1/nnD8VyiPKlRE8WtAPfn4Q==
X-Received: by 2002:a63:e14:: with SMTP id d20mr17841855pgl.35.1623682152351; 
 Mon, 14 Jun 2021 07:49:12 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 in24sm12331067pjb.54.2021.06.14.07.49.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 07:49:12 -0700 (PDT)
Subject: Re: [PATCH] accel/tcg: Probe the proper permissions for atomic ops
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210613002505.898859-1-richard.henderson@linaro.org>
 <87lf7ck9vp.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fb5f29d8-d343-f7ca-020c-b94c0f81fe34@linaro.org>
Date: Mon, 14 Jun 2021 07:49:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87lf7ck9vp.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 3:18 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> We had a single ATOMIC_MMU_LOOKUP macro that probed for
>> read+write on all atomic ops.  This is incorrect for
>> plain atomic load and atomic store.
>>
>> For user-only, we rely on the host page permissions.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/390
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> <snip>
>>   
>> -/* Probe for a read-modify-write atomic operation.  Do not allow unaligned
>> - * operations, or io operations to proceed.  Return the host address.  */
>> +/*
>> + * Probe for an atomic operation.  Do not allow unaligned operations,
>> + * or io operations to proceed.  Return the host address.
>> + *
>> + * @prot may be PAGE_READ, PAGE_WRITE, or PAGE_READ|PAGE_WRITE.
>> + */
>>   static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
>> -                               TCGMemOpIdx oi, uintptr_t retaddr)
>> +                               TCGMemOpIdx oi, int prot, uintptr_t retaddr)
>>   {
>>       size_t mmu_idx = get_mmuidx(oi);
>> -    uintptr_t index = tlb_index(env, mmu_idx, addr);
>> -    CPUTLBEntry *tlbe = tlb_entry(env, mmu_idx, addr);
>> -    target_ulong tlb_addr = tlb_addr_write(tlbe);
>>       MemOp mop = get_memop(oi);
>>       int a_bits = get_alignment_bits(mop);
>>       int s_bits = mop & MO_SIZE;
>> +    uintptr_t index;
>> +    CPUTLBEntry *tlbe;
>> +    target_ulong tlb_addr;
>>       void *hostaddr;
>>   
>>       /* Adjust the given return address.  */
>> @@ -1775,15 +1779,45 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
>>           goto stop_the_world;
>>       }
>>   
>> +    index = tlb_index(env, mmu_idx, addr);
>> +    tlbe = tlb_entry(env, mmu_idx, addr);
>> +
>>       /* Check TLB entry and enforce page permissions.  */
>> -    if (!tlb_hit(tlb_addr, addr)) {
>> -        if (!VICTIM_TLB_HIT(addr_write, addr)) {
>> -            tlb_fill(env_cpu(env), addr, 1 << s_bits, MMU_DATA_STORE,
>> -                     mmu_idx, retaddr);
>> -            index = tlb_index(env, mmu_idx, addr);
>> -            tlbe = tlb_entry(env, mmu_idx, addr);
>> +    if (prot & PAGE_WRITE) {
>> +        tlb_addr = tlb_addr_write(tlbe);
>> +        if (!tlb_hit(tlb_addr, addr)) {
>> +            if (!VICTIM_TLB_HIT(addr_write, addr)) {
>> +                tlb_fill(env_cpu(env), addr, 1 << s_bits,
>> +                         MMU_DATA_STORE, mmu_idx, retaddr);
>> +                index = tlb_index(env, mmu_idx, addr);
>> +                tlbe = tlb_entry(env, mmu_idx, addr);
>> +            }
>> +            tlb_addr = tlb_addr_write(tlbe) & ~TLB_INVALID_MASK;
>> +        }
>> +
>> +        /* Let the guest notice RMW on a write-only page.  */
>> +        if ((prot & PAGE_READ) &&
>> +            unlikely(tlbe->addr_read != (tlb_addr & ~TLB_NOTDIRTY))) {
>> +            tlb_fill(env_cpu(env), addr, 1 << s_bits,
>> +                     MMU_DATA_LOAD, mmu_idx, retaddr);
>> +            /*
>> +             * Since we don't support reads and writes to different addresses,
>> +             * and we do have the proper page loaded for write, this shouldn't
>> +             * ever return.  But just in case, handle via stop-the-world.
>> +             */
>> +            goto stop_the_world;
>> +        }
>> +    } else /* if (prot & PAGE_READ) */ {
> 
> I guess the compiler doesn't have enough info to know that !PROT_WRITE
> implies PROT_READ and ends up doing an extra check it doesn't need to otherwise?

I didn't even look at the compiler output.

r~

> 
> Otherwise seems sane to me:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 


