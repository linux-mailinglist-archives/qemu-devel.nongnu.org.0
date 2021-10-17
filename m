Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 452E4430791
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Oct 2021 11:42:01 +0200 (CEST)
Received: from localhost ([::1]:50000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mc2g3-0004KJ-Uc
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 05:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mc2eu-0003Ye-Ox
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 05:40:50 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:52410
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mc2et-0004K1-2M
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 05:40:48 -0400
Received: from [2a00:23c4:8b9d:f500:9396:df17:737c:b32c]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mc2eY-0007xI-3R; Sun, 17 Oct 2021 10:40:30 +0100
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
 <20211013212132.31519-4-mark.cave-ayland@ilande.co.uk>
 <76216e92-8a9b-4275-b009-00997f86fba2@vivier.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <665e4961-8bad-b4ad-c352-b2328c579828@ilande.co.uk>
Date: Sun, 17 Oct 2021 10:40:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <76216e92-8a9b-4275-b009-00997f86fba2@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:f500:9396:df17:737c:b32c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 3/8] q800: use GLUE IRQ numbers instead of IRQ level for
 GLUE IRQs
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

On 15/10/2021 07:31, Laurent Vivier wrote:

> Le 13/10/2021 à 23:21, Mark Cave-Ayland a écrit :
>> In order to allow dynamic routing of IRQs to different IRQ levels on the CPU
>> depending upon port B bit 6, use GLUE IRQ numbers and map them to the the
>> corresponding CPU IRQ level accordingly.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/m68k/q800.c | 32 ++++++++++++++++++++++++++++----
>>   1 file changed, 28 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
>> index 15f3067811..81c335bf16 100644
>> --- a/hw/m68k/q800.c
>> +++ b/hw/m68k/q800.c
>> @@ -102,11 +102,34 @@ struct GLUEState {
>>       uint8_t ipr;
>>   };
>>   
>> +#define GLUE_IRQ_IN_VIA1       0
>> +#define GLUE_IRQ_IN_VIA2       1
>> +#define GLUE_IRQ_IN_SONIC      2
>> +#define GLUE_IRQ_IN_ESCC       3
>> +
>>   static void GLUE_set_irq(void *opaque, int irq, int level)
>>   {
>>       GLUEState *s = opaque;
>>       int i;
>>   
>> +    switch (irq) {
>> +    case GLUE_IRQ_IN_VIA1:
>> +        irq = 5;
>> +        break;
> 
> Perhaps you can move this patch before patch 2 to help to understand why GLUE_IRQ_IN_VIA1 (0) is
> mapped to irq 5 (before patch 2 it would be to 0).
> 
>> +
>> +    case GLUE_IRQ_IN_VIA2:
>> +        irq = 1;
>> +        break;
>> +
>> +    case GLUE_IRQ_IN_SONIC:
>> +        irq = 2;
>> +        break;
>> +
>> +    case GLUE_IRQ_IN_ESCC:
>> +        irq = 3;
>> +        break;
>> +    }
>> +
>>       if (level) {
>>           s->ipr |= 1 << irq;
> 
> perhaps you can rename here "irq" to "shift"?

Were you happy to leave this as irq? Another alternative may be to use the BIT() 
macro as suggested by Zoltan.


ATB,

Mark.

