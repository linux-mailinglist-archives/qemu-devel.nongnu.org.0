Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AECF416C76
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 09:03:46 +0200 (CEST)
Received: from localhost ([::1]:44236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTfFJ-0004B7-DW
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 03:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTfCU-000340-EE
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 03:00:50 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50050
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTfCR-0004C2-NK
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 03:00:50 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTfCF-0002dM-HJ; Fri, 24 Sep 2021 08:00:39 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, laurent@vivier.eu
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
 <20210923091308.13832-5-mark.cave-ayland@ilande.co.uk>
 <a446e9a3-b5a9-f9af-0408-e794aac05352@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <ceb404ca-0384-4c7e-f400-79ad1ac6f7b2@ilande.co.uk>
Date: Fri, 24 Sep 2021 08:00:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <a446e9a3-b5a9-f9af-0408-e794aac05352@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v5 04/20] nubus: use bitmap to manage available slots
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

On 23/09/2021 10:42, Philippe Mathieu-Daudé wrote:
> On 9/23/21 11:12, Mark Cave-Ayland wrote:
>> Convert nubus_device_realize() to use a bitmap to manage available slots to allow
>> for future Nubus devices to be plugged into arbitrary slots from the command line
>> using a new qdev "slot" parameter for nubus devices.
>>
>> Update mac_nubus_bridge_init() to only allow slots 0x9 to 0xe on a Macintosh
>> machines as documented in "Desigining Cards and Drivers for the Macintosh Family".
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/nubus/mac-nubus-bridge.c         |  4 ++++
>>   hw/nubus/nubus-bus.c                |  5 +++--
>>   hw/nubus/nubus-device.c             | 32 +++++++++++++++++++++++------
>>   include/hw/nubus/mac-nubus-bridge.h |  4 ++++
>>   include/hw/nubus/nubus.h            | 13 ++++++------
>>   5 files changed, 43 insertions(+), 15 deletions(-)
> 
>> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
>> index 4e23df1280..562650a05b 100644
>> --- a/hw/nubus/nubus-device.c
>> +++ b/hw/nubus/nubus-device.c
>> @@ -160,14 +160,28 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
>>       NubusDevice *nd = NUBUS_DEVICE(dev);
>>       char *name;
>>       hwaddr slot_offset;
>> -
>> -    if (nubus->current_slot < NUBUS_FIRST_SLOT ||
>> -            nubus->current_slot > NUBUS_LAST_SLOT) {
>> -        error_setg(errp, "Cannot register nubus card, not enough slots");
>> -        return;
>> +    uint16_t s;
>> +
>> +    if (nd->slot == -1) {
>> +        /* No slot specified, find first available free slot */
>> +        s = ctz32(nubus->slot_available_mask);
> 
> Nitpicking:
> 
>             int s = ctz32(nubus->slot_available_mask);
> 
> Otherwise,
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

I'll make sure this is included in v6.

>> +        if (s != 32) {
>> +            nd->slot = s;
>> +        } else {
>> +            error_setg(errp, "Cannot register nubus card, no free slot "
>> +                             "available");
>> +            return;
>> +        }
>> +    } else {
>> +        /* Slot specified, make sure the slot is available */
>> +        if (!(nubus->slot_available_mask & BIT(nd->slot))) {
>> +            error_setg(errp, "Cannot register nubus card, slot %d is "
>> +                             "unavailable or already occupied", nd->slot);
>> +            return;
>> +        }
>>       }


ATB,

Mark.

