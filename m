Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 408C84354DD
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 22:59:40 +0200 (CEST)
Received: from localhost ([::1]:33894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdIgU-0001jZ-Td
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 16:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdIf5-0000z7-P9
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 16:58:11 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:36660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdIf3-0000Z1-Ek
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 16:58:11 -0400
Received: by mail-pl1-x635.google.com with SMTP id f21so17013354plb.3
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 13:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OhP4n/hCK71SaP47fMymaloi4pbUPlJoMhC+f+x4Rh0=;
 b=mhX8VOyWfjdOUCsy5Zp34qtRfMy/oiQhK4B2TuuyoxPKqARGOapOzc4SOhf0GWdpgA
 YvLTdx2r79iQGhkyX9rHMZ0D2/Wlufi2wj/limy7eVcmqbxVc9zu2emi1M4TgIMjcjlF
 ZnOtalr1Q2O4h98RwjmIY1jTFvELcIeopb2/uNPLwGBRPiS3dygCx5W3VIGYTYxFuFMp
 8BMfUzvu+6NBcHcyQHdsQSLc7ynw9vc3f3x2mFwTObRPJ/NGpdOnX/Eb/hOqroDz7goa
 qPSCtsrzhrZRE6fCE0vW3uVBxdJuhpHRiYfgfGahKJGo+DLt7QjVSQh2aVfL+pig4Vbd
 CiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OhP4n/hCK71SaP47fMymaloi4pbUPlJoMhC+f+x4Rh0=;
 b=wmHJLSOvO/w9rFen6GcWkoiYURTBHMh4xxGlf5V00nz4NNCg1P1WhJAXr9Zq1+Ma53
 EzUMPQzE1FMEetAVzIgyldrt1nG+QF9b4tvLhHLTfxkgCe5qs6swZ8tNJZjxv6E82RWk
 fz47joJavYhRBzhM20mWASfGf5B8e1FKvIXGDGD6kKTMEdH/SHM6RdhBLd2nepKlMqeT
 1SIqCNgpWovtVnFxhJnxiP+Ba/XY7+twAXm2/3hcUp5RYoaJvzF2qIE7LfFvoABkZbF1
 ac31SGp+2ER4ePX71Dh5EukJFWTFcNsb7vXGQtep4WEsmxvY7XwGeTY+7/LA9h05GXWp
 TBfQ==
X-Gm-Message-State: AOAM533+arKaSwJbPpHnIWDoPO5DXchbyCXVyMFUYEBGctrXK29EvUJ/
 5a26yGy3SALPcvkAautL5eponQ==
X-Google-Smtp-Source: ABdhPJxM33BctYz6ogDsG6DEZMu1nKThMPVzXcTRwk+yoRWvScVpKvQgeISugkyLsoRQe8yH6TrxOg==
X-Received: by 2002:a17:90b:2246:: with SMTP id
 hk6mr1610822pjb.116.1634763487900; 
 Wed, 20 Oct 2021 13:58:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm7582631pjb.27.2021.10.20.13.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 13:58:07 -0700 (PDT)
Subject: Re: [PATCH v3 15/21] target/riscv: support for 128-bit M extension
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-16-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a4a0bf4a-988f-9283-18b7-09b44f8404de@linaro.org>
Date: Wed, 20 Oct 2021 13:58:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019094812.614056-16-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
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
Cc: philmd@redhat.com, bin.meng@windriver.com, alistair.francis@wdc.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 2:48 AM, Frédéric Pétrot wrote:
>   struct CPURISCVState {
>       target_ulong gpr[32];
>       target_ulong gprh[32]; /* 64 top bits of the 128-bit registers */
> +    target_ulong hlpr[2];  /* scratch registers for 128-bit div/rem helpers */

We have something similar for s390x, but we make use of the helper return value to return 
one part of the result and only store the other part of the result in env->retxl.

> +    cpu_hlpr[0] = tcg_global_mem_new(cpu_env,
> +        offsetof(CPURISCVState, hlpr[0]), "helper_reg0");
> +    cpu_hlpr[1] = tcg_global_mem_new(cpu_env,
> +        offsetof(CPURISCVState, hlpr[1]), "helper_reg1");

You very much do not want to make these global temps.

This requires the helpers to indicate that they clobber temps, which will flush all cached 
register state across the helper.  Just perform the load of the result explicitly after 
the helper.

> +static void gen_mulu2_i128(TCGv rll, TCGv rlh, TCGv rhl, TCGv rhh,
> +                           TCGv al, TCGv ah, TCGv bl, TCGv bh)
> +{
> +    TCGv tmpl = tcg_temp_new(),
> +         tmph = tcg_temp_new(),
> +         cnst_zero = tcg_constant_tl(0);
> +
> +    tcg_gen_mulu2_tl(rll, rlh, al, bl);
> +
> +    tcg_gen_mulu2_tl(tmpl, tmph, al, bh);
> +    tcg_gen_add2_tl(rlh, rhl, rlh, cnst_zero, tmpl, tmph);
> +    tcg_gen_mulu2_tl(tmpl, tmph, ah, bl);
> +    tcg_gen_add2_tl(rlh, tmph, rlh, rhl, tmpl, tmph);
> +    /* Overflow detection into rhh */
> +    tcg_gen_setcond_tl(TCG_COND_LTU, rhh, tmph, rhl);
> +
> +    tcg_gen_mov_tl(rhl, tmph);
> +
> +    tcg_gen_mulu2_tl(tmpl, tmph, ah, bh);
> +    tcg_gen_add2_tl(rhl, rhh, rhl, rhh, tmpl, tmph);

It might be clearer to number these 0-3 rather than permute [lh].

I think you don't need to return all 4 words of results; just have gen_mulhu_i128 with 6 
parameters, since there's no RV128 instruction that returns the entire result.

> +static void gen_mul_i128(TCGv rll, TCGv rlh,
> +                         TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
> +{
> +    TCGv rhl = tcg_temp_new(),
> +         rhh = tcg_temp_new();
> +
> +    gen_mulu2_i128(rll, rlh, rhl, rhh, rs1l, rs1h, rs2l, rs2h);
> +
> +    tcg_temp_free(rhl);
> +    tcg_temp_free(rhh);
> +}

This is much simpler than gen_mulu2_i128.

> +static void gen_mulh_i128(TCGv rhl, TCGv rhh,
> +                          TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
> +{
> +    TCGv rll = tcg_temp_new(),
> +         rlh = tcg_temp_new(),
> +         rlln = tcg_temp_new(),
> +         rlhn = tcg_temp_new(),
> +         rhln = tcg_temp_new(),
> +         rhhn = tcg_temp_new(),
> +         sgnres = tcg_temp_new(),
> +         tmp = tcg_temp_new(),
> +         cnst_one = tcg_constant_tl(1),
> +         cnst_zero = tcg_constant_tl(0);
> +
> +    /* Extract sign of result (=> sgn(a) xor sgn(b)) */
> +    tcg_gen_setcondi_tl(TCG_COND_LT, sgnres, rs1h, 0);
> +    tcg_gen_setcondi_tl(TCG_COND_LT, tmp, rs2h, 0);
> +    tcg_gen_xor_tl(sgnres, sgnres, tmp);
> +
> +    /* Take absolute value of operands */
> +    tcg_gen_sari_tl(rhl, rs1h, 63);
> +    tcg_gen_add2_tl(rlln, rlhn, rs1l, rs1h, rhl, rhl);
> +    tcg_gen_xor_tl(rlln, rlln, rhl);
> +    tcg_gen_xor_tl(rlhn, rlhn, rhl);
> +
> +    tcg_gen_sari_tl(rhl, rs2h, 63);
> +    tcg_gen_add2_tl(rhln, rhhn, rs2l, rs2h, rhl, rhl);
> +    tcg_gen_xor_tl(rhln, rhln, rhl);
> +    tcg_gen_xor_tl(rhhn, rhhn, rhl);
> +
> +    /* Unsigned multiplication */
> +    gen_mulu2_i128(rll, rlh, rhl, rhh, rlln, rlhn, rhln, rhhn);
> +
> +    /* Negation of result (two's complement : ~res + 1) */
> +    tcg_gen_not_tl(rlln, rll);
> +    tcg_gen_not_tl(rlhn, rlh);
> +    tcg_gen_not_tl(rhln, rhl);
> +    tcg_gen_not_tl(rhhn, rhh);
> +
> +    tcg_gen_add2_tl(rlln, tmp, rlln, cnst_zero, cnst_one, cnst_zero);
> +    tcg_gen_add2_tl(rlhn, tmp, rlhn, cnst_zero, tmp, cnst_zero);
> +    tcg_gen_add2_tl(rhln, tmp, rhln, cnst_zero, tmp, cnst_zero);
> +    tcg_gen_add2_tl(rhhn, tmp, rhhn, cnst_zero, tmp, cnst_zero);
> +
> +    /* Move conditionally result or -result depending on result sign */
> +    tcg_gen_movcond_tl(TCG_COND_NE, rhl, sgnres, cnst_zero, rhln, rhl);
> +    tcg_gen_movcond_tl(TCG_COND_NE, rhh, sgnres, cnst_zero, rhhn, rhh);
> +
> +    tcg_temp_free(rll);
> +    tcg_temp_free(rlh);
> +    tcg_temp_free(rlln);
> +    tcg_temp_free(rlhn);
> +    tcg_temp_free(rhln);
> +    tcg_temp_free(rhhn);
> +    tcg_temp_free(sgnres);
> +    tcg_temp_free(tmp);
>  }

You don't need to compute abs or conditional negation.

See tcg_gen_muls2_i32, adjust for negative inputs. It's simply subtracting one input from 
the high part when the other input is negative.

> +static void gen_mulhsu_i128(TCGv rhl, TCGv rhh,
> +                            TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)

Similarly, but of course only one operand may be negative.

> +static void gen_div_i128(TCGv rdl, TCGv rdh,
> +                         TCGv rs1l, TCGv rs1h, TCGv rs2l, TCGv rs2h)
> +{
> +    gen_helper_divs_i128(cpu_env, (TCGv_i64)rs1l, (TCGv_i64)rs1h,
> +                                  (TCGv_i64)rs2l, (TCGv_i64)rs2h);

Do not cast, just make the arguments target_long always.

Anyway, per above, this becomes

     gen_helper_divs_i128(rdl, cpu_env, rs1l, rs1h, rs2l, rs2h);
     tcg_gen_ld_tl(rdh, cpu_env, offsetof(CPURISCVState, retxh));


r~

