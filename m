Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4D26A11BE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 22:12:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVIsK-0004nM-1T; Thu, 23 Feb 2023 16:11:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pVIsG-0004n2-GA; Thu, 23 Feb 2023 16:11:32 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pVIsD-0006z9-Ix; Thu, 23 Feb 2023 16:11:31 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 08C5C746377;
 Thu, 23 Feb 2023 22:11:24 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 93CC7746324; Thu, 23 Feb 2023 22:11:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 9277474635C;
 Thu, 23 Feb 2023 22:11:23 +0100 (CET)
Date: Thu, 23 Feb 2023 22:11:23 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 2/5] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <20230223202053.117050-3-shentey@gmail.com>
Message-ID: <a9efb349-e2b9-1ece-cded-ee500457f1cf@eik.bme.hu>
References: <20230223202053.117050-1-shentey@gmail.com>
 <20230223202053.117050-3-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 23 Feb 2023, Bernhard Beschow wrote:
> The real VIA south bridges implement a PCI IRQ router which is configured
> by the BIOS or the OS. In order to respect these configurations, QEMU
> needs to implement it as well.
>
> Note: The implementation was taken from piix4_set_irq() in hw/isa/piix4.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> hw/isa/vt82c686.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 44 insertions(+)
>
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 3f9bd0c04d..f24e387d63 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -604,6 +604,48 @@ static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
>     qemu_set_irq(s->cpu_intr, level);
> }
>
> +static int via_isa_get_pci_irq(const ViaISAState *s, int irq_num)
> +{
> +    switch (irq_num) {
> +    case 0:
> +        return s->dev.config[0x55] >> 4;
> +
> +    case 1:
> +        return s->dev.config[0x56] & 0xf;
> +
> +    case 2:
> +        return s->dev.config[0x56] >> 4;
> +
> +    case 3:
> +        return s->dev.config[0x57] >> 4;
> +    }
> +
> +    return 0;
> +}
> +
> +static void via_isa_set_pci_irq(void *opaque, int irq_num, int level)
> +{
> +    ViaISAState *s = opaque;
> +    PCIBus *bus = pci_get_bus(&s->dev);
> +    int pic_irq;
> +
> +    /* now we change the pic irq level according to the via irq mappings */
> +    /* XXX: optimize */
> +    pic_irq = via_isa_get_pci_irq(s, irq_num);
> +    if (pic_irq < ISA_NUM_IRQS) {
> +        int i, pic_level;
> +
> +        /* The pic level is the logical OR of all the PCI irqs mapped to it. */
> +        pic_level = 0;
> +        for (i = 0; i < PCI_NUM_PINS; i++) {
> +            if (pic_irq == via_isa_get_pci_irq(s, i)) {
> +                pic_level |= pci_bus_get_irq_level(bus, i);
> +            }
> +        }
> +        qemu_set_irq(s->isa_irqs[pic_irq], pic_level);
> +    }
> +}
> +
> static void via_isa_realize(PCIDevice *d, Error **errp)
> {
>     ViaISAState *s = VIA_ISA(d);
> @@ -676,6 +718,8 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>     if (!qdev_realize(DEVICE(&s->mc97), BUS(pci_bus), errp)) {
>         return;
>     }
> +
> +    pci_bus_irqs(pci_bus, via_isa_set_pci_irq, s, PCI_NUM_PINS);

Please no oversimplification. This replaces the connections to mv64361 gpp 
pins made in mv64361_realize() and breaks the interrupts that can be 
enabled in mv64361. I've implemented that for something but can't remember 
now which guest exactly, but this would be needed so please restore my 
pegasos2 patch and move this there connecting both mv64361 and via-isa to 
PCI interrupts as shown in the schematics. That means you also need the 
PIRQ pins here. Can you do a new version with that? I'll try this one in 
the meantime but I'm quite sure this is wrong as it is. You can drop the 
via-ac97 patches from this series, I can submit them separately rebased on 
the final IRQ series we come up with.

Regards,
BALATON Zoltan

> }
>
> /* TYPE_VT82C686B_ISA */
>

