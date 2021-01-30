Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF93309610
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 15:54:00 +0100 (CET)
Received: from localhost ([::1]:32782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5rdN-00040J-LR
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 09:53:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5rXn-0001lP-A5; Sat, 30 Jan 2021 09:48:11 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5rXl-0004Ty-P3; Sat, 30 Jan 2021 09:48:11 -0500
Received: by mail-wr1-x433.google.com with SMTP id v15so11803175wrx.4;
 Sat, 30 Jan 2021 06:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GlgDHR3ZqZqWGwjAMNZSIHStR7gOfs1UN1h7d6dVVjA=;
 b=WVUeCXW/DrQyxBNC0dV2M+zXhJprCPvF3rX8dxM6GE61Gd9pjyJPsux/WYUSLPsU3f
 brfFGowIJbC1H0wT7zBYlscqqF6lAQBoRvVvfAC+FjmXq8RKrtDy7kaW4Jjpn14qEtsm
 FObrStJiF4166Vpj+I9yzLm8+SMdBorTwUJ3vLxuYg7LriBN0oqmTcAc4rYYkSnRXyXI
 ScxXum9So4d2fVh8nhyHwgXy1T3AILQPEvikuL/+gIdEEGVL9Gdt237B0/v5l2cVhgb2
 DqEG+m+c/fqfuQsrg73OlP2VqbvkoYJxa8+SdU/JLnfe38m0hTg97pW/+aizmGTlhMqC
 C1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GlgDHR3ZqZqWGwjAMNZSIHStR7gOfs1UN1h7d6dVVjA=;
 b=AiYBlHfs46RTp9jLKr1je6tFXe2Ft1cLcRglNmwpxhd2fN27g3Ta7gpJ1YxjKVstEv
 RKEdDBT+GzZWMZsZIKm/ij+SARnWLkjfiYP1a4xngIniYUCwlRSfu9uoutW7m4RDkFns
 sJLbhWFo8LX1xzIVdC+5eFYz6780cfkgDBGJqs6xFdOe/cECqk4rbLXqlaa0VYIqVeBm
 ma6K2gZXuDp8J1avJbrwBBJ/3IhsJRrGUX1EdwHZ5NGE6INByTacwsBBAqKIdWLMhD+B
 OZbbK5J/hrbtz9DKlpK9RHd8cHT+VVxy58qQ4Ss1gHr5en+M7zgZt16Sf4YGEsr1FNDd
 RG9Q==
X-Gm-Message-State: AOAM530SMn+sxV0LwSpo0zYGNM4IEcIhAZg1wd/14UuVUOtReBudeFJb
 ajcsOc39mb/kyBK1lZu5b4p/b1N719Q=
X-Google-Smtp-Source: ABdhPJyXHSQk9hGaa07ZqC3MAbMC1wI3kpYj4cKTrV66w37uTSTBJ2RNMrzGc4nxVNR1fl9GP0/TVw==
X-Received: by 2002:adf:ed45:: with SMTP id u5mr9773679wro.358.1612018087373; 
 Sat, 30 Jan 2021 06:48:07 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id a17sm14650465wrx.63.2021.01.30.06.48.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Jan 2021 06:48:06 -0800 (PST)
Subject: Re: [PATCH v5 03/11] target/arm: Restrict ARMv4 cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210130015227.4071332-1-f4bug@amsat.org>
 <20210130015227.4071332-4-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e8502280-5c49-a81a-a1f1-b677adb8d8b3@amsat.org>
Date: Sat, 30 Jan 2021 15:48:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210130015227.4071332-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/30/21 2:52 AM, Philippe Mathieu-Daudé wrote:
> KVM requires a cpu based on (at least) the ARMv7 architecture.
> 
> Only enable the following ARMv4 CPUs when TCG is available:
> 
>   - StrongARM (SA1100/1110)
>   - OMAP1510 (TI925T)
> 
> The following machines are no more built when TCG is disabled:
> 
>   - cheetah              Palm Tungsten|E aka. Cheetah PDA (OMAP310)
>   - sx1                  Siemens SX1 (OMAP310) V2
>   - sx1-v1               Siemens SX1 (OMAP310) V1
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  default-configs/devices/arm-softmmu.mak | 2 --
>  hw/arm/Kconfig                          | 8 ++++++++
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
> index 341d439de6f..8a53e637d23 100644
> --- a/default-configs/devices/arm-softmmu.mak
> +++ b/default-configs/devices/arm-softmmu.mak
> @@ -14,8 +14,6 @@ CONFIG_INTEGRATOR=y
>  CONFIG_FSL_IMX31=y
>  CONFIG_MUSICPAL=y
>  CONFIG_MUSCA=y
> -CONFIG_CHEETAH=y
> -CONFIG_SX1=y
>  CONFIG_NSERIES=y
>  CONFIG_STELLARIS=y
>  CONFIG_REALVIEW=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 223016bb4e8..7126d82f6ce 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -1,3 +1,7 @@
> +config ARM_V4
> +    bool
> +    depends on TCG
> +
>  config ARM_VIRT
>      bool
>      imply PCI_DEVICES
> @@ -31,6 +35,8 @@ config ARM_VIRT
>  
>  config CHEETAH
>      bool
> +    default y if TCG

This doesn't work as being added to all targets...

> +    select ARM_V4
>      select OMAP
>      select TSC210X

