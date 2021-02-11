Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCF0318838
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:33:25 +0100 (CET)
Received: from localhost ([::1]:55030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA9Ho-0006EN-4g
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:33:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1lA8yS-0002nT-AO; Thu, 11 Feb 2021 05:13:24 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:34856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1lA8yQ-00062H-LT; Thu, 11 Feb 2021 05:13:24 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 739AAC602E6;
 Thu, 11 Feb 2021 11:13:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1613038400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/+1LIYa66GV43D0NX2RnPyZrNdxTrt7YgSnMFP9A2Uc=;
 b=S7hP70FJGvccBjsebFX9A4PZoBsY/NkzBVmI5Wnggpv6X3j1mXrxYG6WVYHqUHEnSeN8YY
 LH7b6YOGHV6loYAi4VuA0maCnRxsS/ZadvvH388+Xsu+xjgyplhFYrGelgN71k2vIRIzlA
 LOSd67pkKF9GqEuUtwIebX6hgdLF5qm+pcwsNG3qmKgOIyeOTpT92YlIhwHVwTisr0SReM
 MTVYMJBQ6XTZGtQyqLyWGc5kcvnb1Gbb3iqczo7lVD5yrkqD88Z+CK5wZxCidLGlm+Wx0J
 vP2Ldmkyf0PpRPNBtQ0+nAzBxacESurGYS5fXqiRSvbgZfjpO6OrhtjRAmsaGg==
Date: Thu, 11 Feb 2021 11:13:51 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 4/4] hw/timer/npcm7xx_timer: Use new clock_ns_to_ticks()
Message-ID: <20210211101351.jxdtlzu6uharvkt4@sekoia-pc.home.lmichel.fr>
References: <20210209132040.5091-1-peter.maydell@linaro.org>
 <20210209132040.5091-5-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209132040.5091-5-peter.maydell@linaro.org>
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
Cc: Havard Skinnemoen <hskinnemoen@google.com>, qemu-devel@nongnu.org,
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13:20 Tue 09 Feb     , Peter Maydell wrote:
> Use the new clock_ns_to_ticks() function in npcm7xx_timer where
> appropriate.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  hw/timer/npcm7xx_timer.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/timer/npcm7xx_timer.c b/hw/timer/npcm7xx_timer.c
> index 4efdf135b82..32f5e021f85 100644
> --- a/hw/timer/npcm7xx_timer.c
> +++ b/hw/timer/npcm7xx_timer.c
> @@ -138,8 +138,8 @@ static int64_t npcm7xx_timer_count_to_ns(NPCM7xxTimer *t, uint32_t count)
>  /* Convert a time interval in nanoseconds to a timer cycle count. */
>  static uint32_t npcm7xx_timer_ns_to_count(NPCM7xxTimer *t, int64_t ns)
>  {
> -    return ns / clock_ticks_to_ns(t->ctrl->clock,
> -                                  npcm7xx_tcsr_prescaler(t->tcsr));
> +    return clock_ns_to_ticks(t->ctrl->clock, ns) /
> +        npcm7xx_tcsr_prescaler(t->tcsr);
>  }
>  
>  static uint32_t npcm7xx_watchdog_timer_prescaler(const NPCM7xxWatchdogTimer *t)
> -- 
> 2.20.1
> 

-- 

