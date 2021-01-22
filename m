Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3949300DCB
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:34:33 +0100 (CET)
Received: from localhost ([::1]:33562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l338a-0000NI-Md
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:34:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l337A-0007lu-Am; Fri, 22 Jan 2021 15:33:04 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:55856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l3378-0005Yi-5j; Fri, 22 Jan 2021 15:33:03 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id AFDA3C602E6;
 Fri, 22 Jan 2021 21:32:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1611347579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=faOVIinSqea55p9lVc+8t9GiMOiIjuL60TaUy5QwqYQ=;
 b=NthCbdQ7dkhnqagpBskgROsqy0FiM6tFIDmXtf2rQMomEc+zlFr+ObmF5Q2H3evtW4Yrf7
 Z340F6d+v/FNafmRkFYT8qxiWwYNAXBBHTNwqLwspBBgWJDlEuHo5XQKmFp7qaQblXk9df
 hZbTmURETBJ/n+KqtygrzAbmHjSRvp8dQo0UKrAX/JvH0yqcySMa6XfKcoRgkdnu8PQNU2
 PRQ/xUhHLKr+Xc4AfEQls+O/SzHtNxex0ThH9WBqrj2tSt4sS44KkkyXbTRxBJ199UMHkx
 iRDTBKOtruwcfMNWQP7e8L5/sMqTBRid4AkNPs+L48BEpT5/5TFvn7YNiwPaWQ==
Date: Fri, 22 Jan 2021 21:33:21 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 18/25] hw/timer/cmsdk-apb-timer: Convert to use Clock input
Message-ID: <20210122203321.ondgckxsqdcnksld@sekoia-pc.home.lmichel.fr>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-19-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121190622.22000-19-peter.maydell@linaro.org>
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
> Switch the CMSDK APB timer device over to using its Clock input; the
> pclk-frq property is now ignored.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  hw/timer/cmsdk-apb-timer.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
> index c63145ff553..f053146d88f 100644
> --- a/hw/timer/cmsdk-apb-timer.c
> +++ b/hw/timer/cmsdk-apb-timer.c
> @@ -204,6 +204,15 @@ static void cmsdk_apb_timer_reset(DeviceState *dev)
>      ptimer_transaction_commit(s->timer);
>  }
>  
> +static void cmsdk_apb_timer_clk_update(void *opaque)
> +{
> +    CMSDKAPBTimer *s = CMSDK_APB_TIMER(opaque);
> +
> +    ptimer_transaction_begin(s->timer);
> +    ptimer_set_period_from_clock(s->timer, s->pclk, 1);
> +    ptimer_transaction_commit(s->timer);
> +}
> +
>  static void cmsdk_apb_timer_init(Object *obj)
>  {
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> @@ -213,15 +222,16 @@ static void cmsdk_apb_timer_init(Object *obj)
>                            s, "cmsdk-apb-timer", 0x1000);
>      sysbus_init_mmio(sbd, &s->iomem);
>      sysbus_init_irq(sbd, &s->timerint);
> -    s->pclk = qdev_init_clock_in(DEVICE(s), "pclk", NULL, NULL);
> +    s->pclk = qdev_init_clock_in(DEVICE(s), "pclk",
> +                                 cmsdk_apb_timer_clk_update, s);
>  }
>  
>  static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)
>  {
>      CMSDKAPBTimer *s = CMSDK_APB_TIMER(dev);
>  
> -    if (s->pclk_frq == 0) {
> -        error_setg(errp, "CMSDK APB timer: pclk-frq property must be set");
> +    if (!clock_has_source(s->pclk)) {
> +        error_setg(errp, "CMSDK APB timer: pclk clock must be connected");
>          return;
>      }
>  
> @@ -232,7 +242,7 @@ static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)
>                             PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
>  
>      ptimer_transaction_begin(s->timer);
> -    ptimer_set_freq(s->timer, s->pclk_frq);
> +    ptimer_set_period_from_clock(s->timer, s->pclk, 1);
>      ptimer_transaction_commit(s->timer);
>  }
>  
> -- 
> 2.20.1
> 

-- 

