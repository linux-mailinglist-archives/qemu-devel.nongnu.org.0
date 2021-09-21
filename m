Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F64413842
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 19:26:27 +0200 (CEST)
Received: from localhost ([::1]:40062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSjXH-00026s-0x
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 13:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mSjVD-0000K9-8n
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 13:24:19 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46144
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mSjVA-0000VT-0X
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 13:24:18 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mSjUz-0002Od-11; Tue, 21 Sep 2021 18:24:09 +0100
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210917075057.20924-1-mark.cave-ayland@ilande.co.uk>
 <20210917075057.20924-5-mark.cave-ayland@ilande.co.uk>
 <5398d9ef-d243-f600-2ec6-8ea8c0d48b09@vivier.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <9de07602-3c07-c202-f051-e372d376164f@ilande.co.uk>
Date: Tue, 21 Sep 2021 18:24:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <5398d9ef-d243-f600-2ec6-8ea8c0d48b09@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v4 04/20] nubus: use bitmap to manage available slots
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/09/2021 20:48, Laurent Vivier wrote:

> Le 17/09/2021 à 09:50, Mark Cave-Ayland a écrit :
>> Convert nubus_device_realize() to use a bitmap to manage available slots to allow
>> for future Nubus devices to be plugged into arbitrary slots from the command line.
>>
>> Update mac_nubus_bridge_init() to only allow slots 0x9 to 0xe on a Macintosh
>> machines as documented in "Desigining Cards and Drivers for the Macintosh Family".
> 
> Perhaps we can also add "NuBus Specification" for the non mac-nubus part?
> 
> http://www.bitsavers.org/pdf/ti/nubus/2242825-0001_NuBus_Spec1983.pdf

I can add that but I'm wondering if it would be better to do this in patch 13 
("nubus-bridge: introduce separate NubusBridge structure") where the comment is 
updated to reflect the difference between Nubus and Macintosh-specific Nubus?

>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/nubus/mac-nubus-bridge.c |  3 +++
>>   hw/nubus/nubus-bus.c        |  2 +-
>>   hw/nubus/nubus-device.c     | 29 +++++++++++++++++++++++++----
>>   include/hw/nubus/nubus.h    |  4 ++--
>>   4 files changed, 31 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/nubus/mac-nubus-bridge.c b/hw/nubus/mac-nubus-bridge.c
>> index 7c329300b8..c1d77e2bc7 100644
>> --- a/hw/nubus/mac-nubus-bridge.c
>> +++ b/hw/nubus/mac-nubus-bridge.c
>> @@ -18,6 +18,9 @@ static void mac_nubus_bridge_init(Object *obj)
>>   
>>       s->bus = NUBUS_BUS(qbus_create(TYPE_NUBUS_BUS, DEVICE(s), NULL));
>>   
>> +    /* Macintosh only has slots 0x9 to 0xe available */
>> +    s->bus->slot_available_mask = MAKE_64BIT_MASK(9, 6);
> 
> Perhaps we can introduce MAC_NUBUS_FIRST_SLOT and MAC_NUBUS_LAST_SLOT
> 
> #define MAC_NUBUS_FIRST_SLOT 0x9
> #define MAC_NUBUS_LAST_SLOT  0xe
> 
> MAKE_64BIT_MASK(MAC_NUBUS_FIRST_SLOT, MAC_NUBUS_LAST_SLOT - MAC_NUBUS_FIRST_SLOT + 1)

I wasn't so keen on the verbosity of the above approach, however since both yourself 
and Zoltan have suggested a similar thing then I will see how it looks for v5.

>> +
>>       sysbus_init_mmio(sbd, &s->bus->super_slot_io);
>>       sysbus_init_mmio(sbd, &s->bus->slot_io);
>>   }
>> diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
>> index 5c13452308..404c1032e0 100644
>> --- a/hw/nubus/nubus-bus.c
>> +++ b/hw/nubus/nubus-bus.c
>> @@ -84,7 +84,7 @@ static void nubus_init(Object *obj)
>>                             nubus, "nubus-slots",
>>                             NUBUS_SLOT_NB * NUBUS_SLOT_SIZE);
>>   
>> -    nubus->current_slot = NUBUS_FIRST_SLOT;
>> +    nubus->slot_available_mask = MAKE_64BIT_MASK(0, 16);
> 
> MAKE_64BIT_MASK(NUBUS_FIRST_SLOT, NUBUS_LAST_SLOT - NUBUS_FIRST_SLOT + 1) ?

Same here.

> And we define 16 slots, but NUBUS_SLOT_NB (above) is 15. (I think it's the value for Mac as last
> slot is 0xe)

If your suggested approach above works then I should be able to change NUBUS_SLOT_NB 
from 15 to 16 here with no other effect.

>>   }
>>   
>>   static void nubus_class_init(ObjectClass *oc, void *data)
>> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
>> index c1832f73da..d91a1e4af3 100644
>> --- a/hw/nubus/nubus-device.c
>> +++ b/hw/nubus/nubus-device.c
>> @@ -160,14 +160,35 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
>>       NubusDevice *nd = NUBUS_DEVICE(dev);
>>       char *name;
>>       hwaddr slot_offset;
>> +    uint16_t s;
>> +
>> +    if (nd->slot == -1) {
>> +        /* No slot specified, find first available free slot */
>> +        s = ctz32(nubus->slot_available_mask);
>> +        if (s != 32) {
>> +            nd->slot = s;
>> +        } else {
>> +            error_setg(errp, "Cannot register nubus card, no free slot "
>> +                             "available");
>> +            return;
>> +        }
>> +    } else {
>> +        /* Slot specified, make sure the slot is available */
>> +        if (!(nubus->slot_available_mask & BIT(nd->slot))) {
>> +            error_setg(errp, "Cannot register nubus card, slot %d is "
>> +                             "unavailable or already occupied", nd->slot);
>> +            return;
>> +        }
>> +    }
>>   
>> -    if (nubus->current_slot < NUBUS_FIRST_SLOT ||
>> -            nubus->current_slot > NUBUS_LAST_SLOT) {
>> -        error_setg(errp, "Cannot register nubus card, not enough slots");
>> +    if (nd->slot < NUBUS_FIRST_SLOT || nd->slot > NUBUS_LAST_SLOT) {
>> +        error_setg(errp, "Cannot register nubus card, slot must be "
>> +                         "between %d and %d", NUBUS_FIRST_SLOT,
>> +                         NUBUS_LAST_SLOT);
> 
> Do we need this checking as we already checked the slot bit is available?
> Moreover it would be more accurate to rely on the bitmap as the first available slot differs between
> nubus and mac-nubus.

 From the discussion of earlier versions of the patchset, the intention was really to 
keep the old restriction as a failsafe: I'm happy to remove this for v5.

>>           return;
>>       }
>>   
>> -    nd->slot = nubus->current_slot++;
>> +    nubus->slot_available_mask &= ~BIT(nd->slot);
>>   
>>       /* Super */
>>       slot_offset = (nd->slot - 6) * NUBUS_SUPER_SLOT_SIZE;
>> diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
>> index 357f621d15..8ff4736259 100644
>> --- a/include/hw/nubus/nubus.h
>> +++ b/include/hw/nubus/nubus.h
>> @@ -19,7 +19,7 @@
>>   #define NUBUS_SLOT_SIZE       0x01000000
>>   #define NUBUS_SLOT_NB         0xF
>>   
>> -#define NUBUS_FIRST_SLOT      0x9
>> +#define NUBUS_FIRST_SLOT      0x0
>>   #define NUBUS_LAST_SLOT       0xF
>>   
>>   #define TYPE_NUBUS_DEVICE "nubus-device"
>> @@ -36,7 +36,7 @@ struct NubusBus {
>>       MemoryRegion super_slot_io;
>>       MemoryRegion slot_io;
>>   
>> -    int current_slot;
>> +    uint32_t slot_available_mask;
>>   };
>>   
>>   struct NubusDevice {
>>


ATB,

Mark.

