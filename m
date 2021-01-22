Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC5C300E6F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 22:03:10 +0100 (CET)
Received: from localhost ([::1]:53948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l33aH-00057Y-Js
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 16:03:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l33OW-0002Qu-0e; Fri, 22 Jan 2021 15:51:00 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:59586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l33OS-0004yF-TC; Fri, 22 Jan 2021 15:50:59 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id BAC03C602E6;
 Fri, 22 Jan 2021 21:50:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1611348653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nwhTb5hRhE9sP4Jq8+AVrFKAdewtctj+NqJl54WNC5Q=;
 b=O3GKEaHH+EESnikQTNOqpJQSEM06Gebuo/cLdJg0ffRW1m1zV1EAjx6mdQlZ+KgCX1EM+P
 ypeCvBN/rrpnNO3sCz272YF11sL4BRzO6EXiLnaNT8L3NqV9VPvYVYIYSR1lUcEJiw6eEu
 UbqaIv/oGecxhHlOq5sLhILUmC5BY4kgOgiJ6Qb1sZlLDmdiNYEr+MSzh1/Ky20ob3ZLXq
 9t+Q68NvcZCibV27kYZulTwAt0gvTAbixqXgzUnnf9ldAKyX38NHxB4ejDtruFQjNlzYCM
 F4Q6SjA/jxd9tgkus8Dspk2dEjRwiJehHR++RcN2Fd0X7jpDqf4qr0ZrjabDLw==
Date: Fri, 22 Jan 2021 21:51:15 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 20/25] hw/watchdog/cmsdk-apb-watchdog: Convert to use
 Clock input
Message-ID: <20210122205115.e7b3dhu5jm7gblta@sekoia-pc.home.lmichel.fr>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-21-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121190622.22000-21-peter.maydell@linaro.org>
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
> Switch the CMSDK APB watchdog device over to using its Clock input;
> the wdogclk_frq property is now ignored.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  hw/watchdog/cmsdk-apb-watchdog.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/watchdog/cmsdk-apb-watchdog.c b/hw/watchdog/cmsdk-apb-watchdog.c
> index b03bcb73628..9cad0c67da4 100644
> --- a/hw/watchdog/cmsdk-apb-watchdog.c
> +++ b/hw/watchdog/cmsdk-apb-watchdog.c
> @@ -310,6 +310,15 @@ static void cmsdk_apb_watchdog_reset(DeviceState *dev)
>      ptimer_transaction_commit(s->timer);
>  }
>  
> +static void cmsdk_apb_watchdog_clk_update(void *opaque)
> +{
> +    CMSDKAPBWatchdog *s = CMSDK_APB_WATCHDOG(opaque);
> +
> +    ptimer_transaction_begin(s->timer);
> +    ptimer_set_period_from_clock(s->timer, s->wdogclk, 1);
> +    ptimer_transaction_commit(s->timer);
> +}
> +
>  static void cmsdk_apb_watchdog_init(Object *obj)
>  {
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> @@ -319,7 +328,8 @@ static void cmsdk_apb_watchdog_init(Object *obj)
>                            s, "cmsdk-apb-watchdog", 0x1000);
>      sysbus_init_mmio(sbd, &s->iomem);
>      sysbus_init_irq(sbd, &s->wdogint);
> -    s->wdogclk = qdev_init_clock_in(DEVICE(s), "WDOGCLK", NULL, NULL);
> +    s->wdogclk = qdev_init_clock_in(DEVICE(s), "WDOGCLK",
> +                                    cmsdk_apb_watchdog_clk_update, s);
>  
>      s->is_luminary = false;
>      s->id = cmsdk_apb_watchdog_id;
> @@ -329,9 +339,9 @@ static void cmsdk_apb_watchdog_realize(DeviceState *dev, Error **errp)
>  {
>      CMSDKAPBWatchdog *s = CMSDK_APB_WATCHDOG(dev);
>  
> -    if (s->wdogclk_frq == 0) {
> +    if (!clock_has_source(s->wdogclk)) {
>          error_setg(errp,
> -                   "CMSDK APB watchdog: wdogclk-frq property must be set");
> +                   "CMSDK APB watchdog: WDOGCLK clock must be connected");
>          return;
>      }
>  
> @@ -342,7 +352,7 @@ static void cmsdk_apb_watchdog_realize(DeviceState *dev, Error **errp)
>                             PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
>  
>      ptimer_transaction_begin(s->timer);
> -    ptimer_set_freq(s->timer, s->wdogclk_frq);
> +    ptimer_set_period_from_clock(s->timer, s->wdogclk, 1);
>      ptimer_transaction_commit(s->timer);
>  }
>  
> -- 
> 2.20.1
> 

-- 

