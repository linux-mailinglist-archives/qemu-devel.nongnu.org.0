Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F24658EDFA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 16:11:34 +0200 (CEST)
Received: from localhost ([::1]:37602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLmQn-00045G-Iu
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 10:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1oLluq-0002jt-84
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:38:32 -0400
Received: from jedlik.phy.bme.hu ([152.66.102.83]:53660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@jedlik.phy.bme.hu>)
 id 1oLlun-0007lA-RT
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:38:31 -0400
Received: by jedlik.phy.bme.hu (Postfix, from userid 1000)
 id 58179A00FB; Wed, 10 Aug 2022 15:28:55 +0200 (CEST)
Date: Wed, 10 Aug 2022 15:28:55 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 08/24] ppc/ppc4xx: Introduce a DCR device model
In-Reply-To: <77bc11f5-129a-a3a8-6c24-09c83da2fabd@kaod.org>
Message-ID: <alpine.LMD.2.03.2208101524000.10818@eik.bme.hu>
References: <20220809153904.485018-1-clg@kaod.org>
 <20220809153904.485018-9-clg@kaod.org>
 <8dcf2a12-f799-673f-d5bf-1cecba42447a@eik.bme.hu>
 <77bc11f5-129a-a3a8-6c24-09c83da2fabd@kaod.org>
User-Agent: Alpine 2.03 (LMD 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
 BOUNDARY="1117279078-356758949-1660138135=:10818"
Received-SPF: none client-ip=152.66.102.83;
 envelope-from=balaton@jedlik.phy.bme.hu; helo=jedlik.phy.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

--1117279078-356758949-1660138135=:10818
Content-Type: TEXT/PLAIN; charset=UTF-8; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 10 Aug 2022, C=C3=A9dric Le Goater wrote:
> On 8/9/22 19:21, BALATON Zoltan wrote:
>> On Tue, 9 Aug 2022, C=C3=A9dric Le Goater wrote:
>>> The Device Control Registers (DCR) of on-SoC devices are accessed by
>>> software through the use of the mtdcr and mfdcr instructions. These
>>> are converted in transactions on a side band bus, the DCR bus, which
>>> connects the on-SoC devices to the CPU.
>>>=20
>>> Ideally, we should model these accesses with a DCR namespace and DCR
>>> memory regions but today the DCR handlers are installed in a DCR table
>>> under the CPU. Instead introduce a little device model wrapper to hold
>>> a CPU link and handle registration of DCR handlers.
>>>=20
>>> The DCR device inherits from SysBus because most of these devices also
>>> have MMIO regions and/or IRQs. Being a SysBusDevice makes things easier
>>> to install the device model in the overall SoC.
>>>=20
>>> The "cpu" link should be considered as modeling the piece of HW logic
>>> connecting the device to the DCR bus.
>>>=20
>>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>>> ---
>>> include/hw/ppc/ppc4xx.h | 17 ++++++++++++++++
>>> hw/ppc/ppc4xx_devs.c=C2=A0=C2=A0=C2=A0 | 44 +++++++++++++++++++++++++++=
++++++++++++++
>>> 2 files changed, 61 insertions(+)
>>>=20
>>> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
>>> index 591e2421a343..82e60b0e0742 100644
>>> --- a/include/hw/ppc/ppc4xx.h
>>> +++ b/include/hw/ppc/ppc4xx.h
>>> @@ -27,6 +27,7 @@
>>>=20
>>> #include "hw/ppc/ppc.h"
>>> #include "exec/memory.h"
>>> +#include "hw/sysbus.h"
>>>=20
>>> void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Memor=
yRegion ram_memories[],
>>> @@ -44,4 +45,20 @@ void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnu=
m,=20
>>> uint8_t rxcnum,
>>>=20
>>> #define TYPE_PPC4xx_PCI_HOST_BRIDGE "ppc4xx-pcihost"
>>>=20
>>> +/*
>>> + * Generic DCR device
>>> + */
>>> +#define TYPE_PPC4xx_DCR_DEVICE "ppc4xx-dcr-device"
>>> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxDcrDeviceState, PPC4xx_DCR_DEVICE);
>>> +struct Ppc4xxDcrDeviceState {
>>> +=C2=A0=C2=A0=C2=A0 SysBusDevice parent_obj;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 PowerPCCPU *cpu;
>>> +};
>>> +
>>> +void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 dcr_read_cb dcr_read, dcr_write_cb dcr_write);
>>> +bool ppc4xx_dcr_realize(Ppc4xxDcrDeviceState *dev, PowerPCCPU *cpu,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Error=
 **errp);
>>> +
>>> #endif /* PPC4XX_H */
>>> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
>>> index 069b51195160..bce7ef461346 100644
>>> --- a/hw/ppc/ppc4xx_devs.c
>>> +++ b/hw/ppc/ppc4xx_devs.c
>>> @@ -664,3 +664,47 @@ void ppc4xx_mal_init(CPUPPCState *env, uint8_t=20
>>> txcnum, uint8_t rxcnum,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 mal, &dcr_read_mal, &dcr_write_mal);
>>> =C2=A0=C2=A0=C2=A0 }
>>> }
>>> +
>>> +void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 dcr_read_cb dcr_read, dcr_write_cb dcr_write)
>>=20
>> I still think this should have a separate void *opaque parameter for the=
=20
>> callbacks and not pass dev for that as the callbacks could use anything=
=20
>> they wish for that parameter. (Additionally this allows dropping a lot o=
f=20
>> QOM casts. If you want to see how often these are accessed, you can try=
=20
>> -trace enable=3D"ppc_dcr*"; on the machines and OS I've tested some are=
=20
>> read/written frequently so I'd not add unnecessary overhead without a go=
od=20
>> reason.)
>
> This machine has been abandoned for 15 years and broken for maybe 10.
> I think it is fine for now. We will see if further needs arise.

It will arise as I'd like to keep at least the devices used by sam460ex=20
somewhat sane so if you don't change this now I'd likely want to change it=
=20
back. I undetstand it's a hassle to do in a rebase now but keeping the=20
opaque parameter means just a search replace from the old ppc_dcr_register=
=20
to ppc4xx_dcr_register so maybe not that hard to do at this point. Once=20
you apply this patch it will be more difficult to revert it.

Regards,
BALATON Zoltan

> Thanks,
>
> C.
>
>>=20
>> Otherwise:
>>=20
>> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
>>=20
>> Regards,
>> BALATOn Zoltan
>>=20
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 CPUPPCState *env;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 assert(dev->cpu);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 env =3D &dev->cpu->env;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ppc_dcr_register(env, dcrn, dev, dcr_read, dcr_writ=
e);
>>> +}
>>> +
>>> +bool ppc4xx_dcr_realize(Ppc4xxDcrDeviceState *dev, PowerPCCPU *cpu,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Error=
 **errp)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 object_property_set_link(OBJECT(dev), "cpu", OBJECT=
(cpu),=20
>>> &error_abort);
>>> +=C2=A0=C2=A0=C2=A0 return sysbus_realize(SYS_BUS_DEVICE(dev), errp);
>>> +}
>>> +
>>> +static Property ppc4xx_dcr_properties[] =3D {
>>> +=C2=A0=C2=A0=C2=A0 DEFINE_PROP_LINK("cpu", Ppc4xxDcrDeviceState, cpu, =
TYPE_POWERPC_CPU,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PowerPCCPU *),
>>> +=C2=A0=C2=A0=C2=A0 DEFINE_PROP_END_OF_LIST(),
>>> +};
>>> +
>>> +static void ppc4xx_dcr_class_init(ObjectClass *oc, void *data)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 DeviceClass *dc =3D DEVICE_CLASS(oc);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 device_class_set_props(dc, ppc4xx_dcr_properties);
>>> +}
>>> +
>>> +static const TypeInfo ppc4xx_types[] =3D {
>>> +=C2=A0=C2=A0=C2=A0 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D TYPE_PPC4xx_DCR_DEVICE,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .parent=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D TYPE_SYS_BUS_DEVICE,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .instance_size=C2=A0 =3D si=
zeof(Ppc4xxDcrDeviceState),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .class_init=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D ppc4xx_dcr_class_init,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .abstract=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =3D true,
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +};
>>> +
>>> +DEFINE_TYPES(ppc4xx_types)
>>>=20
>
>
>
--1117279078-356758949-1660138135=:10818--

