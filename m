Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C82BB6EBB6B
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 23:13:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqKWT-0003E4-DV; Sat, 22 Apr 2023 17:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pqKWQ-0003DD-U3; Sat, 22 Apr 2023 17:11:54 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pqKWO-000604-2q; Sat, 22 Apr 2023 17:11:54 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 34AA47462DB;
 Sat, 22 Apr 2023 23:10:15 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BF718745720; Sat, 22 Apr 2023 23:10:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BAA527456E3;
 Sat, 22 Apr 2023 23:10:14 +0200 (CEST)
Date: Sat, 22 Apr 2023 23:10:14 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, John Snow <jsnow@redhat.com>, 
 Huacai Chen <chenhuacai@kernel.org>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 11/13] hw/ide/sii3112: Reuse
 PCIIDEState::{cmd,data}_ops
In-Reply-To: <20230422150728.176512-12-shentey@gmail.com>
Message-ID: <468a2251-0484-ab97-217c-10d965af6c67@eik.bme.hu>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-12-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
> Allows to unexport pci_ide_{cmd,data}_le_ops and models TYPE_SII3112_PCI as a
> standard-compliant PCI IDE device.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> include/hw/ide/pci.h |  2 --
> hw/ide/pci.c         |  4 ++--
> hw/ide/sii3112.c     | 50 ++++++++++++++++----------------------------
> 3 files changed, 20 insertions(+), 36 deletions(-)
>
> diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
> index 5025df5b82..dbb4b13161 100644
> --- a/include/hw/ide/pci.h
> +++ b/include/hw/ide/pci.h
> @@ -62,6 +62,4 @@ void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
> extern MemoryRegionOps bmdma_addr_ioport_ops;
> void pci_ide_create_devs(PCIDevice *dev);
>
> -extern const MemoryRegionOps pci_ide_cmd_le_ops;
> -extern const MemoryRegionOps pci_ide_data_le_ops;
> #endif
> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
> index b2fcc00a64..97ccc75aa6 100644
> --- a/hw/ide/pci.c
> +++ b/hw/ide/pci.c
> @@ -60,7 +60,7 @@ static void pci_ide_ctrl_write(void *opaque, hwaddr addr,
>     ide_ctrl_write(bus, addr + 2, data);
> }
>
> -const MemoryRegionOps pci_ide_cmd_le_ops = {
> +static const MemoryRegionOps pci_ide_cmd_le_ops = {
>     .read = pci_ide_status_read,
>     .write = pci_ide_ctrl_write,
>     .endianness = DEVICE_LITTLE_ENDIAN,
> @@ -98,7 +98,7 @@ static void pci_ide_data_write(void *opaque, hwaddr addr,
>     }
> }
>
> -const MemoryRegionOps pci_ide_data_le_ops = {
> +static const MemoryRegionOps pci_ide_data_le_ops = {
>     .read = pci_ide_data_read,
>     .write = pci_ide_data_write,
>     .endianness = DEVICE_LITTLE_ENDIAN,
> diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
> index 0af897a9ef..9cf920369f 100644
> --- a/hw/ide/sii3112.c
> +++ b/hw/ide/sii3112.c
> @@ -88,21 +88,9 @@ static uint64_t sii3112_reg_read(void *opaque, hwaddr addr,
>         val |= (d->regs[1].confstat & (1UL << 11) ? (1 << 4) : 0);
>         val |= (uint32_t)d->i.bmdma[1].status << 16;
>         break;
> -    case 0x80 ... 0x87:
> -        val = pci_ide_data_le_ops.read(&d->i.bus[0], addr - 0x80, size);
> -        break;
> -    case 0x8a:
> -        val = pci_ide_cmd_le_ops.read(&d->i.bus[0], 2, size);
> -        break;
>     case 0xa0:
>         val = d->regs[0].confstat;
>         break;
> -    case 0xc0 ... 0xc7:
> -        val = pci_ide_data_le_ops.read(&d->i.bus[1], addr - 0xc0, size);
> -        break;
> -    case 0xca:
> -        val = pci_ide_cmd_le_ops.read(&d->i.bus[1], 2, size);
> -        break;
>     case 0xe0:
>         val = d->regs[1].confstat;
>         break;
> @@ -171,18 +159,6 @@ static void sii3112_reg_write(void *opaque, hwaddr addr,
>     case 0x0c ... 0x0f:
>         bmdma_addr_ioport_ops.write(&d->i.bmdma[1], addr - 12, val, size);
>         break;
> -    case 0x80 ... 0x87:
> -        pci_ide_data_le_ops.write(&d->i.bus[0], addr - 0x80, val, size);
> -        break;
> -    case 0x8a:
> -        pci_ide_cmd_le_ops.write(&d->i.bus[0], 2, val, size);
> -        break;
> -    case 0xc0 ... 0xc7:
> -        pci_ide_data_le_ops.write(&d->i.bus[1], addr - 0xc0, val, size);
> -        break;
> -    case 0xca:
> -        pci_ide_cmd_le_ops.write(&d->i.bus[1], 2, val, size);
> -        break;
>     case 0x100:
>         d->regs[0].scontrol = val & 0xfff;
>         if (val & 1) {
> @@ -259,6 +235,11 @@ static void sii3112_pci_realize(PCIDevice *dev, Error **errp)
>     pci_config_set_interrupt_pin(dev->config, 1);
>     pci_set_byte(dev->config + PCI_CACHE_LINE_SIZE, 8);
>
> +    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &s->data_ops[0]);
> +    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &s->cmd_ops[0]);
> +    pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &s->data_ops[1]);
> +    pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &s->cmd_ops[1]);
> +
>     /* BAR5 is in PCI memory space */
>     memory_region_init_io(&d->mmio, OBJECT(d), &sii3112_reg_ops, d,
>                          "sii3112.bar5", 0x200);
> @@ -266,17 +247,22 @@ static void sii3112_pci_realize(PCIDevice *dev, Error **errp)
>
>     /* BAR0-BAR4 are PCI I/O space aliases into BAR5 */

This patch breaks the above comment but I think you should not mess with 
BAR0-4 at all and leave to to aliased into BAR5. These have the same 
registers mirrored and some guests access them via the memory mapped BAR5 
while others prefer the io mapped BAR0-4 so removing these from BAR5 would 
break some guests. If you want to remove something from BAR5 and map 
subregions implementing those instead then I think only BAR5 needs to be 
chnaged or I'm not getting what is happening here so a more detailed 
commit message would be needed.

Was this tested? A minimal test might be booting AROS and MorphOS on 
sam460ex.

Regards,
BALATON Zoltan

>     mr = g_new(MemoryRegion, 1);
> -    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar0", &d->mmio, 0x80, 8);
> -    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, mr);
> +    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar0", &s->data_ops[0], 0,
> +                             memory_region_size(&s->data_ops[0]));
> +    memory_region_add_subregion_overlap(&d->mmio, 0x80, mr, 1);
>     mr = g_new(MemoryRegion, 1);
> -    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar1", &d->mmio, 0x88, 4);
> -    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, mr);
> +    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar1", &s->cmd_ops[0], 0,
> +                             memory_region_size(&s->cmd_ops[0]));
> +    memory_region_add_subregion_overlap(&d->mmio, 0x88, mr, 1);
>     mr = g_new(MemoryRegion, 1);
> -    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar2", &d->mmio, 0xc0, 8);
> -    pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, mr);
> +    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar2", &s->data_ops[1], 0,
> +                             memory_region_size(&s->data_ops[1]));
> +    memory_region_add_subregion_overlap(&d->mmio, 0xc0, mr, 1);
>     mr = g_new(MemoryRegion, 1);
> -    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar3", &d->mmio, 0xc8, 4);
> -    pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, mr);
> +    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar3", &s->cmd_ops[1], 0,
> +                             memory_region_size(&s->cmd_ops[1]));
> +    memory_region_add_subregion_overlap(&d->mmio, 0xc8, mr, 1);
> +
>     mr = g_new(MemoryRegion, 1);
>     memory_region_init_alias(mr, OBJECT(d), "sii3112.bar4", &d->mmio, 0, 16);
>     pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, mr);
>

