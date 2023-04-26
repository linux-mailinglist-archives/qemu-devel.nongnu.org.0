Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59316EF39B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 13:45:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prdZs-0007Mc-7t; Wed, 26 Apr 2023 07:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prdZk-0007Ih-NV; Wed, 26 Apr 2023 07:44:44 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prdZi-0008BA-2L; Wed, 26 Apr 2023 07:44:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=olg+MEvzVxHSwQu3vygSMFZFR9Tg/nMFvlKcM5pUIBc=; b=UNftqEB50OS4c5odH7/AdTL0AP
 ngXfup9g5th2CNicXOul1/fuX6ctX60atJeUKqX9CKah3d1Vaqh54BgObdGRgCAzIEpalysZ9Bw/O
 D5Gl0IDf4EAVoMvoN8rniGkRthtkr0UtirXq8AkSbDK1eBDdjmTt4ylYlwZvqXbj0dtN22y8Lk2/H
 qoeSfdTJrFCcJoDAmvxMoiJqHX228R/glKGN62/KTy/vHLsthD30sRjRQ0L4IsURfyQDo0P4dZOaX
 GetOrLLcyPLKax1yf8GeGJjwYBJvtp4ktcpQ3k52TMffzPSnWdFi/dQL6ajESXtnumSKaUmCJLNYq
 HCinx2GdFAoWR3rO31h/TJ0m3AwDXMpkrb0gd1Nk4ICFfA7MAdbfO5BqrW3EAIjMhM3cj1YYIdxH2
 pbnnskERff4GXbVDFr48XRaK0sidkGZ6Fno03HNxi5fRusT9Pxojd1w2wXp2kM+1ZnldocFPmtOAQ
 iXWTV+AasdTSk3BCkSqfT58pK0N6DUAeavxumrOH9ELdmz0CNm1wZajUIrlN59iTIwFbE1iTGr8Or
 BpQSrj6oFTppGJ/npqME25TJmqrxMh7/yYd55TPHALyaXc+4zsMfH8W+UNwQgFlgroyruAlAVSR1U
 E39v/Tldd1S6YYgNhVAYoArtUeZckq/SjmTJpuGGI=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prdYg-0002AV-4a; Wed, 26 Apr 2023 12:43:42 +0100
Message-ID: <859c8a06-cfdf-3f0b-615f-07a703439687@ilande.co.uk>
Date: Wed, 26 Apr 2023 12:44:29 +0100
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
 <20230422150728.176512-13-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230422150728.176512-13-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 12/13] hw/ide/sii3112: Reuse PCIIDEState::bmdma_ops
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

> Allows to unexport bmdma_addr_ioport_ops and models TYPE_SII3112_PCI as a
> standard-compliant PCI IDE device.

Nice! I think it's worth adding a brief mention that you've added BMDMA trace-events, 
but otherwise looks sensible to me.

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/ide/pci.h |  1 -
>   hw/ide/pci.c         |  2 +-
>   hw/ide/sii3112.c     | 94 ++++++++++++++++++++++++++------------------
>   hw/ide/trace-events  |  6 ++-
>   4 files changed, 60 insertions(+), 43 deletions(-)
> 
> diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
> index dbb4b13161..81e0370202 100644
> --- a/include/hw/ide/pci.h
> +++ b/include/hw/ide/pci.h
> @@ -59,7 +59,6 @@ struct PCIIDEState {
>   void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d);
>   void bmdma_init_ops(PCIIDEState *d, const MemoryRegionOps *bmdma_ops);
>   void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
> -extern MemoryRegionOps bmdma_addr_ioport_ops;
>   void pci_ide_create_devs(PCIDevice *dev);
>   
>   #endif
> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
> index 97ccc75aa6..3539b162b7 100644
> --- a/hw/ide/pci.c
> +++ b/hw/ide/pci.c
> @@ -342,7 +342,7 @@ static void bmdma_addr_write(void *opaque, hwaddr addr,
>       bm->addr |= ((data & mask) << shift) & ~3;
>   }
>   
> -MemoryRegionOps bmdma_addr_ioport_ops = {
> +static MemoryRegionOps bmdma_addr_ioport_ops = {
>       .read = bmdma_addr_read,
>       .write = bmdma_addr_write,
>       .endianness = DEVICE_LITTLE_ENDIAN,
> diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
> index 9cf920369f..373c0dd1ee 100644
> --- a/hw/ide/sii3112.c
> +++ b/hw/ide/sii3112.c
> @@ -34,47 +34,73 @@ struct SiI3112PCIState {
>       SiI3112Regs regs[2];
>   };
>   
> -/* The sii3112_reg_read and sii3112_reg_write functions implement the
> - * Internal Register Space - BAR5 (section 6.7 of the data sheet).
> - */
> -
> -static uint64_t sii3112_reg_read(void *opaque, hwaddr addr,
> -                                unsigned int size)
> +static uint64_t sii3112_bmdma_read(void *opaque, hwaddr addr, unsigned int size)
>   {
> -    SiI3112PCIState *d = opaque;
> +    BMDMAState *bm = opaque;
> +    SiI3112PCIState *d = SII3112_PCI(bm->pci_dev);
> +    int i = (bm == &bm->pci_dev->bmdma[0]) ? 0 : 1;
>       uint64_t val;
>   
>       switch (addr) {
>       case 0x00:
> -        val = d->i.bmdma[0].cmd;
> +        val = bm->cmd;
>           break;
>       case 0x01:
> -        val = d->regs[0].swdata;
> +        val = d->regs[i].swdata;
>           break;
>       case 0x02:
> -        val = d->i.bmdma[0].status;
> +        val = bm->status;
>           break;
>       case 0x03:
>           val = 0;
>           break;
> -    case 0x04 ... 0x07:
> -        val = bmdma_addr_ioport_ops.read(&d->i.bmdma[0], addr - 4, size);
> -        break;
> -    case 0x08:
> -        val = d->i.bmdma[1].cmd;
> +    default:
> +        val = 0;
>           break;
> -    case 0x09:
> -        val = d->regs[1].swdata;
> +    }
> +    trace_sii3112_bmdma_read(size, addr, val);
> +    return val;
> +}
> +
> +static void sii3112_bmdma_write(void *opaque, hwaddr addr,
> +                                uint64_t val, unsigned int size)
> +{
> +    BMDMAState *bm = opaque;
> +    SiI3112PCIState *d = SII3112_PCI(bm->pci_dev);
> +    int i = (bm == &bm->pci_dev->bmdma[0]) ? 0 : 1;
> +
> +    trace_sii3112_bmdma_write(size, addr, val);
> +    switch (addr) {
> +    case 0x00:
> +        bmdma_cmd_writeb(bm, val);
>           break;
> -    case 0x0a:
> -        val = d->i.bmdma[1].status;
> +    case 0x01:
> +        d->regs[i].swdata = val & 0x3f;
>           break;
> -    case 0x0b:
> -        val = 0;
> +    case 0x02:
> +        bm->status = (val & 0x60) | (bm->status & 1) | (bm->status & ~val & 6);
>           break;
> -    case 0x0c ... 0x0f:
> -        val = bmdma_addr_ioport_ops.read(&d->i.bmdma[1], addr - 12, size);
> +    default:
>           break;
> +    }
> +}
> +
> +static const MemoryRegionOps sii3112_bmdma_ops = {
> +    .read = sii3112_bmdma_read,
> +    .write = sii3112_bmdma_write,
> +};
> +
> +/* The sii3112_reg_read and sii3112_reg_write functions implement the
> + * Internal Register Space - BAR5 (section 6.7 of the data sheet).
> + */
> +
> +static uint64_t sii3112_reg_read(void *opaque, hwaddr addr,
> +                                unsigned int size)
> +{
> +    SiI3112PCIState *d = opaque;
> +    uint64_t val;
> +
> +    switch (addr) {
>       case 0x10:
>           val = d->i.bmdma[0].cmd;
>           val |= (d->regs[0].confstat & (1UL << 11) ? (1 << 4) : 0); /*SATAINT0*/
> @@ -127,38 +153,26 @@ static void sii3112_reg_write(void *opaque, hwaddr addr,
>   
>       trace_sii3112_write(size, addr, val);
>       switch (addr) {
> -    case 0x00:
>       case 0x10:
>           bmdma_cmd_writeb(&d->i.bmdma[0], val);
>           break;
> -    case 0x01:
>       case 0x11:
>           d->regs[0].swdata = val & 0x3f;
>           break;
> -    case 0x02:
>       case 0x12:
>           d->i.bmdma[0].status = (val & 0x60) | (d->i.bmdma[0].status & 1) |
>                                  (d->i.bmdma[0].status & ~val & 6);
>           break;
> -    case 0x04 ... 0x07:
> -        bmdma_addr_ioport_ops.write(&d->i.bmdma[0], addr - 4, val, size);
> -        break;
> -    case 0x08:
>       case 0x18:
>           bmdma_cmd_writeb(&d->i.bmdma[1], val);
>           break;
> -    case 0x09:
>       case 0x19:
>           d->regs[1].swdata = val & 0x3f;
>           break;
> -    case 0x0a:
>       case 0x1a:
>           d->i.bmdma[1].status = (val & 0x60) | (d->i.bmdma[1].status & 1) |
>                                  (d->i.bmdma[1].status & ~val & 6);
>           break;
> -    case 0x0c ... 0x0f:
> -        bmdma_addr_ioport_ops.write(&d->i.bmdma[1], addr - 12, val, size);
> -        break;
>       case 0x100:
>           d->regs[0].scontrol = val & 0xfff;
>           if (val & 1) {
> @@ -240,6 +254,9 @@ static void sii3112_pci_realize(PCIDevice *dev, Error **errp)
>       pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &s->data_ops[1]);
>       pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &s->cmd_ops[1]);
>   
> +    bmdma_init_ops(s, &sii3112_bmdma_ops);
> +    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &s->bmdma_ops);
> +
>       /* BAR5 is in PCI memory space */
>       memory_region_init_io(&d->mmio, OBJECT(d), &sii3112_reg_ops, d,
>                            "sii3112.bar5", 0x200);
> @@ -262,10 +279,10 @@ static void sii3112_pci_realize(PCIDevice *dev, Error **errp)
>       memory_region_init_alias(mr, OBJECT(d), "sii3112.bar3", &s->cmd_ops[1], 0,
>                                memory_region_size(&s->cmd_ops[1]));
>       memory_region_add_subregion_overlap(&d->mmio, 0xc8, mr, 1);
> -
>       mr = g_new(MemoryRegion, 1);
> -    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar4", &d->mmio, 0, 16);
> -    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, mr);
> +    memory_region_init_alias(mr, OBJECT(d), "sii3112.bar4", &s->bmdma_ops, 0,
> +                             memory_region_size(&s->bmdma_ops));
> +    memory_region_add_subregion_overlap(&d->mmio, 0x0, mr, 1);
>   
>       qdev_init_gpio_in(ds, sii3112_set_irq, 2);
>       for (i = 0; i < 2; i++) {
> @@ -287,7 +304,6 @@ static void sii3112_pci_class_init(ObjectClass *klass, void *data)
>       pd->class_id = PCI_CLASS_STORAGE_RAID;
>       pd->revision = 1;
>       pd->realize = sii3112_pci_realize;
> -    pd->exit = NULL;
>       dc->reset = sii3112_reset;
>       dc->vmsd = NULL;
>       dc->desc = "SiI3112A SATA controller";
> diff --git a/hw/ide/trace-events b/hw/ide/trace-events
> index 57042cafdd..a479525e38 100644
> --- a/hw/ide/trace-events
> +++ b/hw/ide/trace-events
> @@ -38,8 +38,10 @@ bmdma_read(uint64_t addr, uint8_t val) "bmdma: readb 0x%"PRIx64" : 0x%02x"
>   bmdma_write(uint64_t addr, uint64_t val) "bmdma: writeb 0x%"PRIx64" : 0x%02"PRIx64
>   
>   # sii3112.c
> -sii3112_read(int size, uint64_t addr, uint64_t val) "bmdma: read (size %d) 0x%"PRIx64" : 0x%02"PRIx64
> -sii3112_write(int size, uint64_t addr, uint64_t val) "bmdma: write (size %d) 0x%"PRIx64" : 0x%02"PRIx64
> +sii3112_bmdma_read(int size, uint64_t addr, uint64_t val) "read (size %d) 0x%"PRIx64" : 0x%02"PRIx64
> +sii3112_bmdma_write(int size, uint64_t addr, uint64_t val) "write (size %d) 0x%"PRIx64" : 0x%02"PRIx64
> +sii3112_read(int size, uint64_t addr, uint64_t val) "read (size %d) 0x%"PRIx64" : 0x%02"PRIx64
> +sii3112_write(int size, uint64_t addr, uint64_t val) "write (size %d) 0x%"PRIx64" : 0x%02"PRIx64
>   sii3112_set_irq(int channel, int level) "channel %d level %d"
>   
>   # via.c

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

