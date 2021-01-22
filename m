Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB147300771
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 16:35:35 +0100 (CET)
Received: from localhost ([::1]:33098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2yTG-0005wq-RO
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 10:35:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l2yRg-0004wb-6t; Fri, 22 Jan 2021 10:33:56 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:38232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l2yRe-0002QT-8F; Fri, 22 Jan 2021 10:33:55 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 1F63DC602E6;
 Fri, 22 Jan 2021 16:33:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1611329632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LQI+a1eEM5tuxsSegx9KtrBu9puU3YV07VoG4tvtOqo=;
 b=PCjNaZMdYZcR1Zcy1oXiQFtyQHxCX9ukjSLfIMCqgL/rSLOhS3JUCCbExaxQGCEA/fNSwP
 4J3RKpkc297gfutrzoXbxWHG06NqqDmHNi3D4hoqSZNbHX1xS07AzG6HXxcp4/mmbHLIPR
 8YV3qVaYQRW01S/k7QbyuqX/BzFe75gK2rlr06Ydzec1lmAzsw8so+OZ2TwvK3cvyb0pst
 CMBwYe/zgfPbmbxCxnOr9LhyOH6r1ItEMqFBfe9/OLOMlvn3VIVlSQt+R23LeEgMI4goLl
 U9hL6A4Sl8WLiVD4IgPyrCy5v9QZLD63oDXK7enRN/HSr/tO6lbSwd/p8ZmL9A==
Date: Fri, 22 Jan 2021 16:34:13 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 11/25] hw/arm/armsse: Wire up clocks
Message-ID: <20210122153413.srcx5vcwnidkb5nb@sekoia-pc.home.lmichel.fr>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-12-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121190622.22000-12-peter.maydell@linaro.org>
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
> Create two input clocks on the ARMSSE devices, one for the normal
> MAINCLK, and one for the 32KHz S32KCLK, and wire these up to the
> appropriate devices.  The old property-based clock frequency setting
> will remain in place until conversion is complete.
> 
> This is a migration compatibility break for machines mps2-an505,
> mps2-an521, musca-a, musca-b1.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  include/hw/arm/armsse.h |  6 ++++++
>  hw/arm/armsse.c         | 17 +++++++++++++++--
>  2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
> index 4860a793f4b..bfa1e79c4fe 100644
> --- a/include/hw/arm/armsse.h
> +++ b/include/hw/arm/armsse.h
> @@ -37,6 +37,8 @@
>   *  per-CPU identity and control register blocks
>   *
>   * QEMU interface:
> + *  + Clock input "MAINCLK": clock for CPUs and most peripherals
> + *  + Clock input "S32KCLK": slow 32KHz clock used for a few peripherals
>   *  + QOM property "memory" is a MemoryRegion containing the devices provided
>   *    by the board model.
>   *  + QOM property "MAINCLK_FRQ" is the frequency of the main system clock
> @@ -103,6 +105,7 @@
>  #include "hw/misc/armsse-mhu.h"
>  #include "hw/misc/unimp.h"
>  #include "hw/or-irq.h"
> +#include "hw/clock.h"
>  #include "hw/core/split-irq.h"
>  #include "hw/cpu/cluster.h"
>  #include "qom/object.h"
> @@ -209,6 +212,9 @@ struct ARMSSE {
>  
>      uint32_t nsccfg;
>  
> +    Clock *mainclk;
> +    Clock *s32kclk;
> +
>      /* Properties */
>      MemoryRegion *board_memory;
>      uint32_t exp_numirq;
> diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
> index d2ba0459c44..4349ce9bfdb 100644
> --- a/hw/arm/armsse.c
> +++ b/hw/arm/armsse.c
> @@ -21,6 +21,7 @@
>  #include "hw/arm/armsse.h"
>  #include "hw/arm/boot.h"
>  #include "hw/irq.h"
> +#include "hw/qdev-clock.h"
>  
>  /* Format of the System Information block SYS_CONFIG register */
>  typedef enum SysConfigFormat {
> @@ -241,6 +242,9 @@ static void armsse_init(Object *obj)
>      assert(info->sram_banks <= MAX_SRAM_BANKS);
>      assert(info->num_cpus <= SSE_MAX_CPUS);
>  
> +    s->mainclk = qdev_init_clock_in(DEVICE(s), "MAINCLK", NULL, NULL);
> +    s->s32kclk = qdev_init_clock_in(DEVICE(s), "S32KCLK", NULL, NULL);
> +
>      memory_region_init(&s->container, obj, "armsse-container", UINT64_MAX);
>  
>      for (i = 0; i < info->num_cpus; i++) {
> @@ -711,6 +715,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>       * map its upstream ends to the right place in the container.
>       */
>      qdev_prop_set_uint32(DEVICE(&s->timer0), "pclk-frq", s->mainclk_frq);
> +    qdev_connect_clock_in(DEVICE(&s->timer0), "pclk", s->mainclk);
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer0), errp)) {
>          return;
>      }
> @@ -721,6 +726,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>                               &error_abort);
>  
>      qdev_prop_set_uint32(DEVICE(&s->timer1), "pclk-frq", s->mainclk_frq);
> +    qdev_connect_clock_in(DEVICE(&s->timer1), "pclk", s->mainclk);
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer1), errp)) {
>          return;
>      }
> @@ -731,6 +737,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>                               &error_abort);
>  
>      qdev_prop_set_uint32(DEVICE(&s->dualtimer), "pclk-frq", s->mainclk_frq);
> +    qdev_connect_clock_in(DEVICE(&s->dualtimer), "TIMCLK", s->mainclk);
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->dualtimer), errp)) {
>          return;
>      }
> @@ -889,6 +896,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>       *   0x4002f000: S32K timer
>       */
>      qdev_prop_set_uint32(DEVICE(&s->s32ktimer), "pclk-frq", S32KCLK);
> +    qdev_connect_clock_in(DEVICE(&s->s32ktimer), "pclk", s->s32kclk);
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->s32ktimer), errp)) {
>          return;
>      }
> @@ -982,6 +990,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>                            qdev_get_gpio_in_named(DEVICE(&s->armv7m), "NMI", 0));
>  
>      qdev_prop_set_uint32(DEVICE(&s->s32kwatchdog), "wdogclk-frq", S32KCLK);
> +    qdev_connect_clock_in(DEVICE(&s->s32kwatchdog), "WDOGCLK", s->s32kclk);
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->s32kwatchdog), errp)) {
>          return;
>      }
> @@ -992,6 +1001,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>      /* 0x40080000 .. 0x4008ffff : ARMSSE second Base peripheral region */
>  
>      qdev_prop_set_uint32(DEVICE(&s->nswatchdog), "wdogclk-frq", s->mainclk_frq);
> +    qdev_connect_clock_in(DEVICE(&s->nswatchdog), "WDOGCLK", s->mainclk);
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->nswatchdog), errp)) {
>          return;
>      }
> @@ -1000,6 +1010,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->nswatchdog), 0, 0x40081000);
>  
>      qdev_prop_set_uint32(DEVICE(&s->swatchdog), "wdogclk-frq", s->mainclk_frq);
> +    qdev_connect_clock_in(DEVICE(&s->swatchdog), "WDOGCLK", s->mainclk);
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->swatchdog), errp)) {
>          return;
>      }
> @@ -1127,9 +1138,11 @@ static void armsse_idau_check(IDAUInterface *ii, uint32_t address,
>  
>  static const VMStateDescription armsse_vmstate = {
>      .name = "iotkit",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>      .fields = (VMStateField[]) {
> +        VMSTATE_CLOCK(mainclk, ARMSSE),
> +        VMSTATE_CLOCK(s32kclk, ARMSSE),
>          VMSTATE_UINT32(nsccfg, ARMSSE),
>          VMSTATE_END_OF_LIST()
>      }
> -- 
> 2.20.1
> 

-- 

