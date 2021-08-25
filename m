Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A2A3F717E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 11:11:45 +0200 (CEST)
Received: from localhost ([::1]:57108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIowh-00062X-I9
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 05:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIovm-0005BN-Sd; Wed, 25 Aug 2021 05:10:46 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46328
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIovj-0005zb-Ef; Wed, 25 Aug 2021 05:10:46 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIovJ-00084M-8Y; Wed, 25 Aug 2021 10:10:21 +0100
To: Finn Thain <fthain@linux-m68k.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <9aec7882-0690-7152-e38e-e4c683c433a2@ilande.co.uk>
Date: Wed, 25 Aug 2021 10:10:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <cover.1629799776.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC 00/10] hw/mos6522: VIA timer emulation fixes and improvements
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

> This is a patch series that I started last year. The aim was to try to
> get a monotonic clocksource for Linux/m68k guests. That aim hasn't been
> achieved yet (for q800 machines) but I'm submitting the patch series as
> an RFC because,
> 
>   - It does improve 6522 emulation fidelity.
> 
>   - It allows Linux/m68k to make use of the additional timer that the
>     hardware indeed offers but which QEMU omits. This has several
>     benefits for Linux guests [1].
> 
>   - I see that Mark has been working on timer emulation issues in his
>     github repo [2] and it seems likely that MacOS, NetBSD or A/UX guests
>     will also require better 6522 emulation.
> 
> To make collaboration easier these patches can also be fetched from
> github [3].
> 
> On a real Quadra, accesses to the SY6522 chips are slow because they are
> synchronous with the 783360 Hz "phase 2" clock. In QEMU, they are slow
> only because of the division operation in the timer count calculation.
> 
> This patch series improves the fidelity of the emulated chip, but the
> price is more division ops. I haven't tried to measure this yet.
> 
> The emulated 6522 still deviates from the behaviour of the real thing,
> however. For example, two consecutive accesses to a real 6522 timer
> counter can never yield the same value. This is not true of the 6522 in
> QEMU 6 wherein two consecutive accesses to a timer count register have
> been observed to yield the same value.
> 
> Linux is not particularly robust in the face of a 6522 that deviates
> from the usual behaviour. The problem presently affecting a Linux guest
> is that its 'via' clocksource is prone to monotonicity failure. That is,
> the clocksource counter can jump backwards. This can be observed by
> patching Linux like so:
> 
> diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
> --- a/arch/m68k/mac/via.c
> +++ b/arch/m68k/mac/via.c
> @@ -606,6 +606,8 @@ void __init via_init_clock(void)
>   	clocksource_register_hz(&mac_clk, VIA_CLOCK_FREQ);
>   }
>   
> +static u32 prev_ticks;
> +
>   static u64 mac_read_clk(struct clocksource *cs)
>   {
>   	unsigned long flags;
> @@ -631,6 +633,8 @@ static u64 mac_read_clk(struct clocksource *cs)
>   	count = count_high << 8;
>   	ticks = VIA_TIMER_CYCLES - count;
>   	ticks += clk_offset + clk_total;
> +if (ticks < prev_ticks) pr_warn("%s: %u < %u\n", __func__, ticks, prev_ticks);
> +prev_ticks = ticks;
>   	local_irq_restore(flags);
>   
>   	return ticks;
> 
> This problem can be partly blamed on a 6522 design limitation, which is
> that the timer counter has no overflow register. Hence, if a timer
> counter wraps around and the kernel is late to handle the subsequent
> interrupt, the kernel can't account for any missed ticks.
> 
> On a real Quadra, the kernel mitigates this limitation by minimizing
> interrupt latency. But on QEMU, interrupt latency is unbounded. This
> can't be mitigated by the guest kernel at all and leads to clock drift.
> This can be observed by patching QEMU like so:
> 
> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> --- a/hw/misc/mos6522.c
> +++ b/hw/misc/mos6522.c
> @@ -379,6 +379,12 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>           s->pcr = val;
>           break;
>       case VIA_REG_IFR:
> +        if (val & T1_INT) {
> +            static int64_t last_t1_int_cleared;
> +            int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +            if (now - last_t1_int_cleared > 20000000) printf("\t%s: t1 int clear is late\n", __func__);
> +            last_t1_int_cleared = now;
> +        }
>           /* reset bits */
>           s->ifr &= ~val;
>           mos6522_update_irq(s);
> 
> This logic asserts that, given that Linux/m68k sets CONFIG_HZ to 100,
> the emulator will theoretically see each timer 1 interrupt cleared
> within 20 ms of the previous one. But that deadline is often missed on
> my QEMU host [4].
> 
> On real Mac hardware you could observe the same scenario if a high
> priority interrupt were to sufficiently delay the timer interrupt
> handler. (This is the reason why the VIA1 interrupt priority gets
> increased from level 1 to level 5 when running on Quadras.)
> 
> Anyway, for now, the clocksource monotonicity problem in Linux/mac68k
> guests is still unresolved. Nonetheless, I think this patch series does
> improve the situation.
> 
> [1] I've also been working on some improvements to Linux/m68k based on
> Arnd Bergman's clockevent RFC patch,
> https://lore.kernel.org/linux-m68k/20201008154651.1901126-14-arnd@arndb.de/
> The idea is to add a oneshot clockevent device by making use of the
> second VIA1 timer. This approach should help mitigate the clock drift
> problem as well as assist with GENERIC_CLOCKEVENTS adoption.
> 
> [2] https://github.com/mcayland/qemu/commits/q800.upstream
> 
> [3] https://github.com/fthain/qemu/commits/via-timer/
> 
> [4] This theoretical 20 ms deadline is not missed prior to every
> backwards jump in the clocksource counter. AFAICT, that's because the
> true deadline is somewhat shorter than 20 ms.
> 
> 
> Finn Thain (10):
>    hw/mos6522: Remove get_load_time() methods and functions
>    hw/mos6522: Remove get_counter_value() methods and functions
>    hw/mos6522: Remove redundant mos6522_timer1_update() calls
>    hw/mos6522: Rename timer callback functions
>    hw/mos6522: Don't clear T1 interrupt flag on latch write
>    hw/mos6522: Implement oneshot mode
>    hw/mos6522: Fix initial timer counter reload
>    hw/mos6522: Call mos6522_update_irq() when appropriate
>    hw/mos6522: Avoid using discrepant QEMU clock values
>    hw/mos6522: Synchronize timer interrupt and timer counter
> 
>   hw/misc/mos6522.c         | 232 +++++++++++++++++---------------------
>   hw/misc/trace-events      |   2 +-
>   include/hw/misc/mos6522.h |   9 ++
>   3 files changed, 113 insertions(+), 130 deletions(-)

I just wanted to say that this patchset is obviously the result of a huge amount of 
effort trying to figure out why the clock in Linux/m68k appears to jump backwards in 
QEMU, and certainly references conditions in real hardware that is not explained in 
the datasheet in sufficient detail.

 From my perspective I'd suggest tackling the 2 main issues first: 1) ensuring that 
the clock is monotonic and 2) adding the one shot timer mode. The other fixes/updates 
can then be layered on top once we're confident that the underlying timing mechanism 
works not just for Linux/m68k but also for cuda on PPC.

I'm also slightly suspicious of the if() blocks introduced in mos6522_read() 
introduce via commit cd8843ff25d ("mos6522: fix T1 and T2 timers").

In your comments above you mention:

 > On real Mac hardware you could observe the same scenario if a high
 > priority interrupt were to sufficiently delay the timer interrupt
 > handler. (This is the reason why the VIA1 interrupt priority gets
 > increased from level 1 to level 5 when running on Quadras.)

This isn't currently true for QEMU: if you look at hw/m68k/q800.c you can see that 
the VIA interrupts are hard-wired to levels 1 and 2 respectively. You can change the 
VIA1 interrupt so it is routed to level 5 instead of level 1 with the following diff:

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index ac0a13060b..dc8dbe5c6f 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -281,7 +281,7 @@ static void q800_init(MachineState *machine)
      sysbus_realize_and_unref(sysbus, &error_fatal);
      sysbus_mmio_map(sysbus, 0, VIA_BASE);
      qdev_connect_gpio_out_named(DEVICE(sysbus), "irq", 0,
-                                qdev_get_gpio_in(glue, 0));
+                                qdev_get_gpio_in(glue, 4));
      qdev_connect_gpio_out_named(DEVICE(sysbus), "irq", 1,
                                  qdev_get_gpio_in(glue, 1));

The q800.upstream branch goes further and implements the dynamic interrupt routing 
required by A/UX but the above should be a basic test to see if the increased 
priority helps with your timing issue at all.


ATB,

Mark.

