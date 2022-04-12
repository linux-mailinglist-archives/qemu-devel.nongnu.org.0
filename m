Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AC64FCBF9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 03:52:37 +0200 (CEST)
Received: from localhost ([::1]:49018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne5hs-0002fo-80
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 21:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne5gZ-0001p6-JJ
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 21:51:15 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:39924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne5gX-00067K-Lv
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 21:51:15 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 mp16-20020a17090b191000b001cb5efbcab6so1120273pjb.4
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 18:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zl3Xz5RpfpMaN4yKBGEsIDDz7v0ozAyL6E0xHwEO21M=;
 b=RL9d1oO3IPl7O+2+47X0bENz4cFwfJ5RaE257+cYtqK0TYUJd+5GoR02uhTjzkh+Dx
 EwiJuwF47M6A3RnAfN/rv4sChil2qDrGNIbkjWthFsxm3CtSwyO46AYzv+sklQaEc4IS
 SRqJN2n4hQqUGEbaTtM1Hbw02ShtK1t9JHfJxthg5xlaZMJa/tsVPv1gnWGCt7se5K3c
 /gP/x1FU9YEIqD8snnNr0MaUDejG5Jf6vSYAm0egYG9aXPIvuwtqXeVp9EAJikoscAIq
 X/6HfvzxNNsChgSPMdbV6uWk8DdSYMsceRvFiQJEniD+/bB4xsAVuQhu4YXzTmRqxKii
 Z6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zl3Xz5RpfpMaN4yKBGEsIDDz7v0ozAyL6E0xHwEO21M=;
 b=KdhGZoawNYoRpB5FkxtTDCOVu4BQLbIWHnesQ4MgXpdKK93faVr4i1+jf0enOwjWEa
 5vj0a+57YbqxyGexRxI5mrN17gr2hqE1dKDwtXvdxu74lc/zu8vxqzK4QuHg8VJZZQd/
 QFH3Tq9S1kHORq/QIY91f42gRmUioUsqEsaOdtg52QeCdeT4T5qHxDx+GXXgQOGF9K89
 V/cFx7Fc3px2hu5SAOCK3daw+FKXwn7M3wU2tFcdwalVIQnXUuHTXM9gkMAwvpa2tHVh
 3Y8dfXprIyu3hZwiTV6Xhhph9v+1NIrkMsmTsc4WZtgbqhbUGiE3IAObT9HGVUAxVjlq
 i/8Q==
X-Gm-Message-State: AOAM532sQzhMn9XrB/v4i8XE0kfDF2DKyFgpe8OD3CJCgtsLI5dTFBpl
 294sefwdd3955ogXiGTRFZdlDg==
X-Google-Smtp-Source: ABdhPJxFahhq5U4ecbB6QGJqbofyYMNVOv6/TojI5E58w84ZXP8c23JW8//050quPGR29DXhyLtXWw==
X-Received: by 2002:a17:90a:4e08:b0:1cb:a3ac:938b with SMTP id
 n8-20020a17090a4e0800b001cba3ac938bmr2284362pjh.112.1649728272167; 
 Mon, 11 Apr 2022 18:51:12 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 p64-20020a622943000000b004fdd5c07d0bsm34023307pfp.63.2022.04.11.18.51.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 18:51:11 -0700 (PDT)
Message-ID: <f8f924b4-3cfb-0946-4e54-247453880925@linaro.org>
Date: Mon, 11 Apr 2022 18:51:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/9] target/ppc: Implemented vector divide instructions
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220405195558.66144-1-lucas.araujo@eldorado.org.br>
 <20220405195558.66144-3-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220405195558.66144-3-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: Greg Kurz <groug@kaod.org>, danielhb413@gmail.com, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/5/22 12:55, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> vdivsw: Vector Divide Signed Word
> vdivuw: Vector Divide Unsigned Word
> vdivsd: Vector Divide Signed Doubleword
> vdivud: Vector Divide Unsigned Doubleword
> 
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |  7 ++++
>   target/ppc/translate/vmx-impl.c.inc | 59 +++++++++++++++++++++++++++++
>   2 files changed, 66 insertions(+)
> 
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index ac2d3da9a7..597768558b 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -703,3 +703,10 @@ XVTLSBB         111100 ... -- 00010 ..... 111011011 . - @XX2_bf_xb
>   &XL_s           s:uint8_t
>   @XL_s           ......-------------- s:1 .......... -   &XL_s
>   RFEBB           010011-------------- .   0010010010 -   @XL_s
> +
> +## Vector Division Instructions
> +
> +VDIVSW          000100 ..... ..... ..... 00110001011    @VX
> +VDIVUW          000100 ..... ..... ..... 00010001011    @VX
> +VDIVSD          000100 ..... ..... ..... 00111001011    @VX
> +VDIVUD          000100 ..... ..... ..... 00011001011    @VX
> diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
> index 6101bca3fd..be35d6fdf3 100644
> --- a/target/ppc/translate/vmx-impl.c.inc
> +++ b/target/ppc/translate/vmx-impl.c.inc
> @@ -3236,6 +3236,65 @@ TRANS(VMULHSD, do_vx_mulh, true , do_vx_vmulhd_i64)
>   TRANS(VMULHUW, do_vx_mulh, false, do_vx_vmulhw_i64)
>   TRANS(VMULHUD, do_vx_mulh, false, do_vx_vmulhd_i64)
>   
> +#define TRANS_VDIV_VMOD(FLAGS, NAME, VECE, FNI4_FUNC, FNI8_FUNC)        \
> +static bool trans_##NAME(DisasContext *ctx, arg_VX *a)                  \
> +{                                                                       \
> +    static const GVecGen3 op = {                                        \
> +        .fni4 = FNI4_FUNC,                                              \
> +        .fni8 = FNI8_FUNC,                                              \
> +        .vece = VECE                                                    \
> +    };                                                                  \
> +                                                                        \
> +    REQUIRE_VECTOR(ctx);                                                \
> +    REQUIRE_INSNS_FLAGS2(ctx, FLAGS);                                   \
> +                                                                        \
> +    tcg_gen_gvec_3(avr_full_offset(a->vrt), avr_full_offset(a->vra),    \
> +                   avr_full_offset(a->vrb), 16, 16, &op);               \
> +                                                                        \
> +    return true;                                                        \
> +}

Better to use a standalone helper and TRANS() -- the op structure doesn't *need* to be 
static const.

> +
> +#define DO_VDIV_VMOD(NAME, SZ, DIV, SIGNED)                             \
> +static void NAME(TCGv_i##SZ t, TCGv_i##SZ a, TCGv_i##SZ b)              \
> +{                                                                       \
> +    /*                                                                  \
> +     *  If N/0 the instruction used by the backend might deliver        \
> +     *  an invalid division signal to the process, so if b = 0 return   \
> +     *  N/1 and if signed instruction, the same for a = int_min, b = -1 \
> +     */                                                                 \
> +    if (SIGNED) {                                                       \
> +        TCGv_i##SZ t0 = tcg_temp_new_i##SZ();                           \
> +        TCGv_i##SZ t1 = tcg_temp_new_i##SZ();                           \
> +        tcg_gen_setcondi_i##SZ(TCG_COND_EQ, t0, a, INT##SZ##_MIN);      \
> +        tcg_gen_setcondi_i##SZ(TCG_COND_EQ, t1, b, -1);                 \
> +        tcg_gen_and_i##SZ(t0, t0, t1);                                  \
> +        tcg_gen_setcondi_i##SZ(TCG_COND_EQ, t1, b, 0);                  \
> +        tcg_gen_or_i##SZ(t0, t0, t1);                                   \
> +        tcg_gen_movi_i##SZ(t1, 0);                                      \
> +        tcg_gen_movcond_i##SZ(TCG_COND_NE, b, t0, t1, t0, b);           \
> +        DIV(t, a, b);                                                   \
> +        tcg_temp_free_i##SZ(t0);                                        \
> +        tcg_temp_free_i##SZ(t1);                                        \
> +    } else {                                                            \
> +        TCGv_i##SZ zero = tcg_constant_i##SZ(0);                        \
> +        TCGv_i##SZ one = tcg_constant_i##SZ(1);                         \
> +        tcg_gen_movcond_i##SZ(TCG_COND_EQ, b, b, zero, one, b);         \
> +        DIV(t, a, b);                                                   \
> +    }                                                                   \
> +}

This is overkill.  Even if you keep some macros, passing in SIGNED and using it in the 
outermost if is a sign you should split the macro in two.

However, only tcg_gen_div_i64 really requires the full signed treatment; tcg_gen_div_i32 
can be better handled by extending to i64, because INT32_MIN / -1ULL does not trap.

I think this would be much easier to read as 4 separate functions.


r~

