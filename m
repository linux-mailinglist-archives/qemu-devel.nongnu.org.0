Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF8F5A5382
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 19:52:20 +0200 (CEST)
Received: from localhost ([::1]:56042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSivr-00049L-G7
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 13:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oSitx-0000sz-6L; Mon, 29 Aug 2022 13:50:37 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:23144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oSits-00088D-QK; Mon, 29 Aug 2022 13:50:19 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8AD787462D3;
 Mon, 29 Aug 2022 19:50:11 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 865B17461AE; Mon, 29 Aug 2022 19:50:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 848AA745702;
 Mon, 29 Aug 2022 19:50:10 +0200 (CEST)
Date: Mon, 29 Aug 2022 19:50:10 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: BB <shentey@gmail.com>
cc: QEMU Developers <qemu-devel@nongnu.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
 Huacai Chen <chenhuacai@kernel.org>, 
 "open list:sam460ex" <qemu-ppc@nongnu.org>
Subject: Re: [PATCH 8/9] hw/isa/vt82c686: QOM'ify RTC creation
In-Reply-To: <C5B98752-D291-419B-B9EE-D62D137DADD3@gmail.com>
Message-ID: <2ced8da1-3b3a-6894-90f7-e8618b679f87@eik.bme.hu>
References: <20220822224355.11753-1-shentey@gmail.com>
 <20220822224355.11753-9-shentey@gmail.com>
 <96f054aa-41b5-b3c0-accc-46678485b87d@eik.bme.hu>
 <CAG4p6K4BhgTAXAApG4CyRH3bCgMF97wBV5Vm0caBc-krOgEX_Q@mail.gmail.com>
 <e65366d-9aed-4b6f-50e9-603756f281@eik.bme.hu>
 <C5B98752-D291-419B-B9EE-D62D137DADD3@gmail.com>
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

On Mon, 29 Aug 2022, BB wrote:
> Am 24. August 2022 01:23:14 MESZ schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>> On Tue, 23 Aug 2022, Bernhard Beschow wrote:
>>> On Tue, Aug 23, 2022 at 2:20 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>>> On Tue, 23 Aug 2022, Bernhard Beschow wrote:
>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>>> ---
>>>>> hw/isa/vt82c686.c | 12 +++++++++++-
>>>>> 1 file changed, 11 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>>>>> index 47f2fd2669..ee745d5d49 100644
>>>>> --- a/hw/isa/vt82c686.c
>>>>> +++ b/hw/isa/vt82c686.c
>>>>> @@ -546,6 +546,7 @@ struct ViaISAState {
>>>>>     qemu_irq cpu_intr;
>>>>>     qemu_irq *isa_irqs;
>>>>>     ViaSuperIOState via_sio;
>>>>> +    RTCState rtc;
>>>>>     PCIIDEState ide;
>>>>>     UHCIState uhci[2];
>>>>>     ViaPMState pm;
>>>>> @@ -567,6 +568,7 @@ static void via_isa_init(Object *obj)
>>>>> {
>>>>>     ViaISAState *s = VIA_ISA(obj);
>>>>>
>>>>> +    object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
>>>>>     object_initialize_child(obj, "ide", &s->ide, "via-ide");
>>>>>     object_initialize_child(obj, "uhci1", &s->uhci[0],
>>>> "vt82c686b-usb-uhci");
>>>>>     object_initialize_child(obj, "uhci2", &s->uhci[1],
>>>> "vt82c686b-usb-uhci");
>>>>> @@ -615,7 +617,15 @@ static void via_isa_realize(PCIDevice *d, Error
>>>> **errp)
>>>>>     isa_bus_irqs(isa_bus, s->isa_irqs);
>>>>>     i8254_pit_init(isa_bus, 0x40, 0, NULL);
>>>>>     i8257_dma_init(isa_bus, 0);
>>>>> -    mc146818_rtc_init(isa_bus, 2000, NULL);
>>>>> +
>>>>> +    /* RTC */
>>>>> +    qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
>>>>> +    if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
>>>>> +        return;
>>>>> +    }
>>>>> +    object_property_add_alias(qdev_get_machine(), "rtc-time",
>>>> OBJECT(&s->rtc),
>>>>> +                              "date");
>>>>> +    isa_connect_gpio_out(ISA_DEVICE(&s->rtc), 0, s->rtc.isairq);
>>>>>
>>>>>     for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
>>>>>         if (i < PCI_COMMAND || i >= PCI_REVISION_ID) {
>>>>>
>>>>
>>>> This actually introduces code duplication as all other places except piix4
>>>> seem to still use the init function (probably to ensure that the rtc-rime
>>>> alias on the machine is properly set) so I'd keep this the same as
>>>> everything else and drop this patch until this init function is removed
>>>> from all other places as well.
>>>>
>>>
>>> Hi Zoltan,
>>>
>>> Thanks for the fast reply! Regarding code homogeneity and duplication I've
>>> made a similar argument for mc146818_rtc_init() in the past [1] and I've
>>> learnt that my patch went backwards. Incidentally, Peter mentioned vt686c
>>> as a candidate for the embed-the-device-struct style which - again
>>> incidentally - I've now done.
>>
>> I've seen patches embedding devices recently but in this case it looked not that simple because of the rtc-time alias.
>>
>>> The rtc-time alias is actually only used by a couple of PPC machines where
>>> Pegasos II is one of them. So the alias actually needs to be created only
>>> for these machines, and identifying the cases where it has to be preserved
>>> requires a lot of careful investigation. In the Pegasos II case this seems
>>> especially complicated since one needs to look through several layers of
>>> devices. During my work on the VT82xx south bridges I've gained some
>>> knowledge such that I'd like to make this simplifying contribution.
>>
>> I've used it to implement the get-time-of-day rtas call with VOF in 
>> pegasos2 because otherwise it would need to access internals of the RTC 
>> model and/or duplicate some code. Here's the message discussing this:
>>
>> https://lists.nongnu.org/archive/html/qemu-ppc/2021-10/msg00170.html
>>
>> so this alias still seems to be the simplest way.
>>
>> I think the primary function of this alias is not these ppc machines 
>> but some QMP/HMP command or to make the guest time available from the 
>> monitor or something like that so it's probably also used from there 
>> and therefore all rtc probably should have it but I'm not sure about 
>> it.
>
> Indeed, the alias seems to be a convenience for some QMP/HMP commands. 
> AFAICS only the mc146818 sets the alias while it is probably not the 
> only RTC modelled in QEMU. So I wonder why boards using another RTC 
> don't need it and whether removing the alias constitutes a compatibility 
> break.
>
>>> Our discussion makes me realize that the creation of the alias could now
>>> actually be moved to the Pegasos II board. This way, the Pegasos II board
>>> would both create and consume that alias, which seems to remove quite some
>>> cognitive load. Do you agree? Would moving the alias to the board work for
>>> you?
>>
>> Yes I think that would be better. This way the vt82xx and piix4 would 
>> be similar and the alias would also be clear within the pegasos2 code 
>> and it also has the machine directly at that point so it's clearer that 
>> way.
>
> All in all I wonder if we need to preserve the alias for the fuloong2e board?

I don't know. A quick investigation shows that it seems to be added by 
commit 654a36d857ff94 which suggests something may use it (or was intended 
to use it back then, but not sure if things have changed in the meantime). 
I don't think any management app cares about fuloong2e but if this should 
be a generic thing then all machine may need it. Then it's also mentioned 
in commit 29551fdcf4d99 that suggests one ought to be careful moving this 
around as it may cause unexpected problems. But doing it from the machine 
init should be OK.

Regards,
BALATON Zoltan

