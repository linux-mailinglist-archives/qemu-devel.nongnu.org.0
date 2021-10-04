Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6004E420941
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 12:19:30 +0200 (CEST)
Received: from localhost ([::1]:38648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXL4D-0003KM-EZ
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 06:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mXKy9-0003Ky-TR
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 06:13:15 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:36852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mXKy3-0003EQ-M0
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 06:13:11 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 346D77463B7;
 Mon,  4 Oct 2021 12:13:04 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0ED9D748F4E; Mon,  4 Oct 2021 12:13:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0D489746398;
 Mon,  4 Oct 2021 12:13:04 +0200 (CEST)
Date: Mon, 4 Oct 2021 12:13:04 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI
 interrupts
In-Reply-To: <20211003161629.614BA745953@zero.eik.bme.hu>
Message-ID: <873f926c-e059-52a4-252e-5dbd7e03bee@eik.bme.hu>
References: <20211003161629.614BA745953@zero.eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Philippe M-D <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 3 Oct 2021, BALATON Zoltan wrote:
> This device is part of a sperio/ISA bridge chip and IRQs from it are
> routed to an ISA interrupt set by the Interrupt Line PCI config
> register. Change uhci_update_irq() to allow this and use it from
> vt82c686-uhci-pci.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
> Maybe bit of a hack but fixes USB interrupts on pegasos2 until
> somebody has a better idea. I'm not sure about fuloong2e but the
> VT82C686B docs say it also does the same routing IRQs to ISA PIC like
> VT8231 used on pegasos2.

I've found this breaks compilation for machines that have UHCI but no ISA 
so I'll have to cahnge it a bit to put a set_irq method in UHCIState 
instead that subclasses can set then implement the ISA irq mapping in 
vt82c686-uhci-pci.c which depends on VT82C686B which depends on ISA but 
the idea is the same unless somebody comes up with a better one. I'll send 
a v2 later.

Regards,
BALATON Zoltan

> hw/usb/hcd-uhci.c          | 12 +++++++++---
> hw/usb/hcd-uhci.h          |  1 +
> hw/usb/vt82c686-uhci-pci.c |  1 +
> 3 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
> index 0cb02a6432..8f28241f70 100644
> --- a/hw/usb/hcd-uhci.c
> +++ b/hw/usb/hcd-uhci.c
> @@ -31,6 +31,7 @@
> #include "hw/usb/uhci-regs.h"
> #include "migration/vmstate.h"
> #include "hw/pci/pci.h"
> +#include "hw/irq.h"
> #include "hw/qdev-properties.h"
> #include "qapi/error.h"
> #include "qemu/timer.h"
> @@ -290,7 +291,7 @@ static UHCIAsync *uhci_async_find_td(UHCIState *s, uint32_t td_addr)
>
> static void uhci_update_irq(UHCIState *s)
> {
> -    int level;
> +    int level = 0;
>     if (((s->status2 & 1) && (s->intr & (1 << 2))) ||
>         ((s->status2 & 2) && (s->intr & (1 << 3))) ||
>         ((s->status & UHCI_STS_USBERR) && (s->intr & (1 << 0))) ||
> @@ -298,10 +299,15 @@ static void uhci_update_irq(UHCIState *s)
>         (s->status & UHCI_STS_HSERR) ||
>         (s->status & UHCI_STS_HCPERR)) {
>         level = 1;
> +    }
> +    if (s->isa_irqs) {
> +        uint8_t irq = pci_get_byte(s->dev.config + PCI_INTERRUPT_LINE);
> +        if (irq < ISA_NUM_IRQS) {
> +            qemu_set_irq(isa_get_irq(NULL, irq), level);
> +        }
>     } else {
> -        level = 0;
> +        pci_set_irq(&s->dev, level);
>     }
> -    pci_set_irq(&s->dev, level);
> }
>
> static void uhci_reset(DeviceState *dev)
> diff --git a/hw/usb/hcd-uhci.h b/hw/usb/hcd-uhci.h
> index e61d8fcb19..c91805a65e 100644
> --- a/hw/usb/hcd-uhci.h
> +++ b/hw/usb/hcd-uhci.h
> @@ -59,6 +59,7 @@ typedef struct UHCIState {
>     uint32_t frame_bytes;
>     uint32_t frame_bandwidth;
>     bool completions_only;
> +    bool isa_irqs;
>     UHCIPort ports[NB_PORTS];
>
>     /* Interrupts that should be raised at the end of the current frame.  */
> diff --git a/hw/usb/vt82c686-uhci-pci.c b/hw/usb/vt82c686-uhci-pci.c
> index b109c21603..5c79e293ef 100644
> --- a/hw/usb/vt82c686-uhci-pci.c
> +++ b/hw/usb/vt82c686-uhci-pci.c
> @@ -13,6 +13,7 @@ static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
>     /* USB legacy support  */
>     pci_set_long(pci_conf + 0xc0, 0x00002000);
>
> +    s->isa_irqs = true;
>     usb_uhci_common_realize(dev, errp);
> }
>
>

