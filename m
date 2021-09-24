Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3784416C7D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 09:05:09 +0200 (CEST)
Received: from localhost ([::1]:46834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTfGe-00062K-Qs
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 03:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTfDE-0003Lp-AU
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 03:01:36 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50058
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTfDB-0004nf-NY
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 03:01:35 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTfD0-0002dq-3f; Fri, 24 Sep 2021 08:01:26 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, laurent@vivier.eu
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
 <20210923091308.13832-6-mark.cave-ayland@ilande.co.uk>
 <b233b272-f0e3-67c8-01ee-0e383ebff849@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <6c6b160f-9645-0f4e-6b92-689c5599bb05@ilande.co.uk>
Date: Fri, 24 Sep 2021 08:01:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <b233b272-f0e3-67c8-01ee-0e383ebff849@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v5 05/20] nubus: move slot bitmap checks from NubusDevice
 realize() to BusClass check_address()
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

On 23/09/2021 10:45, Philippe Mathieu-Daudé wrote:

> On 9/23/21 11:12, Mark Cave-Ayland wrote:
>> Allow Nubus to manage the slot allocations itself using the BusClass check_address()
>> virtual function rather than managing this during NubusDevice realize().
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>> ---
>>   hw/nubus/nubus-bus.c    | 30 ++++++++++++++++++++++++++++++
>>   hw/nubus/nubus-device.c | 22 ----------------------
>>   2 files changed, 30 insertions(+), 22 deletions(-)
>>
>> diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
>> index 3cd7534864..d4daaa36f2 100644
>> --- a/hw/nubus/nubus-bus.c
>> +++ b/hw/nubus/nubus-bus.c
>> @@ -96,11 +96,41 @@ static void nubus_init(Object *obj)
>>                                                    NUBUS_SLOT_NB);
>>   }
>> +static bool nubus_check_address(BusState *bus, DeviceState *dev, Error **errp)
>> +{
>> +    NubusDevice *nd = NUBUS_DEVICE(dev);
>> +    NubusBus *nubus = NUBUS_BUS(bus);
>> +    uint16_t s;
>> +
>> +    if (nd->slot == -1) {
>> +        /* No slot specified, find first available free slot */
>> +        s = ctz32(nubus->slot_available_mask);
> 
> Same comment than previous patch:
> 
>             int s = ctz32(nubus->slot_available_mask);

... and same here.

> Otherwise:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
>> +        if (s != 32) {
>> +            nd->slot = s;
>> +        } else {
>> +            error_setg(errp, "Cannot register nubus card, no free slot "
>> +                             "available");
>> +            return false;
>> +        }
>> +    } else {
>> +        /* Slot specified, make sure the slot is available */
>> +        if (!(nubus->slot_available_mask & BIT(nd->slot))) {
>> +            error_setg(errp, "Cannot register nubus card, slot %d is "
>> +                             "unavailable or already occupied", nd->slot);
>> +            return false;
>> +        }
>> +    }
>> +
>> +    nubus->slot_available_mask &= ~BIT(nd->slot);
>> +    return true;
>> +}


ATB,

Mark.

