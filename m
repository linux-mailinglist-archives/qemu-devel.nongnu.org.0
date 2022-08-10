Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8776658EB74
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 13:45:04 +0200 (CEST)
Received: from localhost ([::1]:46568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLk91-00021f-B5
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 07:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oLk55-0005hO-4Q; Wed, 10 Aug 2022 07:41:02 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:15028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oLk53-0000qp-AY; Wed, 10 Aug 2022 07:40:58 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BC959746307;
 Wed, 10 Aug 2022 13:40:54 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 76A547461AE; Wed, 10 Aug 2022 13:40:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 75504745702;
 Wed, 10 Aug 2022 13:40:54 +0200 (CEST)
Date: Wed, 10 Aug 2022 13:40:54 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 19/24] ppc/ppc405: QOM'ify FPGA
In-Reply-To: <a1bb55bd-93d5-ad77-7aae-2303045ee3e4@kaod.org>
Message-ID: <3d33614f-9eeb-b673-de2b-6dc8ea1d2@eik.bme.hu>
References: <20220809153904.485018-1-clg@kaod.org>
 <20220809153904.485018-20-clg@kaod.org>
 <a1e6fbc2-a572-9ea5-2ef5-e1982229a578@eik.bme.hu>
 <a1bb55bd-93d5-ad77-7aae-2303045ee3e4@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1413320438-1660131654=:31978"
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

--3866299591-1413320438-1660131654=:31978
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 10 Aug 2022, Cédric Le Goater wrote:
> On 8/9/22 19:37, BALATON Zoltan wrote:
>> On Tue, 9 Aug 2022, Cédric Le Goater wrote:
>>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>> hw/ppc/ppc405_boards.c | 55 +++++++++++++++++++++++++++++-------------
>>> 1 file changed, 38 insertions(+), 17 deletions(-)
>>> 
>>> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
>>> index 3677793adc75..4ff6715f3533 100644
>>> --- a/hw/ppc/ppc405_boards.c
>>> +++ b/hw/ppc/ppc405_boards.c
>>> @@ -71,18 +71,23 @@ struct Ppc405MachineState {
>>>  * - NVRAM (0xF0000000)
>>>  * - FPGA  (0xF0300000)
>>>  */
>>> -typedef struct ref405ep_fpga_t ref405ep_fpga_t;
>>> -struct ref405ep_fpga_t {
>>> +
>>> +#define TYPE_REF405EP_FPGA "ref405ep-fpga"
>>> +OBJECT_DECLARE_SIMPLE_TYPE(Ref405epFpgaState, REF405EP_FPGA);
>>> +struct Ref405epFpgaState {
>>> +    SysBusDevice parent_obj;
>>> +
>>> +    MemoryRegion iomem;
>>> +
>>>     uint8_t reg0;
>>>     uint8_t reg1;
>>> };
>>> 
>>> static uint64_t ref405ep_fpga_readb(void *opaque, hwaddr addr, unsigned 
>>> size)
>>> {
>>> -    ref405ep_fpga_t *fpga;
>>> +    Ref405epFpgaState *fpga = REF405EP_FPGA(opaque);
>>>     uint32_t ret;
>>> 
>>> -    fpga = opaque;
>>>     switch (addr) {
>>>     case 0x0:
>>>         ret = fpga->reg0;
>>> @@ -101,9 +106,8 @@ static uint64_t ref405ep_fpga_readb(void *opaque, 
>>> hwaddr addr, unsigned size)
>>> static void ref405ep_fpga_writeb(void *opaque, hwaddr addr, uint64_t 
>>> value,
>>>                                  unsigned size)
>>> {
>>> -    ref405ep_fpga_t *fpga;
>>> +    Ref405epFpgaState *fpga = REF405EP_FPGA(opaque);
>>> 
>>> -    fpga = opaque;
>>>     switch (addr) {
>>>     case 0x0:
>>>         /* Read only */
>>> @@ -126,27 +130,39 @@ static const MemoryRegionOps ref405ep_fpga_ops = {
>>>     .endianness = DEVICE_BIG_ENDIAN,
>>> };
>>> 
>>> -static void ref405ep_fpga_reset (void *opaque)
>>> +static void ref405ep_fpga_reset(DeviceState *dev)
>>> {
>>> -    ref405ep_fpga_t *fpga;
>>> +    Ref405epFpgaState *fpga = REF405EP_FPGA(dev);
>>> 
>>> -    fpga = opaque;
>>>     fpga->reg0 = 0x00;
>>>     fpga->reg1 = 0x0F;
>>> }
>>> 
>>> -static void ref405ep_fpga_init(MemoryRegion *sysmem, uint32_t base)
>>> +static void ref405ep_fpga_realize(DeviceState *dev, Error **errp)
>>> {
>>> -    ref405ep_fpga_t *fpga;
>>> -    MemoryRegion *fpga_memory = g_new(MemoryRegion, 1);
>>> +    Ref405epFpgaState *s = REF405EP_FPGA(dev);
>>> 
>>> -    fpga = g_new0(ref405ep_fpga_t, 1);
>>> -    memory_region_init_io(fpga_memory, NULL, &ref405ep_fpga_ops, fpga,
>>> +    memory_region_init_io(&s->iomem, OBJECT(s), &ref405ep_fpga_ops, s,
>>>                           "fpga", 0x00000100);
>>> -    memory_region_add_subregion(sysmem, base, fpga_memory);
>>> -    qemu_register_reset(&ref405ep_fpga_reset, fpga);
>>> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
>>> +}
>>> +
>>> +static void ref405ep_fpga_class_init(ObjectClass *oc, void *data)
>>> +{
>>> +    DeviceClass *dc = DEVICE_CLASS(oc);
>>> +
>>> +    dc->realize = ref405ep_fpga_realize;
>>> +    dc->user_creatable = false;
>> 
>> Comment missing (and I'd drop unnecessary QOM casts) but otherwise:
>
> Ah yes. I don't think it is worth a v5 for that. I will send a patch
> fixing the missing comments. There are a few: SoC, MAL, FPGA, SDRAM.
> Unless Daniel is willing to amend the patches.

I think you'll need a v5 for other changes anyway so it's easier if you 
update it too.

Regards,
BALATON Zoltan

> Thanks,
>
> C.
>
>> 
>> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
>> 
>> Regards,
>> BALATON Zoltan
>> 
>>> +    dc->reset = ref405ep_fpga_reset;
>>> }
>>> 
>>> +static const TypeInfo ref405ep_fpga_type = {
>>> +    .name = TYPE_REF405EP_FPGA,
>>> +    .parent = TYPE_SYS_BUS_DEVICE,
>>> +    .instance_size = sizeof(Ref405epFpgaState),
>>> +    .class_init = ref405ep_fpga_class_init,
>>> +};
>>> +
>>> /*
>>>  * CPU reset handler when booting directly from a loaded kernel
>>>  */
>>> @@ -331,7 +347,11 @@ static void ref405ep_init(MachineState *machine)
>>>     memory_region_add_subregion(get_system_memory(), PPC405EP_SRAM_BASE, 
>>> sram);
>>> 
>>>     /* Register FPGA */
>>> -    ref405ep_fpga_init(get_system_memory(), PPC405EP_FPGA_BASE);
>>> +    dev = qdev_new(TYPE_REF405EP_FPGA);
>>> +    object_property_add_child(OBJECT(machine), "fpga", OBJECT(dev));
>>> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, PPC405EP_FPGA_BASE);
>>> +
>>>     /* Register NVRAM */
>>>     dev = qdev_new("sysbus-m48t08");
>>>     qdev_prop_set_int32(dev, "base-year", 1968);
>>> @@ -376,6 +396,7 @@ static void ppc405_machine_init(void)
>>> {
>>>     type_register_static(&ppc405_machine_type);
>>>     type_register_static(&ref405ep_type);
>>> +    type_register_static(&ref405ep_fpga_type);
>>> }
>>> 
>>> type_init(ppc405_machine_init)
>>> 
>
>
>
--3866299591-1413320438-1660131654=:31978--

