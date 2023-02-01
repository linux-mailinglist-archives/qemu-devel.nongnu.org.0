Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC83687219
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 00:58:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNMyj-0000EM-5B; Wed, 01 Feb 2023 18:57:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNMyb-0000E1-Kn; Wed, 01 Feb 2023 18:57:17 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNMyZ-0005Wl-5G; Wed, 01 Feb 2023 18:57:17 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id EB07B74635C;
 Thu,  2 Feb 2023 00:54:43 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9B38F74634B; Thu,  2 Feb 2023 00:54:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 99BFC74632B;
 Thu,  2 Feb 2023 00:54:43 +0100 (CET)
Date: Thu, 2 Feb 2023 00:54:43 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH 4/4] hw/misc/macio: Return bool from functions taking errp
In-Reply-To: <4b311eb7-4dc8-2a44-0c2c-8bc40131f9eb@ilande.co.uk>
Message-ID: <3abbcbb2-78ce-2a72-e95f-182a6dc4786d@eik.bme.hu>
References: <cover.1674001241.git.balaton@eik.bme.hu>
 <bfce0751e82b031f5e6fb3c32cfbce6325434400.1674001242.git.balaton@eik.bme.hu>
 <4b311eb7-4dc8-2a44-0c2c-8bc40131f9eb@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 1 Feb 2023, Mark Cave-Ayland wrote:
> On 18/01/2023 00:32, BALATON Zoltan wrote:
>> Use the convention to return bool from functions which take an error
>> pointer which allows for callers to pass through their error pointer
>> without needing a local.
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/misc/macio/macio.c | 62 +++++++++++++++++--------------------------
>>   1 file changed, 25 insertions(+), 37 deletions(-)
>> 
>> diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
>> index ae2a9a960d..265c0bbd8d 100644
>> --- a/hw/misc/macio/macio.c
>> +++ b/hw/misc/macio/macio.c
>> @@ -90,13 +90,13 @@ static void macio_bar_setup(MacIOState *s)
>>       macio_escc_legacy_setup(s);
>>   }
>>   -static void macio_common_realize(PCIDevice *d, Error **errp)
>> +static bool macio_common_realize(PCIDevice *d, Error **errp)
>>   {
>>       MacIOState *s = MACIO(d);
>>       SysBusDevice *sbd;
>>         if (!qdev_realize(DEVICE(&s->dbdma), BUS(&s->macio_bus), errp)) {
>> -        return;
>> +        return false;
>>       }
>>       sbd = SYS_BUS_DEVICE(&s->dbdma);
>>       memory_region_add_subregion(&s->bar, 0x08000,
>> @@ -108,14 +108,16 @@ static void macio_common_realize(PCIDevice *d, Error 
>> **errp)
>>       qdev_prop_set_uint32(DEVICE(&s->escc), "chnBtype", escc_serial);
>>       qdev_prop_set_uint32(DEVICE(&s->escc), "chnAtype", escc_serial);
>>       if (!qdev_realize(DEVICE(&s->escc), BUS(&s->macio_bus), errp)) {
>> -        return;
>> +        return false;
>>       }
>>         macio_bar_setup(s);
>>       pci_register_bar(d, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->bar);
>> +
>> +    return true;
>>   }
>>   -static void macio_realize_ide(MacIOState *s, MACIOIDEState *ide,
>> +static bool macio_realize_ide(MacIOState *s, MACIOIDEState *ide,
>>                                 qemu_irq irq0, qemu_irq irq1, int dmaid,
>>                                 Error **errp)
>>   {
>> @@ -128,7 +130,7 @@ static void macio_realize_ide(MacIOState *s, 
>> MACIOIDEState *ide,
>>                                &error_abort);
>>       macio_ide_register_dma(ide);
>>   -    qdev_realize(DEVICE(ide), BUS(&s->macio_bus), errp);
>> +    return qdev_realize(DEVICE(ide), BUS(&s->macio_bus), errp);
>>   }
>>     static void macio_oldworld_realize(PCIDevice *d, Error **errp)
>> @@ -136,12 +138,9 @@ static void macio_oldworld_realize(PCIDevice *d, Error 
>> **errp)
>>       MacIOState *s = MACIO(d);
>>       OldWorldMacIOState *os = OLDWORLD_MACIO(d);
>>       DeviceState *pic_dev = DEVICE(&os->pic);
>> -    Error *err = NULL;
>>       SysBusDevice *sbd;
>>   -    macio_common_realize(d, &err);
>> -    if (err) {
>> -        error_propagate(errp, err);
>> +    if (!macio_common_realize(d, errp)) {
>>           return;
>>       }
>>   @@ -176,21 +175,17 @@ static void macio_oldworld_realize(PCIDevice *d, 
>> Error **errp)
>>       pmac_format_nvram_partition(&os->nvram, os->nvram.size);
>>         /* IDE buses */
>> -    macio_realize_ide(s, &os->ide[0],
>> -                      qdev_get_gpio_in(pic_dev, OLDWORLD_IDE0_IRQ),
>> -                      qdev_get_gpio_in(pic_dev, OLDWORLD_IDE0_DMA_IRQ),
>> -                      0x16, &err);
>> -    if (err) {
>> -        error_propagate(errp, err);
>> +    if (!macio_realize_ide(s, &os->ide[0],
>> +                           qdev_get_gpio_in(pic_dev, OLDWORLD_IDE0_IRQ),
>> +                           qdev_get_gpio_in(pic_dev, 
>> OLDWORLD_IDE0_DMA_IRQ),
>> +                           0x16, errp)) {
>>           return;
>>       }
>>   -    macio_realize_ide(s, &os->ide[1],
>> -                      qdev_get_gpio_in(pic_dev, OLDWORLD_IDE1_IRQ),
>> -                      qdev_get_gpio_in(pic_dev, OLDWORLD_IDE1_DMA_IRQ),
>> -                      0x1a, &err);
>> -    if (err) {
>> -        error_propagate(errp, err);
>> +    if (!macio_realize_ide(s, &os->ide[1],
>> +                           qdev_get_gpio_in(pic_dev, OLDWORLD_IDE1_IRQ),
>> +                           qdev_get_gpio_in(pic_dev, 
>> OLDWORLD_IDE1_DMA_IRQ),
>> +                           0x1a, errp)) {
>>           return;
>>       }
>>   }
>> @@ -266,13 +261,10 @@ static void macio_newworld_realize(PCIDevice *d, 
>> Error **errp)
>>       MacIOState *s = MACIO(d);
>>       NewWorldMacIOState *ns = NEWWORLD_MACIO(d);
>>       DeviceState *pic_dev = DEVICE(&ns->pic);
>> -    Error *err = NULL;
>>       SysBusDevice *sbd;
>>       MemoryRegion *timer_memory = NULL;
>>   -    macio_common_realize(d, &err);
>> -    if (err) {
>> -        error_propagate(errp, err);
>> +    if (!macio_common_realize(d, errp)) {
>>           return;
>>       }
>>   @@ -288,21 +280,17 @@ static void macio_newworld_realize(PCIDevice *d, 
>> Error **errp)
>>       sysbus_connect_irq(sbd, 1, qdev_get_gpio_in(pic_dev, 
>> NEWWORLD_ESCCA_IRQ));
>>         /* IDE buses */
>> -    macio_realize_ide(s, &ns->ide[0],
>> -                      qdev_get_gpio_in(pic_dev, NEWWORLD_IDE0_IRQ),
>> -                      qdev_get_gpio_in(pic_dev, NEWWORLD_IDE0_DMA_IRQ),
>> -                      0x16, &err);
>> -    if (err) {
>> -        error_propagate(errp, err);
>> +    if (!macio_realize_ide(s, &ns->ide[0],
>> +                           qdev_get_gpio_in(pic_dev, NEWWORLD_IDE0_IRQ),
>> +                           qdev_get_gpio_in(pic_dev, 
>> NEWWORLD_IDE0_DMA_IRQ),
>> +                           0x16, errp)) {
>>           return;
>>       }
>>   -    macio_realize_ide(s, &ns->ide[1],
>> -                      qdev_get_gpio_in(pic_dev, NEWWORLD_IDE1_IRQ),
>> -                      qdev_get_gpio_in(pic_dev, NEWWORLD_IDE1_DMA_IRQ),
>> -                      0x1a, &err);
>> -    if (err) {
>> -        error_propagate(errp, err);
>> +    if (!macio_realize_ide(s, &ns->ide[1],
>> +                           qdev_get_gpio_in(pic_dev, NEWWORLD_IDE1_IRQ),
>> +                           qdev_get_gpio_in(pic_dev, 
>> NEWWORLD_IDE1_DMA_IRQ),
>> +                           0x1a, errp)) {
>>           return;
>>       }
>
> These days you would move macio_common_realize() into TYPE_MACIO, but anyway:

Maybe in further patches later as I think we'll need more macio changes in 
the future but for now this is enough to simplify it a bit.

Regards,
BALATON Zoltan

> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>
>
> ATB,
>
> Mark.
>
>

