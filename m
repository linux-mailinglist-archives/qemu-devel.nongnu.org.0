Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5126D3F7021
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:10:41 +0200 (CEST)
Received: from localhost ([::1]:41862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIn3S-00036q-T8
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIn2V-0002GK-0G; Wed, 25 Aug 2021 03:09:35 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46062
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIn2R-00071l-KP; Wed, 25 Aug 2021 03:09:34 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIn20-00072c-4n; Wed, 25 Aug 2021 08:09:09 +0100
To: Finn Thain <fthain@linux-m68k.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <920eddc0e99bf57e7ac540502f863f222c401d2f.1629799776.git.fthain@linux-m68k.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <bd65a745-90bd-3ea2-9214-84dc73d15f52@ilande.co.uk>
Date: Wed, 25 Aug 2021 08:09:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <920eddc0e99bf57e7ac540502f863f222c401d2f.1629799776.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC 03/10] hw/mos6522: Remove redundant mos6522_timer1_update()
 calls
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

> Reads and writes to the TL and TC registers have no immediate effect on
> a running timer, with the exception of a write to TCH. Hence these
> mos6522_timer_update() calls are not needed.
> 
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Perhaps better to flip this description around i.e. mention that the low bytes are 
written to a latch and then the full 16-bit value is transferred to the latch/counter 
when the high byte is written?

Otherwise I think this looks okay.

> ---
>   hw/misc/mos6522.c | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> index ff246b5437..1d4a56077e 100644
> --- a/hw/misc/mos6522.c
> +++ b/hw/misc/mos6522.c
> @@ -234,7 +234,6 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
>           val = s->timers[0].latch & 0xff;
>           break;
>       case VIA_REG_T1LH:
> -        /* XXX: check this */
>           val = (s->timers[0].latch >> 8) & 0xff;
>           break;
>       case VIA_REG_T2CL:
> @@ -303,8 +302,6 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>           break;
>       case VIA_REG_T1CL:
>           s->timers[0].latch = (s->timers[0].latch & 0xff00) | val;
> -        mos6522_timer1_update(s, &s->timers[0],
> -                              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
>           break;
>       case VIA_REG_T1CH:
>           s->timers[0].latch = (s->timers[0].latch & 0xff) | (val << 8);
> @@ -313,14 +310,10 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>           break;
>       case VIA_REG_T1LL:
>           s->timers[0].latch = (s->timers[0].latch & 0xff00) | val;
> -        mos6522_timer1_update(s, &s->timers[0],
> -                              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
>           break;
>       case VIA_REG_T1LH:
>           s->timers[0].latch = (s->timers[0].latch & 0xff) | (val << 8);
>           s->ifr &= ~T1_INT;
> -        mos6522_timer1_update(s, &s->timers[0],
> -                              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
>           break;
>       case VIA_REG_T2CL:
>           s->timers[1].latch = (s->timers[1].latch & 0xff00) | val;
> 


ATB,

Mark.

