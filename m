Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67164307532
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 12:52:13 +0100 (CET)
Received: from localhost ([::1]:34128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l55qO-00063k-EG
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 06:52:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gV-00019N-J4
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:41:59 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:33138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gQ-00066N-V1
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:41:59 -0500
Received: by mail-wm1-x333.google.com with SMTP id s24so4982961wmj.0
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 03:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xHWq9yH9LoFSUmKAgq76pgTL0JY1lWeKpFcupzRjAI4=;
 b=wW3X6RlvpbSjFvjthZf79H4Yh4JODHixoCCBdBDNa00vko+4W9xDc/ct9G3eV4ffwE
 293ioufXEOSj8uC1k/kWkK8xPW/OoCto7IoiT/tACM8/24NQDP636WajW5FSe2cWl82A
 1He1iPeqOFCirC0C2fn8x/Iy39BWTbfsymdZoCtz9reoEivCryCX/BqJN57EH2qhIZZT
 Z2GkS5yCRIqAJREUrPsEPmVoMhq23ztYURerHBK6eGOFYs5UeqsH2C44dNFZRfZ0QQwC
 uqQoV5GqoE7tjp19Tunj2PYLSq4eA9qCT4A6Ty7vXwdACUJjDcFaPPP5DSlaNe0hgx6c
 OguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xHWq9yH9LoFSUmKAgq76pgTL0JY1lWeKpFcupzRjAI4=;
 b=hMVOXIXx0iY2L1bAyoMRXL0pU1oSSvu6ugISymcCHcjV0AxDptp5vRZ/2upjtEBCS0
 8NcRSfjmswahz74YuCQPD/nyFv6kJZTwmBwzThVNCbroeMhnaA88UsSLpbu9OFYf4ql5
 YSWQkpR33vJ/PvHOQoHnh2Wa5m+F+HG/6BsdoJI9RYfx/Sncz0QOFXoqzWC3PVEByBj3
 zIoUS1StKF+oTkJenq3jV23zhVYOcvsJ/fogTHn2kLZJL3XK6xpeSZwly4QvfGCfAk5k
 Nr6aIdect2MOUVj3wg4hr/NNiShyd+dfFla92dYJJuOZRHtQ5oVXWnVbHs6XAqlIod8h
 Lj3A==
X-Gm-Message-State: AOAM530j/QFXePDBuJNDDVU2gsKqh9p+M1dXHwvV44kIcI1Tb4AEQoU+
 u+A5mGvn/AapXrzjdRTY+OVO5w==
X-Google-Smtp-Source: ABdhPJwmQNQF/xojWT0/j+yN41UZ7sTYg7Rz0Y+yiOxSpWx2nTc6m7B1QtwHOM8AScfCe+IxMJCq9w==
X-Received: by 2002:a1c:e1d4:: with SMTP id y203mr8375856wmg.50.1611834112248; 
 Thu, 28 Jan 2021 03:41:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:41:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 04/25] tests: Add a simple test of the CMSDK APB watchdog
Date: Thu, 28 Jan 2021 11:41:24 +0000
Message-Id: <20210128114145.20536-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

Add a simple test of the CMSDK watchdog, since we're about to do some
refactoring of how it is clocked.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210121190622.22000-5-peter.maydell@linaro.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v1->v2 changes:
 - remove set-but-not-used QTestState *s variable
---
 tests/qtest/cmsdk-apb-watchdog-test.c | 79 +++++++++++++++++++++++++++
 MAINTAINERS                           |  1 +
 tests/qtest/meson.build               |  1 +
 3 files changed, 81 insertions(+)
 create mode 100644 tests/qtest/cmsdk-apb-watchdog-test.c

diff --git a/tests/qtest/cmsdk-apb-watchdog-test.c b/tests/qtest/cmsdk-apb-watchdog-test.c
new file mode 100644
index 00000000000..950f64c527b
--- /dev/null
+++ b/tests/qtest/cmsdk-apb-watchdog-test.c
@@ -0,0 +1,79 @@
+/*
+ * QTest testcase for the CMSDK APB watchdog device
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
+ * lm3s811evb watchdog; at board startup this runs at 200MHz / 16 == 12.5MHz,
+ * which is 80ns per tick.
+ */
+#define WDOG_BASE 0x40000000
+
+#define WDOGLOAD 0
+#define WDOGVALUE 4
+#define WDOGCONTROL 8
+#define WDOGINTCLR 0xc
+#define WDOGRIS 0x10
+#define WDOGMIS 0x14
+#define WDOGLOCK 0xc00
+
+static void test_watchdog(void)
+{
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 0);
+
+    writel(WDOG_BASE + WDOGCONTROL, 1);
+    writel(WDOG_BASE + WDOGLOAD, 1000);
+
+    /* Step to just past the 500th tick */
+    clock_step(500 * 80 + 1);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 0);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 500);
+
+    /* Just past the 1000th tick: timer should have fired */
+    clock_step(500 * 80);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 1);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 0);
+
+    /* VALUE reloads at following tick */
+    clock_step(80);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 1000);
+
+    /* Writing any value to WDOGINTCLR clears the interrupt and reloads */
+    clock_step(500 * 80);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 500);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 1);
+    writel(WDOG_BASE + WDOGINTCLR, 0);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 1000);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 0);
+}
+
+int main(int argc, char **argv)
+{
+    int r;
+
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_start("-machine lm3s811evb");
+
+    qtest_add_func("/cmsdk-apb-watchdog/watchdog", test_watchdog);
+
+    r = g_test_run();
+
+    qtest_end();
+
+    return r;
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 6c15f7db317..3729b89f359 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -588,6 +588,7 @@ F: hw/char/cmsdk-apb-uart.c
 F: include/hw/char/cmsdk-apb-uart.h
 F: hw/watchdog/cmsdk-apb-watchdog.c
 F: include/hw/watchdog/cmsdk-apb-watchdog.h
+F: tests/qtest/cmsdk-apb-watchdog-test.c
 F: hw/misc/tz-ppc.c
 F: include/hw/misc/tz-ppc.h
 F: hw/misc/tz-mpc.c
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 74addd74868..9e2ebc47041 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -142,6 +142,7 @@ qtests_npcm7xx = \
    'npcm7xx_watchdog_timer-test']
 qtests_arm = \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_TIMER') ? ['cmsdk-apb-timer-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_CMSDK_APB_WATCHDOG') ? ['cmsdk-apb-watchdog-test'] : []) + \
   (config_all_devices.has_key('CONFIG_PFLASH_CFI02') ? ['pflash-cfi02-test'] : []) +         \
   (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
   ['arm-cpu-features',
-- 
2.20.1


