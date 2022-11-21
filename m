Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC54631EDC
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 11:57:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox4Sv-0004yt-ND; Mon, 21 Nov 2022 05:55:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox4Sr-0004ye-7z
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 05:55:49 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox4Sp-00054i-NZ
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 05:55:49 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 o7-20020a05600c510700b003cffc0b3374so8551723wms.0
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 02:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j3uqZy1Sg8L4oN2M3cNm11WYq2TOEuLqa6zKxX5j4AQ=;
 b=gK3IuXatXPWr/nhPWrx7+KRtGx8A44Zbjw3S2Mg68k892pp2xUDXOTvz+25IszLrJJ
 V5n1Hdus4wERkX8+XFcowVwx0RmJkc1d4FN+ktTjdVYV2vKLouKFpzc/BqtrYur5rCvO
 sDuyInmpH4O+cDlNhVfTzKhH2YLKtI9JSJ2CkVgbMZvyDxglJ+MXnjEbsxzoWUtNJGu1
 D5P6KH3+6xRe+fQDrj9LVqvOgLWWWZJfZpggs2K12aqL7wDPZ5X95fBJJVSXV0WS8Mxo
 lzX4As4vRB0ZOVrvAOr7El9F7tgAKNaFcRLTW4w3zlnFJrHNW3L7zjkL+D4UwQCYyYsS
 yhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j3uqZy1Sg8L4oN2M3cNm11WYq2TOEuLqa6zKxX5j4AQ=;
 b=tGd9e7d2UpTgaKi3t3Af8MWqiWUTqXzbwp8MH7uE2kfoikvfqitnP3IwYd8ko3YqFi
 pM/jcz/l50019+H3kodxTMrzfWKpWQKMesAbkoDaprxi7r95sL3964pD95DyXMv+Vs85
 zhaKNGnoBOXlRB7EQrEM3u9/MzjoOvO2Odvpry0vYDYydInamm8HNiq+ZAN0y4yb3p96
 ZbjxMynUp5Tm8M645o6zl4NBfuxsbD8xj8ab8Oq8BdYiYyy7s0AZ3QXN/5Vkw848mrQG
 aErVzmVOpbNzpyax3XFmu83dPV4eTUbBI6hod13ge/0n0fD1mDtsbQswH4XhZ4gi7gD9
 EJJw==
X-Gm-Message-State: ANoB5pnElKffuwMHmf+0+ltRcj2baXQo3vcfE3VJGKvPsBuXAv78/nE4
 Fk9M+YjjEK4Zqjd4ukWWSGxyUA==
X-Google-Smtp-Source: AA0mqf5N5ZFN8FRd0PH+qV4LbtRADuD4jdtPKkGJj/OOdHBWY4ssRXvu2Re3/FrSg/0YGTlcr+OKow==
X-Received: by 2002:a05:600c:1d9c:b0:3c6:bf1e:ebb9 with SMTP id
 p28-20020a05600c1d9c00b003c6bf1eebb9mr15378151wms.173.1669028144304; 
 Mon, 21 Nov 2022 02:55:44 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q2-20020adff502000000b00241cfa9333fsm4939315wro.5.2022.11.21.02.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 02:55:43 -0800 (PST)
Message-ID: <e5386ccd-93d7-1f98-45df-d1a83c630931@linaro.org>
Date: Mon, 21 Nov 2022 11:55:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH for-8.0 2/7] hw/mips: Use QEMU_IOTHREAD_LOCK_GUARD in
 cpu_mips_irq_request
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20221118091858.242569-1-richard.henderson@linaro.org>
 <20221118091858.242569-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221118091858.242569-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 18/11/22 10:18, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   hw/mips/mips_int.c | 11 +----------
>   1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/hw/mips/mips_int.c b/hw/mips/mips_int.c
> index 2db5e10fe0..73437cd90f 100644
> --- a/hw/mips/mips_int.c
> +++ b/hw/mips/mips_int.c
> @@ -32,17 +32,12 @@ static void cpu_mips_irq_request(void *opaque, int irq, int level)
>       MIPSCPU *cpu = opaque;
>       CPUMIPSState *env = &cpu->env;
>       CPUState *cs = CPU(cpu);
> -    bool locked = false;
>   
>       if (irq < 0 || irq > 7) {
>           return;
>       }
>   
> -    /* Make sure locking works even if BQL is already held by the caller */
> -    if (!qemu_mutex_iothread_locked()) {
> -        locked = true;
> -        qemu_mutex_lock_iothread();
> -    }
> +    QEMU_IOTHREAD_LOCK_GUARD();
>   
>       if (level) {
>           env->CP0_Cause |= 1 << (irq + CP0Ca_IP);
> @@ -59,10 +54,6 @@ static void cpu_mips_irq_request(void *opaque, int irq, int level)
>       } else {
>           cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
>       }
> -
> -    if (locked) {
> -        qemu_mutex_unlock_iothread();
> -    }
>   }

I'd rather have a macro similar to WITH_RCU_READ_LOCK_GUARD()
so the locked context is obvious:

   WITH_QEMU_IOTHREAD_LOCK_GUARD() {
       ...
   }

Anyhow:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


