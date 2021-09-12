Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1A0407EEC
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:23:00 +0200 (CEST)
Received: from localhost ([::1]:53092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTBy-0003za-UW
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPTA8-00039C-91
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:21:04 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35470
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPTA6-0008HE-06
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:21:04 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPT9y-0006st-JJ; Sun, 12 Sep 2021 18:20:58 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, laurent@vivier.eu
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
 <20210912074914.22048-3-mark.cave-ayland@ilande.co.uk>
 <68bd423d-caf6-53eb-f68b-68c14a1e82a9@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <7fef53a0-b003-ed11-470d-441b3edfeb22@ilande.co.uk>
Date: Sun, 12 Sep 2021 18:20:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <68bd423d-caf6-53eb-f68b-68c14a1e82a9@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 02/20] nubus-device: expose separate super slot memory
 region
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.584,
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

On 12/09/2021 16:50, Philippe Mathieu-Daudé wrote:

> On 9/12/21 9:48 AM, Mark Cave-Ayland wrote:
>> According to "Designing Cards and Drivers for the Macintosh Family" each physical
>> nubus slot can access 2 separate address ranges: a super slot memory region which
>> is 256MB and a standard slot memory region which is 16MB.
>>
>> Currently a Nubus device uses the physical slot number to determine whether it is
>> using a standard slot memory region or a super slot memory region rather than
>> exposing both memory regions for use as required.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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
>> +    name = g_strdup_printf("nubus-super-slot-%x", nd->slot);
>> +    memory_region_init(&nd->super_slot_mem, OBJECT(dev), name,
>> +                        NUBUS_SUPER_SLOT_SIZE);
>> +    memory_region_add_subregion(&nubus->super_slot_io, slot_offset,
>> +                                &nd->super_slot_mem);
>> +    g_free(name);
>> +
>> +    /* Normal */
>> +    slot_offset = nd->slot * NUBUS_SLOT_SIZE;
>> +
>> +    name = g_strdup_printf("nubus-slot-%x", nd->slot);
> 
> I'd rather use "nubus-standard-slot-%x" or "nubus-normal-slot-%x"
> to differentiate from super-bus. (This also applies to variable
> names and trace events in this series).

I can see how this may seem ambiguous, however in "Designing Cards and Drivers for 
the Macintosh Family" the documentation always refers to "slot" as a standard slot so 
there shouldn't be any confusion for developers here.

> Anyway,
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


ATB,

Mark.

