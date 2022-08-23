Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9196859EFC3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 01:38:29 +0200 (CEST)
Received: from localhost ([::1]:36678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQdTY-0006pz-7o
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 19:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oQdRL-0004DM-FE; Tue, 23 Aug 2022 19:36:11 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:25910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oQdRH-0005JG-NL; Tue, 23 Aug 2022 19:36:10 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 73B53747F1E;
 Wed, 24 Aug 2022 01:36:03 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 073577461AE; Wed, 24 Aug 2022 01:36:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 02BC3745702;
 Wed, 24 Aug 2022 01:36:03 +0200 (CEST)
Date: Wed, 24 Aug 2022 01:36:02 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: QEMU Developers <qemu-devel@nongnu.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
 Huacai Chen <chenhuacai@kernel.org>, 
 "open list:sam460ex" <qemu-ppc@nongnu.org>
Subject: Re: [PATCH 1/9] hw/isa/vt82c686: QOM'ify Super I/O creation
In-Reply-To: <CAG4p6K5j9K_R-+uenAht1ebxVL0-rHwAZ=sRqqui=8QFSbo94g@mail.gmail.com>
Message-ID: <ca7c4772-e0da-d792-293e-aaaa4480195b@eik.bme.hu>
References: <20220822224355.11753-1-shentey@gmail.com>
 <20220822224355.11753-2-shentey@gmail.com>
 <13a01ca9-ee32-2784-227c-2f6331e224dd@eik.bme.hu>
 <CAG4p6K5j9K_R-+uenAht1ebxVL0-rHwAZ=sRqqui=8QFSbo94g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 23 Aug 2022, Bernhard Beschow wrote:
> On Tue, Aug 23, 2022 at 2:35 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
>> On Tue, 23 Aug 2022, Bernhard Beschow wrote:
>>> The object creation now happens in chip-specific init methods which
>>> allows the realize methods to be consolidated into one method. Shifting
>>> the logic into the init methods has the addidional advantage that the
>>> parent object's init methods are called implicitly.
>>
>> This and later patches titled "QOM'ify" don't do what I understand on
>> QOMifying which is turining an old device model into a QOM object. These
>> devices are already QOMified, what's really done here is that they are
>> moved to the ViaISAState or embedded into it and created as part of the
>> south bridge rather then individually by the boards. Either my
>> understanding of what QOMify means is wrong or these patches are misnamed.
>>
>
> I think your understanding is correct. Peter refers to it as the
> embed-the-device-struct style [1] which I can take as inspiration for
> renaming my patches in v2.
>
> Technically via_isa_realize() is the realize method of the abstract
>> TYPE_VIA_ISA class which were overriden by the subclasses but since QOM
>> does not call overridden methods implicitly this had to be explicitly
>> called in the overriding realize methods of the subclasses. Now that we
>> don't have to ovverride the method maybe it could be set once on the
>> VIA_ISA class then it may work that way but as it's done here is also OK
>> maybe as a reminder that this super class method should be called by any
>> overriding method if one's added in the future for some reason.
>>
>
> Right. This would involve moving some code around and creating a class
> struct. Do you think it's worth it?

You mean a class_init func to assign realize as the class struct 
via_isa_info already exists. But yes this would need to be moved after 
via_isa_realize then. As I wrote above I don't think this is worth it, 
especially becuase if in the future a realize method was re-added to the 
subclasses then it's easy to forget to revert this and call the superclass 
method so assigning via_isa_realize to the subclass as done here is OK and 
I can think of it as a reminder to call this method when overriding it. 
Also with the added class_init func it's shorter this way even if slightly 
mixing different objects. So in the end I'm OK with this as it is.

Regards,
BALATON Zoltan

> Best regards,
> Bernhard
>
> [1]
> http://patchwork.ozlabs.org/project/qemu-devel/patch/20220205175913.31738-2-shentey@gmail.com/
>
> Regards,
>> BALATON Zoltan
>>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>> ---
>>> hw/isa/vt82c686.c | 33 ++++++++++++++++++---------------
>>> 1 file changed, 18 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>>> index 8f656251b8..0217c98fe4 100644
>>> --- a/hw/isa/vt82c686.c
>>> +++ b/hw/isa/vt82c686.c
>>> @@ -544,7 +544,7 @@ struct ViaISAState {
>>>     qemu_irq cpu_intr;
>>>     qemu_irq *isa_irqs;
>>>     ISABus *isa_bus;
>>> -    ViaSuperIOState *via_sio;
>>> +    ViaSuperIOState via_sio;
>>> };
>>>
>>> static const VMStateDescription vmstate_via = {
>>> @@ -602,6 +602,11 @@ static void via_isa_realize(PCIDevice *d, Error
>> **errp)
>>>             d->wmask[i] = 0;
>>>         }
>>>     }
>>> +
>>> +    /* Super I/O */
>>> +    if (!qdev_realize(DEVICE(&s->via_sio), BUS(s->isa_bus), errp)) {
>>> +        return;
>>> +    }
>>> }
>>>
>>> /* TYPE_VT82C686B_ISA */
>>> @@ -615,7 +620,7 @@ static void vt82c686b_write_config(PCIDevice *d,
>> uint32_t addr,
>>>     pci_default_write_config(d, addr, val, len);
>>>     if (addr == 0x85) {
>>>         /* BIT(1): enable or disable superio config io ports */
>>> -        via_superio_io_enable(s->via_sio, val & BIT(1));
>>> +        via_superio_io_enable(&s->via_sio, val & BIT(1));
>>>     }
>>> }
>>>
>>> @@ -639,13 +644,11 @@ static void vt82c686b_isa_reset(DeviceState *dev)
>>>     pci_conf[0x77] = 0x10; /* GPIO Control 1/2/3/4 */
>>> }
>>>
>>> -static void vt82c686b_realize(PCIDevice *d, Error **errp)
>>> +static void vt82c686b_init(Object *obj)
>>> {
>>> -    ViaISAState *s = VIA_ISA(d);
>>> +    ViaISAState *s = VIA_ISA(obj);
>>>
>>> -    via_isa_realize(d, errp);
>>> -    s->via_sio = VIA_SUPERIO(isa_create_simple(s->isa_bus,
>>> -                                               TYPE_VT82C686B_SUPERIO));
>>> +    object_initialize_child(obj, "sio", &s->via_sio,
>> TYPE_VT82C686B_SUPERIO);
>>> }
>>>
>>> static void vt82c686b_class_init(ObjectClass *klass, void *data)
>>> @@ -653,7 +656,7 @@ static void vt82c686b_class_init(ObjectClass *klass,
>> void *data)
>>>     DeviceClass *dc = DEVICE_CLASS(klass);
>>>     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>>>
>>> -    k->realize = vt82c686b_realize;
>>> +    k->realize = via_isa_realize;
>>>     k->config_write = vt82c686b_write_config;
>>>     k->vendor_id = PCI_VENDOR_ID_VIA;
>>>     k->device_id = PCI_DEVICE_ID_VIA_82C686B_ISA;
>>> @@ -670,6 +673,7 @@ static const TypeInfo vt82c686b_isa_info = {
>>>     .name          = TYPE_VT82C686B_ISA,
>>>     .parent        = TYPE_VIA_ISA,
>>>     .instance_size = sizeof(ViaISAState),
>>> +    .instance_init = vt82c686b_init,
>>>     .class_init    = vt82c686b_class_init,
>>> };
>>>
>>> @@ -684,7 +688,7 @@ static void vt8231_write_config(PCIDevice *d,
>> uint32_t addr,
>>>     pci_default_write_config(d, addr, val, len);
>>>     if (addr == 0x50) {
>>>         /* BIT(2): enable or disable superio config io ports */
>>> -        via_superio_io_enable(s->via_sio, val & BIT(2));
>>> +        via_superio_io_enable(&s->via_sio, val & BIT(2));
>>>     }
>>> }
>>>
>>> @@ -703,13 +707,11 @@ static void vt8231_isa_reset(DeviceState *dev)
>>>     pci_conf[0x6b] = 0x01; /* Fast IR I/O Base */
>>> }
>>>
>>> -static void vt8231_realize(PCIDevice *d, Error **errp)
>>> +static void vt8231_init(Object *obj)
>>> {
>>> -    ViaISAState *s = VIA_ISA(d);
>>> +    ViaISAState *s = VIA_ISA(obj);
>>>
>>> -    via_isa_realize(d, errp);
>>> -    s->via_sio = VIA_SUPERIO(isa_create_simple(s->isa_bus,
>>> -                                               TYPE_VT8231_SUPERIO));
>>> +    object_initialize_child(obj, "sio", &s->via_sio,
>> TYPE_VT8231_SUPERIO);
>>> }
>>>
>>> static void vt8231_class_init(ObjectClass *klass, void *data)
>>> @@ -717,7 +719,7 @@ static void vt8231_class_init(ObjectClass *klass,
>> void *data)
>>>     DeviceClass *dc = DEVICE_CLASS(klass);
>>>     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>>>
>>> -    k->realize = vt8231_realize;
>>> +    k->realize = via_isa_realize;
>>>     k->config_write = vt8231_write_config;
>>>     k->vendor_id = PCI_VENDOR_ID_VIA;
>>>     k->device_id = PCI_DEVICE_ID_VIA_8231_ISA;
>>> @@ -734,6 +736,7 @@ static const TypeInfo vt8231_isa_info = {
>>>     .name          = TYPE_VT8231_ISA,
>>>     .parent        = TYPE_VIA_ISA,
>>>     .instance_size = sizeof(ViaISAState),
>>> +    .instance_init = vt8231_init,
>>>     .class_init    = vt8231_class_init,
>>> };
>>>
>>>
>>
>

