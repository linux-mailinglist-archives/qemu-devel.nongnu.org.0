Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E345E8F9B
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 22:19:35 +0200 (CEST)
Received: from localhost ([::1]:46934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocBcb-0005th-M7
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 16:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocBZq-0003BD-IB
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 16:16:43 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:33536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocBZo-00017X-Mj
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 16:16:42 -0400
Received: by mail-qt1-x835.google.com with SMTP id ay9so2045869qtb.0
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 13:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=BvMR64OrYCb3Li5Msw/OFmtGFUxnkTt5au1ORJmWkm4=;
 b=qESLdYjN3WuwGQtgYUelFe5luA6jrqlFO6/uml88XP/ZdAWrJpDiExMWlZPb7iKY3Z
 5w+Argoq5I3GqqvL3r3eb7cudVk5ZB4PG5s2qXTs5wFJOcIv6O/IJDjCBn06o1DBWRKp
 gDG2H5Ugim7A7QbO2Q02gSk0zY0aByLpUH5/AlxHX+yxR+s+4f1vyIGBFW0s3jYuWEDu
 kMy/lFJ5+6TASJCWFWAGXA7McGNhQui4jD6lk6HJSLv7W0hWu81e32oqk0Uh/9dv3c3v
 kLFgbryxhhvtd4G6v3qpYkZ9taSRIpUEM6taZ2pl6eLCQ6Ix+0JTY7m8GdEMbt5cWg4T
 JzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=BvMR64OrYCb3Li5Msw/OFmtGFUxnkTt5au1ORJmWkm4=;
 b=CxnYz9ym/bDdq+039uYejykoishaRHeU4teJzrBCnjRYO2YUBqfasT6WvwnUgVjN9+
 2QzmhCONN4yRDjmB+ieplstpRrcJpqWQOAQXXXet3eBH3XZiazubt5pV1Hqp7vaqs6dJ
 OHnSGLzj4fdBLulb+5rkxfbhjbo2tDPFszMjxumDZyuq/ac6qstAPrqEyx0oxTijxyXq
 jVAab9xVqtbdh9l0gJQK2XK9nJ+DHUnPcdhhDlBvMigpB0I58f6F3mPDRMbGQ+S1j6sJ
 tJyVdKKQk8zytjgCgvrWGanY/4WIO0caRNRYu8/V3UJkEagDOl1slQoLoqg8EOLsra5v
 1qOQ==
X-Gm-Message-State: ACrzQf1m2+tp78rA3t7Z0N+2yIYg1KxthyKe/5Keh3GlNlKkZKJzde2P
 mJgqntVuNB67oWkkEsnZ0jZZPQ==
X-Google-Smtp-Source: AMsMyM73N6pMgB3dQPtQdgifPSPVyVlkUwWDTcZjKg1Gdp4z/rPqEktjGwBYY8VOyIitJUpOnkEquw==
X-Received: by 2002:ac8:5e0a:0:b0:35c:e8d8:6c19 with SMTP id
 h10-20020ac85e0a000000b0035ce8d86c19mr12467400qtx.178.1664050599517; 
 Sat, 24 Sep 2022 13:16:39 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3?
 ([2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a05622a120b00b003434f7483a1sm8114399qtx.32.2022.09.24.13.16.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 13:16:38 -0700 (PDT)
Message-ID: <4e57d356-212b-9c8b-470f-d1c2623188cb@linaro.org>
Date: Sat, 24 Sep 2022 20:16:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 12/12] target/ppc: Use gvec to decode XVTSTDC[DS]P
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20220923214754.217819-1-lucas.araujo@eldorado.org.br>
 <20220923214754.217819-13-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220923214754.217819-13-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/23/22 21:47, Lucas Mateus Castro(alqotel) wrote:
> +static void do_xvtstdc_vec(unsigned vece, TCGv_vec t, TCGv_vec b, int64_t imm)
> +{
> +    TCGv_vec match = tcg_const_ones_vec_matching(t);
> +    TCGv_vec temp;
> +    TCGv_vec mask;
> +    uint64_t exp_msk = (vece == MO_32) ? (uint32_t)EXP_MASK_SP : EXP_MASK_DP;
> +    uint64_t sgn_msk = (vece == MO_32) ? (uint32_t)SGN_MASK_SP : SGN_MASK_DP;
> +    uint64_t frc_msk = ~(exp_msk | sgn_msk);
> +    mask = tcg_constant_vec_matching(t, vece, 0);
> +    tcg_gen_mov_vec(t, mask);
> +    if (imm & (0x3 << 0)) {
> +        /* test if Denormal */
> +        temp = tcg_temp_new_vec_matching(t);
> +        mask = tcg_constant_vec_matching(t, vece, ~sgn_msk);
> +        tcg_gen_and_vec(vece, t, b, mask);
> +        mask = tcg_constant_vec_matching(t, vece, frc_msk);
> +        tcg_gen_cmp_vec(TCG_COND_LE, vece, temp, t, mask);
> +        mask = tcg_constant_vec_matching(t, vece, 0);
> +        tcg_gen_cmpsel_vec(TCG_COND_NE, vece, temp, t, mask, temp, mask);
> +
> +        tcg_gen_mov_vec(t, mask);
> +        mask = tcg_constant_vec_matching(t, vece, sgn_msk);
> +        if (imm & (0x1)) {
> +            /* test if negative */
> +            tcg_gen_cmpsel_vec(TCG_COND_GTU, vece, t, b, mask, temp, t);
> +        }
> +        if (imm & (0x2)) {
> +            /* test if positive */
> +            tcg_gen_cmpsel_vec(TCG_COND_LTU, vece, t, b, mask, temp, t);
> +        }
> +        tcg_temp_free_vec(temp);
> +    }
> +    if (imm & (1 << 2)) {
> +        /* test if -0 */
> +        mask = tcg_constant_vec_matching(t, vece, sgn_msk);
> +        tcg_gen_cmpsel_vec(TCG_COND_EQ, vece, t, b, mask, match, t);
> +    }
> +    if (imm & (1 << 3)) {
> +        /* test if +0 */
> +        mask = tcg_constant_vec_matching(t, vece, 0);
> +        tcg_gen_cmpsel_vec(TCG_COND_EQ, vece, t, b, mask, match, t);
> +    }
> +    if (imm & (1 << 4)) {
> +        /* test if -Inf */
> +        mask = tcg_constant_vec_matching(t, vece, exp_msk | sgn_msk);
> +        tcg_gen_cmpsel_vec(TCG_COND_EQ, vece, t, b, mask, match, t);
> +    }
> +    if (imm & (1 << 5)) {
> +        /* test if +Inf */
> +        mask = tcg_constant_vec_matching(t, vece, exp_msk);
> +        tcg_gen_cmpsel_vec(TCG_COND_EQ, vece, t, b, mask, match, t);
> +    }
> +    if (imm & (1 << 6)) {
> +        /* test if NaN */
> +        mask = tcg_constant_vec_matching(t, vece, ~sgn_msk);
> +        tcg_gen_and_vec(vece, b, b, mask);
> +        mask = tcg_constant_vec_matching(t, vece, exp_msk);
> +        tcg_gen_cmpsel_vec(TCG_COND_GT, vece, t, b, mask, match, t);
> +    }
> +    tcg_temp_free_vec(match);
> +}

While each case is fairly clever, I don't think that stringing them together like this is 
a good idea.  I think you should only handle the easy cases inline, and defer random (and 
probably rarely used) bit combinations to the helper function.

For instance,

static void gen_is_pos_inf(unsigned vece, TCGv_vec t, TCGv_vec b)
{
     tcg_gen_cmp_vec(TCG_COND_EQ, vece, t, b,
         tcg_constant_vec_matching(t, vece, exp_mask));
}

static void gen_is_any_inf(unsigned vece, TCGv_vec t, TCGv_vec b)
{
     tcg_gen_and_vec(vece, t, b,
         tcg_constant_vec_matching(t, vece, ~sgn_mask));
     tcg_gen_cmp_vec(TCG_COND_EQ, vece, t, b,
         tcg_constant_vec_matching(t, vece, exp_mask));
}

static bool do_xvtstdc(...)
{
     switch (a->imm) {
     case (1 << 4): /* -Inf */
         tcg_gen_gvec_2(..., &op_is_neg_inf);
         break;
     case (1 << 5): /* +Inf */
         tcg_gen_gvec_2(..., &op_is_pos_inf);
         break;
     case (1 << 4) | (1 << 5): /* -Inf | +Inf */
         tcg_gen_gvec_2(..., &op_is_any_inf);
         break;
     ...
     default:
         tcg_gen_gvec_2_ool(..., 16, 16, a->imm, gen_helper_XVTSTDCXX);
     }
}

Or something of that nature.

I'll also note that you don't need CMPSEL -- all cases are mutually exclusive, so OR works 
just as well.

r~

