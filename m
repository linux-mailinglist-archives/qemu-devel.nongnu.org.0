Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4697F4B368F
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 17:46:32 +0100 (CET)
Received: from localhost ([::1]:46226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIvXb-0005Xc-2w
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 11:46:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nIvVl-0004pr-Lb
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 11:44:37 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:56204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nIvVi-0007X8-8f
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 11:44:37 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CB184746324;
 Sat, 12 Feb 2022 17:44:30 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8EE6C745708; Sat, 12 Feb 2022 17:44:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8CF667456E3;
 Sat, 12 Feb 2022 17:44:30 +0100 (CET)
Date: Sat, 12 Feb 2022 17:44:30 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH v2 1/5] malta: Move PCI interrupt handling from gt64xxx
 to piix4
In-Reply-To: <1cc1d1-8159-364b-612f-483db0ca1435@eik.bme.hu>
Message-ID: <343393f1-6fdd-5d37-9049-90fff2d6df6@eik.bme.hu>
References: <20220212113519.69527-1-shentey@gmail.com>
 <20220212113519.69527-2-shentey@gmail.com>
 <1cc1d1-8159-364b-612f-483db0ca1435@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-354649538-1644684270=:90120"
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
Cc: =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-354649538-1644684270=:90120
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 12 Feb 2022, BALATON Zoltan wrote:
> On Sat, 12 Feb 2022, Bernhard Beschow wrote:
>> Handling PCI interrupts in piix4 increases cohesion and reduces differences
>> between piix4 and piix3.
>> 
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>
> Sorry for being late in commenting, I've missed the first round. Apologies if 
> this causes a delay or another version.
>
>> ---
>> hw/isa/piix4.c         | 58 +++++++++++++++++++++++++++++++++++++++
>> hw/mips/gt64xxx_pci.c  | 62 ++++--------------------------------------
>> hw/mips/malta.c        |  6 +---
>> include/hw/mips/mips.h |  2 +-
>> 4 files changed, 65 insertions(+), 63 deletions(-)
>> 
>> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
>> index 0fe7b69bc4..5a86308689 100644
>> --- a/hw/isa/piix4.c
>> +++ b/hw/isa/piix4.c
>> @@ -45,6 +45,7 @@ struct PIIX4State {
>>     PCIDevice dev;
>>     qemu_irq cpu_intr;
>>     qemu_irq *isa;
>> +    qemu_irq i8259[ISA_NUM_IRQS];
>>
>>     RTCState rtc;
>>     /* Reset Control Register */
>> @@ -54,6 +55,30 @@ struct PIIX4State {
>> 
>> OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_PCI_DEVICE)
>> 
>> +static int pci_irq_levels[4];
>> +
>> +static void piix4_set_irq(void *opaque, int irq_num, int level)
>> +{
>> +    int i, pic_irq, pic_level;
>> +    qemu_irq *pic = opaque;
>> +
>> +    pci_irq_levels[irq_num] = level;
>> +
>> +    /* now we change the pic irq level according to the piix irq mappings 
>> */
>> +    /* XXX: optimize */
>> +    pic_irq = piix4_dev->config[PIIX_PIRQCA + irq_num];
>> +    if (pic_irq < 16) {
>> +        /* The pic level is the logical OR of all the PCI irqs mapped to 
>> it. */
>> +        pic_level = 0;
>> +        for (i = 0; i < 4; i++) {
>> +            if (pic_irq == piix4_dev->config[PIIX_PIRQCA + i]) {
>> +                pic_level |= pci_irq_levels[i];
>> +            }
>> +        }
>> +        qemu_set_irq(pic[pic_irq], pic_level);
>> +    }
>> +}
>> +
>> static void piix4_isa_reset(DeviceState *dev)
>> {
>>     PIIX4State *d = PIIX4_PCI_DEVICE(dev);
>> @@ -248,8 +273,34 @@ static void piix4_register_types(void)
>> 
>> type_init(piix4_register_types)
>> 
>> +static int pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
>> +{
>> +    int slot;
>> +
>> +    slot = PCI_SLOT(pci_dev->devfn);
>> +
>> +    switch (slot) {
>> +    /* PIIX4 USB */
>> +    case 10:
>> +        return 3;
>> +    /* AMD 79C973 Ethernet */
>> +    case 11:
>> +        return 1;
>> +    /* Crystal 4281 Sound */
>> +    case 12:
>> +        return 2;
>> +    /* PCI slot 1 to 4 */
>> +    case 18 ... 21:
>> +        return ((slot - 18) + irq_num) & 0x03;
>> +    /* Unknown device, don't do any translation */
>> +    default:
>> +        return irq_num;
>> +    }
>> +}
>> +
>> DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus 
>> **smbus)
>> {
>> +    PIIX4State *s;
>>     PCIDevice *pci;
>>     DeviceState *dev;
>>     int devfn = PCI_DEVFN(10, 0);
>> @@ -257,6 +308,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus 
>> **isa_bus, I2CBus **smbus)
>>     pci = pci_create_simple_multifunction(pci_bus, devfn,  true,
>>                                           TYPE_PIIX4_PCI_DEVICE);
>>     dev = DEVICE(pci);
>> +    s = PIIX4_PCI_DEVICE(pci);
>>     if (isa_bus) {
>>         *isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
>>     }
>> @@ -271,5 +323,11 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus 
>> **isa_bus, I2CBus **smbus)
>>                                NULL, 0, NULL);
>>     }
>> 
>> +    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s->i8259, 4);
>> +
>> +    for (int i = 0; i < ISA_NUM_IRQS; i++) {

Sorry one more nit. This is code movement but are we OK with declaring 
local variable within for? I thinks coding style advises against this, not 
sure if checkpatch accepts it or not. This could be cleaned up the next 
patch together with removing the i8259 field which are simple enough to do 
in one patch then this one stays as code movement and changes in next 
patch.

>> +        s->i8259[i] = qdev_get_gpio_in_named(dev, "isa", i);
>> +    }
>> +
>>     return dev;
>> }
>> diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
[...]
>> diff --git a/include/hw/mips/mips.h b/include/hw/mips/mips.h
>> index 6c9c8805f3..ff88942e63 100644
>> --- a/include/hw/mips/mips.h
>> +++ b/include/hw/mips/mips.h
>> @@ -10,7 +10,7 @@
>> #include "exec/memory.h"
>> 
>> /* gt64xxx.c */
>> -PCIBus *gt64120_register(qemu_irq *pic);
>> +PCIBus *gt64120_register(void);
>
> Now that you don't need to pass anything to it, do you still need this 
> function? Maybe what it does now could be done in the gt64120 device's 
> realize functions (there seems to be at least two: gt64120_realize and 
> gt64120_pci_realize but haven't checked which is more appropriate to put this 
> init in) or in an init function then you can just create the gt64120 device 
> in malta.c with qdev_new as is more usual to do in other boards. This 
> register function looks like the legacy init functions we're trying to get 
> rid of so this seems to be an opportunity to clean this up. This could be 
> done in a separate follow up though so may not need to be part of this series 
> but may be nice to have.

I meant this comment at the end of patch 1. But maybe this is too much to 
do in this series as it needs more understanding of the gt64120 
implementation so unless you already understand it enough to clean this up 
easily now and it would be too much effort for you, then this is just for 
the record for possible future clean up. The series is good enough without 
putting in more stuff but if there's a way to go further then that would 
be nice.

Regards,.
BALATON Zoltan

>> 
>> /* bonito.c */
>> PCIBus *bonito_init(qemu_irq *pic);
>
--3866299591-354649538-1644684270=:90120--

