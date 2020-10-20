Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B7C28CF4C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 15:40:03 +0200 (CEST)
Received: from localhost ([::1]:51536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSKX4-0003as-9f
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 09:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kSKVi-0002ds-8u; Tue, 13 Oct 2020 09:38:39 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:58455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kSKVe-0002UY-AH; Tue, 13 Oct 2020 09:38:37 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0A965747605;
 Tue, 13 Oct 2020 15:38:20 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CA173747600; Tue, 13 Oct 2020 15:38:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C8AA6747604;
 Tue, 13 Oct 2020 15:38:19 +0200 (CEST)
Date: Tue, 13 Oct 2020 15:38:19 +0200 (CEST)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2 3/3] uninorth: use qdev gpios for PCI IRQs
In-Reply-To: <20201013114922.2946-4-mark.cave-ayland@ilande.co.uk>
Message-ID: <f8df313a-24ae-5544-e1a8-32cb7729f680@eik.bme.hu>
References: <20201013114922.2946-1-mark.cave-ayland@ilande.co.uk>
 <20201013114922.2946-4-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: f4bug@amsat.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Tue, 13 Oct 2020, Mark Cave-Ayland wrote:
> Currently an object link property is used to pass a reference to the OpenPIC
> into the PCI host bridge so that pci_unin_init_irqs() can connect the PCI
> IRQs to the PIC itself.
>
> This can be simplified by defining the PCI IRQs as qdev gpios and then wiring
> up the PCI IRQs to the PIC in the New World machine init function.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
> hw/pci-host/uninorth.c         | 45 +++++++---------------------------
> hw/ppc/mac_newworld.c          | 24 ++++++++++++------
> include/hw/pci-host/uninorth.h |  2 --
> 3 files changed, 25 insertions(+), 46 deletions(-)
>
> diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
> index 1ed1072eeb..0c0a9ecee1 100644
> --- a/hw/pci-host/uninorth.c
> +++ b/hw/pci-host/uninorth.c
> @@ -32,8 +32,6 @@
> #include "hw/pci-host/uninorth.h"
> #include "trace.h"
>
> -static const int unin_irq_line[] = { 0x1b, 0x1c, 0x1d, 0x1e };
> -
> static int pci_unin_map_irq(PCIDevice *pci_dev, int irq_num)
> {
>     return (irq_num + (pci_dev->devfn >> 3)) & 3;
> @@ -43,7 +41,7 @@ static void pci_unin_set_irq(void *opaque, int irq_num, int level)
> {
>     UNINHostState *s = opaque;
>
> -    trace_unin_set_irq(unin_irq_line[irq_num], level);
> +    trace_unin_set_irq(irq_num, level);
>     qemu_set_irq(s->irqs[irq_num], level);
> }
>
> @@ -112,15 +110,6 @@ static const MemoryRegionOps unin_data_ops = {
>     .endianness = DEVICE_LITTLE_ENDIAN,
> };
>
> -static void pci_unin_init_irqs(UNINHostState *s)
> -{
> -    int i;
> -
> -    for (i = 0; i < ARRAY_SIZE(s->irqs); i++) {
> -        s->irqs[i] = qdev_get_gpio_in(DEVICE(s->pic), unin_irq_line[i]);
> -    }
> -}
> -
> static char *pci_unin_main_ofw_unit_address(const SysBusDevice *dev)
> {
>     UNINHostState *s = UNI_NORTH_PCI_HOST_BRIDGE(dev);
> @@ -141,7 +130,6 @@ static void pci_unin_main_realize(DeviceState *dev, Error **errp)
>                                    PCI_DEVFN(11, 0), 4, TYPE_PCI_BUS);
>
>     pci_create_simple(h->bus, PCI_DEVFN(11, 0), "uni-north-pci");
> -    pci_unin_init_irqs(s);
>
>     /* DEC 21154 bridge */
> #if 0
> @@ -172,15 +160,12 @@ static void pci_unin_main_init(Object *obj)
>                              "unin-pci-hole", &s->pci_mmio,
>                              0x80000000ULL, 0x10000000ULL);
>
> -    object_property_add_link(obj, "pic", TYPE_OPENPIC,
> -                             (Object **) &s->pic,
> -                             qdev_prop_allow_set_link_before_realize,
> -                             0);
> -
>     sysbus_init_mmio(sbd, &h->conf_mem);
>     sysbus_init_mmio(sbd, &h->data_mem);
>     sysbus_init_mmio(sbd, &s->pci_hole);
>     sysbus_init_mmio(sbd, &s->pci_io);
> +
> +    qdev_init_gpio_out(DEVICE(obj), s->irqs, ARRAY_SIZE(s->irqs));
> }
>
> static void pci_u3_agp_realize(DeviceState *dev, Error **errp)
> @@ -196,7 +181,6 @@ static void pci_u3_agp_realize(DeviceState *dev, Error **errp)
>                                    PCI_DEVFN(11, 0), 4, TYPE_PCI_BUS);
>
>     pci_create_simple(h->bus, PCI_DEVFN(11, 0), "u3-agp");
> -    pci_unin_init_irqs(s);
> }
>
> static void pci_u3_agp_init(Object *obj)
> @@ -220,15 +204,12 @@ static void pci_u3_agp_init(Object *obj)
>                              "unin-pci-hole", &s->pci_mmio,
>                              0x80000000ULL, 0x70000000ULL);
>
> -    object_property_add_link(obj, "pic", TYPE_OPENPIC,
> -                             (Object **) &s->pic,
> -                             qdev_prop_allow_set_link_before_realize,
> -                             0);
> -
>     sysbus_init_mmio(sbd, &h->conf_mem);
>     sysbus_init_mmio(sbd, &h->data_mem);
>     sysbus_init_mmio(sbd, &s->pci_hole);
>     sysbus_init_mmio(sbd, &s->pci_io);
> +
> +    qdev_init_gpio_out(DEVICE(obj), s->irqs, ARRAY_SIZE(s->irqs));
> }
>
> static void pci_unin_agp_realize(DeviceState *dev, Error **errp)
> @@ -244,7 +225,6 @@ static void pci_unin_agp_realize(DeviceState *dev, Error **errp)
>                                    PCI_DEVFN(11, 0), 4, TYPE_PCI_BUS);
>
>     pci_create_simple(h->bus, PCI_DEVFN(11, 0), "uni-north-agp");
> -    pci_unin_init_irqs(s);
> }
>
> static void pci_unin_agp_init(Object *obj)
> @@ -259,13 +239,10 @@ static void pci_unin_agp_init(Object *obj)
>     memory_region_init_io(&h->data_mem, OBJECT(h), &pci_host_data_le_ops,
>                           obj, "unin-agp-conf-data", 0x1000);
>
> -    object_property_add_link(obj, "pic", TYPE_OPENPIC,
> -                             (Object **) &s->pic,
> -                             qdev_prop_allow_set_link_before_realize,
> -                             0);
> -
>     sysbus_init_mmio(sbd, &h->conf_mem);
>     sysbus_init_mmio(sbd, &h->data_mem);
> +
> +    qdev_init_gpio_out(DEVICE(obj), s->irqs, ARRAY_SIZE(s->irqs));
> }
>
> static void pci_unin_internal_realize(DeviceState *dev, Error **errp)
> @@ -281,7 +258,6 @@ static void pci_unin_internal_realize(DeviceState *dev, Error **errp)
>                                    PCI_DEVFN(14, 0), 4, TYPE_PCI_BUS);
>
>     pci_create_simple(h->bus, PCI_DEVFN(14, 0), "uni-north-internal-pci");
> -    pci_unin_init_irqs(s);
> }
>
> static void pci_unin_internal_init(Object *obj)
> @@ -296,13 +272,10 @@ static void pci_unin_internal_init(Object *obj)
>     memory_region_init_io(&h->data_mem, OBJECT(h), &pci_host_data_le_ops,
>                           obj, "unin-pci-conf-data", 0x1000);
>
> -    object_property_add_link(obj, "pic", TYPE_OPENPIC,
> -                             (Object **) &s->pic,
> -                             qdev_prop_allow_set_link_before_realize,
> -                             0);
> -
>     sysbus_init_mmio(sbd, &h->conf_mem);
>     sysbus_init_mmio(sbd, &h->data_mem);
> +
> +    qdev_init_gpio_out(DEVICE(obj), s->irqs, ARRAY_SIZE(s->irqs));
> }
>
> static void unin_main_pci_host_realize(PCIDevice *d, Error **errp)
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 6f5ef2e782..7a8dc09c8d 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -303,8 +303,6 @@ static void ppc_core99_init(MachineState *machine)
>         /* 970 gets a U3 bus */
>         /* Uninorth AGP bus */
>         dev = qdev_new(TYPE_U3_AGP_HOST_BRIDGE);
> -        object_property_set_link(OBJECT(dev), "pic", OBJECT(pic_dev),
> -                                 &error_abort);
>         sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>         uninorth_pci = U3_AGP_HOST_BRIDGE(dev);
>         s = SYS_BUS_DEVICE(dev);
> @@ -317,32 +315,38 @@ static void ppc_core99_init(MachineState *machine)
>         sysbus_mmio_map(s, 0, 0xf0800000);
>         sysbus_mmio_map(s, 1, 0xf0c00000);
>
> +        for (i = 0; i < 4; i++) {

Philippe had a series that replaced all these with PCI_NUM_IRQS or similar 
constant. Should you use that instead in new additions?

This is probably not modelled faithfuly (the whole mac99 machine is a hack 
to get the most OSes run, not emulating an actual machine) but I wonder if 
it's correct to connect all these irqs for all the different busses to the 
same pic lines? Is that how it is on a real PowerMac3,1? (This is just a 
question not something that should be fixed in this patch which is a nice 
clean up anyway, this just made it more obvious to me what's happening so 
maybe we can find out a difference in emulation compared to real hardware 
that could be fixed in the future.)

Regards,
BALATON Zoltan

> +            qdev_connect_gpio_out(dev, i, qdev_get_gpio_in(pic_dev, 0x1b + i));
> +        }
> +
>         machine_arch = ARCH_MAC99_U3;
>     } else {
>         /* Use values found on a real PowerMac */
>         /* Uninorth AGP bus */
>         dev = qdev_new(TYPE_UNI_NORTH_AGP_HOST_BRIDGE);
> -        object_property_set_link(OBJECT(dev), "pic", OBJECT(pic_dev),
> -                                 &error_abort);
>         s = SYS_BUS_DEVICE(dev);
>         sysbus_realize_and_unref(s, &error_fatal);
>         sysbus_mmio_map(s, 0, 0xf0800000);
>         sysbus_mmio_map(s, 1, 0xf0c00000);
>
> +        for (i = 0; i < 4; i++) {
> +            qdev_connect_gpio_out(dev, i, qdev_get_gpio_in(pic_dev, 0x1b + i));
> +        }
> +
>         /* Uninorth internal bus */
>         dev = qdev_new(TYPE_UNI_NORTH_INTERNAL_PCI_HOST_BRIDGE);
> -        object_property_set_link(OBJECT(dev), "pic", OBJECT(pic_dev),
> -                                 &error_abort);
>         s = SYS_BUS_DEVICE(dev);
>         sysbus_realize_and_unref(s, &error_fatal);
>         sysbus_mmio_map(s, 0, 0xf4800000);
>         sysbus_mmio_map(s, 1, 0xf4c00000);
>
> +        for (i = 0; i < 4; i++) {
> +            qdev_connect_gpio_out(dev, i, qdev_get_gpio_in(pic_dev, 0x1b + i));
> +        }
> +
>         /* Uninorth main bus */
>         dev = qdev_new(TYPE_UNI_NORTH_PCI_HOST_BRIDGE);
>         qdev_prop_set_uint32(dev, "ofw-addr", 0xf2000000);
> -        object_property_set_link(OBJECT(dev), "pic", OBJECT(pic_dev),
> -                                 &error_abort);
>         sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>         uninorth_pci = UNI_NORTH_PCI_HOST_BRIDGE(dev);
>         s = SYS_BUS_DEVICE(dev);
> @@ -355,6 +359,10 @@ static void ppc_core99_init(MachineState *machine)
>         sysbus_mmio_map(s, 0, 0xf2800000);
>         sysbus_mmio_map(s, 1, 0xf2c00000);
>
> +        for (i = 0; i < 4; i++) {
> +            qdev_connect_gpio_out(dev, i, qdev_get_gpio_in(pic_dev, 0x1b + i));
> +        }
> +
>         machine_arch = ARCH_MAC99;
>     }
>
> diff --git a/include/hw/pci-host/uninorth.h b/include/hw/pci-host/uninorth.h
> index a6ba5f21a8..62bd81e721 100644
> --- a/include/hw/pci-host/uninorth.h
> +++ b/include/hw/pci-host/uninorth.h
> @@ -26,7 +26,6 @@
> #define UNINORTH_H
>
> #include "hw/pci/pci_host.h"
> -#include "hw/ppc/openpic.h"
> #include "qom/object.h"
>
> /* UniNorth version */
> @@ -51,7 +50,6 @@ struct UNINHostState {
>     PCIHostState parent_obj;
>
>     uint32_t ofw_addr;
> -    OpenPICState *pic;
>     qemu_irq irqs[4];
>     MemoryRegion pci_mmio;
>     MemoryRegion pci_hole;
>

