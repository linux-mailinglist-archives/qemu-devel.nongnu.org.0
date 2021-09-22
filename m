Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDA341462F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 12:27:56 +0200 (CEST)
Received: from localhost ([::1]:47688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSzTn-0004NW-Rv
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 06:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mSzQw-0003Vi-NY
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 06:24:58 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47070
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mSzQu-0006ol-U6
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 06:24:58 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mSzQh-0009Yu-CF; Wed, 22 Sep 2021 11:24:47 +0100
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210917075057.20924-1-mark.cave-ayland@ilande.co.uk>
 <20210917075057.20924-3-mark.cave-ayland@ilande.co.uk>
 <cd78cdb4-1726-8544-4d94-42c11583c9c2@vivier.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <00d185c2-0109-0d9d-db23-228befa216d9@ilande.co.uk>
Date: Wed, 22 Sep 2021 11:24:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <cd78cdb4-1726-8544-4d94-42c11583c9c2@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v4 02/20] nubus-device: expose separate super slot memory
 region
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

On 20/09/2021 20:54, Laurent Vivier wrote:

> Le 17/09/2021 à 09:50, Mark Cave-Ayland a écrit :
>> According to "Designing Cards and Drivers for the Macintosh Family" each physical
>> nubus slot can access 2 separate address ranges: a super slot memory region which
>> is 256MB and a standard slot memory region which is 16MB.
>>
>> Currently a Nubus device uses the physical slot number to determine whether it is
>> using a standard slot memory region or a super slot memory region rather than
>> exposing both memory regions for use as required.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/nubus/nubus-device.c  | 36 ++++++++++++++++++------------------
>>   include/hw/nubus/nubus.h |  1 +
>>   2 files changed, 19 insertions(+), 18 deletions(-)
>>
>> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
>> index be01269563..36203848e5 100644
>> --- a/hw/nubus/nubus-device.c
>> +++ b/hw/nubus/nubus-device.c
>> @@ -168,26 +168,26 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
>>       }
>>   
>>       nd->slot = nubus->current_slot++;
>> -    name = g_strdup_printf("nubus-slot-%d", nd->slot);
>> -
>> -    if (nd->slot < NUBUS_FIRST_SLOT) {
>> -        /* Super */
>> -        slot_offset = (nd->slot - 6) * NUBUS_SUPER_SLOT_SIZE;
>> -
>> -        memory_region_init(&nd->slot_mem, OBJECT(dev), name,
>> -                           NUBUS_SUPER_SLOT_SIZE);
>> -        memory_region_add_subregion(&nubus->super_slot_io, slot_offset,
>> -                                    &nd->slot_mem);
>> -    } else {
>> -        /* Normal */
>> -        slot_offset = nd->slot * NUBUS_SLOT_SIZE;
>> -
>> -        memory_region_init(&nd->slot_mem, OBJECT(dev), name, NUBUS_SLOT_SIZE);
>> -        memory_region_add_subregion(&nubus->slot_io, slot_offset,
>> -                                    &nd->slot_mem);
>> -    }
>>   
>> +    /* Super */
>> +    slot_offset = (nd->slot - 6) * NUBUS_SUPER_SLOT_SIZE;
>> +
> 
> Is it possible to remove this patch?
> 
> The "(nd->slot - 6)" looks weird and it is removed in patch 20.

This is another place where I decided to keep the existing logic as-is and then make 
the change to remove the -6 offset later on in patch 12 ("nubus: move nubus to its 
own 32-bit address space").

Certainly the existing offset is wrong, but given that there are currently no devices 
that use the super slot then I will bring the change to remove the offset forward to 
this patch in v5.

> If not:
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> 
> Thanks,
> Laurent


ATB,

Mark.

