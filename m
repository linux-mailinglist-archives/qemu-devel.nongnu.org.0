Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A757E3B42C6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 13:59:26 +0200 (CEST)
Received: from localhost ([::1]:56160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwkUX-0003e6-GM
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 07:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwkSe-0001fx-6H
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 07:57:28 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59450
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwkSc-00070x-5U
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 07:57:27 -0400
Received: from host109-153-84-9.range109-153.btcentralplus.com ([109.153.84.9]
 helo=[192.168.1.65]) by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwkSE-0008MH-2v; Fri, 25 Jun 2021 12:57:06 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com, hpoussin@reactos.org,
 fthain@telegraphics.com.au
References: <20210625073844.1229-1-mark.cave-ayland@ilande.co.uk>
 <20210625073844.1229-3-mark.cave-ayland@ilande.co.uk>
 <12f2d9ec-938f-1c7f-6e4f-2b1956bab7d2@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <c07fd6b8-babd-6fec-8d6d-b84a1d6b9ebe@ilande.co.uk>
Date: Fri, 25 Jun 2021 12:57:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <12f2d9ec-938f-1c7f-6e4f-2b1956bab7d2@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 2/2] g364fb: add VMStateDescription for G364SysBusState
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

On 25/06/2021 09:44, Philippe Mathieu-Daudé wrote:

> On 6/25/21 9:38 AM, Mark Cave-Ayland wrote:
>> Currently when QEMU attempts to migrate the MIPS magnum machine it crashes due
>> to a mistake in the g364fb VMStateDescription configuration which expects a
>> G364SysBusState and not a G364State.
>>
>> Resolve the issue by adding a new VMStateDescription for G364SysBusState and
>> embedding the existing vmstate_g364fb VMStateDescription inside it using
>> VMSTATE_STRUCT.
> 
> Broken since 97a3f6ffbba ("g364fb: convert to qdev")?

(goes and looks)

Wow that does appear to be correct - I gave up looking when I got to 8 years ago ;)
But yes, the bug is introduced by that commit: before you can see that 
register_savevm() was called with a G364State opaque whereas after the switch to QOM 
object the object reference for the VMStateDescription becomes G364SysBusState instead.

I'll add a "Fixes:" tag and send again.

>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/display/g364fb.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/display/g364fb.c b/hw/display/g364fb.c
>> index 163d7f5391..990ef3afdd 100644
>> --- a/hw/display/g364fb.c
>> +++ b/hw/display/g364fb.c
>> @@ -518,6 +518,16 @@ static Property g364fb_sysbus_properties[] = {
>>       DEFINE_PROP_END_OF_LIST(),
>>   };
>>   
>> +static const VMStateDescription vmstate_g364fb_sysbus = {
>> +    .name = "g364fb-sysbus",
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_STRUCT(g364, G364SysBusState, 1, vmstate_g364fb, G364State),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>>   static void g364fb_sysbus_class_init(ObjectClass *klass, void *data)
>>   {
>>       DeviceClass *dc = DEVICE_CLASS(klass);
>> @@ -526,7 +536,7 @@ static void g364fb_sysbus_class_init(ObjectClass *klass, void *data)
>>       set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
>>       dc->desc = "G364 framebuffer";
>>       dc->reset = g364fb_sysbus_reset;
>> -    dc->vmsd = &vmstate_g364fb;
>> +    dc->vmsd = &vmstate_g364fb_sysbus;
>>       device_class_set_props(dc, g364fb_sysbus_properties);
>>   }
>>   
>>


ATB,

Mark.

