Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5FD689EFE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 17:20:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNymS-0003Z4-2X; Fri, 03 Feb 2023 11:19:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNymO-0003Wv-6q; Fri, 03 Feb 2023 11:19:12 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNymJ-0004Pd-Tn; Fri, 03 Feb 2023 11:19:11 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9BC32746392;
 Fri,  3 Feb 2023 17:16:33 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 640BD745712; Fri,  3 Feb 2023 17:16:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 621B87456E3;
 Fri,  3 Feb 2023 17:16:33 +0100 (CET)
Date: Fri, 3 Feb 2023 17:16:33 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, 
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2 10/15] hw/display/sm501: Embed OHCI QOM child in chipset
In-Reply-To: <20230203145536.17585-11-philmd@linaro.org>
Message-ID: <5dd01ff0-ab39-f0f4-f666-66296e3e77dd@eik.bme.hu>
References: <20230203145536.17585-1-philmd@linaro.org>
 <20230203145536.17585-11-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-769520161-1675440993=:20219"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-769520161-1675440993=:20219
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 3 Feb 2023, Philippe Mathieu-Daudé wrote:
> Note this device doesn't implement unrealize().
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/display/sm501.c | 17 ++++++++++-------
> 1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index 52e42585af..0f7e09d7e2 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -28,6 +28,7 @@
> #include "qapi/error.h"
> #include "qemu/log.h"
> #include "qemu/module.h"
> +#include "hw/usb/hcd-ohci.h"
> #include "hw/char/serial.h"
> #include "ui/console.h"
> #include "hw/sysbus.h"
> @@ -1944,13 +1945,13 @@ struct SM501SysBusState {
>     uint32_t vram_size;
>     uint32_t base;
>     SerialMM serial;
> +    OHCISysBusState ohci;
> };
>
> static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
> {
>     SM501SysBusState *s = SYSBUS_SM501(dev);
>     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> -    DeviceState *usb_dev;
>     MemoryRegion *mr;
>
>     sm501_init(&s->state, dev, s->vram_size);
> @@ -1963,13 +1964,11 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
>     sysbus_init_mmio(sbd, &s->state.mmio_region);
>
>     /* bridge to usb host emulation module */
> -    usb_dev = qdev_new("sysbus-ohci");
> -    qdev_prop_set_uint32(usb_dev, "num-ports", 2);
> -    qdev_prop_set_uint64(usb_dev, "dma-offset", s->base);
> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(usb_dev), &error_fatal);
> +    qdev_prop_set_uint64(DEVICE(&s->ohci), "dma-offset", s->base);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(&s->ohci), &error_fatal);
>     memory_region_add_subregion(&s->state.mmio_region, SM501_USB_HOST,
> -                       sysbus_mmio_get_region(SYS_BUS_DEVICE(usb_dev), 0));
> -    sysbus_pass_irq(sbd, SYS_BUS_DEVICE(usb_dev));
> +                       sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->ohci), 0));
> +    sysbus_pass_irq(sbd, SYS_BUS_DEVICE(&s->ohci));
>
>     /* bridge to serial emulation module */
>     sysbus_realize(SYS_BUS_DEVICE(&s->serial), &error_fatal);
> @@ -2016,8 +2015,12 @@ static void sm501_sysbus_class_init(ObjectClass *klass, void *data)
> static void sm501_sysbus_init(Object *o)
> {
>     SM501SysBusState *sm501 = SYSBUS_SM501(o);
> +    OHCISysBusState *ohci = &sm501->ohci;
>     SerialMM *smm = &sm501->serial;
>
> +    object_initialize_child(o, "ohci", ohci, TYPE_SYSBUS_OHCI);
> +    qdev_prop_set_uint32(DEVICE(ohci), "num-ports", 2);
> +
>     object_initialize_child(o, "serial", smm, TYPE_SERIAL_MM);
>     qdev_set_legacy_instance_id(DEVICE(smm), SM501_UART0, 2);
>     qdev_prop_set_uint8(DEVICE(smm), "regshift", 2);
>
--3866299591-769520161-1675440993=:20219--

