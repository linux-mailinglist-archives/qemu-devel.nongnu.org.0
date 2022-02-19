Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA704BC82E
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 12:27:21 +0100 (CET)
Received: from localhost ([::1]:45290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLNtY-0004Dp-IL
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 06:27:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nLNmd-0001sf-Od; Sat, 19 Feb 2022 06:20:11 -0500
Received: from [2001:738:2001:2001::2001] (port=52209 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nLNlw-0006e1-31; Sat, 19 Feb 2022 06:20:11 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B8E27746E90;
 Sat, 19 Feb 2022 12:19:19 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7E459746D64; Sat, 19 Feb 2022 12:19:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7CA2D746705;
 Sat, 19 Feb 2022 12:19:19 +0100 (CET)
Date: Sat, 19 Feb 2022 12:19:19 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Liav Albani <liavalb@gmail.com>
Subject: Re: [PATCH 1/1] hw/ide: share bmdma read and write functions between
 piix.c and via.c
In-Reply-To: <20220219080818.327683-2-liavalb@gmail.com>
Message-ID: <5b443413-5f5c-48f9-161-6573b79aa8e3@eik.bme.hu>
References: <20220219080818.327683-1-liavalb@gmail.com>
 <20220219080818.327683-2-liavalb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
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

On Sat, 19 Feb 2022, Liav Albani wrote:
> Instead of letting each implementation to duplicate this code, we can
> share these functions between IDE PIIX3/4 and VIA implementations.

OK but there's a way to take this even further as cmd646 also uses similar 
functions just with more cases so you could remove the cases handled by 
these functions and only leave the difference and call the default 
function from the default case. E.g. (untested, just to show the idea):

hw/ide/cmd646.c:
static uint64_t bmdma_read(void *opaque, hwaddr addr,
                            unsigned size)
{
     BMDMAState *bm = opaque;
     PCIDevice *pci_dev = PCI_DEVICE(bm->pci_dev);
     uint32_t val;

     if (size != 1) {
         return ((uint64_t)1 << (size * 8)) - 1;
     }

     switch(addr & 3) {
     case 1:
         val = pci_dev->config[MRDMODE];
         break;
     case 3:
         if (bm == &bm->pci_dev->bmdma[0]) {
             val = pci_dev->config[UDIDETCR0];
         } else {
             val = pci_dev->config[UDIDETCR1];
         }
         break;
     default:
         val = bmdma_default_read(opaque, addr, size);
         break;
     }

     trace_bmdma_read_cmd646(addr, val);
     return val;
}

> Signed-off-by: Liav Albani <liavalb@gmail.com>
> ---
> hw/ide/pci.c         | 47 ++++++++++++++++++++++++++++++++++++++++
> hw/ide/piix.c        | 50 ++-----------------------------------------
> hw/ide/via.c         | 51 ++------------------------------------------
> include/hw/ide/pci.h |  4 ++++
> 4 files changed, 55 insertions(+), 97 deletions(-)
>
> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
> index 84ba733548..c8b867659a 100644
> --- a/hw/ide/pci.c
> +++ b/hw/ide/pci.c
> @@ -502,6 +502,53 @@ static const struct IDEDMAOps bmdma_ops = {
>     .reset = bmdma_reset,
> };
>
> +uint64_t bmdma_default_read(void *opaque, hwaddr addr,
> +                           unsigned size)

Indentation off? Also everywhere else, usually we indent not with the 
parenthesis but with the list within. (Auto indent in most editors does 
that probably.)

Regards,
BALATON Zoltan

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
> +    trace_bmdma_read_via(addr, val);
> +    return val;
> +}
> +
> +void bmdma_default_write(void *opaque, hwaddr addr,
> +                        uint64_t val, unsigned size)
> +{
> +    BMDMAState *bm = opaque;
> +
> +    if (size != 1) {
> +        return;
> +    }
> +
> +    trace_bmdma_write_via(addr, val);
> +    switch (addr & 3) {
> +    case 0:
> +        bmdma_cmd_writeb(bm, val);
> +        break;
> +    case 2:
> +        bm->status = (val & 0x60) | (bm->status & 1) | (bm->status & ~val & 0x06);
> +        break;
> +    default:;
> +    }
> +}
> +
> void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d)
> {
>     if (bus->dma == &bm->dma) {
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index ce89fd0aa3..fdf3a04cb1 100644
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
> +    .read = bmdma_default_read,
> +    .write = bmdma_default_write,
> };
>
> static void bmdma_setup_bar(PCIIDEState *d)
> diff --git a/hw/ide/via.c b/hw/ide/via.c
> index 82def819c4..13f27c9514 100644
> --- a/hw/ide/via.c
> +++ b/hw/ide/via.c
> @@ -33,56 +33,9 @@
> #include "hw/ide/pci.h"
> #include "trace.h"
>
> -static uint64_t bmdma_read(void *opaque, hwaddr addr,
> -                           unsigned size)
> -{
> -    BMDMAState *bm = opaque;
> -    uint32_t val;
> -
> -    if (size != 1) {
> -        return ((uint64_t)1 << (size * 8)) - 1;
> -    }
> -
> -    switch (addr & 3) {
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
> -    trace_bmdma_read_via(addr, val);
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
> -    trace_bmdma_write_via(addr, val);
> -    switch (addr & 3) {
> -    case 0:
> -        bmdma_cmd_writeb(bm, val);
> -        break;
> -    case 2:
> -        bm->status = (val & 0x60) | (bm->status & 1) | (bm->status & ~val & 0x06);
> -        break;
> -    default:;
> -    }
> -}
> -
> static const MemoryRegionOps via_bmdma_ops = {
> -    .read = bmdma_read,
> -    .write = bmdma_write,
> +    .read = bmdma_default_read,
> +    .write = bmdma_default_write,
> };
>
> static void bmdma_setup_bar(PCIIDEState *d)
> diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
> index d8384e1c42..159136f055 100644
> --- a/include/hw/ide/pci.h
> +++ b/include/hw/ide/pci.h
> @@ -62,6 +62,10 @@ static inline IDEState *bmdma_active_if(BMDMAState *bmdma)
> }
>
> void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d);
> +uint64_t bmdma_default_read(void *opaque, hwaddr addr,
> +                           unsigned size);
> +void bmdma_default_write(void *opaque, hwaddr addr,
> +                        uint64_t val, unsigned size);
> void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
> extern MemoryRegionOps bmdma_addr_ioport_ops;
> void pci_ide_create_devs(PCIDevice *dev);
>

