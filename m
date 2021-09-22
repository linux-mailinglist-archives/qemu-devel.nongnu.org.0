Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF50414831
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 13:53:02 +0200 (CEST)
Received: from localhost ([::1]:42506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT0o9-0001yW-Ax
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 07:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mT0mN-0000RK-1C
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 07:51:12 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47166
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mT0mI-0006x5-75
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 07:51:10 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mT0m7-0009wL-4i; Wed, 22 Sep 2021 12:50:59 +0100
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210917075057.20924-1-mark.cave-ayland@ilande.co.uk>
 <20210917075057.20924-18-mark.cave-ayland@ilande.co.uk>
 <2fa5aa17-00dc-99ae-de29-d61515eafd2d@vivier.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <7507e20f-a1fa-578c-6b43-8af0810f7c29@ilande.co.uk>
Date: Wed, 22 Sep 2021 12:50:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <2fa5aa17-00dc-99ae-de29-d61515eafd2d@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v4 17/20] nubus-bridge: make slot_available_mask a qdev
 property
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

On 20/09/2021 21:12, Laurent Vivier wrote:
> Le 17/09/2021 à 09:50, Mark Cave-Ayland a écrit :
>> This is to allow Macintosh machines to further specify which slots are available
>> since the number of addressable slots may not match the number of physical slots
>> present in the machine.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/nubus/nubus-bridge.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/hw/nubus/nubus-bridge.c b/hw/nubus/nubus-bridge.c
>> index 1adda7f5a6..2c7c4ee121 100644
>> --- a/hw/nubus/nubus-bridge.c
>> +++ b/hw/nubus/nubus-bridge.c
>> @@ -21,11 +21,18 @@ static void nubus_bridge_init(Object *obj)
>>       qbus_create_inplace(bus, sizeof(s->bus), TYPE_NUBUS_BUS, DEVICE(s), NULL);
>>   }
>>   
>> +static Property nubus_bridge_properties[] = {
>> +    DEFINE_PROP_UINT32("slot-available-mask", NubusBridge,
>> +                       bus.slot_available_mask, 0xffff),
> 
> So you can remove the "nubus->slot_available_mask = MAKE_64BIT_MASK(0, 16);" in nubus_init()?

Ah yes, I can do that in v5.

>> +    DEFINE_PROP_END_OF_LIST()
>> +};
>> +
>>   static void nubus_bridge_class_init(ObjectClass *klass, void *data)
>>   {
>>       DeviceClass *dc = DEVICE_CLASS(klass);
>>   
>>       dc->fw_name = "nubus";
>> +    device_class_set_props(dc, nubus_bridge_properties);
>>   }
>>   
>>   static const TypeInfo nubus_bridge_info = {
>>
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>


ATB,

Mark.

