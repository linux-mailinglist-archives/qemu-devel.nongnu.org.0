Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC40B3F7112
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 10:24:37 +0200 (CEST)
Received: from localhost ([::1]:59722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIoD6-0002zr-Uq
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 04:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIoC0-000278-Ae; Wed, 25 Aug 2021 04:23:28 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46254
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIoBy-00034y-Ni; Wed, 25 Aug 2021 04:23:28 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIoBW-0007hi-PR; Wed, 25 Aug 2021 09:23:04 +0100
To: Finn Thain <fthain@linux-m68k.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <ae3528be683e131503ea272847a4490d505739ca.1629799776.git.fthain@linux-m68k.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <a0042d81-d7ed-ddd1-cf40-254c63ef4843@ilande.co.uk>
Date: Wed, 25 Aug 2021 09:23:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ae3528be683e131503ea272847a4490d505739ca.1629799776.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC 07/10] hw/mos6522: Fix initial timer counter reload
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

> The first reload of timer 1 is early by half of a clock cycle as it gets
> measured from a falling edge. By contrast, the succeeding reloads are
> measured from rising edge to rising edge.
> 
> Neglecting that complication, the behaviour of the counter should be the
> same from one reload to the next. The sequence is always:
> 
> N, N-1, N-2, ... 2, 1, 0, -1, N, N-1, N-2, ...
> 
> But at the first reload, the present driver does this instead:
> 
> N, N-1, N-2, ... 2, 1, 0, -1, N-1, N-2, ...
> 
> Fix this deviation for both timer 1 and timer 2, and allow for the fact
> that on a real 6522 the timer 2 counter is not reloaded when it wraps.
> 
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
>   hw/misc/mos6522.c | 19 +++++++++++--------
>   1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> index 5b1657ac0d..0a241fe9f8 100644
> --- a/hw/misc/mos6522.c
> +++ b/hw/misc/mos6522.c
> @@ -63,15 +63,16 @@ static unsigned int get_counter(MOS6522State *s, MOS6522Timer *ti)
>       if (ti->index == 0) {
>           /* the timer goes down from latch to -1 (period of latch + 2) */
>           if (d <= (ti->counter_value + 1)) {
> -            counter = (ti->counter_value - d) & 0xffff;
> +            counter = ti->counter_value - d;
>           } else {
> -            counter = (d - (ti->counter_value + 1)) % (ti->latch + 2);
> -            counter = (ti->latch - counter) & 0xffff;
> +            int64_t d_post_reload = d - (ti->counter_value + 2);
> +            /* XXX this calculation assumes that ti->latch has not changed */
> +            counter = ti->latch - (d_post_reload % (ti->latch + 2));
>           }
>       } else {
> -        counter = (ti->counter_value - d) & 0xffff;
> +        counter = ti->counter_value - d;
>       }
> -    return counter;
> +    return counter & 0xffff;
>   }
>   
>   static void set_counter(MOS6522State *s, MOS6522Timer *ti, unsigned int val)
> @@ -103,11 +104,13 @@ static int64_t get_next_irq_time(MOS6522State *s, MOS6522Timer *ti,
>   
>       /* the timer goes down from latch to -1 (period of latch + 2) */
>       if (d <= (ti->counter_value + 1)) {
> -        counter = (ti->counter_value - d) & 0xffff;
> +        counter = ti->counter_value - d;
>       } else {
> -        counter = (d - (ti->counter_value + 1)) % (ti->latch + 2);
> -        counter = (ti->latch - counter) & 0xffff;
> +        int64_t d_post_reload = d - (ti->counter_value + 2);
> +        /* XXX this calculation assumes that ti->latch has not changed */
> +        counter = ti->latch - (d_post_reload % (ti->latch + 2));
>       }
> +    counter &= 0xffff;
>   
>       /* Note: we consider the irq is raised on 0 */
>       if (counter == 0xffff) {

I think the code looks right, but I couldn't see an explicit reference to this 
behaviour in http://archive.6502.org/datasheets/mos_6522_preliminary_nov_1977.pdf. 
Presumably this matches what you've observed on real hardware?


ATB,

Mark.

