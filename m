Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00AC31FBFB
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:30:39 +0100 (CET)
Received: from localhost ([::1]:51666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7jq-0002m9-Uy
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:30:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD74D-0002ya-6L
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:37 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:38707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73X-0003hb-Tz
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:35 -0500
Received: by mail-wm1-x32d.google.com with SMTP id x4so7882614wmi.3
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HopB4K6K7gngGK+esxc0vMVA1U5d8Hljyo+ikSSKGQk=;
 b=hevCP3IoDNB5HotbfDN76S7xTvg35sT0OB8JzZpXfjqIOh8ua9l1kMHREgG4PWq83T
 gw29ieXKMMWmY+AzwhH6yS2/kqSeaeW5xKwTXjNvaqmQvI2Dyjkyjxbrh0/l4FlpBWpi
 g9Zgh+F0IcYqQxdJd6zcEA6sOYoM09b39caWZWDKrYOMvsBhLWp5ya+59iVxqcB2JB9p
 81+ZcXSRgqd/NRG7doAqPBZIQlKu6W7JGsGwd4tRxTcdMSosmfEkWLJjXS31MPDR/Pun
 32uH1VSzCVdktk/3WhL+xDVsz+oUDeJtf+74Xf/veatG0oU8onfBTS1y9c958RaUOaGk
 Og/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HopB4K6K7gngGK+esxc0vMVA1U5d8Hljyo+ikSSKGQk=;
 b=JlIBFM9VCggrm8KZQVMXmBJeLBBd4tbGfXUzhfw/wYdEbRIn/twNYsvgR+JIcG41ob
 S1mozPl15rtByj0B+0Mdd0xyN+oD4+2OwF7WcIbBlQTg+1z6JYK1oph0m7BhU6RYEjeJ
 Zt2+uCoTtbvZspRtvmq3hvKZ8kNaODXdnS3iHPqvUl7qzXbaqHb0MbqpKyKMJAn5j1IJ
 GMpwbk45qNVDV3ycld8IFxDCQFomjtiBg8klxclwQtmMlQjERuWv5lBMiI8Ur7dmJSBc
 2nuVG4ymvODoOwmB1PB+H0FxoqdPMwBL2g0OhYh/mg38qEaC4Lss4fPYon9M+6bzOUhZ
 4JvA==
X-Gm-Message-State: AOAM531wc6+OKczOnh9cgAeWA51bITZ2dj2KGVd/CzMQxccVsaIZerIn
 XrmpJUCzBrrMEq/q6688PwQkXqjt3CL/vA==
X-Google-Smtp-Source: ABdhPJzwiLFboiAIqhe/U0NYLFyNUlkFU37DPNGxByzC0s2SgOodt+1wJai0QvrkcuIYbboIP3Y+jg==
X-Received: by 2002:a1c:b607:: with SMTP id g7mr8525222wmf.67.1613746012939;
 Fri, 19 Feb 2021 06:46:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 44/44] tests/qtest/sse-timer-test: Add simple tests of the SSE
 timer and counter
Date: Fri, 19 Feb 2021 14:46:17 +0000
Message-Id: <20210219144617.4782-45-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a simple qtest to exercise the new system counter and
system timer device in the SSE-300.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/sse-timer-test.c | 240 +++++++++++++++++++++++++++++++++++
 MAINTAINERS                  |   1 +
 tests/qtest/meson.build      |   1 +
 3 files changed, 242 insertions(+)
 create mode 100644 tests/qtest/sse-timer-test.c

diff --git a/tests/qtest/sse-timer-test.c b/tests/qtest/sse-timer-test.c
new file mode 100644
index 00000000000..cb29c995077
--- /dev/null
+++ b/tests/qtest/sse-timer-test.c
@@ -0,0 +1,240 @@
+/*
+ * QTest testcase for the SSE timer device
+ *
+ * Copyright (c) 2021 Linaro Limited
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest-single.h"
+
+/*
+ * SSE-123/SSE-300 timer in the mps3-an547 board, where it is driven
+ * at 32MHz, so 31.25ns per tick.
+ */
+#define TIMER_BASE 0x48000000
+
+/* PERIPHNSPPC0 register in the SSE-300 Secure Access Configuration block */
+#define PERIPHNSPPC0 (0x50080000 + 0x70)
+
+/* Base of the System Counter control frame */
+#define COUNTER_BASE 0x58100000
+
+/* SSE counter register offsets in the control frame */
+#define CNTCR 0
+#define CNTSR 0x4
+#define CNTCV_LO 0x8
+#define CNTCV_HI 0xc
+#define CNTSCR 0x10
+
+/* SSE timer register offsets */
+#define CNTPCT_LO 0
+#define CNTPCT_HI 4
+#define CNTFRQ 0x10
+#define CNTP_CVAL_LO 0x20
+#define CNTP_CVAL_HI 0x24
+#define CNTP_TVAL 0x28
+#define CNTP_CTL 0x2c
+#define CNTP_AIVAL_LO 0x40
+#define CNTP_AIVAL_HI 0x44
+#define CNTP_AIVAL_RELOAD 0x48
+#define CNTP_AIVAL_CTL 0x4c
+
+/* 4 ticks in nanoseconds (so we can work in integers) */
+#define FOUR_TICKS 125
+
+static void clock_step_ticks(uint64_t ticks)
+{
+    /*
+     * Advance the qtest clock by however many nanoseconds we
+     * need to move the timer forward the specified number of ticks.
+     * ticks must be a multiple of 4, so we get a whole number of ns.
+     */
+    assert(!(ticks & 3));
+    clock_step(FOUR_TICKS * (ticks >> 2));
+}
+
+static void reset_counter_and_timer(void)
+{
+    /*
+     * Reset the system counter and the timer between tests. This
+     * isn't a full reset, but it's sufficient for what the tests check.
+     */
+    writel(COUNTER_BASE + CNTCR, 0);
+    writel(TIMER_BASE + CNTP_CTL, 0);
+    writel(TIMER_BASE + CNTP_AIVAL_CTL, 0);
+    writel(COUNTER_BASE + CNTCV_LO, 0);
+    writel(COUNTER_BASE + CNTCV_HI, 0);
+}
+
+static void test_timer(void)
+{
+    /* Basic timer functionality test */
+
+    reset_counter_and_timer();
+    /*
+     * The timer is behind a Peripheral Protection Controller, and
+     * qtest accesses are always non-secure (no memory attributes),
+     * so we must program the PPC to accept NS transactions.  TIMER0
+     * is on port 0 of PPC0, controlled by bit 0 of this register.
+     */
+    writel(PERIPHNSPPC0, 1);
+    /* We must enable the System Counter or the timer won't run. */
+    writel(COUNTER_BASE + CNTCR, 1);
+
+    /* Timer starts disabled and with a counter of 0 */
+    g_assert_cmpuint(readl(TIMER_BASE + CNTP_CTL), ==, 0);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTPCT_LO), ==, 0);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTPCT_HI), ==, 0);
+
+    /* Turn it on */
+    writel(TIMER_BASE + CNTP_CTL, 1);
+
+    /* Is the timer ticking? */
+    clock_step_ticks(100);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTPCT_LO), ==, 100);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTPCT_HI), ==, 0);
+
+    /* Set the CompareValue to 4000 ticks */
+    writel(TIMER_BASE + CNTP_CVAL_LO, 4000);
+    writel(TIMER_BASE + CNTP_CVAL_HI, 0);
+
+    /* Check TVAL view of the counter */
+    g_assert_cmpuint(readl(TIMER_BASE + CNTP_TVAL), ==, 3900);
+
+    /* Advance to the CompareValue mark and check ISTATUS is set */
+    clock_step_ticks(3900);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTP_TVAL), ==, 0);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTP_CTL), ==, 5);
+
+    /* Now exercise the auto-reload part of the timer */
+    writel(TIMER_BASE + CNTP_AIVAL_RELOAD, 200);
+    writel(TIMER_BASE + CNTP_AIVAL_CTL, 1);
+
+    /* Check AIVAL was reloaded and that ISTATUS is now clear */
+    g_assert_cmpuint(readl(TIMER_BASE + CNTP_AIVAL_LO), ==, 4200);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTP_AIVAL_HI), ==, 0);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTP_CTL), ==, 1);
+
+    /*
+     * Check that when we advance forward to the reload time the interrupt
+     * fires and the value reloads
+     */
+    clock_step_ticks(100);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTP_CTL), ==, 1);
+    clock_step_ticks(100);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTP_CTL), ==, 5);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTP_AIVAL_LO), ==, 4400);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTP_AIVAL_HI), ==, 0);
+
+    clock_step_ticks(100);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTP_CTL), ==, 5);
+    /* Check that writing 0 to CLR clears the interrupt */
+    writel(TIMER_BASE + CNTP_AIVAL_CTL, 1);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTP_CTL), ==, 1);
+    /* Check that when we move forward to the reload time it fires again */
+    clock_step_ticks(100);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTP_CTL), ==, 5);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTP_AIVAL_LO), ==, 4600);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTP_AIVAL_HI), ==, 0);
+
+    /*
+     * Step the clock far enough that we overflow the low half of the
+     * CNTPCT and AIVAL registers, and check that their high halves
+     * give the right values. We do the forward movement in
+     * non-autoinc mode because otherwise it takes forever as the
+     * timer has to emulate all the 'reload at t + N, t + 2N, etc'
+     * steps.
+     */
+    writel(TIMER_BASE + CNTP_AIVAL_CTL, 0);
+    clock_step_ticks(0x42ULL << 32);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTPCT_LO), ==, 4400);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTPCT_HI), ==, 0x42);
+
+    /* Turn on the autoinc again to check AIVAL_HI */
+    writel(TIMER_BASE + CNTP_AIVAL_CTL, 1);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTP_AIVAL_LO), ==, 4600);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTP_AIVAL_HI), ==, 0x42);
+}
+
+static void test_counter(void)
+{
+    /* Basic counter functionality test */
+
+    reset_counter_and_timer();
+    /* The counter should start disabled: check that it doesn't move */
+    clock_step_ticks(100);
+    g_assert_cmpuint(readl(COUNTER_BASE + CNTCV_LO), ==, 0);
+    g_assert_cmpuint(readl(COUNTER_BASE + CNTCV_HI), ==, 0);
+    /* Now enable it and check that it does count */
+    writel(COUNTER_BASE + CNTCR, 1);
+    clock_step_ticks(100);
+    g_assert_cmpuint(readl(COUNTER_BASE + CNTCV_LO), ==, 100);
+    g_assert_cmpuint(readl(COUNTER_BASE + CNTCV_HI), ==, 0);
+    /* Check the counter scaling functionality */
+    writel(COUNTER_BASE + CNTCR, 0);
+    writel(COUNTER_BASE + CNTSCR, 0x00100000); /* 1/16th normal speed */
+    writel(COUNTER_BASE + CNTCR, 5); /* EN, SCEN */
+    clock_step_ticks(160);
+    g_assert_cmpuint(readl(COUNTER_BASE + CNTCV_LO), ==, 110);
+    g_assert_cmpuint(readl(COUNTER_BASE + CNTCV_HI), ==, 0);
+}
+
+static void test_timer_scale_change(void)
+{
+    /*
+     * Test that the timer responds correctly to counter
+     * scaling changes while it has an active timer.
+     */
+    reset_counter_and_timer();
+    /* Give ourselves access to the timer, and enable the counter and timer */
+    writel(PERIPHNSPPC0, 1);
+    writel(COUNTER_BASE + CNTCR, 1);
+    writel(TIMER_BASE + CNTP_CTL, 1);
+    /* Set the CompareValue to 4000 ticks */
+    writel(TIMER_BASE + CNTP_CVAL_LO, 4000);
+    writel(TIMER_BASE + CNTP_CVAL_HI, 0);
+    /* Advance halfway and check ISTATUS is not set */
+    clock_step_ticks(2000);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTP_CTL), ==, 1);
+    /* Reprogram the counter to run at 1/16th speed */
+    writel(COUNTER_BASE + CNTCR, 0);
+    writel(COUNTER_BASE + CNTSCR, 0x00100000); /* 1/16th normal speed */
+    writel(COUNTER_BASE + CNTCR, 5); /* EN, SCEN */
+    /* Advance to where the timer would have fired and check it has not */
+    clock_step_ticks(2000);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTP_CTL), ==, 1);
+    /* Advance to where the timer must fire at the new clock rate */
+    clock_step_ticks(29996);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTP_CTL), ==, 1);
+    clock_step_ticks(4);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTP_CTL), ==, 5);
+}
+
+int main(int argc, char **argv)
+{
+    int r;
+
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_start("-machine mps3-an547");
+
+    qtest_add_func("/sse-timer/timer", test_timer);
+    qtest_add_func("/sse-timer/counter", test_counter);
+    qtest_add_func("/sse-timer/timer-scale-change", test_timer_scale_change);
+
+    r = g_test_run();
+
+    qtest_end();
+
+    return r;
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index c2103b40b9b..cbe790add60 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -748,6 +748,7 @@ F: hw/timer/sse-counter.c
 F: include/hw/timer/sse-counter.h
 F: hw/timer/sse-timer.c
 F: include/hw/timer/sse-timer.h
+F: tests/qtest/sse-timer-test.c
 F: docs/system/arm/mps2.rst
 
 Musca
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c83bc211b6a..f38ebbf67c3 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -142,6 +142,7 @@ qtests_npcm7xx = \
    'npcm7xx_timer-test',
    'npcm7xx_watchdog_timer-test']
 qtests_arm = \
+  (config_all_devices.has_key('CONFIG_MPS2') ? ['sse-timer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_DUALTIMER') ? ['cmsdk-apb-dualtimer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_TIMER') ? ['cmsdk-apb-timer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_WATCHDOG') ? ['cmsdk-apb-watchdog-test'] : []) + \
-- 
2.20.1


