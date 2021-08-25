Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C440E3F711C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 10:27:46 +0200 (CEST)
Received: from localhost ([::1]:35586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIoG9-0005tw-Rz
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 04:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIoFN-00053Z-UE; Wed, 25 Aug 2021 04:26:57 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46268
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIoFM-00065I-Ju; Wed, 25 Aug 2021 04:26:57 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIoEw-0007jz-Ad; Wed, 25 Aug 2021 09:26:35 +0100
To: Finn Thain <fthain@linux-m68k.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <c886cdc2911f250c3e8e15ceb717124c7044b50b.1629799776.git.fthain@linux-m68k.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <a8dc1232-619e-d857-0f61-ebcb369da343@ilande.co.uk>
Date: Wed, 25 Aug 2021 09:26:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c886cdc2911f250c3e8e15ceb717124c7044b50b.1629799776.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC 08/10] hw/mos6522: Call mos6522_update_irq() when appropriate
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.305,
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
Cc: qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/08/2021 11:09, Finn Thain wrote:

> It necessary to call mos6522_update_irq() when the interrupt flags
> change and unnecessary when they haven't.
> 
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
>   hw/misc/mos6522.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> index 0a241fe9f8..0dd3ccf945 100644
> --- a/hw/misc/mos6522.c
> +++ b/hw/misc/mos6522.c
> @@ -208,11 +208,13 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
>           s->timers[0].oneshot_fired = true;
>           mos6522_timer1_update(s, &s->timers[0], now);
>           s->ifr |= T1_INT;
> +        mos6522_update_irq(s);
>       }
>       if (now >= s->timers[1].next_irq_time) {
>           s->timers[1].oneshot_fired = true;
>           mos6522_timer2_update(s, &s->timers[1], now);
>           s->ifr |= T2_INT;
> +        mos6522_update_irq(s);
>       }

Again this seems to be in the block of code I'm not sure is correct, so my first 
instinct is to see if removing it helps first - although the patch logically seems 
correct.

>       switch (addr) {
>       case VIA_REG_B:
> @@ -237,7 +239,6 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
>           break;
>       case VIA_REG_T1CH:
>           val = get_counter(s, &s->timers[0]) >> 8;
> -        mos6522_update_irq(s);

As get_counter() simply generates the current counter value I'd say this part is correct.

>           break;
>       case VIA_REG_T1LL:
>           val = s->timers[0].latch & 0xff;
> 


ATB,

Mark.

