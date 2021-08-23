Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39C23F4F89
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:34:05 +0200 (CEST)
Received: from localhost ([::1]:56704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIDpk-0001Zl-Ne
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDnM-0000EY-Be
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:31:36 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:34758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDnK-0005lh-He
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:31:36 -0400
Received: by mail-pg1-x529.google.com with SMTP id x4so17284492pgh.1
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 10:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hMih3CcNCeRiQBwf53h6UxWOWVZDwMBz4cUyMbk3/gw=;
 b=I8ZXuK7ev0gkCakqdUyGn4ueT7ql5XoGsAoiuCSZP1TOP218xmbzlxlsQ2BcTKoe6d
 CCQkJrDBMjk7nkktZL3PV+r8RXR4Z1SCAIkz+WLgu6+QNljZBj5F2htBMrSHoknb0NMH
 iM1dDDfgn9fRE47UCbuit23p1f5a+pMacQVnR1gA+UpOLZsfDjGwyHJYNNb3seiieqFe
 8S2qWFVKWsFJgmcRZyFLOeht6shghNKLY00sPghrNuNYpq5off1jJ4Ou42CJdLx9if/C
 xnbfah1doVn3sEix/MLE02e2MXKMpzdGD7JRqta05bXiO+QWkE1Fcu2Ef6CMX9DliOv+
 SJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hMih3CcNCeRiQBwf53h6UxWOWVZDwMBz4cUyMbk3/gw=;
 b=Z1I5pN0jDKY0kk7CwvKYUHRaAya21EhIHZ+pV0WcINN3loczYthGFM1ln+ucf3LtHP
 t3iclhMzKnZnTvo90F47S99kZx3vCGuWxo77Au1ScJO14dkFswIFs2pC61oxIEl+JtTN
 o/gu1Aby46JBF54CU+FZXt631dXas/KI2OY4ob5HZ7XOAyf1ZbeQuQHCbgP5CWa9i9AR
 BFBNqEoGzW7rvBqZVRkIT3P1g0/MCIg6MQ82TKUiuQ0GtR82e42SaEmqbIbEPFe08fDi
 vAsHa4MrgEryfEhW71/nAI77CiCdjaow3zK9Ztw4JmyDsYnrFdPAe9LojteT2aPagUJc
 IARw==
X-Gm-Message-State: AOAM533XI0r/ei3BcuM85eZfDr9D1l5dFZp1dgEL0+Y4V7vhSXzCcIwY
 iiGCTZk+ldX1A+JL0gMKcKP5Bw==
X-Google-Smtp-Source: ABdhPJwVk7Ij08jnNpfqTqiry0qO3yc4omGK6bKNmZeqME68V2a9NcPaampHMMB+GlQWWfIfQSOPVA==
X-Received: by 2002:a62:878a:0:b029:3e0:7810:ec36 with SMTP id
 i132-20020a62878a0000b02903e07810ec36mr35008924pfe.4.1629739892981; 
 Mon, 23 Aug 2021 10:31:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id f5sm4883211pjw.20.2021.08.23.10.31.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 10:31:32 -0700 (PDT)
Subject: Re: [PATCH v3 12/15] target/riscv: Add zext.h instructions to Zbb,
 removing pack/packu/packh
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
 <20210823164038.2195113-13-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <208618ed-db9b-fcf6-c445-bfc691a66d4b@linaro.org>
Date: Mon, 23 Aug 2021 10:31:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823164038.2195113-13-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.023,
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 9:40 AM, Philipp Tomsich wrote:
> The 1.0.0 version of Zbb does not contain pack/packu/packh. However, a
> zext.h instruction is provided (built on pack/packh from pre-0.93
> draft-B) is available.
> 
> This commit adds zext.h and removes the pack* instructions.
> 
> Note that the encodings for zext.h are different between RV32 and
> RV64, which is handled through REQUIRE_32BIT.
> 
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> ---
> 
> Changes in v3:
> - Moved zext.h-addition & pack*-removal to a separate commit.
> 
>   target/riscv/insn32.decode              | 10 +++---
>   target/riscv/insn_trans/trans_rvb.c.inc | 45 +++++++------------------
>   target/riscv/translate.c                | 40 ----------------------
>   3 files changed, 18 insertions(+), 77 deletions(-)
> 
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 72b73c6df2..0fd5afc289 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -689,6 +689,7 @@ rori       01100 ............ 101 ..... 0010011 @sh
>   sext_b     011000 000100 ..... 001 ..... 0010011 @r2
>   sext_h     011000 000101 ..... 001 ..... 0010011 @r2
>   xnor       0100000 .......... 100 ..... 0110011 @r
> +zext_h     0000100 00000 ..... 100 ..... 0110011 @r2

Similarly, I think this should be zext_h_32, and

> @@ -225,6 +207,12 @@ static bool trans_orc_b(DisasContext *ctx, arg_orc_b *a)
>       return gen_unary(ctx, a, &gen_orc_b);
>   }
>   
> +static bool trans_zext_h(DisasContext *ctx, arg_sext_h *a)
> +{
> +    REQUIRE_32BIT(ctx);
> +    REQUIRE_ZBB(ctx);
> +    return gen_unary(ctx, a, &tcg_gen_ext16u_tl);
> +}
>   
>   #define GEN_TRANS_SHADD(SHAMT)                                             \
>   static bool trans_sh##SHAMT##add(DisasContext *ctx, arg_sh##SHAMT##add *a) \
...
> @@ -348,6 +322,13 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
>       return true;
>   }
>   
> +static bool trans_zext_h_64(DisasContext *ctx, arg_sext_h *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_ZBB(ctx);
> +    return gen_unary(ctx, a, &tcg_gen_ext16u_tl);
> +}
> +

... the two functions placed together.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

