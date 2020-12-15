Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676782DA4B7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 01:29:06 +0100 (CET)
Received: from localhost ([::1]:38438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koyD6-0006Sq-Av
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 19:29:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1koy1P-0004XY-Hu
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 19:17:00 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:46966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1koy1K-0003WT-KO
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 19:16:55 -0500
Received: by mail-lf1-x143.google.com with SMTP id y19so34789244lfa.13
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 16:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KUClhekkUfnVtYs4hq8OfWJQ89NHr94pk2v0JJC2WQI=;
 b=S5vSUMoVND0ojHnpHbW6YxfgMYuv3Fi5x97oHwpR1ZHnlMZNz2q8yCZiOTr9yZoVpx
 DHDeKKGtEopp5E1I9EqvUbZRU+efsE+4aTg3/hgoGC+YgbknRRD/OqdKMVf17Z6p9gG3
 yzsEmKQqKJNW9VJrCkzsYe3oQmQmeyWU45L4+TS0KhlwxbpbShBcQ3azAgXO2o02lCVG
 OVnDokIvVhpYIzQ5EqbVKD6qFcZ/We62V/VcmvHuG2P2NkGjmWhkUo/7AidmAStR1FAy
 Sx3X9kOj3Vgu8vsr9hSzFlMdSUcmvJjdlACBubUq7yZsfoDadULJzBixiBHxyiXMoX8C
 EYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KUClhekkUfnVtYs4hq8OfWJQ89NHr94pk2v0JJC2WQI=;
 b=CEsHuOIXHHbW1lKLNRZNwOVH18WTJLBwpeJPopX+jT7c4j4xCBNb5Ykcy0n/UJO18S
 61AucyybQ35kbgI+2B3NQMpaifj0sHcCNqsrgIwmjt1rXT1E3vBDXshkkuuuPIa9Orqo
 DvVUu1f94n5PerOY7lmtRnsMBWlvID7UF3ouIxY51Bpl8/pNbgzUa7RWawuW9n4fYdf4
 T5u+fmsAko+UkrW1i7ODptCFb0lsocUOFiVseKQTdVNuAjjAGdDYcVlnKQ6jx7jhRDIP
 hAwlLy0O9uxI5xpPmchE3GObM71BZhPO/Hq430xmjL8T3Y9aHOpZ7HpG9LIExm2uCdll
 7/og==
X-Gm-Message-State: AOAM530zyW5JRr7y46lFMmT/gdarho/2kq32Al4iz3k/E852JVtw2hOo
 YwzIe+jD1Z1IBKOCgjtp1rZo2G0hzPL8w83lWynm2CFcCORKVQ==
X-Google-Smtp-Source: ABdhPJwrpkzigSSxKAorClYjq0HB/Uo93rCmSLuzZCOJLWtPSi1MQHsO8De3nCutBO7374fdh0JZucDfKhVgx+SItTM=
X-Received: by 2002:a2e:8745:: with SMTP id q5mr11016593ljj.77.1607991408970; 
 Mon, 14 Dec 2020 16:16:48 -0800 (PST)
MIME-Version: 1.0
References: <20201215001312.3120777-1-wuhaotsh@google.com>
 <20201215001312.3120777-3-wuhaotsh@google.com>
In-Reply-To: <20201215001312.3120777-3-wuhaotsh@google.com>
Date: Mon, 14 Dec 2020 16:16:36 -0800
Message-ID: <CAGcCb11nKdeqnjOZLQUCHM_uCop5kNwgkcWA5AJcOtWV1TC6dg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] hw/timer: Refactor NPCM7XX Timer to use CLK clock
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000bc309505b675ac34"
Received-SPF: pass client-ip=2a00:1450:4864:20::143;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x143.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Cc: minyard@acm.org, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-devel@nongnu.org>

--000000000000bc309505b675ac34
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 14, 2020 at 4:13 PM Hao Wu <wuhaotsh@google.com> wrote:

> This patch makes NPCM7XX Timer to use a the timer clock generated by the
> CLK module instead of the magic number TIMER_REF_HZ.
>
> Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/arm/npcm7xx.c                 |  5 +++++
>  hw/timer/npcm7xx_timer.c         | 23 +++++++++++++----------
>  include/hw/misc/npcm7xx_clk.h    |  6 ------
>  include/hw/timer/npcm7xx_timer.h |  1 +
>  4 files changed, 19 insertions(+), 16 deletions(-)
>
> diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
> index 47e2b6fc40..fabfb1697b 100644
> --- a/hw/arm/npcm7xx.c
> +++ b/hw/arm/npcm7xx.c
> @@ -22,6 +22,7 @@
>  #include "hw/char/serial.h"
>  #include "hw/loader.h"
>  #include "hw/misc/unimp.h"
> +#include "hw/qdev-clock.h"
>  #include "hw/qdev-properties.h"
>  #include "qapi/error.h"
>  #include "qemu/units.h"
> @@ -420,6 +421,10 @@ static void npcm7xx_realize(DeviceState *dev, Error
> **errp)
>          int first_irq;
>          int j;
>
> +        /* Connect the timer clock. */
> +        qdev_connect_clock_in(DEVICE(&s->tim[i]), "clock",
> qdev_get_clock_out(
> +                    DEVICE(&s->clk), "timer-clock"));
> +
>          sysbus_realize(sbd, &error_abort);
>          sysbus_mmio_map(sbd, 0, npcm7xx_tim_addr[i]);
>
> diff --git a/hw/timer/npcm7xx_timer.c b/hw/timer/npcm7xx_timer.c
> index d24445bd6e..8147b53000 100644
> --- a/hw/timer/npcm7xx_timer.c
> +++ b/hw/timer/npcm7xx_timer.c
> @@ -17,8 +17,8 @@
>  #include "qemu/osdep.h"
>
>  #include "hw/irq.h"
> +#include "hw/qdev-clock.h"
>  #include "hw/qdev-properties.h"
> -#include "hw/misc/npcm7xx_clk.h"
>  #include "hw/timer/npcm7xx_timer.h"
>  #include "migration/vmstate.h"
>  #include "qemu/bitops.h"
> @@ -130,7 +130,7 @@ static int64_t npcm7xx_timer_count_to_ns(NPCM7xxTimer
> *t, uint32_t count)
>  {
>      int64_t ns = count;
>
> -    ns *= NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ;
> +    ns *= clock_get_ns(t->ctrl->clock);
>      ns *= npcm7xx_tcsr_prescaler(t->tcsr);
>
>      return ns;
> @@ -141,7 +141,7 @@ static uint32_t npcm7xx_timer_ns_to_count(NPCM7xxTimer
> *t, int64_t ns)
>  {
>      int64_t count;
>
> -    count = ns / (NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ);
> +    count = ns / clock_get_ns(t->ctrl->clock);
>      count /= npcm7xx_tcsr_prescaler(t->tcsr);
>
>      return count;
> @@ -167,7 +167,7 @@ static void
> npcm7xx_watchdog_timer_reset_cycles(NPCM7xxWatchdogTimer *t,
>          int64_t cycles)
>  {
>      uint32_t prescaler = npcm7xx_watchdog_timer_prescaler(t);
> -    int64_t ns = (NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ) * cycles;
> +    int64_t ns = clock_get_ns(t->ctrl->clock) * cycles;
>
>      /*
>       * The reset function always clears the current timer. The caller of
> the
> @@ -606,10 +606,11 @@ static void npcm7xx_timer_hold_reset(Object *obj)
>      qemu_irq_lower(s->watchdog_timer.irq);
>  }
>
> -static void npcm7xx_timer_realize(DeviceState *dev, Error **errp)
> +static void npcm7xx_timer_init(Object *obj)
>  {
> -    NPCM7xxTimerCtrlState *s = NPCM7XX_TIMER(dev);
> +    NPCM7xxTimerCtrlState *s = NPCM7XX_TIMER(obj);
>      SysBusDevice *sbd = &s->parent;
> +    DeviceState *dev = DEVICE(obj);
>      int i;
>      NPCM7xxWatchdogTimer *w;
>
> @@ -627,11 +628,12 @@ static void npcm7xx_timer_realize(DeviceState *dev,
> Error **errp)
>              npcm7xx_watchdog_timer_expired, w);
>      sysbus_init_irq(sbd, &w->irq);
>
> -    memory_region_init_io(&s->iomem, OBJECT(s), &npcm7xx_timer_ops, s,
> +    memory_region_init_io(&s->iomem, obj, &npcm7xx_timer_ops, s,
>                            TYPE_NPCM7XX_TIMER, 4 * KiB);
>      sysbus_init_mmio(sbd, &s->iomem);
>      qdev_init_gpio_out_named(dev, &w->reset_signal,
>              NPCM7XX_WATCHDOG_RESET_GPIO_OUT, 1);
> +    s->clock = qdev_init_clock_in(dev, "clock", NULL, NULL);
>  }
>
>  static const VMStateDescription vmstate_npcm7xx_base_timer = {
> @@ -675,10 +677,11 @@ static const VMStateDescription
> vmstate_npcm7xx_watchdog_timer = {
>
>  static const VMStateDescription vmstate_npcm7xx_timer_ctrl = {
>      .name = "npcm7xx-timer-ctrl",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(tisr, NPCM7xxTimerCtrlState),
> +        VMSTATE_CLOCK(clock, NPCM7xxTimerCtrlState),
>          VMSTATE_STRUCT_ARRAY(timer, NPCM7xxTimerCtrlState,
>                               NPCM7XX_TIMERS_PER_CTRL, 0,
> vmstate_npcm7xx_timer,
>                               NPCM7xxTimer),
> @@ -697,7 +700,6 @@ static void npcm7xx_timer_class_init(ObjectClass
> *klass, void *data)
>      QEMU_BUILD_BUG_ON(NPCM7XX_TIMER_REGS_END > NPCM7XX_TIMER_NR_REGS);
>
>      dc->desc = "NPCM7xx Timer Controller";
> -    dc->realize = npcm7xx_timer_realize;
>      dc->vmsd = &vmstate_npcm7xx_timer_ctrl;
>      rc->phases.enter = npcm7xx_timer_enter_reset;
>      rc->phases.hold = npcm7xx_timer_hold_reset;
> @@ -708,6 +710,7 @@ static const TypeInfo npcm7xx_timer_info = {
>      .parent             = TYPE_SYS_BUS_DEVICE,
>      .instance_size      = sizeof(NPCM7xxTimerCtrlState),
>      .class_init         = npcm7xx_timer_class_init,
> +    .instance_init      = npcm7xx_timer_init,
>  };
>
>  static void npcm7xx_timer_register_type(void)
> diff --git a/include/hw/misc/npcm7xx_clk.h b/include/hw/misc/npcm7xx_clk.h
> index f641f95f3e..d5c8d16ca4 100644
> --- a/include/hw/misc/npcm7xx_clk.h
> +++ b/include/hw/misc/npcm7xx_clk.h
> @@ -20,12 +20,6 @@
>  #include "hw/clock.h"
>  #include "hw/sysbus.h"
>
> -/*
> - * The reference clock frequency for the timer modules, and the SECCNT and
> - * CNTR25M registers in this module, is always 25 MHz.
> - */
> -#define NPCM7XX_TIMER_REF_HZ            (25000000)
> -
>  /*
>   * Number of registers in our device state structure. Don't change this
> without
>   * incrementing the version_id in the vmstate.
> diff --git a/include/hw/timer/npcm7xx_timer.h
> b/include/hw/timer/npcm7xx_timer.h
> index 6993fd723a..d45c051b56 100644
> --- a/include/hw/timer/npcm7xx_timer.h
> +++ b/include/hw/timer/npcm7xx_timer.h
> @@ -101,6 +101,7 @@ struct NPCM7xxTimerCtrlState {
>
>      uint32_t    tisr;
>
> +    Clock       *clock;
>      NPCM7xxTimer timer[NPCM7XX_TIMERS_PER_CTRL];
>      NPCM7xxWatchdogTimer watchdog_timer;
>  };
> --
> 2.29.2.684.gfbc64c5ab5-goog
>
>

--000000000000bc309505b675ac34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Dec 14, 2020 at 4:13 PM Hao Wu &lt;<a href=3D"=
mailto:wuhaotsh@google.com">wuhaotsh@google.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">This patch makes NPCM7XX Tim=
er to use a the timer clock generated by the<br>
CLK module instead of the magic number TIMER_REF_HZ.<br>
<br>
Reviewed-by: Havard Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@google.com=
" target=3D"_blank">hskinnemoen@google.com</a>&gt;<br>
Reviewed-by: Tyrone Ting &lt;<a href=3D"mailto:kfting@nuvoton.com" target=
=3D"_blank">kfting@nuvoton.com</a>&gt;<br>
Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"=
_blank">wuhaotsh@google.com</a>&gt;<br>
---<br>
=C2=A0hw/arm/npcm7xx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 5 +++++<br>
=C2=A0hw/timer/npcm7xx_timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 23 ++++++=
+++++++----------<br>
=C2=A0include/hw/misc/npcm7xx_clk.h=C2=A0 =C2=A0 |=C2=A0 6 ------<br>
=C2=A0include/hw/timer/npcm7xx_timer.h |=C2=A0 1 +<br>
=C2=A04 files changed, 19 insertions(+), 16 deletions(-)<br>
<br>
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c<br>
index 47e2b6fc40..fabfb1697b 100644<br>
--- a/hw/arm/npcm7xx.c<br>
+++ b/hw/arm/npcm7xx.c<br>
@@ -22,6 +22,7 @@<br>
=C2=A0#include &quot;hw/char/serial.h&quot;<br>
=C2=A0#include &quot;hw/loader.h&quot;<br>
=C2=A0#include &quot;hw/misc/unimp.h&quot;<br>
+#include &quot;hw/qdev-clock.h&quot;<br>
=C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
@@ -420,6 +421,10 @@ static void npcm7xx_realize(DeviceState *dev, Error **=
errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int first_irq;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int j;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Connect the timer clock. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_connect_clock_in(DEVICE(&amp;s-&gt;tim[i]=
), &quot;clock&quot;, qdev_get_clock_out(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DEVI=
CE(&amp;s-&gt;clk), &quot;timer-clock&quot;));<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sysbus_realize(sbd, &amp;error_abort);<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sysbus_mmio_map(sbd, 0, npcm7xx_tim_addr[=
i]);<br>
<br>
diff --git a/hw/timer/npcm7xx_timer.c b/hw/timer/npcm7xx_timer.c<br>
index d24445bd6e..8147b53000 100644<br>
--- a/hw/timer/npcm7xx_timer.c<br>
+++ b/hw/timer/npcm7xx_timer.c<br>
@@ -17,8 +17,8 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
<br>
=C2=A0#include &quot;hw/irq.h&quot;<br>
+#include &quot;hw/qdev-clock.h&quot;<br>
=C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
-#include &quot;hw/misc/npcm7xx_clk.h&quot;<br>
=C2=A0#include &quot;hw/timer/npcm7xx_timer.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
=C2=A0#include &quot;qemu/bitops.h&quot;<br>
@@ -130,7 +130,7 @@ static int64_t npcm7xx_timer_count_to_ns(NPCM7xxTimer *=
t, uint32_t count)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int64_t ns =3D count;<br>
<br>
-=C2=A0 =C2=A0 ns *=3D NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ;<br>
+=C2=A0 =C2=A0 ns *=3D clock_get_ns(t-&gt;ctrl-&gt;clock);<br>
=C2=A0 =C2=A0 =C2=A0ns *=3D npcm7xx_tcsr_prescaler(t-&gt;tcsr);<br>
<br>
=C2=A0 =C2=A0 =C2=A0return ns;<br>
@@ -141,7 +141,7 @@ static uint32_t npcm7xx_timer_ns_to_count(NPCM7xxTimer =
*t, int64_t ns)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int64_t count;<br>
<br>
-=C2=A0 =C2=A0 count =3D ns / (NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_H=
Z);<br>
+=C2=A0 =C2=A0 count =3D ns / clock_get_ns(t-&gt;ctrl-&gt;clock);<br>
=C2=A0 =C2=A0 =C2=A0count /=3D npcm7xx_tcsr_prescaler(t-&gt;tcsr);<br>
<br>
=C2=A0 =C2=A0 =C2=A0return count;<br>
@@ -167,7 +167,7 @@ static void npcm7xx_watchdog_timer_reset_cycles(NPCM7xx=
WatchdogTimer *t,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int64_t cycles)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0uint32_t prescaler =3D npcm7xx_watchdog_timer_prescaler=
(t);<br>
-=C2=A0 =C2=A0 int64_t ns =3D (NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_H=
Z) * cycles;<br>
+=C2=A0 =C2=A0 int64_t ns =3D clock_get_ns(t-&gt;ctrl-&gt;clock) * cycles;<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * The reset function always clears the current timer. =
The caller of the<br>
@@ -606,10 +606,11 @@ static void npcm7xx_timer_hold_reset(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0qemu_irq_lower(s-&gt;watchdog_timer.irq);<br>
=C2=A0}<br>
<br>
-static void npcm7xx_timer_realize(DeviceState *dev, Error **errp)<br>
+static void npcm7xx_timer_init(Object *obj)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 NPCM7xxTimerCtrlState *s =3D NPCM7XX_TIMER(dev);<br>
+=C2=A0 =C2=A0 NPCM7xxTimerCtrlState *s =3D NPCM7XX_TIMER(obj);<br>
=C2=A0 =C2=A0 =C2=A0SysBusDevice *sbd =3D &amp;s-&gt;parent;<br>
+=C2=A0 =C2=A0 DeviceState *dev =3D DEVICE(obj);<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
=C2=A0 =C2=A0 =C2=A0NPCM7xxWatchdogTimer *w;<br>
<br>
@@ -627,11 +628,12 @@ static void npcm7xx_timer_realize(DeviceState *dev, E=
rror **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_watchdog_timer_expi=
red, w);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_init_irq(sbd, &amp;w-&gt;irq);<br>
<br>
-=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;iomem, OBJECT(s), &amp;npcm=
7xx_timer_ops, s,<br>
+=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;iomem, obj, &amp;npcm7xx_ti=
mer_ops, s,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0TYPE_NPCM7XX_TIMER, 4 * KiB);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_init_mmio(sbd, &amp;s-&gt;iomem);<br>
=C2=A0 =C2=A0 =C2=A0qdev_init_gpio_out_named(dev, &amp;w-&gt;reset_signal,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_WATCHDOG_RESET_GPIO=
_OUT, 1);<br>
+=C2=A0 =C2=A0 s-&gt;clock =3D qdev_init_clock_in(dev, &quot;clock&quot;, N=
ULL, NULL);<br>
=C2=A0}<br>
<br>
=C2=A0static const VMStateDescription vmstate_npcm7xx_base_timer =3D {<br>
@@ -675,10 +677,11 @@ static const VMStateDescription vmstate_npcm7xx_watch=
dog_timer =3D {<br>
<br>
=C2=A0static const VMStateDescription vmstate_npcm7xx_timer_ctrl =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name =3D &quot;npcm7xx-timer-ctrl&quot;,<br>
-=C2=A0 =C2=A0 .version_id =3D 1,<br>
-=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
+=C2=A0 =C2=A0 .version_id =3D 2,<br>
+=C2=A0 =C2=A0 .minimum_version_id =3D 2,<br>
=C2=A0 =C2=A0 =C2=A0.fields =3D (VMStateField[]) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT32(tisr, NPCM7xxTimerCtrlStat=
e),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_CLOCK(clock, NPCM7xxTimerCtrlState),<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_STRUCT_ARRAY(timer, NPCM7xxTimerC=
trlState,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_TIMERS_PER_CTRL, 0, vmstate_npcm7xx=
_timer,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7xxTimer),<br>
@@ -697,7 +700,6 @@ static void npcm7xx_timer_class_init(ObjectClass *klass=
, void *data)<br>
=C2=A0 =C2=A0 =C2=A0QEMU_BUILD_BUG_ON(NPCM7XX_TIMER_REGS_END &gt; NPCM7XX_T=
IMER_NR_REGS);<br>
<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;desc =3D &quot;NPCM7xx Timer Controller&quot;;<b=
r>
-=C2=A0 =C2=A0 dc-&gt;realize =3D npcm7xx_timer_realize;<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;vmsd =3D &amp;vmstate_npcm7xx_timer_ctrl;<br>
=C2=A0 =C2=A0 =C2=A0rc-&gt;phases.enter =3D npcm7xx_timer_enter_reset;<br>
=C2=A0 =C2=A0 =C2=A0rc-&gt;phases.hold =3D npcm7xx_timer_hold_reset;<br>
@@ -708,6 +710,7 @@ static const TypeInfo npcm7xx_timer_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D TYPE_SYS_BUS_DEVICE,<br>
=C2=A0 =C2=A0 =C2=A0.instance_size=C2=A0 =C2=A0 =C2=A0 =3D sizeof(NPCM7xxTi=
merCtrlState),<br>
=C2=A0 =C2=A0 =C2=A0.class_init=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D npcm7x=
x_timer_class_init,<br>
+=C2=A0 =C2=A0 .instance_init=C2=A0 =C2=A0 =C2=A0 =3D npcm7xx_timer_init,<b=
r>
=C2=A0};<br>
<br>
=C2=A0static void npcm7xx_timer_register_type(void)<br>
diff --git a/include/hw/misc/npcm7xx_clk.h b/include/hw/misc/npcm7xx_clk.h<=
br>
index f641f95f3e..d5c8d16ca4 100644<br>
--- a/include/hw/misc/npcm7xx_clk.h<br>
+++ b/include/hw/misc/npcm7xx_clk.h<br>
@@ -20,12 +20,6 @@<br>
=C2=A0#include &quot;hw/clock.h&quot;<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
<br>
-/*<br>
- * The reference clock frequency for the timer modules, and the SECCNT and=
<br>
- * CNTR25M registers in this module, is always 25 MHz.<br>
- */<br>
-#define NPCM7XX_TIMER_REF_HZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (250=
00000)<br>
-<br>
=C2=A0/*<br>
=C2=A0 * Number of registers in our device state structure. Don&#39;t chang=
e this without<br>
=C2=A0 * incrementing the version_id in the vmstate.<br>
diff --git a/include/hw/timer/npcm7xx_timer.h b/include/hw/timer/npcm7xx_ti=
mer.h<br>
index 6993fd723a..d45c051b56 100644<br>
--- a/include/hw/timer/npcm7xx_timer.h<br>
+++ b/include/hw/timer/npcm7xx_timer.h<br>
@@ -101,6 +101,7 @@ struct NPCM7xxTimerCtrlState {<br>
<br>
=C2=A0 =C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0 tisr;<br>
<br>
+=C2=A0 =C2=A0 Clock=C2=A0 =C2=A0 =C2=A0 =C2=A0*clock;<br>
=C2=A0 =C2=A0 =C2=A0NPCM7xxTimer timer[NPCM7XX_TIMERS_PER_CTRL];<br>
=C2=A0 =C2=A0 =C2=A0NPCM7xxWatchdogTimer watchdog_timer;<br>
=C2=A0};<br>
-- <br>
2.29.2.684.gfbc64c5ab5-goog<br>
<br>
</blockquote></div>

--000000000000bc309505b675ac34--

