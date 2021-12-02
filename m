Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D63E4669C8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 19:22:34 +0100 (CET)
Received: from localhost ([::1]:34668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msqj2-0005iI-Vy
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 13:22:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1msqiA-00053L-SY
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 13:21:38 -0500
Received: from [2001:41c9:1:41f::167] (port=60032
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1msqi9-0002yX-1I
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 13:21:38 -0500
Received: from [2a00:23c4:8b9f:4900:2b16:6388:bafb:d365]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1msqhr-0003Fu-KF; Thu, 02 Dec 2021 18:21:23 +0000
To: Cornelia Huck <cohuck@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20211202164929.1119036-1-alex.bennee@linaro.org>
 <87r1avgc9o.fsf@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <d756e6f4-cabc-5384-fb73-08e498d49bfd@ilande.co.uk>
Date: Thu, 2 Dec 2021 18:21:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87r1avgc9o.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9f:4900:2b16:6388:bafb:d365
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH for 6.2?] Revert "vga: don't abort when adding a duplicate
 isa-vga device"
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.3,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/12/2021 17:14, Cornelia Huck wrote:

> On Thu, Dec 02 2021, Alex Bennée <alex.bennee@linaro.org> wrote:
> 
>> This reverts commit 7852a77f598635a67a222b6c1463c8b46098aed2.
>>
>> The check is bogus as it ends up finding itself and falling over.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Resolves: https://gitlab.com/qemu-project/qemu.git/-/issues/733
>> ---
>>   hw/display/vga-isa.c | 10 ----------
>>   1 file changed, 10 deletions(-)
>>
>> diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
>> index 8cea84f2be..90851e730b 100644
>> --- a/hw/display/vga-isa.c
>> +++ b/hw/display/vga-isa.c
>> @@ -33,7 +33,6 @@
>>   #include "hw/loader.h"
>>   #include "hw/qdev-properties.h"
>>   #include "qom/object.h"
>> -#include "qapi/error.h"
>>   
>>   #define TYPE_ISA_VGA "isa-vga"
>>   OBJECT_DECLARE_SIMPLE_TYPE(ISAVGAState, ISA_VGA)
>> @@ -62,15 +61,6 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
>>       MemoryRegion *vga_io_memory;
>>       const MemoryRegionPortio *vga_ports, *vbe_ports;
>>   
>> -    /*
>> -     * make sure this device is not being added twice, if so
>> -     * exit without crashing qemu
>> -     */
>> -    if (object_resolve_path_type("", TYPE_ISA_VGA, NULL)) {
> 
> Don't you simply need to invert the check? You should get NULL back if
> there is another device already...

Yes that's correct - the existing check is simply missing a ! at the front. For an 
existing example take a look at the the fw_cfg device:

https://gitlab.com/qemu-project/qemu/-/blob/master/hw/nvram/fw_cfg.c#L1228
https://gitlab.com/qemu-project/qemu/-/blob/master/hw/nvram/fw_cfg.c#L1125

Unfortunately it seems that I also missed this when I added my R-B tag :(


ATB,

Mark.

