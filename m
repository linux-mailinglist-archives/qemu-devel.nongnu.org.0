Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC15D5A9956
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 15:46:12 +0200 (CEST)
Received: from localhost ([::1]:36674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTkWJ-0000BH-Si
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 09:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oTkDs-0000GY-SR; Thu, 01 Sep 2022 09:27:08 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:57790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oTkDp-0003ls-G2; Thu, 01 Sep 2022 09:27:07 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 04E9974637E;
 Thu,  1 Sep 2022 15:26:59 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C063F746324; Thu,  1 Sep 2022 15:26:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BEB1974632C;
 Thu,  1 Sep 2022 15:26:58 +0200 (CEST)
Date: Thu, 1 Sep 2022 15:26:58 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:sam460ex" <qemu-ppc@nongnu.org>, 
 Huacai Chen <chenhuacai@kernel.org>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v3 06/10] hw/isa/vt82c686: Instantiate USB functions in
 host device
In-Reply-To: <CAG4p6K7_13QNemke_rr8+J5Fr1wqWCcd0pHqsygZRuzc6vDepw@mail.gmail.com>
Message-ID: <dcaa58a0-353b-d1aa-f1e8-f38561da1f41@eik.bme.hu>
References: <20220831095914.2041-1-shentey@gmail.com>
 <20220831095914.2041-7-shentey@gmail.com>
 <331bbd5a-aeaa-d5c0-cf8f-cde5b22d8a3@eik.bme.hu>
 <96C4E9E5-4875-4B49-B176-673BAAEE7993@gmail.com>
 <48b1c17d-fa2f-c2f7-b22-79eb6e8f55b@eik.bme.hu>
 <5DE06ABD-34E9-4186-9922-B62C92A56798@gmail.com>
 <d32d6e66-ed13-2c9-6da4-d3c63796d66@eik.bme.hu>
 <CAG4p6K7_13QNemke_rr8+J5Fr1wqWCcd0pHqsygZRuzc6vDepw@mail.gmail.com>
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

On Thu, 1 Sep 2022, Bernhard Beschow wrote:
> On Wed, Aug 31, 2022 at 6:02 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> On Wed, 31 Aug 2022, BB wrote:
>>> Am 31. August 2022 17:03:35 MESZ schrieb BALATON Zoltan <
>> balaton@eik.bme.hu>:
>>>> On Wed, 31 Aug 2022, BB wrote:
>>>>> Am 31. August 2022 15:23:37 MESZ schrieb BALATON Zoltan <
>> balaton@eik.bme.hu>:
>>>>>> On Wed, 31 Aug 2022, Bernhard Beschow wrote:
>>>>>>> The USB functions can be enabled/disabled through the ISA function.
>> Also
>>>>>>> its interrupt routing can be influenced there.
>>>>>>>
>>>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>>>>> ---
>>>>>>> hw/isa/vt82c686.c   | 12 ++++++++++++
>>>>>>> hw/mips/fuloong2e.c |  3 ---
>>>>>>> hw/ppc/pegasos2.c   |  4 ----
>>>>>>> 3 files changed, 12 insertions(+), 7 deletions(-)
>>>>>>>
>>>>>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>>>>>>> index 9d946cea54..66a4b9c230 100644
>>>>>>> --- a/hw/isa/vt82c686.c
>>>>>>> +++ b/hw/isa/vt82c686.c
>>>>>>> @@ -23,6 +23,7 @@
>>>>>>> #include "hw/intc/i8259.h"
>>>>>>> #include "hw/irq.h"
>>>>>>> #include "hw/dma/i8257.h"
>>>>>>> +#include "hw/usb/hcd-uhci.h"
>>>>>>> #include "hw/timer/i8254.h"
>>>>>>> #include "hw/rtc/mc146818rtc.h"
>>>>>>> #include "migration/vmstate.h"
>>>>>>> @@ -546,6 +547,7 @@ struct ViaISAState {
>>>>>>>     qemu_irq *isa_irqs;
>>>>>>>     ViaSuperIOState via_sio;
>>>>>>>     PCIIDEState ide;
>>>>>>> +    UHCIState uhci[2];
>>>>>>> };
>>>>>>>
>>>>>>> static const VMStateDescription vmstate_via = {
>>>>>>> @@ -563,6 +565,8 @@ static void via_isa_init(Object *obj)
>>>>>>>     ViaISAState *s = VIA_ISA(obj);
>>>>>>>
>>>>>>>     object_initialize_child(obj, "ide", &s->ide, "via-ide");
>>>>>>> +    object_initialize_child(obj, "uhci1", &s->uhci[0],
>> "vt82c686b-usb-uhci");
>>>>>>> +    object_initialize_child(obj, "uhci2", &s->uhci[1],
>> "vt82c686b-usb-uhci");
>>>>>>
>>>>>> Sorry for not saying this yesterday, this can also be done separately
>> so no need for another version of this series if not needed for another
>> reason but could we add a define for vt82c686b-usb-uhci in
>> include/hw/isa/vt82c686.h and use that here and in
>> hw/usb/vt82c686-uhci-pci.c ?
>>>>>
>>>>> Would creating a dedicated header work, too? Board code doesn't need
>> to see the define any longer.
>>>>
>>>> I don't think it needs a separate header just for this so I'd put it in
>> vt82c686.h but I don't mind either way.
>>>
>>> Alright, I'll take the easy route for now. Splitting in dedicated
>> headers (also for the other devices) could be done in a separate series.
>>
>> I'll do this for via-ac97 when rabasing my WIP patch:
>>
>> https://osdn.net/projects/qmiga/scm/git/qemu/commits
>>
>> as I'll need to move ViaAC97State there too for embedding in ViaISAState.
>> The other ones
>> can stay in vt82c686.h I think.
>>
>> (The reason this is still WIP is that it does not work and I'm not sure
>> why, Maybe I need to test with a Linux guest to find out more but I
>> haven't got to that yet.)
>>
>
> Hi Zoltan,
>
> I've given your AC97 patches a spin on top of my WIP pc-via branch with a
> Mandriva Linux live CD and *drumroll* `qemu-system-x86_64 -M pc -accel kvm
> -cpu host`:
>
> https://github.com/shentok/qemu/commits/pc-via

Interesting, now I see where this goes beyond just clean up.

> The good news is that the sound controls appeared in the UI but no sound
> seemed to be played, though that could also be due to my setup (nested
> virtualization).

Consodering that I get the same result with MorphOS on pegasos2 it's more 
likely some problem with the emulation than your setup but I could not yet 
find out what (I didn't try hard enough either). Probably I'm missing 
something in how sound emulation in QEMU should work or how the via sound 
function should work. The docs have detailed info in the regs but not much 
on what actually should happen, when irq should be raised and such.

> Perhaps you find it convenient to test with Linux that way.

Definitly, it's easier to find an x86 live CD with support for this chip 
than one for pegasos2. But I may wait a while before I get back to this.

Regards,
BALATON Zoltan

