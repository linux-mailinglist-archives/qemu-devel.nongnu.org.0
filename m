Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ED144B150
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 17:38:49 +0100 (CET)
Received: from localhost ([::1]:57098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkU92-0003GE-B3
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 11:38:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkU84-0002Rx-BF; Tue, 09 Nov 2021 11:37:48 -0500
Received: from [2607:f8b0:4864:20::22e] (port=46796
 helo=mail-oi1-x22e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkU82-0006xI-42; Tue, 09 Nov 2021 11:37:48 -0500
Received: by mail-oi1-x22e.google.com with SMTP id s139so17529771oie.13;
 Tue, 09 Nov 2021 08:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/FBXUlKhwJisyKpKNUhST3FlPic/fx/2Kb1ffv5tT4I=;
 b=VTHPugUGfPwwx0ur4SA0CWQYMDXp18NJosKYC5C1FOdaRRPhHlX2mXadw/qTQr9HSh
 J/K4b14Grd6A2ZEUT119t7FwDO4QO+kS8x36qThOOFgJ7v9AILeEGuhiKswg7Jec+9+m
 Z64mnJpdRGf8VKMB6W+F4fubwzDDXNTzydnWXq7GULdPTNE/bQSewVKmRXN5ds5ZG4PP
 CQiPjLaVHuHtkmV9b2fBlKyIvgxw66hVGBZpChILuDD1ZJrxqunxnE37OqgeWIBVIE6n
 MkajNCG4AIZUu2UoJwRY1G993feTfgMH11Y25uFgaT3S8/HSrenEnR42AfaP3KMTYbUw
 8djw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/FBXUlKhwJisyKpKNUhST3FlPic/fx/2Kb1ffv5tT4I=;
 b=odUZfFtFRUIyl+EMq45R9X6szKvBo9d+QyHUKtIavBgYb0hSKJOsIx83X32yrYcchj
 nCiE/owElzZ2ZS9MJJT4qQAtLPXgXvpp0LAPewUCvq+3vQ5dcRwOpAymFtM5v2sVoPJr
 bHVzG15Pvt2eRyyShSbgGt2KRlNQNAhid9CIP8NA4BTh9xW31Rbg1/nHVnW+SaofCXTG
 mJpjkty70AHuAUQyjJufek8U3qsppcdRwdzZyffgFPuQLtMJ6jKqmd0b9vDUouD4U5Hw
 /u/DM7f3zp0r8DZA6vKUC+wkhy75AqrhPkTmAbhCEbWVTjNHl4mRIKJFJrtqGwLmsfvL
 nmBw==
X-Gm-Message-State: AOAM533JOY9c8dPfQz6ST43CjvhP6f6h0+PM/q4vwSUIBqo1irkzmwDL
 IoeKNs/r5NLvniCYNAu1Qqc=
X-Google-Smtp-Source: ABdhPJy4aFNyuFIAtNSmxZ9HHuMHtne+3UqCsmIGEvEsNEWi8rzcikFn64spwrqIGWkkkYDfn61hPw==
X-Received: by 2002:a54:4789:: with SMTP id o9mr7071321oic.74.1636475864337;
 Tue, 09 Nov 2021 08:37:44 -0800 (PST)
Received: from [192.168.10.222] ([189.79.219.109])
 by smtp.gmail.com with ESMTPSA id t13sm2668025oiw.30.2021.11.09.08.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 08:37:43 -0800 (PST)
Message-ID: <2458d27b-75eb-e4f8-c588-efd8c50df5fc@gmail.com>
Date: Tue, 9 Nov 2021 13:37:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/2] target/ppc: Fixed call to deferred exception
Content-Language: en-US
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211020125724.78028-1-lucas.araujo@eldorado.org.br>
 <20211020125724.78028-2-lucas.araujo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211020125724.78028-2-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.364,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 richard.henderson@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/20/21 09:57, Lucas Mateus Castro (alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>
> 
> mtfsf, mtfsfi and mtfsb1 instructions call helper_float_check_status
> after updating the value of FPSCR, but helper_float_check_status
> checks fp_status and fp_status isn't updated based on FPSCR and
> since the value of fp_status is reset earlier in the instruction,
> it's always 0.
> 
> Because of this helper_float_check_status would change the FI bit to 0
> as this bit checks if the last operation was inexact and
> float_flag_inexact is always 0.
> 
> These instructions also don't throw exceptions correctly since
> helper_float_check_status throw exceptions based on fp_status.
> 
> This commit created a new helper, helper_fpscr_check_status that checks
> FPSCR value instead of fp_status and checks for a larger variety of
> exceptions than do_float_check_status.
> 
> The hardware used to compare QEMU's behavior to, was a Power9.

Extra comma before "was a Power9".

Aside from that, LGTM.


Thanks,


Daniel

> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/266
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.castro@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c            | 41 ++++++++++++++++++++++++++++++
>   target/ppc/helper.h                |  1 +
>   target/ppc/translate/fp-impl.c.inc |  6 ++---
>   3 files changed, 45 insertions(+), 3 deletions(-)
> 
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index c4896cecc8..f086cb503f 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -414,6 +414,47 @@ void helper_store_fpscr(CPUPPCState *env, uint64_t val, uint32_t nibbles)
>       ppc_store_fpscr(env, val);
>   }
>   
> +void helper_fpscr_check_status(CPUPPCState *env)
> +{
> +    CPUState *cs = env_cpu(env);
> +    target_ulong fpscr = env->fpscr;
> +    int error = 0;
> +
> +    if ((fpscr & FP_VXSOFT) && (fpscr_ve != 0)) {
> +        error = POWERPC_EXCP_FP_VXSOFT;
> +    } else if ((fpscr & FP_OX) && (fpscr & FP_OE)) {
> +        error = POWERPC_EXCP_FP_OX;
> +    } else if ((fpscr & FP_UX) && (fpscr & FP_UE)) {
> +        error = POWERPC_EXCP_FP_UX;
> +    } else if ((fpscr & FP_XX) && (fpscr & FP_XE)) {
> +        error = POWERPC_EXCP_FP_XX;
> +    } else if ((fpscr & FP_ZX) && (fpscr & FP_ZE)) {
> +        error = POWERPC_EXCP_FP_ZX;
> +    } else if ((fpscr & FP_VXSNAN) && (fpscr_ve != 0)) {
> +        error = POWERPC_EXCP_FP_VXSNAN;
> +    } else if ((fpscr & FP_VXISI) && (fpscr_ve != 0)) {
> +        error = POWERPC_EXCP_FP_VXISI;
> +    } else if ((fpscr & FP_VXIDI) && (fpscr_ve != 0)) {
> +        error = POWERPC_EXCP_FP_VXIDI;
> +    } else if ((fpscr & FP_VXZDZ) && (fpscr_ve != 0)) {
> +        error = POWERPC_EXCP_FP_VXZDZ;
> +    } else if ((fpscr & FP_VXIMZ) && (fpscr_ve != 0)) {
> +        error = POWERPC_EXCP_FP_VXIMZ;
> +    } else if ((fpscr & FP_VXVC) && (fpscr_ve != 0)) {
> +        error = POWERPC_EXCP_FP_VXVC;
> +    }
> +
> +    if (error) {
> +        cs->exception_index = POWERPC_EXCP_PROGRAM;
> +        env->error_code = error | POWERPC_EXCP_FP;
> +        /* Deferred floating-point exception after target FPSCR update */
> +        if (fp_exceptions_enabled(env)) {
> +            raise_exception_err_ra(env, cs->exception_index,
> +                                   env->error_code, GETPC());
> +        }
> +    }
> +}
> +
>   static void do_float_check_status(CPUPPCState *env, uintptr_t raddr)
>   {
>       CPUState *cs = env_cpu(env);
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 4076aa281e..baa3715e73 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -61,6 +61,7 @@ DEF_HELPER_FLAGS_1(cntlzw32, TCG_CALL_NO_RWG_SE, i32, i32)
>   DEF_HELPER_FLAGS_2(brinc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>   
>   DEF_HELPER_1(float_check_status, void, env)
> +DEF_HELPER_1(fpscr_check_status, void, env)
>   DEF_HELPER_1(reset_fpstatus, void, env)
>   DEF_HELPER_2(compute_fprf_float64, void, env, i64)
>   DEF_HELPER_3(store_fpscr, void, env, i64, i32)
> diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
> index 9f7868ee28..0a9b1ecc60 100644
> --- a/target/ppc/translate/fp-impl.c.inc
> +++ b/target/ppc/translate/fp-impl.c.inc
> @@ -782,7 +782,7 @@ static void gen_mtfsb1(DisasContext *ctx)
>           tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
>       }
>       /* We can raise a deferred exception */
> -    gen_helper_float_check_status(cpu_env);
> +    gen_helper_fpscr_check_status(cpu_env);
>   }
>   
>   /* mtfsf */
> @@ -818,7 +818,7 @@ static void gen_mtfsf(DisasContext *ctx)
>           tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
>       }
>       /* We can raise a deferred exception */
> -    gen_helper_float_check_status(cpu_env);
> +    gen_helper_fpscr_check_status(cpu_env);
>       tcg_temp_free_i64(t1);
>   }
>   
> @@ -851,7 +851,7 @@ static void gen_mtfsfi(DisasContext *ctx)
>           tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
>       }
>       /* We can raise a deferred exception */
> -    gen_helper_float_check_status(cpu_env);
> +    gen_helper_fpscr_check_status(cpu_env);
>   }
>   
>   /***                         Floating-point load                           ***/
> 

