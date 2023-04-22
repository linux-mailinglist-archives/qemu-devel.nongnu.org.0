Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C80966EBABC
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 19:36:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqH9k-0004FK-Au; Sat, 22 Apr 2023 13:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pqH9c-0004Ef-DQ; Sat, 22 Apr 2023 13:36:08 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pqH9Z-0003sO-Gu; Sat, 22 Apr 2023 13:36:07 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BA4387462DB;
 Sat, 22 Apr 2023 19:34:30 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6924B745720; Sat, 22 Apr 2023 19:34:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 678427456E3;
 Sat, 22 Apr 2023 19:34:30 +0200 (CEST)
Date: Sat, 22 Apr 2023 19:34:30 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, John Snow <jsnow@redhat.com>, 
 Huacai Chen <chenhuacai@kernel.org>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 05/13] hw/ide: Extract pci_ide_class_init()
In-Reply-To: <20230422150728.176512-6-shentey@gmail.com>
Message-ID: <b5037537-1b13-38c0-5c58-486ef7ad38b1@eik.bme.hu>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-6-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sat, 22 Apr 2023, Bernhard Beschow wrote:
> Resolves redundant code in every PCI IDE device model.

This patch could be broken up a bit more as it seems to do unrelated 
changes. Such as setting DEVICE_CATEGORY_STORAGE in a different way could 
be a separate patch to make it simpler to review.

Regards,
BALATON Zoltan

> ---
> include/hw/ide/pci.h |  1 -
> hw/ide/cmd646.c      | 15 ---------------
> hw/ide/pci.c         | 25 ++++++++++++++++++++++++-
> hw/ide/piix.c        | 19 -------------------
> hw/ide/sii3112.c     |  3 ++-
> hw/ide/via.c         | 15 ---------------
> 6 files changed, 26 insertions(+), 52 deletions(-)
>
> diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
> index 74c127e32f..7bc4e53d02 100644
> --- a/include/hw/ide/pci.h
> +++ b/include/hw/ide/pci.h
> @@ -61,7 +61,6 @@ void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
> extern MemoryRegionOps bmdma_addr_ioport_ops;
> void pci_ide_create_devs(PCIDevice *dev);
>
> -extern const VMStateDescription vmstate_ide_pci;
> extern const MemoryRegionOps pci_ide_cmd_le_ops;
> extern const MemoryRegionOps pci_ide_data_le_ops;
> #endif
> diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
> index a094a6e12a..9aabf80e52 100644
> --- a/hw/ide/cmd646.c
> +++ b/hw/ide/cmd646.c
> @@ -301,17 +301,6 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Error **errp)
>     }
> }
>
> -static void pci_cmd646_ide_exitfn(PCIDevice *dev)
> -{
> -    PCIIDEState *d = PCI_IDE(dev);
> -    unsigned i;
> -
> -    for (i = 0; i < 2; ++i) {
> -        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].extra_io);
> -        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].addr_ioport);
> -    }
> -}
> -
> static Property cmd646_ide_properties[] = {
>     DEFINE_PROP_UINT32("secondary", PCIIDEState, secondary, 0),
>     DEFINE_PROP_END_OF_LIST(),
> @@ -323,17 +312,13 @@ static void cmd646_ide_class_init(ObjectClass *klass, void *data)
>     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>
>     dc->reset = cmd646_reset;
> -    dc->vmsd = &vmstate_ide_pci;
>     k->realize = pci_cmd646_ide_realize;
> -    k->exit = pci_cmd646_ide_exitfn;
>     k->vendor_id = PCI_VENDOR_ID_CMD;
>     k->device_id = PCI_DEVICE_ID_CMD_646;
>     k->revision = 0x07;
> -    k->class_id = PCI_CLASS_STORAGE_IDE;
>     k->config_read = cmd646_pci_config_read;
>     k->config_write = cmd646_pci_config_write;
>     device_class_set_props(dc, cmd646_ide_properties);
> -    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> }
>
> static const TypeInfo cmd646_ide_info = {
> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
> index 67e0998ff0..8bea92e394 100644
> --- a/hw/ide/pci.c
> +++ b/hw/ide/pci.c
> @@ -467,7 +467,7 @@ static int ide_pci_post_load(void *opaque, int version_id)
>     return 0;
> }
>
> -const VMStateDescription vmstate_ide_pci = {
> +static const VMStateDescription vmstate_ide_pci = {
>     .name = "ide",
>     .version_id = 3,
>     .minimum_version_id = 0,
> @@ -530,11 +530,34 @@ static void pci_ide_init(Object *obj)
>     qdev_init_gpio_out(DEVICE(d), d->isa_irq, ARRAY_SIZE(d->isa_irq));
> }
>
> +static void pci_ide_exitfn(PCIDevice *dev)
> +{
> +    PCIIDEState *d = PCI_IDE(dev);
> +    unsigned i;
> +
> +    for (i = 0; i < ARRAY_SIZE(d->bmdma); ++i) {
> +        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].extra_io);
> +        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].addr_ioport);
> +    }
> +}
> +
> +static void pci_ide_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> +
> +    dc->vmsd = &vmstate_ide_pci;
> +    k->exit = pci_ide_exitfn;
> +    k->class_id = PCI_CLASS_STORAGE_IDE;
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> +}
> +
> static const TypeInfo pci_ide_type_info = {
>     .name = TYPE_PCI_IDE,
>     .parent = TYPE_PCI_DEVICE,
>     .instance_size = sizeof(PCIIDEState),
>     .instance_init = pci_ide_init,
> +    .class_init = pci_ide_class_init,
>     .abstract = true,
>     .interfaces = (InterfaceInfo[]) {
>         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index a32f7ccece..4e6ca99123 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -159,8 +159,6 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>     bmdma_setup_bar(d);
>     pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
>
> -    vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
> -
>     for (unsigned i = 0; i < 2; i++) {
>         if (!pci_piix_init_bus(d, i, errp)) {
>             return;
> @@ -168,17 +166,6 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>     }
> }
>
> -static void pci_piix_ide_exitfn(PCIDevice *dev)
> -{
> -    PCIIDEState *d = PCI_IDE(dev);
> -    unsigned i;
> -
> -    for (i = 0; i < 2; ++i) {
> -        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].extra_io);
> -        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].addr_ioport);
> -    }
> -}
> -
> /* NOTE: for the PIIX3, the IRQs and IOports are hardcoded */
> static void piix3_ide_class_init(ObjectClass *klass, void *data)
> {
> @@ -187,11 +174,8 @@ static void piix3_ide_class_init(ObjectClass *klass, void *data)
>
>     dc->reset = piix_ide_reset;
>     k->realize = pci_piix_ide_realize;
> -    k->exit = pci_piix_ide_exitfn;
>     k->vendor_id = PCI_VENDOR_ID_INTEL;
>     k->device_id = PCI_DEVICE_ID_INTEL_82371SB_1;
> -    k->class_id = PCI_CLASS_STORAGE_IDE;
> -    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>     dc->hotpluggable = false;
> }
>
> @@ -209,11 +193,8 @@ static void piix4_ide_class_init(ObjectClass *klass, void *data)
>
>     dc->reset = piix_ide_reset;
>     k->realize = pci_piix_ide_realize;
> -    k->exit = pci_piix_ide_exitfn;
>     k->vendor_id = PCI_VENDOR_ID_INTEL;
>     k->device_id = PCI_DEVICE_ID_INTEL_82371AB;
> -    k->class_id = PCI_CLASS_STORAGE_IDE;
> -    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>     dc->hotpluggable = false;
> }
>
> diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
> index 5dd3d03c29..0af897a9ef 100644
> --- a/hw/ide/sii3112.c
> +++ b/hw/ide/sii3112.c
> @@ -301,9 +301,10 @@ static void sii3112_pci_class_init(ObjectClass *klass, void *data)
>     pd->class_id = PCI_CLASS_STORAGE_RAID;
>     pd->revision = 1;
>     pd->realize = sii3112_pci_realize;
> +    pd->exit = NULL;
>     dc->reset = sii3112_reset;
> +    dc->vmsd = NULL;
>     dc->desc = "SiI3112A SATA controller";
> -    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> }
>
> static const TypeInfo sii3112_pci_info = {
> diff --git a/hw/ide/via.c b/hw/ide/via.c
> index 91253fa4ef..287143a005 100644
> --- a/hw/ide/via.c
> +++ b/hw/ide/via.c
> @@ -200,34 +200,19 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
>     }
> }
>
> -static void via_ide_exitfn(PCIDevice *dev)
> -{
> -    PCIIDEState *d = PCI_IDE(dev);
> -    unsigned i;
> -
> -    for (i = 0; i < ARRAY_SIZE(d->bmdma); ++i) {
> -        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].extra_io);
> -        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].addr_ioport);
> -    }
> -}
> -
> static void via_ide_class_init(ObjectClass *klass, void *data)
> {
>     DeviceClass *dc = DEVICE_CLASS(klass);
>     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>
>     dc->reset = via_ide_reset;
> -    dc->vmsd = &vmstate_ide_pci;
>     /* Reason: only works as function of VIA southbridge */
>     dc->user_creatable = false;
>
>     k->realize = via_ide_realize;
> -    k->exit = via_ide_exitfn;
>     k->vendor_id = PCI_VENDOR_ID_VIA;
>     k->device_id = PCI_DEVICE_ID_VIA_IDE;
>     k->revision = 0x06;
> -    k->class_id = PCI_CLASS_STORAGE_IDE;
> -    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> }
>
> static const TypeInfo via_ide_info = {
>

