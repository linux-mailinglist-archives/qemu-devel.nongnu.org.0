Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83953187FC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:22:31 +0100 (CET)
Received: from localhost ([::1]:53616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA97G-0001k1-O6
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:22:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1lA8zK-0003X6-9U; Thu, 11 Feb 2021 05:14:18 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:34914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1lA8zD-0006Nm-I6; Thu, 11 Feb 2021 05:14:18 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 17332C602E6;
 Thu, 11 Feb 2021 11:14:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1613038449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uxg45noXRPN+cEEYKs9WSthMU4cxacN3QdjcMZCQMkQ=;
 b=dR8osuyl+JGAl0SazVkQVnc/TO9OL7oHNUZN8zPZHCIYgLiqF1SoD6cfiLK2kX4FLfftDF
 Q/UKmIH/q8Zri6ER3+FwTU4tNb8I5KgjkQR4UOJWF/xHqd5MVljdr0+m/8Dh/u+npGjpTL
 iMha/tpomovcXAOr0ijVjDSyzFJ9OAI3LyA7QUOATZ3gIReR5zGDc9U7+p11D2Ru+nwvO6
 ybjMSJDoJlXOx4TQEppviMeDy+Oat68HskWrbs1h1MhGM608pCMVIXdXom4YCHf/OtN4DV
 C54gybs+pwBprM0cee9DwScaadDVG7QIeUo4LJ8yIfj1UH4vhF2y6m8F0SEXYg==
Date: Thu, 11 Feb 2021 11:14:40 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 1/4] clock: Add ClockEvent parameter to callbacks
Message-ID: <20210211101440.hwyt7ke3cmnc3o23@sekoia-pc.home.lmichel.fr>
References: <20210209132040.5091-1-peter.maydell@linaro.org>
 <20210209132040.5091-2-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209132040.5091-2-peter.maydell@linaro.org>
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
Cc: Havard Skinnemoen <hskinnemoen@google.com>, qemu-devel@nongnu.org,
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13:20 Tue 09 Feb     , Peter Maydell wrote:
> The Clock framework allows users to specify a callback which is
> called after the clock's period has been updated.  Some users need to
> also have a callback which is called before the clock period is
> updated.
> 
> As the first step in adding support for notifying Clock users on
> pre-update events, add an argument to the ClockCallback to specify
> what event is being notified, and add an argument to the various
> functions for registering a callback to specify which events are
> of interest to that callback.
> 
> Note that the documentation update renders correct the previously
> incorrect claim in 'Adding a new clock' that callbacks "will be
> explained in a following section".
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

With Hao's comment addressed:

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
> v1->v2: (suggested by Luc) instead of making callback functions check
> whether 'event' is one they are interested in, specify mask of
> interesting events at callback registration time.
> ---
>  docs/devel/clocks.rst            | 52 +++++++++++++++++++++++++++-----
>  include/hw/clock.h               | 21 +++++++++++--
>  include/hw/qdev-clock.h          | 17 ++++++++---
>  hw/adc/npcm7xx_adc.c             |  2 +-
>  hw/arm/armsse.c                  |  9 +++---
>  hw/char/cadence_uart.c           |  4 +--
>  hw/char/ibex_uart.c              |  4 +--
>  hw/char/pl011.c                  |  5 +--
>  hw/core/clock.c                  | 20 +++++++++---
>  hw/core/qdev-clock.c             |  8 +++--
>  hw/mips/cps.c                    |  2 +-
>  hw/misc/bcm2835_cprman.c         | 23 ++++++++------
>  hw/misc/npcm7xx_clk.c            | 26 +++++++++++++---
>  hw/misc/npcm7xx_pwm.c            |  2 +-
>  hw/misc/zynq_slcr.c              |  5 +--
>  hw/timer/cmsdk-apb-dualtimer.c   |  5 +--
>  hw/timer/cmsdk-apb-timer.c       |  4 +--
>  hw/timer/npcm7xx_timer.c         |  2 +-
>  hw/watchdog/cmsdk-apb-watchdog.c |  5 +--
>  target/mips/cpu.c                |  2 +-
>  20 files changed, 160 insertions(+), 58 deletions(-)
> 
> diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
> index c54bbb82409..cd344e3fe5d 100644
> --- a/docs/devel/clocks.rst
> +++ b/docs/devel/clocks.rst
> @@ -80,11 +80,12 @@ Adding clocks to a device must be done during the init method of the Device
>  instance.
>  
>  To add an input clock to a device, the function ``qdev_init_clock_in()``
> -must be used.  It takes the name, a callback and an opaque parameter
> -for the callback (this will be explained in a following section).
> +must be used.  It takes the name, a callback, an opaque parameter
> +for the callback and a mask of events when the callback should be
> +called (this will be explained in a following section).
>  Output is simpler; only the name is required. Typically::
>  
> -    qdev_init_clock_in(DEVICE(dev), "clk_in", clk_in_callback, dev);
> +    qdev_init_clock_in(DEVICE(dev), "clk_in", clk_in_callback, dev, ClockUpdate);
>      qdev_init_clock_out(DEVICE(dev), "clk_out");
>  
>  Both functions return the created Clock pointer, which should be saved in the
> @@ -113,7 +114,7 @@ output.
>       * callback for the input clock (see "Callback on input clock
>       * change" section below for more information).
>       */
> -    static void clk_in_callback(void *opaque);
> +    static void clk_in_callback(void *opaque, ClockEvent event);
>  
>      /*
>       * static array describing clocks:
> @@ -124,7 +125,7 @@ output.
>       *   the clk_out field of a MyDeviceState structure.
>       */
>      static const ClockPortInitArray mydev_clocks = {
> -        QDEV_CLOCK_IN(MyDeviceState, clk_in, clk_in_callback),
> +        QDEV_CLOCK_IN(MyDeviceState, clk_in, clk_in_callback, ClockUpdate),
>          QDEV_CLOCK_OUT(MyDeviceState, clk_out),
>          QDEV_CLOCK_END
>      };
> @@ -153,6 +154,40 @@ nothing else to do. This value will be propagated to other clocks when
>  connecting the clocks together and devices will fetch the right value during
>  the first reset.
>  
> +Clock callbacks
> +---------------
> +
> +You can give a clock a callback function in several ways:
> +
> + * by passing it as an argument to ``qdev_init_clock_in()``
> + * as an argument to the ``QDEV_CLOCK_IN()`` macro initializing an
> +   array to be passed to ``qdev_init_clocks()``
> + * by directly calling the ``clock_set_callback()`` function
> +
> +The callback function must be of this type:
> +
> +.. code-block:: c
> +
> +   typedef void ClockCallback(void *opaque, ClockEvent event);
> +
> +The ``opaque`` argument is the pointer passed to ``qdev_init_clock_in()``
> +or ``clock_set_callback()``; for ``qdev_init_clocks()`` it is the
> +``dev`` device pointer.
> +
> +The ``event`` argument specifies why the callback has been called.
> +When you register the callback you specify a mask of ClockEvent values
> +that you are interested in. The callback will only be called for those
> +events.
> +
> +The events currently supported are:
> +
> + * ``ClockUpdate`` : called after the input clock's period has changed
> +
> +Note that a clock only has one callback: it is not possible to register
> +different functions for different events. You must register a single
> +callback which listens for all of the events you are interested in,
> +and use the ``event`` argument to identify which event has happened.
> +
>  Retrieving clocks from a device
>  -------------------------------
>  
> @@ -231,7 +266,7 @@ object during device instance init. For example:
>  .. code-block:: c
>  
>      clk = qdev_init_clock_in(DEVICE(dev), "clk-in", clk_in_callback,
> -                             dev);
> +                             dev, ClockUpdate);
>      /* set initial value to 10ns / 100MHz */
>      clock_set_ns(clk, 10);
>  
> @@ -267,11 +302,12 @@ next lowest integer. This implies some inaccuracy due to the rounding,
>  so be cautious about using it in calculations.
>  
>  It is also possible to register a callback on clock frequency changes.
> -Here is an example:
> +Here is an example, which assumes that ``clock_callback`` has been
> +specified as the callback for the ``ClockUpdate`` event:
>  
>  .. code-block:: c
>  
> -    void clock_callback(void *opaque) {
> +    void clock_callback(void *opaque, ClockEvent event) {
>          MyDeviceState *s = (MyDeviceState *) opaque;
>          /*
>           * 'opaque' is the argument passed to qdev_init_clock_in();
> diff --git a/include/hw/clock.h b/include/hw/clock.h
> index e5f45e2626d..5c73b4e7ae9 100644
> --- a/include/hw/clock.h
> +++ b/include/hw/clock.h
> @@ -22,7 +22,17 @@
>  #define TYPE_CLOCK "clock"
>  OBJECT_DECLARE_SIMPLE_TYPE(Clock, CLOCK)
>  
> -typedef void ClockCallback(void *opaque);
> +/*
> + * Argument to ClockCallback functions indicating why the callback
> + * has been called. A mask of these values logically ORed together
> + * is used to specify which events are interesting when the callback
> + * is registered, so these values must all be different bit values.
> + */
> +typedef enum ClockEvent {
> +    ClockUpdate = 1, /* Clock period has just updated */
> +} ClockEvent;
> +
> +typedef void ClockCallback(void *opaque, ClockEvent event);
>  
>  /*
>   * clock store a value representing the clock's period in 2^-32ns unit.
> @@ -50,6 +60,7 @@ typedef void ClockCallback(void *opaque);
>   * @canonical_path: clock path string cache (used for trace purpose)
>   * @callback: called when clock changes
>   * @callback_opaque: argument for @callback
> + * @callback_events: mask of events when callback should be called
>   * @source: source (or parent in clock tree) of the clock
>   * @children: list of clocks connected to this one (it is their source)
>   * @sibling: structure used to form a clock list
> @@ -67,6 +78,7 @@ struct Clock {
>      char *canonical_path;
>      ClockCallback *callback;
>      void *callback_opaque;
> +    int callback_events;
>  
>      /* Clocks are organized in a clock tree */
>      Clock *source;
> @@ -114,10 +126,15 @@ Clock *clock_new(Object *parent, const char *name);
>   * @clk: the clock to register the callback into
>   * @cb: the callback function
>   * @opaque: the argument to the callback
> + * @events: the events the callback should be called for
> + *          (logical OR of ClockEvent enum values)
>   *
>   * Register a callback called on every clock update.
> + * Note that a clock has only one callback: you cannot register
> + * different callback functions for different events.
>   */
> -void clock_set_callback(Clock *clk, ClockCallback *cb, void *opaque);
> +void clock_set_callback(Clock *clk, ClockCallback *cb,
> +                        void *opaque, int events);
>  
>  /**
>   * clock_clear_callback:
> diff --git a/include/hw/qdev-clock.h b/include/hw/qdev-clock.h
> index 64ca4d266f2..348ec363525 100644
> --- a/include/hw/qdev-clock.h
> +++ b/include/hw/qdev-clock.h
> @@ -22,6 +22,8 @@
>   * @name: the name of the clock (can't be NULL).
>   * @callback: optional callback to be called on update or NULL.
>   * @opaque: argument for the callback
> + * @events: the events the callback should be called for
> + *          (logical OR of ClockEvent enum values)
>   * @returns: a pointer to the newly added clock
>   *
>   * Add an input clock to device @dev as a clock named @name.
> @@ -29,7 +31,8 @@
>   * The callback will be called with @opaque as opaque parameter.
>   */
>  Clock *qdev_init_clock_in(DeviceState *dev, const char *name,
> -                          ClockCallback *callback, void *opaque);
> +                          ClockCallback *callback, void *opaque,
> +                          int events);
>  
>  /**
>   * qdev_init_clock_out:
> @@ -105,6 +108,7 @@ void qdev_finalize_clocklist(DeviceState *dev);
>   * @output: indicates whether the clock is input or output
>   * @callback: for inputs, optional callback to be called on clock's update
>   * with device as opaque
> + * @callback_events: mask of ClockEvent values for when callback is called
>   * @offset: optional offset to store the ClockIn or ClockOut pointer in device
>   * state structure (0 means unused)
>   */
> @@ -112,6 +116,7 @@ struct ClockPortInitElem {
>      const char *name;
>      bool is_output;
>      ClockCallback *callback;
> +    int callback_events;
>      size_t offset;
>  };
>  
> @@ -119,10 +124,11 @@ struct ClockPortInitElem {
>      (offsetof(devstate, field) + \
>       type_check(Clock *, typeof_field(devstate, field)))
>  
> -#define QDEV_CLOCK(out_not_in, devstate, field, cb) { \
> +#define QDEV_CLOCK(out_not_in, devstate, field, cb, cbevents) {  \
>      .name = (stringify(field)), \
>      .is_output = out_not_in, \
>      .callback = cb, \
> +    .callback_events = cbevents, \
>      .offset = clock_offset_value(devstate, field), \
>  }
>  
> @@ -133,14 +139,15 @@ struct ClockPortInitElem {
>   * @field: a field in @_devstate (must be Clock*)
>   * @callback: (for input only) callback (or NULL) to be called with the device
>   * state as argument
> + * @cbevents: (for input only) ClockEvent mask for when callback is called
>   *
>   * The name of the clock will be derived from @field
>   */
> -#define QDEV_CLOCK_IN(devstate, field, callback) \
> -    QDEV_CLOCK(false, devstate, field, callback)
> +#define QDEV_CLOCK_IN(devstate, field, callback, cbevents)       \
> +    QDEV_CLOCK(false, devstate, field, callback, cbevents)
>  
>  #define QDEV_CLOCK_OUT(devstate, field) \
> -    QDEV_CLOCK(true, devstate, field, NULL)
> +    QDEV_CLOCK(true, devstate, field, NULL, 0)
>  
>  #define QDEV_CLOCK_END { .name = NULL }
>  
> diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c
> index 870a6d50c27..573f4876dc6 100644
> --- a/hw/adc/npcm7xx_adc.c
> +++ b/hw/adc/npcm7xx_adc.c
> @@ -238,7 +238,7 @@ static void npcm7xx_adc_init(Object *obj)
>      memory_region_init_io(&s->iomem, obj, &npcm7xx_adc_ops, s,
>                            TYPE_NPCM7XX_ADC, 4 * KiB);
>      sysbus_init_mmio(sbd, &s->iomem);
> -    s->clock = qdev_init_clock_in(DEVICE(s), "clock", NULL, NULL);
> +    s->clock = qdev_init_clock_in(DEVICE(s), "clock", NULL, NULL, ClockUpdate);
>  
>      for (i = 0; i < NPCM7XX_ADC_NUM_INPUTS; ++i) {
>          object_property_add_uint32_ptr(obj, "adci[*]",
> diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
> index 26e1a8c95b6..fa155b72022 100644
> --- a/hw/arm/armsse.c
> +++ b/hw/arm/armsse.c
> @@ -230,9 +230,10 @@ static void armsse_forward_sec_resp_cfg(ARMSSE *s)
>      qdev_connect_gpio_out(dev_splitter, 2, s->sec_resp_cfg_in);
>  }
>  
> -static void armsse_mainclk_update(void *opaque)
> +static void armsse_mainclk_update(void *opaque, ClockEvent event)
>  {
>      ARMSSE *s = ARM_SSE(opaque);
> +
>      /*
>       * Set system_clock_scale from our Clock input; this is what
>       * controls the tick rate of the CPU SysTick timer.
> @@ -251,8 +252,8 @@ static void armsse_init(Object *obj)
>      assert(info->num_cpus <= SSE_MAX_CPUS);
>  
>      s->mainclk = qdev_init_clock_in(DEVICE(s), "MAINCLK",
> -                                    armsse_mainclk_update, s);
> -    s->s32kclk = qdev_init_clock_in(DEVICE(s), "S32KCLK", NULL, NULL);
> +                                    armsse_mainclk_update, s, ClockUpdate);
> +    s->s32kclk = qdev_init_clock_in(DEVICE(s), "S32KCLK", NULL, NULL, 0);
>  
>      memory_region_init(&s->container, obj, "armsse-container", UINT64_MAX);
>  
> @@ -1120,7 +1121,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>      sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->container);
>  
>      /* Set initial system_clock_scale from MAINCLK */
> -    armsse_mainclk_update(s);
> +    armsse_mainclk_update(s, ClockUpdate);
>  }
>  
>  static void armsse_idau_check(IDAUInterface *ii, uint32_t address,
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index c603e14012a..ceb677bc5a8 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -519,7 +519,7 @@ static void cadence_uart_realize(DeviceState *dev, Error **errp)
>                               uart_event, NULL, s, NULL, true);
>  }
>  
> -static void cadence_uart_refclk_update(void *opaque)
> +static void cadence_uart_refclk_update(void *opaque, ClockEvent event)
>  {
>      CadenceUARTState *s = opaque;
>  
> @@ -537,7 +537,7 @@ static void cadence_uart_init(Object *obj)
>      sysbus_init_irq(sbd, &s->irq);
>  
>      s->refclk = qdev_init_clock_in(DEVICE(obj), "refclk",
> -            cadence_uart_refclk_update, s);
> +                                   cadence_uart_refclk_update, s, ClockUpdate);
>      /* initialize the frequency in case the clock remains unconnected */
>      clock_set_hz(s->refclk, UART_DEFAULT_REF_CLK);
>  
> diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
> index 89f1182c9bf..edcaa30aded 100644
> --- a/hw/char/ibex_uart.c
> +++ b/hw/char/ibex_uart.c
> @@ -396,7 +396,7 @@ static void ibex_uart_write(void *opaque, hwaddr addr,
>      }
>  }
>  
> -static void ibex_uart_clk_update(void *opaque)
> +static void ibex_uart_clk_update(void *opaque, ClockEvent event)
>  {
>      IbexUartState *s = opaque;
>  
> @@ -466,7 +466,7 @@ static void ibex_uart_init(Object *obj)
>      IbexUartState *s = IBEX_UART(obj);
>  
>      s->f_clk = qdev_init_clock_in(DEVICE(obj), "f_clock",
> -                                  ibex_uart_clk_update, s);
> +                                  ibex_uart_clk_update, s, ClockUpdate);
>      clock_set_hz(s->f_clk, IBEX_UART_CLOCK);
>  
>      sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->tx_watermark);
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index ea4a4e52356..c5621a195ff 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -309,7 +309,7 @@ static void pl011_event(void *opaque, QEMUChrEvent event)
>          pl011_put_fifo(opaque, 0x400);
>  }
>  
> -static void pl011_clock_update(void *opaque)
> +static void pl011_clock_update(void *opaque, ClockEvent event)
>  {
>      PL011State *s = PL011(opaque);
>  
> @@ -378,7 +378,8 @@ static void pl011_init(Object *obj)
>          sysbus_init_irq(sbd, &s->irq[i]);
>      }
>  
> -    s->clk = qdev_init_clock_in(DEVICE(obj), "clk", pl011_clock_update, s);
> +    s->clk = qdev_init_clock_in(DEVICE(obj), "clk", pl011_clock_update, s,
> +                                ClockUpdate);
>  
>      s->read_trigger = 1;
>      s->ifl = 0x12;
> diff --git a/hw/core/clock.c b/hw/core/clock.c
> index 76b5f468b6e..71dc1f4de65 100644
> --- a/hw/core/clock.c
> +++ b/hw/core/clock.c
> @@ -39,15 +39,16 @@ Clock *clock_new(Object *parent, const char *name)
>      return clk;
>  }
>  
> -void clock_set_callback(Clock *clk, ClockCallback *cb, void *opaque)
> +void clock_set_callback(Clock *clk, ClockCallback *cb, void *opaque, int events)
>  {
>      clk->callback = cb;
>      clk->callback_opaque = opaque;
> +    clk->callback_events = events;
>  }
>  
>  void clock_clear_callback(Clock *clk)
>  {
> -    clock_set_callback(clk, NULL, NULL);
> +    clock_set_callback(clk, NULL, NULL, 0);
>  }
>  
>  bool clock_set(Clock *clk, uint64_t period)
> @@ -62,6 +63,17 @@ bool clock_set(Clock *clk, uint64_t period)
>      return true;
>  }
>  
> +static void clock_call_callback(Clock *clk, ClockEvent event)
> +{
> +    /*
> +     * Call the Clock's callback for this event, if it has one and
> +     * is interested in this event.
> +     */
> +    if (clk->callback && (clk->callback_events & event)) {
> +        clk->callback(clk->callback_opaque, event);
> +    }
> +}
> +
>  static void clock_propagate_period(Clock *clk, bool call_callbacks)
>  {
>      Clock *child;
> @@ -72,8 +84,8 @@ static void clock_propagate_period(Clock *clk, bool call_callbacks)
>              trace_clock_update(CLOCK_PATH(child), CLOCK_PATH(clk),
>                                 CLOCK_PERIOD_TO_HZ(clk->period),
>                                 call_callbacks);
> -            if (call_callbacks && child->callback) {
> -                child->callback(child->callback_opaque);
> +            if (call_callbacks) {
> +                clock_call_callback(child, ClockUpdate);
>              }
>              clock_propagate_period(child, call_callbacks);
>          }
> diff --git a/hw/core/qdev-clock.c b/hw/core/qdev-clock.c
> index eb05f2a13ca..9c55ddc23ee 100644
> --- a/hw/core/qdev-clock.c
> +++ b/hw/core/qdev-clock.c
> @@ -111,7 +111,8 @@ Clock *qdev_init_clock_out(DeviceState *dev, const char *name)
>  }
>  
>  Clock *qdev_init_clock_in(DeviceState *dev, const char *name,
> -                            ClockCallback *callback, void *opaque)
> +                          ClockCallback *callback, void *opaque,
> +                          int events)
>  {
>      NamedClockList *ncl;
>  
> @@ -120,7 +121,7 @@ Clock *qdev_init_clock_in(DeviceState *dev, const char *name,
>      ncl = qdev_init_clocklist(dev, name, false, NULL);
>  
>      if (callback) {
> -        clock_set_callback(ncl->clock, callback, opaque);
> +        clock_set_callback(ncl->clock, callback, opaque, events);
>      }
>      return ncl->clock;
>  }
> @@ -137,7 +138,8 @@ void qdev_init_clocks(DeviceState *dev, const ClockPortInitArray clocks)
>          if (elem->is_output) {
>              *clkp = qdev_init_clock_out(dev, elem->name);
>          } else {
> -            *clkp = qdev_init_clock_in(dev, elem->name, elem->callback, dev);
> +            *clkp = qdev_init_clock_in(dev, elem->name, elem->callback, dev,
> +                                       elem->callback_events);
>          }
>      }
>  }
> diff --git a/hw/mips/cps.c b/hw/mips/cps.c
> index 7a0d289efaf..2b436700ce6 100644
> --- a/hw/mips/cps.c
> +++ b/hw/mips/cps.c
> @@ -39,7 +39,7 @@ static void mips_cps_init(Object *obj)
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>      MIPSCPSState *s = MIPS_CPS(obj);
>  
> -    s->clock = qdev_init_clock_in(DEVICE(obj), "clk-in", NULL, NULL);
> +    s->clock = qdev_init_clock_in(DEVICE(obj), "clk-in", NULL, NULL, 0);
>      /*
>       * Cover entire address space as there do not seem to be any
>       * constraints for the base address of CPC and GIC.
> diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
> index 7e415a017c9..75e6c574d46 100644
> --- a/hw/misc/bcm2835_cprman.c
> +++ b/hw/misc/bcm2835_cprman.c
> @@ -107,7 +107,7 @@ static void pll_update(CprmanPllState *pll)
>      clock_update_hz(pll->out, freq);
>  }
>  
> -static void pll_xosc_update(void *opaque)
> +static void pll_xosc_update(void *opaque, ClockEvent event)
>  {
>      pll_update(CPRMAN_PLL(opaque));
>  }
> @@ -116,7 +116,8 @@ static void pll_init(Object *obj)
>  {
>      CprmanPllState *s = CPRMAN_PLL(obj);
>  
> -    s->xosc_in = qdev_init_clock_in(DEVICE(s), "xosc-in", pll_xosc_update, s);
> +    s->xosc_in = qdev_init_clock_in(DEVICE(s), "xosc-in", pll_xosc_update,
> +                                    s, ClockUpdate);
>      s->out = qdev_init_clock_out(DEVICE(s), "out");
>  }
>  
> @@ -209,7 +210,7 @@ static void pll_update_all_channels(BCM2835CprmanState *s,
>      }
>  }
>  
> -static void pll_channel_pll_in_update(void *opaque)
> +static void pll_channel_pll_in_update(void *opaque, ClockEvent event)
>  {
>      pll_channel_update(CPRMAN_PLL_CHANNEL(opaque));
>  }
> @@ -219,7 +220,8 @@ static void pll_channel_init(Object *obj)
>      CprmanPllChannelState *s = CPRMAN_PLL_CHANNEL(obj);
>  
>      s->pll_in = qdev_init_clock_in(DEVICE(s), "pll-in",
> -                                   pll_channel_pll_in_update, s);
> +                                   pll_channel_pll_in_update, s,
> +                                   ClockUpdate);
>      s->out = qdev_init_clock_out(DEVICE(s), "out");
>  }
>  
> @@ -303,7 +305,7 @@ static void clock_mux_update(CprmanClockMuxState *mux)
>      clock_update_hz(mux->out, freq);
>  }
>  
> -static void clock_mux_src_update(void *opaque)
> +static void clock_mux_src_update(void *opaque, ClockEvent event)
>  {
>      CprmanClockMuxState **backref = opaque;
>      CprmanClockMuxState *s = *backref;
> @@ -335,7 +337,8 @@ static void clock_mux_init(Object *obj)
>          s->backref[i] = s;
>          s->srcs[i] = qdev_init_clock_in(DEVICE(s), name,
>                                          clock_mux_src_update,
> -                                        &s->backref[i]);
> +                                        &s->backref[i],
> +                                        ClockUpdate);
>          g_free(name);
>      }
>  
> @@ -380,7 +383,7 @@ static void dsi0hsck_mux_update(CprmanDsi0HsckMuxState *s)
>      clock_update(s->out, clock_get(src));
>  }
>  
> -static void dsi0hsck_mux_in_update(void *opaque)
> +static void dsi0hsck_mux_in_update(void *opaque, ClockEvent event)
>  {
>      dsi0hsck_mux_update(CPRMAN_DSI0HSCK_MUX(opaque));
>  }
> @@ -390,8 +393,10 @@ static void dsi0hsck_mux_init(Object *obj)
>      CprmanDsi0HsckMuxState *s = CPRMAN_DSI0HSCK_MUX(obj);
>      DeviceState *dev = DEVICE(obj);
>  
> -    s->plla_in = qdev_init_clock_in(dev, "plla-in", dsi0hsck_mux_in_update, s);
> -    s->plld_in = qdev_init_clock_in(dev, "plld-in", dsi0hsck_mux_in_update, s);
> +    s->plla_in = qdev_init_clock_in(dev, "plla-in", dsi0hsck_mux_in_update,
> +                                    s, ClockUpdate);
> +    s->plld_in = qdev_init_clock_in(dev, "plld-in", dsi0hsck_mux_in_update,
> +                                    s, ClockUpdate);
>      s->out = qdev_init_clock_out(DEVICE(s), "out");
>  }
>  
> diff --git a/hw/misc/npcm7xx_clk.c b/hw/misc/npcm7xx_clk.c
> index 0bcae9ce957..a1ee67dc9a1 100644
> --- a/hw/misc/npcm7xx_clk.c
> +++ b/hw/misc/npcm7xx_clk.c
> @@ -586,15 +586,26 @@ static const DividerInitInfo divider_init_info_list[] = {
>      },
>  };
>  
> +static void npcm7xx_clk_update_pll_cb(void *opaque, ClockEvent event)
> +{
> +    npcm7xx_clk_update_pll(opaque);
> +}
> +
>  static void npcm7xx_clk_pll_init(Object *obj)
>  {
>      NPCM7xxClockPLLState *pll = NPCM7XX_CLOCK_PLL(obj);
>  
>      pll->clock_in = qdev_init_clock_in(DEVICE(pll), "clock-in",
> -            npcm7xx_clk_update_pll, pll);
> +                                       npcm7xx_clk_update_pll_cb, pll,
> +                                       ClockUpdate);
>      pll->clock_out = qdev_init_clock_out(DEVICE(pll), "clock-out");
>  }
>  
> +static void npcm7xx_clk_update_sel_cb(void *opaque, ClockEvent event)
> +{
> +    npcm7xx_clk_update_sel(opaque);
> +}
> +
>  static void npcm7xx_clk_sel_init(Object *obj)
>  {
>      int i;
> @@ -603,16 +614,23 @@ static void npcm7xx_clk_sel_init(Object *obj)
>      for (i = 0; i < NPCM7XX_CLK_SEL_MAX_INPUT; ++i) {
>          sel->clock_in[i] = qdev_init_clock_in(DEVICE(sel),
>                  g_strdup_printf("clock-in[%d]", i),
> -                npcm7xx_clk_update_sel, sel);
> +                npcm7xx_clk_update_sel_cb, sel, ClockUpdate);
>      }
>      sel->clock_out = qdev_init_clock_out(DEVICE(sel), "clock-out");
>  }
> +
> +static void npcm7xx_clk_update_divider_cb(void *opaque, ClockEvent event)
> +{
> +    npcm7xx_clk_update_divider(opaque);
> +}
> +
>  static void npcm7xx_clk_divider_init(Object *obj)
>  {
>      NPCM7xxClockDividerState *div = NPCM7XX_CLOCK_DIVIDER(obj);
>  
>      div->clock_in = qdev_init_clock_in(DEVICE(div), "clock-in",
> -            npcm7xx_clk_update_divider, div);
> +                                       npcm7xx_clk_update_divider_cb,
> +                                       div, ClockUpdate);
>      div->clock_out = qdev_init_clock_out(DEVICE(div), "clock-out");
>  }
>  
> @@ -875,7 +893,7 @@ static void npcm7xx_clk_init_clock_hierarchy(NPCM7xxCLKState *s)
>  {
>      int i;
>  
> -    s->clkref = qdev_init_clock_in(DEVICE(s), "clkref", NULL, NULL);
> +    s->clkref = qdev_init_clock_in(DEVICE(s), "clkref", NULL, NULL, 0);
>  
>      /* First pass: init all converter modules */
>      QEMU_BUILD_BUG_ON(ARRAY_SIZE(pll_init_info_list) != NPCM7XX_CLOCK_NR_PLLS);
> diff --git a/hw/misc/npcm7xx_pwm.c b/hw/misc/npcm7xx_pwm.c
> index dabcb6c0f95..ce192bb2741 100644
> --- a/hw/misc/npcm7xx_pwm.c
> +++ b/hw/misc/npcm7xx_pwm.c
> @@ -493,7 +493,7 @@ static void npcm7xx_pwm_init(Object *obj)
>      memory_region_init_io(&s->iomem, obj, &npcm7xx_pwm_ops, s,
>                            TYPE_NPCM7XX_PWM, 4 * KiB);
>      sysbus_init_mmio(sbd, &s->iomem);
> -    s->clock = qdev_init_clock_in(DEVICE(s), "clock", NULL, NULL);
> +    s->clock = qdev_init_clock_in(DEVICE(s), "clock", NULL, NULL, 0);
>  
>      for (i = 0; i < NPCM7XX_PWM_PER_MODULE; ++i) {
>          object_property_add_uint32_ptr(obj, "freq[*]",
> diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
> index 66504a9d3ab..c66d7db177d 100644
> --- a/hw/misc/zynq_slcr.c
> +++ b/hw/misc/zynq_slcr.c
> @@ -307,9 +307,10 @@ static void zynq_slcr_propagate_clocks(ZynqSLCRState *s)
>      clock_propagate(s->uart1_ref_clk);
>  }
>  
> -static void zynq_slcr_ps_clk_callback(void *opaque)
> +static void zynq_slcr_ps_clk_callback(void *opaque, ClockEvent event)
>  {
>      ZynqSLCRState *s = (ZynqSLCRState *) opaque;
> +
>      zynq_slcr_compute_clocks(s);
>      zynq_slcr_propagate_clocks(s);
>  }
> @@ -576,7 +577,7 @@ static const MemoryRegionOps slcr_ops = {
>  };
>  
>  static const ClockPortInitArray zynq_slcr_clocks = {
> -    QDEV_CLOCK_IN(ZynqSLCRState, ps_clk, zynq_slcr_ps_clk_callback),
> +    QDEV_CLOCK_IN(ZynqSLCRState, ps_clk, zynq_slcr_ps_clk_callback, ClockUpdate),
>      QDEV_CLOCK_OUT(ZynqSLCRState, uart0_ref_clk),
>      QDEV_CLOCK_OUT(ZynqSLCRState, uart1_ref_clk),
>      QDEV_CLOCK_END
> diff --git a/hw/timer/cmsdk-apb-dualtimer.c b/hw/timer/cmsdk-apb-dualtimer.c
> index ef49f5852d3..d4a509c798e 100644
> --- a/hw/timer/cmsdk-apb-dualtimer.c
> +++ b/hw/timer/cmsdk-apb-dualtimer.c
> @@ -449,7 +449,7 @@ static void cmsdk_apb_dualtimer_reset(DeviceState *dev)
>      s->timeritop = 0;
>  }
>  
> -static void cmsdk_apb_dualtimer_clk_update(void *opaque)
> +static void cmsdk_apb_dualtimer_clk_update(void *opaque, ClockEvent event)
>  {
>      CMSDKAPBDualTimer *s = CMSDK_APB_DUALTIMER(opaque);
>      int i;
> @@ -478,7 +478,8 @@ static void cmsdk_apb_dualtimer_init(Object *obj)
>          sysbus_init_irq(sbd, &s->timermod[i].timerint);
>      }
>      s->timclk = qdev_init_clock_in(DEVICE(s), "TIMCLK",
> -                                   cmsdk_apb_dualtimer_clk_update, s);
> +                                   cmsdk_apb_dualtimer_clk_update, s,
> +                                   ClockUpdate);
>  }
>  
>  static void cmsdk_apb_dualtimer_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
> index ee51ce3369c..68aa1a76360 100644
> --- a/hw/timer/cmsdk-apb-timer.c
> +++ b/hw/timer/cmsdk-apb-timer.c
> @@ -204,7 +204,7 @@ static void cmsdk_apb_timer_reset(DeviceState *dev)
>      ptimer_transaction_commit(s->timer);
>  }
>  
> -static void cmsdk_apb_timer_clk_update(void *opaque)
> +static void cmsdk_apb_timer_clk_update(void *opaque, ClockEvent event)
>  {
>      CMSDKAPBTimer *s = CMSDK_APB_TIMER(opaque);
>  
> @@ -223,7 +223,7 @@ static void cmsdk_apb_timer_init(Object *obj)
>      sysbus_init_mmio(sbd, &s->iomem);
>      sysbus_init_irq(sbd, &s->timerint);
>      s->pclk = qdev_init_clock_in(DEVICE(s), "pclk",
> -                                 cmsdk_apb_timer_clk_update, s);
> +                                 cmsdk_apb_timer_clk_update, s, ClockUpdate);
>  }
>  
>  static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/timer/npcm7xx_timer.c b/hw/timer/npcm7xx_timer.c
> index 36e2c07db26..4efdf135b82 100644
> --- a/hw/timer/npcm7xx_timer.c
> +++ b/hw/timer/npcm7xx_timer.c
> @@ -627,7 +627,7 @@ static void npcm7xx_timer_init(Object *obj)
>      sysbus_init_mmio(sbd, &s->iomem);
>      qdev_init_gpio_out_named(dev, &w->reset_signal,
>              NPCM7XX_WATCHDOG_RESET_GPIO_OUT, 1);
> -    s->clock = qdev_init_clock_in(dev, "clock", NULL, NULL);
> +    s->clock = qdev_init_clock_in(dev, "clock", NULL, NULL, 0);
>  }
>  
>  static const VMStateDescription vmstate_npcm7xx_base_timer = {
> diff --git a/hw/watchdog/cmsdk-apb-watchdog.c b/hw/watchdog/cmsdk-apb-watchdog.c
> index 302f1711738..5a2cd46eb76 100644
> --- a/hw/watchdog/cmsdk-apb-watchdog.c
> +++ b/hw/watchdog/cmsdk-apb-watchdog.c
> @@ -310,7 +310,7 @@ static void cmsdk_apb_watchdog_reset(DeviceState *dev)
>      ptimer_transaction_commit(s->timer);
>  }
>  
> -static void cmsdk_apb_watchdog_clk_update(void *opaque)
> +static void cmsdk_apb_watchdog_clk_update(void *opaque, ClockEvent event)
>  {
>      CMSDKAPBWatchdog *s = CMSDK_APB_WATCHDOG(opaque);
>  
> @@ -329,7 +329,8 @@ static void cmsdk_apb_watchdog_init(Object *obj)
>      sysbus_init_mmio(sbd, &s->iomem);
>      sysbus_init_irq(sbd, &s->wdogint);
>      s->wdogclk = qdev_init_clock_in(DEVICE(s), "WDOGCLK",
> -                                    cmsdk_apb_watchdog_clk_update, s);
> +                                    cmsdk_apb_watchdog_clk_update, s,
> +                                    ClockUpdate);
>  
>      s->is_luminary = false;
>      s->id = cmsdk_apb_watchdog_id;
> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index ad163ead625..2f3d9d2ce2c 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -636,7 +636,7 @@ static void mips_cpu_initfn(Object *obj)
>      MIPSCPUClass *mcc = MIPS_CPU_GET_CLASS(obj);
>  
>      cpu_set_cpustate_pointers(cpu);
> -    cpu->clock = qdev_init_clock_in(DEVICE(obj), "clk-in", NULL, cpu);
> +    cpu->clock = qdev_init_clock_in(DEVICE(obj), "clk-in", NULL, cpu, 0);
>      env->cpu_model = mcc->cpu_def;
>  }
>  
> -- 
> 2.20.1
> 

-- 

