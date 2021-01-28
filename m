Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F447306C96
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 06:07:25 +0100 (CET)
Received: from localhost ([::1]:35184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4zWe-0005id-JW
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 00:07:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l4zVT-0004u3-3j
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 00:06:11 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:53657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l4zVP-0005vz-QT
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 00:06:10 -0500
Received: by mail-pj1-x1033.google.com with SMTP id p15so3170758pjv.3
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 21:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4u7IAX9sxIn2svLNlf3OwVzzQqO76+/nJLEz08+az+4=;
 b=mpj22SqmpHUcEDRNIWksIbHBzFhBJK7sn6yV7SQ36BqqhjNH6GlmEGj1GTFs9e2xws
 N3+lmlTB9EUrg1L9UODzVdUAhk0nWjPXhxT018xDGmoEY6b/g8q7c+5L3DfXyiu0a64c
 MSlO6gEpWNxpVIHj+EK6R5Ms56pEaynySP6EaW+rIvpQ+hsERsHz8eE2UXj2JpO/T2So
 wqads7dfOjd9INe2o73dMkOTrgk2/tU7f5m8EnqlkiuMZ0NEcvlcD1nW02RBiH97NFrV
 O8uq4ZHGz5omjGtdauUpYo4GaZyuH0b2EA7pSaEY3JOyjv2yv+92GdH0eOfiIeJhkq6n
 9YJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4u7IAX9sxIn2svLNlf3OwVzzQqO76+/nJLEz08+az+4=;
 b=IE8SSuVgVDey2N0tRLU2wbmbIoPGovhR3WZUTxEDAJxnTpAz38T/A/qZssxVKsjrlT
 9jvWePiyLPbGItaPqLfYl98MExMTFqca+9IFTeCIjIniZcKTa0lmNoM4TjAouatfcgY2
 iu6RCgWBi08BvxJZAtzxx81N5/GTvl/oLCg793JchfSN7T8/gfMnohqq9bburVRGHDNR
 AKSl3NzcpPphdrHEvJ6c9PcQVzW/e/tmnH8D6zq4FXdfskIqt9ELydaIT1QyK3uabEmF
 owhz/42ELtGW+1xaYF2aBUux9M/QIN0pJsA++8chmbPjaEWhOIZrBeoWXdvA9ElStckl
 lBoA==
X-Gm-Message-State: AOAM532CZlrr+TIze224v7COrY+9vicFxdq8kpX2+T0o3gPQA4Xgk9gi
 ctqrWs7ur3hQpJfQsTCpacUDtg==
X-Google-Smtp-Source: ABdhPJwE/HHR/ECMN/u/dT4g2rMgn4hYloF/mbag8WJ9uUtVnQ0CPUEXipvsnkuohfQ3KRvQVk5yyg==
X-Received: by 2002:a17:90a:a084:: with SMTP id
 r4mr9321953pjp.190.1611810365918; 
 Wed, 27 Jan 2021 21:06:05 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id b27sm4038265pgb.82.2021.01.27.21.06.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 21:06:05 -0800 (PST)
Subject: Re: [PATCH v3 2/4] target/arm: Add support for FEAT_DIT, Data
 Independent Timing
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
References: <20210128044529.1403-1-rebecca@nuviainc.com>
 <20210128044529.1403-3-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5ac0bb98-107b-004c-4ef3-b4ee0e15530a@linaro.org>
Date: Wed, 27 Jan 2021 19:06:02 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210128044529.1403-3-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 6:45 PM, Rebecca Cran wrote:
> Add support for FEAT_DIT. DIT (Data Independent Timing) is a required
> feature for ARMv8.4. Since virtual machine execution is largely
> nondeterministic and TCG is outside of the security domain, it's
> implemented as a NOP.
> 
> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


This misses the convert from AA32 CPSR to AA64 SPSR on exception entry (and
vice-versa on return).

In particular: CPSR.DIT (bit 21) -> SPSR_EL1.DIT (bit 24), and merging
PSTATE.SS into SPSR_EL1.SS (bit 21).


r~

> ---
>  target/arm/cpu.h           | 12 +++++++++++
>  target/arm/helper.c        | 22 ++++++++++++++++++++
>  target/arm/internals.h     |  6 ++++++
>  target/arm/translate-a64.c | 12 +++++++++++
>  4 files changed, 52 insertions(+)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index df0d6778330f..56b1053dfdec 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1242,6 +1242,7 @@ void pmu_init(ARMCPU *cpu);
>  #define CPSR_IT_2_7 (0xfc00U)
>  #define CPSR_GE (0xfU << 16)
>  #define CPSR_IL (1U << 20)
> +#define CPSR_DIT (1U << 21)
>  #define CPSR_PAN (1U << 22)
>  #define CPSR_J (1U << 24)
>  #define CPSR_IT_0_1 (3U << 25)
> @@ -1309,6 +1310,7 @@ void pmu_init(ARMCPU *cpu);
>  #define PSTATE_SS (1U << 21)
>  #define PSTATE_PAN (1U << 22)
>  #define PSTATE_UAO (1U << 23)
> +#define PSTATE_DIT (1U << 24)
>  #define PSTATE_TCO (1U << 25)
>  #define PSTATE_V (1U << 28)
>  #define PSTATE_C (1U << 29)
> @@ -3875,6 +3877,11 @@ static inline bool isar_feature_aa32_tts2uxn(const ARMISARegisters *id)
>      return FIELD_EX32(id->id_mmfr4, ID_MMFR4, XNX) != 0;
>  }
>  
> +static inline bool isar_feature_aa32_dit(const ARMISARegisters *id)
> +{
> +    return FIELD_EX32(id->id_pfr0, ID_PFR0, DIT) != 0;
> +}
> +
>  /*
>   * 64-bit feature tests via id registers.
>   */
> @@ -4119,6 +4126,11 @@ static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
>      return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, XNX) != 0;
>  }
>  
> +static inline bool isar_feature_aa64_dit(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, DIT) != 0;
> +}
> +
>  /*
>   * Feature tests for "does this exist in either 32-bit or 64-bit?"
>   */
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 7b7e72ba878c..435208121e9f 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -4419,6 +4419,24 @@ static const ARMCPRegInfo uao_reginfo = {
>      .readfn = aa64_uao_read, .writefn = aa64_uao_write
>  };
>  
> +static uint64_t aa64_dit_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    return env->pstate & PSTATE_DIT;
> +}
> +
> +static void aa64_dit_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                           uint64_t value)
> +{
> +    env->pstate = (env->pstate & ~PSTATE_DIT) | (value & PSTATE_DIT);
> +}
> +
> +static const ARMCPRegInfo dit_reginfo = {
> +    .name = "DIT", .state = ARM_CP_STATE_AA64,
> +    .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 5,
> +    .type = ARM_CP_NO_RAW, .access = PL0_RW,
> +    .readfn = aa64_dit_read, .writefn = aa64_dit_write
> +};
> +
>  static CPAccessResult aa64_cacheop_poc_access(CPUARMState *env,
>                                                const ARMCPRegInfo *ri,
>                                                bool isread)
> @@ -8203,6 +8221,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>          define_one_arm_cp_reg(cpu, &uao_reginfo);
>      }
>  
> +    if (cpu_isar_feature(aa64_dit, cpu)) {
> +        define_one_arm_cp_reg(cpu, &dit_reginfo);
> +    }
> +
>      if (arm_feature(env, ARM_FEATURE_EL2) && cpu_isar_feature(aa64_vh, cpu)) {
>          define_arm_cp_regs(cpu, vhe_reginfo);
>      }
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 853fa88fd616..3d11e42d8e1b 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1222,6 +1222,9 @@ static inline uint32_t aarch32_cpsr_valid_mask(uint64_t features,
>      if (isar_feature_aa32_pan(id)) {
>          valid |= CPSR_PAN;
>      }
> +    if (isar_feature_aa32_dit(id)) {
> +        valid |= CPSR_DIT;
> +    }
>  
>      return valid;
>  }
> @@ -1240,6 +1243,9 @@ static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
>      if (isar_feature_aa64_uao(id)) {
>          valid |= PSTATE_UAO;
>      }
> +    if (isar_feature_aa64_dit(id)) {
> +        valid |= PSTATE_DIT;
> +    }
>      if (isar_feature_aa64_mte(id)) {
>          valid |= PSTATE_TCO;
>      }
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index ffc060e5d70c..1c4b8d02f3b8 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -1700,6 +1700,18 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
>          tcg_temp_free_i32(t1);
>          break;
>  
> +    case 0x1a: /* DIT */
> +        if (!dc_isar_feature(aa64_dit, s)) {
> +            goto do_unallocated;
> +        }
> +        if (crm & 1) {
> +            set_pstate_bits(PSTATE_DIT);
> +        } else {
> +            clear_pstate_bits(PSTATE_DIT);
> +        }
> +        /* There's no need to rebuild hflags because DIT is a nop */
> +        break;
> +
>      case 0x1e: /* DAIFSet */
>          t1 = tcg_const_i32(crm);
>          gen_helper_msr_i_daifset(cpu_env, t1);
> 


