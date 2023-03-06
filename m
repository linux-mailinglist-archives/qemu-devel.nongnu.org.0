Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DDB6AD144
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 23:15:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZJ68-0007o0-8y; Mon, 06 Mar 2023 17:14:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pZJ65-0007nW-KS; Mon, 06 Mar 2023 17:14:21 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pZJ63-0000bE-IM; Mon, 06 Mar 2023 17:14:21 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id AAF2B74633D;
 Mon,  6 Mar 2023 23:14:05 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 674B974632B; Mon,  6 Mar 2023 23:14:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 660737457E7;
 Mon,  6 Mar 2023 23:14:05 +0100 (CET)
Date: Mon, 6 Mar 2023 23:14:05 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Bernhard Beschow <shentey@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org, 
 ReneEngel80@emailn.de
Subject: Re: [PATCH v8 4/6] hw/ppc/pegasos2: Fix PCI interrupt routing
In-Reply-To: <b9400e40-b0da-c260-068b-4358933f933d@ilande.co.uk>
Message-ID: <01c02da7-ce82-80cf-c7e7-27b7f6e36bdd@eik.bme.hu>
References: <cover.1678105081.git.balaton@eik.bme.hu>
 <42b740d38b810474948b303b0d325dc1aa054224.1678105081.git.balaton@eik.bme.hu>
 <b9400e40-b0da-c260-068b-4358933f933d@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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

On Mon, 6 Mar 2023, Mark Cave-Ayland wrote:
> On 06/03/2023 12:33, BALATON Zoltan wrote:
>> According to the PegasosII schematics the PCI interrupt lines are
>> connected to both the gpp pins of the Mv64361 north bridge and the
>> PINT pins of the VT8231 south bridge so guests can get interrupts from
>> either of these. So far we only had the MV64361 connections which
>> worked for on board devices but for additional PCI devices (such as
>> network or sound card added with -device) guest OSes expect interrupt
>> from the ISA IRQ 9 where the firmware routes these PCI interrupts in
>> VT8231 ISA bridge. After the previous patches we can now model this
>> and also remove the board specific connection from mv64361. Also
>> configure routing of these lines when using Virtual Open Firmware to
>> match board firmware for guests that expect this.
>> 
>> This fixes PCI interrupts on pegasos2 under Linux, MorphOS and AmigaOS.
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> Tested-by: Rene Engel <ReneEngel80@emailn.de>
>> ---
>>   hw/pci-host/mv64361.c |  4 ----
>>   hw/ppc/pegasos2.c     | 26 +++++++++++++++++++++++++-
>>   2 files changed, 25 insertions(+), 5 deletions(-)
>> 
>> diff --git a/hw/pci-host/mv64361.c b/hw/pci-host/mv64361.c
>> index 298564f1f5..19e8031a3f 100644
>> --- a/hw/pci-host/mv64361.c
>> +++ b/hw/pci-host/mv64361.c
>> @@ -873,10 +873,6 @@ static void mv64361_realize(DeviceState *dev, Error 
>> **errp)
>>       }
>>       sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->cpu_irq);
>>       qdev_init_gpio_in_named(dev, mv64361_gpp_irq, "gpp", 32);
>> -    /* FIXME: PCI IRQ connections may be board specific */
>> -    for (i = 0; i < PCI_NUM_PINS; i++) {
>> -        s->pci[1].irq[i] = qdev_get_gpio_in_named(dev, "gpp", 12 + i);
>> -    }
>>   }
>>     static void mv64361_reset(DeviceState *dev)
>> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
>> index b0ada9c963..ded5dc2dc9 100644
>> --- a/hw/ppc/pegasos2.c
>> +++ b/hw/ppc/pegasos2.c
>> @@ -73,6 +73,8 @@ struct Pegasos2MachineState {
>>       MachineState parent_obj;
>>       PowerPCCPU *cpu;
>>       DeviceState *mv;
>> +    qemu_irq mv_pirq[PCI_NUM_PINS];
>> +    qemu_irq via_pirq[PCI_NUM_PINS];
>>       Vof *vof;
>>       void *fdt_blob;
>>       uint64_t kernel_addr;
>> @@ -95,6 +97,15 @@ static void pegasos2_cpu_reset(void *opaque)
>>       }
>>   }
>>   +static void pegasos2_pci_irq(void *opaque, int n, int level)
>> +{
>> +    Pegasos2MachineState *pm = opaque;
>> +
>> +    /* PCI interrupt lines are connected to both MV64361 and VT8231 */
>> +    qemu_set_irq(pm->mv_pirq[n], level);
>> +    qemu_set_irq(pm->via_pirq[n], level);
>> +}
>> +
>
> Can you explain a bit more about how the PCI interrupt lines are connected to 
> both the MV64361 and VT8231? The reason for asking is that I see a similar 
> pattern in the bonito board, but there I can't see how those lines would be 
> used because they can also raise a CPU interrupt, yet it is a different one 
> compared to the 8259.
>
> Given that we know from Bernhard's tests that the fuloong2e board works with 
> pci_bus_irqs() included in via_isa_realize() which overwrites the bonito 
> equivalent, I'm wondering if the mv_pirq array is actually needed at all and

Also I'd be cautious of tests on fuloong2e unless it was done with binary 
known to work on real machine as we have found before that those binaries 
for the real machine expect IDE to use IRQ 14/15 like pegasos2 guests but 
the e.g. the default config in Linux would also work with native IRQs as 
documented in the datasheet but that's apparently not how it really works 
on real hardware (proven by binaries written for and tested on real 
hardware did not work with the model which followed the datasheet) so we 
had to change that later to match hardware. You may remember this, it was 
found around the time when we tested via-ide with different guests and 
some worked some didn't with the native mode IRQs. This suggests that 
datasheets and tests with code not verified to work on real hardware is 
unreliable (so are PCI standards that the VIA chip apparently does not 
follow). So I'd only trust guests that were running on the real machine.

Regards,
BALATON Zoltan

