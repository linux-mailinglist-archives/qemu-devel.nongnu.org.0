Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FFA4307BC
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Oct 2021 12:08:44 +0200 (CEST)
Received: from localhost ([::1]:41410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mc35v-0001rH-DY
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 06:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mc351-0001Bb-0A
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 06:07:47 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:52430
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mc34z-0007T5-5v
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 06:07:46 -0400
Received: from [2a00:23c4:8b9d:f500:9396:df17:737c:b32c]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mc34f-0008G8-B9; Sun, 17 Oct 2021 11:07:29 +0100
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
 <20211013212132.31519-7-mark.cave-ayland@ilande.co.uk>
 <679f9de8-bddb-07e6-1a3a-2871588a7afc@vivier.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <422aa27a-8090-9a17-a3f8-3bda87e76c2e@ilande.co.uk>
Date: Sun, 17 Oct 2021 11:07:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <679f9de8-bddb-07e6-1a3a-2871588a7afc@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:f500:9396:df17:737c:b32c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 6/8] q800: route SONIC on-board Ethernet IRQ via nubus IRQ
 9 in classic mode
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

On 16/10/2021 19:08, Laurent Vivier wrote:

> Le 13/10/2021 à 23:21, Mark Cave-Ayland a écrit :
>> When the hardware is operating in classic mode the SONIC on-board Ethernet IRQ is
>> routed to nubus IRQ 9 instead of directly to the CPU at level 3. This does not
>> affect the framebuffer which although it exists in slot 9, has its own
>> dedicated IRQ on the Quadra 800 hardware.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/m68k/q800.c | 57 ++++++++++++++++++++++++++++++++++++++++----------
>>   1 file changed, 46 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
>> index 0093872d89..d55e6a7541 100644
>> --- a/hw/m68k/q800.c
>> +++ b/hw/m68k/q800.c
>> @@ -101,6 +101,7 @@ struct GLUEState {
>>       M68kCPU *cpu;
>>       uint8_t ipr;
>>       uint8_t auxmode;
>> +    qemu_irq irqs[1];
>>   };
>>   
>>   #define GLUE_IRQ_IN_VIA1       0
>> @@ -108,27 +109,50 @@ struct GLUEState {
>>   #define GLUE_IRQ_IN_SONIC      2
>>   #define GLUE_IRQ_IN_ESCC       3
>>   
>> +#define GLUE_IRQ_NUBUS_9       0
>> +
>>   static void GLUE_set_irq(void *opaque, int irq, int level)
>>   {
>>       GLUEState *s = opaque;
>>       int i;
>>   
>> -    switch (irq) {
>> -    case GLUE_IRQ_IN_VIA1:
>> -        irq = 5;
>> -        break;
>> +    switch (s->auxmode) {
>> +    case 0:
> 
> why don't you use "if () {} else {}" rather than "switch() { case 0: ; case 1: }" ?
> (I don't think we need to manage a "default:" case.)

Sure, I can do that: I used the switch()/default originally to make sure the irq 
wasn't being set to an unexpected value.

I've also just spotted that the comment in this patch is incorrect:

     /*
      * Since the framebuffer in slot 0x9 uses a separate IRQ, wire the unused
      * IRQ via GLUE for use by SONIC Ethernet in A/UX mode
      */

This should be classic mode, of course.


ATB,

Mark.

