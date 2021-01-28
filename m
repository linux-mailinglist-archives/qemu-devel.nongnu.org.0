Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE4530750B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 12:44:11 +0100 (CET)
Received: from localhost ([::1]:35302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l55ic-0003SD-T3
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 06:44:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gV-00019C-Eh
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:41:59 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gO-000663-JA
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:41:59 -0500
Received: by mail-wr1-x431.google.com with SMTP id v15so5075579wrx.4
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 03:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Rp4YOjE1gcv04Ecoqqv1uDwHaV4/xeO6+AU9Z5cIK8=;
 b=qgGwCvDyOBuBYSwXrb0TpopTCYOR8WonUDAj5iLrHy49Tk9m6yB+rbYPrmCsemxJWR
 eITAFuxGsGn1/IYlcWGhUBMBLEBqz0Hak0ser/l/hpeiTZZcCy6e+NIOfTUqABp7VUBV
 MzQeuVokkm5zkGSV7KuV47WpvGaKo/LT+7y44gCzAE2ICZKYpx4LSjuUCBg3hRtV/rhL
 fwBkbehmty+RTOH41eVyjOi9BMOcdOizedaLbqfSDuE2rfmVbReVPqUmMu8W8WQTHEcI
 RRES/f2HeIjZv8plY0rtrjG6ChI1Exz/xdSRRTarHrSiZ+4hZXDux46iOvUfDjl7/ca9
 UhEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Rp4YOjE1gcv04Ecoqqv1uDwHaV4/xeO6+AU9Z5cIK8=;
 b=VKgYp3YZ3nOlvG5iGGjqncxllPGoMm+ATTdA11FrpRwGwzcQxa+PO2z1hUIUY0KzT0
 4Epkxvb/48negJsh0TXrLIiEsyw3e5aUID/5wVb/EfDYlhWGZy9hip5WAQ9M8MSfDTjC
 oGctKHTDmrYYJCM/UJC9G+uBh4Z3joWBlSeXlI2U22wdyPiqXD8FGfVBlGQRaY+elWLN
 navHmrsrFeKmxT9/VjrxJR7MLjlWVkIS7TcTU1WRAExKGIVxVcTWcw8CSo6vDVfDb0ZQ
 FIok1s/YCmrWGvpCvcYunIO0+V4vsEAw253w1hsmc98BX/NOfER41WuGGiiJxeU3b4G1
 x6+A==
X-Gm-Message-State: AOAM530FvXxy6yjkNfX+htqdKEkuWvf6fa8ZMbTjsoEc5arF51r4Tk/w
 5yYdSK1zR/AJXv3yUe5Uf6TrWQ==
X-Google-Smtp-Source: ABdhPJzC6LiKFB8iB2FcNoeKkiWZV2Q15E3h/Jnh3gPGRYVnSZbX65+ttSRSdyot2JDOwjaUlAfBRQ==
X-Received: by 2002:adf:f452:: with SMTP id f18mr15394336wrp.11.1611834111278; 
 Thu, 28 Jan 2021 03:41:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:41:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 03/25] tests: Add a simple test of the CMSDK APB timer
Date: Thu, 28 Jan 2021 11:41:23 +0000
Message-Id: <20210128114145.20536-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a simple test of the CMSDK APB timer, since we're about to do
some refactoring of how it is clocked.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210121190622.22000-4-peter.maydell@linaro.org
---
v1->v2 changes:
 - phrase various clock_step() arguments as calculations
   based on tick counts and the ns-per-tick value rather
   than just the final numbers
 - remove set-but-not-used QTestState *s variable
   that gcc warns about but clang does not
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
index 16d04625b8b..74addd74868 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -141,6 +141,7 @@ qtests_npcm7xx = \
    'npcm7xx_timer-test',
    'npcm7xx_watchdog_timer-test']
 qtests_arm = \
+  (config_all_devices.has_key('CONFIG_CMSDK_APB_TIMER') ? ['cmsdk-apb-timer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_PFLASH_CFI02') ? ['pflash-cfi02-test'] : []) +         \
   (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
   ['arm-cpu-features',
-- 
2.20.1


