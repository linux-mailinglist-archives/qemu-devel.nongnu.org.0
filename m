Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A69F2D8A06
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 21:52:31 +0100 (CET)
Received: from localhost ([::1]:50786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koBsT-000134-OZ
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 15:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1koBbl-0002bf-O2; Sat, 12 Dec 2020 15:35:15 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:23581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1koBbg-00009O-Co; Sat, 12 Dec 2020 15:35:13 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9B4FE7470EB;
 Sat, 12 Dec 2020 21:35:02 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 550B17470E9; Sat, 12 Dec 2020 21:35:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 53B117470E2;
 Sat, 12 Dec 2020 21:35:02 +0100 (CET)
Date: Sat, 12 Dec 2020 21:35:02 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 5/8] hw/ppc/sam460ex: Drop use of ppcuic_init()
In-Reply-To: <CAFEAcA-_L6ZABxLTF8TWHtA+P+A01i52cTVShDoRuvdUeeaEAA@mail.gmail.com>
Message-ID: <2d4afc65-28e2-c69c-7072-b9e12f2e1b@eik.bme.hu>
References: <20201212001537.24520-1-peter.maydell@linaro.org>
 <20201212001537.24520-6-peter.maydell@linaro.org>
 <6c6c535-1b6a-d2ff-fa22-6af89789b6a@eik.bme.hu>
 <CAFEAcA-_L6ZABxLTF8TWHtA+P+A01i52cTVShDoRuvdUeeaEAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Sat, 12 Dec 2020, Peter Maydell wrote:
> On Sat, 12 Dec 2020 at 17:17, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>
>> On Sat, 12 Dec 2020, Peter Maydell wrote:
>>> Switch the sam460ex board to directly creating and configuring the
>>> UIC, rather than doing it via the old ppcuic_init() helper function.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>> hw/ppc/sam460ex.c | 70 ++++++++++++++++++++++++++++++++++++-----------
>>> 1 file changed, 54 insertions(+), 16 deletions(-)
>>
>> More than 3 times as much than before, qdev seems to be overly verbose and
>> less readable but if that's the preferred way then be it.
>
> Yeah, the boilerplate is sometimes a bit clunky; but the benefits
> come from devices all behaving in the same way, being introspectable,
> having support for things like VM state save/load, etc.

And disadvantage is that a typo can easier hide in there as we've just 
seen. Recent changes to simplify object creation did improve boiler plate 
somewhat but gpios still seem to be a bit obscure and hard to use so maybe 
if somebody has some idea to improve it that could help. I have no idea 
how it could be made simpler though. Maybe less verbose names or some 
helpers/macros for common ops that hide the verbosity could help 
readability.

>>> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
>>> index 14e6583eb0d..9cf7aad3833 100644
>>> --- a/hw/ppc/sam460ex.c
>>> +++ b/hw/ppc/sam460ex.c
>>> @@ -39,6 +39,7 @@
>>> #include "hw/usb/hcd-ehci.h"
>>> #include "hw/ppc/fdt.h"
>>> #include "hw/qdev-properties.h"
>>> +#include "hw/intc/ppc-uic.h"
>>>
>>> #include <libfdt.h>
>>>
>>> @@ -281,7 +282,6 @@ static void sam460ex_init(MachineState *machine)
>>>     hwaddr ram_bases[SDRAM_NR_BANKS] = {0};
>>>     hwaddr ram_sizes[SDRAM_NR_BANKS] = {0};
>>>     MemoryRegion *l2cache_ram = g_new(MemoryRegion, 1);
>>> -    qemu_irq *irqs, *uic[4];
>>>     PCIBus *pci_bus;
>>>     PowerPCCPU *cpu;
>>>     CPUPPCState *env;
>>> @@ -293,6 +293,9 @@ static void sam460ex_init(MachineState *machine)
>>>     struct boot_info *boot_info;
>>>     uint8_t *spd_data;
>>>     int success;
>>> +    qemu_irq mal_irqs[4];
>>> +    DeviceState *uic[4];
>>> +    int i;
>>
>> Maybe keep this where it was above instead of moving to the end and keep
>> DeviceState *uic[4]; first so the two others that would be removed later
>> are next to each other (just to make patches simpler and keep the order of
>> variables which may be roughly as they appear below).
>
> Sure, I can do that.
>
>>>     cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
>>>     env = &cpu->env;
>>> @@ -312,13 +315,35 @@ static void sam460ex_init(MachineState *machine)
>>>     ppc4xx_plb_init(env);
>>>
>>>     /* interrupt controllers */
>>> -    irqs = g_new0(qemu_irq, PPCUIC_OUTPUT_NB);
>>> -    irqs[PPCUIC_OUTPUT_INT] = ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT];
>>> -    irqs[PPCUIC_OUTPUT_CINT] = ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT];
>>
>> Unrelated to this, but I wonder why do we need these casts? Could we just
>> define env->irq_inputs as qemu_irq array in the first place? It's now void
>> ** which according to the comment next to it may be because once it may
>> have been used for different implementations but by now maybe it's only
>> used for what its name implies? I haven't checked though if it could be
>> cleaned up just raising it if anyone's interested to have a look as there
>> are such casts at a lot of other places too.
>
> I mentioned this in the cover letter. The irq_inputs stuff seems
> to be an old workaround for not being able to have gpio inputs
> to the CPU object. Now that CPUs inherit from TYPE_DEVICE, they
> can just create gpio inputs like any other device, and this
> code would be able to wire them up without having to dig into
> the internals of the CPUPPCState structure.

Yes, noticed that after I've answered this.

>>> -    uic[0] = ppcuic_init(env, irqs, 0xc0, 0, 1);
>>> -    uic[1] = ppcuic_init(env, &uic[0][30], 0xd0, 0, 1);
>>> -    uic[2] = ppcuic_init(env, &uic[0][10], 0xe0, 0, 1);
>>> -    uic[3] = ppcuic_init(env, &uic[0][16], 0xf0, 0, 1);
>>> +    for (i = 0; i < ARRAY_SIZE(uic); i++) {
>>> +        SysBusDevice *sbd;
>>
>> There's already a SysBusDevice *sbdev; defined for similar cases that you
>> could reuse here.
>>
>>> +        /*
>>> +         * Number of the first of the two consecutive IRQ inputs on UIC 0
>>> +         * to connect the INT and CINT outputs of UIC n to. The entry
>>
>> This comment confused me a bit, while it's precise is it possible to say
>> it in a simpler way? I think these are how uic[1-3] are cascaded through
>> uic[0] similar to how the PICs in a PC are cascaded.
>
> Yes, it's the cascading -- it's saying "which inputs on UIC 0 should
> UIC n's outputs connect to". What would be a helpful way to phrase
> this more clearly ?

Hah, you're the native English speaker so I hoped you could reformulate it 
in a simpler way. (But maybe that's what makes it more difficult because 
the current version already makes perfect sense to you.) Maybe something 
like "Interrupt numbers in uic[0] where INT outputs of uic[1]-uic[3] are 
connected for cascading. The CINT output is connected to the next 
interrupt number. The entry for uic[0] is ignored because it connects to 
the CPU."

Regards,
BALATON Zoltan

>>> +         * for UIC 0 is ignored, because it connects to the CPU.
>>> +         */
>>> +        const int input_ints[] = { -1, 30, 10, 16 };
>
>>>     /* MAL */
>>> -    ppc4xx_mal_init(env, 4, 16, &uic[2][3]);
>>> +    /*
>>> +     * TODO if the MAL were a proper QOM device we would not need to
>>> +     * copy its qemu_irqs into an array for ppc4xx_mal_init()'s benefit.
>>> +     */
>>
>> It's not a todo for sam460ex so maybe put it in the file where mal is if
>> you want to note it somewhere? (Other sites using the mal may also need
>> updating not just this one when this is cleaned up.)
>
> Yeah. I discovered later that one of the other files that creates
> the MAL is doing exactly the same thing with a local mal_irqs[]
> type array. So I think we could just drop this TODO comment.
> As and when somebody QOMifies the MAL device they'll naturally
> come back and fix up all the callsites.
>
> thanks
> -- PMM
>
>

