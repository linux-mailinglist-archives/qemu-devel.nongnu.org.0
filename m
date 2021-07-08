Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A82A3C15B5
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:10:05 +0200 (CEST)
Received: from localhost ([::1]:35114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1VfA-0005MD-65
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1Ve3-0004ft-FF
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:08:55 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:33774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1Ve0-00056J-Qz
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:08:55 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 oj11-20020a17090b4d8bb029017338c124dcso1617841pjb.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1C4XC2A2vpQwUCxhsNOuqNLO6peET4MrdezfNACTGn4=;
 b=RqindX04sjHjsI0He4fo604lSfFQLUtts4d5e/H52nKNphz6aKLZ17NFujXJi9QBAr
 bAMRV9q/YLkzLpYxjTqnPxxBEW0jZMj4PmlZ9Rr+xfYbi48HAzQK3VWMmG7gjisGhf0s
 R3yTiM8wWYxgTuQkjIOluYcf8+xlA8fPo4ym8zwCqfNTYvGeVXCUotagQRpF4CCCiTh4
 4Q+ioUGDUAyHBdxaYXST0iSZXQf6Lfrhgh9Ybxdd/Nudciet5o54vT++oK5PEP/j3g91
 NKm9SnSC9gZyiNrrus1OBfTEMpYAC0pi9JkXLzUstGgCKvNlxulSmxmBjAa47s9dU+Qh
 2liA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1C4XC2A2vpQwUCxhsNOuqNLO6peET4MrdezfNACTGn4=;
 b=TydQhFRC52nWx54Tb13wpRBIYvqDhuht8SFu3QT1xqSmXyntZmBR/vtLy0ESyIXg8s
 niAfKt1wF5+d/sBBiL2HJEQIh1FL3ruWlshTaG9YjNm+Eq0HM0Kk6xzT2mC494oCwx7C
 23KV/bHgfFhLfJ0GF76YRrpMSTpcqdGhLyNXyB9lt4qqHbhhc49OTAZ8ZnJvs9XHBm0E
 JrlQqPBhjOA+dkxIpm8W90D5KXNBXBIao/rj0Slp68vbteW9a8ZazQsI/Vo7MNCM3xSM
 iQi0+/oRdcGJfBq/+7Nv37n7+YY9WoABNstNebPpIj1bX1hAEnHB1x8f4JjBmrV8oO10
 IuvA==
X-Gm-Message-State: AOAM533m+d9uJA/T9JCeBwlEXwwz6ax1F7TpjUcfnd/wjZ/lIA2ydgvJ
 pNaALehnpNz6maE4r/ddUkiu9g==
X-Google-Smtp-Source: ABdhPJz+lYz/pHVcdmCy653q8Y/0Tk2igjFflJczfBdc+JEDTZY0n47ThSTNM9hQMQtimp2DRIvjvw==
X-Received: by 2002:a17:902:cecb:b029:128:e535:89f2 with SMTP id
 d11-20020a170902cecbb0290128e53589f2mr26390890plg.51.1625756931368; 
 Thu, 08 Jul 2021 08:08:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id g12sm10675762pjk.25.2021.07.08.08.08.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 08:08:50 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Implement MTE3
To: Peter Collingbourne <pcc@google.com>
References: <20210611190653.754648-1-pcc@google.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1b726e8c-5f6d-856e-72c1-8d835f28aec2@linaro.org>
Date: Thu, 8 Jul 2021 08:08:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210611190653.754648-1-pcc@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, qemu-devel@nongnu.org,
 Evgenii Stepanov <eugenis@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Peter.

r~

On 6/11/21 12:06 PM, Peter Collingbourne wrote:
> MTE3 introduces an asymmetric tag checking mode, in which loads are
> checked synchronously and stores are checked asynchronously. Add
> support for it.
> 
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> ---
>   target/arm/cpu64.c      |  2 +-
>   target/arm/mte_helper.c | 83 ++++++++++++++++++++++++++---------------
>   2 files changed, 53 insertions(+), 32 deletions(-)
> 
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 1c23187d1a..c7a1626bec 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -683,7 +683,7 @@ static void aarch64_max_initfn(Object *obj)
>            * during realize if the board provides no tag memory, much like
>            * we do for EL2 with the virtualization=on property.
>            */
> -        t = FIELD_DP64(t, ID_AA64PFR1, MTE, 2);
> +        t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);
>           cpu->isar.id_aa64pfr1 = t;
>   
>           t = cpu->isar.id_aa64mmfr0;
> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
> index 166b9d260f..7b76d871ff 100644
> --- a/target/arm/mte_helper.c
> +++ b/target/arm/mte_helper.c
> @@ -538,13 +538,51 @@ void HELPER(stzgm_tags)(CPUARMState *env, uint64_t ptr, uint64_t val)
>       }
>   }
>   
> +static void mte_sync_check_fail(CPUARMState *env, uint32_t desc,
> +                                uint64_t dirty_ptr, uintptr_t ra)
> +{
> +    int is_write, syn;
> +
> +    env->exception.vaddress = dirty_ptr;
> +
> +    is_write = FIELD_EX32(desc, MTEDESC, WRITE);
> +    syn = syn_data_abort_no_iss(arm_current_el(env) != 0, 0, 0, 0, 0, is_write,
> +                                0x11);
> +    raise_exception_ra(env, EXCP_DATA_ABORT, syn, exception_target_el(env), ra);
> +    g_assert_not_reached();
> +}
> +
> +static void mte_async_check_fail(CPUARMState *env, uint32_t desc,
> +                                 uint64_t dirty_ptr, uintptr_t ra,
> +                                 ARMMMUIdx arm_mmu_idx, int el)
> +{
> +    int select;
> +
> +    if (regime_has_2_ranges(arm_mmu_idx)) {
> +        select = extract64(dirty_ptr, 55, 1);
> +    } else {
> +        select = 0;
> +    }
> +    env->cp15.tfsr_el[el] |= 1 << select;
> +#ifdef CONFIG_USER_ONLY
> +    /*
> +     * Stand in for a timer irq, setting _TIF_MTE_ASYNC_FAULT,
> +     * which then sends a SIGSEGV when the thread is next scheduled.
> +     * This cpu will return to the main loop at the end of the TB,
> +     * which is rather sooner than "normal".  But the alternative
> +     * is waiting until the next syscall.
> +     */
> +    qemu_cpu_kick(env_cpu(env));
> +#endif
> +}
> +
>   /* Record a tag check failure.  */
>   static void mte_check_fail(CPUARMState *env, uint32_t desc,
>                              uint64_t dirty_ptr, uintptr_t ra)
>   {
>       int mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
>       ARMMMUIdx arm_mmu_idx = core_to_aa64_mmu_idx(mmu_idx);
> -    int el, reg_el, tcf, select, is_write, syn;
> +    int el, reg_el, tcf;
>       uint64_t sctlr;
>   
>       reg_el = regime_el(env, arm_mmu_idx);
> @@ -564,14 +602,8 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
>       switch (tcf) {
>       case 1:
>           /* Tag check fail causes a synchronous exception. */
> -        env->exception.vaddress = dirty_ptr;
> -
> -        is_write = FIELD_EX32(desc, MTEDESC, WRITE);
> -        syn = syn_data_abort_no_iss(arm_current_el(env) != 0, 0, 0, 0, 0,
> -                                    is_write, 0x11);
> -        raise_exception_ra(env, EXCP_DATA_ABORT, syn,
> -                           exception_target_el(env), ra);
> -        /* noreturn, but fall through to the assert anyway */
> +        mte_sync_check_fail(env, desc, dirty_ptr, ra);
> +        break;
>   
>       case 0:
>           /*
> @@ -583,30 +615,19 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
>   
>       case 2:
>           /* Tag check fail causes asynchronous flag set.  */
> -        if (regime_has_2_ranges(arm_mmu_idx)) {
> -            select = extract64(dirty_ptr, 55, 1);
> -        } else {
> -            select = 0;
> -        }
> -        env->cp15.tfsr_el[el] |= 1 << select;
> -#ifdef CONFIG_USER_ONLY
> -        /*
> -         * Stand in for a timer irq, setting _TIF_MTE_ASYNC_FAULT,
> -         * which then sends a SIGSEGV when the thread is next scheduled.
> -         * This cpu will return to the main loop at the end of the TB,
> -         * which is rather sooner than "normal".  But the alternative
> -         * is waiting until the next syscall.
> -         */
> -        qemu_cpu_kick(env_cpu(env));
> -#endif
> +        mte_async_check_fail(env, desc, dirty_ptr, ra, arm_mmu_idx, el);
>           break;
>   
> -    default:
> -        /* Case 3: Reserved. */
> -        qemu_log_mask(LOG_GUEST_ERROR,
> -                      "Tag check failure with SCTLR_EL%d.TCF%s "
> -                      "set to reserved value %d\n",
> -                      reg_el, el ? "" : "0", tcf);
> +    case 3:
> +        /*
> +         * Tag check fail causes asynchronous flag set for stores, or
> +         * a synchronous exception for loads.
> +         */
> +        if (FIELD_EX32(desc, MTEDESC, WRITE)) {
> +            mte_async_check_fail(env, desc, dirty_ptr, ra, arm_mmu_idx, el);
> +        } else {
> +            mte_sync_check_fail(env, desc, dirty_ptr, ra);
> +        }
>           break;
>       }
>   }
> 


