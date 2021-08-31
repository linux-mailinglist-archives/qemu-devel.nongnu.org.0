Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5B43FCEFE
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 23:16:10 +0200 (CEST)
Received: from localhost ([::1]:58008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLB73-0007Hd-Oz
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 17:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLB5k-0005yL-91; Tue, 31 Aug 2021 17:14:48 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:55198
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLB5i-0004sc-BQ; Tue, 31 Aug 2021 17:14:47 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLB5E-0001Lk-TZ; Tue, 31 Aug 2021 22:14:17 +0100
To: Finn Thain <fthain@linux-m68k.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <283af572-2157-77c6-2594-8e9e92497346@amsat.org>
 <fb42cb6-117c-c138-c18a-3af7f1d9be6a@linux-m68k.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <4da39536-1acb-05c3-755c-9a30d82d6ace@ilande.co.uk>
Date: Tue, 31 Aug 2021 22:14:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <fb42cb6-117c-c138-c18a-3af7f1d9be6a@linux-m68k.org>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.932,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/08/2021 02:22, Finn Thain wrote:

>> On 8/24/21 12:09 PM, Finn Thain wrote:
>>
>>> On a real Quadra, accesses to the SY6522 chips are slow because they are
>>> synchronous with the 783360 Hz "phase 2" clock. In QEMU, they are slow
>>> only because of the division operation in the timer count calculation.
>>>
>>> This patch series improves the fidelity of the emulated chip, but the
>>> price is more division ops. I haven't tried to measure this yet.
>>>
>>> The emulated 6522 still deviates from the behaviour of the real thing,
>>> however. For example, two consecutive accesses to a real 6522 timer
>>> counter can never yield the same value. This is not true of the 6522 in
>>> QEMU 6 wherein two consecutive accesses to a timer count register have
>>> been observed to yield the same value.
>>>
>>> Linux is not particularly robust in the face of a 6522 that deviates
>>> from the usual behaviour. The problem presently affecting a Linux guest
>>> is that its 'via' clocksource is prone to monotonicity failure. That is,
>>> the clocksource counter can jump backwards. This can be observed by
>>> patching Linux like so:
>>>
>>> diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
>>> --- a/arch/m68k/mac/via.c
>>> +++ b/arch/m68k/mac/via.c
>>> @@ -606,6 +606,8 @@ void __init via_init_clock(void)
>>>   	clocksource_register_hz(&mac_clk, VIA_CLOCK_FREQ);
>>>   }
>>>   
>>> +static u32 prev_ticks;
>>> +
>>>   static u64 mac_read_clk(struct clocksource *cs)
>>>   {
>>>   	unsigned long flags;
>>> @@ -631,6 +633,8 @@ static u64 mac_read_clk(struct clocksource *cs)
>>>   	count = count_high << 8;
>>>   	ticks = VIA_TIMER_CYCLES - count;
>>>   	ticks += clk_offset + clk_total;
>>> +if (ticks < prev_ticks) pr_warn("%s: %u < %u\n", __func__, ticks, prev_ticks);
>>> +prev_ticks = ticks;
>>>   	local_irq_restore(flags);
>>>   
>>>   	return ticks;
>>>
>>> This problem can be partly blamed on a 6522 design limitation, which is
>>> that the timer counter has no overflow register. Hence, if a timer
>>> counter wraps around and the kernel is late to handle the subsequent
>>> interrupt, the kernel can't account for any missed ticks.
>>>
>>> On a real Quadra, the kernel mitigates this limitation by minimizing
>>> interrupt latency. But on QEMU, interrupt latency is unbounded. This
>>> can't be mitigated by the guest kernel at all and leads to clock drift.
>>> This can be observed by patching QEMU like so:
>>>
>>> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
>>> --- a/hw/misc/mos6522.c
>>> +++ b/hw/misc/mos6522.c
>>> @@ -379,6 +379,12 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>>>           s->pcr = val;
>>>           break;
>>>       case VIA_REG_IFR:
>>> +        if (val & T1_INT) {
>>> +            static int64_t last_t1_int_cleared;
>>> +            int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>>> +            if (now - last_t1_int_cleared > 20000000) printf("\t%s: t1 int clear is late\n", __func__);
>>> +            last_t1_int_cleared = now;
>>> +        }
>>>           /* reset bits */
>>>           s->ifr &= ~val;
>>>           mos6522_update_irq(s);
>>>
>>> This logic asserts that, given that Linux/m68k sets CONFIG_HZ to 100,
>>> the emulator will theoretically see each timer 1 interrupt cleared
>>> within 20 ms of the previous one. But that deadline is often missed on
>>> my QEMU host [4].
>>
>> I wonder if using QEMU ptimer wouldn't help here, instead of
>> calling qemu_clock_get_ns() and doing the math by hand:
>>
>> /* Starting to run with/setting counter to "0" won't trigger immediately,
>>   * but after a one period for both oneshot and periodic modes.  */
>> #define PTIMER_POLICY_NO_IMMEDIATE_TRIGGER  (1 << 2)
>>
>> /* Starting to run with/setting counter to "0" won't re-load counter
>>   * immediately, but after a one period.  */
>> #define PTIMER_POLICY_NO_IMMEDIATE_RELOAD   (1 << 3)
>>
>> /* Make counter value of the running timer represent the actual value and
>>   * not the one less.  */
>> #define PTIMER_POLICY_NO_COUNTER_ROUND_DOWN (1 << 4)
>>
> 
> It's often the case that a conversion to a new API is trivial for someone
> who understands that API. But I still haven't got my head around the
> implementation (hw/core/ptimer.c).
> 
> So I agree the ptimer API could simplify mos6522.c but adopting it is not
> trivial for me.
> 
> QEMU's 6522 device does not attempt to model the relationship between the
> "phase two" clock and timer counters and timer interrupts. I haven't
> attempted to fix these deviations at all, as that's not trivial either.
> 
> But using the ptimer API could potentially make it easier to address those
> fidelity issues.

I had another look at the mos6522 code this evening, and certainly whilst there are 
things that could be improved, I'm still puzzled as to how you would see time going 
backwards:

- qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) eventually ends up calling cpu_get_clock() 
where the comment for the function is "Return the monotonic time elapsed in VM"

- get_next_irq_time() calculates the counter value for the current clock, adds the 
value of the counter (compensating for wraparound) and calculates the clock for the 
next IRQ

- Using the current clock instead of ti->next_irq_time in the timer callbacks should 
compensate for any latency when the callback is invoked

You mentioned that the OS may compensate for the fact that the 6522 doesn't have an 
overflow flag: can you explain more as to how this works in Linux? Is the problem 
here that even if you read the counter value in the interrupt handler to work out the 
latency, the counter may still have already wrapped?


ATB,

Mark.

