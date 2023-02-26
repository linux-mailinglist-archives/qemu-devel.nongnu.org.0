Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DBF6A359D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 00:40:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWQcB-0002xw-L5; Sun, 26 Feb 2023 18:39:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWQc9-0002xd-De; Sun, 26 Feb 2023 18:39:33 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWQc7-0000Uu-Bh; Sun, 26 Feb 2023 18:39:32 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 38B8874635C;
 Mon, 27 Feb 2023 00:39:29 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E7238745720; Mon, 27 Feb 2023 00:39:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E559D745706;
 Mon, 27 Feb 2023 00:39:28 +0100 (CET)
Date: Mon, 27 Feb 2023 00:39:28 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org, 
 vr_qemu@t-online.de, ReneEngel80@emailn.de
Subject: Re: [PATCH v3 5/8] hw/ppc/pegasos2: Fix PCI interrupt routing
In-Reply-To: <4D66E3E5-E870-43AD-A702-3285850C59B3@gmail.com>
Message-ID: <3d24be58-0f56-697d-6042-4f3de8960ee8@eik.bme.hu>
References: <cover.1677445307.git.balaton@eik.bme.hu>
 <eca1ecce0b814ece8d285cb869ff839130a37b70.1677445307.git.balaton@eik.bme.hu>
 <4D66E3E5-E870-43AD-A702-3285850C59B3@gmail.com>
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

On Sun, 26 Feb 2023, Bernhard Beschow wrote:
> Am 16. Februar 2023 20:27:32 UTC schrieb BALATON Zoltan <balaton@eik.bme.hu>:
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
>> Tested-by: Rene Engel <ReneEngel80@emailn.de>
>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>> hw/pci-host/mv64361.c |  4 ----
>> hw/ppc/pegasos2.c     | 26 +++++++++++++++++++++++++-
>> 2 files changed, 25 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/pci-host/mv64361.c b/hw/pci-host/mv64361.c
>> index f43f33fbd9..3d9132f989 100644
>> --- a/hw/pci-host/mv64361.c
>> +++ b/hw/pci-host/mv64361.c
>> @@ -874,10 +874,6 @@ static void mv64361_realize(DeviceState *dev, Error **errp)
>>     }
>>     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->cpu_irq);
>>     qdev_init_gpio_in_named(dev, mv64361_gpp_irq, "gpp", 32);
>> -    /* FIXME: PCI IRQ connections may be board specific */
>> -    for (i = 0; i < PCI_NUM_PINS; i++) {
>> -        s->pci[1].irq[i] = qdev_get_gpio_in_named(dev, "gpp", 12 + i);
>> -    }
>> }
>>
>> static void mv64361_reset(DeviceState *dev)
>> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
>> index a9563f4fb2..4e1476673b 100644
>> --- a/hw/ppc/pegasos2.c
>> +++ b/hw/ppc/pegasos2.c
>> @@ -74,6 +74,8 @@ struct Pegasos2MachineState {
>>     MachineState parent_obj;
>>     PowerPCCPU *cpu;
>>     DeviceState *mv;
>> +    qemu_irq mv_pirq[PCI_NUM_PINS];
>> +    qemu_irq via_pirq[PCI_NUM_PINS];
>>     Vof *vof;
>>     void *fdt_blob;
>>     uint64_t kernel_addr;
>> @@ -96,6 +98,15 @@ static void pegasos2_cpu_reset(void *opaque)
>>     }
>> }
>>
>> +static void pegasos2_pci_irq(void *opaque, int n, int level)
>> +{
>> +    Pegasos2MachineState *pm = opaque;
>> +
>> +    /* PCI interrupt lines are connected to both MV64361 and VT8231 */
>> +    qemu_set_irq(pm->mv_pirq[n], level);
>> +    qemu_set_irq(pm->via_pirq[n], level);
>> +}
>> +
>> static void pegasos2_init(MachineState *machine)
>> {
>>     Pegasos2MachineState *pm = PEGASOS2_MACHINE(machine);
>> @@ -107,7 +118,7 @@ static void pegasos2_init(MachineState *machine)
>>     I2CBus *i2c_bus;
>>     const char *fwname = machine->firmware ?: PROM_FILENAME;
>>     char *filename;
>> -    int sz;
>> +    int i, sz;
>>     uint8_t *spd_data;
>>
>>     /* init CPU */
>> @@ -157,11 +168,18 @@ static void pegasos2_init(MachineState *machine)
>>     /* Marvell Discovery II system controller */
>>     pm->mv = DEVICE(sysbus_create_simple(TYPE_MV64361, -1,
>>                           qdev_get_gpio_in(DEVICE(pm->cpu), PPC6xx_INPUT_INT)));
>> +    for (i = 0; i < PCI_NUM_PINS; i++) {
>> +        pm->mv_pirq[i] = qdev_get_gpio_in_named(pm->mv, "gpp", 12 + i);
>> +    }
>>     pci_bus = mv64361_get_pci_bus(pm->mv, 1);
>> +    pci_bus_irqs(pci_bus, pegasos2_pci_irq, pm, PCI_NUM_PINS);
>>
>>     /* VIA VT8231 South Bridge (multifunction PCI device) */
>>     via = OBJECT(pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0),
>>                                                  true, TYPE_VT8231_ISA));
>> +    for (i = 0; i < PCI_NUM_PINS; i++) {
>> +        pm->via_pirq[i] = qdev_get_gpio_in_named(DEVICE(via), "pirq", i);
>> +    }
>>     object_property_add_alias(OBJECT(machine), "rtc-time",
>>                               object_resolve_path_component(via, "rtc"),
>>                               "date");
>> @@ -268,6 +286,12 @@ static void pegasos2_machine_reset(MachineState *machine, ShutdownCause reason)
>>                               PCI_INTERRUPT_LINE, 2, 0x9);
>>     pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
>>                               0x50, 1, 0x2);
>> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
>> +                              0x55, 1, 0x90);
>> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
>> +                              0x56, 1, 0x99);
>> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
>> +                              0x57, 1, 0x90);
>
> Let's not mix aspects (implement VT82XX PCI IRQ routing) with Pegasos2 aspects. IOW let's keep these additions in a separate patch to make things clearer.

I guess this one hunk could be split out but not sure what would that 
bring.

Regards,
BALATON Zoltan

>>
>>     pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 1) << 8) |
>>                               PCI_INTERRUPT_LINE, 2, 0x109);
>
>

