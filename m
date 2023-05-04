Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABCD6F658D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 09:13:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puT8j-0003fv-EC; Thu, 04 May 2023 03:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1puT8i-0003eq-3W
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:12:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1puT8g-0005EV-Do
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:12:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683184349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qPC5xSBUaXBPxko2ZFE07ON7pqdShsd/N0cXFpVpoNw=;
 b=ZHdY1byBdX9WsCdGxBw16cRJE7Fp4oTF1XNxNwgIREJDAEpCQd5j+e3+OPSBgmjSzyxGtU
 uYmuc+p1kUpZ7X9W7wmiFNIObWwEr/MeX7v6/khNUhN5hC47Y/4p5FPKHInO6ci4pxZS8Z
 BooWyX+kixToChJmt/lVqq8TMRNcoAQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-H11YbjFZMpaOdb5LJRA97A-1; Thu, 04 May 2023 03:12:27 -0400
X-MC-Unique: H11YbjFZMpaOdb5LJRA97A-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f3157128b4so31699155e9.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 00:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683184346; x=1685776346;
 h=content-transfer-encoding:in-reply-to:subject:from:references:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qPC5xSBUaXBPxko2ZFE07ON7pqdShsd/N0cXFpVpoNw=;
 b=OgiiLqJ0giahpBbjNYgAlFBYm5Q7wMOTglBmbi2+8RZGKk2kdVuaFK+0fVAtCtnqj1
 2jAeFcMxcVWb6SygTlydc7unvOnzF4eSQRTujbtRAjlD/Ycs1PYuqU9Obm/8bbc6Cgji
 IwZXWxSbqLuFlRDgqP5gLutHeOO7882Z36BJCwJEtXOrtaI/L4G+pOgK6aK+GsCi3K2z
 Kw/y2RjggoNrw/kFOp7rSKRj0h1bd0E5/OR1zQaiBCg/gb6HHG0p63VBuaHYRtT5HMQ/
 mHPTBslK6Kvvy7gAkyNdPZK8DHzuQ+VKG8DDj6ynXNa0ulqS9Bgz4ATCYJt+ZAA5Kwwn
 0zyg==
X-Gm-Message-State: AC+VfDyF3JeEppsGGewL6IYjI0O+YuQFQdzWw0VBorHjkDrTtFIjfFkK
 ENNB+2L88L5/2/aJaekdo+tl9ZZR+gl0L8xgEhT1IvXArJRR+MAgUDA6h7KPQ+YI+g+Pof+ggvF
 woMpTOzSeP5pqCg8=
X-Received: by 2002:a05:600c:5102:b0:3f1:7510:62e8 with SMTP id
 o2-20020a05600c510200b003f1751062e8mr3114577wms.3.1683184346732; 
 Thu, 04 May 2023 00:12:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7rqecFDW8tS/MBh65vNBpwLMp3d4eM6CmAdcSSDGtMwmL8bTlvnNe0GrI5JtEKTxIqV8r3aw==
X-Received: by 2002:a05:600c:5102:b0:3f1:7510:62e8 with SMTP id
 o2-20020a05600c510200b003f1751062e8mr3114562wms.3.1683184346363; 
 Thu, 04 May 2023 00:12:26 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-91.web.vodafone.de.
 [109.43.179.91]) by smtp.gmail.com with ESMTPSA id
 f1-20020a1cc901000000b003f25b40fc24sm3952594wmb.6.2023.05.04.00.12.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 00:12:25 -0700 (PDT)
Message-ID: <b5d0ea65-0485-382b-f59a-84a5596b63a2@redhat.com>
Date: Thu, 4 May 2023 09:12:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
 <20230502121459.2422303-12-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PULL 11/35] arm/Kconfig: Do not build TCG-only boards on a
 KVM-only build
In-Reply-To: <20230502121459.2422303-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02/05/2023 14.14, Peter Maydell wrote:
> From: Fabiano Rosas <farosas@suse.de>
> 
> Move all the CONFIG_FOO=y from default.mak into "default y if TCG"
> statements in Kconfig. That way they won't be selected when
> CONFIG_TCG=n.
> 
> I'm leaving CONFIG_ARM_VIRT in default.mak because it allows us to
> keep the two default.mak files not empty and keep aarch64-default.mak
> including arm-default.mak. That way we don't surprise anyone that's
> used to altering these files.
> 
> With this change we can start building with --disable-tcg.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-id: 20230426180013.14814-12-farosas@suse.de
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   configs/devices/aarch64-softmmu/default.mak |  4 --
>   configs/devices/arm-softmmu/default.mak     | 37 ------------------
>   hw/arm/Kconfig                              | 42 ++++++++++++++++++++-
>   3 files changed, 41 insertions(+), 42 deletions(-)
> 
> diff --git a/configs/devices/aarch64-softmmu/default.mak b/configs/devices/aarch64-softmmu/default.mak
> index cf43ac8da11..70e05a197dc 100644
> --- a/configs/devices/aarch64-softmmu/default.mak
> +++ b/configs/devices/aarch64-softmmu/default.mak
> @@ -2,7 +2,3 @@
>   
>   # We support all the 32 bit boards so need all their config
>   include ../arm-softmmu/default.mak
> -
> -CONFIG_XLNX_ZYNQMP_ARM=y
> -CONFIG_XLNX_VERSAL=y
> -CONFIG_SBSA_REF=y
> diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
> index cb3e5aea657..647fbce88d3 100644
> --- a/configs/devices/arm-softmmu/default.mak
> +++ b/configs/devices/arm-softmmu/default.mak
> @@ -4,40 +4,3 @@
>   # CONFIG_TEST_DEVICES=n
>   
>   CONFIG_ARM_VIRT=y
> -CONFIG_CUBIEBOARD=y
> -CONFIG_EXYNOS4=y
> -CONFIG_HIGHBANK=y
> -CONFIG_INTEGRATOR=y
> -CONFIG_FSL_IMX31=y
> -CONFIG_MUSICPAL=y
> -CONFIG_MUSCA=y
> -CONFIG_CHEETAH=y
> -CONFIG_SX1=y
> -CONFIG_NSERIES=y
> -CONFIG_STELLARIS=y
> -CONFIG_STM32VLDISCOVERY=y
> -CONFIG_REALVIEW=y
> -CONFIG_VERSATILE=y
> -CONFIG_VEXPRESS=y
> -CONFIG_ZYNQ=y
> -CONFIG_MAINSTONE=y
> -CONFIG_GUMSTIX=y
> -CONFIG_SPITZ=y
> -CONFIG_TOSA=y
> -CONFIG_Z2=y
> -CONFIG_NPCM7XX=y
> -CONFIG_COLLIE=y
> -CONFIG_ASPEED_SOC=y
> -CONFIG_NETDUINO2=y
> -CONFIG_NETDUINOPLUS2=y
> -CONFIG_OLIMEX_STM32_H405=y
> -CONFIG_MPS2=y
> -CONFIG_RASPI=y
> -CONFIG_DIGIC=y
> -CONFIG_SABRELITE=y
> -CONFIG_EMCRAFT_SF2=y
> -CONFIG_MICROBIT=y
> -CONFIG_FSL_IMX25=y
> -CONFIG_FSL_IMX7=y
> -CONFIG_FSL_IMX6UL=y
> -CONFIG_ALLWINNER_H3=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 87c1a29c912..2d7c4579559 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -35,20 +35,24 @@ config ARM_VIRT
>   
>   config CHEETAH
>       bool
> +    default y if TCG && ARM
>       select OMAP
>       select TSC210X
>   
>   config CUBIEBOARD
>       bool
> +    default y if TCG && ARM
>       select ALLWINNER_A10
...

  Hi!

Sorry for not noticing this earlier, but I have to say that I really dislike 
this change, since it very much changes the way we did our machine 
configuration so far.
Until now, you could simply go to configs/devices/*-softmmu/*.mak and only 
select the machines you wanted to have with "...=y" and delete everything 
else. Now you have to know *all* the machines that you do *not* want to have 
in your build and disable them with "...=n" in that file. That's quite ugly, 
especially for the arm target that has so many machines. (ok, you could also 
do a "--without-default-devices" configuration to get rid of the machines, 
but that also disables all other kind of devices that you then have to 
specify manually).

Isn't there a better way to solve this TCG dependency problem?
Paolo, do you maybe have any ideas?

  Thomas


