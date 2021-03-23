Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDAD346DEA
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 00:44:55 +0100 (CET)
Received: from localhost ([::1]:44240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOqhi-0003UH-Nn
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 19:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lOqga-0002RX-VB; Tue, 23 Mar 2021 19:43:45 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:21356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lOqgX-00028Y-Dm; Tue, 23 Mar 2021 19:43:43 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B70CF74632F;
 Wed, 24 Mar 2021 00:43:36 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 92F2B74634B; Wed, 24 Mar 2021 00:43:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 912C77462BD;
 Wed, 24 Mar 2021 00:43:36 +0100 (CET)
Date: Wed, 24 Mar 2021 00:43:36 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 5/6] hw/isa/vt82c686: Simplify removing unuseful
 qemu_allocate_irqs() call
In-Reply-To: <20210323231358.396520-6-f4bug@amsat.org>
Message-ID: <b13580a7-be7d-d782-4811-eef8b6555765@eik.bme.hu>
References: <20210323231358.396520-1-f4bug@amsat.org>
 <20210323231358.396520-6-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1660726094-1616543016=:35282"
X-Spam-Probability: 9%
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1660726094-1616543016=:35282
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 24 Mar 2021, Philippe Mathieu-Daudé wrote:
> Instead of creating an input IRQ with qemu_allocate_irqs()
> to pass it as output IRQ of the PIC, with its handler simply
> dispatching into the "intr" output IRQ, simplify by directly
> connecting the PIC to the "intr" named output.

I think I've tried to do it that way first but it did not work for some 
reason, that's why I had to add the additional handler, but this was about 
a year ago so I don't remember the details. Did you test it still works or 
expect me to test it? (Note that testing with firmware only may not be 
enough as some firmwares don't use interrupts so only booting a guest 
might reveal a problem. Not sure about pegasos2 firmware but sam460ex 
U-Boot seems to poll instead of using IRQs.)

Regards,
BALATON Zoltan

> Fixes: 3dc31cb8490 ("vt82c686: Move creation of ISA devices to the ISA bridge")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> hw/isa/vt82c686.c | 10 +---------
> 1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 87473ec121f..3dc3454858e 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -323,12 +323,6 @@ struct VT82C686BISAState {
>     SuperIOConfig superio_cfg;
> };
>
> -static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
> -{
> -    VT82C686BISAState *s = opaque;
> -    qemu_set_irq(s->cpu_intr, level);
> -}
> -
> static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
>                                    uint32_t val, int len)
> {
> @@ -384,14 +378,12 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
>     VT82C686BISAState *s = VT82C686B_ISA(d);
>     DeviceState *dev = DEVICE(d);
>     ISABus *isa_bus;
> -    qemu_irq *isa_irq;
>     int i;
>
>     qdev_init_gpio_out_named(dev, &s->cpu_intr, "intr", 1);
> -    isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
>     isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
>                           &error_fatal);
> -    isa_bus_irqs(isa_bus, i8259_init(isa_bus, *isa_irq));
> +    isa_bus_irqs(isa_bus, i8259_init(isa_bus, s->cpu_intr));
>     i8254_pit_init(isa_bus, 0x40, 0, NULL);
>     i8257_dma_init(isa_bus, 0);
>     isa_create_simple(isa_bus, TYPE_VT82C686B_SUPERIO);
>
--3866299591-1660726094-1616543016=:35282--

