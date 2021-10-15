Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BF642ED7D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:21:54 +0200 (CEST)
Received: from localhost ([::1]:50976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJPV-0002gd-UN
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mbIwT-0004wa-4a
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 04:51:53 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:10579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mbIwQ-0008QX-25
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 04:51:52 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0EBC8748F56;
 Fri, 15 Oct 2021 10:51:46 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E010F746333; Fri, 15 Oct 2021 10:51:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DE9FB7462D3;
 Fri, 15 Oct 2021 10:51:45 +0200 (CEST)
Date: Fri, 15 Oct 2021 10:51:45 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 3/8] q800: use GLUE IRQ numbers instead of IRQ level for
 GLUE IRQs
In-Reply-To: <76216e92-8a9b-4275-b009-00997f86fba2@vivier.eu>
Message-ID: <aafe19d4-9f47-ecb6-d164-f09ee6ab29dd@eik.bme.hu>
References: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
 <20211013212132.31519-4-mark.cave-ayland@ilande.co.uk>
 <76216e92-8a9b-4275-b009-00997f86fba2@vivier.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1388598343-1634287905=:20227"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1388598343-1634287905=:20227
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 15 Oct 2021, Laurent Vivier wrote:
> Le 13/10/2021 à 23:21, Mark Cave-Ayland a écrit :
>> In order to allow dynamic routing of IRQs to different IRQ levels on the CPU
>> depending upon port B bit 6, use GLUE IRQ numbers and map them to the the
>> corresponding CPU IRQ level accordingly.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>  hw/m68k/q800.c | 32 ++++++++++++++++++++++++++++----
>>  1 file changed, 28 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
>> index 15f3067811..81c335bf16 100644
>> --- a/hw/m68k/q800.c
>> +++ b/hw/m68k/q800.c
>> @@ -102,11 +102,34 @@ struct GLUEState {
>>      uint8_t ipr;
>>  };
>>
>> +#define GLUE_IRQ_IN_VIA1       0
>> +#define GLUE_IRQ_IN_VIA2       1
>> +#define GLUE_IRQ_IN_SONIC      2
>> +#define GLUE_IRQ_IN_ESCC       3
>> +
>>  static void GLUE_set_irq(void *opaque, int irq, int level)
>>  {
>>      GLUEState *s = opaque;
>>      int i;
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
>>      if (level) {
>>          s->ipr |= 1 << irq;
>
> perhaps you can rename here "irq" to "shift"?

I think if it's the irq number calling it irq is clearer than shift. Maybe 
use BIT(irq) instead?

Regards,
BALATON Zoltan
--3866299591-1388598343-1634287905=:20227--

