Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C022E301C45
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 14:36:15 +0100 (CET)
Received: from localhost ([::1]:58712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3fYs-0005X1-Rt
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 08:36:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l3fXQ-0004xI-0y; Sun, 24 Jan 2021 08:34:44 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:56602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l3fXN-00080t-MW; Sun, 24 Jan 2021 08:34:43 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 3B211C602E6;
 Sun, 24 Jan 2021 14:34:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1611495278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DnEB7eCvT+FDDOw6DNNPM1u7lv33jN4hxVUC4ix651M=;
 b=ZVzqNh/7ovJLeGgrahAH4yNO3Tr7UwxJmJcQ1aAks65D9mgm4v6/YXLshTuUbJW+/ei95Q
 tnpKxu7Oj/eHikiUoTFhccQGZ1jXKGtrlJAXBXi1BuD//dccD0Y9Zupft3rI+0++W1Hm93
 uo+L8HxVTmhmogiKDyjYS7SSJhz8Wg7fc/CcVDUZx3ET1/vLYFFI+xe84IrL2Aj6V7yKeu
 6QropEbyLo/tFU7LsyiC1l3BDaf8LZNKlq8rhAFAexTAS5YEJySrKB6baPMxZvWPTYIzX5
 ch84g/YAjVbQ5koiDeH6UIIRLdeybTD0dX0fpBXmJgx0CyLDRga9Up9A7bBAcQ==
Date: Sun, 24 Jan 2021 14:35:00 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 21/25] tests/qtest/cmsdk-apb-watchdog-test: Test clock
 changes
Message-ID: <20210124133500.utnoaefyfozwg64e@sekoia-pc.home.lmichel.fr>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-22-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121190622.22000-22-peter.maydell@linaro.org>
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
> Now that the CMSDK APB watchdog uses its Clock input, it will
> correctly respond when the system clock frequency is changed using
> the RCC register on in the Stellaris board system registers.  Test
> that when the RCC register is written it causes the watchdog timer to
> change speed.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  tests/qtest/cmsdk-apb-watchdog-test.c | 52 +++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/tests/qtest/cmsdk-apb-watchdog-test.c b/tests/qtest/cmsdk-apb-watchdog-test.c
> index c6add1fee85..9a4873a8314 100644
> --- a/tests/qtest/cmsdk-apb-watchdog-test.c
> +++ b/tests/qtest/cmsdk-apb-watchdog-test.c
> @@ -15,6 +15,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/bitops.h"
>  #include "libqtest-single.h"
>  
>  /*
> @@ -31,6 +32,11 @@
>  #define WDOGMIS 0x14
>  #define WDOGLOCK 0xc00
>  
> +#define SSYS_BASE 0x400fe000
> +#define RCC 0x60
> +#define SYSDIV_SHIFT 23
> +#define SYSDIV_LENGTH 4
> +
>  static void test_watchdog(void)
>  {
>      g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 0);
> @@ -61,6 +67,50 @@ static void test_watchdog(void)
>      g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 0);
>  }
>  
> +static void test_clock_change(void)
> +{
> +    uint32_t rcc;
> +
> +    /*
> +     * Test that writing to the stellaris board's RCC register to
> +     * change the system clock frequency causes the watchdog
> +     * to change the speed it counts at.
> +     */
> +    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 0);
> +
> +    writel(WDOG_BASE + WDOGCONTROL, 1);
> +    writel(WDOG_BASE + WDOGLOAD, 1000);
> +
> +    /* Step to just past the 500th tick */
> +    clock_step(80 * 500 + 1);
> +    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 0);
> +    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 500);
> +
> +    /* Rewrite RCC.SYSDIV from 16 to 8, so the clock is now 40ns per tick */
> +    rcc = readl(SSYS_BASE + RCC);
> +    g_assert_cmpuint(extract32(rcc, SYSDIV_SHIFT, SYSDIV_LENGTH), ==, 0xf);
> +    rcc = deposit32(rcc, SYSDIV_SHIFT, SYSDIV_LENGTH, 7);
> +    writel(SSYS_BASE + RCC, rcc);
> +
> +    /* Just past the 1000th tick: timer should have fired */
> +    clock_step(40 * 500);
> +    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 1);
> +
> +    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 0);
> +
> +    /* VALUE reloads at following tick */
> +    clock_step(41);
> +    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 1000);
> +
> +    /* Writing any value to WDOGINTCLR clears the interrupt and reloads */
> +    clock_step(40 * 500);
> +    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 500);
> +    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 1);
> +    writel(WDOG_BASE + WDOGINTCLR, 0);
> +    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 1000);
> +    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 0);
> +}
> +
>  int main(int argc, char **argv)
>  {
>      QTestState *s;
> @@ -71,6 +121,8 @@ int main(int argc, char **argv)
>      s = qtest_start("-machine lm3s811evb");
>  
>      qtest_add_func("/cmsdk-apb-watchdog/watchdog", test_watchdog);
> +    qtest_add_func("/cmsdk-apb-watchdog/watchdog_clock_change",
> +                   test_clock_change);
>  
>      r = g_test_run();
>  
> -- 
> 2.20.1
> 

-- 

