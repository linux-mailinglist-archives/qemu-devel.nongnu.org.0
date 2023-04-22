Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE596EBAA8
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 19:27:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqGzU-0005sr-NK; Sat, 22 Apr 2023 13:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pqGzS-0005rl-BY; Sat, 22 Apr 2023 13:25:38 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pqGzP-0001li-BL; Sat, 22 Apr 2023 13:25:38 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BDB937462DB;
 Sat, 22 Apr 2023 19:23:56 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7A95D745720; Sat, 22 Apr 2023 19:23:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 788917456E3;
 Sat, 22 Apr 2023 19:23:56 +0200 (CEST)
Date: Sat, 22 Apr 2023 19:23:56 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, John Snow <jsnow@redhat.com>, 
 Huacai Chen <chenhuacai@kernel.org>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 02/13] hw/ide/via: Implement ISA IRQ routing
In-Reply-To: <20230422150728.176512-3-shentey@gmail.com>
Message-ID: <3b1d7a25-1600-872d-c0e8-b71ec49f551e@eik.bme.hu>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-3-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
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
> The VIA south bridge allows the legacy IDE interrupts to be routed to four
> different ISA interrupts. This can be configured through the 0x4a register in
> the PCI configuration space of the ISA function. The default routing matches
> the legacy ISA IRQs, that is 14 and 15.

On VT8231 0x4a is PCI Master Arbitration Control, IDE interrupt Routing is 
0x4c and only documents 14/15 as valid values. Not sure any guest would 
actually change this or 0x4a and if that could cause problems but you may 
need to handle this somehow. (Apart from testing with MorphOS with -kernel 
you should really be testing with pegasos2.rom with MorphOS and Linux, 
e.g. Debian 8.11 netinstall iso is known to boot.)

Regards,
BALATON Zoltan

> Implement this missing piece of the VIA south bridge.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> hw/ide/via.c      |  6 ++++--
> hw/isa/vt82c686.c | 17 +++++++++++++++++
> 2 files changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/hw/ide/via.c b/hw/ide/via.c
> index 177baea9a7..0caae52276 100644
> --- a/hw/ide/via.c
> +++ b/hw/ide/via.c
> @@ -31,6 +31,7 @@
> #include "sysemu/dma.h"
> #include "hw/isa/vt82c686.h"
> #include "hw/ide/pci.h"
> +#include "hw/irq.h"
> #include "trace.h"
>
> static uint64_t bmdma_read(void *opaque, hwaddr addr,
> @@ -104,7 +105,8 @@ static void bmdma_setup_bar(PCIIDEState *d)
>
> static void via_ide_set_irq(void *opaque, int n, int level)
> {
> -    PCIDevice *d = PCI_DEVICE(opaque);
> +    PCIIDEState *s = opaque;
> +    PCIDevice *d = PCI_DEVICE(s);
>
>     if (level) {
>         d->config[0x70 + n * 8] |= 0x80;
> @@ -112,7 +114,7 @@ static void via_ide_set_irq(void *opaque, int n, int level)
>         d->config[0x70 + n * 8] &= ~0x80;
>     }
>
> -    via_isa_set_irq(pci_get_function_0(d), 14 + n, level);
> +    qemu_set_irq(s->isa_irq[n], level);
> }
>
> static void via_ide_reset(DeviceState *dev)
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index ca89119ce0..c7e29bb46a 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -568,9 +568,19 @@ static const VMStateDescription vmstate_via = {
>     }
> };
>
> +static void via_isa_set_ide_irq(void *opaque, int n, int level)
> +{
> +    static const uint8_t irqs[] = { 14, 15, 10, 11 };
> +    ViaISAState *s = opaque;
> +    uint8_t irq = irqs[(s->dev.config[0x4a] >> (n * 2)) & 0x3];
> +
> +    qemu_set_irq(s->isa_irqs_in[irq], level);
> +}
> +
> static void via_isa_init(Object *obj)
> {
>     ViaISAState *s = VIA_ISA(obj);
> +    DeviceState *dev = DEVICE(s);
>
>     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
>     object_initialize_child(obj, "ide", &s->ide, TYPE_VIA_IDE);
> @@ -578,6 +588,8 @@ static void via_isa_init(Object *obj)
>     object_initialize_child(obj, "uhci2", &s->uhci[1], TYPE_VT82C686B_USB_UHCI);
>     object_initialize_child(obj, "ac97", &s->ac97, TYPE_VIA_AC97);
>     object_initialize_child(obj, "mc97", &s->mc97, TYPE_VIA_MC97);
> +
> +    qdev_init_gpio_in_named(dev, via_isa_set_ide_irq, "ide", ARRAY_SIZE(s->ide.isa_irq));
> }
>
> static const TypeInfo via_isa_info = {
> @@ -692,6 +704,10 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>     if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
>         return;
>     }
> +    for (i = 0; i < 2; i++) {
> +        qdev_connect_gpio_out(DEVICE(&s->ide), i,
> +                              qdev_get_gpio_in_named(DEVICE(s), "ide", i));
> +    }
>
>     /* Functions 2-3: USB Ports */
>     for (i = 0; i < ARRAY_SIZE(s->uhci); i++) {
> @@ -814,6 +830,7 @@ static void vt8231_isa_reset(DeviceState *dev)
>                  PCI_COMMAND_MASTER | PCI_COMMAND_SPECIAL);
>     pci_set_word(pci_conf + PCI_STATUS, PCI_STATUS_DEVSEL_MEDIUM);
>
> +    pci_conf[0x4a] = 0x04; /* IDE interrupt Routing */
>     pci_conf[0x58] = 0x40; /* Miscellaneous Control 0 */
>     pci_conf[0x67] = 0x08; /* Fast IR Config */
>     pci_conf[0x6b] = 0x01; /* Fast IR I/O Base */
>

