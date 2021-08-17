Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 981233EEFE7
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 18:00:15 +0200 (CEST)
Received: from localhost ([::1]:33786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG1Ve-0003xk-0e
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 12:00:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mG1Qt-0008VJ-14; Tue, 17 Aug 2021 11:55:19 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:54580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mG1Ql-0004SU-EV; Tue, 17 Aug 2021 11:55:16 -0400
Received: from [192.168.15.170] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 215DE2089E;
 Tue, 17 Aug 2021 15:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1629215706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CKTN9U2yy7pc3UpTF3S2hLMMlCBpGldsU+8/FcWJ6oc=;
 b=VvxRsum2/eO9G+3P1A9jk7QVcvP3NlW6l2waEpB1vhBsGYWCWxtZlumMkLIwd58tbE+5/h
 nfl+vcgDLpBOew9tcQVqG5FB1tiN5orMSgyiIMEljBLUKHXE9hQOBiZe6ba4+VSJr1ef3f
 LyZf+Gs9Tu1Fq+UyenPWWF8IkvtxMM0=
Subject: Re: [PATCH for-6.2 21/25] hw/timer/armv7m_systick: Use clock inputs
 instead of system_clock_scale
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-22-peter.maydell@linaro.org>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <fabba7f1-1607-8cda-00e5-77f656deef55@greensocs.com>
Date: Tue, 17 Aug 2021 17:55:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210812093356.1946-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Alistair Francis <alistair@alistair23.me>, Luc Michel <luc@lmichel.fr>,
 Joel Stanley <joel@jms.id.au>, Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/12/21 11:33 AM, Peter Maydell wrote:
> Now that all users of the systick devices wire up the clock inputs,
> use those instead of the system_clock_scale and the hardwired 1MHz
> value for the reference clock.
> 
> This will fix various board models where we were incorrectly
> providing a 1MHz reference clock instead of some other value or
> instead of providing no reference clock at all.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/armv7m_systick.c | 110 ++++++++++++++++++++++++++++----------
>  1 file changed, 82 insertions(+), 28 deletions(-)
> 
> diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
> index e43f74114e8..39cca206cfd 100644
> --- a/hw/timer/armv7m_systick.c
> +++ b/hw/timer/armv7m_systick.c
> @@ -18,25 +18,29 @@
>  #include "qemu/timer.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
> +#include "qapi/error.h"
>  #include "trace.h"
>  
> -/* qemu timers run at 1GHz.   We want something closer to 1MHz.  */
> -#define SYSTICK_SCALE 1000ULL
> -
>  #define SYSTICK_ENABLE    (1 << 0)
>  #define SYSTICK_TICKINT   (1 << 1)
>  #define SYSTICK_CLKSOURCE (1 << 2)
>  #define SYSTICK_COUNTFLAG (1 << 16)
>  
> +#define SYSCALIB_NOREF (1U << 31)
> +#define SYSCALIB_SKEW (1U << 30)
> +
>  int system_clock_scale;
>  
> -/* Conversion factor from qemu timer to SysTick frequencies.  */
> -static inline int64_t systick_scale(SysTickState *s)
> +static void systick_set_period_from_clock(SysTickState *s)
>  {
> +    /*
> +     * Set the ptimer period from whichever clock is selected.
> +     * Must be called from within a ptimer transaction block.
> +     */
>      if (s->control & SYSTICK_CLKSOURCE) {
> -        return system_clock_scale;
> +        ptimer_set_period_from_clock(s->ptimer, s->cpuclk, 1);
>      } else {
> -        return 1000;
> +        ptimer_set_period_from_clock(s->ptimer, s->refclk, 1);
>      }
>  }
>  
> @@ -83,7 +87,27 @@ static MemTxResult systick_read(void *opaque, hwaddr addr, uint64_t *data,
>          val = ptimer_get_count(s->ptimer);
>          break;
>      case 0xc: /* SysTick Calibration Value.  */
> -        val = 10000;
> +        /*
> +         * In real hardware it is possible to make this register report
> +         * a different value from what the reference clock is actually
> +         * running at. We don't model that (which usually happens due
> +         * to integration errors in the real hardware) and instead always
> +         * report the theoretical correct value as described in the
> +         * knowledgebase article at
> +         * https://developer.arm.com/documentation/ka001325/latest
> +         * If necessary, we could implement an extra QOM property on this
> +         * device to force the STCALIB value to something different from
> +         * the "correct" value.
> +         */
> +        if (!clock_has_source(s->refclk)) {
> +            val = SYSCALIB_NOREF;
> +            break;
> +        }
> +        val = clock_ns_to_ticks(s->refclk, 10 * SCALE_MS) - 1;

According to
https://developer.arm.com/documentation/ddi0403/d/System-Level-Architecture/System-Address-Map/The-system-timer--SysTick/SysTick-Calibration-value-Register--SYST-CALIB
, the field is 24bits wide.

Should we prevent an overflow into the reserved bits and other fields ?
by doing something like this:
           val &= SYSCALIB_TENMS;
with the following #define with the other ones, above.
    #define SYSCALIB_TENMS ((1U << 24) - 1)

Note, the overflow would happen around ~1.68GHz refclk frequency, it is
probably a config that will never happen. I'm not sure if we should care
or do something if this happens because it is probably an error
somewhere else.

> +        if (clock_ticks_to_ns(s->refclk, val + 1) != 10 * SCALE_MS) {
> +            /* report that tick count does not yield exactly 10ms */
> +            val |= SYSCALIB_SKEW;
> +        }
>          break;

Otherwise the patch looks great.

Thanks,
Damien


