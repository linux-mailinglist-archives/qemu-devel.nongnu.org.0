Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB39689977
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 14:09:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNvnP-0005L4-Mq; Fri, 03 Feb 2023 08:08:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNvnN-0005KO-An; Fri, 03 Feb 2023 08:08:01 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNvnK-00033s-I2; Fri, 03 Feb 2023 08:08:00 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5947A7466FF;
 Fri,  3 Feb 2023 14:05:26 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D9A8F74645F; Fri,  3 Feb 2023 14:05:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D7EFC746392;
 Fri,  3 Feb 2023 14:05:25 +0100 (CET)
Date: Fri, 3 Feb 2023 14:05:25 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Markus Armbruster <armbru@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 6/9] hw/display/sm501: QOM-alias 'dma-offset' property
 in chipset object
In-Reply-To: <20230203113650.78146-7-philmd@linaro.org>
Message-ID: <136f25e8-686a-1529-b114-08dd54e6b819@eik.bme.hu>
References: <20230203113650.78146-1-philmd@linaro.org>
 <20230203113650.78146-7-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-884711868-1675429525=:62709"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--3866299591-884711868-1675429525=:62709
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 3 Feb 2023, Philippe Mathieu-Daudé wrote:
> No need to use an intermediate 'dma-offset' property in the
> chipset object. Alias the property, so when the machine (here
> r2d-plus) sets the value on the chipset, it is propagated to
> the OHCI object.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> hw/display/sm501.c | 22 +++++++++++-----------
> hw/sh4/r2d.c       |  2 +-
> 2 files changed, 12 insertions(+), 12 deletions(-)

It does not seem to be any simpler by the number of lines but maybe a bit 
cleaner. I wonder if it would worth renaming the property to dma-offset to 
match that of ohci so it's less confusing what it refers to. It's only 
used by r2d and this patch already changing that so would be an easy 
change.

Regards,
BALATON Zoltan

> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index 52e42585af..49a648e952 100644
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
> @@ -1942,7 +1943,7 @@ struct SM501SysBusState {
>     /*< public >*/
>     SM501State state;
>     uint32_t vram_size;
> -    uint32_t base;
> +    OHCISysBusState ohci;
>     SerialMM serial;
> };
>
> @@ -1950,7 +1951,6 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
> {
>     SM501SysBusState *s = SYSBUS_SM501(dev);
>     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> -    DeviceState *usb_dev;
>     MemoryRegion *mr;
>
>     sm501_init(&s->state, dev, s->vram_size);
> @@ -1963,13 +1963,10 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
>     sysbus_init_mmio(sbd, &s->state.mmio_region);
>
>     /* bridge to usb host emulation module */
> -    usb_dev = qdev_new("sysbus-ohci");
> -    qdev_prop_set_uint32(usb_dev, "num-ports", 2);
> -    qdev_prop_set_uint64(usb_dev, "dma-offset", s->base);
> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(usb_dev), &error_fatal);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(&s->ohci), &error_fatal);
>     memory_region_add_subregion(&s->state.mmio_region, SM501_USB_HOST,
> -                       sysbus_mmio_get_region(SYS_BUS_DEVICE(usb_dev), 0));
> -    sysbus_pass_irq(sbd, SYS_BUS_DEVICE(usb_dev));
> +                       sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->ohci), 0));
> +    sysbus_pass_irq(sbd, SYS_BUS_DEVICE(&s->ohci));
>
>     /* bridge to serial emulation module */
>     sysbus_realize(SYS_BUS_DEVICE(&s->serial), &error_fatal);
> @@ -1980,7 +1977,6 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
>
> static Property sm501_sysbus_properties[] = {
>     DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
> -    DEFINE_PROP_UINT32("base", SM501SysBusState, base, 0),
>     DEFINE_PROP_END_OF_LIST(),
> };
>
> @@ -2016,15 +2012,19 @@ static void sm501_sysbus_class_init(ObjectClass *klass, void *data)
> static void sm501_sysbus_init(Object *o)
> {
>     SM501SysBusState *sm501 = SYSBUS_SM501(o);
> +    OHCISysBusState *ohci = &sm501->ohci;
>     SerialMM *smm = &sm501->serial;
>
> +    object_initialize_child(o, "ohci", ohci, TYPE_SYSBUS_OHCI);
> +    object_property_add_alias(o, "base", OBJECT(ohci), "dma-offset");
> +    qdev_prop_set_uint32(DEVICE(ohci), "num-ports", 2);
> +
>     object_initialize_child(o, "serial", smm, TYPE_SERIAL_MM);
>     qdev_set_legacy_instance_id(DEVICE(smm), SM501_UART0, 2);
>     qdev_prop_set_uint8(DEVICE(smm), "regshift", 2);
>     qdev_prop_set_uint8(DEVICE(smm), "endianness", DEVICE_LITTLE_ENDIAN);
>
> -    object_property_add_alias(o, "chardev",
> -                              OBJECT(smm), "chardev");
> +    object_property_add_alias(o, "chardev", OBJECT(smm), "chardev");
> }
>
> static const TypeInfo sm501_sysbus_info = {
> diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
> index 39fc4f19d9..279724ffbb 100644
> --- a/hw/sh4/r2d.c
> +++ b/hw/sh4/r2d.c
> @@ -274,7 +274,7 @@ static void r2d_init(MachineState *machine)
>     dev = qdev_new("sysbus-sm501");
>     busdev = SYS_BUS_DEVICE(dev);
>     qdev_prop_set_uint32(dev, "vram-size", SM501_VRAM_SIZE);
> -    qdev_prop_set_uint32(dev, "base", 0x10000000);
> +    qdev_prop_set_uint64(dev, "base", 0x10000000);
>     qdev_prop_set_chr(dev, "chardev", serial_hd(2));
>     sysbus_realize_and_unref(busdev, &error_fatal);
>     sysbus_mmio_map(busdev, 0, 0x10000000);
>
--3866299591-884711868-1675429525=:62709--

