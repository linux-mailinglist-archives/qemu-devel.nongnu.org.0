Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE3F3006F9
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 16:19:25 +0100 (CET)
Received: from localhost ([::1]:40660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2yDc-0004om-Fm
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 10:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l2yCG-0003YH-An; Fri, 22 Jan 2021 10:18:00 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:37446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l2yCE-0003XV-IT; Fri, 22 Jan 2021 10:18:00 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 06186C602E6;
 Fri, 22 Jan 2021 16:17:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1611328676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5H9QuNwEAPkFYnOSl+IeanFyazg/L2M2wvzM1W0QBzs=;
 b=ESgwxSJKqbdKG9NTmfBjR2Nhs9XrHDN08LpC5Q+/m8kMYQaizGD4C1ZwaWkfPKfi/dokpO
 TbrHgSufrUmPUFv64XqBWhKbom12e29EtFNXlPPsngvbmpcjSrdu36Hr30rdk2+8gyHp3g
 g778T2pC0OgyTf+JlmzynwphYsKdkzI8rp6ERRi3Wx/emEr/WldkTrv770tBY2Wcz64y1V
 HLxniR5k3ZMSBH5b/YGG3i8alMIisEsotTpuyJVdM8sI93wdRKwjzfji/1yayyVdHeJ7XS
 YX39g1XmsohMityffMJEdxZePxSiSLUYE+KM5hURSdE1BDmcc3vzWEq4SEBAAQ==
Date: Fri, 22 Jan 2021 16:18:17 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 09/25] hw/watchdog/cmsdk-apb-watchdog: Add Clock input
Message-ID: <20210122151817.5tze5qxc6dp3lhkr@sekoia-pc.home.lmichel.fr>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-10-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121190622.22000-10-peter.maydell@linaro.org>
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
> As the first step in converting the CMSDK_APB_TIMER device to the
> Clock framework, add a Clock input.  For the moment we do nothing
> with this clock; we will change the behaviour from using the
> wdogclk-frq property to using the Clock once all the users of this
> device have been converted to wire up the Clock.
> 
> This is a migration compatibility break for machines mps2-an385,
> mps2-an386, mps2-an500, mps2-an511, mps2-an505, mps2-an521, musca-a,
> musca-b1, lm3s811evb, lm3s6965evb.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  include/hw/watchdog/cmsdk-apb-watchdog.h | 3 +++
>  hw/watchdog/cmsdk-apb-watchdog.c         | 7 +++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/watchdog/cmsdk-apb-watchdog.h b/include/hw/watchdog/cmsdk-apb-watchdog.h
> index 3da0d43e355..34069ca6969 100644
> --- a/include/hw/watchdog/cmsdk-apb-watchdog.h
> +++ b/include/hw/watchdog/cmsdk-apb-watchdog.h
> @@ -17,6 +17,7 @@
>   *
>   * QEMU interface:
>   *  + QOM property "wdogclk-frq": frequency at which the watchdog is clocked
> + *  + Clock input "WDOGCLK": clock for the watchdog's timer
>   *  + sysbus MMIO region 0: the register bank
>   *  + sysbus IRQ 0: watchdog interrupt
>   *
> @@ -33,6 +34,7 @@
>  
>  #include "hw/sysbus.h"
>  #include "hw/ptimer.h"
> +#include "hw/clock.h"
>  #include "qom/object.h"
>  
>  #define TYPE_CMSDK_APB_WATCHDOG "cmsdk-apb-watchdog"
> @@ -54,6 +56,7 @@ struct CMSDKAPBWatchdog {
>      uint32_t wdogclk_frq;
>      bool is_luminary;
>      struct ptimer_state *timer;
> +    Clock *wdogclk;
>  
>      uint32_t control;
>      uint32_t intstatus;
> diff --git a/hw/watchdog/cmsdk-apb-watchdog.c b/hw/watchdog/cmsdk-apb-watchdog.c
> index 5bbadadfa68..b03bcb73628 100644
> --- a/hw/watchdog/cmsdk-apb-watchdog.c
> +++ b/hw/watchdog/cmsdk-apb-watchdog.c
> @@ -30,6 +30,7 @@
>  #include "hw/irq.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/registerfields.h"
> +#include "hw/qdev-clock.h"
>  #include "hw/watchdog/cmsdk-apb-watchdog.h"
>  #include "migration/vmstate.h"
>  
> @@ -318,6 +319,7 @@ static void cmsdk_apb_watchdog_init(Object *obj)
>                            s, "cmsdk-apb-watchdog", 0x1000);
>      sysbus_init_mmio(sbd, &s->iomem);
>      sysbus_init_irq(sbd, &s->wdogint);
> +    s->wdogclk = qdev_init_clock_in(DEVICE(s), "WDOGCLK", NULL, NULL);
>  
>      s->is_luminary = false;
>      s->id = cmsdk_apb_watchdog_id;
> @@ -346,9 +348,10 @@ static void cmsdk_apb_watchdog_realize(DeviceState *dev, Error **errp)
>  
>  static const VMStateDescription cmsdk_apb_watchdog_vmstate = {
>      .name = "cmsdk-apb-watchdog",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>      .fields = (VMStateField[]) {
> +        VMSTATE_CLOCK(wdogclk, CMSDKAPBWatchdog),
>          VMSTATE_PTIMER(timer, CMSDKAPBWatchdog),
>          VMSTATE_UINT32(control, CMSDKAPBWatchdog),
>          VMSTATE_UINT32(intstatus, CMSDKAPBWatchdog),
> -- 
> 2.20.1
> 

-- 

