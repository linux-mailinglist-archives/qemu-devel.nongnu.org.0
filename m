Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E02441EC5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 17:45:07 +0100 (CET)
Received: from localhost ([::1]:51206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhaQk-0002Fu-CZ
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 12:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhaP8-0001HR-4p
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 12:43:27 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:33347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhaP5-0001aa-E4
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 12:43:24 -0400
Received: by mail-qt1-x82b.google.com with SMTP id h16so11970988qtk.0
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 09:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wT7B7bIkO0WUNtdReUKgShwQF/lGSvXRnFTTzLrv7Io=;
 b=UYpV6ckA95mMpA/gCDpq1MjzfdgVw7lCRDVqbzTVapnM1JTumRGP746ZiVumqlD5Jp
 FAFWTWOA8HIO/TFXUZzpeD+E13pOpjG2wSvyh0aINOr984JeQqz622rg6jPlJ8jHxraK
 Zfb5RykQQPSVIqKKtu6IKyOaKefThdQB5vT69l+3qR7gDReX2UYbuxMoMrzPe8h1mDhG
 FEwOQz5YrDYms2IaAGhW0oxeIcnyziexXdy9sgAZ9Fe9FfyDGX+oGy/xF1u54zOeGKl/
 Yq9zZRqs1e3Ygt+Sgzz3h0RN+6amYYOeEN0P5Ttih4fBB6n4cfsRvORc5su5N2O5bFb7
 5OXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wT7B7bIkO0WUNtdReUKgShwQF/lGSvXRnFTTzLrv7Io=;
 b=u1AeZw2MWznIJVOOUY9zAKwPx1esvYQUcb+dEAZW9D+CLutf2IrBjipOzAiIBE/NON
 wfiotg3IY6DAWvGylNnGcKFn2l9hvp5WTT12gVnXpDC3qYG9a4CZ5ccOOYA02AgzTtmv
 Bfk8GT4zE+hPWsgouOtuDO7JtWNOaCL/48vfhgt+ax9GXgco2qfg7Pmrs8a2Z52cTcVN
 rnqxFMqC1sIeMTXYwweeOYTN93nPmaxUaVJYlBxIU3njIO+IkMePnQH7pRpxGhcYmuhv
 /VwaC65Qyk2F66J/x1ENYo1v7WBMkNEYCvVd0qvPYNybMldq3ak1GlVuejQufdFjz+bx
 wTgA==
X-Gm-Message-State: AOAM531f4dnI59vDthBUURKxgp8CRfXDN2k1XCP3kYycKjBRfAM3JbZH
 b+R2xPcuZeEx9U9NDeRSRIpqS9NFQToNyw==
X-Google-Smtp-Source: ABdhPJyGyif5ok/hKg7w6PWCKGFLEhOm/ftwmuV35ar3CRpT+NQDkSh7/v1aQ8vnglGsLQ6IyE/D3A==
X-Received: by 2002:ac8:7f13:: with SMTP id f19mr31570299qtk.294.1635785002267; 
 Mon, 01 Nov 2021 09:43:22 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id h2sm10405572qkf.106.2021.11.01.09.43.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 09:43:21 -0700 (PDT)
Subject: Re: [PATCH 11/13] target/riscv: Switch context in exception return
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-12-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0105910e-fd68-21ea-8ff0-36752dd0b2e7@linaro.org>
Date: Mon, 1 Nov 2021 12:43:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101100143.44356-12-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 6:01 AM, LIU Zhiwei wrote:
> After excpetion return, we should give a xlen view of context in new
> priveledge, including the general registers, pc, and CSRs.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>   target/riscv/helper.h                         |  1 +
>   .../riscv/insn_trans/trans_privileged.c.inc   |  2 ++
>   target/riscv/op_helper.c                      | 26 +++++++++++++++++++
>   3 files changed, 29 insertions(+)
> 
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index e198d43981..9b379d7232 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -71,6 +71,7 @@ DEF_HELPER_2(sret, tl, env, tl)
>   DEF_HELPER_2(mret, tl, env, tl)
>   DEF_HELPER_1(wfi, void, env)
>   DEF_HELPER_1(tlb_flush, void, env)
> +DEF_HELPER_1(switch_context_xl, void, env)
>   #endif
>   
>   /* Hypervisor functions */
> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
> index 75c6ef80a6..6e39632f83 100644
> --- a/target/riscv/insn_trans/trans_privileged.c.inc
> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
> @@ -78,6 +78,7 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
>   
>       if (has_ext(ctx, RVS)) {
>           gen_helper_sret(cpu_pc, cpu_env, cpu_pc);
> +        gen_helper_switch_context_xl(cpu_env);
>           tcg_gen_exit_tb(NULL, 0); /* no chaining */
>           ctx->base.is_jmp = DISAS_NORETURN;
>       } else {
> @@ -94,6 +95,7 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a)
>   #ifndef CONFIG_USER_ONLY
>       tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
>       gen_helper_mret(cpu_pc, cpu_env, cpu_pc);
> +    gen_helper_switch_context_xl(cpu_env);
>       tcg_gen_exit_tb(NULL, 0); /* no chaining */
>       ctx->base.is_jmp = DISAS_NORETURN;
>       return true;
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index ee7c24efe7..20cf8ad883 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -70,6 +70,32 @@ target_ulong helper_csrrw(CPURISCVState *env, int csr,
>   }
>   
>   #ifndef CONFIG_USER_ONLY
> +void helper_switch_context_xl(CPURISCVState *env)
> +{
> +    RISCVMXL xl = cpu_get_xl(env);
> +    if (xl == env->misa_mxl_max) {
> +        return;
> +    }
> +    assert(xl < env->misa_mxl_max);
> +    switch (xl) {
> +    case MXL_RV32:
> +        for (int i = 1; i < 32; i++) {
> +            env->gpr[i] = (int32_t)env->gpr[i];
> +        }

I think this is wrong.  As I read the spec, the new context ignores high bits and writes 
sign-extended values, but registers that are not written should not be changed.

I think that a unit test with SXLEN == 64 and UXLEN == 32, where the U-mode program 
executes only the ECALL instruction, should leave the high 32 bits of all gprs unchanged 
on re-entry to S-mode.

> +        env->pc = (int32_t)env->pc;

I think this will happen naturally via patch 3.

> +        /*
> +         * For the read-only bits of the previous-width CSR, the bits at the
> +         * same positions in the temporary register are set to zeros.
> +         */
> +        if ((env->priv == PRV_U) && (env->misa_ext & RVV)) {
> +            env->vl = 0;
> +            env->vtype = 0;
> +        }

I don't understand this.  The return from the S-mode interrupt handler to the U-mode 
program should preserve the U-mode VTYPE.


r~

