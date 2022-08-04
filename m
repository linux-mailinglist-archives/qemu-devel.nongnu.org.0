Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF41589BF7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 14:54:19 +0200 (CEST)
Received: from localhost ([::1]:42420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJaMk-0008Qj-ES
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 08:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oJZfI-0001ht-0O; Thu, 04 Aug 2022 08:09:24 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:38210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oJZfE-0006e5-MB; Thu, 04 Aug 2022 08:09:23 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D726F74633E;
 Thu,  4 Aug 2022 14:09:16 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 77F55746335; Thu,  4 Aug 2022 14:09:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 75A2A746324;
 Thu,  4 Aug 2022 14:09:16 +0200 (CEST)
Date: Thu, 4 Aug 2022 14:09:16 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org, 
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 12/20] ppc/ppc405: QOM'ify EBC
In-Reply-To: <4885e6d0-8fff-4712-d032-c5afcac79ff7@kaod.org>
Message-ID: <7b97e54b-4d80-6db9-af33-40a539827ddd@eik.bme.hu>
References: <20220803132844.2370514-1-clg@kaod.org>
 <20220803132844.2370514-13-clg@kaod.org>
 <973576c1-deb8-3973-34e7-d038ca2200c2@gmail.com>
 <4885e6d0-8fff-4712-d032-c5afcac79ff7@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1883355536-1659614956=:4488"
X-Spam-Probability: 11%
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

--3866299591-1883355536-1659614956=:4488
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 4 Aug 2022, Cédric Le Goater wrote:
> On 8/4/22 01:36, Daniel Henrique Barboza wrote:
>> Cedric,
>> 
>> On 8/3/22 10:28, Cédric Le Goater wrote:
>>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>   hw/ppc/ppc405.h    | 16 +++++++++++
>>>   hw/ppc/ppc405_uc.c | 71 +++++++++++++++++++++++++++++++---------------
>>>   2 files changed, 64 insertions(+), 23 deletions(-)
>>> 
>>> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
>>> index 1da34a7f10f3..1c7fe07b8084 100644
>>> --- a/hw/ppc/ppc405.h
>>> +++ b/hw/ppc/ppc405.h
>>> @@ -65,7 +65,22 @@ struct ppc4xx_bd_info_t {
>>>   typedef struct Ppc405SoCState Ppc405SoCState;
>>> +/* Peripheral controller */
>>> +#define TYPE_PPC405_EBC "ppc405-ebc"
>>> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405EbcState, PPC405_EBC);
>>> +struct Ppc405EbcState {
>>> +    DeviceState parent_obj;
>>> +
>>> +    PowerPCCPU *cpu;
>>> +    uint32_t addr;
>>> +    uint32_t bcr[8];
>>> +    uint32_t bap[8];
>>> +    uint32_t bear;
>>> +    uint32_t besr0;
>>> +    uint32_t besr1;
>>> +    uint32_t cfg;
>>> +};
>>>   /* DMA controller */
>>>   #define TYPE_PPC405_DMA "ppc405-dma"
>>> @@ -203,6 +218,7 @@ struct Ppc405SoCState {
>>>       Ppc405OcmState ocm;
>>>       Ppc405GpioState gpio;
>>>       Ppc405DmaState dma;
>>> +    Ppc405EbcState ebc;
>>>   };
>>>   /* PowerPC 405 core */
>>> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
>>> index 6bd93c1cb90c..0166f3fc36da 100644
>>> --- a/hw/ppc/ppc405_uc.c
>>> +++ b/hw/ppc/ppc405_uc.c
>>> @@ -393,17 +393,6 @@ static void ppc4xx_opba_init(hwaddr base)
>>>   
>>> /*****************************************************************************/
>>>   /* Peripheral controller */
>>> -typedef struct ppc4xx_ebc_t ppc4xx_ebc_t;
>>> -struct ppc4xx_ebc_t {
>>> -    uint32_t addr;
>>> -    uint32_t bcr[8];
>>> -    uint32_t bap[8];
>>> -    uint32_t bear;
>>> -    uint32_t besr0;
>>> -    uint32_t besr1;
>>> -    uint32_t cfg;
>>> -};
>>> -
>>>   enum {
>>>       EBC0_CFGADDR = 0x012,
>>>       EBC0_CFGDATA = 0x013,
>>> @@ -411,10 +400,9 @@ enum {
>>>   static uint32_t dcr_read_ebc (void *opaque, int dcrn)
>>>   {
>>> -    ppc4xx_ebc_t *ebc;
>>> +    Ppc405EbcState *ebc = PPC405_EBC(opaque);
>>>       uint32_t ret;
>>> -    ebc = opaque;
>>>       switch (dcrn) {
>>>       case EBC0_CFGADDR:
>>>           ret = ebc->addr;
>>> @@ -496,9 +484,8 @@ static uint32_t dcr_read_ebc (void *opaque, int dcrn)
>>>   static void dcr_write_ebc (void *opaque, int dcrn, uint32_t val)
>>>   {
>>> -    ppc4xx_ebc_t *ebc;
>>> +    Ppc405EbcState *ebc = PPC405_EBC(opaque);
>>> -    ebc = opaque;
>>>       switch (dcrn) {
>>>       case EBC0_CFGADDR:
>>>           ebc->addr = val;
>>> @@ -554,12 +541,11 @@ static void dcr_write_ebc (void *opaque, int dcrn, 
>>> uint32_t val)
>>>       }
>>>   }
>>> -static void ebc_reset (void *opaque)
>>> +static void ppc405_ebc_reset(DeviceState *dev)
>>>   {
>>> -    ppc4xx_ebc_t *ebc;
>>> +    Ppc405EbcState *ebc = PPC405_EBC(dev);
>>>       int i;
>>> -    ebc = opaque;
>>>       ebc->addr = 0x00000000;
>>>       ebc->bap[0] = 0x7F8FFE80;
>>>       ebc->bcr[0] = 0xFFE28000;
>>> @@ -572,18 +558,46 @@ static void ebc_reset (void *opaque)
>>>       ebc->cfg = 0x80400000;
>>>   }
>>> -void ppc405_ebc_init(CPUPPCState *env)
>>> +static void ppc405_ebc_realize(DeviceState *dev, Error **errp)
>>>   {
>>> -    ppc4xx_ebc_t *ebc;
>>> +    Ppc405EbcState *ebc = PPC405_EBC(dev);
>>> +    CPUPPCState *env;
>>> +
>>> +    assert(ebc->cpu);
>>> +
>>> +    env = &ebc->cpu->env;
>>> -    ebc = g_new0(ppc4xx_ebc_t, 1);
>>> -    qemu_register_reset(&ebc_reset, ebc);
>>>       ppc_dcr_register(env, EBC0_CFGADDR,
>>>                        ebc, &dcr_read_ebc, &dcr_write_ebc);
>>>       ppc_dcr_register(env, EBC0_CFGDATA,
>>>                        ebc, &dcr_read_ebc, &dcr_write_ebc);
>>>   }
>>> +static Property ppc405_ebc_properties[] = {
>>> +    DEFINE_PROP_LINK("cpu", Ppc405EbcState, cpu, TYPE_POWERPC_CPU,
>>> +                     PowerPCCPU *),
>>> +    DEFINE_PROP_END_OF_LIST(),
>>> +};
>>> +
>>> +static void ppc405_ebc_class_init(ObjectClass *oc, void *data)
>>> +{
>>> +    DeviceClass *dc = DEVICE_CLASS(oc);
>>> +
>>> +    dc->realize = ppc405_ebc_realize;
>>> +    dc->user_creatable = false;
>>> +    dc->reset = ppc405_ebc_reset;
>>> +    device_class_set_props(dc, ppc405_ebc_properties);
>>> +}
>>> +
>>> +void ppc405_ebc_init(CPUPPCState *env)
>>> +{
>>> +    PowerPCCPU *cpu = env_archcpu(env);
>>> +    DeviceState *dev = qdev_new(TYPE_PPC405_EBC);
>>> +
>>> +    object_property_set_link(OBJECT(cpu), "cpu", OBJECT(dev), 
>>> &error_abort);
>> 
>> This line is breaking the boot of sam460ex:
>> 
>>
>>   ./qemu-system-ppc64 -display none -M sam460ex
>> Unexpected error in object_property_find_err() at ../qom/object.c:1304:
>> qemu-system-ppc64: Property '460exb-powerpc64-cpu.cpu' not found
>> Aborted (core dumped)
>> 
>> 
>> I think you meant to link the cpu prop of the EBC obj to the CPU object,
>> not the cpu prop of the CPU obj to the EBC dev.
>
> Yes. ppc405_ebc_init() has only one user left, the sam460ex, which I didn't
> test :/

This patch changes ppc405_ebc_init to a realize method so shouldn't the 
sam460ex be changed to create the new object instead of calling 
ppc405_ebc_init too instead? Is the only reason the keep ppc405_ebc_init 
to add the cpu link? As I noted before it would be nice to get rid of this 
link somehow, it would allow dropping this init func and a bunch of 
property descriptors where this cpu link is the only object. It should be 
possble to get from a QOM object to its parent and the cpu from there but 
I could not find out how. Maybe somehow with object_resolve_path() or 
object_resolve_path_type() but I don't know QOM enough and did not find 
anything in docs. Does somebody know how to do that? Or maybe the paths 
are always the same so it could resolve an absolute path. Don't know how 
it looks buth something like /machine/soc/cpu or similar to get to the cpu 
to get the env. This could work as long as we assume we only have one cpu 
but these SoC all have. Then no cpu link is needed and could get rid of a 
lot of boilerplate code. Does this make sense?

Regards,
BALATON Zoltan

> Thanks,
>
> C.
> 
>> 
>> This fixes the issue:
>> 
>> 
>> $ git diff
>> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
>> index 0166f3fc36..aac3a3f761 100644
>> --- a/hw/ppc/ppc405_uc.c
>> +++ b/hw/ppc/ppc405_uc.c
>> @@ -594,7 +594,7 @@ void ppc405_ebc_init(CPUPPCState *env)
>>       PowerPCCPU *cpu = env_archcpu(env);
>>       DeviceState *dev = qdev_new(TYPE_PPC405_EBC);
>> 
>> -    object_property_set_link(OBJECT(cpu), "cpu", OBJECT(dev), 
>> &error_abort);
>> +    object_property_set_link(OBJECT(dev), "cpu", OBJECT(cpu), 
>> &error_abort);
>>       qdev_realize_and_unref(dev, NULL, &error_fatal);
>>   }
>> 
>> 
>> Daniel
>> 
>> 
>>> +    qdev_realize_and_unref(dev, NULL, &error_fatal);
>>> +}
>>> +
>>>   
>>> /*****************************************************************************/
>>>   /* DMA controller */
>>>   enum {
>>> @@ -1418,6 +1432,8 @@ static void ppc405_soc_instance_init(Object *obj)
>>>       object_initialize_child(obj, "gpio", &s->gpio, TYPE_PPC405_GPIO);
>>>       object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
>>> +
>>> +    object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC405_EBC);
>>>   }
>>>   static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>>> @@ -1490,7 +1506,11 @@ static void ppc405_soc_realize(DeviceState *dev, 
>>> Error **errp)
>>>                         s->ram_bases, s->ram_sizes, s->do_dram_init);
>>>       /* External bus controller */
>>> -    ppc405_ebc_init(env);
>>> +    object_property_set_link(OBJECT(&s->ebc), "cpu", OBJECT(&s->cpu),
>>> +                             &error_abort);
>>> +    if (!qdev_realize(DEVICE(&s->ebc), NULL, errp)) {
>>> +        return;
>>> +    }
>>>       /* DMA controller */
>>>       object_property_set_link(OBJECT(&s->dma), "cpu", OBJECT(&s->cpu),
>>> @@ -1576,6 +1596,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, 
>>> void *data)
>>>   static const TypeInfo ppc405_types[] = {
>>>       {
>>> +        .name           = TYPE_PPC405_EBC,
>>> +        .parent         = TYPE_DEVICE,
>>> +        .instance_size  = sizeof(Ppc405EbcState),
>>> +        .class_init     = ppc405_ebc_class_init,
>>> +    }, {
>>>           .name           = TYPE_PPC405_DMA,
>>>           .parent         = TYPE_SYS_BUS_DEVICE,
>>>           .instance_size  = sizeof(Ppc405DmaState),
>
>
>
--3866299591-1883355536-1659614956=:4488--

