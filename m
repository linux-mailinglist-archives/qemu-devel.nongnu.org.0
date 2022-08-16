Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70953595687
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 11:36:08 +0200 (CEST)
Received: from localhost ([::1]:42972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNszX-00005r-67
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 05:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oNswz-0006Dx-3V; Tue, 16 Aug 2022 05:33:36 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:38834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oNsww-0004tj-0u; Tue, 16 Aug 2022 05:33:28 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3F76374632C;
 Tue, 16 Aug 2022 11:33:22 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 23C8974632B; Tue, 16 Aug 2022 11:33:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 220457462D3;
 Tue, 16 Aug 2022 11:33:21 +0200 (CEST)
Date: Tue, 16 Aug 2022 11:33:21 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 01/22] ppc/ppc4xx: Introduce a DCR device model
In-Reply-To: <c3fc221b-1860-ab43-40b1-39faf96eca73@kaod.org>
Message-ID: <a396b643-1051-1012-3679-b456205cd7ba@eik.bme.hu>
References: <cover.1660402839.git.balaton@eik.bme.hu>
 <50e79b2c5f2c17e2b6b7920dd6526b5c091ac8bb.1660402839.git.balaton@eik.bme.hu>
 <c3fc221b-1860-ab43-40b1-39faf96eca73@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1806018417-1660642401=:7210"
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

--3866299591-1806018417-1660642401=:7210
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 16 Aug 2022, Cédric Le Goater wrote:
> On 8/13/22 17:34, BALATON Zoltan wrote:
>> From: Cédric Le Goater <clg@kaod.org>
>> 
>> The Device Control Registers (DCR) of on-SoC devices are accessed by
>> software through the use of the mtdcr and mfdcr instructions. These
>> are converted in transactions on a side band bus, the DCR bus, which
>> connects the on-SoC devices to the CPU.
>> 
>> Ideally, we should model these accesses with a DCR namespace and DCR
>> memory regions but today the DCR handlers are installed in a DCR table
>> under the CPU. Instead, introduce a little device model wrapper to hold
>> a CPU link and handle registration of DCR handlers.
>> 
>> The DCR device inherits from SysBus because most of these devices also
>> have MMIO regions and/or IRQs. Being a SysBusDevice makes things easier
>> to install the device model in the overall SoC.
>> 
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>
> When re-sending a patch, it is a good practice to list the changes before
> the Sob of the person doing the resend.
>
> I think you only changed the ppc4xx_dcr_register prototype. Correct ?

Mostly, and the resulting rebase but maybe some small changes here and 
there but I think those are also just code style fixes. I did not know 
what you prefer with the from line so if you're OK with keeping it I can 
go through it again and mark changes before signed-off if you think that's 
better.

I've also started cleaning up the sdram model, I need a bit more time for 
that, I'll probably send it as a separate series.

> Thanks,
>
> C.
>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/ppc/ppc4xx_devs.c    | 41 +++++++++++++++++++++++++++++++++++++++++
>>   include/hw/ppc/ppc4xx.h | 17 +++++++++++++++++
>>   2 files changed, 58 insertions(+)
>> 
>> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
>> index 069b511951..f4d7ae9567 100644
>> --- a/hw/ppc/ppc4xx_devs.c
>> +++ b/hw/ppc/ppc4xx_devs.c
>> @@ -664,3 +664,44 @@ void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, 
>> uint8_t rxcnum,
>>                            mal, &dcr_read_mal, &dcr_write_mal);
>>       }
>>   }
>> +
>> +/* PPC4xx_DCR_DEVICE */
>> +
>> +void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn, void 
>> *opaque,
>> +                         dcr_read_cb dcr_read, dcr_write_cb dcr_write)
>> +{
>> +    assert(dev->cpu);
>> +    ppc_dcr_register(&dev->cpu->env, dcrn, opaque, dcr_read, dcr_write);
>> +}
>> +
>> +bool ppc4xx_dcr_realize(Ppc4xxDcrDeviceState *dev, PowerPCCPU *cpu,
>> +                        Error **errp)
>> +{
>> +    object_property_set_link(OBJECT(dev), "cpu", OBJECT(cpu), 
>> &error_abort);
>> +    return sysbus_realize(SYS_BUS_DEVICE(dev), errp);
>> +}
>> +
>> +static Property ppc4xx_dcr_properties[] = {
>> +    DEFINE_PROP_LINK("cpu", Ppc4xxDcrDeviceState, cpu, TYPE_POWERPC_CPU,
>> +                     PowerPCCPU *),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void ppc4xx_dcr_class_init(ObjectClass *oc, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(oc);
>> +
>> +    device_class_set_props(dc, ppc4xx_dcr_properties);
>> +}
>> +
>> +static const TypeInfo ppc4xx_types[] = {
>> +    {
>> +        .name           = TYPE_PPC4xx_DCR_DEVICE,
>> +        .parent         = TYPE_SYS_BUS_DEVICE,
>> +        .instance_size  = sizeof(Ppc4xxDcrDeviceState),
>> +        .class_init     = ppc4xx_dcr_class_init,
>> +        .abstract       = true,
>> +    }
>> +};
>> +
>> +DEFINE_TYPES(ppc4xx_types)
>> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
>> index 591e2421a3..a537a5567b 100644
>> --- a/include/hw/ppc/ppc4xx.h
>> +++ b/include/hw/ppc/ppc4xx.h
>> @@ -27,6 +27,7 @@
>>     #include "hw/ppc/ppc.h"
>>   #include "exec/memory.h"
>> +#include "hw/sysbus.h"
>>     void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
>>                           MemoryRegion ram_memories[],
>> @@ -44,4 +45,20 @@ void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, 
>> uint8_t rxcnum,
>>     #define TYPE_PPC4xx_PCI_HOST_BRIDGE "ppc4xx-pcihost"
>>   +/*
>> + * Generic DCR device
>> + */
>> +#define TYPE_PPC4xx_DCR_DEVICE "ppc4xx-dcr-device"
>> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxDcrDeviceState, PPC4xx_DCR_DEVICE);
>> +struct Ppc4xxDcrDeviceState {
>> +    SysBusDevice parent_obj;
>> +
>> +    PowerPCCPU *cpu;
>> +};
>> +
>> +void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn, void 
>> *opaque,
>> +                         dcr_read_cb dcr_read, dcr_write_cb dcr_write);
>> +bool ppc4xx_dcr_realize(Ppc4xxDcrDeviceState *dev, PowerPCCPU *cpu,
>> +                        Error **errp);
>> +
>>   #endif /* PPC4XX_H */
>
>
>
--3866299591-1806018417-1660642401=:7210--

