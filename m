Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62706ADCD2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:08:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZV9h-0002s8-3E; Tue, 07 Mar 2023 06:06:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pZV9e-0002oV-92; Tue, 07 Mar 2023 06:06:50 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pZV9b-00027K-OC; Tue, 07 Mar 2023 06:06:49 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 96F5E746335;
 Tue,  7 Mar 2023 12:06:31 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2C6DD7457E7; Tue,  7 Mar 2023 12:06:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2B192745720;
 Tue,  7 Mar 2023 12:06:31 +0100 (CET)
Date: Tue, 7 Mar 2023 12:06:31 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Bernhard Beschow <shentey@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org, 
 ReneEngel80@emailn.de
Subject: Re: [PATCH v8 4/6] hw/ppc/pegasos2: Fix PCI interrupt routing
In-Reply-To: <b36612d2-b890-8480-0cd2-7625a142e730@ilande.co.uk>
Message-ID: <7c26061a-300a-827b-b3a0-472fea551c62@eik.bme.hu>
References: <cover.1678105081.git.balaton@eik.bme.hu>
 <42b740d38b810474948b303b0d325dc1aa054224.1678105081.git.balaton@eik.bme.hu>
 <b9400e40-b0da-c260-068b-4358933f933d@ilande.co.uk>
 <8e57aba8-64c4-d773-fdb3-37e07401f52c@eik.bme.hu>
 <b36612d2-b890-8480-0cd2-7625a142e730@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2079695254-1678187191=:97852"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-2079695254-1678187191=:97852
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 7 Mar 2023, Mark Cave-Ayland wrote:
> On 06/03/2023 22:00, BALATON Zoltan wrote:
>> On Mon, 6 Mar 2023, Mark Cave-Ayland wrote:
>>> On 06/03/2023 12:33, BALATON Zoltan wrote:
>>>> According to the PegasosII schematics the PCI interrupt lines are
>>>> connected to both the gpp pins of the Mv64361 north bridge and the
>>>> PINT pins of the VT8231 south bridge so guests can get interrupts from
>>>> either of these. So far we only had the MV64361 connections which
>>>> worked for on board devices but for additional PCI devices (such as
>>>> network or sound card added with -device) guest OSes expect interrupt
>>>> from the ISA IRQ 9 where the firmware routes these PCI interrupts in
>>>> VT8231 ISA bridge. After the previous patches we can now model this
>>>> and also remove the board specific connection from mv64361. Also
>>>> configure routing of these lines when using Virtual Open Firmware to
>>>> match board firmware for guests that expect this.
>>>> 
>>>> This fixes PCI interrupts on pegasos2 under Linux, MorphOS and AmigaOS.
>>>> 
>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>> Tested-by: Rene Engel <ReneEngel80@emailn.de>
>>>> ---
>>>>   hw/pci-host/mv64361.c |  4 ----
>>>>   hw/ppc/pegasos2.c     | 26 +++++++++++++++++++++++++-
>>>>   2 files changed, 25 insertions(+), 5 deletions(-)
>>>> 
>>>> diff --git a/hw/pci-host/mv64361.c b/hw/pci-host/mv64361.c
>>>> index 298564f1f5..19e8031a3f 100644
>>>> --- a/hw/pci-host/mv64361.c
>>>> +++ b/hw/pci-host/mv64361.c
>>>> @@ -873,10 +873,6 @@ static void mv64361_realize(DeviceState *dev, Error 
>>>> **errp)
>>>>       }
>>>>       sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->cpu_irq);
>>>>       qdev_init_gpio_in_named(dev, mv64361_gpp_irq, "gpp", 32);
>>>> -    /* FIXME: PCI IRQ connections may be board specific */
>>>> -    for (i = 0; i < PCI_NUM_PINS; i++) {
>>>> -        s->pci[1].irq[i] = qdev_get_gpio_in_named(dev, "gpp", 12 + i);
>>>> -    }
>>>>   }
>>>>     static void mv64361_reset(DeviceState *dev)
>>>> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
>>>> index b0ada9c963..ded5dc2dc9 100644
>>>> --- a/hw/ppc/pegasos2.c
>>>> +++ b/hw/ppc/pegasos2.c
>>>> @@ -73,6 +73,8 @@ struct Pegasos2MachineState {
>>>>       MachineState parent_obj;
>>>>       PowerPCCPU *cpu;
>>>>       DeviceState *mv;
>>>> +    qemu_irq mv_pirq[PCI_NUM_PINS];
>>>> +    qemu_irq via_pirq[PCI_NUM_PINS];
>>>>       Vof *vof;
>>>>       void *fdt_blob;
>>>>       uint64_t kernel_addr;
>>>> @@ -95,6 +97,15 @@ static void pegasos2_cpu_reset(void *opaque)
>>>>       }
>>>>   }
>>>>   +static void pegasos2_pci_irq(void *opaque, int n, int level)
>>>> +{
>>>> +    Pegasos2MachineState *pm = opaque;
>>>> +
>>>> +    /* PCI interrupt lines are connected to both MV64361 and VT8231 */
>>>> +    qemu_set_irq(pm->mv_pirq[n], level);
>>>> +    qemu_set_irq(pm->via_pirq[n], level);
>>>> +}
>>>> +
>>> 
>>> Can you explain a bit more about how the PCI interrupt lines are connected 
>>> to both the MV64361 and VT8231? The reason for asking is that I see a 
>>> similar
>> 
>> I think I already did that in previous replies but I try again. In 
>> pagasosII schematics at 
>> https://www.powerdeveloper.org/platforms/pegasos/schematics
>> 
>> Sheet 2 Marvell System Controller shows PINTA-D are connected to MV64361 
>> MPP12-15 pins that are also called GPP in the docs (I think these are 
>> referred to as either Multi Purpose or General Purpose Pins).
>> 
>> Sheet 18 VIA VT8231 Southbridge shows INTR_A-D connected to VT8231 PINTA-D 
>> pins, which are connected to INTA-D on sheet 13 PCI Top Level. Sheet 1 Top 
>> Level Pegasos shows that Sheet 13 INTA-D are connected to Sheet 2 PINTA-D.
>> 
>>> pattern in the bonito board, but there I can't see how those lines would 
>>> be used because they can also raise a CPU interrupt, yet it is a different 
>>> one compared to the 8259.
>> 
>> Both the MV64361 and VT8231 have interrupt mask registers which allow the 
>> guest to choose where it wants an interrupt from. I guess different guests 
>> could use one or the other, unlikely they would use both but they could 
>> even do that if they wanted. I guess in bonito it's also maskable so the 
>> guest could set up irqs by programing the apprpriate north and south bridge 
>> registers. A guest which has ISA drivers (probably most) may likely want to 
>> route them to ISA IRQs in the VIA chip. Maybe this strange behaviour has to 
>> do with Windows compatibility and standards back then which never really 
>> took off like CHRP for PP
>> 
>>> Given that we know from Bernhard's tests that the fuloong2e board works 
>>> with pci_bus_irqs() included in via_isa_realize() which overwrites the 
>>> bonito equivalent, I'm wondering if the mv_pirq array is actually needed 
>>> at all and whether it may just be a debugging aid? Certainly it makes 
>>> things simpler to just route everything to the VIA device.
>> 
>> In any case calling pci_bus_irqs in the VIA device would be wrong and 
>> connections 
>
> Why? In general the PCI bus should be managed completely internally and not 
> exposed to the board. This should certainly be the case for the VIA chipsets 
> which can be used across multiple QEMU machines.

The PCI bus belongs to the Mv64361 so can't be managed by VT8231 
internally which is a south bridge and a PCI device. The datasheet clearly 
says it has pins for PCI interrupts that it can route to ISA interrupts 
which is what I've modelled. Other times you want me to model every 
unnecessary detail of a chip with QDev but in this case you'd be OK to 
break things by replacing IRQs of a bus this device is connected to and 
not even owning? I can't follow what you think.

>> should be made here by the board as that correctly models the hardware 
>> separating components and allows different boards to use the chip model in 
>> the future. I remember that I've implemenred connections to MV64361 for 
>> something but I don't remember which guest so as this already works and 
>> models what the schematics say I see no reason not to have it or remove it.
>
> That doesn't really help much I'm afraid - are the extra pirq lines required 
> or not? If so, which guest OS are they being used for? This information 
> should be included in the commit message and a code comment, as if you don't 
> document things like this you risk someone attempting a tidy-up refactoring 
> which will break your guest OS.

My understanding of the schematics is what I've written and it matches the 
code now so I'm happy with that. I'll make sure that no refactoring will 
break guests I care about and removing this could break something while 
leaving doesn't.

Regards,
BALATON Zoltan
--3866299591-2079695254-1678187191=:97852--

