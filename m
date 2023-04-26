Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB7F6EF3A4
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 13:50:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prddi-0003tv-3k; Wed, 26 Apr 2023 07:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prddf-0003th-0w; Wed, 26 Apr 2023 07:48:47 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prddc-0000ag-P9; Wed, 26 Apr 2023 07:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BsR90hVxZddcF+B9tn0ryLLD+TqYkmRumY7J76pstIo=; b=baQA2jjU57hjnyvZUMbFKa6HJi
 UNEmnN1sX7l+ZXrJZ03pST5Q+YgRZQTKeSVNjGamUyg04glj6xpjeA3E/GPGLmxo4UFl9h+7JAOp/
 qkvyFVENud8xAemPJWHBvzxYFa7DJ1vRQ5TAzlDde73u6/k4zb5OW4hbeYoitaojCZytjZV/1E0Su
 0MF+K3C5ZoSy1OlyqfGDyIF5RC1T4Qw2i5Y5p7yZMxg0tB0KhN1z/d4QpWRQq7YYeB5UX613XFpE2
 EyfsLaEa0Ty2otydqNLZhhmKFUjpK8yuBWOIZq88n6SMFhlOLB3uiM9x267Ag7k4r9+LeEcne2eiE
 jVp3XAkShhETmCyUVCOgjWVqDxlR2wkxegvbyM3KI8bCh07bI5iG/mubhrf+cPn9V+TBAOoiEJx9D
 rb7WIU2Yjpzmery0785oDNHlbnBALAodWkLd87aVnU6HDRHy31Ltqh5eRvyN/MFP1EnaNkQXqVU2i
 w2f/p1PjfY8rrRLChS2ZbXQsCNn3kHvzRO2X6tQ/8g6ZXVA+eR2tFSwBRSgE9j03IrB9lpuewJ5j6
 Td1e3uGWx56Xmulgyy/e9jzTWrbbMY8DmtB0Jaq5D5+vOEBxXz6nQ0yr1KtHfAYD4N32+j61I2a3X
 MHJGnefxX5h7kiwQs9BS721cRwt3AWwzS/n6OGFXs=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prdcf-0002CJ-Dc; Wed, 26 Apr 2023 12:47:45 +0100
Message-ID: <5ab023a4-6f97-bca8-0b68-a098b98da809@ilande.co.uk>
Date: Wed, 26 Apr 2023 12:48:37 +0100
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
 <20230422150728.176512-14-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230422150728.176512-14-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 13/13] hw/ide: Extract bmdma_clear_status()
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

> Extract bmdma_clear_status() mirroring bmdma_cmd_writeb().
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/ide/pci.h |  1 +
>   hw/ide/cmd646.c      |  2 +-
>   hw/ide/pci.c         |  7 +++++++
>   hw/ide/piix.c        |  2 +-
>   hw/ide/sii3112.c     | 12 +++++-------
>   hw/ide/via.c         |  2 +-
>   hw/ide/trace-events  |  1 +
>   7 files changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
> index 81e0370202..6a286ad307 100644
> --- a/include/hw/ide/pci.h
> +++ b/include/hw/ide/pci.h
> @@ -59,6 +59,7 @@ struct PCIIDEState {
>   void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d);
>   void bmdma_init_ops(PCIIDEState *d, const MemoryRegionOps *bmdma_ops);
>   void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
> +void bmdma_clear_status(BMDMAState *bm, uint32_t val);
>   void pci_ide_create_devs(PCIDevice *dev);
>   
>   #endif
> diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
> index b9d005a357..973c3ff0dc 100644
> --- a/hw/ide/cmd646.c
> +++ b/hw/ide/cmd646.c
> @@ -144,7 +144,7 @@ static void bmdma_write(void *opaque, hwaddr addr,
>           cmd646_update_irq(pci_dev);
>           break;
>       case 2:
> -        bm->status = (val & 0x60) | (bm->status & 1) | (bm->status & ~val & 0x06);
> +        bmdma_clear_status(bm, val);
>           break;
>       case 3:
>           if (bm == &bm->pci_dev->bmdma[0]) {
> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
> index 3539b162b7..4aa06be7c6 100644
> --- a/hw/ide/pci.c
> +++ b/hw/ide/pci.c
> @@ -318,6 +318,13 @@ void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val)
>       bm->cmd = val & 0x09;
>   }
>   
> +void bmdma_clear_status(BMDMAState *bm, uint32_t val)
> +{
> +    trace_bmdma_update_status(val);
> +
> +    bm->status = (val & 0x60) | (bm->status & BM_STATUS_DMAING) | (bm->status & ~val & 0x06);
> +}
> +
>   static uint64_t bmdma_addr_read(void *opaque, hwaddr addr,
>                                   unsigned width)
>   {
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index 406a67fa0f..9eab615e35 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -76,7 +76,7 @@ static void bmdma_write(void *opaque, hwaddr addr,
>           bmdma_cmd_writeb(bm, val);
>           break;
>       case 2:
> -        bm->status = (val & 0x60) | (bm->status & 1) | (bm->status & ~val & 0x06);
> +        bmdma_clear_status(bm, val);
>           break;
>       }
>   }
> diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
> index 373c0dd1ee..1180ff55e7 100644
> --- a/hw/ide/sii3112.c
> +++ b/hw/ide/sii3112.c
> @@ -66,7 +66,7 @@ static void sii3112_bmdma_write(void *opaque, hwaddr addr,
>                                   uint64_t val, unsigned int size)
>   {
>       BMDMAState *bm = opaque;
> -    SiI3112PCIState *d = SII3112_PCI(bm->pci_dev);
> +    SiI3112PCIState *s = SII3112_PCI(bm->pci_dev);
>       int i = (bm == &bm->pci_dev->bmdma[0]) ? 0 : 1;
>   
>       trace_sii3112_bmdma_write(size, addr, val);
> @@ -75,10 +75,10 @@ static void sii3112_bmdma_write(void *opaque, hwaddr addr,
>           bmdma_cmd_writeb(bm, val);
>           break;
>       case 0x01:
> -        d->regs[i].swdata = val & 0x3f;
> +        s->regs[i].swdata = val & 0x3f;
>           break;
>       case 0x02:
> -        bm->status = (val & 0x60) | (bm->status & 1) | (bm->status & ~val & 6);
> +        bmdma_clear_status(bm, val);
>           break;
>       default:
>           break;
> @@ -160,8 +160,7 @@ static void sii3112_reg_write(void *opaque, hwaddr addr,
>           d->regs[0].swdata = val & 0x3f;
>           break;
>       case 0x12:
> -        d->i.bmdma[0].status = (val & 0x60) | (d->i.bmdma[0].status & 1) |
> -                               (d->i.bmdma[0].status & ~val & 6);
> +        bmdma_clear_status(&d->i.bmdma[0], val);
>           break;
>       case 0x18:
>           bmdma_cmd_writeb(&d->i.bmdma[1], val);
> @@ -170,8 +169,7 @@ static void sii3112_reg_write(void *opaque, hwaddr addr,
>           d->regs[1].swdata = val & 0x3f;
>           break;
>       case 0x1a:
> -        d->i.bmdma[1].status = (val & 0x60) | (d->i.bmdma[1].status & 1) |
> -                               (d->i.bmdma[1].status & ~val & 6);
> +        bmdma_clear_status(&d->i.bmdma[1], val);
>           break;
>       case 0x100:
>           d->regs[0].scontrol = val & 0xfff;
> diff --git a/hw/ide/via.c b/hw/ide/via.c
> index 35dd97e49b..afb97f302a 100644
> --- a/hw/ide/via.c
> +++ b/hw/ide/via.c
> @@ -75,7 +75,7 @@ static void bmdma_write(void *opaque, hwaddr addr,
>           bmdma_cmd_writeb(bm, val);
>           break;
>       case 2:
> -        bm->status = (val & 0x60) | (bm->status & 1) | (bm->status & ~val & 0x06);
> +        bmdma_clear_status(bm, val);
>           break;
>       default:;
>       }
> diff --git a/hw/ide/trace-events b/hw/ide/trace-events
> index a479525e38..d219c64b61 100644
> --- a/hw/ide/trace-events
> +++ b/hw/ide/trace-events
> @@ -30,6 +30,7 @@ bmdma_write_cmd646(uint64_t addr, uint64_t val) "bmdma: writeb 0x%"PRIx64" : 0x%
>   # pci.c
>   bmdma_reset(void) ""
>   bmdma_cmd_writeb(uint32_t val) "val: 0x%08x"
> +bmdma_update_status(uint32_t val) "val: 0x%08x"
>   bmdma_addr_read(uint64_t data) "data: 0x%016"PRIx64
>   bmdma_addr_write(uint64_t data) "data: 0x%016"PRIx64

I see there has been further discussion related to naming of the function: FWIW my 
preference would be bmdma_status_writeb() since it matches the existing convention 
for bmdma_cmd_writeb() and is pretty clear that it handles byte-only BMDMA status 
register writes.

I don't mind either way regarding the extra trace-event, although generally if 
someone has added it then it means they have found it useful. Otherwise LGTM, but 
I'll wait to see what the final outcome is before adding an R-B.


ATB,

Mark.

