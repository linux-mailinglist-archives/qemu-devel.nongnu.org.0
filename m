Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E20475EFB52
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 18:52:07 +0200 (CEST)
Received: from localhost ([::1]:52860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odwlZ-00025V-8X
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 12:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odwIp-0001l8-0y
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:22:23 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:36651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odwId-0001DJ-I0
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:22:13 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 e11-20020a17090a77cb00b00205edbfd646so6449040pjs.1
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 09:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=vGOJoMkj0R31Jt0t+n1FQyc+hGz4OPjERDnZFwCRTWA=;
 b=CrYehdgFH+ZCqEe5mDxNC5ZelU1Yc6moufrj6J5ea9xF9WQESux2j33iSJaHvSz3Ri
 Oi33BAN0Y6Ski/lKmsspHAWL3A4YDoNV+Jtl7Xx+VLc//LuFZ5mvstiP8i8R1wyXbCr3
 epijtS665vAGLpmPzpWBtLkmcw3qYOFib1FCXzVBRqMQNZwgzTmy86WHK8OPzc69dNCL
 UfVUnajeSdonSKwm5asXTuNFwRh0aSpPt1oeyANfahwdH9ldu+FRNw1B7ob6BlUrgwyQ
 LjmmwBPgMFohjzPuLqd+liJluAb8fBT2NBCR9DEY/V329PJtitZydY70cvEfMF9KVUvK
 ztEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=vGOJoMkj0R31Jt0t+n1FQyc+hGz4OPjERDnZFwCRTWA=;
 b=bj7tD4QN1L+K4rB83ZCyF9UJUlPa157YlalYAe+jkYSIp9zECLkmFGskOp0Bxrhq4p
 +nD9CyN0vqCw6deKXY7ikRYYCuBV4o9dLNmAv7bkrHJMm77ecxC54SLRJTD5FHunIWQq
 QmF7mRKPXPLcj/GnRElIiO134DNmt6TDjlITnhtCzXI9yDc29YB0CUe37R779RM83y9U
 HuvQN/WBg2IHOcsAkgcr5deO15yESbFsexTOW2nt3vSe2DibE0JPM+1e6QTCBeipweWX
 5VtSuzUaeXMw8Wo6yNLaWabcF1BLwrf8DKnKbqr4YyHPFvU2qGYKacq9+0k/urb1jYXF
 MvwA==
X-Gm-Message-State: ACrzQf1Qp3ddtI5b5wjJ20b8jsvejiifiIKYcY8XIhqRhJtq2o2eHMhp
 O1a7zlmxSFN+k+FaBP0rsEWiwA==
X-Google-Smtp-Source: AMsMyM7lxHJJetvN2FZmyureQDdf7buPQNACLaaAyPXU2y4+TSOWZ8bzl6a5euW+VfrENP6yFJF/zw==
X-Received: by 2002:a17:902:da8b:b0:178:3980:4597 with SMTP id
 j11-20020a170902da8b00b0017839804597mr4288554plx.113.1664468530027; 
 Thu, 29 Sep 2022 09:22:10 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:d5c8:ddf6:4bcd:e3c7?
 ([2602:47:d49d:ec01:d5c8:ddf6:4bcd:e3c7])
 by smtp.gmail.com with ESMTPSA id
 cp15-20020a170902e78f00b0017894a84639sm33573plb.288.2022.09.29.09.22.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 09:22:09 -0700 (PDT)
Message-ID: <9db697ee-f8e1-1388-7675-42c46ae98fca@linaro.org>
Date: Thu, 29 Sep 2022 09:22:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 14/17] include/hw/core: Create struct CPUJumpCache
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220925105124.82033-1-richard.henderson@linaro.org>
 <20220925105124.82033-15-richard.henderson@linaro.org>
 <87k05mz3xa.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87k05mz3xa.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.099,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/29/22 06:46, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Wrap the bare TranslationBlock pointer into a structure.
>>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/hw/core/cpu.h     | 8 ++++++--
>>   accel/tcg/cpu-exec.c      | 9 ++++++---
>>   accel/tcg/cputlb.c        | 2 +-
>>   accel/tcg/translate-all.c | 4 ++--
>>   4 files changed, 15 insertions(+), 8 deletions(-)
>>
>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>> index 9e47184513..ee5b75dea0 100644
>> --- a/include/hw/core/cpu.h
>> +++ b/include/hw/core/cpu.h
>> @@ -232,6 +232,10 @@ struct hvf_vcpu_state;
>>   #define TB_JMP_CACHE_BITS 12
>>   #define TB_JMP_CACHE_SIZE (1 << TB_JMP_CACHE_BITS)
>>   
>> +typedef struct {
>> +    TranslationBlock *tb;
>> +} CPUJumpCache;
>> +
> 
> I don't quite follow whats going on here. I see we add vaddr pc in a
> later patch but I don't quite see why a cache for looking up TBs gets a
> sidechan value added later.
> 
> Is this because the vaddr will no longer match the tb->pc? Maybe a
> comment on the structure is needed?

Correct, there will be no tb->pc, so the cpu has to remember the virtual address itself.

This patch only wraps the current pointer into a structure.


r~

> 
>>   /* work queue */
>>   
>>   /* The union type allows passing of 64 bit target pointers on 32 bit
>> @@ -361,7 +365,7 @@ struct CPUState {
>>       IcountDecr *icount_decr_ptr;
>>   
>>       /* Accessed in parallel; all accesses must be atomic */
>> -    TranslationBlock *tb_jmp_cache[TB_JMP_CACHE_SIZE];
>> +    CPUJumpCache tb_jmp_cache[TB_JMP_CACHE_SIZE];
>>   
>>       struct GDBRegisterState *gdb_regs;
>>       int gdb_num_regs;
>> @@ -452,7 +456,7 @@ static inline void cpu_tb_jmp_cache_clear(CPUState *cpu)
>>       unsigned int i;
>>   
>>       for (i = 0; i < TB_JMP_CACHE_SIZE; i++) {
>> -        qatomic_set(&cpu->tb_jmp_cache[i], NULL);
>> +        qatomic_set(&cpu->tb_jmp_cache[i].tb, NULL);
>>       }
>>   }
>>   
>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>> index dd58a144a8..c6283d5798 100644
>> --- a/accel/tcg/cpu-exec.c
>> +++ b/accel/tcg/cpu-exec.c
>> @@ -252,7 +252,7 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
>>       tcg_debug_assert(!(cflags & CF_INVALID));
>>   
>>       hash = tb_jmp_cache_hash_func(pc);
>> -    tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash]);
>> +    tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash].tb);
>>   
>>       if (likely(tb &&
>>                  tb->pc == pc &&
>> @@ -266,7 +266,7 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
>>       if (tb == NULL) {
>>           return NULL;
>>       }
>> -    qatomic_set(&cpu->tb_jmp_cache[hash], tb);
>> +    qatomic_set(&cpu->tb_jmp_cache[hash].tb, tb);
>>       return tb;
>>   }
>>   
>> @@ -987,6 +987,8 @@ int cpu_exec(CPUState *cpu)
>>   
>>               tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
>>               if (tb == NULL) {
>> +                uint32_t h;
>> +
>>                   mmap_lock();
>>                   tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
>>                   mmap_unlock();
>> @@ -994,7 +996,8 @@ int cpu_exec(CPUState *cpu)
>>                    * We add the TB in the virtual pc hash table
>>                    * for the fast lookup
>>                    */
>> -                qatomic_set(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(pc)], tb);
>> +                h = tb_jmp_cache_hash_func(pc);
>> +                qatomic_set(&cpu->tb_jmp_cache[h].tb, tb);
>>               }
>>   
>>   #ifndef CONFIG_USER_ONLY
>> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
>> index f5e6ca2da2..fb8f3087f1 100644
>> --- a/accel/tcg/cputlb.c
>> +++ b/accel/tcg/cputlb.c
>> @@ -103,7 +103,7 @@ static void tb_jmp_cache_clear_page(CPUState *cpu, target_ulong page_addr)
>>       unsigned int i, i0 = tb_jmp_cache_hash_page(page_addr);
>>   
>>       for (i = 0; i < TB_JMP_PAGE_SIZE; i++) {
>> -        qatomic_set(&cpu->tb_jmp_cache[i0 + i], NULL);
>> +        qatomic_set(&cpu->tb_jmp_cache[i0 + i].tb, NULL);
>>       }
>>   }
>>   
>> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
>> index f429d33981..efa479ccf3 100644
>> --- a/accel/tcg/translate-all.c
>> +++ b/accel/tcg/translate-all.c
>> @@ -1187,8 +1187,8 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
>>       /* remove the TB from the hash list */
>>       h = tb_jmp_cache_hash_func(tb->pc);
>>       CPU_FOREACH(cpu) {
>> -        if (qatomic_read(&cpu->tb_jmp_cache[h]) == tb) {
>> -            qatomic_set(&cpu->tb_jmp_cache[h], NULL);
>> +        if (qatomic_read(&cpu->tb_jmp_cache[h].tb) == tb) {
>> +            qatomic_set(&cpu->tb_jmp_cache[h].tb, NULL);
>>           }
>>       }
> 
> 


