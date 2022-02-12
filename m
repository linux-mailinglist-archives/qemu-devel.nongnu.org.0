Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 737B24B3550
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 14:36:35 +0100 (CET)
Received: from localhost ([::1]:41502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIsZm-00025C-3v
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 08:36:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nIsR8-0006Xa-OG; Sat, 12 Feb 2022 08:27:45 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:26323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nIsR5-0005hC-OJ; Sat, 12 Feb 2022 08:27:38 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CC0E974579D;
 Sat, 12 Feb 2022 14:27:32 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8E673745708; Sat, 12 Feb 2022 14:27:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8A4DC7456E3;
 Sat, 12 Feb 2022 14:27:32 +0100 (CET)
Date: Sat, 12 Feb 2022 14:27:32 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH v2 2/5] pci: Always pass own DeviceState to
 pci_map_irq_fn's
In-Reply-To: <20220212113519.69527-3-shentey@gmail.com>
Message-ID: <d6e47199-343e-46c0-d44f-64bc8d6e8385@eik.bme.hu>
References: <20220212113519.69527-1-shentey@gmail.com>
 <20220212113519.69527-3-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1030076994-1644672452=:48202"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, qemu-devel@nongnu.org,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "open list:Versatile PB" <qemu-arm@nongnu.org>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 "open list:ppc4xx" <qemu-ppc@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1030076994-1644672452=:48202
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 12 Feb 2022, Bernhard Beschow wrote:
> Passing own DeviceState rather than just the IRQs allows for resolving
> global variables.

Do you mean pci_set_irq_fn instead of pci_map_irq_fn in the patch title?

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> hw/isa/piix4.c          | 6 +++---
> hw/pci-host/sh_pci.c    | 6 +++---
> hw/pci-host/versatile.c | 6 +++---
> hw/ppc/ppc440_pcix.c    | 6 +++---
> hw/ppc/ppc4xx_pci.c     | 6 +++---
> 5 files changed, 15 insertions(+), 15 deletions(-)

You don't seem to change any global function definition that reqires this 
change in all these devices so why can't these decide on their own what 
their preferred opaque data is for their set irq function and only change 
piix4? Am I missing something? I'm not opposed to this change but it seems 
to be unnecessary to touch other device implementations for this and may 
just make them more complex for no good reason.

Regards,
BALATON Zoltan

> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index 5a86308689..a31e9714cf 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -60,7 +60,7 @@ static int pci_irq_levels[4];
> static void piix4_set_irq(void *opaque, int irq_num, int level)
> {
>     int i, pic_irq, pic_level;
> -    qemu_irq *pic = opaque;
> +    PIIX4State *s = opaque;
>
>     pci_irq_levels[irq_num] = level;
>
> @@ -75,7 +75,7 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
>                 pic_level |= pci_irq_levels[i];
>             }
>         }
> -        qemu_set_irq(pic[pic_irq], pic_level);
> +        qemu_set_irq(s->i8259[pic_irq], pic_level);
>     }
> }
>
> @@ -323,7 +323,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
>                                NULL, 0, NULL);
>     }
>
> -    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s->i8259, 4);
> +    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, 4);
>
>     for (int i = 0; i < ISA_NUM_IRQS; i++) {
>         s->i8259[i] = qdev_get_gpio_in_named(dev, "isa", i);
> diff --git a/hw/pci-host/sh_pci.c b/hw/pci-host/sh_pci.c
> index 719d6ca2a6..ae0aa462b3 100644
> --- a/hw/pci-host/sh_pci.c
> +++ b/hw/pci-host/sh_pci.c
> @@ -111,9 +111,9 @@ static int sh_pci_map_irq(PCIDevice *d, int irq_num)
>
> static void sh_pci_set_irq(void *opaque, int irq_num, int level)
> {
> -    qemu_irq *pic = opaque;
> +    SHPCIState *s = opaque;
>
> -    qemu_set_irq(pic[irq_num], level);
> +    qemu_set_irq(s->irq[irq_num], level);
> }
>
> static void sh_pci_device_realize(DeviceState *dev, Error **errp)
> @@ -128,7 +128,7 @@ static void sh_pci_device_realize(DeviceState *dev, Error **errp)
>     }
>     phb->bus = pci_register_root_bus(dev, "pci",
>                                      sh_pci_set_irq, sh_pci_map_irq,
> -                                     s->irq,
> +                                     s,
>                                      get_system_memory(),
>                                      get_system_io(),
>                                      PCI_DEVFN(0, 0), 4, TYPE_PCI_BUS);
> diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
> index f66384fa02..5fbcb72d7d 100644
> --- a/hw/pci-host/versatile.c
> +++ b/hw/pci-host/versatile.c
> @@ -362,9 +362,9 @@ static int pci_vpb_rv_map_irq(PCIDevice *d, int irq_num)
>
> static void pci_vpb_set_irq(void *opaque, int irq_num, int level)
> {
> -    qemu_irq *pic = opaque;
> +    PCIVPBState *s = opaque;
>
> -    qemu_set_irq(pic[irq_num], level);
> +    qemu_set_irq(s->irq[irq_num], level);
> }
>
> static void pci_vpb_reset(DeviceState *d)
> @@ -422,7 +422,7 @@ static void pci_vpb_realize(DeviceState *dev, Error **errp)
>         mapfn = pci_vpb_map_irq;
>     }
>
> -    pci_bus_irqs(&s->pci_bus, pci_vpb_set_irq, mapfn, s->irq, 4);
> +    pci_bus_irqs(&s->pci_bus, pci_vpb_set_irq, mapfn, s, 4);
>
>     /* Our memory regions are:
>      * 0 : our control registers
> diff --git a/hw/ppc/ppc440_pcix.c b/hw/ppc/ppc440_pcix.c
> index 788d25514a..291c1bfbe7 100644
> --- a/hw/ppc/ppc440_pcix.c
> +++ b/hw/ppc/ppc440_pcix.c
> @@ -431,14 +431,14 @@ static int ppc440_pcix_map_irq(PCIDevice *pci_dev, int irq_num)
>
> static void ppc440_pcix_set_irq(void *opaque, int irq_num, int level)
> {
> -    qemu_irq *pci_irq = opaque;
> +    PPC440PCIXState *s = opaque;
>
>     trace_ppc440_pcix_set_irq(irq_num);
>     if (irq_num < 0) {
>         error_report("%s: PCI irq %d", __func__, irq_num);
>         return;
>     }
> -    qemu_set_irq(*pci_irq, level);
> +    qemu_set_irq(s->irq, level);
> }
>
> static AddressSpace *ppc440_pcix_set_iommu(PCIBus *b, void *opaque, int devfn)
> @@ -492,7 +492,7 @@ static void ppc440_pcix_realize(DeviceState *dev, Error **errp)
>     sysbus_init_irq(sbd, &s->irq);
>     memory_region_init(&s->busmem, OBJECT(dev), "pci bus memory", UINT64_MAX);
>     h->bus = pci_register_root_bus(dev, NULL, ppc440_pcix_set_irq,
> -                         ppc440_pcix_map_irq, &s->irq, &s->busmem,
> +                         ppc440_pcix_map_irq, s, &s->busmem,
>                          get_system_io(), PCI_DEVFN(0, 0), 1, TYPE_PCI_BUS);
>
>     s->dev = pci_create_simple(h->bus, PCI_DEVFN(0, 0), "ppc4xx-host-bridge");
> diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
> index 5df97e6d15..f6718746a1 100644
> --- a/hw/ppc/ppc4xx_pci.c
> +++ b/hw/ppc/ppc4xx_pci.c
> @@ -256,11 +256,11 @@ static int ppc4xx_pci_map_irq(PCIDevice *pci_dev, int irq_num)
>
> static void ppc4xx_pci_set_irq(void *opaque, int irq_num, int level)
> {
> -    qemu_irq *pci_irqs = opaque;
> +    PPC4xxPCIState *s = opaque;
>
>     trace_ppc4xx_pci_set_irq(irq_num);
>     assert(irq_num >= 0 && irq_num < PPC4xx_PCI_NUM_DEVS);
> -    qemu_set_irq(pci_irqs[irq_num], level);
> +    qemu_set_irq(s->irq[irq_num], level);
> }
>
> static const VMStateDescription vmstate_pci_master_map = {
> @@ -319,7 +319,7 @@ static void ppc4xx_pcihost_realize(DeviceState *dev, Error **errp)
>     }
>
>     b = pci_register_root_bus(dev, NULL, ppc4xx_pci_set_irq,
> -                              ppc4xx_pci_map_irq, s->irq, get_system_memory(),
> +                              ppc4xx_pci_map_irq, s, get_system_memory(),
>                               get_system_io(), 0, ARRAY_SIZE(s->irq),
>                               TYPE_PCI_BUS);
>     h->bus = b;
>
--3866299591-1030076994-1644672452=:48202--

