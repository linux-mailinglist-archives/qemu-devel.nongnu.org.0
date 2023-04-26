Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A306EF30D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 13:05:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcx3-0004lh-FR; Wed, 26 Apr 2023 07:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prcwz-0004l8-Ak; Wed, 26 Apr 2023 07:04:41 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prcwx-000839-A5; Wed, 26 Apr 2023 07:04:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QQOOEE4k+gusRFmc0kpUrh585qmPn0WZyEKKHAtYqBQ=; b=Jvc83GGQw2xWi8z1xLA4xwbo0a
 IXGyPuIaRQx1Z8re3ZYmm76ghXUNrqxYsXi1r7pXM4+se/FYCqwVGabeZpvHKllvQ97cElh0PzTie
 twQsiA/IOzGaHQ0UjBn1wZmZLy29QVx2PK76KwasnsDvyUCPWq9kFaUWsJ64Px6N7dG2RTTJQPwIF
 JLcemSycoVNZsXP4eNUxhulBhkQZnAUL6NEMzTXhddngDJbLXxoLe0I9B1KYFEUDjda3EBFXN990U
 XMxw1+ydGmMQUoeT4msD00QPYEHXKYyAP5JiI0I5wfCikqU40QqYlRdmGtSoerpSARh5JlTREHqmK
 MHSMYl4TyVHX6fQ21d1JCnwcVfVTA5lrZBdyTCquLVD75zPD+PxCTosBhCv78nm19mob5FVEnALiI
 0Q9+MRuj5FFX30wIMiUfVEprwxVWlNiIBJ6Vq9BEUks51TDjcthLqg7L3/9dU+Obju7izKAH4KyrR
 3bWDv9z9OAXapU77p1ZVQvQcdTy7EMTc9GiQ7vbWdk7mYfnaoJY3A1Tru/xvsp541yJNlqZkfc0cp
 mBWIPI7WLn9dIubWt/5Pk7vVzgJCjAVnTWnPA8tkQPQM7C0qTEP0mzgQlb+NCVrKtLRdrrMIEvolh
 PESuRCT3diOFlboeHLWFX187iDL8pDeBmnvDaodHM=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prcvy-0001qc-FT; Wed, 26 Apr 2023 12:03:39 +0100
Message-ID: <811f068f-de53-dd81-b360-6b95930a237f@ilande.co.uk>
Date: Wed, 26 Apr 2023 12:04:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-6-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230422150728.176512-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 05/13] hw/ide: Extract pci_ide_class_init()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 22/04/2023 16:07, Bernhard Beschow wrote:

> Resolves redundant code in every PCI IDE device model.

I think this needs to mention that it's moving the PCIDeviceClass::exit() function 
from all of the PCI IDE controller implementations to a common implementation in the 
parent PCI_IDE type.

> ---
>   include/hw/ide/pci.h |  1 -
>   hw/ide/cmd646.c      | 15 ---------------
>   hw/ide/pci.c         | 25 ++++++++++++++++++++++++-
>   hw/ide/piix.c        | 19 -------------------
>   hw/ide/sii3112.c     |  3 ++-
>   hw/ide/via.c         | 15 ---------------
>   6 files changed, 26 insertions(+), 52 deletions(-)
> 
> diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
> index 74c127e32f..7bc4e53d02 100644
> --- a/include/hw/ide/pci.h
> +++ b/include/hw/ide/pci.h
> @@ -61,7 +61,6 @@ void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
>   extern MemoryRegionOps bmdma_addr_ioport_ops;
>   void pci_ide_create_devs(PCIDevice *dev);
>   
> -extern const VMStateDescription vmstate_ide_pci;
>   extern const MemoryRegionOps pci_ide_cmd_le_ops;
>   extern const MemoryRegionOps pci_ide_data_le_ops;
>   #endif
> diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
> index a094a6e12a..9aabf80e52 100644
> --- a/hw/ide/cmd646.c
> +++ b/hw/ide/cmd646.c
> @@ -301,17 +301,6 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Error **errp)
>       }
>   }
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
>   static Property cmd646_ide_properties[] = {
>       DEFINE_PROP_UINT32("secondary", PCIIDEState, secondary, 0),
>       DEFINE_PROP_END_OF_LIST(),
> @@ -323,17 +312,13 @@ static void cmd646_ide_class_init(ObjectClass *klass, void *data)
>       PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>   
>       dc->reset = cmd646_reset;
> -    dc->vmsd = &vmstate_ide_pci;
>       k->realize = pci_cmd646_ide_realize;
> -    k->exit = pci_cmd646_ide_exitfn;
>       k->vendor_id = PCI_VENDOR_ID_CMD;
>       k->device_id = PCI_DEVICE_ID_CMD_646;
>       k->revision = 0x07;
> -    k->class_id = PCI_CLASS_STORAGE_IDE;
>       k->config_read = cmd646_pci_config_read;
>       k->config_write = cmd646_pci_config_write;
>       device_class_set_props(dc, cmd646_ide_properties);
> -    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>   }
>   
>   static const TypeInfo cmd646_ide_info = {
> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
> index 67e0998ff0..8bea92e394 100644
> --- a/hw/ide/pci.c
> +++ b/hw/ide/pci.c
> @@ -467,7 +467,7 @@ static int ide_pci_post_load(void *opaque, int version_id)
>       return 0;
>   }
>   
> -const VMStateDescription vmstate_ide_pci = {
> +static const VMStateDescription vmstate_ide_pci = {
>       .name = "ide",
>       .version_id = 3,
>       .minimum_version_id = 0,
> @@ -530,11 +530,34 @@ static void pci_ide_init(Object *obj)
>       qdev_init_gpio_out(DEVICE(d), d->isa_irq, ARRAY_SIZE(d->isa_irq));
>   }
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
>   static const TypeInfo pci_ide_type_info = {
>       .name = TYPE_PCI_IDE,
>       .parent = TYPE_PCI_DEVICE,
>       .instance_size = sizeof(PCIIDEState),
>       .instance_init = pci_ide_init,
> +    .class_init = pci_ide_class_init,
>       .abstract = true,
>       .interfaces = (InterfaceInfo[]) {
>           { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index a32f7ccece..4e6ca99123 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -159,8 +159,6 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>       bmdma_setup_bar(d);
>       pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
>   
> -    vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
> -

Presumably this still survives migration between a pre-series and post-series QEMU 
using the PIIX IDE controller?

>       for (unsigned i = 0; i < 2; i++) {
>           if (!pci_piix_init_bus(d, i, errp)) {
>               return;
> @@ -168,17 +166,6 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>       }
>   }
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
>   /* NOTE: for the PIIX3, the IRQs and IOports are hardcoded */
>   static void piix3_ide_class_init(ObjectClass *klass, void *data)
>   {
> @@ -187,11 +174,8 @@ static void piix3_ide_class_init(ObjectClass *klass, void *data)
>   
>       dc->reset = piix_ide_reset;
>       k->realize = pci_piix_ide_realize;
> -    k->exit = pci_piix_ide_exitfn;
>       k->vendor_id = PCI_VENDOR_ID_INTEL;
>       k->device_id = PCI_DEVICE_ID_INTEL_82371SB_1;
> -    k->class_id = PCI_CLASS_STORAGE_IDE;
> -    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>       dc->hotpluggable = false;
>   }
>   
> @@ -209,11 +193,8 @@ static void piix4_ide_class_init(ObjectClass *klass, void *data)
>   
>       dc->reset = piix_ide_reset;
>       k->realize = pci_piix_ide_realize;
> -    k->exit = pci_piix_ide_exitfn;
>       k->vendor_id = PCI_VENDOR_ID_INTEL;
>       k->device_id = PCI_DEVICE_ID_INTEL_82371AB;
> -    k->class_id = PCI_CLASS_STORAGE_IDE;
> -    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>       dc->hotpluggable = false;
>   }
>   
> diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
> index 5dd3d03c29..0af897a9ef 100644
> --- a/hw/ide/sii3112.c
> +++ b/hw/ide/sii3112.c
> @@ -301,9 +301,10 @@ static void sii3112_pci_class_init(ObjectClass *klass, void *data)
>       pd->class_id = PCI_CLASS_STORAGE_RAID;
>       pd->revision = 1;
>       pd->realize = sii3112_pci_realize;
> +    pd->exit = NULL;
>       dc->reset = sii3112_reset;
> +    dc->vmsd = NULL;
>       dc->desc = "SiI3112A SATA controller";
> -    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>   }

No need to set explicit NULLs here: class/object structures are all zeroed before 
init (unless you're deliberately trying to prevent the common PCIDeviceClass::exit() 
function from being called here temporarily?)

>   static const TypeInfo sii3112_pci_info = {
> diff --git a/hw/ide/via.c b/hw/ide/via.c
> index 91253fa4ef..287143a005 100644
> --- a/hw/ide/via.c
> +++ b/hw/ide/via.c
> @@ -200,34 +200,19 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
>       }
>   }
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
>   static void via_ide_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
>       PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>   
>       dc->reset = via_ide_reset;
> -    dc->vmsd = &vmstate_ide_pci;
>       /* Reason: only works as function of VIA southbridge */
>       dc->user_creatable = false;
>   
>       k->realize = via_ide_realize;
> -    k->exit = via_ide_exitfn;
>       k->vendor_id = PCI_VENDOR_ID_VIA;
>       k->device_id = PCI_DEVICE_ID_VIA_IDE;
>       k->revision = 0x06;
> -    k->class_id = PCI_CLASS_STORAGE_IDE;
> -    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>   }
>   
>   static const TypeInfo via_ide_info = {

A couple of queries, but generally looks good to me.


ATB,

Mark.

