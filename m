Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7DD40C47B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 13:43:35 +0200 (CEST)
Received: from localhost ([::1]:33562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQTKA-0007oZ-TQ
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 07:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQTGl-0006ft-0a
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 07:40:03 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:39226
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQTGh-0002W6-3d
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 07:40:02 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQTGY-0005o8-A7; Wed, 15 Sep 2021 12:39:54 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, laurent@vivier.eu
References: <20210915101026.25174-1-mark.cave-ayland@ilande.co.uk>
 <20210915101026.25174-5-mark.cave-ayland@ilande.co.uk>
 <ad44daa7-01c4-bb23-bf7e-1efb337169bc@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <257fe6e8-0488-ad16-2419-c567ab4d84d7@ilande.co.uk>
Date: Wed, 15 Sep 2021 12:39:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ad44daa7-01c4-bb23-bf7e-1efb337169bc@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 04/20] nubus: use bitmap to manage available slots
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) NICE_REPLY_A=-1.698, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 15/09/2021 11:39, Philippe Mathieu-Daudé wrote:

> On 9/15/21 12:10 PM, Mark Cave-Ayland wrote:
>> Convert nubus_device_realize() to use a bitmap to manage available slots to allow
>> for future Nubus devices to be plugged into arbitrary slots from the command line.
>>
>> Update mac_nubus_bridge_init() to only allow slots 0x9 to 0xe on a Macintosh
>> machines as documented in "Desigining Cards and Drivers for the Macintosh Family".
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/nubus/mac-nubus-bridge.c |  3 +++
>>   hw/nubus/nubus-bus.c        |  2 +-
>>   hw/nubus/nubus-device.c     | 33 +++++++++++++++++++++++++++------
>>   include/hw/nubus/nubus.h    |  4 ++--
>>   4 files changed, 33 insertions(+), 9 deletions(-)
> 
>>   static void nubus_class_init(ObjectClass *oc, void *data)
>> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
>> index c1832f73da..f9f614cc01 100644
>> --- a/hw/nubus/nubus-device.c
>> +++ b/hw/nubus/nubus-device.c
>> @@ -160,14 +160,35 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
>>       NubusDevice *nd = NUBUS_DEVICE(dev);
>>       char *name;
>>       hwaddr slot_offset;
>> -
>> -    if (nubus->current_slot < NUBUS_FIRST_SLOT ||
>> -            nubus->current_slot > NUBUS_LAST_SLOT) {
>> -        error_setg(errp, "Cannot register nubus card, not enough slots");
>> -        return;
>> +    uint16_t s;
>> +
>> +    if (nd->slot == -1) {
>> +        /* No slot specified, find first available free slot */
>> +        s = ctz32(nubus->slot_available_mask);
>> +        if (s != 32) {
>> +            nd->slot = s;
> 
> Can't we have s >= NUBUS_LAST_SLOT here?
> 
>> +        } else {
>> +            error_setg(errp, "Cannot register nubus card, no free slot "
>> +                             "available");
>> +            return;
>> +        }
>> +    } else {
> 
> If so, maybe better to move this code <...
> 
>> +        /* Slot specified, make sure the slot is available */
>> +        if (nd->slot < NUBUS_FIRST_SLOT || nd->slot > NUBUS_LAST_SLOT) {
>> +            error_setg(errp, "Cannot register nubus card, slot must be "
>> +                             "between %d and %d", NUBUS_FIRST_SLOT,
>> +                             NUBUS_LAST_SLOT);
>> +            return;
>> +        }
> 
> ...> ...
> 
>> +
>> +        if (!(nubus->slot_available_mask & (1UL << nd->slot))) {
>> +            error_setg(errp, "Cannot register nubus card, slot %d is "
>> +                             "unavailable or already occupied", nd->slot);
>> +            return;
>> +        }
>>       }
> 
> ... here?

Functionally it shouldn't make a difference since the default mask is 0xffff, but it 
might just help the unwary programmer low on caffeine ;)

I'll test it later and make sure everything still works as intended.

>> -    nd->slot = nubus->current_slot++;
>> +    nubus->slot_available_mask &= ~(1UL << nd->slot);
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


ATB,

Mark.

