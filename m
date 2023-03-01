Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5D36A6449
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 01:35:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXAPf-0003z5-63; Tue, 28 Feb 2023 19:33:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXAPU-0003fW-Ua; Tue, 28 Feb 2023 19:33:33 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXAPT-0005XX-2A; Tue, 28 Feb 2023 19:33:32 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 75322746369;
 Wed,  1 Mar 2023 01:33:28 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3E80074633D; Wed,  1 Mar 2023 01:33:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 3C593746335;
 Wed,  1 Mar 2023 01:33:28 +0100 (CET)
Date: Wed, 1 Mar 2023 01:33:28 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
cc: Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Bernhard Beschow <shentey@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org, 
 ReneEngel80@emailn.de
Subject: Re: [PATCH v5 2/7] Revert "hw/isa/vt82c686: Remove intermediate IRQ
 forwarder"
In-Reply-To: <cdfb3c5a42e505450f6803124f27856434c5b298.1677628524.git.balaton@eik.bme.hu>
Message-ID: <709f5780-97e5-0cee-d776-4558cf39e000@eik.bme.hu>
References: <cover.1677628524.git.balaton@eik.bme.hu>
 <cdfb3c5a42e505450f6803124f27856434c5b298.1677628524.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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

On Wed, 1 Mar 2023, BALATON Zoltan wrote:
> This partially reverts commit bb98e0f59cde846666d9fddc60ae74ef7ddfca17
> keeping the rename of a state field but reverting other cahanges which
> break interrupts on pegasos2.

I've found this with just booting the MorphOS iso which now hangs without 
this revert when trying to read from the ide device. I think I've 
mentioned that I've also tried this way first but then ended up adding 
this because it was needed in a review of the patch earlier but I can't 
find that message now. For now it seems the easiest is to revert this and 
think about it later.

Regards,
BALATON Zoltan

> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
> hw/isa/vt82c686.c | 10 +++++++++-
> 1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index f4c40965cd..01e0148967 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -598,15 +598,23 @@ void via_isa_set_irq(PCIDevice *d, int n, int level)
>     qemu_set_irq(s->isa_irqs_in[n], level);
> }
>
> +static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
> +{
> +    ViaISAState *s = opaque;
> +    qemu_set_irq(s->cpu_intr, level);
> +}
> +
> static void via_isa_realize(PCIDevice *d, Error **errp)
> {
>     ViaISAState *s = VIA_ISA(d);
>     DeviceState *dev = DEVICE(d);
>     PCIBus *pci_bus = pci_get_bus(d);
> +    qemu_irq *isa_irq;
>     ISABus *isa_bus;
>     int i;
>
>     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
> +    isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
>     isa_bus = isa_bus_new(dev, pci_address_space(d), pci_address_space_io(d),
>                           errp);
>
> @@ -614,7 +622,7 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>         return;
>     }
>
> -    s->isa_irqs_in = i8259_init(isa_bus, s->cpu_intr);
> +    s->isa_irqs_in = i8259_init(isa_bus, *isa_irq);
>     isa_bus_register_input_irqs(isa_bus, s->isa_irqs_in);
>     i8254_pit_init(isa_bus, 0x40, 0, NULL);
>     i8257_dma_init(isa_bus, 0);
>

