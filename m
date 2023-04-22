Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E24256EBAC4
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 19:56:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqHRn-0008GX-6u; Sat, 22 Apr 2023 13:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pqHRk-0008Dx-PH; Sat, 22 Apr 2023 13:54:52 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pqHRh-00071J-Vf; Sat, 22 Apr 2023 13:54:52 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7CF87746376;
 Sat, 22 Apr 2023 19:53:13 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E30E6746369; Sat, 22 Apr 2023 19:53:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E18F574634B;
 Sat, 22 Apr 2023 19:53:12 +0200 (CEST)
Date: Sat, 22 Apr 2023 19:53:12 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, John Snow <jsnow@redhat.com>, 
 Huacai Chen <chenhuacai@kernel.org>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 08/13] hw/ide: Rename PCIIDEState::*_bar attributes
In-Reply-To: <20230422150728.176512-9-shentey@gmail.com>
Message-ID: <3fc5ca3a-f0ec-70d5-fee5-705a5775023c@eik.bme.hu>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-9-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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

On Sat, 22 Apr 2023, Bernhard Beschow wrote:
> The attributes represent memory regions containing operations which are mapped
> by the device models into PCI BARs. Reflect this by changing the suffic into
> "_ops".
>
> Note that in a few commits piix will also use the {cmd,data}_ops but won't map
> them into BARs. This further suggests that the "_bar" suffix doesn't match
> very well.

I'm not sure about this. Ops is typically used for read/write functions of 
an io MemeoryRegion while these are typically regions of a PCI IDE 
contoller that are mapped via BARs so calling them bar looks OK to me and 
this patch seems to be just code churn so I'd just drop this if there's no 
good reason to keep it.

Regards,
BALATON Zoltan

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> include/hw/ide/pci.h |  6 +++---
> hw/ide/cmd646.c      | 10 +++++-----
> hw/ide/pci.c         | 18 +++++++++---------
> hw/ide/piix.c        |  2 +-
> hw/ide/via.c         | 10 +++++-----
> 5 files changed, 23 insertions(+), 23 deletions(-)
>
> diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
> index 597c77c7ad..5025df5b82 100644
> --- a/include/hw/ide/pci.h
> +++ b/include/hw/ide/pci.h
> @@ -51,9 +51,9 @@ struct PCIIDEState {
>     BMDMAState bmdma[2];
>     qemu_irq isa_irq[2];
>     uint32_t secondary; /* used only for cmd646 */
> -    MemoryRegion bmdma_bar;
> -    MemoryRegion cmd_bar[2];
> -    MemoryRegion data_bar[2];
> +    MemoryRegion bmdma_ops;
> +    MemoryRegion cmd_ops[2];
> +    MemoryRegion data_ops[2];
> };
>
> void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d);
> diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
> index 85716aaf17..b9d005a357 100644
> --- a/hw/ide/cmd646.c
> +++ b/hw/ide/cmd646.c
> @@ -251,13 +251,13 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Error **errp)
>     dev->wmask[MRDMODE] = 0x0;
>     dev->w1cmask[MRDMODE] = MRDMODE_INTR_CH0 | MRDMODE_INTR_CH1;
>
> -    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar[0]);
> -    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[0]);
> -    pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar[1]);
> -    pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
> +    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &d->data_ops[0]);
> +    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_ops[0]);
> +    pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &d->data_ops[1]);
> +    pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_ops[1]);
>
>     bmdma_init_ops(d, &cmd646_bmdma_ops);
> -    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
> +    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_ops);
>
>     /* TODO: RST# value should be 0 */
>     pci_conf[PCI_INTERRUPT_PIN] = 0x01; // interrupt on pin 1
> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
> index a9194313bd..b2fcc00a64 100644
> --- a/hw/ide/pci.c
> +++ b/hw/ide/pci.c
> @@ -527,15 +527,15 @@ void bmdma_init_ops(PCIIDEState *d, const MemoryRegionOps *bmdma_ops)
> {
>     size_t i;
>
> -    memory_region_init(&d->bmdma_bar, OBJECT(d), "bmdma-container", 16);
> +    memory_region_init(&d->bmdma_ops, OBJECT(d), "bmdma-container", 16);
>     for (i = 0; i < ARRAY_SIZE(d->bmdma); i++) {
>         BMDMAState *bm = &d->bmdma[i];
>
>         memory_region_init_io(&bm->extra_io, OBJECT(d), bmdma_ops, bm, "bmdma-ops", 4);
> -        memory_region_add_subregion(&d->bmdma_bar, i * 8, &bm->extra_io);
> +        memory_region_add_subregion(&d->bmdma_ops, i * 8, &bm->extra_io);
>         memory_region_init_io(&bm->addr_ioport, OBJECT(d), &bmdma_addr_ioport_ops, bm,
>                               "bmdma-ioport-ops", 4);
> -        memory_region_add_subregion(&d->bmdma_bar, i * 8 + 4, &bm->addr_ioport);
> +        memory_region_add_subregion(&d->bmdma_ops, i * 8 + 4, &bm->addr_ioport);
>     }
> }
>
> @@ -543,14 +543,14 @@ static void pci_ide_init(Object *obj)
> {
>     PCIIDEState *d = PCI_IDE(obj);
>
> -    memory_region_init_io(&d->data_bar[0], OBJECT(d), &pci_ide_data_le_ops,
> +    memory_region_init_io(&d->data_ops[0], OBJECT(d), &pci_ide_data_le_ops,
>                           &d->bus[0], "pci-ide0-data-ops", 8);
> -    memory_region_init_io(&d->cmd_bar[0], OBJECT(d), &pci_ide_cmd_le_ops,
> +    memory_region_init_io(&d->cmd_ops[0], OBJECT(d), &pci_ide_cmd_le_ops,
>                           &d->bus[0], "pci-ide0-cmd-ops", 4);
>
> -    memory_region_init_io(&d->data_bar[1], OBJECT(d), &pci_ide_data_le_ops,
> +    memory_region_init_io(&d->data_ops[1], OBJECT(d), &pci_ide_data_le_ops,
>                           &d->bus[1], "pci-ide1-data-ops", 8);
> -    memory_region_init_io(&d->cmd_bar[1], OBJECT(d), &pci_ide_cmd_le_ops,
> +    memory_region_init_io(&d->cmd_ops[1], OBJECT(d), &pci_ide_cmd_le_ops,
>                           &d->bus[1], "pci-ide1-cmd-ops", 4);
>
>     qdev_init_gpio_out(DEVICE(d), d->isa_irq, ARRAY_SIZE(d->isa_irq));
> @@ -562,8 +562,8 @@ static void pci_ide_exitfn(PCIDevice *dev)
>     unsigned i;
>
>     for (i = 0; i < ARRAY_SIZE(d->bmdma); ++i) {
> -        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].extra_io);
> -        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].addr_ioport);
> +        memory_region_del_subregion(&d->bmdma_ops, &d->bmdma[i].extra_io);
> +        memory_region_del_subregion(&d->bmdma_ops, &d->bmdma[i].addr_ioport);
>     }
> }
>
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index 5611473d37..6942b484f9 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -140,7 +140,7 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>     pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
>
>     bmdma_init_ops(d, &piix_bmdma_ops);
> -    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
> +    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_ops);
>
>     for (unsigned i = 0; i < 2; i++) {
>         if (!pci_piix_init_bus(d, i, errp)) {
> diff --git a/hw/ide/via.c b/hw/ide/via.c
> index 704a8024cb..35dd97e49b 100644
> --- a/hw/ide/via.c
> +++ b/hw/ide/via.c
> @@ -154,13 +154,13 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
>     dev->wmask[PCI_INTERRUPT_LINE] = 0;
>     dev->wmask[PCI_CLASS_PROG] = 5;
>
> -    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar[0]);
> -    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[0]);
> -    pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar[1]);
> -    pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
> +    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &d->data_ops[0]);
> +    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_ops[0]);
> +    pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &d->data_ops[1]);
> +    pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_ops[1]);
>
>     bmdma_init_ops(d, &via_bmdma_ops);
> -    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
> +    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_ops);
>
>     qdev_init_gpio_in(ds, via_ide_set_irq, ARRAY_SIZE(d->bus));
>     for (i = 0; i < ARRAY_SIZE(d->bus); i++) {
>

