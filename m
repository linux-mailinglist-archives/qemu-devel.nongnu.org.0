Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A233689F0B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 17:23:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNypA-00052f-LU; Fri, 03 Feb 2023 11:22:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNyp4-00051Y-2k; Fri, 03 Feb 2023 11:22:01 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNyp2-0005Ef-Af; Fri, 03 Feb 2023 11:21:57 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C3E85746D65;
 Fri,  3 Feb 2023 17:19:25 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8615E746705; Fri,  3 Feb 2023 17:19:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 841E974645F;
 Fri,  3 Feb 2023 17:19:25 +0100 (CET)
Date: Fri, 3 Feb 2023 17:19:25 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, 
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Eduardo Habkost <eduardo@habkost.net>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2 11/15] hw/display/sm501: Alias 'dma-offset' QOM property
 in chipset object
In-Reply-To: <20230203145536.17585-12-philmd@linaro.org>
Message-ID: <bf870b22-9c8f-177c-346a-9a1b1e8aa113@eik.bme.hu>
References: <20230203145536.17585-1-philmd@linaro.org>
 <20230203145536.17585-12-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-870387613-1675441165=:20219"
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

--3866299591-870387613-1675441165=:20219
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 3 Feb 2023, Philippe Mathieu-Daudé wrote:
> No need to use an intermediate 'dma-offset' property in the
> chipset object. Alias the property, so when the machine (here
> r2d-plus) sets the value on the chipset, it is propagated to
> the OHCI object.
>
> Note we can rename the chipset 'base' property as 'dma-offset'
> since the object is a non-user-creatable sysbus type.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/display/sm501.c | 7 ++-----
> hw/sh4/r2d.c       | 2 +-
> 2 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index 0f7e09d7e2..efebd93f1e 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -1943,7 +1943,6 @@ struct SM501SysBusState {
>     /*< public >*/
>     SM501State state;
>     uint32_t vram_size;
> -    uint32_t base;
>     SerialMM serial;
>     OHCISysBusState ohci;
> };
> @@ -1964,7 +1963,6 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
>     sysbus_init_mmio(sbd, &s->state.mmio_region);
>
>     /* bridge to usb host emulation module */
> -    qdev_prop_set_uint64(DEVICE(&s->ohci), "dma-offset", s->base);
>     sysbus_realize_and_unref(SYS_BUS_DEVICE(&s->ohci), &error_fatal);
>     memory_region_add_subregion(&s->state.mmio_region, SM501_USB_HOST,
>                        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->ohci), 0));
> @@ -1979,7 +1977,6 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
>
> static Property sm501_sysbus_properties[] = {
>     DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
> -    DEFINE_PROP_UINT32("base", SM501SysBusState, base, 0),
>     DEFINE_PROP_END_OF_LIST(),
> };
>
> @@ -2019,6 +2016,7 @@ static void sm501_sysbus_init(Object *o)
>     SerialMM *smm = &sm501->serial;
>
>     object_initialize_child(o, "ohci", ohci, TYPE_SYSBUS_OHCI);
> +    object_property_add_alias(o, "dma-offset", OBJECT(ohci), "dma-offset");
>     qdev_prop_set_uint32(DEVICE(ohci), "num-ports", 2);
>
>     object_initialize_child(o, "serial", smm, TYPE_SERIAL_MM);
> @@ -2026,8 +2024,7 @@ static void sm501_sysbus_init(Object *o)
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
> index 39fc4f19d9..d7020d6d2b 100644
> --- a/hw/sh4/r2d.c
> +++ b/hw/sh4/r2d.c
> @@ -274,7 +274,7 @@ static void r2d_init(MachineState *machine)
>     dev = qdev_new("sysbus-sm501");
>     busdev = SYS_BUS_DEVICE(dev);
>     qdev_prop_set_uint32(dev, "vram-size", SM501_VRAM_SIZE);
> -    qdev_prop_set_uint32(dev, "base", 0x10000000);
> +    qdev_prop_set_uint64(dev, "dma-offset", 0x10000000);
>     qdev_prop_set_chr(dev, "chardev", serial_hd(2));
>     sysbus_realize_and_unref(busdev, &error_fatal);
>     sysbus_mmio_map(busdev, 0, 0x10000000);
>
--3866299591-870387613-1675441165=:20219--

