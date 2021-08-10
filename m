Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A47333E8489
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 22:45:38 +0200 (CEST)
Received: from localhost ([::1]:40270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDYcz-0005j3-7d
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 16:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mDYbq-0004sc-AZ; Tue, 10 Aug 2021 16:44:26 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:54164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mDYbo-000709-Ia; Tue, 10 Aug 2021 16:44:26 -0400
Received: by mail-pj1-x1030.google.com with SMTP id j1so34870633pjv.3;
 Tue, 10 Aug 2021 13:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rNIm4BBph+Nn5DjF8yFTCPKetWZl7Ror7iWVVAVROcE=;
 b=MBGLxCgWROceMzJZ8z8FiU4opIasPTYPRikvp9tzORQBk6ENegJpaWVnJFpda1WR0C
 ClVdRXC47+2nLYFQF7jaXkjDCAWhm7GKPJu8uAITyHrn5Nil6IbTQ9iVC2GeXnUB6Ejc
 ByqoJDHxHPHj/XEaYihTdkuICWfNLZ6Ub5IAY3rrTnYicLMrdE2qt18wyY0v8/qGMBqo
 x4CnKJl6Sv1I+OiQuTSo2zflZbYrDRqnSeYwz3MtFHcY2t4Xv6Dc4ijI68IwR77DzlF8
 kL3QCfMpfgy22LEBeDZYKC9w05rKWNdgSmKDGLfrp4TaaWyFgfRJ1dmhZOQd5q3j84Lk
 lQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rNIm4BBph+Nn5DjF8yFTCPKetWZl7Ror7iWVVAVROcE=;
 b=YExCKHo5nG/hNBTG1Wvq+yJGnf1pJvVetWJrIWNaYqwjqlQWCO5KfBF6m8k5o0cy4C
 F5mX6jGPrdQ21e4B5sRvpYnXwHrb4KXs6pZxicpqzGahZv6Q25GX3NjI90nJPvrVI6CC
 9odEz5sCR00YMjDqMz7xRnDuMPFjc8xFEBxktZopt2RULUahUzJ/qi3LGgSq6AYn/1R/
 gCNjuGb5wMNC3yZxARkcsfhiN6FFa/PtJB/LI0e4lM391pEntGYjBl2A+eDhutCq9lFN
 ee+q727tzvcwXqtLjmlBbDK/mp6/TIfQBlkPpafPWyt+dtmQyyuAXc6qz3oSV4qIfGSY
 u1IQ==
X-Gm-Message-State: AOAM531S2CKvu1n4BtvOGGwJa+mzZF6qtkZQTJ9SBIv4YwOHoCQqlv4u
 HAAUknjGRn5x+lEVzefwprg=
X-Google-Smtp-Source: ABdhPJzvi9vH02J3IGr/DRKaEYPqZnGeyjQfmMiPqpLGfFyT20/napCJLKT5drFP3lN+eYmOpPMQrw==
X-Received: by 2002:a05:6a00:1796:b029:3c4:25d6:9ee1 with SMTP id
 s22-20020a056a001796b02903c425d69ee1mr31036659pfg.21.1628628262889; 
 Tue, 10 Aug 2021 13:44:22 -0700 (PDT)
Received: from [192.168.10.222] ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id c15sm22418926pjr.22.2021.08.10.13.44.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 13:44:22 -0700 (PDT)
Subject: Re: [PATCH 13/19] target/ppc/translate: PMU: handle setting of PMCs
 while running
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-14-danielhb413@gmail.com> <YRH7KxFOysT5dTJg@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <d6f5d9d3-3562-eb66-df8a-723f7983132d@gmail.com>
Date: Tue, 10 Aug 2021 17:44:18 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRH7KxFOysT5dTJg@yekko>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=danielhb413@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Cc: gustavo.romero@linaro.org, clg@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/10/21 1:06 AM, David Gibson wrote:
> On Mon, Aug 09, 2021 at 10:10:51AM -0300, Daniel Henrique Barboza wrote:
>> The initial PMU support were made under the assumption that the counters
>> would be set before running the PMU and read after either freezing the
>> PMU manually or via a performance monitor alert.
>>
>> Turns out that some EBB powerpc kernel tests set the counters after
>> unfreezing the counters. Setting a PMC value when the PMU is running
>> means that, at that moment, the baseline for calculating the events (set
>> in env->pmu_base_icount) needs to be updated. Updating this baseline
>> means that we need to update all the PMCs with their actual value at
>> that moment. Any existing counter negative timer needs to be discarded
>> an a new one, with the updated values, must be set again.
>>
>> This patch does that via a new 'helper_store_pmc()' that is called in
>> the mtspr() callbacks of the PMU registers, spr_write_pmu_ureg() and
>> spr_write_pmu_generic() in target/ppc/translate.c
>>
>> With this change, EBB powerpc kernel tests such as  'no_handler_test'
>> are now passing.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   target/ppc/helper.h            |  1 +
>>   target/ppc/pmu_book3s_helper.c | 36 ++++++++++++++++++++++++++++++++--
>>   target/ppc/translate.c         | 27 +++++++++++++++++++++++++
>>   3 files changed, 62 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
>> index 5122632784..757665b360 100644
>> --- a/target/ppc/helper.h
>> +++ b/target/ppc/helper.h
>> @@ -21,6 +21,7 @@ DEF_HELPER_1(hrfid, void, env)
>>   DEF_HELPER_2(store_lpcr, void, env, tl)
>>   DEF_HELPER_2(store_pcr, void, env, tl)
>>   DEF_HELPER_2(store_mmcr0, void, env, tl)
>> +DEF_HELPER_3(store_pmc, void, env, i32, i64)
>>   #endif
>>   DEF_HELPER_1(check_tlb_flush_local, void, env)
>>   DEF_HELPER_1(check_tlb_flush_global, void, env)
>> diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helper.c
>> index 58ae65e22b..e7af273cb6 100644
>> --- a/target/ppc/pmu_book3s_helper.c
>> +++ b/target/ppc/pmu_book3s_helper.c
>> @@ -173,7 +173,7 @@ void cpu_ppc_pmu_timer_init(CPUPPCState *env)
>>       env->pmu_intr_timer = timer;
>>   }
>>   
>> -static bool mmcr0_counter_neg_cond_enabled(uint64_t mmcr0)
>> +static bool counter_negative_cond_enabled(uint64_t mmcr0)
> 
> Can you fold this rename into the patch which introduces the function
> please.
> 
>>   {
>>       return mmcr0 & MMCR0_PMC1CE;
>>   }
>> @@ -219,9 +219,41 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
>>                * Start performance monitor alert timer for counter negative
>>                * events, if needed.
>>                */
>> -            if (mmcr0_counter_neg_cond_enabled(env->spr[SPR_POWER_MMCR0])) {
>> +            if (counter_negative_cond_enabled(env->spr[SPR_POWER_MMCR0])) {
>>                   set_PMU_excp_timer(env);
>>               }
>>           }
>>       }
>>   }
>> +
>> +void helper_store_pmc(CPUPPCState *env, uint32_t sprn, uint64_t value)
>> +{
>> +    bool pmu_frozen = env->spr[SPR_POWER_MMCR0] & MMCR0_FC;
>> +    uint64_t curr_icount, icount_delta;
>> +
>> +    if (pmu_frozen) {
>> +        env->spr[sprn] = value;
>> +        return;
>> +    }
>> +
>> +    curr_icount = (uint64_t)icount_get_raw();
>> +    icount_delta = curr_icount - env->pmu_base_icount;
>> +
>> +    /* Update the counter with the events counted so far */
>> +    update_PMCs(env, icount_delta);
>> +
>> +    /* Set the counter to the desirable value after update_PMCs() */
>> +    env->spr[sprn] = value;
>> +
>> +    /*
>> +     * Delete the current timer and restart a new one with the
>> +     * updated values.
>> +     */
>> +    timer_del(env->pmu_intr_timer);
>> +
>> +    env->pmu_base_icount = curr_icount;
> 
> I'd expect some of this code to be shared with the unfreeze path using
> a helper.  Is there a reason that's not the case?
> 
> Do you also need to deal with any counter interrupts that have already
> been generated by the old counter?  Are the counter overflow events
> edge-triggered or level-triggered?


I'd say that counter negative overflow are edge triggered - we can set any
starting value for the counters but the counter negative overflow is
triggered always with the counter reaching 0x8000000.

If a counter was about to trigger a c.n overflow and then the user set it
back to 0, that c.n overflow is lost.


Thanks,


Daniel


> 
>> +    if (counter_negative_cond_enabled(env->spr[SPR_POWER_MMCR0])) {
>> +        set_PMU_excp_timer(env);
>> +    }
>> +}
>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>> index afc254a03f..3e890cc4d8 100644
>> --- a/target/ppc/translate.c
>> +++ b/target/ppc/translate.c
>> @@ -409,11 +409,25 @@ void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
>>   
>>   void spr_write_pmu_generic(DisasContext *ctx, int sprn, int gprn)
>>   {
>> +    TCGv_i32 t_sprn;
>> +
>>       switch (sprn) {
>>       case SPR_POWER_MMCR0:
>>           gen_icount_io_start(ctx);
>>           gen_helper_store_mmcr0(cpu_env, cpu_gpr[gprn]);
>>           break;
>> +    case SPR_POWER_PMC1:
>> +    case SPR_POWER_PMC2:
>> +    case SPR_POWER_PMC3:
>> +    case SPR_POWER_PMC4:
>> +    case SPR_POWER_PMC5:
>> +    case SPR_POWER_PMC6:
>> +        gen_icount_io_start(ctx);
>> +
>> +        t_sprn = tcg_const_i32(sprn);
>> +        gen_helper_store_pmc(cpu_env, t_sprn, cpu_gpr[gprn]);
>> +        tcg_temp_free_i32(t_sprn);
>> +        break;
>>       default:
>>           spr_write_generic(ctx, sprn, gprn);
>>       }
>> @@ -585,6 +599,7 @@ void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
>>   void spr_write_pmu_ureg(DisasContext *ctx, int sprn, int gprn)
>>   {
>>       TCGv t0, t1;
>> +    TCGv_i32 t_sprn;
>>       int effective_sprn = sprn + 0x10;
>>   
>>       if (((ctx->spr[SPR_POWER_MMCR0] & MMCR0_PMCC) >> 18) == 0) {
>> @@ -616,6 +631,18 @@ void spr_write_pmu_ureg(DisasContext *ctx, int sprn, int gprn)
>>           tcg_temp_free(t0);
>>           tcg_temp_free(t1);
>>           break;
>> +    case SPR_POWER_PMC1:
>> +    case SPR_POWER_PMC2:
>> +    case SPR_POWER_PMC3:
>> +    case SPR_POWER_PMC4:
>> +    case SPR_POWER_PMC5:
>> +    case SPR_POWER_PMC6:
>> +        gen_icount_io_start(ctx);
>> +
>> +        t_sprn = tcg_const_i32(effective_sprn);
>> +        gen_helper_store_pmc(cpu_env, t_sprn, cpu_gpr[gprn]);
>> +        tcg_temp_free_i32(t_sprn);
>> +        break;
>>       default:
>>           gen_store_spr(effective_sprn, cpu_gpr[gprn]);
>>           break;
> 

