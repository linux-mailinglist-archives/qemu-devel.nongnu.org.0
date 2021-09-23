Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA72B4160DC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 16:18:05 +0200 (CEST)
Received: from localhost ([::1]:42000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTPY3-0000Ns-CU
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 10:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mTPWx-00082o-Nk
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 10:16:55 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:10609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mTPWu-00059i-Dj
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 10:16:54 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B0FC7746353;
 Thu, 23 Sep 2021 16:16:45 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 735E0745953; Thu, 23 Sep 2021 16:16:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 706B87457EE;
 Thu, 23 Sep 2021 16:16:45 +0200 (CEST)
Date: Thu, 23 Sep 2021 16:16:45 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v5 04/20] nubus: use bitmap to manage available slots
In-Reply-To: <20210923091308.13832-5-mark.cave-ayland@ilande.co.uk>
Message-ID: <f39eb222-28aa-416f-61a2-ab74f52fda8f@eik.bme.hu>
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
 <20210923091308.13832-5-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Sep 2021, Mark Cave-Ayland wrote:
> Convert nubus_device_realize() to use a bitmap to manage available slots to allow
> for future Nubus devices to be plugged into arbitrary slots from the command line
> using a new qdev "slot" parameter for nubus devices.
>
> Update mac_nubus_bridge_init() to only allow slots 0x9 to 0xe on a Macintosh
> machines as documented in "Desigining Cards and Drivers for the Macintosh Family".

Small typo: "a Macintosh machnies", either a or s is not needed.

> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
> hw/nubus/mac-nubus-bridge.c         |  4 ++++
> hw/nubus/nubus-bus.c                |  5 +++--
> hw/nubus/nubus-device.c             | 32 +++++++++++++++++++++++------
> include/hw/nubus/mac-nubus-bridge.h |  4 ++++
> include/hw/nubus/nubus.h            | 13 ++++++------
> 5 files changed, 43 insertions(+), 15 deletions(-)
>
> diff --git a/hw/nubus/mac-nubus-bridge.c b/hw/nubus/mac-nubus-bridge.c
> index 7c329300b8..3f075789e9 100644
> --- a/hw/nubus/mac-nubus-bridge.c
> +++ b/hw/nubus/mac-nubus-bridge.c
> @@ -18,6 +18,10 @@ static void mac_nubus_bridge_init(Object *obj)
>
>     s->bus = NUBUS_BUS(qbus_create(TYPE_NUBUS_BUS, DEVICE(s), NULL));
>
> +    /* Macintosh only has slots 0x9 to 0xe available */
> +    s->bus->slot_available_mask = MAKE_64BIT_MASK(MAC_NUBUS_FIRST_SLOT,
> +                                                  MAC_NUBUS_SLOT_NB);
> +
>     sysbus_init_mmio(sbd, &s->bus->super_slot_io);
>     sysbus_init_mmio(sbd, &s->bus->slot_io);
> }
> diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
> index f4410803ff..3cd7534864 100644
> --- a/hw/nubus/nubus-bus.c
> +++ b/hw/nubus/nubus-bus.c
> @@ -86,13 +86,14 @@ static void nubus_init(Object *obj)
>
>     memory_region_init_io(&nubus->super_slot_io, obj, &nubus_super_slot_ops,
>                           nubus, "nubus-super-slots",
> -                          NUBUS_SUPER_SLOT_NB * NUBUS_SUPER_SLOT_SIZE);
> +                          (NUBUS_SUPER_SLOT_NB + 1) * NUBUS_SUPER_SLOT_SIZE);
>
>     memory_region_init_io(&nubus->slot_io, obj, &nubus_slot_ops,
>                           nubus, "nubus-slots",
>                           NUBUS_SLOT_NB * NUBUS_SLOT_SIZE);
>
> -    nubus->current_slot = NUBUS_FIRST_SLOT;
> +    nubus->slot_available_mask = MAKE_64BIT_MASK(NUBUS_FIRST_SLOT,
> +                                                 NUBUS_SLOT_NB);
> }
>
> static void nubus_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
> index 4e23df1280..562650a05b 100644
> --- a/hw/nubus/nubus-device.c
> +++ b/hw/nubus/nubus-device.c
> @@ -160,14 +160,28 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
>     NubusDevice *nd = NUBUS_DEVICE(dev);
>     char *name;
>     hwaddr slot_offset;
> -
> -    if (nubus->current_slot < NUBUS_FIRST_SLOT ||
> -            nubus->current_slot > NUBUS_LAST_SLOT) {
> -        error_setg(errp, "Cannot register nubus card, not enough slots");
> -        return;
> +    uint16_t s;
> +
> +    if (nd->slot == -1) {
> +        /* No slot specified, find first available free slot */
> +        s = ctz32(nubus->slot_available_mask);
> +        if (s != 32) {
> +            nd->slot = s;
> +        } else {
> +            error_setg(errp, "Cannot register nubus card, no free slot "
> +                             "available");
> +            return;
> +        }
> +    } else {
> +        /* Slot specified, make sure the slot is available */
> +        if (!(nubus->slot_available_mask & BIT(nd->slot))) {
> +            error_setg(errp, "Cannot register nubus card, slot %d is "
> +                             "unavailable or already occupied", nd->slot);
> +            return;
> +        }
>     }
>
> -    nd->slot = nubus->current_slot++;
> +    nubus->slot_available_mask &= ~BIT(nd->slot);
>
>     /* Super */
>     slot_offset = nd->slot * NUBUS_SUPER_SLOT_SIZE;
> @@ -191,12 +205,18 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
>     nubus_register_format_block(nd);
> }
>
> +static Property nubus_device_properties[] = {
> +    DEFINE_PROP_INT32("slot", NubusDevice, slot, -1),
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
> static void nubus_device_class_init(ObjectClass *oc, void *data)
> {
>     DeviceClass *dc = DEVICE_CLASS(oc);
>
>     dc->realize = nubus_device_realize;
>     dc->bus_type = TYPE_NUBUS_BUS;
> +    device_class_set_props(dc, nubus_device_properties);
> }
>
> static const TypeInfo nubus_device_type_info = {
> diff --git a/include/hw/nubus/mac-nubus-bridge.h b/include/hw/nubus/mac-nubus-bridge.h
> index 36aa098dd4..118d67267d 100644
> --- a/include/hw/nubus/mac-nubus-bridge.h
> +++ b/include/hw/nubus/mac-nubus-bridge.h
> @@ -12,6 +12,10 @@
> #include "hw/nubus/nubus.h"
> #include "qom/object.h"
>
> +#define MAC_NUBUS_FIRST_SLOT 0x9
> +#define MAC_NUBUS_LAST_SLOT  0xe
> +#define MAC_NUBUS_SLOT_NB    (MAC_NUBUS_LAST_SLOT - MAC_NUBUS_FIRST_SLOT + 1)
> +
> #define TYPE_MAC_NUBUS_BRIDGE "mac-nubus-bridge"
> OBJECT_DECLARE_SIMPLE_TYPE(MacNubusState, MAC_NUBUS_BRIDGE)
>
> diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
> index 89b0976aaa..988e4a2361 100644
> --- a/include/hw/nubus/nubus.h
> +++ b/include/hw/nubus/nubus.h
> @@ -14,13 +14,12 @@
> #include "qom/object.h"
>
> #define NUBUS_SUPER_SLOT_SIZE 0x10000000U
> -#define NUBUS_SUPER_SLOT_NB   0x9
> +#define NUBUS_SUPER_SLOT_NB   0xe
>
> #define NUBUS_SLOT_SIZE       0x01000000
> -#define NUBUS_SLOT_NB         0xF
> -
> -#define NUBUS_FIRST_SLOT      0x9
> -#define NUBUS_LAST_SLOT       0xF
> +#define NUBUS_FIRST_SLOT      0x0
> +#define NUBUS_LAST_SLOT       0xf
> +#define NUBUS_SLOT_NB         (NUBUS_LAST_SLOT - NUBUS_FIRST_SLOT + 1)
>
> #define TYPE_NUBUS_DEVICE "nubus-device"
> OBJECT_DECLARE_SIMPLE_TYPE(NubusDevice, NUBUS_DEVICE)
> @@ -36,13 +35,13 @@ struct NubusBus {
>     MemoryRegion super_slot_io;
>     MemoryRegion slot_io;
>
> -    int current_slot;
> +    uint32_t slot_available_mask;
> };
>
> struct NubusDevice {
>     DeviceState qdev;
>
> -    int slot;
> +    int32_t slot;

Why uint32_t? Considering its max value even uint8_t would be enough 
although maybe invalid value would be 255 instead of -1 then. As this was 
added in previous patch you could avoid churn here by introducing it with 
the right type in that patch already. (But feel free to ignore it if you 
have no time for more changes, the current version works so if you don't 
do another version for other reasons this probably don't worth the effort 
alone.)

Regards,
BALATON Zoltan

