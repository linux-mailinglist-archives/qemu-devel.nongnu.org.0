Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2320E307E83
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 19:59:24 +0100 (CET)
Received: from localhost ([::1]:38184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5CVm-0003aM-Rq
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 13:59:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l5CTy-0002BN-E9; Thu, 28 Jan 2021 13:57:30 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:57586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l5CTo-0001tg-1j; Thu, 28 Jan 2021 13:57:30 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 11C95C602E6;
 Thu, 28 Jan 2021 19:57:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1611860237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dt2nXwWpRm8j9+M9HAiJNOIcfqEePQTlCmL6rYZK9gE=;
 b=bDc9S0lwV/7DygkIDhzueSCTEb9C4Q44tUHegIsERXZxkRx3qC1YU1TYsNomfSLT5RxYn+
 RxmcCwanJls7cvH1ZysHFxkTNkOXK7GPfxxTYJZCZnNiSXd0nnCfc+m3RTMQsN4wmM8B4k
 buwqLNBKUmySNIoPBkYrW65seyHpBJYp7Y3dRLDRI/vttJO/Me36X3qUQNyV5nvvkjx3rJ
 T+pFgsKaXVnzXUHLodDbAJrtdEh/ouECsx7hqqJkU1RPHrPL8GdmPpTWJDUpEiY9v4GB7r
 EtblNA20YhWxTRyVV57SdRsxCYBr1eHFQiGCBlIp/NGxM2IFdIFOsm5xjOLl6Q==
Date: Thu, 28 Jan 2021 19:57:41 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 22/25] hw/arm/armsse: Use Clock to set
 system_clock_scale
Message-ID: <20210128185741.c6qm47dab47emdqh@sekoia-pc.home.lmichel.fr>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
 <20210128114145.20536-23-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210128114145.20536-23-peter.maydell@linaro.org>
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11:41 Thu 28 Jan     , Peter Maydell wrote:
> Use the MAINCLK Clock input to set the system_clock_scale variable
> rather than using the mainclk_frq property.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Message-id: 20210121190622.22000-23-peter.maydell@linaro.org

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
> v1->v2: wire armsse_mainclk_update() up as the Clock callback
> ---
>  hw/arm/armsse.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
> index 4349ce9bfdb..9a6b24c79aa 100644
> --- a/hw/arm/armsse.c
> +++ b/hw/arm/armsse.c
> @@ -232,6 +232,16 @@ static void armsse_forward_sec_resp_cfg(ARMSSE *s)
>      qdev_connect_gpio_out(dev_splitter, 2, s->sec_resp_cfg_in);
>  }
>  
> +static void armsse_mainclk_update(void *opaque)
> +{
> +    ARMSSE *s = ARM_SSE(opaque);
> +    /*
> +     * Set system_clock_scale from our Clock input; this is what
> +     * controls the tick rate of the CPU SysTick timer.
> +     */
> +    system_clock_scale = clock_ticks_to_ns(s->mainclk, 1);
> +}
> +
>  static void armsse_init(Object *obj)
>  {
>      ARMSSE *s = ARM_SSE(obj);
> @@ -242,7 +252,8 @@ static void armsse_init(Object *obj)
>      assert(info->sram_banks <= MAX_SRAM_BANKS);
>      assert(info->num_cpus <= SSE_MAX_CPUS);
>  
> -    s->mainclk = qdev_init_clock_in(DEVICE(s), "MAINCLK", NULL, NULL);
> +    s->mainclk = qdev_init_clock_in(DEVICE(s), "MAINCLK",
> +                                    armsse_mainclk_update, s);
>      s->s32kclk = qdev_init_clock_in(DEVICE(s), "S32KCLK", NULL, NULL);
>  
>      memory_region_init(&s->container, obj, "armsse-container", UINT64_MAX);
> @@ -451,9 +462,11 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> -    if (!s->mainclk_frq) {
> -        error_setg(errp, "MAINCLK_FRQ property was not set");
> -        return;
> +    if (!clock_has_source(s->mainclk)) {
> +        error_setg(errp, "MAINCLK clock was not connected");
> +    }
> +    if (!clock_has_source(s->s32kclk)) {
> +        error_setg(errp, "S32KCLK clock was not connected");
>      }
>  
>      assert(info->num_cpus <= SSE_MAX_CPUS);
> @@ -1115,7 +1128,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>       */
>      sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->container);
>  
> -    system_clock_scale = NANOSECONDS_PER_SECOND / s->mainclk_frq;
> +    /* Set initial system_clock_scale from MAINCLK */
> +    armsse_mainclk_update(s);
>  }
>  
>  static void armsse_idau_check(IDAUInterface *ii, uint32_t address,
> -- 
> 2.20.1
> 

-- 

