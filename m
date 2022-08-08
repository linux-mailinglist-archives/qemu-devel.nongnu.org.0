Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0E158CC85
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 19:08:31 +0200 (CEST)
Received: from localhost ([::1]:36356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL6Et-0002Rn-5i
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 13:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oL6CJ-0007qB-A0; Mon, 08 Aug 2022 13:05:47 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:29913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oL6CG-0002O8-03; Mon, 08 Aug 2022 13:05:46 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DE997747DF7;
 Mon,  8 Aug 2022 19:05:35 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8B7FB747871; Mon,  8 Aug 2022 19:05:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 897BF7475F9;
 Mon,  8 Aug 2022 19:05:35 +0200 (CEST)
Date: Mon, 8 Aug 2022 19:05:35 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 07/22] ppc/ppc405: QOM'ify CPU
In-Reply-To: <4cdc4026-78c5-e617-c74c-3ee5aa5d44d3@kaod.org>
Message-ID: <cd735510-ec37-357c-3fa9-34b0d445c5a2@eik.bme.hu>
References: <20220808102734.133084-1-clg@kaod.org>
 <20220808102734.133084-8-clg@kaod.org>
 <2499ab9-44e8-a33f-5f4-74a1d7ad3e7@eik.bme.hu>
 <4cdc4026-78c5-e617-c74c-3ee5aa5d44d3@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-969611678-1659978335=:23189"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-969611678-1659978335=:23189
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 8 Aug 2022, Cédric Le Goater wrote:
> On 8/8/22 15:17, BALATON Zoltan wrote:
>> 
>> Patch title is wrong. It should be Embed CPU object in SoC as it's not 
>> QOMifies the CPU just moves it from dinamically allocated to embedded.
>> 
>> On Mon, 8 Aug 2022, Cédric Le Goater wrote:
>>> Drop the use of ppc4xx_init() and duplicate a bit of code related to
>>> clocks in the SoC realize routine. We will clean that up in the
>>> following patches.
>> 
>> Could this be split off into a separate patch? Maybe it would be clearer 
>> that way what's related to stop using ppc4xx_init() (which is needed 
>> because it dinamically allocates CPU) and what's the embedding it in the 
>> soc object.
>
> I'd rather not. It has been painful enough to untangle. Let's keep it that
> way. And, this part is further changed in the CPC patch.

OK, if nobody else thinks this should be split I'm OK with it.

>>> ppc_dcr_init() simply allocates default DCR handlers for the CPU. Maybe
>>> this could be done in model initializer of the CPU families needing it.
>>> 
>>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>> hw/ppc/ppc405.h         |  2 +-
>>> include/hw/ppc/ppc4xx.h |  1 +
>>> hw/ppc/ppc405_boards.c  |  2 +-
>>> hw/ppc/ppc405_uc.c      | 35 +++++++++++++++++++++++++----------
>>> hw/ppc/ppc4xx_devs.c    |  2 +-
>>> 5 files changed, 29 insertions(+), 13 deletions(-)
>>> 
>>> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
>>> index dc862bc8614c..8cc76cc8b3fe 100644
>>> --- a/hw/ppc/ppc405.h
>>> +++ b/hw/ppc/ppc405.h
>>> @@ -79,7 +79,7 @@ struct Ppc405SoCState {
>>>     hwaddr ram_size;
>>> 
>>>     uint32_t sysclk;
>>> -    PowerPCCPU *cpu;
>>> +    PowerPCCPU cpu;
>>>     DeviceState *uic;
>>> };
>>> 
>>> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
>>> index 980f964b5a91..021376c2d260 100644
>>> --- a/include/hw/ppc/ppc4xx.h
>>> +++ b/include/hw/ppc/ppc4xx.h
>>> @@ -29,6 +29,7 @@
>>> #include "exec/memory.h"
>>> 
>>> /* PowerPC 4xx core initialization */
>>> +void ppc4xx_reset(void *opaque);
>>> PowerPCCPU *ppc4xx_init(const char *cpu_model,
>>>                         clk_setup_t *cpu_clk, clk_setup_t *tb_clk,
>>>                         uint32_t sysclk);
>>> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
>>> index 0b39ff08bd65..5ba12d60bc00 100644
>>> --- a/hw/ppc/ppc405_boards.c
>>> +++ b/hw/ppc/ppc405_boards.c
>>> @@ -313,7 +313,7 @@ static void ppc405_init(MachineState *machine)
>>> 
>>>     /* Load ELF kernel and rootfs.cpio */
>>>     } else if (kernel_filename && !machine->firmware) {
>>> -        boot_from_kernel(machine, ppc405->soc.cpu);
>>> +        boot_from_kernel(machine, &ppc405->soc.cpu);
>>>     }
>>> }
>>> 
>>> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
>>> index abcc2537140c..fa3853df2233 100644
>>> --- a/hw/ppc/ppc405_uc.c
>>> +++ b/hw/ppc/ppc405_uc.c
>>> @@ -1432,22 +1432,36 @@ static void ppc405ep_cpc_init (CPUPPCState *env, 
>>> clk_setup_t clk_setup[8],
>>> #endif
>>> }
>>> 
>>> +static void ppc405_soc_instance_init(Object *obj)
>>> +{
>>> +    Ppc405SoCState *s = PPC405_SOC(obj);
>>> +
>>> +    object_initialize_child(obj, "cpu", &s->cpu,
>>> +                            POWERPC_CPU_TYPE_NAME("405ep"));
>>> +}
>>> +
>>> static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>>> {
>>>     Ppc405SoCState *s = PPC405_SOC(dev);
>>> -    clk_setup_t clk_setup[PPC405EP_CLK_NB], tlb_clk_setup;
>>> +    clk_setup_t clk_setup[PPC405EP_CLK_NB];
>>>     qemu_irq dma_irqs[4], gpt_irqs[5], mal_irqs[4];
>>>     CPUPPCState *env;
>>> 
>>>     memset(clk_setup, 0, sizeof(clk_setup));
>>> 
>>>     /* init CPUs */
>>> -    s->cpu = ppc4xx_init(POWERPC_CPU_TYPE_NAME("405ep"),
>>> -                      &clk_setup[PPC405EP_CPU_CLK],
>>> -                      &tlb_clk_setup, s->sysclk);
>>> -    env = &s->cpu->env;
>>> -    clk_setup[PPC405EP_CPU_CLK].cb = tlb_clk_setup.cb;
>>> -    clk_setup[PPC405EP_CPU_CLK].opaque = tlb_clk_setup.opaque;
>>> +    if (!qdev_realize(DEVICE(&s->cpu), NULL, errp)) {
>>> +        return;
>>> +    }
>>> +    qemu_register_reset(ppc4xx_reset, &s->cpu);
>>> +
>>> +    env = &s->cpu.env;
>>> +
>>> +    clk_setup[PPC405EP_CPU_CLK].cb =
>>> +        ppc_40x_timers_init(env, s->sysclk, PPC_INTERRUPT_PIT);
>>> +    clk_setup[PPC405EP_CPU_CLK].opaque = env;
>>> +
>>> +    ppc_dcr_init(env, NULL, NULL);
>>> 
>>>     /* CPU control */
>>>     ppc405ep_cpc_init(env, clk_setup, s->sysclk);
>>> @@ -1464,16 +1478,16 @@ static void ppc405_soc_realize(DeviceState *dev, 
>>> Error **errp)
>>>     /* Universal interrupt controller */
>>>     s->uic = qdev_new(TYPE_PPC_UIC);
>>> 
>>> -    object_property_set_link(OBJECT(s->uic), "cpu", OBJECT(s->cpu),
>>> +    object_property_set_link(OBJECT(s->uic), "cpu", OBJECT(&s->cpu),
>>>                              &error_fatal);
>>>     if (!sysbus_realize(SYS_BUS_DEVICE(s->uic), errp)) {
>>>         return;
>>>     }
>>> 
>>>     sysbus_connect_irq(SYS_BUS_DEVICE(s->uic), PPCUIC_OUTPUT_INT,
>>> -                       qdev_get_gpio_in(DEVICE(s->cpu), 
>>> PPC40x_INPUT_INT));
>>> +                       qdev_get_gpio_in(DEVICE(&s->cpu), 
>>> PPC40x_INPUT_INT));
>>>     sysbus_connect_irq(SYS_BUS_DEVICE(s->uic), PPCUIC_OUTPUT_CINT,
>>> -                       qdev_get_gpio_in(DEVICE(s->cpu), 
>>> PPC40x_INPUT_CINT));
>>> +                       qdev_get_gpio_in(DEVICE(&s->cpu), 
>>> PPC40x_INPUT_CINT));
>>> 
>>>     /* SDRAM controller */
>>>         /* XXX 405EP has no ECC interrupt */
>>> @@ -1562,6 +1576,7 @@ static const TypeInfo ppc405_types[] = {
>>>         .name           = TYPE_PPC405_SOC,
>>>         .parent         = TYPE_DEVICE,
>>>         .instance_size  = sizeof(Ppc405SoCState),
>>> +        .instance_init  = ppc405_soc_instance_init,
>>>         .class_init     = ppc405_soc_class_init,
>>>     }
>>> };
>>> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
>>> index 737c0896b4f8..f20098cf417c 100644
>>> --- a/hw/ppc/ppc4xx_devs.c
>>> +++ b/hw/ppc/ppc4xx_devs.c
>>> @@ -37,7 +37,7 @@
>>> #include "qapi/error.h"
>>> #include "trace.h"
>>> 
>>> -static void ppc4xx_reset(void *opaque)
>>> +void ppc4xx_reset(void *opaque)
>>> {
>>>     PowerPCCPU *cpu = opaque;
>> 
>> This just calls cpu_reset() and does nothing else. Can't that be registered 
>> directly so this could be kept static to this file? 
>
> what do you mean ?

Something like qemu_register_reset(cpu_reset, &s->cpu); but I'm not sure 
this is even needed.

>> Why do we need this at all? 
>
> Oh yes. We need the CPU to start in a reset state, for U-boot at least.
>
>> Isn't the cpu object reset automatically? Why do we need to register it 
>> separately?
>
> All devices need a reset handler. The handler of the PPC405 CPU is registered
> in ppc405_soc_realize() :
>
>  qemu_register_reset(ppc4xx_reset, &s->cpu);

But the handler we register here just calls cpu_reset which seems to just 
call the reset method of the CPU object. If we have nothing else to do 
here do we need to explicitly call cpi_reset like this? Wouldn't the CPU 
object be reset by qdev when resetting the machine or the soc its in? If 
we have our own reset method we may call cpu_reset from there to make sure 
the CPU is in a known state but is this needed when we don't want to do 
anything else? I don't know how reset handling works but some machines 
seems to do this and others don't.

> If we had a more complex model, like pseries or PowerNV, we would install the
> reset handler in the realize routine of the CPU model. But we don't.

If this is needed maybe you should add a soc_reset method and call 
cpu_reset() from there and get rid of ppc4xx_reset or move it to 
ppc405_uc.c if it's not used anywhere else, so it can be kept static and 
does not need to be added to ppc4xx.h.

Regards,
BALATON Zoltan
--3866299591-969611678-1659978335=:23189--

