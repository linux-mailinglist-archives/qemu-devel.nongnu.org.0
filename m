Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF064AA9BD
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 16:51:33 +0100 (CET)
Received: from localhost ([::1]:44512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGNLX-0001tO-U3
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 10:51:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nGNIp-0007y5-EB
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 10:48:43 -0500
Received: from [2001:738:2001:2001::2001] (port=29501 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nGNIl-00008M-6z
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 10:48:42 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4574F745708;
 Sat,  5 Feb 2022 16:48:34 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 095D1745706; Sat,  5 Feb 2022 16:48:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 07B2F745712;
 Sat,  5 Feb 2022 16:48:34 +0100 (CET)
Date: Sat, 5 Feb 2022 16:48:34 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Liav Albani <liavalb@gmail.com>
Subject: Re: [PATCH] hw/ide: implement ich6 ide controller support
In-Reply-To: <20220205111138.35194-1-liavalb@gmail.com>
Message-ID: <65ad680-dc5a-6720-7ef4-84d3af3e4998@eik.bme.hu>
References: <20220205111138.35194-1-liavalb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 5 Feb 2022, Liav Albani wrote:
> This type of IDE controller has support for relocating the IO ports and
> doesn't use IRQ 14 and 15 but one allocated PCI IRQ for the controller.

I haven't looked at in detail so only a few comments I've got while 
reading it. What machine needs this? In QEMU I think we only have piix and 
ich9 emulated for pc and q35 machines but maybe ich6 is also used by some 
machine I don't know about. Otherwise it looks odd to have ide part of 
ich6 but not the other parts of this chip.

> Signed-off-by: Liav Albani <liavalb@gmail.com>
> ---
> hw/i386/Kconfig          |   2 +
> hw/ide/Kconfig           |   5 +
> hw/ide/bmdma.c           |  83 +++++++++++++++
> hw/ide/ich6.c            | 211 +++++++++++++++++++++++++++++++++++++++
> hw/ide/meson.build       |   3 +-
> hw/ide/piix.c            |  50 +---------
> include/hw/ide/pci.h     |   5 +
> include/hw/pci/pci_ids.h |   1 +
> 8 files changed, 311 insertions(+), 49 deletions(-)
> create mode 100644 hw/ide/bmdma.c
> create mode 100644 hw/ide/ich6.c
>
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index d22ac4a4b9..a18de2d962 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -75,6 +75,7 @@ config I440FX
>     select PCI_I440FX
>     select PIIX3
>     select IDE_PIIX
> +    select IDE_ICH6
>     select DIMM
>     select SMBIOS
>     select FW_CFG_DMA
> @@ -101,6 +102,7 @@ config Q35
>     select PCI_EXPRESS_Q35
>     select LPC_ICH9
>     select AHCI_ICH9
> +    select IDE_ICH6
>     select DIMM
>     select SMBIOS
>     select FW_CFG_DMA
> diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
> index dd85fa3619..63304325a5 100644
> --- a/hw/ide/Kconfig
> +++ b/hw/ide/Kconfig
> @@ -38,6 +38,11 @@ config IDE_VIA
>     select IDE_PCI
>     select IDE_QDEV
>
> +config IDE_ICH6
> +    bool
> +    select IDE_PCI
> +    select IDE_QDEV
> +
> config MICRODRIVE
>     bool
>     select IDE_QDEV
> diff --git a/hw/ide/bmdma.c b/hw/ide/bmdma.c
> new file mode 100644
> index 0000000000..979f5974fd
> --- /dev/null
> +++ b/hw/ide/bmdma.c
> @@ -0,0 +1,83 @@
> +/*
> + * QEMU IDE Emulation: PCI PIIX3/4 support.
> + *
> + * Copyright (c) 2003 Fabrice Bellard
> + * Copyright (c) 2006 Openedhand Ltd.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/pci/pci.h"
> +#include "migration/vmstate.h"
> +#include "qapi/error.h"
> +#include "qemu/module.h"
> +#include "sysemu/block-backend.h"
> +#include "sysemu/blockdev.h"
> +#include "sysemu/dma.h"
> +
> +#include "hw/ide/pci.h"
> +#include "trace.h"
> +
> +uint64_t piix_bmdma_read(void *opaque, hwaddr addr, unsigned size)

Moving these functions to avoid duplication is a good idea but a couple of 
points:

- Maybe this should be a separate patch just for moving these out then 
another patch adding ich6 for easier review of separate changes.

- There are already several bmdma_* functions in pci.c and you add these 
to pci.h so maybe these should be moved near there in pci.c instead. (Or 
more of those bmdma_* functions moved in this new file and add its own 
header?)

- This is not piix specific so the name probably should not say that. 
Maybe somthing along the lines of pci_default_read_config so 
bmdma_default_read or similar. In fact it also appears in via.c and a more 
complex version in cmd646.c which could still reuse functions like these 
like we do with pci config write. Converting those other two to use the 
newly split off functions instead of duplicating it could be done in a 
follow up patch, if you don't want to do that I may look at via-ide but a 
patch is welcome if you have time for that, unless others think otherwise 
and we'll take a different route.

> +{
> +    BMDMAState *bm = opaque;
> +    uint32_t val;
> +
> +    if (size != 1) {
> +        return ((uint64_t)1 << (size * 8)) - 1;
> +    }
> +
> +    switch (addr & 3) {
> +    case 0:
> +        val = bm->cmd;
> +        break;
> +    case 2:
> +        val = bm->status;
> +        break;
> +    default:
> +        val = 0xff;
> +        break;
> +    }
> +
> +    trace_bmdma_read(addr, val);
> +    return val;
> +}
> +
> +void piix_bmdma_write(void *opaque, hwaddr addr,
> +                        uint64_t val, unsigned size)
> +{
> +    BMDMAState *bm = opaque;
> +
> +    if (size != 1) {
> +        return;
> +    }
> +
> +    trace_bmdma_write(addr, val);
> +
> +    switch (addr & 3) {
> +    case 0:
> +        bmdma_cmd_writeb(bm, val);
> +        break;
> +    case 2:
> +        uint8_t cur_val = bm->status;
> +        bm->status = (val & 0x60) | (cur_val & 1) | (cur_val & ~val & 0x06);
> +        break;
> +    }
> +}
> diff --git a/hw/ide/ich6.c b/hw/ide/ich6.c
> new file mode 100644
> index 0000000000..21dbc4906b
> --- /dev/null
> +++ b/hw/ide/ich6.c
> @@ -0,0 +1,211 @@
> +/*
> + * QEMU IDE Emulation: PCI ICH6/ICH7 IDE support.
> + *
> + * Copyright (c) 2022 Liav Albani
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/pci/pci.h"
> +#include "migration/vmstate.h"
> +#include "qapi/error.h"
> +#include "qemu/module.h"
> +#include "sysemu/block-backend.h"
> +#include "sysemu/blockdev.h"
> +#include "sysemu/dma.h"
> +
> +#include "hw/ide/pci.h"
> +#include "trace.h"
> +
> +
> +
> +static const MemoryRegionOps ich6_bmdma_ops = {
> +    .read = piix_bmdma_read,
> +    .write = piix_bmdma_write,
> +};
> +
> +static void bmdma_setup_bar(PCIIDEState *d)
> +{
> +    int i;
> +
> +    memory_region_init(&d->bmdma_bar, OBJECT(d), "ich6-bmdma-container", 16);
> +    for (i = 0; i < 2; i++) {
> +        BMDMAState *bm = &d->bmdma[i];
> +
> +        memory_region_init_io(&bm->extra_io, OBJECT(d), &ich6_bmdma_ops, bm,
> +                              "ich6-bmdma", 4);
> +        memory_region_add_subregion(&d->bmdma_bar, i * 8, &bm->extra_io);
> +        memory_region_init_io(&bm->addr_ioport, OBJECT(d),
> +                              &bmdma_addr_ioport_ops, bm, "bmdma", 4);
> +        memory_region_add_subregion(&d->bmdma_bar, i * 8 + 4, &bm->addr_ioport);
> +    }
> +}
> +
> +static uint32_t ich6_pci_config_read(PCIDevice *d,
> +                                       uint32_t address, int len)
> +{
> +    return pci_default_read_config(d, address, len);
> +}

Why do you override this if you have nothing to do in it? Just use 
pci_default_read_config and only override ich6_pci_config_write where you 
actually has something to add to the default.

Maybe also wait for a few days for other's comments (especially the 
maintainer's opinion on this) before sending a v2 so you get all comments 
and see what to do.

Regards,
BALATON Zoltan

> +
> +static void ich6_pci_config_write(PCIDevice *d, uint32_t addr, uint32_t val,
> +                                    int l)
> +{
> +    uint32_t i;
> +
> +    pci_default_write_config(d, addr, val, l);
> +
> +    for (i = addr; i < addr + l; i++) {
> +        switch (i) {
> +        case 0x40:
> +            pci_default_write_config(d, i, 0x8000, 2);
> +            continue;
> +        case 0x42:
> +            pci_default_write_config(d, i, 0x8000, 2);
> +            continue;
> +        }
> +    }
> +}
> +
> +static void ich6_ide_reset(DeviceState *dev)
> +{
> +    PCIIDEState *d = PCI_IDE(dev);
> +    PCIDevice *pd = PCI_DEVICE(d);
> +    uint8_t *pci_conf = pd->config;
> +    int i;
> +
> +    for (i = 0; i < 2; i++) {
> +        ide_bus_reset(&d->bus[i]);
> +    }
> +
> +    /* TODO: this is the default. do not override. */
> +    pci_conf[PCI_COMMAND] = 0x00;
> +    /* TODO: this is the default. do not override. */
> +    pci_conf[PCI_COMMAND + 1] = 0x00;
> +    /* TODO: use pci_set_word */
> +    pci_conf[PCI_STATUS] = PCI_STATUS_FAST_BACK;
> +    pci_conf[PCI_STATUS + 1] = PCI_STATUS_DEVSEL_MEDIUM >> 8;
> +    pci_conf[0x20] = 0x01; /* BMIBA: 20-23h */
> +}
> +
> +static int pci_ich6_init_ports(PCIIDEState *d)
> +{
> +    int i;
> +
> +    for (i = 0; i < 2; i++) {
> +        ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
> +        ide_init2(&d->bus[i], d->native_irq);
> +
> +        bmdma_init(&d->bus[i], &d->bmdma[i], d);
> +        d->bmdma[i].bus = &d->bus[i];
> +        ide_register_restart_cb(&d->bus[i]);
> +    }
> +
> +    return 0;
> +}
> +
> +static void pci_ich6_ide_realize(PCIDevice *dev, Error **errp)
> +{
> +    PCIIDEState *d = PCI_IDE(dev);
> +    uint8_t *pci_conf = dev->config;
> +    int rc;
> +
> +    pci_conf[PCI_INTERRUPT_PIN] = 1; /* interrupt pin A */
> +
> +    /* PCI native mode-only controller, supports bus mastering */
> +    pci_conf[PCI_CLASS_PROG] = 0x85;
> +
> +    bmdma_setup_bar(d);
> +    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
> +
> +    d->native_irq = pci_allocate_irq(&d->parent_obj);
> +    /* Address Map Register - Non Combined Mode, MAP.USCC = 0 */
> +    pci_conf[0x90]   = 0;
> +
> +    /* IDE Decode enabled by default */
> +    pci_set_long(pci_conf + 0x40, 0x80008000);
> +
> +    /* IDE Timing control - Disable UDMA controls */
> +    pci_set_long(pci_conf + 0x48, 0x00000000);
> +
> +    vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
> +
> +    memory_region_init_io(&d->data_bar[0], OBJECT(d), &pci_ide_data_le_ops,
> +                          &d->bus[0], "ich6-ide0-data", 8);
> +    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar[0]);
> +
> +    memory_region_init_io(&d->cmd_bar[0], OBJECT(d), &pci_ide_cmd_le_ops,
> +                          &d->bus[0], "ich6-ide0-cmd", 4);
> +    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[0]);
> +
> +    memory_region_init_io(&d->data_bar[1], OBJECT(d), &pci_ide_data_le_ops,
> +                          &d->bus[1], "ich6-ide1-data", 8);
> +    pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar[1]);
> +
> +    memory_region_init_io(&d->cmd_bar[1], OBJECT(d), &pci_ide_cmd_le_ops,
> +                          &d->bus[1], "ich6-ide1-cmd", 4);
> +    pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
> +
> +    rc = pci_ich6_init_ports(d);
> +    if (rc) {
> +        error_setg_errno(errp, -rc, "Failed to realize %s",
> +                         object_get_typename(OBJECT(dev)));
> +    }
> +}
> +
> +static void pci_ich6_ide_exitfn(PCIDevice *dev)
> +{
> +    PCIIDEState *d = PCI_IDE(dev);
> +    unsigned i;
> +
> +    for (i = 0; i < 2; ++i) {
> +        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].extra_io);
> +        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].addr_ioport);
> +    }
> +}
> +
> +static void ich6_ide_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> +
> +    dc->reset = ich6_ide_reset;
> +    k->realize = pci_ich6_ide_realize;
> +    k->exit = pci_ich6_ide_exitfn;
> +    k->vendor_id = PCI_VENDOR_ID_INTEL;
> +    k->device_id = PCI_DEVICE_ID_INTEL_82801GB;
> +    k->class_id = PCI_CLASS_STORAGE_IDE;
> +    k->config_read = ich6_pci_config_read;
> +    k->config_write = ich6_pci_config_write;
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> +    dc->hotpluggable = false;
> +}
> +
> +static const TypeInfo ich6_ide_info = {
> +    .name          = "ich6-ide",
> +    .parent        = TYPE_PCI_IDE,
> +    .class_init    = ich6_ide_class_init,
> +};
> +
> +static void ich6_ide_register_types(void)
> +{
> +    type_register_static(&ich6_ide_info);
> +}
> +
> +type_init(ich6_ide_register_types)
> diff --git a/hw/ide/meson.build b/hw/ide/meson.build
> index ddcb3b28d2..6899e082db 100644
> --- a/hw/ide/meson.build
> +++ b/hw/ide/meson.build
> @@ -1,5 +1,6 @@
> softmmu_ss.add(when: 'CONFIG_AHCI', if_true: files('ahci.c'))
> softmmu_ss.add(when: 'CONFIG_AHCI_ICH9', if_true: files('ich.c'))
> +softmmu_ss.add(when: 'CONFIG_IDE_ICH6', if_true: files('ich6.c', 'bmdma.c'))
> softmmu_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('ahci-allwinner.c'))
> softmmu_ss.add(when: 'CONFIG_IDE_CMD646', if_true: files('cmd646.c'))
> softmmu_ss.add(when: 'CONFIG_IDE_CORE', if_true: files('core.c', 'atapi.c'))
> @@ -7,7 +8,7 @@ softmmu_ss.add(when: 'CONFIG_IDE_ISA', if_true: files('isa.c', 'ioport.c'))
> softmmu_ss.add(when: 'CONFIG_IDE_MACIO', if_true: files('macio.c'))
> softmmu_ss.add(when: 'CONFIG_IDE_MMIO', if_true: files('mmio.c'))
> softmmu_ss.add(when: 'CONFIG_IDE_PCI', if_true: files('pci.c'))
> -softmmu_ss.add(when: 'CONFIG_IDE_PIIX', if_true: files('piix.c', 'ioport.c'))
> +softmmu_ss.add(when: 'CONFIG_IDE_PIIX', if_true: files('piix.c', 'ioport.c', 'bmdma.c'))
> softmmu_ss.add(when: 'CONFIG_IDE_QDEV', if_true: files('qdev.c'))
> softmmu_ss.add(when: 'CONFIG_IDE_SII3112', if_true: files('sii3112.c'))
> softmmu_ss.add(when: 'CONFIG_IDE_VIA', if_true: files('via.c'))
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index ce89fd0aa3..5a747e5845 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -35,55 +35,9 @@
> #include "hw/ide/pci.h"
> #include "trace.h"
>
> -static uint64_t bmdma_read(void *opaque, hwaddr addr, unsigned size)
> -{
> -    BMDMAState *bm = opaque;
> -    uint32_t val;
> -
> -    if (size != 1) {
> -        return ((uint64_t)1 << (size * 8)) - 1;
> -    }
> -
> -    switch(addr & 3) {
> -    case 0:
> -        val = bm->cmd;
> -        break;
> -    case 2:
> -        val = bm->status;
> -        break;
> -    default:
> -        val = 0xff;
> -        break;
> -    }
> -
> -    trace_bmdma_read(addr, val);
> -    return val;
> -}
> -
> -static void bmdma_write(void *opaque, hwaddr addr,
> -                        uint64_t val, unsigned size)
> -{
> -    BMDMAState *bm = opaque;
> -
> -    if (size != 1) {
> -        return;
> -    }
> -
> -    trace_bmdma_write(addr, val);
> -
> -    switch(addr & 3) {
> -    case 0:
> -        bmdma_cmd_writeb(bm, val);
> -        break;
> -    case 2:
> -        bm->status = (val & 0x60) | (bm->status & 1) | (bm->status & ~val & 0x06);
> -        break;
> -    }
> -}
> -
> static const MemoryRegionOps piix_bmdma_ops = {
> -    .read = bmdma_read,
> -    .write = bmdma_write,
> +    .read = piix_bmdma_read,
> +    .write = piix_bmdma_write,
> };
>
> static void bmdma_setup_bar(PCIIDEState *d)
> diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
> index d8384e1c42..00c86d9ef5 100644
> --- a/include/hw/ide/pci.h
> +++ b/include/hw/ide/pci.h
> @@ -53,6 +53,7 @@ struct PCIIDEState {
>     MemoryRegion bmdma_bar;
>     MemoryRegion cmd_bar[2];
>     MemoryRegion data_bar[2];
> +    qemu_irq native_irq; /* used only for ich6-ide */
> };
>
> static inline IDEState *bmdma_active_if(BMDMAState *bmdma)
> @@ -62,6 +63,10 @@ static inline IDEState *bmdma_active_if(BMDMAState *bmdma)
> }
>
> void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d);
> +
> +uint64_t piix_bmdma_read(void *opaque, hwaddr addr, unsigned size);
> +void piix_bmdma_write(void *opaque, hwaddr addr, uint64_t val, unsigned size);
> +
> void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
> extern MemoryRegionOps bmdma_addr_ioport_ops;
> void pci_ide_create_devs(PCIDevice *dev);
> diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
> index 11abe22d46..cf8767977c 100644
> --- a/include/hw/pci/pci_ids.h
> +++ b/include/hw/pci/pci_ids.h
> @@ -244,6 +244,7 @@
> #define PCI_DEVICE_ID_INTEL_82371AB      0x7111
> #define PCI_DEVICE_ID_INTEL_82371AB_2    0x7112
> #define PCI_DEVICE_ID_INTEL_82371AB_3    0x7113
> +#define PCI_DEVICE_ID_INTEL_82801GB      0x27c0
>
> #define PCI_DEVICE_ID_INTEL_ICH9_0       0x2910
> #define PCI_DEVICE_ID_INTEL_ICH9_1       0x2917
>

