Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A16314E45
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 12:32:57 +0100 (CET)
Received: from localhost ([::1]:53272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9RGK-0007p6-Bd
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 06:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9RE7-000738-20; Tue, 09 Feb 2021 06:30:39 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:33621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9RE5-0003C5-4H; Tue, 09 Feb 2021 06:30:38 -0500
Received: by mail-ej1-x62f.google.com with SMTP id sa23so30761560ejb.0;
 Tue, 09 Feb 2021 03:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K1aKW2+Xo1s4zj6zjrXZK3biPYdKRQYWY2YgWKd3x7s=;
 b=AEzzGfjuPpy/Div1NZq+vrT5w5YtUIZTpdOCbNf2+cyfpSOTz7SUjkOQwDEVnu93Hi
 zfEfeMMXIBsqh7Xz/FkWKBh2/gqpoOJgO7kMsyKMGQPoIfuQY63IciMLr33nEqfuChP0
 GEazW3yYfrCDOaOczY5Gnylb4Pa6N3fezMtx/f663NRCnHbeLtHlQZFBoEodqEg+vR71
 q49jId4165n8qOjBy88c39q6HKtTXUyVqjqXCja75osbGJl4I4b3ej0PL9zQoY4Qh0q4
 Obr/fsuVnRMiZ4vbteDzyDRA9bpXR0rS4tn8GV7cCwywwfTj7ssy4gH60OWi/u0Lxoo9
 DyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K1aKW2+Xo1s4zj6zjrXZK3biPYdKRQYWY2YgWKd3x7s=;
 b=JBypDASVTB9rKx3ttJE9zKdpCQUHTYTOG8qVj0NiO9yhiwVSpf4OllxRoXagJ1i3o/
 3hT5F+B88mqKOU+QQKOA8C6r5o5PXs9KhwQPK8FQ6ovWXFJdUJKgDdfS1m3gOH5gz8Vd
 oUzaqGeEBvox8pAJG5pQYhcaBYepwwPLp3EW/Q1M+5XG3ZIlcs3I5k3BG3FJIEfLdo0u
 ou1AN+ynzobHpTn8NpKTbz4iTi9fDqu/EbORs37iMUhYXCAXGsJluimNcrMjKHGIAK8V
 JHEXJ5jYnl3v4yOuEWYs7bPsfmdKzR5pe/58YqW1l5MrbWSTd3ePh/Qq0LkEIb7++a3u
 j8FA==
X-Gm-Message-State: AOAM533q8R1LzZTRKntHGNUrxxRxNgs2cgnlSW9Bq6XpBt7o8o3ff6Xo
 XnBBXXT/HiKJdTNOSRwW9g8=
X-Google-Smtp-Source: ABdhPJwBxOqNdi6cXqDRIzn22Rt7JXEKuwr6j5Y+ReqZ/oeBYz46IEYuHtc5ZsbcU31p5axzN566PQ==
X-Received: by 2002:a17:906:c0d7:: with SMTP id
 bn23mr21605996ejb.94.1612870234296; 
 Tue, 09 Feb 2021 03:30:34 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id cf25sm4693475ejb.71.2021.02.09.03.30.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 03:30:33 -0800 (PST)
Subject: Re: [PATCH] Raspberry PI GPIO interrupt support
To: Davide Berardi <berardi.dav@gmail.com>, qemu-devel@nongnu.org
References: <20210209110252.GA14409@carpenter.lan>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <355f1271-09c9-715a-a909-c0f05060dfe5@amsat.org>
Date: Tue, 9 Feb 2021 12:30:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210209110252.GA14409@carpenter.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.265,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Davide,
On 2/9/21 12:02 PM, Davide Berardi wrote:
> The bcm2835 GPIOs now generate interrupts.
> This modification enables QTEST clients to trigger interrupt-based
> interfaces.

Thanks for your patch!

Can you provide QTEST client example? Even better would be a qtest!

> 
> Signed-off-by: Davide Berardi <berardi.dav@gmail.com>
> ---
>   hw/arm/bcm2835_peripherals.c   |   2 +
>   hw/gpio/bcm2835_gpio.c         | 105 +++++++++++++++++++++++++++++++++
>   hw/intc/bcm2835_ic.c           |   2 -
>   include/hw/gpio/bcm2835_gpio.h |  12 ++++
>   4 files changed, 119 insertions(+), 2 deletions(-)
...

I wonder how you generated your patch, it doesn't apply:

Applying: Raspberry PI GPIO interrupt support
error: patch failed: hw/arm/bcm2835_peripherals.c:114
error: hw/arm/bcm2835_peripherals.c: patch does not apply
error: patch failed: hw/gpio/bcm2835_gpio.c:7
error: hw/gpio/bcm2835_gpio.c: patch does not apply
error: patch failed: hw/intc/bcm2835_ic.c:57
error: hw/intc/bcm2835_ic.c: patch does not apply
error: patch failed: include/hw/gpio/bcm2835_gpio.h:7
error: include/hw/gpio/bcm2835_gpio.h: patch does not apply
Patch failed at 0001 Raspberry PI GPIO interrupt support

You can find the guidelines here:
https://wiki.qemu.org/Contribute/SubmitAPatch#Submitting_your_Patches

>   +static inline int get_bit_2_u32(const uint32_t idx,
> +                                const uint32_t v1, const uint32_t v2)
> +{
> +    uint64_t v = v1 | ((uint64_t)v2) << 32;
> +    return !!(v & (1 << idx));
> +}
> +
> +static int ren_detect(BCM2835GpioState *s, int index)
> +{
> +    if (index >= 0 && index < 54) {
> +        return get_bit_2_u32(index, s->ren0, s->ren1);
> +    }
> +    return 0;
> +}
> +
> +static int fen_detect(BCM2835GpioState *s, int index)
> +{
> +    if (index >= 0 && index < 54) {
> +        return get_bit_2_u32(index, s->fen0, s->fen1);
> +    }
> +    return 0;
> +}

I suppose you can simplify by using 'uint64_t fen' and ren,
and the extract64() method from "qemu/bitops.h".

> @@ -137,6 +178,15 @@ static void gpclr(BCM2835GpioState *s,
>       for (i = 0; i < count; i++) {
>           if ((changes & cur) && (gpfsel_is_out(s, start + i))) {
>               qemu_set_irq(s->out[start + i], 0);
> +        } else if ((changes & cur) && fen_detect(s, start + i)) {
> +            /* If this is an input we must check falling edge */
> +            int irqline = 0;
> +            if (i > 27)
> +                irqline = 1;
> +            if (i > 45)
> +              irqline = 2;

Please respect QEMU's CODING_STYLE.rst.

Matter of taste, this seems easier to follow:

  int irqline;

  if (i > 45) {
    irqline = 2;
  } else if > 27
    irqline = 1;
  } else {
    irqline = 0;
  }

> +
> +            qemu_set_irq(s->irq[irqline], 1);
>           }
>           cur <<= 1;
>       }
> @@ -144,6 +194,34 @@ static void gpclr(BCM2835GpioState *s,
>       *lev &= ~val;
>   }
>   +static int gpio_from_value(uint64_t value, int bank)
> +{
> +    int i;
> +    for (i = 0 ; i < 32; ++i)
> +        if (value & (1 << i))

Please use extract32().

> +           return i + (32 * bank);
> +    return 0;
> +}
> +
> +static void eds_clear(BCM2835GpioState *s, uint64_t value, int bank)
> +{
> +    int gpio = 0;
> +    int irqline = 0;
> +    if (bank) {
> +        s->eds0 &= ~value;
> +    } else {
> +        s->eds1 &= (~value & 0x3f);
> +    }

Similarly, using 'uint64_t eds' should simplify this.

> +    gpio = gpio_from_value(value, bank);
> +
> +    if (gpio > 27)
> +       irqline = 1;
> +    if (gpio > 45)
> +       irqline = 2;
> +
> +    qemu_set_irq(s->irq[irqline], 0);
> +}
> +
>   static uint64_t bcm2835_gpio_read(void *opaque, hwaddr offset,
>           unsigned size)
>   {
> @@ -170,11 +248,17 @@ static uint64_t bcm2835_gpio_read(void *opaque,
> hwaddr offset,
>       case GPLEV1:
>           return s->lev1;
>       case GPEDS0:
> +        return s->eds0;
>       case GPEDS1:
> +        return s->eds1;

Using 'uint64_t eds' this becomes:

  case GPEDS0:
  case GPEDS1:
      return extract64(s->eds, offset == GPEDS1 ? 0 : 32, 32);

>   @@ -318,6 +415,14 @@ static void bcm2835_gpio_realize(DeviceState
> *dev, Error **errp)
>         obj = object_property_get_link(OBJECT(dev), "sdbus-sdhost",
> &error_abort);
>       s->sdbus_sdhost = SD_BUS(obj);
> +
> +    obj = object_property_get_link(OBJECT(dev), "ic", &error_abort);
> +    s->ic = BCM2835_IC(obj);
> +
> +    for (i = 0 ; i < 3; ++i) {

Please replace this magic 3 by a definition, maybe
BCM2835_EXTERNAL_IRQ_COUNT?

> +        s->irq[i] = qdev_get_gpio_in_named(DEVICE(obj),
> +                                           BCM2835_IC_GPU_IRQ, i + 49);
> +    }
>   }
>     static void bcm2835_gpio_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/intc/bcm2835_ic.c b/hw/intc/bcm2835_ic.c
> index 9000d995e8..b381dc6603 100644
> --- a/hw/intc/bcm2835_ic.c
> +++ b/hw/intc/bcm2835_ic.c
> @@ -57,7 +57,6 @@ static void bcm2835_ic_update(BCM2835ICState *s)
>   static void bcm2835_ic_set_gpu_irq(void *opaque, int irq, int level)
>   {
>       BCM2835ICState *s = opaque;
> -

Spurious change.

>       assert(irq >= 0 && irq < 64);
>       trace_bcm2835_ic_set_gpu_irq(irq, level);
>       s->gpu_irq_level = deposit64(s->gpu_irq_level, irq, 1, level != 0);
> @@ -67,7 +66,6 @@ static void bcm2835_ic_set_gpu_irq(void *opaque, int
> irq, int level)
>   static void bcm2835_ic_set_arm_irq(void *opaque, int irq, int level)
>   {
>       BCM2835ICState *s = opaque;
> -

Ditto.

>       assert(irq >= 0 && irq < 8);
>       trace_bcm2835_ic_set_cpu_irq(irq, level);
>       s->arm_irq_level = deposit32(s->arm_irq_level, irq, 1, level != 0);
> diff --git a/include/hw/gpio/bcm2835_gpio.h
> b/include/hw/gpio/bcm2835_gpio.h
> index 1c53a05090..cad3e987d3 100644
> --- a/include/hw/gpio/bcm2835_gpio.h
> +++ b/include/hw/gpio/bcm2835_gpio.h
> @@ -7,6 +7,9 @@
>    *  Clement Deschamps <clement.deschamps@antfield.fr>
>    *  Luc Michel <luc.michel@antfield.fr>
>    *
> + * GPIO External support
> + *  Davide Berardi <berardi.dav@gmail.com>
> + *
>    * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
>    * See the COPYING file in the top-level directory.
>    */
> @@ -17,6 +20,7 @@
>   #include "hw/sd/sd.h"
>   #include "hw/sysbus.h"
>   #include "qom/object.h"
> +#include "hw/intc/bcm2835_ic.h"

Here would go:

#define BCM2835_EXTERNAL_IRQ_COUNT 3

>     struct BCM2835GpioState {
>       SysBusDevice parent_obj;
> @@ -27,11 +31,19 @@ struct BCM2835GpioState {
>       SDBus sdbus;
>       SDBus *sdbus_sdhci;
>       SDBus *sdbus_sdhost;
> +    BCM2835ICState *ic;
>         uint8_t fsel[54];
>       uint32_t lev0, lev1;
> +    /* Event detection */
> +    uint32_t eds0, eds1;
> +    /* Edge selector */
> +    uint32_t ren0, ren1;
> +    uint32_t fen0, fen1;
> +
>       uint8_t sd_fsel;
>       qemu_irq out[54];
> +    qemu_irq irq[3];

and here 3 -> BCM2835_EXTERNAL_IRQ_COUNT.

>   };
>     #define TYPE_BCM2835_GPIO "bcm2835_gpio"

Regards,

Phil.

