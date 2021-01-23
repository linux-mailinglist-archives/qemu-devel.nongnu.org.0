Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F49630185E
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 21:34:53 +0100 (CET)
Received: from localhost ([::1]:56526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3PcS-0006kD-Jo
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 15:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l3PZw-0005dT-7U; Sat, 23 Jan 2021 15:32:17 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:58560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l3PZp-0003yT-CL; Sat, 23 Jan 2021 15:32:16 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 0A9B2C602E6;
 Sat, 23 Jan 2021 21:32:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1611433927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zZoN0v7rmxAScNwjyaP5Vs3snrK3aFC32pqDZKZCyRI=;
 b=ZFMOx2KIebFXoDwEQF452PGxtcOshcB/Nb+pWQp4eCk8MmazFjG9eX7peOrv40Fb1pTgvd
 fS/OZA9tjcjh1gi6B5vNGQ+J3RFZ3KtE6hd9erC0aYaErSWA9xHzXgcNKb1FcU39n95TCa
 GvMPeCoaP+84uJ0ZCSfn21GfeqvWpNb0tnreBhx+NTZMsqsBNPbzBvYbO9H3BV8orRROQL
 PZ4uJ9RaO0mJ4xR31kdGJ3lrvfZcKCrkbKX5fMbOVdukHjSwGeiKOYTJO1MzNbxYgCOUh6
 iqryG9ov2h22ufP/DFWpBQ1p+Tc17NVbvgE+0OpSsA8BioOkT36BDXPnh5L8YQ==
Date: Sat, 23 Jan 2021 21:32:28 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 23/25] arm: Don't set freq properties on CMSDK timer,
 dualtimer, watchdog, ARMSSE
Message-ID: <20210123203228.nt3l7wvon3lub5bi@sekoia-pc.home.lmichel.fr>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-24-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121190622.22000-24-peter.maydell@linaro.org>
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
> Remove all the code that sets frequency properties on the CMSDK
> timer, dualtimer and watchdog devices and on the ARMSSE SoC device:
> these properties are unused now that the devices rely on their Clock
> inputs instead.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  hw/arm/armsse.c    | 7 -------
>  hw/arm/mps2-tz.c   | 1 -
>  hw/arm/mps2.c      | 3 ---
>  hw/arm/musca.c     | 1 -
>  hw/arm/stellaris.c | 3 ---
>  5 files changed, 15 deletions(-)
> 
> diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
> index 1da0c1be4c7..7494afc630e 100644
> --- a/hw/arm/armsse.c
> +++ b/hw/arm/armsse.c
> @@ -726,7 +726,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>       * it to the appropriate PPC port; then we can realize the PPC and
>       * map its upstream ends to the right place in the container.
>       */
> -    qdev_prop_set_uint32(DEVICE(&s->timer0), "pclk-frq", s->mainclk_frq);
>      qdev_connect_clock_in(DEVICE(&s->timer0), "pclk", s->mainclk);
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer0), errp)) {
>          return;
> @@ -737,7 +736,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>      object_property_set_link(OBJECT(&s->apb_ppc0), "port[0]", OBJECT(mr),
>                               &error_abort);
>  
> -    qdev_prop_set_uint32(DEVICE(&s->timer1), "pclk-frq", s->mainclk_frq);
>      qdev_connect_clock_in(DEVICE(&s->timer1), "pclk", s->mainclk);
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer1), errp)) {
>          return;
> @@ -748,7 +746,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>      object_property_set_link(OBJECT(&s->apb_ppc0), "port[1]", OBJECT(mr),
>                               &error_abort);
>  
> -    qdev_prop_set_uint32(DEVICE(&s->dualtimer), "pclk-frq", s->mainclk_frq);
>      qdev_connect_clock_in(DEVICE(&s->dualtimer), "TIMCLK", s->mainclk);
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->dualtimer), errp)) {
>          return;
> @@ -907,7 +904,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>      /* Devices behind APB PPC1:
>       *   0x4002f000: S32K timer
>       */
> -    qdev_prop_set_uint32(DEVICE(&s->s32ktimer), "pclk-frq", S32KCLK);
>      qdev_connect_clock_in(DEVICE(&s->s32ktimer), "pclk", s->s32kclk);
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->s32ktimer), errp)) {
>          return;
> @@ -1001,7 +997,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>      qdev_connect_gpio_out(DEVICE(&s->nmi_orgate), 0,
>                            qdev_get_gpio_in_named(DEVICE(&s->armv7m), "NMI", 0));
>  
> -    qdev_prop_set_uint32(DEVICE(&s->s32kwatchdog), "wdogclk-frq", S32KCLK);
>      qdev_connect_clock_in(DEVICE(&s->s32kwatchdog), "WDOGCLK", s->s32kclk);
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->s32kwatchdog), errp)) {
>          return;
> @@ -1012,7 +1007,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>  
>      /* 0x40080000 .. 0x4008ffff : ARMSSE second Base peripheral region */
>  
> -    qdev_prop_set_uint32(DEVICE(&s->nswatchdog), "wdogclk-frq", s->mainclk_frq);
>      qdev_connect_clock_in(DEVICE(&s->nswatchdog), "WDOGCLK", s->mainclk);
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->nswatchdog), errp)) {
>          return;
> @@ -1021,7 +1015,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>                         armsse_get_common_irq_in(s, 1));
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->nswatchdog), 0, 0x40081000);
>  
> -    qdev_prop_set_uint32(DEVICE(&s->swatchdog), "wdogclk-frq", s->mainclk_frq);
>      qdev_connect_clock_in(DEVICE(&s->swatchdog), "WDOGCLK", s->mainclk);
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->swatchdog), errp)) {
>          return;
> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> index 7acdf490f28..90caa914934 100644
> --- a/hw/arm/mps2-tz.c
> +++ b/hw/arm/mps2-tz.c
> @@ -413,7 +413,6 @@ static void mps2tz_common_init(MachineState *machine)
>      object_property_set_link(OBJECT(&mms->iotkit), "memory",
>                               OBJECT(system_memory), &error_abort);
>      qdev_prop_set_uint32(iotkitdev, "EXP_NUMIRQ", MPS2TZ_NUMIRQ);
> -    qdev_prop_set_uint32(iotkitdev, "MAINCLK_FRQ", SYSCLK_FRQ);
>      qdev_connect_clock_in(iotkitdev, "MAINCLK", mms->sysclk);
>      qdev_connect_clock_in(iotkitdev, "S32KCLK", mms->s32kclk);
>      sysbus_realize(SYS_BUS_DEVICE(&mms->iotkit), &error_fatal);
> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> index cd1c215f941..39add416db5 100644
> --- a/hw/arm/mps2.c
> +++ b/hw/arm/mps2.c
> @@ -346,7 +346,6 @@ static void mps2_common_init(MachineState *machine)
>          object_initialize_child(OBJECT(mms), name, &mms->timer[i],
>                                  TYPE_CMSDK_APB_TIMER);
>          sbd = SYS_BUS_DEVICE(&mms->timer[i]);
> -        qdev_prop_set_uint32(DEVICE(&mms->timer[i]), "pclk-frq", SYSCLK_FRQ);
>          qdev_connect_clock_in(DEVICE(&mms->timer[i]), "pclk", mms->sysclk);
>          sysbus_realize_and_unref(sbd, &error_fatal);
>          sysbus_mmio_map(sbd, 0, base);
> @@ -355,7 +354,6 @@ static void mps2_common_init(MachineState *machine)
>  
>      object_initialize_child(OBJECT(mms), "dualtimer", &mms->dualtimer,
>                              TYPE_CMSDK_APB_DUALTIMER);
> -    qdev_prop_set_uint32(DEVICE(&mms->dualtimer), "pclk-frq", SYSCLK_FRQ);
>      qdev_connect_clock_in(DEVICE(&mms->dualtimer), "TIMCLK", mms->sysclk);
>      sysbus_realize(SYS_BUS_DEVICE(&mms->dualtimer), &error_fatal);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&mms->dualtimer), 0,
> @@ -363,7 +361,6 @@ static void mps2_common_init(MachineState *machine)
>      sysbus_mmio_map(SYS_BUS_DEVICE(&mms->dualtimer), 0, 0x40002000);
>      object_initialize_child(OBJECT(mms), "watchdog", &mms->watchdog,
>                              TYPE_CMSDK_APB_WATCHDOG);
> -    qdev_prop_set_uint32(DEVICE(&mms->watchdog), "wdogclk-frq", SYSCLK_FRQ);
>      qdev_connect_clock_in(DEVICE(&mms->watchdog), "WDOGCLK", mms->sysclk);
>      sysbus_realize(SYS_BUS_DEVICE(&mms->watchdog), &error_fatal);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&mms->watchdog), 0,
> diff --git a/hw/arm/musca.c b/hw/arm/musca.c
> index a9292482a06..945643c3cd7 100644
> --- a/hw/arm/musca.c
> +++ b/hw/arm/musca.c
> @@ -385,7 +385,6 @@ static void musca_init(MachineState *machine)
>      qdev_prop_set_uint32(ssedev, "EXP_NUMIRQ", mmc->num_irqs);
>      qdev_prop_set_uint32(ssedev, "init-svtor", mmc->init_svtor);
>      qdev_prop_set_uint32(ssedev, "SRAM_ADDR_WIDTH", mmc->sram_addr_width);
> -    qdev_prop_set_uint32(ssedev, "MAINCLK_FRQ", SYSCLK_FRQ);
>      qdev_connect_clock_in(ssedev, "MAINCLK", mms->sysclk);
>      qdev_connect_clock_in(ssedev, "S32KCLK", mms->s32kclk);
>      /*
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index 9b67c739ef2..5acb043a07e 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -1415,9 +1415,6 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
>      if (board->dc1 & (1 << 3)) { /* watchdog present */
>          dev = qdev_new(TYPE_LUMINARY_WATCHDOG);
>  
> -        /* system_clock_scale is valid now */
> -        uint32_t mainclk = NANOSECONDS_PER_SECOND / system_clock_scale;
> -        qdev_prop_set_uint32(dev, "wdogclk-frq", mainclk);
>          qdev_connect_clock_in(dev, "WDOGCLK",
>                                qdev_get_clock_out(ssys_dev, "SYSCLK"));
>  
> -- 
> 2.20.1
> 

-- 

