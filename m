Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7410F5FE16C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 20:38:05 +0200 (CEST)
Received: from localhost ([::1]:57174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj35o-00040h-3p
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 14:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oj30u-0001cJ-Vy
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:33:03 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:43829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oj30s-0000OE-Ml
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:33:00 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 x31-20020a17090a38a200b0020d2afec803so2647883pjb.2
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 11:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HGKU1HfSG1B7cf09yGzHx1Ql+djcrgurdKC/39LZ0Mo=;
 b=hcECfpL+qokieG/64JFI2YO3M1GOtN00cRlIScy2dflxyYEcc1ZIBvBdQWvUK0nZ7h
 Wl/DuGPlPUG3ICIEZFKHcE+/iu6pTHdawW49ovlg3JvlBvNumqoQMnrQt314tMK3Z1OJ
 ewPKmAt1sDK/FJCkTvIt5EamwqLLgH27mI7RH04Zp4jPcvlxnvv8q1nKFQkD88IukDXn
 J72tTntoynSL8LXQ2c2JyVoAWJWiKf4ymQyGcic1Oh2KIBwPOyTYPcXRsxF+NZUHuwy+
 7CpXL6xce30yH3/wqVMjwtMGWLoT/RzqBF2E7q6oVCF0bb5gxQ2/1QFiO//XjCbWlqrh
 0U0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HGKU1HfSG1B7cf09yGzHx1Ql+djcrgurdKC/39LZ0Mo=;
 b=eX80k/6U9xHSSWFUsjwx6LwD8pM5bDnaLzavIwL/NV2HNa0+S/Wp10bNYVYdez3Jsn
 gqsYPEphAk0nZi8yrnSWh0T5t8QzjPBzXJxMO4wX9+VcRHyII0xSYOU2u+kaOOm8IMUu
 +LrmzAaOaGEHJAW/mjwHMKcmnEuzp/g0ymH2NJubF08EDcUT/FNqkyB38CuLP/xj2EFT
 LEB0nDfZPRqDWrk2bRMmftk66dDndSm0dSW+iQDZbtOHC/pNgypVZnrRC6nXVbgGCJ+6
 8Idyl1xNzzqQ9Rv+pkAeARAvGqwB6eDwMA9q4VGeGMMuG0PZuBCcgctbDfjAE1cQF7G3
 5NHw==
X-Gm-Message-State: ACrzQf06BksXOcHd0aCkzUAIQzk2JvUlG3Z7ors6vKZ+ZsStF9H5bO1E
 OcRPtAhmSudRb4Rk1tSLfhlgUg==
X-Google-Smtp-Source: AMsMyM76osvACrVRMvfq6uznhuVAR88hIntIJjzMtBKtsb2eGu8cv7jRO95dBMwYl7lMjmo0keQIdQ==
X-Received: by 2002:a17:902:ec8d:b0:178:2914:b5a0 with SMTP id
 x13-20020a170902ec8d00b001782914b5a0mr1037726plg.17.1665685977047; 
 Thu, 13 Oct 2022 11:32:57 -0700 (PDT)
Received: from [10.1.28.222] (110-175-13-142.static.tpgi.com.au.
 [110.175.13.142]) by smtp.gmail.com with ESMTPSA id
 gg18-20020a17090b0a1200b0020d352dc81fsm83603pjb.54.2022.10.13.11.32.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 11:32:56 -0700 (PDT)
Message-ID: <2b16297e-5c4a-fcae-6385-1a30e4c3a817@linaro.org>
Date: Fri, 14 Oct 2022 05:32:50 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] Properly sign extend BBIT branch offset during
 calculation
Content-Language: en-US
To: Christopher Wrogg <cwrogg@umich.edu>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
References: <CAG7Es25Xv=WmA3VbgB2DzMZ7D9XYLe9CAnA3q2mHxiKHONvjcg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAG7Es25Xv=WmA3VbgB2DzMZ7D9XYLe9CAnA3q2mHxiKHONvjcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.25,
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

On 10/13/22 15:08, Christopher Wrogg wrote:
> The Octeon specific BBIT instruction incorrectly computes
> the branch offset. The 16 bit value is not sign extended.
> 
> Signed-off-by: Christopher Wrogg <cwrogg@umich.edu <mailto:cwrogg@umich.edu>>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1251 
> <https://gitlab.com/qemu-project/qemu/-/issues/1251>
> ---
>   target/mips/tcg/octeon_translate.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/target/mips/tcg/octeon_translate.c b/target/mips/tcg/octeon_translate.c
> index 6a207d2e7e..90f7b105cb 100644
> --- a/target/mips/tcg/octeon_translate.c
> +++ b/target/mips/tcg/octeon_translate.c
> @@ -38,7 +38,10 @@ static bool trans_BBIT(DisasContext *ctx, arg_BBIT *a)
>       }
> 
>       ctx->hflags |= MIPS_HFLAG_BC;
> -    ctx->btarget = ctx->base.pc_next + 4 + a->offset * 4;
> +    a->offset *= 4;
> +    a->offset = (target_long)(int16_t)a->offset;
> +    ctx->btarget = ctx->base.pc_next + 4 + a->offset;

This looks wrong, because you're sign-extending after scaling, which gives you only 14 
bits of offset instead of 16.

The correct fix should be earlier in decode:

- BBIT         11 set:1 . 10 rs:5 ..... offset:16 p=%bbit_p
+ BBIT         11 set:1 . 10 rs:5 ..... offset:s16 p=%bbit_p

to indicate a extract a signed field from the instruction.


r~

