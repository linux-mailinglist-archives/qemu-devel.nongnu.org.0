Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDA83C1FE7
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 09:16:12 +0200 (CEST)
Received: from localhost ([::1]:44036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1kk7-0007oM-7c
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 03:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1kcN-0006ZZ-TK
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 03:08:11 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1kcM-00042V-9U
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 03:08:11 -0400
Received: by mail-wr1-x430.google.com with SMTP id r11so5461614wro.9
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 00:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cxBsdVceNsA/3F/hx6BIUmOLyIiKjx7CUBwHHXTkX+k=;
 b=YA7v2m49A9Shikgso4XWSzuB8GXbKrSkj5YJCrlOPEC4SsZRPwSxGodqwDbj95CNLh
 TH8N1GZFgGsT9OZDc9o/+V7SgEfvl2RfNx7tr7b4vhaDV43lSO9cFSSU7cYYuy7JrCLl
 /RvaHINKYvdFNJpQ4XNgbY4MnH3k6UKyz2LxxptOfffRKZLdMa4W0ZOft8WvQTxm5zac
 CtQYnBcD3mKcGjs1ZYyo0IaUZHtMqgG1K5G+qTw72Dr/ZO+epG67fVrR2aXM1aLqARrq
 OH26muc4GMfvYeuixn5QvZbS4ydjme2JsV6THkktwFnGganakq0RJ+hxr7PS9zeOzkQN
 AshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cxBsdVceNsA/3F/hx6BIUmOLyIiKjx7CUBwHHXTkX+k=;
 b=uY3+0MrqChHdBqgYHdPu9hiDFOtp13I+ls10LynWHyfs+TILLQS5SOWqucs+mnABYk
 OhaZHzXTtXFseZSafuS2Rp5naBJJ8KTN0YJvtfNbIqPOEvdFMFN29aobVamx8GDErVSf
 17VTfNhVfgSN4zaXxfwcxGVtRG1/8of5XLd70gKGE2nYCS/Dz5nV6hb20Twlo/B4ciOi
 b53yC8ayx9orPsLAXRoSvmKwzCgImZEHWw2jp6ISMTxaKRFlwDKtK6sjZPZB8CBwuzIX
 8PCu7NWf/mRRzlON50eL0GpwSzrQ3/lxESf5c7XZXiw2uUs9cPhKmEGWyhkjLA2Xz+I7
 A0SQ==
X-Gm-Message-State: AOAM530HcK9qufNjBZMS95Q2vuvZzEZ1YAcfWQojnGCJvsCVFWp8issC
 RNrcob6xVIOOjuYcEqDo7eK+SB6Ec/8=
X-Google-Smtp-Source: ABdhPJwkG2GE3oMwj/8BvJm058pum7VKRA6SUEaCwjYSSz8TOw/xAI7BBl68fApP6so56iWVX1Ev0Q==
X-Received: by 2002:a5d:61d1:: with SMTP id q17mr40241201wrv.162.1625814488296; 
 Fri, 09 Jul 2021 00:08:08 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id c12sm4990622wrr.90.2021.07.09.00.08.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 00:08:07 -0700 (PDT)
Subject: Re: [PATCH 1/2] target/hppa: Use tcg_constant_*
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210708205807.827147-1-richard.henderson@linaro.org>
 <20210708205807.827147-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b5f660c2-7e93-2442-34ed-f2673781a053@amsat.org>
Date: Fri, 9 Jul 2021 09:08:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708205807.827147-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 10:58 PM, Richard Henderson wrote:
> Replace uses of tcg_const_* with the allocate and free
> close together.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/hppa/translate.c | 56 +++++++++++++----------------------------
>  1 file changed, 18 insertions(+), 38 deletions(-)
> 
> diff --git a/target/hppa/translate.c b/target/hppa/translate.c
> index 64af1e0d5c..d17568880f 100644
> --- a/target/hppa/translate.c
> +++ b/target/hppa/translate.c

> @@ -2971,9 +2956,8 @@ static bool trans_ldc(DisasContext *ctx, arg_ldst *a)
>       */
>      gen_helper_ldc_check(addr);
>  
> -    zero = tcg_const_reg(0);
> +    zero = tcg_constant_reg(0);
>      tcg_gen_atomic_xchg_reg(dest, addr, zero, ctx->mmu_idx, mop);
> -    tcg_temp_free(zero);
>  
>      if (a->m) {
>          save_gpr(ctx, a->b, ofs);

What about this one?

@@ -3385,7 +3385,7 @@ static bool do_depw_sar(DisasContext *ct
     /* Convert big-endian bit numbering in SAR to left-shift.  */
     tcg_gen_xori_reg(shift, cpu_sar, TARGET_REGISTER_BITS - 1);

-    mask = tcg_const_reg(msb + (msb - 1));
+    mask = tcg_constant_reg(msb + (msb - 1));
     tcg_gen_and_reg(tmp, val, mask);
     if (rs) {
         tcg_gen_shl_reg(mask, mask, shift);
@@ -3396,7 +3396,6 @@ static bool do_depw_sar(DisasContext *ct
         tcg_gen_shl_reg(dest, tmp, shift);
     }
     tcg_temp_free(shift);
-    tcg_temp_free(mask);
     tcg_temp_free(tmp);
     save_gpr(ctx, rt, dest);

> @@ -3886,15 +3870,13 @@ static bool trans_fcmp_f(DisasContext *ctx, arg_fclass2 *a)
>  
>      ta = load_frw0_i32(a->r1);
>      tb = load_frw0_i32(a->r2);
> -    ty = tcg_const_i32(a->y);
> -    tc = tcg_const_i32(a->c);
> +    ty = tcg_constant_i32(a->y);
> +    tc = tcg_constant_i32(a->c);
>  
>      gen_helper_fcmp_s(cpu_env, ta, tb, ty, tc);
>  
>      tcg_temp_free_i32(ta);
>      tcg_temp_free_i32(tb);
> -    tcg_temp_free_i32(ty);
> -    tcg_temp_free_i32(tc);
>  
>      return nullify_end(ctx);
>  }

