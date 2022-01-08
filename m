Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B64A4884E7
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 18:17:55 +0100 (CET)
Received: from localhost ([::1]:39030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6FLl-0004Ci-GB
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 12:17:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n6FJv-0002nw-14
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 12:15:59 -0500
Received: from [2001:41c9:1:41f::167] (port=40330
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n6FJt-0003rM-DH
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 12:15:58 -0500
Received: from [2a00:23c4:8ba0:4900:614:7796:ec2b:4f88]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n6FJT-0009qB-G9; Sat, 08 Jan 2022 17:15:35 +0000
Message-ID: <48dfc1f0-4a83-2bbb-4c5e-f973b9b7e0b3@ilande.co.uk>
Date: Sat, 8 Jan 2022 17:15:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220108164147.30813-1-mark.cave-ayland@ilande.co.uk>
 <af5ad708-bdef-af6c-bb38-500f0c62e92a@vivier.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <af5ad708-bdef-af6c-bb38-500f0c62e92a@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:4900:614:7796:ec2b:4f88
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] macfb: fix VRAM dirty memory region logging
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.199,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 08/01/2022 16:53, Laurent Vivier wrote:

> Le 08/01/2022 à 17:41, Mark Cave-Ayland a écrit :
>> The macfb VRAM memory region was configured with coalescing rather than dirty
>> memory logging enabled, causing some areas of the screen not to redraw after
>> a full screen update.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Fixes: 8ac919a065 ("hw/m68k: add Nubus macfb video card")
>> ---
>>   hw/display/macfb.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
>> index 277d3e6633..4bd7c3ad6a 100644
>> --- a/hw/display/macfb.c
>> +++ b/hw/display/macfb.c
>> @@ -661,9 +661,9 @@ static bool macfb_common_realize(DeviceState *dev, MacfbState 
>> *s, Error **errp)
>>       memory_region_init_ram(&s->mem_vram, OBJECT(dev), "macfb-vram",
>>                              MACFB_VRAM_SIZE, &error_abort);
>> +    memory_region_set_log(&s->mem_vram, true, DIRTY_MEMORY_VGA);
>>       s->vram = memory_region_get_ram_ptr(&s->mem_vram);
>>       s->vram_bit_mask = MACFB_VRAM_SIZE - 1;
>> -    memory_region_set_coalescing(&s->mem_vram);
>>       s->vbl_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, macfb_vbl_timer, s);
>>       macfb_update_mode(s);
> 
> I understant why you add memory_region_set_log() but I don't understand why you 
> remove memory_region_set_coalescing().

Looking at the other display devices, only VGA and cirrus use 
memory_region_set_coalescing() and that's on the IO ports rather than the VRAM.

Based upon this my suspicion is that this is mainly a vmexit optimisation when using 
KVM which isn't relevant here for macfb.


ATB,

Mark.

