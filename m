Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894755966F0
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 03:45:26 +0200 (CEST)
Received: from localhost ([::1]:57330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO87Z-0002EA-4i
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 21:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO85A-0000g4-AO
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 21:42:57 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:46938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO857-0004QS-3x
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 21:42:55 -0400
Received: by mail-oi1-x22d.google.com with SMTP id o184so13986911oif.13
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 18:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=G+NX9yG+cQcSfOLtQvR4QK5L/MHuq5l84HwvCb8qhBc=;
 b=o9xMiTbQJyCv4rELXt0TgLVScrfuCA9vKNINdiEmEVaumQQZV3ZfEjWaTbobLrsAuT
 /fYDNBPM7FJew+oC/eGN7o+atDCjKyku0bP8hnYz6E8/RHsfGo6W9BuStu0UT6vw73HK
 wdfi0STPeEiE8E1AJItaCJIm0tmEBvCNqz8Url1L+15J1j970wdhZPCDCRjDT+neLTe8
 jeiIxXETAgDFfzjzCsOxT5Ik+frBcpczQdKqZ4uri802YKHGEqFMf13knH4DWNoCUr6H
 12RCZGU4CDR30cn0d4v6aZ5B/e7oCBVq5yAfEDYEC/RwBXvFtGD6gq1VKtAtvYm/Fa2q
 JTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=G+NX9yG+cQcSfOLtQvR4QK5L/MHuq5l84HwvCb8qhBc=;
 b=w2+yKsuP7mJfKEVWBhsKz1yT4+1de8p3Y17tVFtAXbJpZqwuoyBsL+483XLSPaNtYi
 3BsgugCmWZv68tZx2vfGZAPJZR+CKXyNjREice9HsghuY4RCJmbz2IE8+qJjg76Pca1E
 CbjLG22S7dw5XLN0B7TrfbqvO23t455wGzhnThmMr1da3AZ4bObl+Y1oeeKHRywxkQr8
 +SIZJpbTroWYa8vC7M3V6q+JMGM+/eC+MNbxuxvmyhNKMCK8IV1igIauTksPzqt1UMQX
 PBtZYtgEozhJ1Qw8QMPbIwD3LSvagd0EJE279T9OyiXBqOEm3+wZGCF3Oa+6lB+j9BWo
 UqYg==
X-Gm-Message-State: ACgBeo3X5nbSW6g7s06iOIKfznS0W81h8OL9BUfDAtpUvOUv3UrtKroA
 E4KblbGBz0IiDYg8KfPLE3urIg==
X-Google-Smtp-Source: AA6agR7bM7qTDdMFBkP18sQwqleTzRNVIVqOnMtHEe4dQojT+hYSxB1DBiUqxot6lAaDkqBQtVV51Q==
X-Received: by 2002:a05:6808:209:b0:342:ed43:2f97 with SMTP id
 l9-20020a056808020900b00342ed432f97mr526776oie.255.1660700571813; 
 Tue, 16 Aug 2022 18:42:51 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80f6:61fa:d8dc:3b22:dd70:b1e4?
 ([2605:ef80:80f6:61fa:d8dc:3b22:dd70:b1e4])
 by smtp.gmail.com with ESMTPSA id
 l26-20020a056830155a00b00636d0984f5asm3075558otp.11.2022.08.16.18.42.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 18:42:50 -0700 (PDT)
Message-ID: <a67bc498-5155-cc40-9640-81db22b2b37a@linaro.org>
Date: Tue, 16 Aug 2022 20:42:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.2 14/21] accel/tcg: Hoist get_page_addr_code out of
 tb_lookup
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, alex.bennee@linaro.org
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
 <20220812180806.2128593-15-richard.henderson@linaro.org>
 <15f8efa3aae897569383305155315d03ee5b70e3.camel@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <15f8efa3aae897569383305155315d03ee5b70e3.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/16/22 18:43, Ilya Leoshkevich wrote:
> On Fri, 2022-08-12 at 11:07 -0700, Richard Henderson wrote:
>> We will want to re-use the result of get_page_addr_code
>> beyond the scope of tb_lookup.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   accel/tcg/cpu-exec.c | 34 ++++++++++++++++++++++++----------
>>   1 file changed, 24 insertions(+), 10 deletions(-)
>>
>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>> index a9b7053274..889355b341 100644
>> --- a/accel/tcg/cpu-exec.c
>> +++ b/accel/tcg/cpu-exec.c
>> @@ -209,13 +209,12 @@ static bool tb_lookup_cmp(const void *p, const
>> void *d)
>>   }
>>   
>>   /* Might cause an exception, so have a longjmp destination ready */
>> -static TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
>> -                                   target_ulong cs_base,
>> +static TranslationBlock *tb_lookup(CPUState *cpu, tb_page_addr_t
>> phys_pc,
>> +                                   target_ulong pc, target_ulong
>> cs_base,
>>                                      uint32_t flags, uint32_t cflags)
>>   {
>>       CPUArchState *env = cpu->env_ptr;
>>       TranslationBlock *tb;
>> -    tb_page_addr_t phys_pc;
>>       struct tb_desc desc;
>>       uint32_t jmp_hash, tb_hash;
>>   
>> @@ -240,11 +239,8 @@ static TranslationBlock *tb_lookup(CPUState
>> *cpu, target_ulong pc,
>>       desc.cflags = cflags;
>>       desc.trace_vcpu_dstate = *cpu->trace_dstate;
>>       desc.pc = pc;
>> -    phys_pc = get_page_addr_code(desc.env, pc);
>> -    if (phys_pc == -1) {
>> -        return NULL;
>> -    }
>>       desc.phys_page1 = phys_pc & TARGET_PAGE_MASK;
>> +
>>       tb_hash = tb_hash_func(phys_pc, pc, flags, cflags, *cpu-
>>> trace_dstate);
>>       tb = qht_lookup_custom(&tb_ctx.htable, &desc, tb_hash,
>> tb_lookup_cmp);
>>       if (tb == NULL) {
>> @@ -371,6 +367,7 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState
>> *env)
>>       TranslationBlock *tb;
>>       target_ulong cs_base, pc;
>>       uint32_t flags, cflags;
>> +    tb_page_addr_t phys_pc;
>>   
>>       cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
>>   
>> @@ -379,7 +376,12 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState
>> *env)
>>           cpu_loop_exit(cpu);
>>       }
>>   
>> -    tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
>> +    phys_pc = get_page_addr_code(env, pc);
>> +    if (phys_pc == -1) {
>> +        return tcg_code_gen_epilogue;
>> +    }
>> +
>> +    tb = tb_lookup(cpu, phys_pc, pc, cs_base, flags, cflags);
>>       if (tb == NULL) {
>>           return tcg_code_gen_epilogue;
>>       }
>> @@ -482,6 +484,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
>>       TranslationBlock *tb;
>>       target_ulong cs_base, pc;
>>       uint32_t flags, cflags;
>> +    tb_page_addr_t phys_pc;
>>       int tb_exit;
>>   
>>       if (sigsetjmp(cpu->jmp_env, 0) == 0) {
>> @@ -504,7 +507,12 @@ void cpu_exec_step_atomic(CPUState *cpu)
>>            * Any breakpoint for this insn will have been recognized
>> earlier.
>>            */
>>   
>> -        tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
>> +        phys_pc = get_page_addr_code(env, pc);
>> +        if (phys_pc == -1) {
>> +            tb = NULL;
>> +        } else {
>> +            tb = tb_lookup(cpu, phys_pc, pc, cs_base, flags,
>> cflags);
>> +        }
>>           if (tb == NULL) {
>>               mmap_lock();
>>               tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
>> @@ -949,6 +957,7 @@ int cpu_exec(CPUState *cpu)
>>               TranslationBlock *tb;
>>               target_ulong cs_base, pc;
>>               uint32_t flags, cflags;
>> +            tb_page_addr_t phys_pc;
>>   
>>               cpu_get_tb_cpu_state(cpu->env_ptr, &pc, &cs_base,
>> &flags);
>>   
>> @@ -970,7 +979,12 @@ int cpu_exec(CPUState *cpu)
>>                   break;
>>               }
>>   
>> -            tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
>> +            phys_pc = get_page_addr_code(cpu->env_ptr, pc);
>> +            if (phys_pc == -1) {
>> +                tb = NULL;
>> +            } else {
>> +                tb = tb_lookup(cpu, phys_pc, pc, cs_base, flags,
>> cflags);
>> +            }
>>               if (tb == NULL) {
>>                   mmap_lock();
>>                   tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
> 
> This patch did not make it into v2, but having get_page_addr_code()
> before tb_lookup() in helper_lookup_tb_ptr() helped raise the exception
> when trying to execute a no-longer-executable TB.
> 
> Was it dropped for performance reasons?

Ah, yes.  I dropped it because I ran into some regression, and started minimizing the 
tree.  Because of the extra lock that needed to be held (next patch, also dropped), I 
couldn't prove this actually helped.

I think the bit that's causing your user-only failure at the moment is the jump cache. 
This patch hoisted the page table check before the jmp_cache.  For system, cputlb.c takes 
care of flushing the jump cache with page table changes; we still don't have anything in 
user-only that takes care of that.


r~


