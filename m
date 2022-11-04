Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F88B61A638
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 01:01:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or6bW-0002Jz-Ah; Fri, 04 Nov 2022 20:00:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or6bU-0002Jq-Bd
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 20:00:04 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or6bS-0004EI-8K
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 20:00:04 -0400
Received: by mail-oi1-x236.google.com with SMTP id r76so6720169oie.13
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 17:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qsRoYWTMk8c0kC68gCy21gJKyc7HyI5YGdRz3g4tAFE=;
 b=DO2YXYx2G8iWZ/Bj/8o4m/Xkz992+yocuRQen6Z3Fs1t+4u5Dg4ANgEVBapV0eueQ1
 XOxpAotvfAoxBnvFrW1zxi1eyLddT7C/ELFntFtq1CE77olI8luYcnrZYkgg6sGxBUXH
 ZGwBCpMIkIWMEcO2oaZjHZ2pVzH8/1Qbtyw/a2JscT7DmiJSSNaskLsE8NbCsukRezqU
 /0NCO6r9DF1C3oDAlhHPtWrzF1frzdbwy0GaUhmB75jPLINSZ7bFS3mNkzs+3a1vDMHL
 etCYtlErVxOrIo1Fnpli3NLU2aU8lXGW6edWIf9SgSNuW3oAowOO5DzXBiMTpT1GQQC4
 NpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qsRoYWTMk8c0kC68gCy21gJKyc7HyI5YGdRz3g4tAFE=;
 b=4ss89qp+eeyoHhseWxXIrdMs/YNxGADADYGtYJLWhzPeiF78YJNBge5vBBi1NKxIpb
 cRM4xfuoU4SkuZ//izHQuLHA/mg6R1uZvMMkQzYHEMKY1SVnVd1gd4B+E1YT+eJgWrpo
 BE5EqNUyX7qCZ/TBwSb4ZSgnFX3vTNg0OdVe65DdQCwZxHMUQ5b7j4HDRTHbJqYXgHpB
 CbZhxC7nQgBSRci+96fTJAKq63DsUAWp7TOjJ+aY4IeZDdodysG5C8AlhmHnU7mwg8BA
 qNxA1b4vHvLzDVQCop9YtJeOlF90vaxQRtec8YNzSrqzPPnjRtPpcnysnykX6mrViJUF
 FrLg==
X-Gm-Message-State: ACrzQf2zGR9/QjoSU2qyacRG8yavF5x0WOOPDJWUBegHVJsuBvB9zKlR
 d95OxAV+I/hgsGpYDyqf2HWVkQ==
X-Google-Smtp-Source: AMsMyM73pS0DxdBtqXhYnZwuIXlVLVK8bsm5kO92A3U7Rl8hg1Vjicdk+/rpTkm+8/n1U4rKnybLPw==
X-Received: by 2002:a54:4016:0:b0:35a:3878:f22a with SMTP id
 x22-20020a544016000000b0035a3878f22amr10312380oie.47.1667606400641; 
 Fri, 04 Nov 2022 17:00:00 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.176.28])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a056870e0c800b00130d060ce80sm204297oab.31.2022.11.04.16.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 16:59:59 -0700 (PDT)
Message-ID: <47274054-00f3-d313-9dea-c32202d79ed6@linaro.org>
Date: Sat, 5 Nov 2022 10:59:47 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 03/11] Hexagon (target/hexagon) Add overrides for
 S2_asr_r_r_sat/S2_asl_r_r_sat
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20221104192631.29434-1-tsimpson@quicinc.com>
 <20221104192631.29434-4-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221104192631.29434-4-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/5/22 06:26, Taylor Simpson wrote:
> +static void gen_set_usr_field(int field, TCGv val)
> +{
> +    tcg_gen_deposit_tl(hex_new_value[HEX_REG_USR], hex_new_value[HEX_REG_USR],
> +                       val,
> +                       reg_field_info[field].offset,
> +                       reg_field_info[field].width);
> +}

If you plan to use this for something else, fine, but since you're never clearing USR_OVF, 
it would be better to use tcg_gen_ori_tl.


> +static void gen_sat_i64(TCGv_i64 dst, TCGv_i64 src, uint32_t bits)
> +{
> +    TCGLabel *label = gen_new_label();
> +
> +    tcg_gen_sextract_i64(dst, src, 0, bits);
> +    tcg_gen_brcond_i64(TCG_COND_EQ, dst, src, label);
> +    {
> +        TCGv_i64 min = tcg_constant_i64(-(1LL << (bits - 1)));
> +        TCGv_i64 max = tcg_constant_i64((1LL << (bits - 1)) - 1);
> +        tcg_gen_movcond_i64(TCG_COND_LT, dst, src, tcg_constant_i64(0),
> +                            min, max);
> +        gen_set_usr_fieldi(USR_OVF, 1);
> +    }
> +    gen_set_label(label);
> +}

This could be done branchless:

    tcg_gen_smax_i64(dst, src, min);
    tcg_gen_smin_i64(dst, dst, max);

    tcg_gen_setcond_i64(TCG_COND_NE, o_64, dst, src);
    tcg_gen_trunc_i64_tl(o_tl, o_64);
    tcg_gen_shli_tl(o_tl, reg_field_info[USE_OVF].offset);
    tcg_gen_or_tl(hex_new_value[HEX_REG_USR], hex_new_value[HEX_REG_USR], o_tl);


> +static void gen_satval(TCGv_i64 dest, TCGv_i64 source, uint32_t bits)
> +{
> +    TCGv_i64 min = tcg_constant_i64(-(1LL << (bits - 1)));
> +    TCGv_i64 max = tcg_constant_i64((1LL << (bits - 1)) - 1);
> +
> +    gen_set_usr_fieldi(USR_OVF, 1);
> +    tcg_gen_movcond_i64(TCG_COND_LT, dest, source, tcg_constant_i64(0),
> +                        min, max);
> +}

Likewise.

> +/* Shift left with saturation */
> +static void gen_shl_sat(TCGv RdV, TCGv RsV, TCGv shift_amt)
> +{
> +    /*
> +     * int64_t A = (fCAST4_8s(RsV) << shift_amt;
> +     * if (((int32_t)((fSAT(A)) ^ ((int32_t)(RsV)))) < 0) {
> +     *     RdV = fSATVALN(32, ((int32_t)(RsV)))
> +     * } else if (((RsV) > 0) && ((A) == 0)) {
> +     *     RdV = fSATVALN(32, (RsV));
> +     * } else {
> +     *     RdV = fSAT(A);
> +     * }
> +     */

A little bit tricky to follow, but is this overflow condition to be the same as

     x_32 = rsv << shift_amt;
     y_32 = x_32 >> shift_amt;
     overflow = x_32 != y_32;

i.e. overflow if we've lost bits that are not copies of the sign bit (and thus restored by 
the arithmetic right shift)?

> +    tcg_gen_ext_i32_i64(RsV_i64, RsV);
> +    tcg_gen_ext_i32_i64(shift_amt_i64, shift_amt);
> +    tcg_gen_shl_i64(A, RsV_i64, shift_amt_i64);
> +
> +    /* Check for saturation */
> +    gen_sat_i64(A_sat_i64, A, 32);

Setting USR_OVF here...

> +    tcg_gen_extrl_i64_i32(A_sat, A_sat_i64);
> +    tcg_gen_xor_tl(tmp, A_sat, RsV);
> +    tcg_gen_brcondi_tl(TCG_COND_GE, tmp, 0, label1);
> +    gen_satval(RdV_i64, RsV_i64, 32);

... and also here.  Is this also computing the same saturation value that you did above?


> +    tcg_gen_extrl_i64_i32(RdV, RdV_i64);
> +    tcg_gen_br(done);
> +
> +    gen_set_label(label1);
> +    tcg_gen_brcondi_tl(TCG_COND_LE, RsV, 0, label2);
> +    tcg_gen_brcondi_i64(TCG_COND_NE, A, 0, label2);
> +    gen_satval(RdV_i64, RsV_i64, 32);

and again?

> +    tcg_gen_extrl_i64_i32(RdV, RdV_i64);
> +    tcg_gen_br(done);
> +
> +    gen_set_label(label2);
> +    tcg_gen_mov_tl(RdV, A_sat);
> +
> +    gen_set_label(done);
> +
> +    tcg_temp_free_i64(RsV_i64);
> +    tcg_temp_free_i64(shift_amt_i64);
> +    tcg_temp_free_i64(A);
> +    tcg_temp_free_i64(A_sat_i64);
> +    tcg_temp_free(A_sat);
> +    tcg_temp_free_i64(RdV_i64);
> +    tcg_temp_free(tmp);
> +}
> +
> +static void gen_sar(TCGv RdV, TCGv RsV, TCGv shift_amt)
> +{
> +    /*
> +     * if (shift_amt < 32) {
> +     *     RdV = sar(RsV, shift_amt);
> +     * } else {
> +     *     if (RsV > 0) {
> +     *         RdV = 0;
> +     *     } else {
> +     *         RdV = ~0;
> +     *     }
> +     * }
> +     */
> +    TCGLabel *shift_ge_32 = gen_new_label();
> +    TCGLabel *done = gen_new_label();
> +
> +    tcg_gen_brcondi_tl(TCG_COND_GE, shift_amt, 32, shift_ge_32);
> +    tcg_gen_sar_tl(RdV, RsV, shift_amt);
> +    tcg_gen_br(done);
> +
> +    gen_set_label(shift_ge_32);
> +    tcg_gen_movcond_tl(TCG_COND_LT, RdV, RsV, tcg_constant_tl(0),
> +                       tcg_constant_tl(~0), tcg_constant_tl(0));

This is better done as

     shift = min(shift, 31);
     rdv = rsv >> shift;

without branches.


r~

