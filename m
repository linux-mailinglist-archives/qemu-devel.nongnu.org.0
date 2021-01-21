Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DABE2FF44C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:24:26 +0100 (CET)
Received: from localhost ([::1]:33970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fZB-0000Tv-6E
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:24:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fID-0002ID-0A
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:06:54 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:32897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fHu-0005ml-Fz
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:06:50 -0500
Received: by mail-wr1-x433.google.com with SMTP id 7so2830971wrz.0
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TB7wjfajbIvKGvglJefMlToUTk7cmyyxw+srKxsN0iM=;
 b=tG46E8L4NhWAz79VmzTFQli25+44SF+SEEPyDCObVfykbsivI3dQzc+yyaK5dkpgpX
 1QiPeanvfPTyI1K0E5v57PSSIbxhvEwb09Z1aSTjnwIyhfhOYSCSb2QZDorfq3YsCjGw
 zojMo4+fQF88bx72fZMLfCJ+9OgGPBVJwjCT1jU9GOFum0yj0TNsz42oY7ghRM83+vvB
 yPpISmsPO2DF9aXpB4aUbOuIhvf6pH8m+UdtG2rSI+8uXeQs613FTTa0Xb96Unxnlm2o
 vOfr4yR3MNchPQiBeO8+tHil4nYEq4fjnCBIOCEL8ZzRW5agHddZ4UJBapIM0Jx0H5Xe
 UAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TB7wjfajbIvKGvglJefMlToUTk7cmyyxw+srKxsN0iM=;
 b=p76KQxmzaD8uKLmnDD0vA9OfJ9oQnpOAxPynOhc1gIiq2k8DGERPr80szV9W4AUewB
 7xK5f/z49P3eE383gdhCKEDCTV+4j/s6UkvIJjcwRXJKwVo3KWJM9gKJmWxDWovGqVf1
 Dj+MC6PyT9nJrdRcPzir6gkHO5BSk+OkaIlOUEA+8Ms9z2wklOOlhnhaMJH8rkvu7SvG
 zSei/9pGRVSr1sIj4Axo1/ltcZi1yA7wlmSD8MApWWi80dVfNElVT2MzqZn6RNE5wM4N
 BudYOOTmuQfb5WLfIPZxpdrbYWbacWxeUNhAdsG6ED0DRe6DUJSn1x+kLm5lTkttPAF3
 ThBg==
X-Gm-Message-State: AOAM530HxLlttELkA9g58xf1krz5EKKUWXmDTqyK5l9w2KreFq/O3kMB
 bUFBkZaJ29nvGFwUlQk1TjFhGA==
X-Google-Smtp-Source: ABdhPJw6OAW6z6R0PwKdv2TRpmORVWal62iEh4QvR5SvmUf9G/bzdjWpF7811EK/CKj595+XhtSX6w==
X-Received: by 2002:adf:dc89:: with SMTP id r9mr932065wrj.52.1611255989324;
 Thu, 21 Jan 2021 11:06:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m18sm9820686wrw.43.2021.01.21.11.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:06:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 04/25] tests: Add a simple test of the CMSDK APB watchdog
Date: Thu, 21 Jan 2021 19:06:01 +0000
Message-Id: <20210121190622.22000-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121190622.22000-1-peter.maydell@linaro.org>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

Add a simple test of the CMSDK watchdog, since we're about to do some
refactoring of how it is clocked.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/cmsdk-apb-watchdog-test.c | 80 +++++++++++++++++++++++++++
 MAINTAINERS                           |  1 +
 tests/qtest/meson.build               |  1 +
 3 files changed, 82 insertions(+)
 create mode 100644 tests/qtest/cmsdk-apb-watchdog-test.c

diff --git a/tests/qtest/cmsdk-apb-watchdog-test.c b/tests/qtest/cmsdk-apb-watchdog-test.c
new file mode 100644
index 00000000000..c6add1fee85
--- /dev/null
+++ b/tests/qtest/cmsdk-apb-watchdog-test.c
@@ -0,0 +1,80 @@
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
+    QTestState *s;
+    int r;
+
+    g_test_init(&argc, &argv, NULL);
+
+    s = qtest_start("-machine lm3s811evb");
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
index 010405b0884..58956497888 100644
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


