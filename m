Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C586EF386
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 13:42:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prdXM-0005mz-NY; Wed, 26 Apr 2023 07:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prdXD-0005mb-VZ; Wed, 26 Apr 2023 07:42:07 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prdXA-0007oW-Rh; Wed, 26 Apr 2023 07:42:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GSbxUVVw2jZxauE8GXB8QUwVRQrBz159dxHHUpUQNKc=; b=c5DoPV2L0GIUv7xFlaB01gjn+5
 KQZOdgSXgJKPa+hVLEGkP2gwETzDjvGSwRjux9vOpBBGUVKD9AdQrEVDZNXPVEkmIRqifDvTt2cmf
 EtfGk7vZ8LMslqIsUlF8Qag4B0+BGO2TUeQVCrM2iyjxvGn+/ayKKkLPjpszgOfIt2kpycBhPSsue
 +icgwpcRd0gExI026hvcTkT/R6hnZtvpxZh3SYWvDZaTRF2/xcjcVkQihOS7+JLW/VExz1v5N4zOK
 CO8HCsPNdYfK3Jmgcf6rJ9RuMEkK8noEKt7qf4g/dd6BezP+Lmta4lzOiDEaAP2tao4SwSHwRj3Qf
 g6eZNBs3L/s6sdtgmqOutqoNCgl42j7knDqJwGqbCL4MgfC3m7pk1NUUTg6MBn9osn1RCgOahDLVi
 Zw7iT0A2iX4jpqTLvx8QvgEDRjpJG3FhH7G4wwrvnch+OlwHy+x7f/2wltZrS9d+O2OjeSqZGi9JR
 x7iXz9ZJJjtd1qUnZcYEtOzt897sxgcUvsyWAwD45iFv+msYKY0T9MneCz6zDm7bvpTDdkOdcX56J
 fETJKGfbRGb5DBEC/aNZ3G+Ruov8OqrJppHATDMvCEDYH2bKwM7GHTzPoNa5XS8056VeRIK2zfdnt
 OG2BElJx8ZQPrR4B1a3kmbwRG2nJ3XJgLssFOxnVY=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prdWA-00029Z-J6; Wed, 26 Apr 2023 12:41:06 +0100
Message-ID: <b4b8c651-3874-a919-1221-d09b3842e3c8@ilande.co.uk>
Date: Wed, 26 Apr 2023 12:41:54 +0100
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
 <20230422150728.176512-12-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230422150728.176512-12-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 11/13] hw/ide/sii3112: Reuse PCIIDEState::{cmd,data}_ops
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

> Allows to unexport pci_ide_{cmd,data}_le_ops and models TYPE_SII3112_PCI as a
> standard-compliant PCI IDE device.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/ide/pci.h |  2 --
>   hw/ide/pci.c         |  4 ++--
>   hw/ide/sii3112.c     | 50 ++++++++++++++++----------------------------
>   3 files changed, 20 insertions(+), 36 deletions(-)
> 
> diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
> index 5025df5b82..dbb4b13161 100644
> --- a/include/hw/ide/pci.h
> +++ b/include/hw/ide/pci.h
> @@ -62,6 +62,4 @@ void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
>   extern MemoryRegionOps bmdma_addr_ioport_ops;
>   void pci_ide_create_devs(PCIDevice *dev);
>   
> -extern const MemoryRegionOps pci_ide_cmd_le_ops;
> -extern const MemoryRegionOps pci_ide_data_le_ops;
>   #endif
> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
> index b2fcc00a64..97ccc75aa6 100644
> --- a/hw/ide/pci.c
> +++ b/hw/ide/pci.c
> @@ -60,7 +60,7 @@ static void pci_ide_ctrl_write(void *opaque, hwaddr addr,
>       ide_ctrl_write(bus, addr + 2, data);
>   }
>   
> -const MemoryRegionOps pci_ide_cmd_le_ops = {
> +static const MemoryRegionOps pci_ide_cmd_le_ops = {
>       .read = pci_ide_status_read,
>       .write = pci_ide_ctrl_write,
>       .endianness = DEVICE_LITTLE_ENDIAN,
> @@ -98,7 +98,7 @@ static void pci_ide_data_write(void *opaque, hwaddr addr,
>       }
>   }
>   
> -const MemoryRegionOps pci_ide_data_le_ops = {
> +static const MemoryRegionOps pci_ide_data_le_ops = {
>       .read = pci_ide_data_read,
>       .write = pci_ide_data_write,
>       .endianness = DEVICE_LITTLE_ENDIAN,
> diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
> index 0af897a9ef..9cf920369f 100644
> --- a/hw/ide/sii3112.c
> +++ b/hw/ide/sii3112.c
> @@ -88,21 +88,9 @@ static uint64_t sii3112_reg_read(void *opaque, hwaddr addr,
>           val |= (d->regs[1].confstat & (1UL << 11) ? (1 << 4) : 0);
>           val |= (uint32_t)d->i.bmdma[1].status << 16;
>           break;
> -    case 0x80 ... 0x87:
> -        val = pci_ide_data_le_ops.read(&d->i.bus[0], addr - 0x80, size);
> -        break;
> -    case 0x8a:
> -        val = pci_ide_cmd_le_ops.read(&d->i.bus[0], 2, size);
> -        break;
>       case 0xa0:
>           val = d->regs[0].confstat;
>           break;
> -    case 0xc0 ... 0xc7:
> -        val = pci_ide_data_le_ops.read(&d->i.bus[1], addr - 0xc0, size);
> -        break;
> -    case 0xca:
> -        val = pci_ide_cmd_le_ops.read(&d->i.bus[1], 2, size);
> -        break;
>       case 0xe0:
>           val = d->regs[1].confstat;
>           break;
> @@ -171,18 +159,6 @@ static void sii3112_reg_write(void *opaque, hwaddr addr,
>       case 0x0c ... 0x0f:
>           bmdma_addr_ioport_ops.write(&d->i.bmdma[1], addr - 12, val, size);
>           break;
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
>       case 0x100:
>           d->regs[0].scontrol = val & 0xfff;
>           if (val & 1) {
> @@ -259,6 +235,11 @@ static void sii3112_pci_realize(PCIDevice *dev, Error **errp)
>       pci_config_set_interrupt_pin(dev->config, 1);
>       pci_set_byte(dev->config + PCI_CACHE_LINE_SIZE, 8);
>   
> +    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &s->data_ops[0]);
> +    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &s->cmd_ops[0]);
> +    pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &s->data_ops[1]);
> +    pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &s->cmd_ops[1]);
> +
>       /* BAR5 is in PCI memory space */
>       memory_region_init_io(&d->mmio, OBJECT(d), &sii3112_reg_ops, d,
>                            "sii3112.bar5", 0x200);
> @@ -266,17 +247,22 @@ static void sii3112_pci_realize(PCIDevice *dev, Error **errp)
>   
>       /* BAR0-BAR4 are PCI I/O space aliases into BAR5 */
>       mr = g_new(MemoryRegion, 1);
> -    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar0", &d->mmio, 0x80, 8);
> -    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, mr);
> +    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar0", &s->data_ops[0], 0,
> +                             memory_region_size(&s->data_ops[0]));
> +    memory_region_add_subregion_overlap(&d->mmio, 0x80, mr, 1);
>       mr = g_new(MemoryRegion, 1);
> -    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar1", &d->mmio, 0x88, 4);
> -    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, mr);
> +    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar1", &s->cmd_ops[0], 0,
> +                             memory_region_size(&s->cmd_ops[0]));
> +    memory_region_add_subregion_overlap(&d->mmio, 0x88, mr, 1);
>       mr = g_new(MemoryRegion, 1);
> -    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar2", &d->mmio, 0xc0, 8);
> -    pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, mr);
> +    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar2", &s->data_ops[1], 0,
> +                             memory_region_size(&s->data_ops[1]));
> +    memory_region_add_subregion_overlap(&d->mmio, 0xc0, mr, 1);
>       mr = g_new(MemoryRegion, 1);
> -    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar3", &d->mmio, 0xc8, 4);
> -    pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, mr);
> +    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar3", &s->cmd_ops[1], 0,
> +                             memory_region_size(&s->cmd_ops[1]));
> +    memory_region_add_subregion_overlap(&d->mmio, 0xc8, mr, 1);
> +
>       mr = g_new(MemoryRegion, 1);
>       memory_region_init_alias(mr, OBJECT(d), "sii3112.bar4", &d->mmio, 0, 16);
>       pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, mr);

So if I read this right, this is now switching the aliases over on BAR5 to allow 
re-use of the common IDE/BMDMA BARs in PCIIDEState? If that's correct then I think 
the commit message needs a bit more detail, otherwise:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

