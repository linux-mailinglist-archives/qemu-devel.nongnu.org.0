Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0CB5A5320
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 19:27:49 +0200 (CEST)
Received: from localhost ([::1]:48950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSiY8-0006xb-Rs
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 13:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oSiBK-0001Ry-0M; Mon, 29 Aug 2022 13:04:16 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:54669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oSiBG-0000nJ-Lj; Mon, 29 Aug 2022 13:04:13 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1D8787462D3;
 Mon, 29 Aug 2022 19:04:07 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C1DF37461AE; Mon, 29 Aug 2022 19:04:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BCA8A745702;
 Mon, 29 Aug 2022 19:04:06 +0200 (CEST)
Date: Mon, 29 Aug 2022 19:04:06 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: BB <shentey@gmail.com>
cc: QEMU Developers <qemu-devel@nongnu.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
 Huacai Chen <chenhuacai@kernel.org>, 
 "open list:sam460ex" <qemu-ppc@nongnu.org>
Subject: Re: [PATCH 4/9] hw/isa/vt82c686: QOM'ify via-ide creation
In-Reply-To: <BF0B3207-F80F-4653-BC43-D0735C16B4DB@gmail.com>
Message-ID: <6c69a78-f461-1b78-9e8d-2d1c11475a3@eik.bme.hu>
References: <20220822224355.11753-1-shentey@gmail.com>
 <20220822224355.11753-5-shentey@gmail.com>
 <14e283f-7bbd-dd70-5458-af897cd7ff4a@eik.bme.hu>
 <CAG4p6K51DvVFndv+ZuokigksdqjaegkRRnt1ZaOOQqJxp9xGEw@mail.gmail.com>
 <3ae09c8f-36c0-3874-db91-776f175a649c@eik.bme.hu>
 <BF0B3207-F80F-4653-BC43-D0735C16B4DB@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 29 Aug 2022, BB wrote:
> Am 25. August 2022 01:18:56 MESZ schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>> On Thu, 25 Aug 2022, Bernhard Beschow wrote:
>>> On Wed, Aug 24, 2022 at 3:54 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>>> On Tue, 23 Aug 2022, Bernhard Beschow wrote:
>>>>> The IDE function is closely tied to the ISA function (e.g. the IDE
>>>>> interrupt routing happens there), so it makes sense that the IDE
>>>>> function is instantiated within the southbridge itself. As a side effect,
>>>>> duplicated code in the boards is resolved.
>>>>>
>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>>> ---
>>>>> configs/devices/mips64el-softmmu/default.mak |  1 -
>>>>> hw/isa/Kconfig                               |  1 +
>>>>> hw/isa/vt82c686.c                            | 18 ++++++++++++++++++
>>>>> hw/mips/fuloong2e.c                          |  3 ---
>>>>> hw/ppc/Kconfig                               |  1 -
>>>>> hw/ppc/pegasos2.c                            |  4 ----
>>>>> 6 files changed, 19 insertions(+), 9 deletions(-)
>>>>>
>>>>> diff --git a/configs/devices/mips64el-softmmu/default.mak
>>>> b/configs/devices/mips64el-softmmu/default.mak
>>>>> index c610749ac1..d5188f7ea5 100644
>>>>> --- a/configs/devices/mips64el-softmmu/default.mak
>>>>> +++ b/configs/devices/mips64el-softmmu/default.mak
>>>>> @@ -1,7 +1,6 @@
>>>>> # Default configuration for mips64el-softmmu
>>>>>
>>>>> include ../mips-softmmu/common.mak
>>>>> -CONFIG_IDE_VIA=y
>>>>> CONFIG_FULOONG=y
>>>>> CONFIG_LOONGSON3V=y
>>>>> CONFIG_ATI_VGA=y
>>>>> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
>>>>> index d42143a991..20de7e9294 100644
>>>>> --- a/hw/isa/Kconfig
>>>>> +++ b/hw/isa/Kconfig
>>>>> @@ -53,6 +53,7 @@ config VT82C686
>>>>>     select I8254
>>>>>     select I8257
>>>>>     select I8259
>>>>> +    select IDE_VIA
>>>>>     select MC146818RTC
>>>>>     select PARALLEL
>>>>>
>>>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>>>>> index 5582c0b179..37d9ed635d 100644
>>>>> --- a/hw/isa/vt82c686.c
>>>>> +++ b/hw/isa/vt82c686.c
>>>>> @@ -17,6 +17,7 @@
>>>>> #include "hw/isa/vt82c686.h"
>>>>> #include "hw/pci/pci.h"
>>>>> #include "hw/qdev-properties.h"
>>>>> +#include "hw/ide/pci.h"
>>>>> #include "hw/isa/isa.h"
>>>>> #include "hw/isa/superio.h"
>>>>> #include "hw/intc/i8259.h"
>>>>> @@ -544,6 +545,7 @@ struct ViaISAState {
>>>>>     qemu_irq cpu_intr;
>>>>>     qemu_irq *isa_irqs;
>>>>>     ViaSuperIOState via_sio;
>>>>> +    PCIIDEState ide;
>>>>> };
>>>>>
>>>>> static const VMStateDescription vmstate_via = {
>>>>> @@ -556,10 +558,18 @@ static const VMStateDescription vmstate_via = {
>>>>>     }
>>>>> };
>>>>>
>>>>> +static void via_isa_init(Object *obj)
>>>>> +{
>>>>> +    ViaISAState *s = VIA_ISA(obj);
>>>>> +
>>>>> +    object_initialize_child(obj, "ide", &s->ide, "via-ide");
>>>>> +}
>>>>> +
>>>>> static const TypeInfo via_isa_info = {
>>>>>     .name          = TYPE_VIA_ISA,
>>>>>     .parent        = TYPE_PCI_DEVICE,
>>>>>     .instance_size = sizeof(ViaISAState),
>>>>> +    .instance_init = via_isa_init,
>>>>>     .abstract      = true,
>>>>>     .interfaces    = (InterfaceInfo[]) {
>>>>>         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>>>>> @@ -583,6 +593,7 @@ static void via_isa_realize(PCIDevice *d, Error
>>>> **errp)
>>>>> {
>>>>>     ViaISAState *s = VIA_ISA(d);
>>>>>     DeviceState *dev = DEVICE(d);
>>>>> +    PCIBus *pci_bus = pci_get_bus(d);
>>>>>     qemu_irq *isa_irq;
>>>>>     ISABus *isa_bus;
>>>>>     int i;
>>>>> @@ -607,6 +618,13 @@ static void via_isa_realize(PCIDevice *d, Error
>>>> **errp)
>>>>>     if (!qdev_realize(DEVICE(&s->via_sio), BUS(isa_bus), errp)) {
>>>>>         return;
>>>>>     }
>>>>> +
>>>>> +    /* Function 1: IDE */
>>>>> +    qdev_prop_set_int32(DEVICE(&s->ide), "addr", d->devfn + 1);
>>>>> +    if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
>>>>> +        return;
>>>>> +    }
>>>>> +    pci_ide_create_devs(PCI_DEVICE(&s->ide));
>>>>
>>>> I'm not sure about moving pci_ide_create_devs() here. This is usally
>>>> called from board code and only piix4 seems to do this. Maybe that's wrong
>>>> because if all IDE devices did this then one machine could not have more
>>>> than one different ide devices (like having an on-board ide and adding a
>>>> pci ide controoler with -device) so this probably belongs to the board
>>>> code to add devices to its default ide controller only as this is machine
>>>> specific. Unless I'm wrong in which case somebody will correct me.
>>>>
>>>
>>> Grepping the code it can be seen that it's always called right after
>>> creating the IDE controllers. The only notable exception is the "sii3112"
>>> device in the sam460ex board which is not emulated yet. Since the IDE
>>
>> The problem with sii3112 is that it only has 2 channels becuase I did not bother to implement more so pci_ide_create_devs() probably would not work as it assumes 4 channels. AFAIK this means that the short -hda, -cdrom, etc. convenience options don't work with sam460ex but yhou have to use the long way of creating ide-hd and ide-cd devices on the command line. I think there's a version of this controller with 4 channels, maybe called sii3114 or similar and it would be easy to enhance the current model for that but I haven't done that. What's not emulated on sam460ex is the on-board SATA ports of the SoC because it's too complex and all guest OSes have sii31xx drivers so it was simpler to implement that instead. The network port is the same as we already have working PCI network cards so I did not try to implement the 460EX network ports.
>>
>>> controllers are often created in board code this means
>>> pci_ide_create_devs() is called there as well.
>>>
>>> Grouping these calls together does make sense since it keeps the logic
>>> together. Otherwise it could happen all too easily that code becomes
>>> inconsistent such that pci_ide_create_devs() could be called without an IDE
>>> controller actually being available. Right?
>>
>> I don't know for sure but I think you cannot assign the devices to more than one controller and if this was called by every ide model then adding two of such ide controllers would call pci_ide_create_devs() twice which I don't think is correct and may cause problems.
>
> This sounds reasonable.
>
>> So I think it belongs to the board code even if the ide controller is created within another device instantiated by the board so it's only called by once.
>
> pci_ide_create_devs() isn't called by the VIA IDE controller. Instead, 
> it gets called by the VIA south bridges, of which there should only be 
> one per board. Do you still see a risk of pci_ide_create_devs() being 
> called multiple times? If so, I'd need to change the piix4 south bridge 
> as well for consistency.

Since the vt8231 is user_creatable = false there's probably no way to add 
a second one accidentally so in this case there's no direct risk. Yet for 
consistency I'd keep the call to pci_ide_create_devs() in board code as 
done by all other machines just to avoid any misunderstanding and keep it 
consistent accross the board(s) :-)

Regards,
BALATON Zoltan

