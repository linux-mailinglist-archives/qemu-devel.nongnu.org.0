Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B0C300D42
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:03:17 +0100 (CET)
Received: from localhost ([::1]:36016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l32eK-0001CB-2M
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:03:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l32bu-0000S4-T7; Fri, 22 Jan 2021 15:00:47 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:50026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l32br-0008Uw-Lp; Fri, 22 Jan 2021 15:00:46 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 41BC2C602E6;
 Fri, 22 Jan 2021 21:00:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1611345640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+/F7BJg3mZoz1KfDT2WZeYlQBEptz0kAFjeoVnX11wY=;
 b=d6ZT2chsWAOM+R4moGuNKoO0KRtrt54sEcOS4/tMCaXdwmoaipqaA5se3i54cldeXVqb+j
 RHctyopjrKk5iUqskKLOO2IC+ZpEVjnr6IJLkIhGBWGf/1ql3sXQDCHmZ/XE2LenkJngQ+
 w/LdmiQmMynvuOjzA20sF2iHFRGIV5IfE+XL0HziG+9dijO2s7x7r3/U9A/UuBvCH6D7UE
 BzA7t/JmMqhY895YLn4YDsnFm0RsUhoPp/XIIbufheBW2e5trEeCYCcsJYlLgXZ2NJKE0m
 Ec+zEjqNC7D+Efr7M4AzYJ0aifsr3DBp+2jaWeEN0ElWROqm73VarR5/voeZYQ==
Date: Fri, 22 Jan 2021 21:01:01 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 15/25] hw/arm/musca: Create and connect ARMSSE Clocks
Message-ID: <20210122200101.6ebkvkwntmatnwm3@sekoia-pc.home.lmichel.fr>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-16-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121190622.22000-16-peter.maydell@linaro.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19:06 Thu 21 Jan     , Peter Maydell wrote:
> Create and connect the two clocks needed by the ARMSSE.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  hw/arm/musca.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/hw/arm/musca.c b/hw/arm/musca.c
> index d82bef11cf2..a9292482a06 100644
> --- a/hw/arm/musca.c
> +++ b/hw/arm/musca.c
> @@ -33,6 +33,7 @@
>  #include "hw/misc/tz-ppc.h"
>  #include "hw/misc/unimp.h"
>  #include "hw/rtc/pl031.h"
> +#include "hw/qdev-clock.h"
>  #include "qom/object.h"
>  
>  #define MUSCA_NUMIRQ_MAX 96
> @@ -82,6 +83,8 @@ struct MuscaMachineState {
>      UnimplementedDeviceState sdio;
>      UnimplementedDeviceState gpio;
>      UnimplementedDeviceState cryptoisland;
> +    Clock *sysclk;
> +    Clock *s32kclk;
>  };
>  
>  #define TYPE_MUSCA_MACHINE "musca"
> @@ -96,6 +99,8 @@ OBJECT_DECLARE_TYPE(MuscaMachineState, MuscaMachineClass, MUSCA_MACHINE)
>   * don't model that in our SSE-200 model yet.
>   */
>  #define SYSCLK_FRQ 40000000
> +/* Slow 32Khz S32KCLK frequency in Hz */
> +#define S32KCLK_FRQ (32 * 1000)
>  
>  static qemu_irq get_sse_irq_in(MuscaMachineState *mms, int irqno)
>  {
> @@ -367,6 +372,11 @@ static void musca_init(MachineState *machine)
>          exit(1);
>      }
>  
> +    mms->sysclk = clock_new(OBJECT(machine), "SYSCLK");
> +    clock_set_hz(mms->sysclk, SYSCLK_FRQ);
> +    mms->s32kclk = clock_new(OBJECT(machine), "S32KCLK");
> +    clock_set_hz(mms->s32kclk, S32KCLK_FRQ);
> +
>      object_initialize_child(OBJECT(machine), "sse-200", &mms->sse,
>                              TYPE_SSE200);
>      ssedev = DEVICE(&mms->sse);
> @@ -376,6 +386,8 @@ static void musca_init(MachineState *machine)
>      qdev_prop_set_uint32(ssedev, "init-svtor", mmc->init_svtor);
>      qdev_prop_set_uint32(ssedev, "SRAM_ADDR_WIDTH", mmc->sram_addr_width);
>      qdev_prop_set_uint32(ssedev, "MAINCLK_FRQ", SYSCLK_FRQ);
> +    qdev_connect_clock_in(ssedev, "MAINCLK", mms->sysclk);
> +    qdev_connect_clock_in(ssedev, "S32KCLK", mms->s32kclk);
>      /*
>       * Musca-A takes the default SSE-200 FPU/DSP settings (ie no for
>       * CPU0 and yes for CPU1); Musca-B1 explicitly enables them for CPU0.
> -- 
> 2.20.1
> 

-- 

