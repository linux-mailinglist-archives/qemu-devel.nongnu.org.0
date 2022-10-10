Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6895FA450
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 21:47:04 +0200 (CEST)
Received: from localhost ([::1]:43744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohyju-0005nk-T0
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 15:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohyfj-0000Ja-Ax
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 15:42:48 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:42777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohyfd-0000Cg-5n
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 15:42:41 -0400
Received: by mail-pl1-x62c.google.com with SMTP id c24so11242130pls.9
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 12:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Po8dTDUYKRQkJmm7+MQLl/QCpP3kYK4JHGL2HWwLoPY=;
 b=JPNHiXPbp9EsGNpZUPUYYXVCDiwRZBkmbMJd5PpCTcYToYD6tydYtE5ogFKagwM77W
 epcbJllsr0s1OxpSalFOV4awvd1bo9E2JlEHNO4NaHsWt6nPDNQU0HfHKBarHaGu0SR3
 joV+DvpFK+KIh5Q6pttlecUQAzjHJyEjit7NF+ht9izf1W37vKGhu3DGVjzX9BCVYmT7
 7hr2fN7egba3wYKrqEFltsdKDZ8iss0UNv92yN5K/37DfxV6jxiftOlpVCzvxLgiPlob
 4q11WQkMWHsWi5zJmUmm+VLVH6h7eijZWcMixxU4yPg1IdxWlM2Bk9zjQ5qnNGY01H8u
 jj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Po8dTDUYKRQkJmm7+MQLl/QCpP3kYK4JHGL2HWwLoPY=;
 b=dKEO0oS2DRoBaDwKHZxeZisgov3guVZPb4u9ZaYvFWVQKJw0Wavyd8MQ69Mf4t4wZ2
 7KGqPRnCFsGNw3QNUDQaetvEP53UC91OMx3MeI/bO5iPzYZRG9UiX8qVBB++WanV1kEF
 Xg7uef7QsbVuQmg0XXQS+0SMSB+r2/BlEFO57vGTiNMghBUftJdWbxsa2omAo/gcW3Q4
 CN8li33OoawC1DsnuSyrsKeXdT+ztCew0TZtWT1E0yHOSKXMYajPJfcZv74iqUCTIqYl
 VkpsIVZe6bXk3vJ77ERBxXkQ+qBaNnOoVhgLJHrDdO/o5ffZo7C/3BTiUZ8debT2a4PR
 USig==
X-Gm-Message-State: ACrzQf3Sy+AJYp9uI70Zr3EQnkngar/n5njgqky0PMmHVTykd14qNgHv
 Bb37/IIsfbux6zpPg0ooyeRxVQ==
X-Google-Smtp-Source: AMsMyM5a3Taq8UVTJkpwMT31ia0zGkh4loFNiuMO++grI5pLw7PcI1bjq7z/Yw4i/NAF1MAYudb55Q==
X-Received: by 2002:a17:902:848c:b0:17a:b4c0:a02b with SMTP id
 c12-20020a170902848c00b0017ab4c0a02bmr20519404plo.122.1665430955345; 
 Mon, 10 Oct 2022 12:42:35 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7?
 ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a170902ea8200b0016d5b7fb02esm7030391plb.60.2022.10.10.12.42.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 12:42:34 -0700 (PDT)
Message-ID: <433b06e1-8bae-8a68-7e42-4b86b9d8d1b8@linaro.org>
Date: Mon, 10 Oct 2022 12:42:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 12/12] target/ppc: Use gvec to decode XVTSTDC[DS]P
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20221010191356.83659-1-lucas.araujo@eldorado.org.br>
 <20221010191356.83659-13-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221010191356.83659-13-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.007,
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

On 10/10/22 12:13, Lucas Mateus Castro(alqotel) wrote:
> +/* test if +Inf or -Inf */
> +static void gen_is_any_inf(unsigned vece, TCGv_vec t, TCGv_vec b)
> +{
> +    uint64_t exp_msk = (vece == MO_32) ? (uint32_t)EXP_MASK_SP : EXP_MASK_DP;
> +    uint64_t sgn_msk = (vece == MO_32) ? (uint32_t)SGN_MASK_SP : SGN_MASK_DP;
> +    tcg_gen_andc_vec(vece, b, b, tcg_constant_vec_matching(t, vece, exp_msk));
> +    tcg_gen_cmp_vec(TCG_COND_EQ, vece, t, b,
> +                    tcg_constant_vec_matching(t, vece, sgn_msk));
> +}

Should be clearing sign and comparing exp, not the other way.

> +    GVecGen2 op = {
> +        .fno = (vece == MO_32) ? gen_helper_XVTSTDCSP : gen_helper_XVTSTDCDP,
> +        .vece = vece,
> +        .opt_opc = vecop_list
>       };
>   
>       REQUIRE_VSX(ctx);
>   
> -    tcg_gen_gvec_2i(vsr_full_offset(a->xt), vsr_full_offset(a->xb),
> -                    16, 16, (int32_t)(a->uim), &op[vece - MO_32]);
> +    switch (a->uim) {
> +    case 0:
> +        set_cpu_vsr(a->xt, tcg_constant_i64(0), true);
> +        set_cpu_vsr(a->xt, tcg_constant_i64(0), false);
> +        break;
> +    case ((1 << 0) | (1 << 1)):
> +        /* test if +Denormal or -Denormal */
> +        op.fniv = gen_is_any_denormal,
> +        tcg_gen_gvec_2(vsr_full_offset(a->xt), vsr_full_offset(a->xb), 16, 16,
> +                       &op);

This default setting of .fno doesn't work, because the helper requires simd_data set, 
which this invocation via tcg_gen_gvec_2 will not provide.

You could fix this by using GVecGen2i and tcg_gen_gvec_2i, and ignoring the immediate 
argument added to the functions above.  Which also means...

> +    case (1 << 0):
> +        /* test if -Denormal */
> +        op.fniv = gen_is_neg_denormal,
> +        tcg_gen_gvec_2(vsr_full_offset(a->xt), vsr_full_offset(a->xb), 16, 16,
> +                       &op);
> +        break;
> +    case (1 << 1):
> +        /* test if +Denormal */
> +        op.fniv = gen_is_pos_denormal,
> +        tcg_gen_gvec_2(vsr_full_offset(a->xt), vsr_full_offset(a->xb), 16, 16,
> +                       &op);
> +        break;
> +    case ((1 << 2) | (1 << 3)):
> +        /* test if +0 or -0 */
> +        op.fniv = gen_is_any_zero,
> +        tcg_gen_gvec_2(vsr_full_offset(a->xt), vsr_full_offset(a->xb), 16, 16,
> +                       &op);
> +        break;
> +    case (1 << 2):
> +        /* test if -0 */
> +        op.fniv = gen_is_neg_zero,
> +        tcg_gen_gvec_2(vsr_full_offset(a->xt), vsr_full_offset(a->xb), 16, 16,
> +                       &op);
> +        break;
> +    case (1 << 3):
> +        /* test if +0 */
> +        op.fniv = gen_is_pos_zero,
> +        tcg_gen_gvec_2(vsr_full_offset(a->xt), vsr_full_offset(a->xb), 16, 16,
> +                       &op);
> +        break;
> +    case ((1 << 4) | (1 << 5)):
> +        /* test if +Inf or -Inf */
> +        op.fniv = gen_is_any_inf,
> +        tcg_gen_gvec_2(vsr_full_offset(a->xt), vsr_full_offset(a->xb), 16, 16,
> +                       &op);
> +        break;
> +    case (1 << 4):
> +        /* test if -Inf */
> +        op.fniv = gen_is_neg_inf,
> +        tcg_gen_gvec_2(vsr_full_offset(a->xt), vsr_full_offset(a->xb), 16, 16,
> +                       &op);
> +        break;
> +    case (1 << 5):
> +        /* test if +Inf */
> +        op.fniv = gen_is_pos_inf,
> +        tcg_gen_gvec_2(vsr_full_offset(a->xt), vsr_full_offset(a->xb), 16, 16,
> +                       &op);
> +        break;
> +    case (1 << 6):
> +        /* test if NaN */
> +        op.fniv = gen_is_nan,
> +        tcg_gen_gvec_2(vsr_full_offset(a->xt), vsr_full_offset(a->xb), 16, 16,
> +                       &op);
> +        break;
> +    default:
> +        tcg_gen_gvec_2_ool(vsr_full_offset(a->xt), vsr_full_offset(a->xb), 16,
> +                           16, (int32_t)(a->uim), op.fno);
> +        break;

You can have only the store to op.fniv in the switch, remove the default, and have a 
common call to tcg_gen_gvec_2i after the switch.


r~

