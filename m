Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F7C40B946
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 22:28:44 +0200 (CEST)
Received: from localhost ([::1]:46226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQF2p-0007ce-Lx
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 16:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQF1Q-0006c4-My
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 16:27:16 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38446
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQF1O-0005rR-S9
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 16:27:16 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQF1H-0000us-4g; Tue, 14 Sep 2021 21:27:11 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, laurent@vivier.eu
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
 <20210912074914.22048-5-mark.cave-ayland@ilande.co.uk>
 <10394c05-6cb4-3851-e9fc-967c400061ba@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <144f3560-d15e-4830-fd16-4415c2dddba4@ilande.co.uk>
Date: Tue, 14 Sep 2021 21:27:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <10394c05-6cb4-3851-e9fc-967c400061ba@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 04/20] nubus: use bitmap to manage available slots
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.969,
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

On 12/09/2021 18:48, Philippe Mathieu-Daudé wrote:

> On 9/12/21 9:48 AM, Mark Cave-Ayland wrote:
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
>>
>> diff --git a/hw/nubus/mac-nubus-bridge.c b/hw/nubus/mac-nubus-bridge.c
>> index 7c329300b8..6e78f4c0b3 100644
>> --- a/hw/nubus/mac-nubus-bridge.c
>> +++ b/hw/nubus/mac-nubus-bridge.c
>> @@ -18,6 +18,9 @@ static void mac_nubus_bridge_init(Object *obj)
>>   
>>       s->bus = NUBUS_BUS(qbus_create(TYPE_NUBUS_BUS, DEVICE(s), NULL));
>>   
>> +    /* Macintosh only has slots 0x9 to 0xe available */
>> +    s->bus->slot_available_mask = 0x7e00;
> 
> So MAKE_64BIT_MASK(9, 6),
> 
>>       sysbus_init_mmio(sbd, &s->bus->super_slot_io);
>>       sysbus_init_mmio(sbd, &s->bus->slot_io);
>>   }
>> diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
>> index 5c13452308..f6d3655f51 100644
>> --- a/hw/nubus/nubus-bus.c
>> +++ b/hw/nubus/nubus-bus.c
>> @@ -84,7 +84,7 @@ static void nubus_init(Object *obj)
>>                             nubus, "nubus-slots",
>>                             NUBUS_SLOT_NB * NUBUS_SLOT_SIZE);
>>   
>> -    nubus->current_slot = NUBUS_FIRST_SLOT;
>> +    nubus->slot_available_mask = 0xffff;
> 
> and MAKE_64BIT_MASK(0, 16)?
> 
>>   }

I'll convert these over to use MAKE_64BIT_MASK too :)


ATB,

Mark.

