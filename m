Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 636046A6E46
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 15:21:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXNKL-0007Hb-4G; Wed, 01 Mar 2023 09:21:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXNKI-0007H2-JH; Wed, 01 Mar 2023 09:21:03 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXNKG-0000Vi-RN; Wed, 01 Mar 2023 09:21:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vfPUVVxhMCTTmDWhAi413Rt68pz/KYmautxhYxHy4SU=; b=KQPzXGMd74r7qNRLpq4hWxvDjJ
 Q21fi+6vt9GK2BREHdBDjNGBC3szU4CiiU100k+whij0y4SXhCtCz0QpPoSOE2t8HLM6cJjdJBXz1
 oUwXhtJiZBn4owSNwkHjSHKbZfEKLP0SPoAr5OLsQIeVLevfvwRuyk5rrFOMka7xkUz7+jgHkmrhu
 4sXIHzOmiHbzypY7ATRmFhyE94UjRyzra4pKRpmzG7OtDKHoclL7M2w5gDvxcpTgp09Vd3frTu1Yd
 cjTjn8u9fDNEVjPApnxSO6k3gamnxQx4WN+rpLybeHctS9DwIbvDqbfZsYVsuIu2gS87/roih+Eam
 xuBlRnMUPHSvhfTiDQdUJp989E/T4EJRs7ZEU45XftWCo7HDA7EndtFwCTg+WsvLedzUli94pid+U
 Nlrvphb1bIUMbn6Ea/Gj4ha93hu6E1xCZ6gQ9DSWtT1CJc3vS+mmgMoHYdm7QXrE4vwZXpTrrlot3
 NygQROjphVzVIkzG7Ppwx/4N8Cu29n7/bK/sv0abMz+gVrhvxTIXO9dznnDSOrfch0kZdU+ScyV0+
 fliLmfBCyuOc3y3d/J8fgeH4oIa1S+FSO74wsvUeEbCrDeiVQxon/MSPu3IZhr75V2Cf1uywibVhl
 7OruoupuMbEe2UX6xtM5dwq9nGaAC/6Ze5hdYVJ40=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXNJc-0001U3-16; Wed, 01 Mar 2023 14:20:20 +0000
Message-ID: <72f52a39-ecce-d17e-5161-5937076955ec@ilande.co.uk>
Date: Wed, 1 Mar 2023 14:20:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20230223202053.117050-1-shentey@gmail.com>
 <20230223202053.117050-3-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230223202053.117050-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 2/5] hw/isa/vt82c686: Implement PCI IRQ routing
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 23/02/2023 20:20, Bernhard Beschow wrote:

> The real VIA south bridges implement a PCI IRQ router which is configured
> by the BIOS or the OS. In order to respect these configurations, QEMU
> needs to implement it as well.
> 
> Note: The implementation was taken from piix4_set_irq() in hw/isa/piix4.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/vt82c686.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 44 insertions(+)
> 
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 3f9bd0c04d..f24e387d63 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -604,6 +604,48 @@ static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
>       qemu_set_irq(s->cpu_intr, level);
>   }
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
>   static void via_isa_realize(PCIDevice *d, Error **errp)
>   {
>       ViaISAState *s = VIA_ISA(d);
> @@ -676,6 +718,8 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>       if (!qdev_realize(DEVICE(&s->mc97), BUS(pci_bus), errp)) {
>           return;
>       }
> +
> +    pci_bus_irqs(pci_bus, via_isa_set_pci_irq, s, PCI_NUM_PINS);
>   }
>   
>   /* TYPE_VT82C686B_ISA */

This looks right, however generally a PCI device shouldn't really be setting PCI bus 
IRQs: this is normally done by the PCI host bridge. Is it just the case that the x86 
world is different here for legacy reasons?


ATB,

Mark.

