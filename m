Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E74F5AD70D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 18:03:27 +0200 (CEST)
Received: from localhost ([::1]:54340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVEZJ-0004zD-C7
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 12:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVESV-0006eG-EB
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 11:56:23 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVEST-00056L-IT
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 11:56:23 -0400
Received: by mail-wr1-x429.google.com with SMTP id bz13so8497707wrb.2
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 08:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=9GTH1nJHgJ2sym9OhRgJB+XUcKtw4ahVPfBDLE9H4J0=;
 b=NVnUk43W08BjM6L/WxXlarQJV31+Oxwcn9tTpbOcC3qD47/0tdwj5Md6wq6PPSF6LG
 6Q9JgnR9uioAffUaxtLwksvdLHtBp5jmRembVX+lYeX43FloX3QYSNsgxBV1fcLIDq17
 r8bstO1DunDkEvScV7gig8ApEZ/Yx9hONC/LuJlfJ/pWEsWQ771sB24fXMsUrVsoHGLe
 2uqgO1nOf5qxtVh2B+LNjsQS2kRAsRZQrIldOT8zimYavWX4/5R3JlDLQG/jUOP3O3il
 u09RnOBt5aTfGutgLSP4pakM3NTXJXIkXwcS1AnWUsQsjjkLonOSuAOOCGotHzMfLuM3
 eGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=9GTH1nJHgJ2sym9OhRgJB+XUcKtw4ahVPfBDLE9H4J0=;
 b=H6OMT2CHhUYaQ+hukQgHTe4qIB0JknZAZLKeGPrwTFNk+YmJ/D4VeUJxJx9PwQoMaF
 mQSOffxL2KJJnkUZVCzuun1mJHnGkMPtdgJVMsw2/sodHRCX+IzA8M15N6r7wlt/3W1P
 9TMw6ltYzMNmE/T9aYB6FjMxVxrZ63SjBCGS+brlNXIu4jnaXVd67WwOcrY0eOoMhMd+
 VHV5lCztAquDaFtZMFUqDvMIq9WSSLQO0GFFL4jWLkirXBsNN9N6C+WlpLgM2DVHaEbA
 GxvyouBhmbAYW55oFjW3BOzTNdIFz3wYjPq3zjaNIO7FOV2y4O1NnBlQFpwvSw1oUgRj
 QrTw==
X-Gm-Message-State: ACgBeo1uZWqB7URZz8AKy1NDJOhyjLqtHNKsKNv5Wmz6JAiis8+s/mfG
 OtcO8vxukRWXWyga3j6Jc2l0BQ==
X-Google-Smtp-Source: AA6agR5Nkvz7C1xQ4yMKeo/364UPRIugTzVU9lTXhgyQQV9jPOlTmXwF4g+IgMYFamneXeVOTyQEgg==
X-Received: by 2002:adf:eb52:0:b0:223:9164:b5b4 with SMTP id
 u18-20020adfeb52000000b002239164b5b4mr25101769wrn.518.1662393380117; 
 Mon, 05 Sep 2022 08:56:20 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9?
 ([2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a056000023000b002285f73f11dsm8247778wrz.81.2022.09.05.08.56.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 08:56:19 -0700 (PDT)
Message-ID: <f2fac00a-cacb-25b3-f6ae-9f35a82ab440@linaro.org>
Date: Mon, 5 Sep 2022 16:56:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] target/ppc: Merge fsqrt and fsqrts helpers
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, matheus.ferst@eldorado.org.br, lucas.araujo@eldorado.org.br,
 leandro.lupori@eldorado.org.br, lucas.coutinho@eldorado.org.br
References: <20220905123746.54659-1-victor.colombo@eldorado.org.br>
 <20220905123746.54659-4-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905123746.54659-4-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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

On 9/5/22 13:37, Víctor Colombo wrote:
> These two helpers are almost identical, differing only by the softfloat
> operation it calls. Merge them into one using a macro.
> Also, take this opportunity to capitalize the helper name as we moved
> the instruction to decodetree in a previous patch.
> 
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c            | 35 +++++++++++-------------------
>   target/ppc/helper.h                |  4 ++--
>   target/ppc/translate/fp-impl.c.inc |  4 ++--
>   3 files changed, 17 insertions(+), 26 deletions(-)
> 
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index 0f045b70f8..32995179b5 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -830,30 +830,21 @@ static void float_invalid_op_sqrt(CPUPPCState *env, int flags,
>       }
>   }
>   
> -/* fsqrt - fsqrt. */
> -float64 helper_fsqrt(CPUPPCState *env, float64 arg)
> -{
> -    float64 ret = float64_sqrt(arg, &env->fp_status);
> -    int flags = get_float_exception_flags(&env->fp_status);
> -
> -    if (unlikely(flags & float_flag_invalid)) {
> -        float_invalid_op_sqrt(env, flags, 1, GETPC());
> -    }
> -
> -    return ret;
> +#define FPU_FSQRT(name, op)                                                   \
> +float64 helper_##name(CPUPPCState *env, float64 arg)                          \
> +{                                                                             \
> +    float64 ret = op(arg, &env->fp_status);                                   \
> +    int flags = get_float_exception_flags(&env->fp_status);                   \
> +                                                                              \
> +    if (unlikely(flags & float_flag_invalid)) {                               \
> +        float_invalid_op_sqrt(env, flags, 1, GETPC());                        \
> +    }                                                                         \

Existing bug, but this is missing to clear fp status to start.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> +                                                                              \
> +    return ret;                                                               \
>   }
>   
> -/* fsqrts - fsqrts. */
> -float64 helper_fsqrts(CPUPPCState *env, float64 arg)
> -{
> -    float64 ret = float64r32_sqrt(arg, &env->fp_status);
> -    int flags = get_float_exception_flags(&env->fp_status);
> -
> -    if (unlikely(flags & float_flag_invalid)) {
> -        float_invalid_op_sqrt(env, flags, 1, GETPC());
> -    }
> -    return ret;
> -}
> +FPU_FSQRT(FSQRT, float64_sqrt)
> +FPU_FSQRT(FSQRTS, float64r32_sqrt)
>   
>   /* fre - fre. */
>   float64 helper_fre(CPUPPCState *env, float64 arg)
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 159b352f6e..68610896b8 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -116,8 +116,8 @@ DEF_HELPER_4(fmadds, i64, env, i64, i64, i64)
>   DEF_HELPER_4(fmsubs, i64, env, i64, i64, i64)
>   DEF_HELPER_4(fnmadds, i64, env, i64, i64, i64)
>   DEF_HELPER_4(fnmsubs, i64, env, i64, i64, i64)
> -DEF_HELPER_2(fsqrt, f64, env, f64)
> -DEF_HELPER_2(fsqrts, f64, env, f64)
> +DEF_HELPER_2(FSQRT, f64, env, f64)
> +DEF_HELPER_2(FSQRTS, f64, env, f64)
>   DEF_HELPER_2(fre, i64, env, i64)
>   DEF_HELPER_2(fres, i64, env, i64)
>   DEF_HELPER_2(frsqrte, i64, env, i64)
> diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
> index 7a90c0e350..8d5cf0f982 100644
> --- a/target/ppc/translate/fp-impl.c.inc
> +++ b/target/ppc/translate/fp-impl.c.inc
> @@ -280,8 +280,8 @@ static bool do_helper_fsqrt(DisasContext *ctx, arg_A_tb *a,
>       return true;
>   }
>   
> -TRANS(FSQRT, do_helper_fsqrt, gen_helper_fsqrt);
> -TRANS(FSQRTS, do_helper_fsqrt, gen_helper_fsqrts);
> +TRANS(FSQRT, do_helper_fsqrt, gen_helper_FSQRT);
> +TRANS(FSQRTS, do_helper_fsqrt, gen_helper_FSQRTS);
>   
>   /***                     Floating-Point multiply-and-add                   ***/
>   /* fmadd - fmadds */


