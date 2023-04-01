Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AF56D2E64
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 07:32:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piTpX-0006Gq-UZ; Sat, 01 Apr 2023 01:31:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piTpU-0006Fu-NH
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 01:31:08 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piTpS-0002Ap-RW
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 01:31:08 -0400
Received: by mail-pj1-x1032.google.com with SMTP id j13so22694795pjd.1
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 22:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680327065;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cqUTsq080oQPrHuOVftYRVjaZrTPayV2q8whLA7YJ8M=;
 b=tAMqJ9nl24mG4Z8ylmMDW7j5CEHelKdHdnxH4CD2B83X/VdPXjuj9TExke64wtyNnY
 /AKvsc+Vp1Up7LAzegLnhk9ooXn0hJUMXiw4PS8N7yYoP88TRkQhm4Qi+awHT3raRW4v
 acPUTSGU8nMxMEJj/lzi7jlcb/vEqRK3hjjAorjmyRyBIuPkTKliol8vbppQa8OPRPmI
 McS47JaGJpSuEdMLKcGgIrn9dznHj6+La3AKZR2zzd3k27rcOdeQSCMrUmYwi9vU7o0/
 e94S+0rk7835dY6C+lehw3FAJmbHg4VZeDUpGxW/Y+bcz3eaCTlPEf4/WWEhQOe23/vF
 CFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680327065;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cqUTsq080oQPrHuOVftYRVjaZrTPayV2q8whLA7YJ8M=;
 b=XMaqmxQMYmeFUKUu9kQrrJs+GCBfdRmaabZrcFe2xYUnlrJOYV1FRqHoVnD6kuslL8
 Mbc+xkNBmkDeDx/pbKgq+3KpdqGhGxWV7rK1HDgBkMV5fGzcD2OCpbvEA7kXveJokYTv
 8k/HU1ZBCW5eMNrQ782LTmT5S0LWsPRfcQAAs7CespkBJ4Ft7T0LfgYp1LbilSO+6IHG
 2CPW52WmrrK25qCTqHy77sU+gQoZyppI6XrR4asOIksa7IB2aEIhJqeLQluce/PnZ11X
 NRjNLpyTHASW7P7L15KisETTZ0x6mXMdMa8wP4KOI+8SpzxJxouOUUjiAzB2DIHPkdKw
 FK+A==
X-Gm-Message-State: AAQBX9dWZBLkaLsdeAInqqAHlI3tK72yWpoDptOQn85YCN+C1U2rDikX
 KxAip4kRwxVspfoStwYpWbJJbzNF4AsWAsGp97I=
X-Google-Smtp-Source: AKy350ayzndwAFVSzBORvBoeU5EAAJSAU6hmNJFr47OVE6nWd/81/3luBRQHnGLqA29YGABerqjbnw==
X-Received: by 2002:a17:90b:3e8e:b0:23f:58a2:7d86 with SMTP id
 rj14-20020a17090b3e8e00b0023f58a27d86mr33903919pjb.10.1680327064923; 
 Fri, 31 Mar 2023 22:31:04 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a170902d30400b0019f2cee9221sm2477902plc.95.2023.03.31.22.31.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 22:31:04 -0700 (PDT)
Message-ID: <b7b0e7fc-8880-6de4-5b25-05e0c4a282ea@linaro.org>
Date: Fri, 31 Mar 2023 22:31:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 22/44] target/loongarch: Implement LSX logic
 instructions
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-23-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-23-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/27/23 20:06, Song Gao wrote:
> +static void gen_vnori(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm)
> +{
> +    TCGv_vec t1;
> +
> +    t1 = tcg_temp_new_vec_matching(t);
> +    tcg_gen_dupi_vec(vece, t1, imm);
> +    tcg_gen_nor_vec(vece, t, a, t1);
> +}

tcg_constant_vec_matching.

> +
> +static void do_vnori_b(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
> +                       int64_t imm, uint32_t oprsz, uint32_t maxsz)
> +{
> +    static const TCGOpcode vecop_list[] = {
> +        INDEX_op_nor_vec, 0
> +        };
> +    static const GVecGen2i op = {
> +       .fniv = gen_vnori,
> +       .fnoi = gen_helper_vnori_b,
> +       .opt_opc = vecop_list,
> +       .vece = MO_8
> +    };
> +
> +    tcg_gen_gvec_2i(vd_ofs, vj_ofs, oprsz, maxsz, imm, &op);
> +}

Should implement .fni8.


r~

