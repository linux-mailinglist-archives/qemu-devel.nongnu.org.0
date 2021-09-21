Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD3D413830
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 19:16:23 +0200 (CEST)
Received: from localhost ([::1]:59058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSjNV-0003j3-Oe
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 13:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mSjLd-00033q-Nr
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 13:14:25 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46128
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mSjLc-0001jU-82
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 13:14:25 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mSjLP-0002Lt-U3; Tue, 21 Sep 2021 18:14:16 +0100
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210917075057.20924-1-mark.cave-ayland@ilande.co.uk>
 <20210917075057.20924-4-mark.cave-ayland@ilande.co.uk>
 <67be7ef6-ee01-bdb1-715f-48ff5a51133b@vivier.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <23b4a4f6-a048-7cbb-4024-ba9e72763368@ilande.co.uk>
Date: Tue, 21 Sep 2021 18:14:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <67be7ef6-ee01-bdb1-715f-48ff5a51133b@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v4 03/20] nubus-device: add device slot parameter
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

On 20/09/2021 18:31, Laurent Vivier wrote:

> Le 17/09/2021 à 09:50, Mark Cave-Ayland a écrit :
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
>>   }
>>   
>>   static const TypeInfo nubus_device_type_info = {
>> diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
>> index 89b0976aaa..357f621d15 100644
>> --- a/include/hw/nubus/nubus.h
>> +++ b/include/hw/nubus/nubus.h
>> @@ -42,7 +42,7 @@ struct NubusBus {
>>   struct NubusDevice {
>>       DeviceState qdev;
>>   
>> -    int slot;
>> +    int32_t slot;
>>       MemoryRegion super_slot_mem;
>>       MemoryRegion slot_mem;
>>   
>>
> 
> I think this patch should be merged with the following one because slot is simply ignored for the
> moment as it is overwritten in nubus_device_realize().
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Okay I can do that. My original thinking was to introduce the property first, then 
change the logic to make the follow-on patch easier to review but I don't mind either 
way.


ATB,

Mark.

