Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 715B758AEC6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 19:21:59 +0200 (CEST)
Received: from localhost ([::1]:48930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK11K-0007D0-IB
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 13:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK0wd-0002q9-Ir
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 13:17:09 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:43000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK0wa-00028o-PV
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 13:17:06 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 d65-20020a17090a6f4700b001f303a97b14so3480930pjk.1
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 10:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=exqckfbn+En+iuPZkmZiQItNC9CcDlFO2R3Sq6dMfKU=;
 b=wxzFERl+spa+lj/+DCUbWjM+nZ6n4OnUU7kZKDhYLFuMyQfOhBtsfyxTjLvXViGI2Z
 trneuDZbtArhmb5XjulIpxatliBIeM7yY9dvowHFedGH4pEoXk8y3xFqaAg0WJSgCmGS
 ndmOPdoPcZbC6OSPiHAu0Yzib+l8FGU5U2GKaFyIJDVu1NtSvJ0OOY10RPCfVzY5CST8
 Xsrbn6pLYh0db9oIP+ZFPC9TmIHuutAuPXUxEjgBHBuRMCp+K9B9Yo3N00DprucfouTR
 Ppr++/O++mlTggillsbV8eUWOnAZskflAz0M1uI42wxE+8YXyqHOHdgiuKrfrZ3VItnE
 THnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=exqckfbn+En+iuPZkmZiQItNC9CcDlFO2R3Sq6dMfKU=;
 b=uHb50g8J2LzBaV102iu2ab7tt+z9Cnd4+QxeOcXsqHbYni7k4UCZVGpLB3p5ZgiXUb
 Vg4HxC0CvYj0+nEIjto32NYiCmHPbjP6Abkd8zhu3OJ2rG9leLSoHpmaQ53fJfFrC+ly
 +Rso2x3abSjuwdziET8aY3CFIzL4YUuHfDdtYLnVJ9q9aCUThqsW696Z406SI8zZQkZ8
 ST1jF4cZSZojt5AiTStWgKCh867+3Nqw+6ABERvj8QVFne/SS1zhYF+lRy8jgd/2xSBA
 pbPRvjfUwM/Llt6jwatkS/3GSoB5I+JoKYIV8OOrbvSULp5eW97Eg7NhLya0XhlUt+16
 5TrA==
X-Gm-Message-State: ACgBeo3OcxrbJ5SPY8WPrDEV1varSyhbLVV5ZVVHwRTZFJ1na/RUS1bn
 oH9ck6rGFF62ajQ1ksjhDKeEVg==
X-Google-Smtp-Source: AA6agR5teVSvKB1OUwA1hnOSbuBhpFgaQarPye55sHbR9iB+/rBHmgTTe7mixECoSD3teWqOUeUnKw==
X-Received: by 2002:a17:902:9b96:b0:16c:83f0:33f8 with SMTP id
 y22-20020a1709029b9600b0016c83f033f8mr7595426plp.4.1659719823252; 
 Fri, 05 Aug 2022 10:17:03 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:abf8:e436:f4c:9089?
 ([2602:ae:154e:e201:abf8:e436:f4c:9089])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a170903018f00b0016ee708350bsm3448406plg.14.2022.08.05.10.17.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 10:17:02 -0700 (PDT)
Message-ID: <9e0592b7-3388-1707-bbf7-849a84c6e998@linaro.org>
Date: Fri, 5 Aug 2022 10:17:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] target/ppc: Bugfix FP when OE/UE are set
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Cc: danielhb413@gmail.com, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20220805141522.412864-1-lucas.araujo@eldorado.org.br>
 <20220805141522.412864-3-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220805141522.412864-3-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/5/22 07:15, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
> 
> When an overflow exception occurs and OE is set the intermediate result
> should be adjusted (by subtracting from the exponent) to avoid rounding
> to inf. The same applies to an underflow exceptionion and UE (but adding
> to the exponent). To do this set the fp_status.rebias_overflow when OE
> is set and fp_status.rebias_underflow when UE is set as the FPU will
> recalculate in case of a overflow/underflow if the according rebias* is
> set.
> 
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/cpu.c        | 2 ++
>   target/ppc/fpu_helper.c | 2 --
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
> index 401b6f9e63..0ebac04bc4 100644
> --- a/target/ppc/cpu.c
> +++ b/target/ppc/cpu.c
> @@ -120,6 +120,8 @@ void ppc_store_fpscr(CPUPPCState *env, target_ulong val)
>           val |= FP_FEX;
>       }
>       env->fpscr = val;
> +    env->fp_status.rebias_overflow  = (FP_OE & env->fpscr) ? true : false;
> +    env->fp_status.rebias_underflow = (FP_UE & env->fpscr) ? true : false;

No point in the ?: operator.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

>       if (tcg_enabled()) {
>           fpscr_set_rounding_mode(env);
>       }
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index 134804628b..c17575de5d 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -344,7 +344,6 @@ static inline int float_overflow_excp(CPUPPCState *env)
>   
>       bool overflow_enabled = !!(env->fpscr & FP_OE);
>       if (overflow_enabled) {
> -        /* XXX: should adjust the result */
>           /* Update the floating-point enabled exception summary */
>           env->fpscr |= FP_FEX;
>           /* We must update the target FPR before raising the exception */
> @@ -363,7 +362,6 @@ static inline void float_underflow_excp(CPUPPCState *env)
>       /* Update the floating-point exception summary */
>       env->fpscr |= FP_FX;
>       if (env->fpscr & FP_UE) {
> -        /* XXX: should adjust the result */
>           /* Update the floating-point enabled exception summary */
>           env->fpscr |= FP_FEX;
>           /* We must update the target FPR before raising the exception */


