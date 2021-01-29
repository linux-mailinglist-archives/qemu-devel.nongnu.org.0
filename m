Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C52308820
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:14:30 +0100 (CET)
Received: from localhost ([::1]:48596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5RjR-0006as-Gt
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:14:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWD-0004lp-Hn
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:49 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RW2-00072j-4t
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:49 -0500
Received: by mail-wr1-x429.google.com with SMTP id 6so8390551wri.3
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=MCCaWFI+j7JlvEyhytVNLIBFfTW5yIMU/qhYUdn+kH4=;
 b=CDvYgJM9qi6DjNa5spwl7ekTGefsOr3Lle18FKy/7ckimlek7WUEJTNgqbylqfVte5
 8f9hsKhHw9BUVcoHRNxsmd7vuu4XY6ccgn5TdUS1IInNuVjIT0cKC+LVIGx5eW6DBd2z
 DfvyzOWPhjbHdU6PgGexDPGfeSDQlB6ZMbVwcTypxB8rKG2uBsNbhfwVSoMp8izNwnNX
 0NbGt/XodtHQS+vpiVPaadXc6boCFQxdBFTuoxJuJTdF0lHWXGjTFxTLp8StG1Eat3uc
 JH/tieXd+T6+8H7pSUPWLZoRzKooXk4Q89eu8VTBiAoXvxPkY7haYyElv29N1hXsDn5J
 RiLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MCCaWFI+j7JlvEyhytVNLIBFfTW5yIMU/qhYUdn+kH4=;
 b=uS661zj9b9+NH3BzMj3hhQfaUfMVSpNjLYuhBOwXUMrlJ4qKZDKF7B8tQvIKGYgFSt
 4pJAbU5uQk+usbPMNbGsNF9DqkFCTgi982M46uxNQkxEYF7HGK0Paj4YSqEMOxsmiwtt
 YYuITB5Ime8e/Ekq6BoTq1IvXOZwfbMX6iOy5tRpd1FXUZ9Fbsm5tdlw8jsJlnpz7X7E
 cKCoUXqF/XIW+CeB6ghzCR1t8tkwbIEs43S30nt4oi0DdXPYnQMb/4mnYay9rv0a96K2
 h+vGxvaJqHWjvYBl66mBktguamRwXwDQEn6ngJRNbHnHm8nfA9CywBzxZxanClrExPVK
 /6nA==
X-Gm-Message-State: AOAM532Ky+bjfEgUawpJaeaJ4wfq8XSNvjBSHdlQ42t9XrGX329Jgk1w
 eiTy6tZS+qSblmHtzAPCOsUTaeWKW/BTeA==
X-Google-Smtp-Source: ABdhPJzLcKGPpysbEAKZpSxUWCPw80ZEzlrH0D0fB9RBCnq6pwNyDeB2aHXAtP56uqcifMDjmRebDQ==
X-Received: by 2002:adf:e80f:: with SMTP id o15mr3874289wrm.366.1611918036811; 
 Fri, 29 Jan 2021 03:00:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/46] tests: Add a simple test of the CMSDK APB timer
Date: Fri, 29 Jan 2021 10:59:50 +0000
Message-Id: <20210129110012.8660-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

Add a simple test of the CMSDK APB timer, since we're about to do
some refactoring of how it is clocked.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210128114145.20536-4-peter.maydell@linaro.org
Message-id: 20210121190622.22000-4-peter.maydell@linaro.org
---
 tests/qtest/cmsdk-apb-timer-test.c | 75 ++++++++++++++++++++++++++++++
 MAINTAINERS                        |  1 +
 tests/qtest/meson.build            |  1 +
 3 files changed, 77 insertions(+)
 create mode 100644 tests/qtest/cmsdk-apb-timer-test.c

diff --git a/tests/qtest/cmsdk-apb-timer-test.c b/tests/qtest/cmsdk-apb-timer-test.c
new file mode 100644
index 00000000000..e85e1f7448e
--- /dev/null
+++ b/tests/qtest/cmsdk-apb-timer-test.c
@@ -0,0 +1,75 @@
+/*
+ * QTest testcase for the CMSDK APB timer device
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
+/* IoTKit/ARMSSE-200 timer0; driven at 25MHz in mps2-an385, so 40ns per tick */
+#define TIMER_BASE 0x40000000
+
+#define CTRL 0
+#define VALUE 4
+#define RELOAD 8
+#define INTSTATUS 0xc
+
+static void test_timer(void)
+{
+    g_assert_true(readl(TIMER_BASE + INTSTATUS) == 0);
+
+    /* Start timer: will fire after 40 * 1000 == 40000 ns */
+    writel(TIMER_BASE + RELOAD, 1000);
+    writel(TIMER_BASE + CTRL, 9);
+
+    /* Step to just past the 500th tick and check VALUE */
+    clock_step(40 * 500 + 1);
+    g_assert_cmpuint(readl(TIMER_BASE + INTSTATUS), ==, 0);
+    g_assert_cmpuint(readl(TIMER_BASE + VALUE), ==, 500);
+
+    /* Just past the 1000th tick: timer should have fired */
+    clock_step(40 * 500);
+    g_assert_cmpuint(readl(TIMER_BASE + INTSTATUS), ==, 1);
+    g_assert_cmpuint(readl(TIMER_BASE + VALUE), ==, 0);
+
+    /* VALUE reloads at the following tick */
+    clock_step(40);
+    g_assert_cmpuint(readl(TIMER_BASE + VALUE), ==, 1000);
+
+    /* Check write-1-to-clear behaviour of INTSTATUS */
+    writel(TIMER_BASE + INTSTATUS, 0);
+    g_assert_cmpuint(readl(TIMER_BASE + INTSTATUS), ==, 1);
+    writel(TIMER_BASE + INTSTATUS, 1);
+    g_assert_cmpuint(readl(TIMER_BASE + INTSTATUS), ==, 0);
+
+    /* Turn off the timer */
+    writel(TIMER_BASE + CTRL, 0);
+}
+
+int main(int argc, char **argv)
+{
+    int r;
+
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_start("-machine mps2-an385");
+
+    qtest_add_func("/cmsdk-apb-timer/timer", test_timer);
+
+    r = g_test_run();
+
+    qtest_end();
+
+    return r;
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 34359a99b8e..6c15f7db317 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -581,6 +581,7 @@ F: include/hw/rtc/pl031.h
 F: include/hw/arm/primecell.h
 F: hw/timer/cmsdk-apb-timer.c
 F: include/hw/timer/cmsdk-apb-timer.h
+F: tests/qtest/cmsdk-apb-timer-test.c
 F: hw/timer/cmsdk-apb-dualtimer.c
 F: include/hw/timer/cmsdk-apb-dualtimer.h
 F: hw/char/cmsdk-apb-uart.c
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 7ccdf023111..519a40d5b82 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -142,6 +142,7 @@ qtests_npcm7xx = \
    'npcm7xx_timer-test',
    'npcm7xx_watchdog_timer-test']
 qtests_arm = \
+  (config_all_devices.has_key('CONFIG_CMSDK_APB_TIMER') ? ['cmsdk-apb-timer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_PFLASH_CFI02') ? ['pflash-cfi02-test'] : []) +         \
   (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
   ['arm-cpu-features',
-- 
2.20.1


