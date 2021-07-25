Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ACE3D4CA1
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 10:07:17 +0200 (CEST)
Received: from localhost ([::1]:51318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7ZAK-0005wj-Fu
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 04:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1m7Z9X-0004zI-OO; Sun, 25 Jul 2021 04:06:27 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:50922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1m7Z9V-00085B-C3; Sun, 25 Jul 2021 04:06:27 -0400
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id DB7B6C6019D;
 Sun, 25 Jul 2021 10:06:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1627200379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YkSShU/WfQKmU+QoAFuwA07yQuUmCePmPC02tRDmL7s=;
 b=O3N1THtxXww/SE451FmYSj/UXwBl5bOcZmX4fCQGgXoNB3AO1OsCqtVOiuqjFT1V2atng4
 0DQRkZWHGDhE2dAGkvJjoGfnu/377LiSryDb5DsLkppWuLil5qb3Tx9kKG31ffAU6lORj2
 uCGw1O6lJZwhb/E3/BKdqeF1KpMHmxK+aEN9Gw/bDqoAV+ZCBqPa0FjN2Fy0mc5yhjMaoN
 WErMy/G3YK3NHK6LtyQbHnOmhBHvJFzobVrYN+uSQT1Lc7E3LZ3DYtWcIddJLroUlobuQ9
 uqPdXw+tO2gcfg4sSsTD7nqn0STnHz0UTdznovM+6hH3ROBi5bzCUEEDvcEgcw==
Date: Sun, 25 Jul 2021 10:08:17 +0200
From: Luc Michel <luc@lmichel.fr>
To: Sebastian Huber <sebastian.huber@embedded-brains.de>
Subject: Re: [PATCH] hw/intc/arm_gic: Fix set/clear pending of PPI/SPI
Message-ID: <20210725080817.ivlkutnow7sojoyd@sekoia-pc.home.lmichel.fr>
References: <20210709094948.60344-1-sebastian.huber@embedded-brains.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709094948.60344-1-sebastian.huber@embedded-brains.de>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Sebastian,

On 11:49 Fri 09 Jul     , Sebastian Huber wrote:
> According to the GICv3 specification register GICD_ISPENDR0 is Banked for each
You're referring to GICv3 but actually modifying GICv2 model. Having a
look at GICv2 reference manual, your affirmation still hold though.

> connected PE with GICR_TYPER.Processor_Number < 8.  For Qemu this is the case
> since GIC_NCPU == 8.
This is GICv3 specific. For GICv2 the architectural limit is 8 CPUs.

> 
> For SPI, make the interrupt pending on all CPUs and not just the processor
> targets of the interrupt.
So you're not referring to GICD_ISPENDR0 anymore right? SPIs starts at
IRQ number 32.  GICD_ISPENDR0 is for IRQs 0 to 31, which are SGIs and
PPIs (This is why this reg is banked, meaning that a CPU can only
trigger a PPI of its own). Maybe make it clear in your commit message
that you are now talking about GICD_ISPENDRn with n > 0

Moreover your statement regarding SPIs seems weird to me. Setting an
SPI pending (in GICD_ISPENDRn with n > 0) should really be like having
it being triggered from the IRQ line. It makes it pending in the
distributor. The distributor then forward it as normal. Why the
GICD_ITARGETSRn configuration should be ignored in this case? At least I
can't find any reference to such a behaviour in the reference manual.

> 
> This behaviour is at least present on the i.MX7D which uses an Cortex-A7MPCore.
Which has a GICv2, not a v3 right?

> 
> Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
> ---
>  hw/intc/arm_gic.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index a994b1f024..8e377bac59 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -1294,12 +1294,14 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
>  
>          for (i = 0; i < 8; i++) {
>              if (value & (1 << i)) {
> +                int cm = (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
> +
Indeed, I think the current implementation for PPIs is wrong
(GIC_DIST_TARGET(irq + i) is probably 0 in this case, so a set pending
request for a PPI will get incorrectly ignored). So I agree with the irq <
GIC_INTERNAL case. But for SPIs my concerns still hold (see my comment
in the commit message).

>                  if (s->security_extn && !attrs.secure &&
>                      !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
>                      continue; /* Ignore Non-secure access of Group0 IRQ */
>                  }
>  
> -                GIC_DIST_SET_PENDING(irq + i, GIC_DIST_TARGET(irq + i));
> +                GIC_DIST_SET_PENDING(irq + i, cm);
>              }
>          }
>      } else if (offset < 0x300) {
> @@ -1317,11 +1319,10 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
>                  continue; /* Ignore Non-secure access of Group0 IRQ */
>              }
>  
> -            /* ??? This currently clears the pending bit for all CPUs, even
> -               for per-CPU interrupts.  It's unclear whether this is the
> -               corect behavior.  */
>              if (value & (1 << i)) {
> -                GIC_DIST_CLEAR_PENDING(irq + i, ALL_CPU_MASK);
> +                int cm = (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
> +
> +                GIC_DIST_CLEAR_PENDING(irq + i, cm);
I agree with this change too, but you are modifying the GICD_ICPENDRn
register behaviour without mentioning it in the commit message.

Thanks,

-- 
Luc

