Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 608AE58EECD
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 16:52:36 +0200 (CEST)
Received: from localhost ([::1]:43230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLn4U-0007mx-1F
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 10:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oLn0u-0003qJ-9x; Wed, 10 Aug 2022 10:48:56 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:36685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oLn0q-0003fJ-W7; Wed, 10 Aug 2022 10:48:51 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BC308746307;
 Wed, 10 Aug 2022 16:48:43 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6A13E7461AE; Wed, 10 Aug 2022 16:48:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 67B52745702;
 Wed, 10 Aug 2022 16:48:43 +0200 (CEST)
Date: Wed, 10 Aug 2022 16:48:43 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 08/24] ppc/ppc4xx: Introduce a DCR device model
In-Reply-To: <7cccd86d-5bf2-e45c-b592-80ba10c06a41@kaod.org>
Message-ID: <96386d50-8f2-4f63-c425-a1dc5247dcb7@eik.bme.hu>
References: <20220809153904.485018-1-clg@kaod.org>
 <20220809153904.485018-9-clg@kaod.org>
 <8dcf2a12-f799-673f-d5bf-1cecba42447a@eik.bme.hu>
 <77bc11f5-129a-a3a8-6c24-09c83da2fabd@kaod.org>
 <alpine.LMD.2.03.2208101524000.10818@eik.bme.hu>
 <7cccd86d-5bf2-e45c-b592-80ba10c06a41@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1267701850-1660142923=:75967"
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

--3866299591-1267701850-1660142923=:75967
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 10 Aug 2022, Cédric Le Goater wrote:
> On 8/10/22 15:28, BALATON Zoltan wrote:
>> On Wed, 10 Aug 2022, Cédric Le Goater wrote:
>>> On 8/9/22 19:21, BALATON Zoltan wrote:
>>>> On Tue, 9 Aug 2022, Cédric Le Goater wrote:
>>>>> The Device Control Registers (DCR) of on-SoC devices are accessed by
>>>>> software through the use of the mtdcr and mfdcr instructions. These
>>>>> are converted in transactions on a side band bus, the DCR bus, which
>>>>> connects the on-SoC devices to the CPU.
>>>>> 
>>>>> Ideally, we should model these accesses with a DCR namespace and DCR
>>>>> memory regions but today the DCR handlers are installed in a DCR table
>>>>> under the CPU. Instead introduce a little device model wrapper to hold
>>>>> a CPU link and handle registration of DCR handlers.
>>>>> 
>>>>> The DCR device inherits from SysBus because most of these devices also
>>>>> have MMIO regions and/or IRQs. Being a SysBusDevice makes things easier
>>>>> to install the device model in the overall SoC.
>>>>> 
>>>>> The "cpu" link should be considered as modeling the piece of HW logic
>>>>> connecting the device to the DCR bus.
>>>>> 
>>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>>> ---
>>>>> include/hw/ppc/ppc4xx.h | 17 ++++++++++++++++
>>>>> hw/ppc/ppc4xx_devs.c    | 44 +++++++++++++++++++++++++++++++++++++++++
>>>>> 2 files changed, 61 insertions(+)
>>>>> 
>>>>> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
>>>>> index 591e2421a343..82e60b0e0742 100644
>>>>> --- a/include/hw/ppc/ppc4xx.h
>>>>> +++ b/include/hw/ppc/ppc4xx.h
>>>>> @@ -27,6 +27,7 @@
>>>>> 
>>>>> #include "hw/ppc/ppc.h"
>>>>> #include "exec/memory.h"
>>>>> +#include "hw/sysbus.h"
>>>>> 
>>>>> void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
>>>>>                         MemoryRegion ram_memories[],
>>>>> @@ -44,4 +45,20 @@ void ppc4xx_mal_init(CPUPPCState *env, uint8_t 
>>>>> txcnum, uint8_t rxcnum,
>>>>> 
>>>>> #define TYPE_PPC4xx_PCI_HOST_BRIDGE "ppc4xx-pcihost"
>>>>> 
>>>>> +/*
>>>>> + * Generic DCR device
>>>>> + */
>>>>> +#define TYPE_PPC4xx_DCR_DEVICE "ppc4xx-dcr-device"
>>>>> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxDcrDeviceState, PPC4xx_DCR_DEVICE);
>>>>> +struct Ppc4xxDcrDeviceState {
>>>>> +    SysBusDevice parent_obj;
>>>>> +
>>>>> +    PowerPCCPU *cpu;
>>>>> +};
>>>>> +
>>>>> +void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn,
>>>>> +                         dcr_read_cb dcr_read, dcr_write_cb dcr_write);
>>>>> +bool ppc4xx_dcr_realize(Ppc4xxDcrDeviceState *dev, PowerPCCPU *cpu,
>>>>> +                        Error **errp);
>>>>> +
>>>>> #endif /* PPC4XX_H */
>>>>> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
>>>>> index 069b51195160..bce7ef461346 100644
>>>>> --- a/hw/ppc/ppc4xx_devs.c
>>>>> +++ b/hw/ppc/ppc4xx_devs.c
>>>>> @@ -664,3 +664,47 @@ void ppc4xx_mal_init(CPUPPCState *env, uint8_t 
>>>>> txcnum, uint8_t rxcnum,
>>>>>                          mal, &dcr_read_mal, &dcr_write_mal);
>>>>>     }
>>>>> }
>>>>> +
>>>>> +void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn,
>>>>> +                         dcr_read_cb dcr_read, dcr_write_cb dcr_write)
>>>> 
>>>> I still think this should have a separate void *opaque parameter for the 
>>>> callbacks and not pass dev for that as the callbacks could use anything 
>>>> they wish for that parameter. (Additionally this allows dropping a lot of 
>>>> QOM casts. If you want to see how often these are accessed, you can try 
>>>> -trace enable="ppc_dcr*"; on the machines and OS I've tested some are 
>>>> read/written frequently so I'd not add unnecessary overhead without a 
>>>> good reason.)
>>> 
>>> This machine has been abandoned for 15 years and broken for maybe 10.
>>> I think it is fine for now. We will see if further needs arise.
>> 
>> It will arise as I'd like to keep at least the devices used by sam460ex 
>> somewhat sane 
>
> What do you mean by somewhat sane ? If it is the QOM casts, I don't
> understand why you worry so much about it because QOM cast debugging
> is not enabled by default. So it really should not impact performance
> as you think it would.

I think it is enabled by default unless you explicitly disable it which is 
not done by most distros so it's generally may impact performance (or if 
it's already slow for other reasons then it just increase inefficiency 
needlessly). If it's simple to avoid like here why not avoid it? Also 
conceptually the opaque parameter is a closure for the callback functions 
while dev is a self pointer for the method and you're now mixing these 
two. I think it's cleaner to keep them separate and not impose a 
restiction on the callbacks.

Sorry but I have strong feeling on this one. I think the simplest way to 
rebase and revert this is to do an interactive rebase editing each patch 
and do interactive revert of just the lines changing ppc4xx_dcr_register 
followed by a search replace of "ppc_dcr_register(" with 
"ppc4xx_dcr_register(dcr, ". That should not be too difficult to do now. 
(It could be done afterwatds too but I'd appreciate and would be less 
chutn if you did that now.)

Regards,
BALATON Zoltan

>
> C.
>
>> so if you don't change this now I'd likely want to change it back. I 
>> undetstand it's a hassle to do in a rebase now but keeping the opaque 
>> parameter means just a search replace from the old ppc_dcr_register to 
>> ppc4xx_dcr_register so maybe not that hard to do at this point. Once you 
>> apply this patch it will be more difficult to revert it.
>> 
>> Regards,
>> BALATON Zoltan
>> 
>>> Thanks,
>>> 
>>> C.
>>> 
>>>> 
>>>> Otherwise:
>>>> 
>>>> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>> 
>>>> Regards,
>>>> BALATOn Zoltan
>>>> 
>>>>> +{
>>>>> +    CPUPPCState *env;
>>>>> +
>>>>> +    assert(dev->cpu);
>>>>> +
>>>>> +    env = &dev->cpu->env;
>>>>> +
>>>>> +    ppc_dcr_register(env, dcrn, dev, dcr_read, dcr_write);
>>>>> +}
>>>>> +
>>>>> +bool ppc4xx_dcr_realize(Ppc4xxDcrDeviceState *dev, PowerPCCPU *cpu,
>>>>> +                        Error **errp)
>>>>> +{
>>>>> +    object_property_set_link(OBJECT(dev), "cpu", OBJECT(cpu), 
>>>>> &error_abort);
>>>>> +    return sysbus_realize(SYS_BUS_DEVICE(dev), errp);
>>>>> +}
>>>>> +
>>>>> +static Property ppc4xx_dcr_properties[] = {
>>>>> +    DEFINE_PROP_LINK("cpu", Ppc4xxDcrDeviceState, cpu, 
>>>>> TYPE_POWERPC_CPU,
>>>>> +                     PowerPCCPU *),
>>>>> +    DEFINE_PROP_END_OF_LIST(),
>>>>> +};
>>>>> +
>>>>> +static void ppc4xx_dcr_class_init(ObjectClass *oc, void *data)
>>>>> +{
>>>>> +    DeviceClass *dc = DEVICE_CLASS(oc);
>>>>> +
>>>>> +    device_class_set_props(dc, ppc4xx_dcr_properties);
>>>>> +}
>>>>> +
>>>>> +static const TypeInfo ppc4xx_types[] = {
>>>>> +    {
>>>>> +        .name           = TYPE_PPC4xx_DCR_DEVICE,
>>>>> +        .parent         = TYPE_SYS_BUS_DEVICE,
>>>>> +        .instance_size  = sizeof(Ppc4xxDcrDeviceState),
>>>>> +        .class_init     = ppc4xx_dcr_class_init,
>>>>> +        .abstract       = true,
>>>>> +    }
>>>>> +};
>>>>> +
>>>>> +DEFINE_TYPES(ppc4xx_types)
>>>>> 
>>> 
>>> 
>>> 
>
>
--3866299591-1267701850-1660142923=:75967--

