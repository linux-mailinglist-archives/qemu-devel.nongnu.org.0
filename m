Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D163240B941
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 22:27:23 +0200 (CEST)
Received: from localhost ([::1]:44078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQF1W-0006A1-Vd
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 16:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQF0X-0005UP-GK
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 16:26:21 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38436
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQF0W-0005JL-1Z
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 16:26:21 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQF0N-0000uS-Iz; Tue, 14 Sep 2021 21:26:15 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, laurent@vivier.eu
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
 <20210912074914.22048-17-mark.cave-ayland@ilande.co.uk>
 <33438013-86d1-41d9-45f6-a1cc73e75cfa@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <2d82009e-aa37-f9d6-11b7-b66c516788dd@ilande.co.uk>
Date: Tue, 14 Sep 2021 21:26:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <33438013-86d1-41d9-45f6-a1cc73e75cfa@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 16/20] nubus-bridge: embed the NubusBus object directly
 within nubus-bridge
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

On 12/09/2021 18:43, Philippe Mathieu-Daudé wrote:

> On 9/12/21 9:49 AM, Mark Cave-Ayland wrote:
>> Since nubus-bridge is a container for NubusBus then it should be embedded
>> directly within the bridge device using qbus_create_inplace().
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/m68k/q800.c              | 2 +-
>>   hw/nubus/mac-nubus-bridge.c | 7 ++++---
>>   hw/nubus/nubus-bridge.c     | 3 ++-
>>   include/hw/nubus/nubus.h    | 2 +-
>>   4 files changed, 8 insertions(+), 6 deletions(-)
> 
>> diff --git a/hw/nubus/mac-nubus-bridge.c b/hw/nubus/mac-nubus-bridge.c
>> index c16cfc4ab3..c23d5d508d 100644
>> --- a/hw/nubus/mac-nubus-bridge.c
>> +++ b/hw/nubus/mac-nubus-bridge.c
>> @@ -18,18 +18,19 @@ static void mac_nubus_bridge_init(Object *obj)
>>       MacNubusBridge *s = MAC_NUBUS_BRIDGE(obj);
>>       NubusBridge *nb = NUBUS_BRIDGE(obj);
>>       SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>> +    NubusBus *bus = &nb->bus;
>>   
>>       /* Macintosh only has slots 0x9 to 0xe available */
>> -    nb->bus->slot_available_mask = 0x7e00;
>> +    bus->slot_available_mask = 0x7e00;
> 
> Re-reading I'd use MAKE_64BIT_MASK(9, 6)
> or eventually MAKE_64BIT_MASK(9, 0xe - 0x6 + 1).

Thanks, I'll go for MAKE_64BIT_MASK(9, 6) here in v2.


ATB,

Mark.

