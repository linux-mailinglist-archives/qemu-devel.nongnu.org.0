Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CF93F7054
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:24:45 +0200 (CEST)
Received: from localhost ([::1]:47344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInHA-0001Ta-4w
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mInDX-0001Vd-Re; Wed, 25 Aug 2021 03:20:59 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46108
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mInDU-0000Ak-Oo; Wed, 25 Aug 2021 03:20:59 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mInD4-00077r-MQ; Wed, 25 Aug 2021 08:20:36 +0100
To: Finn Thain <fthain@linux-m68k.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <b87cf2a2841d4597cc779df5dfce500c51a172ef.1629799776.git.fthain@linux-m68k.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <bd94f1e6-4f15-b4d0-ddc8-fa98e2e3d780@ilande.co.uk>
Date: Wed, 25 Aug 2021 08:20:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b87cf2a2841d4597cc779df5dfce500c51a172ef.1629799776.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC 05/10] hw/mos6522: Don't clear T1 interrupt flag on latch
 write
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

> The Synertek datasheet says, "A write to T1L-H loads an 8-bit count value
> into the latch. A read of T1L-H transfers the contents of the latch to
> the data bus. Neither operation has an affect [sic] on the interrupt
> flag."
> 
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
>   hw/misc/mos6522.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> index c0d6bee4cc..ffff8991f4 100644
> --- a/hw/misc/mos6522.c
> +++ b/hw/misc/mos6522.c
> @@ -313,7 +313,6 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>           break;
>       case VIA_REG_T1LH:
>           s->timers[0].latch = (s->timers[0].latch & 0xff) | (val << 8);
> -        s->ifr &= ~T1_INT;
>           break;
>       case VIA_REG_T2CL:
>           s->timers[1].latch = (s->timers[1].latch & 0xff00) | val;

Hmmm. The reference document I used for QEMU's 6522 device is at 
http://archive.6502.org/datasheets/mos_6522_preliminary_nov_1977.pdf and according to 
page 6 and the section "Writing the Timer 1 Registers" writing to the high byte of 
the latch does indeed clear the T1 interrupt flag.

Side note: there is reference in Gary Davidian's excellent CHM video that 6522s 
obtained from different manufacturers had different behaviours, and there are also 
web pages mentioning that 6522s integrated as part of other silicon e.g. IOSB/CUDA 
also had their own bugs... :/


ATB,

Mark.

