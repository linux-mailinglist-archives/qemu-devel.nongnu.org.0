Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5BA6B0BD2
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 15:48:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZv4T-0001it-R8; Wed, 08 Mar 2023 09:47:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pZv4R-0001i9-3L; Wed, 08 Mar 2023 09:47:11 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pZv4O-0004Fh-Tp; Wed, 08 Mar 2023 09:47:10 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9616D74634B;
 Wed,  8 Mar 2023 15:46:47 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 56A54746346; Wed,  8 Mar 2023 15:46:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 554A874633D;
 Wed,  8 Mar 2023 15:46:47 +0100 (CET)
Date: Wed, 8 Mar 2023 15:46:47 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Rene Engel <ReneEngel80@emailn.de>, Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PULL 14/20] hw/ppc/pegasos2: Fix PCI interrupt routing
In-Reply-To: <dab7a6d9-4bfe-0afe-8098-50cfaf0c6aae@linaro.org>
Message-ID: <6b0038c5-bd6a-d3c3-d43c-fad2aca299fe@eik.bme.hu>
References: <20230307234711.55375-1-philmd@linaro.org>
 <20230307234711.55375-15-philmd@linaro.org>
 <dab7a6d9-4bfe-0afe-8098-50cfaf0c6aae@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-581170101-1678286807=:30352"
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

--3866299591-581170101-1678286807=:30352
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 8 Mar 2023, Philippe Mathieu-Daudé wrote:
> Hi Zoltan,
>
> On 8/3/23 00:47, Philippe Mathieu-Daudé wrote:
>> From: BALATON Zoltan <balaton@eik.bme.hu>
>> 
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
>
> IIUC the schematic, only tje INTA and INTB lines (AGP IRQs) are
> bidirectional and shared between NB/SB.
>
> INTC and INTC are SB output to NB input.

I'll check the schematics again when I have time later but what we know 
for sure is that guests expect PCI interrupts to raise ISA IRQ9 which is 
mapped by the VT8231 ISA function 0c55-0x57 registers. The PCI buses are 
otherwise handled by the north bridge. So how can the VIA PINT pins be 
outputs? Where do the signals from the PCI cards go into VT8231 otherwise? 
Also the VT8231 datasheet on page 10 says PINTA-D pins are inputs so I 
can't understand your reasoning above.

Regards,
BALATON Zoltan

>> This fixes PCI interrupts on pegasos2 under Linux, MorphOS and AmigaOS.
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> Tested-by: Rene Engel <ReneEngel80@emailn.de>
>> Message-Id: 
>> <520ff9e6eeef600ee14a4116c0c7b11940cc499c.1678188711.git.balaton@eik.bme.hu>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
>> index 7cc375df05..f1650be5ee 100644
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
>
> So this handler is only for A/B. We could rename it pegasos2_agp_irq()
> and only wire it to the first 2 pins, but I since we can only register
> one handler per bus, simpler to ...
>
>> +{
>> +    Pegasos2MachineState *pm = opaque;
>> +
>> +    /* PCI interrupt lines are connected to both MV64361 and VT8231 */
>> +    qemu_set_irq(pm->mv_pirq[n], level);
>
> ... add a 'if (n < 2)' check here.
>
>> +    qemu_set_irq(pm->via_pirq[n], level);
>> +}
>
>> @@ -156,11 +167,18 @@ static void pegasos2_init(MachineState *machine)
>>       /* Marvell Discovery II system controller */
>>       pm->mv = DEVICE(sysbus_create_simple(TYPE_MV64361, -1,
>>                             qdev_get_gpio_in(DEVICE(pm->cpu), 
>> PPC6xx_INPUT_INT)));
>> +    for (i = 0; i < PCI_NUM_PINS; i++) {
>> +        pm->mv_pirq[i] = qdev_get_gpio_in_named(pm->mv, "gpp", 12 + i);
>> +    }
>>       pci_bus = mv64361_get_pci_bus(pm->mv, 1);
>> +    pci_bus_irqs(pci_bus, pegasos2_pci_irq, pm, PCI_NUM_PINS);
>>         /* VIA VT8231 South Bridge (multifunction PCI device) */
>>       via = OBJECT(pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 
>> 0),
>>                                                    true, TYPE_VT8231_ISA));
>> +    for (i = 0; i < PCI_NUM_PINS; i++) {
>
> I'd rather declare as via_pirq[2] and iterate over ARRAY_SIZE() here
> (and also use ARRAY_SIZE() in the new check in pegasos2_pci_irq).
>
>> +        pm->via_pirq[i] = qdev_get_gpio_in_named(DEVICE(via), "pirq", i);
>> +    }
>
>
--3866299591-581170101-1678286807=:30352--

