Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B5C4BCE16
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 12:07:06 +0100 (CET)
Received: from localhost ([::1]:60192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLk3U-0003hn-Sl
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 06:07:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nLjxx-0001dz-Lg
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 06:01:23 -0500
Received: from [2001:41c9:1:41f::167] (port=39728
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nLjxw-0004aP-0D
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 06:01:21 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nLjxI-0008DL-RI; Sun, 20 Feb 2022 11:00:44 +0000
Message-ID: <24ae247a-9713-2914-56f2-ae3aa9c45efb@ilande.co.uk>
Date: Sun, 20 Feb 2022 11:01:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-5-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA-GdkktHZpU0018d70xbB0JqKn1=-5xRbKF7aC3Hpiftw@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAFEAcA-GdkktHZpU0018d70xbB0JqKn1=-5xRbKF7aC3Hpiftw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 04/11] mos6522: switch over to use qdev gpios for IRQs
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
Cc: Laurent@vivier.eu, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/02/2022 19:29, Peter Maydell wrote:

> On Thu, 27 Jan 2022 at 21:01, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> For historical reasons each mos6522 instance implements its own setting and
>> update of the IFR flag bits using methods exposed by MOS6522DeviceClass. As
>> of today this is no longer required, and it is now possible to implement
>> the mos6522 IRQs as standard qdev gpios.
>>
>> Switch over to use qdev gpios for the mos6522 device and update all instances
>> accordingly.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/misc/mac_via.c         | 56 +++++++--------------------------------
>>   hw/misc/macio/cuda.c      |  5 ++--
>>   hw/misc/macio/pmu.c       |  4 +--
>>   hw/misc/mos6522.c         | 15 +++++++++++
>>   include/hw/misc/mac_via.h |  6 +----
>>   include/hw/misc/mos6522.h |  2 ++
>>   6 files changed, 32 insertions(+), 56 deletions(-)
> 
> 
>> -static void via2_nubus_irq_request(void *opaque, int irq, int level)
>> +static void via2_nubus_irq_request(void *opaque, int n, int level)
>>   {
>>       MOS6522Q800VIA2State *v2s = opaque;
>>       MOS6522State *s = MOS6522(v2s);
>> -    MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(s);
>> +    qemu_irq irq = qdev_get_gpio_in(DEVICE(s), VIA2_IRQ_NUBUS_BIT);
>>
>>       if (level) {
>>           /* Port A nubus IRQ inputs are active LOW */
>> -        s->a &= ~(1 << irq);
>> -        s->ifr |= 1 << VIA2_IRQ_NUBUS_BIT;
>> +        s->a &= ~(1 << n);
>>       } else {
>> -        s->a |= (1 << irq);
>> -        s->ifr &= ~(1 << VIA2_IRQ_NUBUS_BIT);
>> +        s->a |= (1 << n);
>>       }
>>
>> -    mdc->update_irq(s);
>> +    qemu_set_irq(irq, level);
>>   }
> 
> It feels a bit inconsistent here that we're still reaching into
> the MOS6522State to set s->a, but I guess this is still
> better than what we had before.

Yeah it's a little bit messy. On the Mac the Nubus IRQs are ORd to produce the VIA 
interrupt line, but the individual Nubus IRQ lines are wired to the VIA port A to 
allow the state of each line to be determined. The VIA port IO lines are 
bi-directional, so rather than try and implement this with GPIOs it's easiest to have 
a separate VIA2 Nubus GPIOs that also handle the port IO lines as above.

>> -#define VIA1_IRQ_NB             8
>> -
>>   #define VIA1_IRQ_ONE_SECOND     (1 << VIA1_IRQ_ONE_SECOND_BIT)
>>   #define VIA1_IRQ_60HZ           (1 << VIA1_IRQ_60HZ_BIT)
>>   #define VIA1_IRQ_ADB_READY      (1 << VIA1_IRQ_ADB_READY_BIT)
>> @@ -42,7 +40,7 @@ struct MOS6522Q800VIA1State {
>>
>>       MemoryRegion via_mem;
>>
>> -    qemu_irq irqs[VIA1_IRQ_NB];
>> +    qemu_irq irqs[VIA_NUM_INTS];
> 
> This irqs[] array appears to be entirely unused. You could
> delete it as a separate patch before this one.

Ah yes, before this patch each VIA had its own GPIOs which used the methods in 
MOS6522DeviceClass to manipulate the IFR bit. Since the Q800 VIAs have the MOS6522 
device as a parent class, the GPIOs are inherited from that and so this array should 
actually be removed as part of this patch.

>>       qemu_irq auxmode_irq;
>>       uint8_t last_b;
>>
>> @@ -85,8 +83,6 @@ struct MOS6522Q800VIA1State {
>>   #define VIA2_IRQ_SCSI_BIT       CB2_INT_BIT
>>   #define VIA2_IRQ_ASC_BIT        CB1_INT_BIT
>>
>> -#define VIA2_IRQ_NB             8
>> -
>>   #define VIA2_IRQ_SCSI_DATA      (1 << VIA2_IRQ_SCSI_DATA_BIT)
>>   #define VIA2_IRQ_NUBUS          (1 << VIA2_IRQ_NUBUS_BIT)
>>   #define VIA2_IRQ_UNUSED         (1 << VIA2_IRQ_SCSI_BIT)
>> diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
>> index 12abd8b8d2..ced8a670bf 100644
>> --- a/include/hw/misc/mos6522.h
>> +++ b/include/hw/misc/mos6522.h
>> @@ -57,6 +57,8 @@
>>   #define T2_INT             (1 << T2_INT_BIT)
>>   #define T1_INT             (1 << T1_INT_BIT)
>>
>> +#define VIA_NUM_INTS       5
> 
> Were we not using 5,6,7 previously ?

5 and 6 are for the in-built timers, and 7 is a set/clear flag so they are not 
externally accessible.

> Anyway,
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM


ATB,

Mark.

