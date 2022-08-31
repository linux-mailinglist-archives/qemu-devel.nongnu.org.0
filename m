Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E532F5A82D4
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 18:15:39 +0200 (CEST)
Received: from localhost ([::1]:53218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTQNO-0005WA-KT
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 12:15:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oTQAa-0000gp-Az; Wed, 31 Aug 2022 12:02:24 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:22209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oTQAV-0005aE-Pb; Wed, 31 Aug 2022 12:02:23 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CDA12746324;
 Wed, 31 Aug 2022 18:02:15 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8F7C07462D3; Wed, 31 Aug 2022 18:02:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8DFF7745702;
 Wed, 31 Aug 2022 18:02:15 +0200 (CEST)
Date: Wed, 31 Aug 2022 18:02:15 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: BB <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Huacai Chen <chenhuacai@kernel.org>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v3 06/10] hw/isa/vt82c686: Instantiate USB functions in
 host device
In-Reply-To: <5DE06ABD-34E9-4186-9922-B62C92A56798@gmail.com>
Message-ID: <d32d6e66-ed13-2c9-6da4-d3c63796d66@eik.bme.hu>
References: <20220831095914.2041-1-shentey@gmail.com>
 <20220831095914.2041-7-shentey@gmail.com>
 <331bbd5a-aeaa-d5c0-cf8f-cde5b22d8a3@eik.bme.hu>
 <96C4E9E5-4875-4B49-B176-673BAAEE7993@gmail.com>
 <48b1c17d-fa2f-c2f7-b22-79eb6e8f55b@eik.bme.hu>
 <5DE06ABD-34E9-4186-9922-B62C92A56798@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
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

On Wed, 31 Aug 2022, BB wrote:
> Am 31. August 2022 17:03:35 MESZ schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>> On Wed, 31 Aug 2022, BB wrote:
>>> Am 31. August 2022 15:23:37 MESZ schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>>>> On Wed, 31 Aug 2022, Bernhard Beschow wrote:
>>>>> The USB functions can be enabled/disabled through the ISA function. Also
>>>>> its interrupt routing can be influenced there.
>>>>>
>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>>> ---
>>>>> hw/isa/vt82c686.c   | 12 ++++++++++++
>>>>> hw/mips/fuloong2e.c |  3 ---
>>>>> hw/ppc/pegasos2.c   |  4 ----
>>>>> 3 files changed, 12 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>>>>> index 9d946cea54..66a4b9c230 100644
>>>>> --- a/hw/isa/vt82c686.c
>>>>> +++ b/hw/isa/vt82c686.c
>>>>> @@ -23,6 +23,7 @@
>>>>> #include "hw/intc/i8259.h"
>>>>> #include "hw/irq.h"
>>>>> #include "hw/dma/i8257.h"
>>>>> +#include "hw/usb/hcd-uhci.h"
>>>>> #include "hw/timer/i8254.h"
>>>>> #include "hw/rtc/mc146818rtc.h"
>>>>> #include "migration/vmstate.h"
>>>>> @@ -546,6 +547,7 @@ struct ViaISAState {
>>>>>     qemu_irq *isa_irqs;
>>>>>     ViaSuperIOState via_sio;
>>>>>     PCIIDEState ide;
>>>>> +    UHCIState uhci[2];
>>>>> };
>>>>>
>>>>> static const VMStateDescription vmstate_via = {
>>>>> @@ -563,6 +565,8 @@ static void via_isa_init(Object *obj)
>>>>>     ViaISAState *s = VIA_ISA(obj);
>>>>>
>>>>>     object_initialize_child(obj, "ide", &s->ide, "via-ide");
>>>>> +    object_initialize_child(obj, "uhci1", &s->uhci[0], "vt82c686b-usb-uhci");
>>>>> +    object_initialize_child(obj, "uhci2", &s->uhci[1], "vt82c686b-usb-uhci");
>>>>
>>>> Sorry for not saying this yesterday, this can also be done separately so no need for another version of this series if not needed for another reason but could we add a define for vt82c686b-usb-uhci in include/hw/isa/vt82c686.h and use that here and in hw/usb/vt82c686-uhci-pci.c ?
>>>
>>> Would creating a dedicated header work, too? Board code doesn't need to see the define any longer.
>>
>> I don't think it needs a separate header just for this so I'd put it in vt82c686.h but I don't mind either way.
>
> Alright, I'll take the easy route for now. Splitting in dedicated headers (also for the other devices) could be done in a separate series.

I'll do this for via-ac97 when rabasing my WIP patch:

https://osdn.net/projects/qmiga/scm/git/qemu/commits

as I'll need to move ViaAC97State there too for embedding in ViaISAState. 
The other ones 
can stay in vt82c686.h I think.

(The reason this is still WIP is that it does not work and I'm not sure 
why, Maybe I need to test with a Linux guest to find out more but I 
haven't got to that yet.)

Regards,
BALATON Zoltan

