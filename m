Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640734CC43D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 18:47:01 +0100 (CET)
Received: from localhost ([::1]:57714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPpXY-0001df-GT
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 12:47:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPpVI-0008Ir-De
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:44:40 -0500
Received: from [2001:41c9:1:41f::167] (port=56302
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPpVG-0003Le-Ni
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:44:40 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPpUT-0006qA-Ro; Thu, 03 Mar 2022 17:43:53 +0000
Message-ID: <d2d6510d-3f3a-81a0-e28e-d5a4a4b3ccc1@ilande.co.uk>
Date: Thu, 3 Mar 2022 17:44:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
 <20220302212752.6922-4-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA8-_khhe0999QB=wsUi=HEcPa6G3C7p_P63UibkF6FNUA@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAFEAcA8-_khhe0999QB=wsUi=HEcPa6G3C7p_P63UibkF6FNUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 03/10] macfb: increase number of registers saved in
 MacfbState
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, pbonzini@redhat.com, Laurent@vivier.eu,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/03/2022 15:25, Peter Maydell wrote:

> On Wed, 2 Mar 2022 at 21:31, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> The MacOS toolbox ROM accesses a number of addresses between 0x0 and 0x200 during
>> initialisation and resolution changes. Whilst the function of many of these
>> registers is unknown, it is worth the minimal cost of saving these extra values as
>> part of migration to help future-proof the migration stream for the q800 machine
>> as it starts to stabilise.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/display/macfb.c         | 8 ++++++++
>>   include/hw/display/macfb.h | 3 ++-
>>   2 files changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
>> index fb54b460c1..dfdae90144 100644
>> --- a/hw/display/macfb.c
>> +++ b/hw/display/macfb.c
>> @@ -537,6 +537,10 @@ static uint64_t macfb_ctrl_read(void *opaque,
>>       case DAFB_MODE_SENSE:
>>           val = macfb_sense_read(s);
>>           break;
>> +    default:
>> +        if (addr < MACFB_CTRL_TOPADDR) {
>> +            val = s->regs[addr >> 2];
>> +        }
>>       }
>>
>>       trace_macfb_ctrl_read(addr, val, size);
>> @@ -592,6 +596,10 @@ static void macfb_ctrl_write(void *opaque,
>>               macfb_invalidate_display(s);
>>           }
>>           break;
>> +    default:
>> +        if (addr < MACFB_CTRL_TOPADDR) {
>> +            s->regs[addr >> 2] = val;
>> +        }
>>       }
>>
>>       trace_macfb_ctrl_write(addr, val, size);
>> diff --git a/include/hw/display/macfb.h b/include/hw/display/macfb.h
>> index 6d9f0f7869..55a50d3fb0 100644
>> --- a/include/hw/display/macfb.h
>> +++ b/include/hw/display/macfb.h
>> @@ -48,7 +48,8 @@ typedef struct MacFbMode {
>>       uint32_t offset;
>>   } MacFbMode;
>>
>> -#define MACFB_NUM_REGS      8
>> +#define MACFB_CTRL_TOPADDR  0x200
>> +#define MACFB_NUM_REGS      (MACFB_CTRL_TOPADDR / sizeof(uint32_t))
> 
> You should either bump the vmstate_macfb version numbers here,
> or at least note in the commit message that although it's a
> migration break we know nobody's migrating this device because
> of the bug we just fixed in the previous commit.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I can do this if you like, although until the last 2 patches anything that is using 
the disk will fail, and that's just about everything because DMA requests require 
guest support to move the data from the ESP to the CPU.

In terms of the q800 machine there is an implicit assumption that there will be more 
migration breaks to come, mainly because there are new devices to be added to the 
q800 machine in my outstanding MacOS patches that will break migration again once. So 
until these are finally merged I don't think it's worth trying to stabilise the 
migration stream.


ATB,

Mark.

