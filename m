Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E303F7108
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 10:19:41 +0200 (CEST)
Received: from localhost ([::1]:57198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIo8K-00012P-Ev
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 04:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIo7X-0000CF-Vv; Wed, 25 Aug 2021 04:18:51 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46230
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIo7W-0007UY-3X; Wed, 25 Aug 2021 04:18:51 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIo74-0007eV-7k; Wed, 25 Aug 2021 09:18:27 +0100
To: Finn Thain <fthain@linux-m68k.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <45c9d15c51076bba431e5593dbfcbcca2e1dc09a.1629799776.git.fthain@linux-m68k.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <7ebbd209-b9b5-7f85-1853-620985afcfac@ilande.co.uk>
Date: Wed, 25 Aug 2021 09:18:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <45c9d15c51076bba431e5593dbfcbcca2e1dc09a.1629799776.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC 06/10] hw/mos6522: Implement oneshot mode
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

> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
>   hw/misc/mos6522.c         | 19 ++++++++++++-------
>   include/hw/misc/mos6522.h |  3 +++
>   2 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> index ffff8991f4..5b1657ac0d 100644
> --- a/hw/misc/mos6522.c
> +++ b/hw/misc/mos6522.c
> @@ -79,6 +79,7 @@ static void set_counter(MOS6522State *s, MOS6522Timer *ti, unsigned int val)
>       trace_mos6522_set_counter(1 + ti->index, val);
>       ti->load_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>       ti->counter_value = val;
> +    ti->oneshot_fired = false;
>       if (ti->index == 0) {
>           mos6522_timer1_update(s, ti, ti->load_time);
>       } else {
> @@ -133,7 +134,8 @@ static void mos6522_timer1_update(MOS6522State *s, MOS6522Timer *ti,
>           return;
>       }
>       ti->next_irq_time = get_next_irq_time(s, ti, current_time);
> -    if ((s->ier & T1_INT) == 0 || (s->acr & T1MODE) != T1MODE_CONT) {
> +    if ((s->ier & T1_INT) == 0 ||
> +        ((s->acr & T1MODE) == T1MODE_ONESHOT && ti->oneshot_fired)) {
>           timer_del(ti->timer);
>       } else {
>           timer_mod(ti->timer, ti->next_irq_time);
> @@ -147,7 +149,7 @@ static void mos6522_timer2_update(MOS6522State *s, MOS6522Timer *ti,
>           return;
>       }
>       ti->next_irq_time = get_next_irq_time(s, ti, current_time);
> -    if ((s->ier & T2_INT) == 0) {
> +    if ((s->ier & T2_INT) == 0 || (s->acr & T2MODE) || ti->oneshot_fired) {
>           timer_del(ti->timer);
>       } else {
>           timer_mod(ti->timer, ti->next_irq_time);
> @@ -159,6 +161,7 @@ static void mos6522_timer1_expired(void *opaque)
>       MOS6522State *s = opaque;
>       MOS6522Timer *ti = &s->timers[0];
>   
> +    ti->oneshot_fired = true;
>       mos6522_timer1_update(s, ti, ti->next_irq_time);
>       s->ifr |= T1_INT;
>       mos6522_update_irq(s);
> @@ -169,6 +172,7 @@ static void mos6522_timer2_expired(void *opaque)
>       MOS6522State *s = opaque;
>       MOS6522Timer *ti = &s->timers[1];
>   
> +    ti->oneshot_fired = true;
>       mos6522_timer2_update(s, ti, ti->next_irq_time);
>       s->ifr |= T2_INT;
>       mos6522_update_irq(s);

I was trying to understand why you need ti->oneshot_fired here since the 
mos6522_timer*_update() functions should simply not re-arm the timer if not in 
continuous mode...

> @@ -198,10 +202,12 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
>       int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>   
>       if (now >= s->timers[0].next_irq_time) {
> +        s->timers[0].oneshot_fired = true;
>           mos6522_timer1_update(s, &s->timers[0], now);
>           s->ifr |= T1_INT;
>       }
>       if (now >= s->timers[1].next_irq_time) {
> +        s->timers[1].oneshot_fired = true;
>           mos6522_timer2_update(s, &s->timers[1], now);
>           s->ifr |= T2_INT;
>       }

...however this block above raises the timer interrupt outside of the timer callback. 
This block isn't part of your original patch but was introduced as part of 
cd8843ff25d ("mos6522: fix T1 and T2 timers") but I'm wondering if it is wrong.

If you remove both of the above if (now ... ) {} blocks then does one-shot mode work 
by just adding the (s->acr & T2MODE) check in mos6522_timer2_update()? I'm guessing 
that Linux/m68k does use one or both of the timers in one-shot mode?

> @@ -279,6 +285,7 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>   {
>       MOS6522State *s = opaque;
>       MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(s);
> +    int64_t now;
>   
>       trace_mos6522_write(addr, val);
>   
> @@ -318,9 +325,6 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>           s->timers[1].latch = (s->timers[1].latch & 0xff00) | val;
>           break;
>       case VIA_REG_T2CH:
> -        /* To ensure T2 generates an interrupt on zero crossing with the
> -           common timer code, write the value directly from the latch to
> -           the counter */
>           s->timers[1].latch = (s->timers[1].latch & 0xff) | (val << 8);
>           s->ifr &= ~T2_INT;
>           set_counter(s, &s->timers[1], s->timers[1].latch);
> @@ -330,8 +334,9 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>           break;
>       case VIA_REG_ACR:
>           s->acr = val;
> -        mos6522_timer1_update(s, &s->timers[0],
> -                              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
> +        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        mos6522_timer1_update(s, &s->timers[0], now);
> +        mos6522_timer2_update(s, &s->timers[1], now);
>           break;
>       case VIA_REG_PCR:
>           s->pcr = val;
> diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
> index fc95d22b0f..94b1dc324c 100644
> --- a/include/hw/misc/mos6522.h
> +++ b/include/hw/misc/mos6522.h
> @@ -50,8 +50,10 @@
>   #define T1_INT             0x40    /* Timer 1 interrupt */
>   
>   /* Bits in ACR */
> +#define T2MODE             0x20    /* Timer 2 mode */
>   #define T1MODE             0xc0    /* Timer 1 mode */
>   #define T1MODE_CONT        0x40    /*  continuous interrupts */
> +#define T1MODE_ONESHOT     0x00    /*  timed interrupt */
>   
>   /* VIA registers */
>   #define VIA_REG_B       0x00
> @@ -83,6 +85,7 @@ typedef struct MOS6522Timer {
>       int64_t next_irq_time;
>       uint64_t frequency;
>       QEMUTimer *timer;
> +    bool oneshot_fired;
>   } MOS6522Timer;
>   
>   /**


ATB,

Mark.

