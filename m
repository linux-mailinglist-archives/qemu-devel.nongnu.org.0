Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF04590622
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 20:00:07 +0200 (CEST)
Received: from localhost ([::1]:60596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMCTW-0005Vu-EF
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 14:00:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMCLC-0007VM-Dk
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:51:31 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:35677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMCLA-00069I-S7
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:51:30 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 o3-20020a17090a0a0300b001f7649cd317so6128260pjo.0
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 10:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=HQKmk+LBZ6fW0+fCh+uLp63LKlIoBqsDkchkHUREuYU=;
 b=gmUXLTZgVIbH+6uGRhXoSAeyXyyiFw3LVebSIr2hzmV8kfcSx0WWcdJvfVupd3Uda9
 HjQiQxxqGiCEUeVT3N+FFc61NbkbtJgT2bOmKuoD+sAhmtgXDmB1Qx4NR5biMY/hidJl
 on6sXRQleYGtCITxuCXIzZhW9055xUCDYnRLpOfCwxVbMV5bk+2erYIUaT7QRGo4TQsp
 zxdDP0Acoa6NaQTvUYz9PSC9dHW7uDh1QZwXnmDAJJtOoLCQhx21wUt52jJcBQmIYD5i
 rcjnUcjMAuSwOjJrn4zmDEbU15g33i/Hny0RcJhLBBZHA9ROpaneQOwfsFNSsceAevho
 Fc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=HQKmk+LBZ6fW0+fCh+uLp63LKlIoBqsDkchkHUREuYU=;
 b=nJ2U+OGZBW5J8Tfx3yKjP+UXC3nWavODdx7a9B7lxIrMc1ft9lC/UqfeMp0wj7VxkL
 rO9jlo1r4QVdvVjuNWbQJUIbV6VP1Wq7NN8OnZPOJO1dOlRvwcttcb1TtxzPbd+mFu0b
 WXw6bmZw5lcRsmtvu9EsB9KcaaSVvENN91i2WZWeI0vBoEkCcGtVlVcJcYVhXOjJoTSD
 08uQW3kx6l2oO4EOKwnWXpKRt86vGJ1OppOcc0nY6S/QWtWCm+B1OB+ldzquKjwyY7b8
 LP+eSpO7Y8gzB75os9B5sP0/jRnsyBOsIRVWHJLxbh6qfUVZrzDmf7pRtpiEB0TIO3r5
 Infg==
X-Gm-Message-State: ACgBeo1m0jqfiKF8i9rHF6QO6EYAsFcw9R0rOedjAFzbiIDfdc2iHEdv
 OkHLEhslVWYtnpuhgp4UOJy6YA==
X-Google-Smtp-Source: AA6agR5hRmOOij5H8x4f3q+DP6puE066WIwURTK4tZhAD8VQvybQ9i7iVD0g/hUl3C82WUOD2YB34g==
X-Received: by 2002:a17:90b:4b52:b0:1f7:2e06:575f with SMTP id
 mi18-20020a17090b4b5200b001f72e06575fmr9797843pjb.120.1660240287221; 
 Thu, 11 Aug 2022 10:51:27 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:72e2:2d06:c2b1:b106?
 ([2602:ae:154e:e201:72e2:2d06:c2b1:b106])
 by smtp.gmail.com with ESMTPSA id
 q61-20020a17090a1b4300b001f7a4ea4fd5sm3914352pjq.39.2022.08.11.10.51.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 10:51:26 -0700 (PDT)
Message-ID: <8c475566-41d0-1408-2c80-ee84e03cf2b9@linaro.org>
Date: Thu, 11 Aug 2022 10:51:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 06/10] target/arm: Detect overflow when calculating next
 PMU interrupt
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220811171619.1154755-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

On 8/11/22 10:16, Peter Maydell wrote:
> In pmccntr_op_finish() and pmevcntr_op_finish() we calculate the next
> point at which we will get an overflow and need to fire the PMU
> interrupt or set the overflow flag.  We do this by calculating the
> number of nanoseconds to the overflow event and then adding it to
> qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL).  However, we don't check
> whether that signed addition overflows, which can happen if the next
> PMU interrupt would happen massively far in the future (250 years or
> more).
> 
> Since QEMU assumes that "when the QEMU_CLOCK_VIRTUAL rolls over" is
> "never", the sensible behaviour in this situation is simply to not
> try to set the timer if it would be beyond that point.  Detect the
> overflow, and skip setting the timer in that case.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 434885d024a..b7a420981f8 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1227,10 +1227,13 @@ static void pmccntr_op_finish(CPUARMState *env)
>           int64_t overflow_in = cycles_ns_per(remaining_cycles);
>   
>           if (overflow_in > 0) {
> -            int64_t overflow_at = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                overflow_in;
> -            ARMCPU *cpu = env_archcpu(env);
> -            timer_mod_anticipate_ns(cpu->pmu_timer, overflow_at);
> +            int64_t overflow_at;
> +
> +            if (!sadd64_overflow(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> +                                overflow_in, &overflow_at)) {

Maybe my mailer, but it looks like alignment is off on the continuation line here...

> +            int64_t overflow_at;
> +
> +            if (!sadd64_overflow(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> +                                 overflow_in, &overflow_at)) {

but not here.

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

