Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DCD66A61A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 23:40:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGSiT-0002Nv-Mo; Fri, 13 Jan 2023 17:40:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGSiS-0002NU-DF
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 17:40:04 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGSiQ-0001jO-Lu
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 17:40:04 -0500
Received: by mail-pl1-x629.google.com with SMTP id c6so24865339pls.4
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 14:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PAQwBrUSfubfwa4Hl4W3QtDsfa1c9Q95Emz8outdczg=;
 b=MQZx9bq/HuTIv85OZtYY+/bL01kjvhQLNnU5mIba25W/nea1noSRnBFKg5eFqGSJzA
 tHQLIuGg+xzsesqHh46/BQEDhAVrtg6ZEUmzusRVcqjSsfHSSac0UQEGXewa+lNZL7QP
 Usvp7pIU4fGZczyj5FqWsiQsrsjtOPEnDiWP5swmJs4VaoeVqxOlGla2T0GYB2Z+XmCV
 jc3TrGeczaxWeqLe0UmEFnkC0PGMsln0Gbl1U+nyNtxbUstt3UwpMGm33iAqDZ8bSkoh
 rBocLMfaLgrJD0vl+5zBPtpTAPUEbgfihndZOzM2r5HoUgRr0xmy577VX0X6DbLWP3WN
 D1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PAQwBrUSfubfwa4Hl4W3QtDsfa1c9Q95Emz8outdczg=;
 b=3QwunxDPBZlmr3Td0EkMozDE6gpX4OuuaJpSNJZ/3n8kP64Y0rKbnmerUKwlh8VPGy
 6wXs46LHAcGPLC2cEF4Iktyidl1+/sgLB/dfuFnpwHQzHWqSB3akmPfZmHvBsIjDH4sd
 XuCDmxzqJw0pwP23V7Y6eIbPKPenbH85Lfrg/tsZuHhi9JuF4KNQWkJHAES+v5/JBntr
 +gDSmRP2OPOzIE4mP7l1ofGCLPOqKP0NFLTIvvMUV/l3fOdxeGTxDf36Nb0FGnPN41X0
 xZ38eaTw4IvNTIqOnzbkmTkVdyuGORGZXBkUs/Lb18B2c2N7UWZHW9w4ddUz12Cs9obd
 qhTg==
X-Gm-Message-State: AFqh2kpv1M2aiTDbJreiRTuU3EYphoOWABw801Zk0tn8adFyLkQmEaio
 JNRnoeNaqiOlG8RDFz6gTrAHgQ==
X-Google-Smtp-Source: AMrXdXudO4fzg5H7q5lzEsT/Z7uJJ4aXE86DLxqyqMdD7woxp6Y4ZRoQ9KNMZNGQai0JVJbMpf5LFw==
X-Received: by 2002:a05:6a21:998a:b0:ad:f86d:c0bc with SMTP id
 ve10-20020a056a21998a00b000adf86dc0bcmr124664647pzb.7.1673649601092; 
 Fri, 13 Jan 2023 14:40:01 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 z7-20020a63e547000000b00476d1385265sm11985884pgj.25.2023.01.13.14.39.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 14:40:00 -0800 (PST)
Message-ID: <54e6ed54-d7b2-c666-3fd8-614118e95a8f@linaro.org>
Date: Fri, 13 Jan 2023 12:39:56 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v3 27/28] arm/Kconfig: Always select SEMIHOSTING when
 TCG is present
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-28-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230113140419.4013-28-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

On 1/13/23 06:04, Fabiano Rosas wrote:
> We are about to enable the build without TCG, so CONFIG_SEMIHOSTING
> and CONFIG_ARM_COMPATIBLE_SEMIHOSTING cannot be unconditionally set in
> default.mak anymore. So reflect the change in a Kconfig.
> 
> Instead of using semihosting/Kconfig, use a target-specific file, so
> that the change doesn't affect other architectures which might
> implement semihosting in a way compatible with KVM.
> 
> The selection from ARM_v7M needs to be removed to avoid a cycle during
> parsing.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   configs/devices/arm-softmmu/default.mak | 2 --
>   hw/arm/Kconfig                          | 1 -
>   target/arm/Kconfig                      | 7 +++++++
>   3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
> index 6985a25377..24fb5f0366 100644
> --- a/configs/devices/arm-softmmu/default.mak
> +++ b/configs/devices/arm-softmmu/default.mak
> @@ -39,6 +39,4 @@ CONFIG_MICROBIT=y
>   CONFIG_FSL_IMX25=y
>   CONFIG_FSL_IMX7=y
>   CONFIG_FSL_IMX6UL=y
> -CONFIG_SEMIHOSTING=y
> -CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y

All of the arm linux-user configs need updating too.

>   CONFIG_ALLWINNER_H3=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 17fcde8e1c..e6f984fea8 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -312,7 +312,6 @@ config ARM_V7M
>       # currently v7M must be included in a TCG build due to translate.c
>       default y if TCG && (ARM || AARCH64)
>       select PTIMER
> -    select ARM_COMPATIBLE_SEMIHOSTING
>   
>   config ALLWINNER_A10
>       bool
> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
> index 3f3394a22b..60278ea9f7 100644
> --- a/target/arm/Kconfig
> +++ b/target/arm/Kconfig
> @@ -4,3 +4,10 @@ config ARM
>   config AARCH64
>       bool
>       select ARM
> +
> +# This config exists just so we can make SEMIHOSTING default when TCG
> +# is selected without also changing it for other architectures.
> +config ARM_SEMIHOSTING
> +    bool
> +    default y if TCG && (ARM || AARCH64)
> +    select ARM_COMPATIBLE_SEMIHOSTING

AARCH64 implies ARM, so shouldn't have to check for both.

It would be even better if there were another way to do this, like

config SEMIHOSTING
	depends on TCG

but I suppose that winds up with a conflict.
It's just that we're eventually going to have the same issue with riscv.


r~

