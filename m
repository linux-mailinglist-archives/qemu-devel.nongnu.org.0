Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B82407EB5
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 18:45:57 +0200 (CEST)
Received: from localhost ([::1]:32998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPSc7-0005Rp-0N
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 12:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPSaT-0004kq-K5
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:44:13 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35416
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPSaR-0000aD-3y
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:44:13 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPSaI-0006eV-As; Sun, 12 Sep 2021 17:44:06 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, laurent@vivier.eu
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
 <20210912074914.22048-4-mark.cave-ayland@ilande.co.uk>
 <2ade04c9-59f8-04cc-d80f-f9eab22bc4ff@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <0c09ab2d-ad2e-bba0-11c8-1463248d2b33@ilande.co.uk>
Date: Sun, 12 Sep 2021 17:43:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <2ade04c9-59f8-04cc-d80f-f9eab22bc4ff@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 03/20] nubus-device: add device slot parameter
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

On 12/09/2021 16:15, Philippe Mathieu-Daudé wrote:

> On 9/12/21 9:48 AM, Mark Cave-Ayland wrote:
>> This prepares for allowing Nubus devices to be placed in a specific slot instead
>> of always being auto-allocated by the bus itself.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/nubus/nubus-device.c  | 6 ++++++
>>   include/hw/nubus/nubus.h | 2 +-
>>   2 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
>> index 36203848e5..c1832f73da 100644
>> --- a/hw/nubus/nubus-device.c
>> +++ b/hw/nubus/nubus-device.c
>> @@ -191,12 +191,18 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
>>       nubus_register_format_block(nd);
>>   }
>>   
>> +static Property nubus_device_properties[] = {
>> +    DEFINE_PROP_INT32("slot", NubusDevice, slot, -1),
>> +    DEFINE_PROP_END_OF_LIST()
>> +};
>> +
>>   static void nubus_device_class_init(ObjectClass *oc, void *data)
>>   {
>>       DeviceClass *dc = DEVICE_CLASS(oc);
>>   
>>       dc->realize = nubus_device_realize;
>>       dc->bus_type = TYPE_NUBUS_BUS;
>> +    device_class_set_props(dc, nubus_device_properties);
> 
> Can we reorder this after #4 where you sanity check 'slot'
> in nubus_device_realize()? First sanity check, then expose
> the property.

The slot number is already being checked at this point to ensure that it lies between 
NUBUS_FIRST_SLOT and NUBUS_LAST_SLOT (see the change to NUBUS_FIRST_SLOT in patch 4). 
Note that patch 4 also converts the range 0x9-0xf to the equivalent bitmask to ensure 
there should be no change in the available slots.


ATB,

Mark.

