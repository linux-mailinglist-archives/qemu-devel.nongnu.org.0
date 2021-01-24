Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D28301C00
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 14:12:03 +0100 (CET)
Received: from localhost ([::1]:49592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3fBR-0008VH-R7
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 08:12:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l3f9m-0007oW-6h; Sun, 24 Jan 2021 08:10:18 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:55530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l3f9g-0006Bn-WA; Sun, 24 Jan 2021 08:10:17 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 0A361C602E6;
 Sun, 24 Jan 2021 14:10:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1611493808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SJyJcEvUt69BxmSu6MT1J+V50x+xt2q+A8wKVTuROlw=;
 b=YD1EKqg/PUdPpjOHlQJOUWZ30hLgP8nBU1AW6sXPOyK0XNoulVcmsbcj0UKfqW22Vif+/C
 xwaRypccpQmLfN5eAsSVlebJ/t6rpemMmQnRYGQ54SdR8X6ZbWFQBxDNzAI2GUNgUTy0Al
 gBeDYuK7+8VNBrb9GTcHdZ3hlh5TFg/UDpqsltml7M34I+DI7d6NNJP3GEzcCGpGEdgObc
 TfG1Rt9PEzVQ3f9zRbjG1XYHr5n+9/VVFJezvf2onl0E70M8gsEkQZkWnRWeGEu9fbSXzj
 G5bchaOlXyiykSzH7+86p9jhiwrh6HZub+SN+UN8C5c4UbDj4+wUy7Q25j+78w==
Date: Sun, 24 Jan 2021 14:10:30 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 04/25] tests: Add a simple test of the CMSDK APB watchdog
Message-ID: <20210124131030.dxvcid4i6j7kmt4r@sekoia-pc.home.lmichel.fr>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-5-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121190622.22000-5-peter.maydell@linaro.org>
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
> Add a simple test of the CMSDK watchdog, since we're about to do some
> refactoring of how it is clocked.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  tests/qtest/cmsdk-apb-watchdog-test.c | 80 +++++++++++++++++++++++++++
>  MAINTAINERS                           |  1 +
>  tests/qtest/meson.build               |  1 +
>  3 files changed, 82 insertions(+)
>  create mode 100644 tests/qtest/cmsdk-apb-watchdog-test.c
> 
> diff --git a/tests/qtest/cmsdk-apb-watchdog-test.c b/tests/qtest/cmsdk-apb-watchdog-test.c
> new file mode 100644
> index 00000000000..c6add1fee85
> --- /dev/null
> +++ b/tests/qtest/cmsdk-apb-watchdog-test.c
> @@ -0,0 +1,80 @@
> +/*
> + * QTest testcase for the CMSDK APB watchdog device
> + *
> + * Copyright (c) 2021 Linaro Limited
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqtest-single.h"
> +
> +/*
> + * lm3s811evb watchdog; at board startup this runs at 200MHz / 16 == 12.5MHz,
> + * which is 80ns per tick.
> + */
> +#define WDOG_BASE 0x40000000
> +
> +#define WDOGLOAD 0
> +#define WDOGVALUE 4
> +#define WDOGCONTROL 8
> +#define WDOGINTCLR 0xc
> +#define WDOGRIS 0x10
> +#define WDOGMIS 0x14
> +#define WDOGLOCK 0xc00
> +
> +static void test_watchdog(void)
> +{
> +    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 0);
> +
> +    writel(WDOG_BASE + WDOGCONTROL, 1);
> +    writel(WDOG_BASE + WDOGLOAD, 1000);
> +
> +    /* Step to just past the 500th tick */
> +    clock_step(500 * 80 + 1);
> +    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 0);
> +    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 500);
> +
> +    /* Just past the 1000th tick: timer should have fired */
> +    clock_step(500 * 80);
> +    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 1);
> +    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 0);
> +
> +    /* VALUE reloads at following tick */
> +    clock_step(80);
> +    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 1000);
> +
> +    /* Writing any value to WDOGINTCLR clears the interrupt and reloads */
> +    clock_step(500 * 80);
> +    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 500);
> +    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 1);
> +    writel(WDOG_BASE + WDOGINTCLR, 0);
> +    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 1000);
> +    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 0);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    QTestState *s;
> +    int r;
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    s = qtest_start("-machine lm3s811evb");
> +
> +    qtest_add_func("/cmsdk-apb-watchdog/watchdog", test_watchdog);
> +
> +    r = g_test_run();
> +
> +    qtest_end();
> +
> +    return r;
> +}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 010405b0884..58956497888 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -588,6 +588,7 @@ F: hw/char/cmsdk-apb-uart.c
>  F: include/hw/char/cmsdk-apb-uart.h
>  F: hw/watchdog/cmsdk-apb-watchdog.c
>  F: include/hw/watchdog/cmsdk-apb-watchdog.h
> +F: tests/qtest/cmsdk-apb-watchdog-test.c
>  F: hw/misc/tz-ppc.c
>  F: include/hw/misc/tz-ppc.h
>  F: hw/misc/tz-mpc.c
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 74addd74868..9e2ebc47041 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -142,6 +142,7 @@ qtests_npcm7xx = \
>     'npcm7xx_watchdog_timer-test']
>  qtests_arm = \
>    (config_all_devices.has_key('CONFIG_CMSDK_APB_TIMER') ? ['cmsdk-apb-timer-test'] : []) + \
> +  (config_all_devices.has_key('CONFIG_CMSDK_APB_WATCHDOG') ? ['cmsdk-apb-watchdog-test'] : []) + \
>    (config_all_devices.has_key('CONFIG_PFLASH_CFI02') ? ['pflash-cfi02-test'] : []) +         \
>    (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
>    ['arm-cpu-features',
> -- 
> 2.20.1
> 

-- 

