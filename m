Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C37A3300E69
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 22:01:48 +0100 (CET)
Received: from localhost ([::1]:51178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l33Yx-0003r8-Rm
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 16:01:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l33MU-0008Nx-Oq; Fri, 22 Jan 2021 15:48:54 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:59148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l33MS-00043L-5t; Fri, 22 Jan 2021 15:48:54 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 40339C602E6;
 Fri, 22 Jan 2021 21:48:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1611348529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=chIzq8MEXdiAW6O6Ymh0ZQmZM6DvTGAkWe/ozEQ+0lY=;
 b=CsYsbXavSj9HGbLQ0yZY/pHBO8o9xPw09mpXXU0Ne2JjWFtb+sdSLKMiq4XQNZZYYxALst
 lPL3WeoNw+xMN8wpL5GWD3LE8gjf/uPLY6rYD5tYSKYtC/Tr++I+8R1KWsv1gNdqow2nvC
 YdI6FFqWpeeKUGPpDFfsnoiXn76qQs4GwJjlYIAUofkC7WiWoqI9Ruq9JwdhEmEWidQh99
 X3mYvbQwNfB44So5byw8kQqarpSpmeaV8AW0bkBKN4019AABvandBqZDXBV+6zRUrBL/KD
 Yii2U/fhwJ45Ndesn5+XMtJeECuJHggvNm1svu+VsSBz5gSNrt2mNKfDiWLXfQ==
Date: Fri, 22 Jan 2021 21:49:10 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 19/25] hw/timer/cmsdk-apb-dualtimer: Convert to use Clock
 input
Message-ID: <20210122204910.xadaf4zutpbu4qp5@sekoia-pc.home.lmichel.fr>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-20-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121190622.22000-20-peter.maydell@linaro.org>
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19:06 Thu 21 Jan     , Peter Maydell wrote:
> Switch the CMSDK APB dualtimer device over to using its Clock input;
> the pclk-frq property is now ignored.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/cmsdk-apb-dualtimer.c | 42 ++++++++++++++++++++++++++++++----
>  1 file changed, 37 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/timer/cmsdk-apb-dualtimer.c b/hw/timer/cmsdk-apb-dualtimer.c
> index 781b496037b..828127b366f 100644
> --- a/hw/timer/cmsdk-apb-dualtimer.c
> +++ b/hw/timer/cmsdk-apb-dualtimer.c
> @@ -106,6 +106,22 @@ static void cmsdk_apb_dualtimer_update(CMSDKAPBDualTimer *s)
>      qemu_set_irq(s->timerintc, timintc);
>  }
>  
> +static int cmsdk_dualtimermod_divisor(CMSDKAPBDualTimerModule *m)
> +{
> +    /* Return the divisor set by the current CONTROL.PRESCALE value */
> +    switch (FIELD_EX32(m->control, CONTROL, PRESCALE)) {
> +    case 0:
> +        return 1;
> +    case 1:
> +        return 16;
> +    case 2:
> +    case 3: /* UNDEFINED, we treat like 2 (and complained when it was set) */
> +        return 256;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
>  static void cmsdk_dualtimermod_write_control(CMSDKAPBDualTimerModule *m,
>                                               uint32_t newctrl)
>  {
> @@ -146,7 +162,7 @@ static void cmsdk_dualtimermod_write_control(CMSDKAPBDualTimerModule *m,
>          default:
>              g_assert_not_reached();
>          }
> -        ptimer_set_freq(m->timer, m->parent->pclk_frq / divisor);
> +        ptimer_set_period_from_clock(m->timer, m->parent->timclk, divisor);

Just a small cosmetic note, maybe you can use your new
cmsdk_dualtimermod_divisor function to factor out the switch above?
Something like:

if (changed & R_CONTROL_PRESCALE_MASK) {
    if (FIELD_EX32(newctrl, CONTROL, PRESCALE) == 3) {
        qemu_log_mask(LOG_GUEST_ERROR,
                      "CMSDK APB dual-timer: CONTROL.PRESCALE==0b11"
                      " is undefined behaviour\n");
    }

    ptimer_set_period_from_clock(m->timer, m->parent->timclk,
                                 cmsdk_dualtimermod_divisor(m));
}

With or without this modification:
Reviewed-by: Luc Michel <luc@lmichel.fr>


Luc

>      }
>  
>      if (changed & R_CONTROL_MODE_MASK) {
> @@ -414,7 +430,8 @@ static void cmsdk_dualtimermod_reset(CMSDKAPBDualTimerModule *m)
>       * limit must both be set to 0xffff, so we wrap at 16 bits.
>       */
>      ptimer_set_limit(m->timer, 0xffff, 1);
> -    ptimer_set_freq(m->timer, m->parent->pclk_frq);
> +    ptimer_set_period_from_clock(m->timer, m->parent->timclk,
> +                                 cmsdk_dualtimermod_divisor(m));
>      ptimer_transaction_commit(m->timer);
>  }
>  
> @@ -432,6 +449,20 @@ static void cmsdk_apb_dualtimer_reset(DeviceState *dev)
>      s->timeritop = 0;
>  }
>  
> +static void cmsdk_apb_dualtimer_clk_update(void *opaque)
> +{
> +    CMSDKAPBDualTimer *s = CMSDK_APB_DUALTIMER(opaque);
> +    int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(s->timermod); i++) {
> +        CMSDKAPBDualTimerModule *m = &s->timermod[i];
> +        ptimer_transaction_begin(m->timer);
> +        ptimer_set_period_from_clock(m->timer, m->parent->timclk,
> +                                     cmsdk_dualtimermod_divisor(m));
> +        ptimer_transaction_commit(m->timer);
> +    }
> +}
> +
>  static void cmsdk_apb_dualtimer_init(Object *obj)
>  {
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> @@ -446,7 +477,8 @@ static void cmsdk_apb_dualtimer_init(Object *obj)
>      for (i = 0; i < ARRAY_SIZE(s->timermod); i++) {
>          sysbus_init_irq(sbd, &s->timermod[i].timerint);
>      }
> -    s->timclk = qdev_init_clock_in(DEVICE(s), "TIMCLK", NULL, NULL);
> +    s->timclk = qdev_init_clock_in(DEVICE(s), "TIMCLK",
> +                                   cmsdk_apb_dualtimer_clk_update, s);
>  }
>  
>  static void cmsdk_apb_dualtimer_realize(DeviceState *dev, Error **errp)
> @@ -454,8 +486,8 @@ static void cmsdk_apb_dualtimer_realize(DeviceState *dev, Error **errp)
>      CMSDKAPBDualTimer *s = CMSDK_APB_DUALTIMER(dev);
>      int i;
>  
> -    if (s->pclk_frq == 0) {
> -        error_setg(errp, "CMSDK APB timer: pclk-frq property must be set");
> +    if (!clock_has_source(s->timclk)) {
> +        error_setg(errp, "CMSDK APB dualtimer: TIMCLK clock must be connected");
>          return;
>      }
>  
> -- 
> 2.20.1
> 

-- 

