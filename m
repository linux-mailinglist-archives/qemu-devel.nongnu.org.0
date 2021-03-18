Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B726E340A71
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:45:06 +0100 (CET)
Received: from localhost ([::1]:41158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvlh-00055Q-Ow
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:45:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lMvRT-0004uj-Sl
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:24:11 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:53950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lMvRQ-0004Qc-Kc
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:24:10 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9897B746398;
 Thu, 18 Mar 2021 17:24:03 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 754B87462D6; Thu, 18 Mar 2021 17:24:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 731E87462E1;
 Thu, 18 Mar 2021 17:24:03 +0100 (CET)
Date: Thu, 18 Mar 2021 17:24:03 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH for 6.0 v2] hw/intc/i8259: Refactor pic_read_irq() to
 avoid uninitialized variable
In-Reply-To: <20210318160949.3681463-1-philmd@redhat.com>
Message-ID: <e71d95de-a1ce-a8e5-78e-1751210329e@eik.bme.hu>
References: <20210318160949.3681463-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-50933082-1616084643=:84870"
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-50933082-1616084643=:84870
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 18 Mar 2021, Philippe Mathieu-Daudé wrote:
> Some compiler versions are smart enough to detect a potentially
> uninitialized variable, but are not smart enough to detect that this
> cannot happen due to the code flow:
>
> ../hw/intc/i8259.c: In function ‘pic_read_irq’:
> ../hw/intc/i8259.c:203:13: error: ‘irq2’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>   203 |         irq = irq2 + 8;
>       |         ~~~~^~~~~~~~~~
>
> Restrict irq2 variable use to the inner statement.
>
> Fixes: 78ef2b6989f ("i8259: Reorder intack in pic_read_irq")
> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Supersedes: <20210318154738.27094-1-borntraeger@de.ibm.com>
> ---
> hw/intc/i8259.c | 11 ++++++-----
> 1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
> index 344fd04db14..52c039c6c03 100644
> --- a/hw/intc/i8259.c
> +++ b/hw/intc/i8259.c
> @@ -176,10 +176,12 @@ static void pic_intack(PICCommonState *s, int irq)
> int pic_read_irq(DeviceState *d)
> {
>     PICCommonState *s = PIC_COMMON(d);
> -    int irq, irq2, intno;
> +    int irq, intno;
>
>     irq = pic_get_irq(s);
>     if (irq >= 0) {
> +        int irq2;
> +
>         if (irq == 2) {
>             irq2 = pic_get_irq(slave_pic);
>             if (irq2 >= 0) {
> @@ -189,8 +191,11 @@ int pic_read_irq(DeviceState *d)
>                 irq2 = 7;
>             }
>             intno = slave_pic->irq_base + irq2;
> +            pic_intack(s, irq);
> +            irq = irq2 + 8;
>         } else {
>             intno = s->irq_base + irq;
> +            pic_intack(s, irq);
>         }
>         pic_intack(s, irq);

Do you still need this pic_intack() here or did you intend to move it in 
the if above?

Regards,
BALATON Zoltan

>     } else {
> @@ -199,10 +204,6 @@ int pic_read_irq(DeviceState *d)
>         intno = s->irq_base + irq;
>     }
>
> -    if (irq == 2) {
> -        irq = irq2 + 8;
> -    }
> -
> #ifdef DEBUG_IRQ_LATENCY
>     printf("IRQ%d latency=%0.3fus\n",
>            irq,
>
--3866299591-50933082-1616084643=:84870--

