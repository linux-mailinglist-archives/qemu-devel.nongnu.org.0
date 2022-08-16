Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E71AD5956A7
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 11:38:02 +0200 (CEST)
Received: from localhost ([::1]:58084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNt1N-0001y7-Oq
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 05:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oNszE-0008Br-NG; Tue, 16 Aug 2022 05:35:48 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:11029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oNszC-0005Nt-Ea; Tue, 16 Aug 2022 05:35:48 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 892C174633D;
 Tue, 16 Aug 2022 11:35:44 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 33C2E746324; Tue, 16 Aug 2022 11:35:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 325A874632C;
 Tue, 16 Aug 2022 11:35:44 +0200 (CEST)
Date: Tue, 16 Aug 2022 11:35:44 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 12/22] ppc4xx: Move PLB model to ppc4xx_devs.c
In-Reply-To: <8f8f6d43-5cfe-905f-86ab-a40d3e132096@kaod.org>
Message-ID: <d0cfebb4-26a1-714-449d-cb88ad1c98bf@eik.bme.hu>
References: <cover.1660402839.git.balaton@eik.bme.hu>
 <3f182ba0e89eeea855516cf3651fb8cc4cf9b546.1660402839.git.balaton@eik.bme.hu>
 <8f8f6d43-5cfe-905f-86ab-a40d3e132096@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-806507944-1660642544=:7210"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--3866299591-806507944-1660642544=:7210
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 16 Aug 2022, Cédric Le Goater wrote:
> On 8/13/22 17:34, BALATON Zoltan wrote:
>> The PLB is shared between 405 and 440 so move it to the shared file.
>
> Should we rename the device to Ppc4xxPlbState ?

I could do that (also for the other one moved). Ptobably nothing in these 
boards care about the names so it shouldn't break anything.

Regards,
BALATON Zoltan

> Thanks,
>
> C.
>
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/ppc/ppc405.h         | 11 -----
>>   hw/ppc/ppc405_uc.c      | 93 ----------------------------------------
>>   hw/ppc/ppc4xx_devs.c    | 94 +++++++++++++++++++++++++++++++++++++++++
>>   include/hw/ppc/ppc4xx.h | 11 +++++
>>   4 files changed, 105 insertions(+), 104 deletions(-)
>> 
>> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
>> index 31c94e4742..d85c595f9d 100644
>> --- a/hw/ppc/ppc405.h
>> +++ b/hw/ppc/ppc405.h
>> @@ -63,17 +63,6 @@ struct ppc4xx_bd_info_t {
>>       uint32_t bi_iic_fast[2];
>>   };
>>   -/* Peripheral local bus arbitrer */
>> -#define TYPE_PPC405_PLB "ppc405-plb"
>> -OBJECT_DECLARE_SIMPLE_TYPE(Ppc405PlbState, PPC405_PLB);
>> -struct Ppc405PlbState {
>> -    Ppc4xxDcrDeviceState parent_obj;
>> -
>> -    uint32_t acr;
>> -    uint32_t bear;
>> -    uint32_t besr;
>> -};
>> -
>>   /* PLB to OPB bridge */
>>   #define TYPE_PPC405_POB "ppc405-pob"
>>   OBJECT_DECLARE_SIMPLE_TYPE(Ppc405PobState, PPC405_POB);
>> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
>> index 922c23346f..3de6c77631 100644
>> --- a/hw/ppc/ppc405_uc.c
>> +++ b/hw/ppc/ppc405_uc.c
>> @@ -137,94 +137,6 @@ ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, 
>> ram_addr_t ram_size)
>>   /*****************************************************************************/
>>   /* Shared peripherals */
>> 
>> -/*****************************************************************************/
>> -/* Peripheral local bus arbitrer */
>> -enum {
>> -    PLB3A0_ACR = 0x077,
>> -    PLB4A0_ACR = 0x081,
>> -    PLB0_BESR  = 0x084,
>> -    PLB0_BEAR  = 0x086,
>> -    PLB0_ACR   = 0x087,
>> -    PLB4A1_ACR = 0x089,
>> -};
>> -
>> -static uint32_t dcr_read_plb(void *opaque, int dcrn)
>> -{
>> -    Ppc405PlbState *plb = opaque;
>> -    uint32_t ret;
>> -
>> -    switch (dcrn) {
>> -    case PLB0_ACR:
>> -        ret = plb->acr;
>> -        break;
>> -    case PLB0_BEAR:
>> -        ret = plb->bear;
>> -        break;
>> -    case PLB0_BESR:
>> -        ret = plb->besr;
>> -        break;
>> -    default:
>> -        /* Avoid gcc warning */
>> -        ret = 0;
>> -        break;
>> -    }
>> -
>> -    return ret;
>> -}
>> -
>> -static void dcr_write_plb(void *opaque, int dcrn, uint32_t val)
>> -{
>> -    Ppc405PlbState *plb = opaque;
>> -
>> -    switch (dcrn) {
>> -    case PLB0_ACR:
>> -        /* We don't care about the actual parameters written as
>> -         * we don't manage any priorities on the bus
>> -         */
>> -        plb->acr = val & 0xF8000000;
>> -        break;
>> -    case PLB0_BEAR:
>> -        /* Read only */
>> -        break;
>> -    case PLB0_BESR:
>> -        /* Write-clear */
>> -        plb->besr &= ~val;
>> -        break;
>> -    }
>> -}
>> -
>> -static void ppc405_plb_reset(DeviceState *dev)
>> -{
>> -    Ppc405PlbState *plb = PPC405_PLB(dev);
>> -
>> -    plb->acr = 0x00000000;
>> -    plb->bear = 0x00000000;
>> -    plb->besr = 0x00000000;
>> -}
>> -
>> -static void ppc405_plb_realize(DeviceState *dev, Error **errp)
>> -{
>> -    Ppc405PlbState *plb = PPC405_PLB(dev);
>> -    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
>> -
>> -    ppc4xx_dcr_register(dcr, PLB3A0_ACR, plb, &dcr_read_plb, 
>> &dcr_write_plb);
>> -    ppc4xx_dcr_register(dcr, PLB4A0_ACR, plb, &dcr_read_plb, 
>> &dcr_write_plb);
>> -    ppc4xx_dcr_register(dcr, PLB0_ACR, plb, &dcr_read_plb, 
>> &dcr_write_plb);
>> -    ppc4xx_dcr_register(dcr, PLB0_BEAR, plb, &dcr_read_plb, 
>> &dcr_write_plb);
>> -    ppc4xx_dcr_register(dcr, PLB0_BESR, plb, &dcr_read_plb, 
>> &dcr_write_plb);
>> -    ppc4xx_dcr_register(dcr, PLB4A1_ACR, plb, &dcr_read_plb, 
>> &dcr_write_plb);
>> -}
>> -
>> -static void ppc405_plb_class_init(ObjectClass *oc, void *data)
>> -{
>> -    DeviceClass *dc = DEVICE_CLASS(oc);
>> -
>> -    dc->realize = ppc405_plb_realize;
>> -    dc->reset = ppc405_plb_reset;
>> -    /* Reason: only works as function of a ppc4xx SoC */
>> -    dc->user_creatable = false;
>> -}
>> -
>>   /*****************************************************************************/
>>   /* PLB to OPB bridge */
>>   enum {
>> @@ -1535,11 +1447,6 @@ static void ppc405_soc_class_init(ObjectClass *oc, 
>> void *data)
>>     static const TypeInfo ppc405_types[] = {
>>       {
>> -        .name           = TYPE_PPC405_PLB,
>> -        .parent         = TYPE_PPC4xx_DCR_DEVICE,
>> -        .instance_size  = sizeof(Ppc405PlbState),
>> -        .class_init     = ppc405_plb_class_init,
>> -    }, {
>>           .name           = TYPE_PPC405_POB,
>>           .parent         = TYPE_PPC4xx_DCR_DEVICE,
>>           .instance_size  = sizeof(Ppc405PobState),
>> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
>> index 7d40c1b68a..843d759b1b 100644
>> --- a/hw/ppc/ppc4xx_devs.c
>> +++ b/hw/ppc/ppc4xx_devs.c
>> @@ -658,6 +658,95 @@ static void ppc4xx_mal_class_init(ObjectClass *oc, 
>> void *data)
>>       device_class_set_props(dc, ppc4xx_mal_properties);
>>   }
>>   +/*****************************************************************************/
>> +/* Peripheral local bus arbitrer */
>> +enum {
>> +    PLB3A0_ACR = 0x077,
>> +    PLB4A0_ACR = 0x081,
>> +    PLB0_BESR  = 0x084,
>> +    PLB0_BEAR  = 0x086,
>> +    PLB0_ACR   = 0x087,
>> +    PLB4A1_ACR = 0x089,
>> +};
>> +
>> +static uint32_t dcr_read_plb(void *opaque, int dcrn)
>> +{
>> +    Ppc405PlbState *plb = opaque;
>> +    uint32_t ret;
>> +
>> +    switch (dcrn) {
>> +    case PLB0_ACR:
>> +        ret = plb->acr;
>> +        break;
>> +    case PLB0_BEAR:
>> +        ret = plb->bear;
>> +        break;
>> +    case PLB0_BESR:
>> +        ret = plb->besr;
>> +        break;
>> +    default:
>> +        /* Avoid gcc warning */
>> +        ret = 0;
>> +        break;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static void dcr_write_plb(void *opaque, int dcrn, uint32_t val)
>> +{
>> +    Ppc405PlbState *plb = opaque;
>> +
>> +    switch (dcrn) {
>> +    case PLB0_ACR:
>> +        /*
>> +         * We don't care about the actual parameters written as
>> +         * we don't manage any priorities on the bus
>> +         */
>> +        plb->acr = val & 0xF8000000;
>> +        break;
>> +    case PLB0_BEAR:
>> +        /* Read only */
>> +        break;
>> +    case PLB0_BESR:
>> +        /* Write-clear */
>> +        plb->besr &= ~val;
>> +        break;
>> +    }
>> +}
>> +
>> +static void ppc405_plb_reset(DeviceState *dev)
>> +{
>> +    Ppc405PlbState *plb = PPC405_PLB(dev);
>> +
>> +    plb->acr = 0x00000000;
>> +    plb->bear = 0x00000000;
>> +    plb->besr = 0x00000000;
>> +}
>> +
>> +static void ppc405_plb_realize(DeviceState *dev, Error **errp)
>> +{
>> +    Ppc405PlbState *plb = PPC405_PLB(dev);
>> +    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
>> +
>> +    ppc4xx_dcr_register(dcr, PLB3A0_ACR, plb, &dcr_read_plb, 
>> &dcr_write_plb);
>> +    ppc4xx_dcr_register(dcr, PLB4A0_ACR, plb, &dcr_read_plb, 
>> &dcr_write_plb);
>> +    ppc4xx_dcr_register(dcr, PLB0_ACR, plb, &dcr_read_plb, 
>> &dcr_write_plb);
>> +    ppc4xx_dcr_register(dcr, PLB0_BEAR, plb, &dcr_read_plb, 
>> &dcr_write_plb);
>> +    ppc4xx_dcr_register(dcr, PLB0_BESR, plb, &dcr_read_plb, 
>> &dcr_write_plb);
>> +    ppc4xx_dcr_register(dcr, PLB4A1_ACR, plb, &dcr_read_plb, 
>> &dcr_write_plb);
>> +}
>> +
>> +static void ppc405_plb_class_init(ObjectClass *oc, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(oc);
>> +
>> +    dc->realize = ppc405_plb_realize;
>> +    dc->reset = ppc405_plb_reset;
>> +    /* Reason: only works as function of a ppc4xx SoC */
>> +    dc->user_creatable = false;
>> +}
>> +
>>   /* PPC4xx_DCR_DEVICE */
>>     void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn, void 
>> *opaque,
>> @@ -694,6 +783,11 @@ static const TypeInfo ppc4xx_types[] = {
>>           .instance_size  = sizeof(Ppc4xxMalState),
>>           .instance_finalize = ppc4xx_mal_finalize,
>>           .class_init     = ppc4xx_mal_class_init,
>> +    }, {
>> +        .name           = TYPE_PPC405_PLB,
>> +        .parent         = TYPE_PPC4xx_DCR_DEVICE,
>> +        .instance_size  = sizeof(Ppc405PlbState),
>> +        .class_init     = ppc405_plb_class_init,
>>       }, {
>>           .name           = TYPE_PPC4xx_DCR_DEVICE,
>>           .parent         = TYPE_SYS_BUS_DEVICE,
>> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
>> index f40bd49bc7..e696e159f3 100644
>> --- a/include/hw/ppc/ppc4xx.h
>> +++ b/include/hw/ppc/ppc4xx.h
>> @@ -83,4 +83,15 @@ struct Ppc4xxMalState {
>>       uint8_t  rxcnum;
>>   };
>>   +/* Peripheral local bus arbitrer */
>> +#define TYPE_PPC405_PLB "ppc405-plb"
>> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405PlbState, PPC405_PLB);
>> +struct Ppc405PlbState {
>> +    Ppc4xxDcrDeviceState parent_obj;
>> +
>> +    uint32_t acr;
>> +    uint32_t bear;
>> +    uint32_t besr;
>> +};
>> +
>>   #endif /* PPC4XX_H */
>
>
>
--3866299591-806507944-1660642544=:7210--

