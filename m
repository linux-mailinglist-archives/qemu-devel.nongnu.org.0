Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C82AB2FF43F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:22:30 +0100 (CET)
Received: from localhost ([::1]:58004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fXJ-0007Ap-Qn
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:22:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fIP-0002Qm-29
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:07:05 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fI1-0005mw-3U
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:07:04 -0500
Received: by mail-wr1-x42e.google.com with SMTP id l12so2830982wry.2
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MgUOZVXgTuq+ewB882N1Uysmr2goe72Go52/tWAmfH4=;
 b=Y11OzRdJGKxQNZokVvT7EEd/YMEtfNqxfPCkKaDdsIWPQYvm5tVmRbf3V5AJd9NcLh
 VqMhDz8M3SvuMP5Ts6uBvhVyniaJ6hKiLJTxf8b1VY3ci0KfLmNubK25xS0gzSoCzXJJ
 rKbha/8+Ev6QUeesyjzxx4M+X1TK4kHq1v0f9DltHYeh9dBZtZDPuTP2Dg1y99HiVyjh
 hnwEZSBznbftF79j8GHSjFrUhos02/5nOY/8zm+SrE8gSue5Htc4AFxqJB18Qo3H85eD
 mmcKWppHT3DLWQgYs507NZKql06enx5VDJUzhvUwPXb5WilI78j+6giAxCUQcJjJgVG+
 3N4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MgUOZVXgTuq+ewB882N1Uysmr2goe72Go52/tWAmfH4=;
 b=o1pdf3LR4t5TqDF23s2IJv488RZf8Lnl+K5+G/Nen/7qDRAYdKcN1RzpBVA2A668lD
 zKVm3j02kc/cLXAb6TcLf5h5NHgNJf8SV4PbwjxSOC89x5XchyaaMwAtsLSC4tPgbe7k
 BZtptAO8YrDBho0fFUgrptL5AkheyKfJWmJ2IRZJbQuT+jO2dUvUk1DjaC0o0Q80N6GC
 X6204jCV9UBrXJ7XFxajPuUN66Wuij0ek9Rl1tu0iO9CGDKdWdz511RzjEwYXVDdPNyn
 wuaTMisjtG+yRfbx0zuKS99Y3QU2TqN78dzpSwVADlX4JMka4tS7Ct0IyxsyN1jV97dY
 BGqg==
X-Gm-Message-State: AOAM533FX8uYGUrATIWa3d3YUg5+bN5o6/o7pJs6lWVNMvTUucqS3+9Q
 zNpHR7u76MXsJMmrXc+jm1rlUA==
X-Google-Smtp-Source: ABdhPJyriSVaahPFM0phiZOSE7vZXJq2nUAapisczNOLJ/rLvuHgGK3g0woNMkJ8wI1evmR6JYpZNQ==
X-Received: by 2002:a5d:6204:: with SMTP id y4mr940444wru.48.1611255990430;
 Thu, 21 Jan 2021 11:06:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m18sm9820686wrw.43.2021.01.21.11.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:06:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/25] tests: Add a simple test of the CMSDK APB dual timer
Date: Thu, 21 Jan 2021 19:06:02 +0000
Message-Id: <20210121190622.22000-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121190622.22000-1-peter.maydell@linaro.org>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a simple test of the CMSDK dual timer, since we're about to do
some refactoring of how it is clocked.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/cmsdk-apb-dualtimer-test.c | 131 +++++++++++++++++++++++++
 MAINTAINERS                            |   1 +
 tests/qtest/meson.build                |   1 +
 3 files changed, 133 insertions(+)
 create mode 100644 tests/qtest/cmsdk-apb-dualtimer-test.c

diff --git a/tests/qtest/cmsdk-apb-dualtimer-test.c b/tests/qtest/cmsdk-apb-dualtimer-test.c
new file mode 100644
index 00000000000..5a29d65fd6d
--- /dev/null
+++ b/tests/qtest/cmsdk-apb-dualtimer-test.c
@@ -0,0 +1,131 @@
+/*
+ * QTest testcase for the CMSDK APB dualtimer device
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
+/* IoTKit/ARMSSE dualtimer; driven at 25MHz in mps2-an385, so 40ns per tick */
+#define TIMER_BASE 0x40002000
+
+#define TIMER1LOAD 0
+#define TIMER1VALUE 4
+#define TIMER1CONTROL 8
+#define TIMER1INTCLR 0xc
+#define TIMER1RIS 0x10
+#define TIMER1MIS 0x14
+#define TIMER1BGLOAD 0x18
+
+#define TIMER2LOAD 0x20
+#define TIMER2VALUE 0x24
+#define TIMER2CONTROL 0x28
+#define TIMER2INTCLR 0x2c
+#define TIMER2RIS 0x30
+#define TIMER2MIS 0x34
+#define TIMER2BGLOAD 0x38
+
+#define CTRL_ENABLE (1 << 7)
+#define CTRL_PERIODIC (1 << 6)
+#define CTRL_INTEN (1 << 5)
+#define CTRL_PRESCALE_1 (0 << 2)
+#define CTRL_PRESCALE_16 (1 << 2)
+#define CTRL_PRESCALE_256 (2 << 2)
+#define CTRL_32BIT (1 << 1)
+#define CTRL_ONESHOT (1 << 0)
+
+static void test_dualtimer(void)
+{
+    g_assert_true(readl(TIMER_BASE + TIMER1RIS) == 0);
+
+    /* Start timer: will fire after 40000 ns */
+    writel(TIMER_BASE + TIMER1LOAD, 1000);
+    /* enable in free-running, wrapping, interrupt mode */
+    writel(TIMER_BASE + TIMER1CONTROL, CTRL_ENABLE | CTRL_INTEN);
+
+    /* Step to just past the 500th tick and check VALUE */
+    clock_step(20001);
+    g_assert_cmpuint(readl(TIMER_BASE + TIMER1RIS), ==, 0);
+    g_assert_cmpuint(readl(TIMER_BASE + TIMER1VALUE), ==, 500);
+
+    /* Just past the 1000th tick: timer should have fired */
+    clock_step(20000);
+    g_assert_cmpuint(readl(TIMER_BASE + TIMER1RIS), ==, 1);
+    g_assert_cmpuint(readl(TIMER_BASE + TIMER1VALUE), ==, 0);
+
+    /*
+     * We are in free-running wrapping 16-bit mode, so on the following
+     * tick VALUE should have wrapped round to 0xffff.
+     */
+    clock_step(40);
+    g_assert_cmpuint(readl(TIMER_BASE + TIMER1VALUE), ==, 0xffff);
+
+    /* Check that any write to INTCLR clears interrupt */
+    writel(TIMER_BASE + TIMER1INTCLR, 1);
+    g_assert_cmpuint(readl(TIMER_BASE + TIMER1RIS), ==, 0);
+
+    /* Turn off the timer */
+    writel(TIMER_BASE + TIMER1CONTROL, 0);
+}
+
+static void test_prescale(void)
+{
+    g_assert_true(readl(TIMER_BASE + TIMER2RIS) == 0);
+
+    /* Start timer: will fire after 40 * 256 * 1000 == 1024000 ns */
+    writel(TIMER_BASE + TIMER2LOAD, 1000);
+    /* enable in periodic, wrapping, interrupt mode, prescale 256 */
+    writel(TIMER_BASE + TIMER2CONTROL,
+           CTRL_ENABLE | CTRL_INTEN | CTRL_PERIODIC | CTRL_PRESCALE_256);
+
+    /* Step to just past the 500th tick and check VALUE */
+    clock_step(40 * 256 * 501);
+    g_assert_cmpuint(readl(TIMER_BASE + TIMER2RIS), ==, 0);
+    g_assert_cmpuint(readl(TIMER_BASE + TIMER2VALUE), ==, 500);
+
+    /* Just past the 1000th tick: timer should have fired */
+    clock_step(40 * 256 * 500);
+    g_assert_cmpuint(readl(TIMER_BASE + TIMER2RIS), ==, 1);
+    g_assert_cmpuint(readl(TIMER_BASE + TIMER2VALUE), ==, 0);
+
+    /* In periodic mode the tick VALUE now reloads */
+    clock_step(256);
+    g_assert_cmpuint(readl(TIMER_BASE + TIMER2VALUE), ==, 1000);
+
+    /* Check that any write to INTCLR clears interrupt */
+    writel(TIMER_BASE + TIMER2INTCLR, 1);
+    g_assert_cmpuint(readl(TIMER_BASE + TIMER2RIS), ==, 0);
+
+    /* Turn off the timer */
+    writel(TIMER_BASE + TIMER2CONTROL, 0);
+}
+
+int main(int argc, char **argv)
+{
+    QTestState *s;
+    int r;
+
+    g_test_init(&argc, &argv, NULL);
+
+    s = qtest_start("-machine mps2-an385");
+
+    qtest_add_func("/cmsdk-apb-dualtimer/dualtimer", test_dualtimer);
+    qtest_add_func("/cmsdk-apb-dualtimer/prescale", test_prescale);
+
+    r = g_test_run();
+
+    qtest_end();
+
+    return r;
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 58956497888..118f70e47fb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -584,6 +584,7 @@ F: include/hw/timer/cmsdk-apb-timer.h
 F: tests/qtest/cmsdk-apb-timer-test.c
 F: hw/timer/cmsdk-apb-dualtimer.c
 F: include/hw/timer/cmsdk-apb-dualtimer.h
+F: tests/qtest/cmsdk-apb-dualtimer-test.c
 F: hw/char/cmsdk-apb-uart.c
 F: include/hw/char/cmsdk-apb-uart.h
 F: hw/watchdog/cmsdk-apb-watchdog.c
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 9e2ebc47041..69dd4a8547c 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -141,6 +141,7 @@ qtests_npcm7xx = \
    'npcm7xx_timer-test',
    'npcm7xx_watchdog_timer-test']
 qtests_arm = \
+  (config_all_devices.has_key('CONFIG_CMSDK_APB_DUALTIMER') ? ['cmsdk-apb-dualtimer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_TIMER') ? ['cmsdk-apb-timer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_WATCHDOG') ? ['cmsdk-apb-watchdog-test'] : []) + \
   (config_all_devices.has_key('CONFIG_PFLASH_CFI02') ? ['pflash-cfi02-test'] : []) +         \
-- 
2.20.1


