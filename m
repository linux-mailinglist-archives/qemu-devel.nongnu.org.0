Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52653300DC2
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:32:32 +0100 (CET)
Received: from localhost ([::1]:56528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l336d-0006cj-39
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l334P-0005ZD-4M; Fri, 22 Jan 2021 15:30:13 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:55240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l334N-0004Jn-5B; Fri, 22 Jan 2021 15:30:12 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 2CED5C602E6;
 Fri, 22 Jan 2021 21:30:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1611347408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IBJCMswZP72Qvpkt33ZfcEZ1JJdqFZlP9yhSaRGcdf4=;
 b=IyfkNHo5QGq3OOuh54bKt3NBCOcUJ4h83FG/TKZbpckzYmuK9rWEXhNxuhqD1H1bwDYLDu
 ig4h3OQw8zTnq3LWUWSoUC5XyvxehlT7H1LngwX1zncXDlgQBwmVlOrmZ3riPNBbXZj6k0
 hkbzdHujq3uj+xjfluChjUAoDk/gOUJdIhEC5ars2Acr41n7JSFd9FexLpTWCg0J3ajwzj
 FENwJpEyv2BH+usDwpQSMxJAuFviE//0Ji7V/SkPOOy38UUN4wsE/daF+x1x1J6IvEsqQm
 Ww9KESHnGxuU2qUXUm0UXeRVXRmpYWBlt+XmzKvhN/YSScnNlHp93LHRtjqJJg==
Date: Fri, 22 Jan 2021 21:30:29 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 17/25] hw/arm/stellaris: Create Clock input for watchdog
Message-ID: <20210122203029.kw74t4lfsbcpufyi@sekoia-pc.home.lmichel.fr>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-18-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121190622.22000-18-peter.maydell@linaro.org>
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
> Create and connect the Clock input for the watchdog device on the
> Stellaris boards.  Because the Stellaris boards model the ability to
> change the clock rate by programming PLL registers, we have to create
> an output Clock on the ssys_state device and wire it up to the
> watchdog.
> 
> Note that the old comment on ssys_calculate_system_clock() got the
> units wrong -- system_clock_scale is in nanoseconds, not
> milliseconds.  Improve the commentary to clarify how we are
> calculating the period.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  hw/arm/stellaris.c | 43 +++++++++++++++++++++++++++++++------------
>  1 file changed, 31 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index 0194ede2fe0..9b67c739ef2 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -26,6 +26,7 @@
>  #include "hw/watchdog/cmsdk-apb-watchdog.h"
>  #include "migration/vmstate.h"
>  #include "hw/misc/unimp.h"
> +#include "hw/qdev-clock.h"
>  #include "cpu.h"
>  #include "qom/object.h"
>  
> @@ -377,6 +378,7 @@ struct ssys_state {
>      uint32_t clkvclr;
>      uint32_t ldoarst;
>      qemu_irq irq;
> +    Clock *sysclk;
>      /* Properties (all read-only registers) */
>      uint32_t user0;
>      uint32_t user1;
> @@ -555,15 +557,26 @@ static bool ssys_use_rcc2(ssys_state *s)
>  }
>  
>  /*
> - * Caculate the sys. clock period in ms.
> + * Calculate the system clock period. We only want to propagate
> + * this change to the rest of the system if we're not being called
> + * from migration post-load.
>   */
> -static void ssys_calculate_system_clock(ssys_state *s)
> +static void ssys_calculate_system_clock(ssys_state *s, bool propagate_clock)
>  {
> +    /*
> +     * SYSDIV field specifies divisor: 0 == /1, 1 == /2, etc.  Input
> +     * clock is 200MHz, which is a period of 5 ns. Dividing the clock
> +     * frequency by X is the same as multiplying the period by X.
> +     */
>      if (ssys_use_rcc2(s)) {
>          system_clock_scale = 5 * (((s->rcc2 >> 23) & 0x3f) + 1);
>      } else {
>          system_clock_scale = 5 * (((s->rcc >> 23) & 0xf) + 1);
>      }
> +    clock_set_ns(s->sysclk, system_clock_scale);
> +    if (propagate_clock) {
> +        clock_propagate(s->sysclk);
> +    }
>  }
>  
>  static void ssys_write(void *opaque, hwaddr offset,
> @@ -598,7 +611,7 @@ static void ssys_write(void *opaque, hwaddr offset,
>              s->int_status |= (1 << 6);
>          }
>          s->rcc = value;
> -        ssys_calculate_system_clock(s);
> +        ssys_calculate_system_clock(s, true);
>          break;
>      case 0x070: /* RCC2 */
>          if (ssys_board_class(s) == DID0_CLASS_SANDSTORM) {
> @@ -610,7 +623,7 @@ static void ssys_write(void *opaque, hwaddr offset,
>              s->int_status |= (1 << 6);
>          }
>          s->rcc2 = value;
> -        ssys_calculate_system_clock(s);
> +        ssys_calculate_system_clock(s, true);
>          break;
>      case 0x100: /* RCGC0 */
>          s->rcgc[0] = value;
> @@ -679,7 +692,8 @@ static void stellaris_sys_reset_hold(Object *obj)
>  {
>      ssys_state *s = STELLARIS_SYS(obj);
>  
> -    ssys_calculate_system_clock(s);
> +    /* OK to propagate clocks from the hold phase */
> +    ssys_calculate_system_clock(s, true);
>  }
>  
>  static void stellaris_sys_reset_exit(Object *obj)
> @@ -690,7 +704,7 @@ static int stellaris_sys_post_load(void *opaque, int version_id)
>  {
>      ssys_state *s = opaque;
>  
> -    ssys_calculate_system_clock(s);
> +    ssys_calculate_system_clock(s, false);
>  
>      return 0;
>  }
> @@ -713,6 +727,7 @@ static const VMStateDescription vmstate_stellaris_sys = {
>          VMSTATE_UINT32_ARRAY(dcgc, ssys_state, 3),
>          VMSTATE_UINT32(clkvclr, ssys_state),
>          VMSTATE_UINT32(ldoarst, ssys_state),
> +        /* No field for sysclk -- handled in post-load instead */
>          VMSTATE_END_OF_LIST()
>      }
>  };
> @@ -738,11 +753,12 @@ static void stellaris_sys_instance_init(Object *obj)
>      memory_region_init_io(&s->iomem, obj, &ssys_ops, s, "ssys", 0x00001000);
>      sysbus_init_mmio(sbd, &s->iomem);
>      sysbus_init_irq(sbd, &s->irq);
> +    s->sysclk = qdev_init_clock_out(DEVICE(s), "SYSCLK");
>  }
>  
> -static int stellaris_sys_init(uint32_t base, qemu_irq irq,
> -                              stellaris_board_info * board,
> -                              uint8_t *macaddr)
> +static DeviceState *stellaris_sys_init(uint32_t base, qemu_irq irq,
> +                                       stellaris_board_info *board,
> +                                       uint8_t *macaddr)
>  {
>      DeviceState *dev = qdev_new(TYPE_STELLARIS_SYS);
>      SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> @@ -774,7 +790,7 @@ static int stellaris_sys_init(uint32_t base, qemu_irq irq,
>       */
>      device_cold_reset(dev);
>  
> -    return 0;
> +    return dev;
>  }
>  
>  /* I2C controller.  */
> @@ -1341,6 +1357,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
>      int flash_size;
>      I2CBus *i2c;
>      DeviceState *dev;
> +    DeviceState *ssys_dev;
>      int i;
>      int j;
>  
> @@ -1391,8 +1408,8 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
>          }
>      }
>  
> -    stellaris_sys_init(0x400fe000, qdev_get_gpio_in(nvic, 28),
> -                       board, nd_table[0].macaddr.a);
> +    ssys_dev = stellaris_sys_init(0x400fe000, qdev_get_gpio_in(nvic, 28),
> +                                  board, nd_table[0].macaddr.a);
>  
>  
>      if (board->dc1 & (1 << 3)) { /* watchdog present */
> @@ -1401,6 +1418,8 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
>          /* system_clock_scale is valid now */
>          uint32_t mainclk = NANOSECONDS_PER_SECOND / system_clock_scale;
>          qdev_prop_set_uint32(dev, "wdogclk-frq", mainclk);
> +        qdev_connect_clock_in(dev, "WDOGCLK",
> +                              qdev_get_clock_out(ssys_dev, "SYSCLK"));
>  
>          sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>          sysbus_mmio_map(SYS_BUS_DEVICE(dev),
> -- 
> 2.20.1
> 

-- 

