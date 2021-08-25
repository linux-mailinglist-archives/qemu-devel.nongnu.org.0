Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F27E3F7150
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 10:53:41 +0200 (CEST)
Received: from localhost ([::1]:42850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIofE-0003ra-7o
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 04:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIoeH-000309-52; Wed, 25 Aug 2021 04:52:41 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46312
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIoeE-0001zd-1t; Wed, 25 Aug 2021 04:52:40 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIodn-0007x2-T6; Wed, 25 Aug 2021 09:52:17 +0100
To: Finn Thain <fthain@linux-m68k.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <cff0bcc8963e6b339716ad095a41687533cd64fd.1629799776.git.fthain@linux-m68k.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <8895ba94-2a50-8845-2744-e318fc08dd47@ilande.co.uk>
Date: Wed, 25 Aug 2021 09:52:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <cff0bcc8963e6b339716ad095a41687533cd64fd.1629799776.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC 10/10] hw/mos6522: Synchronize timer interrupt and timer
 counter
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

> We rely on a QEMUTimer callback to set the interrupt flag, and this races
> with counter register accesses, such that the guest might see the counter
> reloaded but might not see the interrupt flagged.
> 
> According to the datasheet, a real 6522 device counts down to FFFF, then
> raises the relevant IRQ. After the FFFF count, the counter reloads from
> the latch (for timer 1) or continues to decrement thru FFFE (for timer 2).
> 
> Therefore, the guest operating system may read zero from T1CH and infer
> that the counter has not yet wrapped (given another full count hasn't
> yet elapsed.)
> 
> Similarly, the guest may find the timer interrupt flag to be set and
> infer that the counter is non-zero (given another full count hasn't yet
> elapsed).
> 
> Synchronize the timer counter and interrupt flag such that the guest will
> observe the correct sequence of states. (It's still not right, because in
> reality it's not possible to access the registers more than once per
> "phase 2" clock cycle.)
> 
> Eliminate the duplication of logic in get_counter() and
> get_next_irq_time() by calling the former before the latter.
> 
> Note that get_counter() is called prior to changing the latch. This is
> because get_counter() may need to use the old latch value in order to
> reload the counter.
> 
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
>   hw/misc/mos6522.c         | 154 ++++++++++++++++++++------------------
>   hw/misc/trace-events      |   2 +-
>   include/hw/misc/mos6522.h |   8 +-
>   3 files changed, 88 insertions(+), 76 deletions(-)
> 
> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> index 23a440b64f..bd5df4963b 100644
> --- a/hw/misc/mos6522.c
> +++ b/hw/misc/mos6522.c
> @@ -52,26 +52,58 @@ static void mos6522_update_irq(MOS6522State *s)
>       }
>   }
>   
> +static void mos6522_timer_raise_irq(MOS6522State *s, MOS6522Timer *ti)
> +{
> +    if (ti->state == irq) {
> +        return;
> +    }
> +    ti->state = irq;
> +    if (ti->index == 0) {
> +        s->ifr |= T1_INT;
> +    } else {
> +        s->ifr |= T2_INT;
> +    }
> +    mos6522_update_irq(s);
> +}
> +
>   static unsigned int get_counter(MOS6522State *s, MOS6522Timer *ti, int64_t now)
>   {
>       int64_t d;
>       unsigned int counter;
> -
> +    bool reload;
> +
> +    /*
> +     * Timer 1 counts down from the latch value to -1 (period of latch + 2),
> +     * then raises its interrupt and reloads.
> +     * Timer 2 counts down from the latch value to -1, then raises its
> +     * interrupt and continues to -2 and so on without any further interrupts.
> +     * (In reality, the first count should be measured from the falling edge
> +     * of the "phase two" clock, making its period N + 1.5. The subsequent
> +     * counts have period N + 2. This detail has been ignored here.)
> +     */
>       d = muldiv64(now - ti->load_time,
>                    ti->frequency, NANOSECONDS_PER_SECOND);
>   
> -    if (ti->index == 0) {
> -        /* the timer goes down from latch to -1 (period of latch + 2) */
> -        if (d <= (ti->counter_value + 1)) {
> -            counter = ti->counter_value - d;
> -        } else {
> -            int64_t d_post_reload = d - (ti->counter_value + 2);
> -            /* XXX this calculation assumes that ti->latch has not changed */
> -            counter = ti->latch - (d_post_reload % (ti->latch + 2));
> -        }
> -    } else {
> -        counter = ti->counter_value - d;
> +    reload = (d >= ti->counter_value + 2);
> +
> +    if (ti->index == 0 && reload) {
> +        int64_t more_reloads;
> +
> +        d -= ti->counter_value + 2;
> +        more_reloads = d / (ti->latch + 2);
> +        d -= more_reloads * (ti->latch + 2);
> +        ti->load_time += muldiv64(ti->counter_value + 2 +
> +                                  more_reloads * (ti->latch + 2),
> +                                  NANOSECONDS_PER_SECOND, ti->frequency);
> +        ti->counter_value = ti->latch;
>       }
> +
> +    counter = ti->counter_value - d;
> +
> +    if (reload) {
> +        mos6522_timer_raise_irq(s, ti);
> +    }
> +
>       return counter & 0xffff;
>   }
>   
> @@ -80,7 +112,7 @@ static void set_counter(MOS6522State *s, MOS6522Timer *ti, unsigned int val)
>       trace_mos6522_set_counter(1 + ti->index, val);
>       ti->load_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>       ti->counter_value = val;
> -    ti->oneshot_fired = false;
> +    ti->state = decrement;
>       if (ti->index == 0) {
>           mos6522_timer1_update(s, ti, ti->load_time);
>       } else {
> @@ -91,38 +123,15 @@ static void set_counter(MOS6522State *s, MOS6522Timer *ti, unsigned int val)
>   static int64_t get_next_irq_time(MOS6522State *s, MOS6522Timer *ti,
>                                    int64_t now)
>   {
> -    int64_t d, next_time;
> -    unsigned int counter;
> +    int64_t next_time;
>   
>       if (ti->frequency == 0) {
>           return INT64_MAX;
>       }
>   
> -    /* current counter value */
> -    d = muldiv64(now - ti->load_time,
> -                 ti->frequency, NANOSECONDS_PER_SECOND);
> -
> -    /* the timer goes down from latch to -1 (period of latch + 2) */
> -    if (d <= (ti->counter_value + 1)) {
> -        counter = ti->counter_value - d;
> -    } else {
> -        int64_t d_post_reload = d - (ti->counter_value + 2);
> -        /* XXX this calculation assumes that ti->latch has not changed */
> -        counter = ti->latch - (d_post_reload % (ti->latch + 2));
> -    }
> -    counter &= 0xffff;
> -
> -    /* Note: we consider the irq is raised on 0 */
> -    if (counter == 0xffff) {
> -        next_time = d + ti->latch + 1;
> -    } else if (counter == 0) {
> -        next_time = d + ti->latch + 2;
> -    } else {
> -        next_time = d + counter;
> -    }
> -    trace_mos6522_get_next_irq_time(ti->latch, d, next_time - d);
> -    next_time = muldiv64(next_time, NANOSECONDS_PER_SECOND, ti->frequency) +
> -                         ti->load_time;
> +    next_time = ti->load_time + muldiv64(ti->counter_value + 2,
> +                                         NANOSECONDS_PER_SECOND, ti->frequency);
> +    trace_mos6522_get_next_irq_time(ti->latch, ti->load_time, next_time);
>       return next_time;
>   }
>   
> @@ -132,12 +141,10 @@ static void mos6522_timer1_update(MOS6522State *s, MOS6522Timer *ti,
>       if (!ti->timer) {
>           return;
>       }
> +    get_counter(s, ti, now);
>       ti->next_irq_time = get_next_irq_time(s, ti, now);
> -    if (ti->next_irq_time <= now) {
> -        ti->next_irq_time = now + 1;
> -    }
>       if ((s->ier & T1_INT) == 0 ||
> -        ((s->acr & T1MODE) == T1MODE_ONESHOT && ti->oneshot_fired)) {
> +        ((s->acr & T1MODE) == T1MODE_ONESHOT && ti->state >= irq)) {
>           timer_del(ti->timer);
>       } else {
>           timer_mod(ti->timer, ti->next_irq_time);
> @@ -150,11 +157,9 @@ static void mos6522_timer2_update(MOS6522State *s, MOS6522Timer *ti,
>       if (!ti->timer) {
>           return;
>       }
> +    get_counter(s, ti, now);
>       ti->next_irq_time = get_next_irq_time(s, ti, now);
> -    if (ti->next_irq_time <= now) {
> -        ti->next_irq_time = now + 1;
> -    }
> -    if ((s->ier & T2_INT) == 0 || (s->acr & T2MODE) || ti->oneshot_fired) {
> +    if ((s->ier & T2_INT) == 0 || (s->acr & T2MODE) || ti->state >= irq) {
>           timer_del(ti->timer);
>       } else {
>           timer_mod(ti->timer, ti->next_irq_time);
> @@ -167,10 +172,7 @@ static void mos6522_timer1_expired(void *opaque)
>       MOS6522Timer *ti = &s->timers[0];
>       int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>   
> -    ti->oneshot_fired = true;
>       mos6522_timer1_update(s, ti, now);
> -    s->ifr |= T1_INT;
> -    mos6522_update_irq(s);
>   }
>   
>   static void mos6522_timer2_expired(void *opaque)
> @@ -179,10 +181,7 @@ static void mos6522_timer2_expired(void *opaque)
>       MOS6522Timer *ti = &s->timers[1];
>       int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>   
> -    ti->oneshot_fired = true;
>       mos6522_timer2_update(s, ti, now);
> -    s->ifr |= T2_INT;
> -    mos6522_update_irq(s);
>   }
>   
>   static void mos6522_set_sr_int(MOS6522State *s)
> @@ -208,18 +207,6 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
>       uint32_t val;
>       int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>   
> -    if (now >= s->timers[0].next_irq_time) {
> -        s->timers[0].oneshot_fired = true;
> -        mos6522_timer1_update(s, &s->timers[0], now);
> -        s->ifr |= T1_INT;
> -        mos6522_update_irq(s);
> -    }
> -    if (now >= s->timers[1].next_irq_time) {
> -        s->timers[1].oneshot_fired = true;
> -        mos6522_timer2_update(s, &s->timers[1], now);
> -        s->ifr |= T2_INT;
> -        mos6522_update_irq(s);
> -    }
>       switch (addr) {
>       case VIA_REG_B:
>           val = s->b;
> @@ -238,8 +225,11 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
>           break;
>       case VIA_REG_T1CL:
>           val = get_counter(s, &s->timers[0], now) & 0xff;
> -        s->ifr &= ~T1_INT;
> -        mos6522_update_irq(s);
> +        if (s->timers[0].state >= irq) {
> +            s->timers[0].state = irq_cleared;
> +            s->ifr &= ~T1_INT;
> +            mos6522_update_irq(s);
> +        }
>           break;
>       case VIA_REG_T1CH:
>           val = get_counter(s, &s->timers[0], now) >> 8;
> @@ -252,8 +242,11 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
>           break;
>       case VIA_REG_T2CL:
>           val = get_counter(s, &s->timers[1], now) & 0xff;
> -        s->ifr &= ~T2_INT;
> -        mos6522_update_irq(s);
> +        if (s->timers[1].state >= irq) {
> +            s->timers[1].state = irq_cleared;
> +            s->ifr &= ~T2_INT;
> +            mos6522_update_irq(s);
> +        }
>           break;
>       case VIA_REG_T2CH:
>           val = get_counter(s, &s->timers[1], now) >> 8;
> @@ -293,7 +286,7 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>   {
>       MOS6522State *s = opaque;
>       MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(s);
> -    int64_t now;
> +    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>   
>       trace_mos6522_write(addr, val);
>   
> @@ -316,6 +309,7 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>           s->dira = val;
>           break;
>       case VIA_REG_T1CL:
> +        get_counter(s, &s->timers[0], now);
>           s->timers[0].latch = (s->timers[0].latch & 0xff00) | val;
>           break;
>       case VIA_REG_T1CH:
> @@ -324,12 +318,15 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>           set_counter(s, &s->timers[0], s->timers[0].latch);
>           break;
>       case VIA_REG_T1LL:
> +        get_counter(s, &s->timers[0], now);
>           s->timers[0].latch = (s->timers[0].latch & 0xff00) | val;
>           break;
>       case VIA_REG_T1LH:
> +        get_counter(s, &s->timers[0], now);
>           s->timers[0].latch = (s->timers[0].latch & 0xff) | (val << 8);
>           break;
>       case VIA_REG_T2CL:
> +        get_counter(s, &s->timers[1], now);
>           s->timers[1].latch = (s->timers[1].latch & 0xff00) | val;
>           break;
>       case VIA_REG_T2CH:
> @@ -342,7 +339,6 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>           break;
>       case VIA_REG_ACR:
>           s->acr = val;
> -        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>           mos6522_timer1_update(s, &s->timers[0], now);
>           mos6522_timer2_update(s, &s->timers[1], now);
>           break;
> @@ -350,7 +346,18 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>           s->pcr = val;
>           break;
>       case VIA_REG_IFR:
> -        /* reset bits */
> +        if (val & T1_INT) {
> +            get_counter(s, &s->timers[0], now);
> +            if ((s->ifr & T1_INT) && s->timers[0].state == irq) {
> +                s->timers[0].state = irq_cleared;
> +            }
> +        }
> +        if (val & T2_INT) {
> +            get_counter(s, &s->timers[1], now);
> +            if ((s->ifr & T2_INT) && s->timers[1].state == irq) {
> +                s->timers[1].state = irq_cleared;
> +            }
> +        }
>           s->ifr &= ~val;
>           mos6522_update_irq(s);
>           break;
> @@ -364,7 +371,6 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>           }
>           mos6522_update_irq(s);
>           /* if IER is modified starts needed timers */
> -        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>           mos6522_timer1_update(s, &s->timers[0], now);
>           mos6522_timer2_update(s, &s->timers[1], now);
>           break;
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index d0a89eb059..6c1bb02150 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -103,7 +103,7 @@ imx7_gpr_write(uint64_t offset, uint64_t value) "addr 0x%08" PRIx64 "value 0x%08
>   
>   # mos6522.c
>   mos6522_set_counter(int index, unsigned int val) "T%d.counter=%d"
> -mos6522_get_next_irq_time(uint16_t latch, int64_t d, int64_t delta) "latch=%d counter=0x%"PRId64 " delta_next=0x%"PRId64
> +mos6522_get_next_irq_time(uint16_t latch, int64_t load_time, int64_t next_time) "latch=%d counter=%" PRId64 " next_time=%" PRId64
>   mos6522_set_sr_int(void) "set sr_int"
>   mos6522_write(uint64_t addr, uint64_t val) "reg=0x%"PRIx64 " val=0x%"PRIx64
>   mos6522_read(uint64_t addr, unsigned val) "reg=0x%"PRIx64 " val=0x%x"
> diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
> index 94b1dc324c..4dbba6b273 100644
> --- a/include/hw/misc/mos6522.h
> +++ b/include/hw/misc/mos6522.h
> @@ -73,6 +73,12 @@
>   #define VIA_REG_IER     0x0e
>   #define VIA_REG_ANH     0x0f
>   
> +enum timer_state {
> +    decrement,
> +    irq,
> +    irq_cleared,
> +};
> +
>   /**
>    * MOS6522Timer:
>    * @counter_value: counter value at load time
> @@ -85,7 +91,7 @@ typedef struct MOS6522Timer {
>       int64_t next_irq_time;
>       uint64_t frequency;
>       QEMUTimer *timer;
> -    bool oneshot_fired;
> +    enum timer_state state;
>   } MOS6522Timer;
>   
>   /**

Unfortunately the datasheet I was using for reference doesn't appear to have the 
relevant detail here. Have you got a reference to the datasheet you're using which 
shows what happens to the timers at the zero crossing point?


ATB,

Mark.

