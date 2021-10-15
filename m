Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB94542FC90
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 21:52:43 +0200 (CEST)
Received: from localhost ([::1]:38162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbTFy-0000SK-TI
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 15:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mbTEJ-0007Yt-K1
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:51:01 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51504
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mbTEH-0003TU-17
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:50:59 -0400
Received: from [2a00:23c4:8b9d:f500:9396:df17:737c:b32c]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mbTDx-000BVv-LZ; Fri, 15 Oct 2021 20:50:41 +0100
To: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
References: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
 <20211013212132.31519-5-mark.cave-ayland@ilande.co.uk>
 <0f7cc593-a9ca-d549-b317-25e1432408ae@vivier.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <b4a9202b-c6a4-8063-554b-111ff5f3ddd5@ilande.co.uk>
Date: Fri, 15 Oct 2021 20:50:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <0f7cc593-a9ca-d549-b317-25e1432408ae@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:f500:9396:df17:737c:b32c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 4/8] mac_via: add GPIO for A/UX mode
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

On 15/10/2021 07:58, Laurent Vivier wrote:

> Le 13/10/2021 à 23:21, Mark Cave-Ayland a écrit :
>> Add a new auxmode GPIO that is updated when port B bit 6 is changed indicating
>> whether the hardware is configured for A/UX mode.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/misc/mac_via.c         | 18 ++++++++++++++++++
>>   hw/misc/trace-events      |  1 +
>>   include/hw/misc/mac_via.h |  1 +
>>   3 files changed, 20 insertions(+)
>>
>> diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
>> index 7a53a8b4c0..a08ffbcd88 100644
>> --- a/hw/misc/mac_via.c
>> +++ b/hw/misc/mac_via.c
>> @@ -880,6 +880,20 @@ static void via1_adb_update(MOS6522Q800VIA1State *v1s)
>>       }
>>   }
>>   
>> +static void via1_auxmode_update(MOS6522Q800VIA1State *v1s)
>> +{
>> +    MOS6522State *s = MOS6522(v1s);
>> +    int oldirq, irq;
>> +
> 
> Please, add a comment to explain what happens here as "vMystery" is not self-explicit.

Would something simple like:

/* Check to see if the A/UX mode bit has changed */

suffice here?

>> +    oldirq = (v1s->last_b & VIA1B_vMystery) ? 1 : 0;
>> +    irq = (s->b & VIA1B_vMystery) ? 1 : 0;
> 
> For me, it would be clearer with:
> 
>      oldirq = !!(v1s->last_b & VIA1B_vMystery);
>      irq = !!(s->b & VIA1B_vMystery);
> 
> but it's a matter of taste.

I had to think carefully about that one :)  If you're fine with the existing version 
I'd prefer to keep it as I find it easier to read.

>> +
>> +    if (irq != oldirq) {
>> +        trace_via1_auxmode(irq);
>> +        qemu_set_irq(v1s->auxmode_irq, irq);
>> +    }
>> +}
>> +
>>   static uint64_t mos6522_q800_via1_read(void *opaque, hwaddr addr, unsigned size)
>>   {
>>       MOS6522Q800VIA1State *s = MOS6522_Q800_VIA1(opaque);
>> @@ -902,6 +916,7 @@ static void mos6522_q800_via1_write(void *opaque, hwaddr addr, uint64_t val,
>>       case VIA_REG_B:
>>           via1_rtc_update(v1s);
>>           via1_adb_update(v1s);
>> +        via1_auxmode_update(v1s);
>>   
>>           v1s->last_b = ms->b;
>>           break;
>> @@ -1046,6 +1061,9 @@ static void mos6522_q800_via1_init(Object *obj)
>>                 TYPE_ADB_BUS, DEVICE(v1s), "adb.0");
>>   
>>       qdev_init_gpio_in(DEVICE(obj), via1_irq_request, VIA1_IRQ_NB);
>> +
>> +    /* A/UX mode */
>> +    qdev_init_gpio_out(DEVICE(obj), &v1s->auxmode_irq, 1);
>>   }
>>   
>>   static const VMStateDescription vmstate_q800_via1 = {
>> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
>> index ede413965b..2da96d167a 100644
>> --- a/hw/misc/trace-events
>> +++ b/hw/misc/trace-events
>> @@ -228,6 +228,7 @@ via1_rtc_cmd_pram_sect_write(int sector, int offset, int addr, int value) "secto
>>   via1_adb_send(const char *state, uint8_t data, const char *vadbint) "state %s data=0x%02x vADBInt=%s"
>>   via1_adb_receive(const char *state, uint8_t data, const char *vadbint, int status, int index, int size) "state %s data=0x%02x vADBInt=%s status=0x%x index=%d size=%d"
>>   via1_adb_poll(uint8_t data, const char *vadbint, int status, int index, int size) "data=0x%02x vADBInt=%s status=0x%x index=%d size=%d"
>> +via1_auxmode(int mode) "setting auxmode to %d"
>>   
>>   # grlib_ahb_apb_pnp.c
>>   grlib_ahb_pnp_read(uint64_t addr, uint32_t value) "AHB PnP read addr:0x%03"PRIx64" data:0x%08x"
>> diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
>> index 4506abe5d0..b445565866 100644
>> --- a/include/hw/misc/mac_via.h
>> +++ b/include/hw/misc/mac_via.h
>> @@ -43,6 +43,7 @@ struct MOS6522Q800VIA1State {
>>       MemoryRegion via_mem;
>>   
>>       qemu_irq irqs[VIA1_IRQ_NB];
>> +    qemu_irq auxmode_irq;
>>       uint8_t last_b;
>>   
>>       /* RTC */
>>
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>


ATB,

Mark.

