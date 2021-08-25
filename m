Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2863F7142
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 10:46:05 +0200 (CEST)
Received: from localhost ([::1]:39646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIoXr-0001CB-Po
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 04:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIoWj-0000Jy-A8; Wed, 25 Aug 2021 04:44:53 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46294
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIoWh-0004Yd-7V; Wed, 25 Aug 2021 04:44:52 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIoWF-0007uZ-TS; Wed, 25 Aug 2021 09:44:29 +0100
To: Finn Thain <fthain@linux-m68k.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <21f20ab5a100e4947d840080114f3f0511aade86.1629799776.git.fthain@linux-m68k.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <157fd841-9a1f-3f8e-1a29-ab79305843c9@ilande.co.uk>
Date: Wed, 25 Aug 2021 09:44:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <21f20ab5a100e4947d840080114f3f0511aade86.1629799776.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC 09/10] hw/mos6522: Avoid using discrepant QEMU clock values
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

> mos6522_read() and mos6522_write() may call various functions to determine
> timer irq state, timer counter value and QEMUTimer deadline. All called
> functions must use the same value for the present time.
> 
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
>   hw/misc/mos6522.c | 51 +++++++++++++++++++++++++----------------------
>   1 file changed, 27 insertions(+), 24 deletions(-)
> 
> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> index 0dd3ccf945..23a440b64f 100644
> --- a/hw/misc/mos6522.c
> +++ b/hw/misc/mos6522.c
> @@ -39,9 +39,9 @@
>   /* XXX: implement all timer modes */
>   
>   static void mos6522_timer1_update(MOS6522State *s, MOS6522Timer *ti,
> -                                  int64_t current_time);
> +                                  int64_t now);
>   static void mos6522_timer2_update(MOS6522State *s, MOS6522Timer *ti,
> -                                  int64_t current_time);
> +                                  int64_t now);
>   
>   static void mos6522_update_irq(MOS6522State *s)
>   {
> @@ -52,12 +52,12 @@ static void mos6522_update_irq(MOS6522State *s)
>       }
>   }
>   
> -static unsigned int get_counter(MOS6522State *s, MOS6522Timer *ti)
> +static unsigned int get_counter(MOS6522State *s, MOS6522Timer *ti, int64_t now)
>   {
>       int64_t d;
>       unsigned int counter;
>   
> -    d = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - ti->load_time,
> +    d = muldiv64(now - ti->load_time,
>                    ti->frequency, NANOSECONDS_PER_SECOND);
>   
>       if (ti->index == 0) {
> @@ -89,7 +89,7 @@ static void set_counter(MOS6522State *s, MOS6522Timer *ti, unsigned int val)
>   }
>   
>   static int64_t get_next_irq_time(MOS6522State *s, MOS6522Timer *ti,
> -                                 int64_t current_time)
> +                                 int64_t now)
>   {
>       int64_t d, next_time;
>       unsigned int counter;
> @@ -99,7 +99,7 @@ static int64_t get_next_irq_time(MOS6522State *s, MOS6522Timer *ti,
>       }
>   
>       /* current counter value */
> -    d = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - ti->load_time,
> +    d = muldiv64(now - ti->load_time,
>                    ti->frequency, NANOSECONDS_PER_SECOND);
>   
>       /* the timer goes down from latch to -1 (period of latch + 2) */
> @@ -123,20 +123,19 @@ static int64_t get_next_irq_time(MOS6522State *s, MOS6522Timer *ti,
>       trace_mos6522_get_next_irq_time(ti->latch, d, next_time - d);
>       next_time = muldiv64(next_time, NANOSECONDS_PER_SECOND, ti->frequency) +
>                            ti->load_time;
> -
> -    if (next_time <= current_time) {
> -        next_time = current_time + 1;
> -    }
>       return next_time;
>   }
>   
>   static void mos6522_timer1_update(MOS6522State *s, MOS6522Timer *ti,
> -                                 int64_t current_time)
> +                                  int64_t now)
>   {
>       if (!ti->timer) {
>           return;
>       }
> -    ti->next_irq_time = get_next_irq_time(s, ti, current_time);
> +    ti->next_irq_time = get_next_irq_time(s, ti, now);
> +    if (ti->next_irq_time <= now) {
> +        ti->next_irq_time = now + 1;
> +    }
>       if ((s->ier & T1_INT) == 0 ||
>           ((s->acr & T1MODE) == T1MODE_ONESHOT && ti->oneshot_fired)) {
>           timer_del(ti->timer);
> @@ -146,12 +145,15 @@ static void mos6522_timer1_update(MOS6522State *s, MOS6522Timer *ti,
>   }
>   
>   static void mos6522_timer2_update(MOS6522State *s, MOS6522Timer *ti,
> -                                 int64_t current_time)
> +                                  int64_t now)
>   {
>       if (!ti->timer) {
>           return;
>       }
> -    ti->next_irq_time = get_next_irq_time(s, ti, current_time);
> +    ti->next_irq_time = get_next_irq_time(s, ti, now);
> +    if (ti->next_irq_time <= now) {
> +        ti->next_irq_time = now + 1;
> +    }
>       if ((s->ier & T2_INT) == 0 || (s->acr & T2MODE) || ti->oneshot_fired) {
>           timer_del(ti->timer);
>       } else {
> @@ -163,9 +165,10 @@ static void mos6522_timer1_expired(void *opaque)
>   {
>       MOS6522State *s = opaque;
>       MOS6522Timer *ti = &s->timers[0];
> +    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>   
>       ti->oneshot_fired = true;
> -    mos6522_timer1_update(s, ti, ti->next_irq_time);
> +    mos6522_timer1_update(s, ti, now);

Presumably using ti->next_irq_time has already fixed the current time to be that at 
which the timer routine actually expired, rather than the current executing time. Are 
you seeing large differences in these numbers that can cause timer drift? If so, I'm 
wondering if this change should be in a separate patch.

>       s->ifr |= T1_INT;
>       mos6522_update_irq(s);
>   }
> @@ -174,9 +177,10 @@ static void mos6522_timer2_expired(void *opaque)
>   {
>       MOS6522State *s = opaque;
>       MOS6522Timer *ti = &s->timers[1];
> +    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>   
>       ti->oneshot_fired = true;
> -    mos6522_timer2_update(s, ti, ti->next_irq_time);
> +    mos6522_timer2_update(s, ti, now);

And same again here.

>       s->ifr |= T2_INT;
>       mos6522_update_irq(s);
>   }
> @@ -233,12 +237,12 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
>           val = s->dira;
>           break;
>       case VIA_REG_T1CL:
> -        val = get_counter(s, &s->timers[0]) & 0xff;
> +        val = get_counter(s, &s->timers[0], now) & 0xff;
>           s->ifr &= ~T1_INT;
>           mos6522_update_irq(s);
>           break;
>       case VIA_REG_T1CH:
> -        val = get_counter(s, &s->timers[0]) >> 8;
> +        val = get_counter(s, &s->timers[0], now) >> 8;
>           break;
>       case VIA_REG_T1LL:
>           val = s->timers[0].latch & 0xff;
> @@ -247,12 +251,12 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
>           val = (s->timers[0].latch >> 8) & 0xff;
>           break;
>       case VIA_REG_T2CL:
> -        val = get_counter(s, &s->timers[1]) & 0xff;
> +        val = get_counter(s, &s->timers[1], now) & 0xff;
>           s->ifr &= ~T2_INT;
>           mos6522_update_irq(s);
>           break;
>       case VIA_REG_T2CH:
> -        val = get_counter(s, &s->timers[1]) >> 8;
> +        val = get_counter(s, &s->timers[1], now) >> 8;
>           break;
>       case VIA_REG_SR:
>           val = s->sr;
> @@ -360,10 +364,9 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>           }
>           mos6522_update_irq(s);
>           /* if IER is modified starts needed timers */
> -        mos6522_timer1_update(s, &s->timers[0],
> -                              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
> -        mos6522_timer2_update(s, &s->timers[1],
> -                              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
> +        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        mos6522_timer1_update(s, &s->timers[0], now);
> +        mos6522_timer2_update(s, &s->timers[1], now);
>           break;
>       default:
>           g_assert_not_reached();

In terms of functionality it shouldn't really matter (since you have a ns clock 
compared with a timer that can manage small frequencies in comparison) but I can see 
how having a constant clock time throughout the entire calculation process could be 
useful for debugging.


ATB,

Mark.

