Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F33B43315F5
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:26:00 +0100 (CET)
Received: from localhost ([::1]:41510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKZr-00008T-Vq
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:26:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJlD-0007Fe-2m
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:39 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:53881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkt-0007AN-NP
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:38 -0500
Received: by mail-wm1-x32a.google.com with SMTP id e23so7076wmh.3
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0QSgENxPodeERyX3wjHF2JsPdbAiOKFPApXQHK2hDWo=;
 b=inxYl9ajATwJSuOd86WbvuqlLTVsa6WDsKa+Jod7kXkgDRNFAHDjp6xEUbQJQa8NWo
 92ThB/D50fAS/q5tmcYQrJwnriS72w7YzdoWWxHJB2X6JvV8iXpIYkUezIC44EidTeoG
 UDmGWuM9nH7UJ3R59Y1xIrzRQcRJlL8ExjlCCsRPSVAMw0oxiw1RJxQSdnyjz2YZB7ue
 rFhSUzBjIgagaaf07Z2/ACvVsl0HOms95mlB0maAIhVF3WoT052hFHJk/NCXbZwDaZX+
 um0Q8JNd53DNwWb8Ro1PfkFtkJeuUGz5gRTwGOw4lHxjnG1cyHpP6VCQODgtOa/AoStk
 Rpjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0QSgENxPodeERyX3wjHF2JsPdbAiOKFPApXQHK2hDWo=;
 b=Pj2WQ0nLSer2PgC+kyX8z6jFbMjUleMJoANU2p+Jk2AwG/heHfMwtv923SGzYjGXou
 3So1aKHaiM8NKa6Oxco3221BjbCoj19MrHx/SWM5ydaffYDzD8trCA4n1bwIh4Lr4GWR
 Ym3aoMhQkbworyXTF1/rhCj6xG+dmZKI/7QEjqGNgCmutzE42Nk7d48MunpX/fe7LGL0
 vViBhNixva/otVePGvZ1dGIVp6nAMSuNeMNPKad6Fk8tZHEyrXN/PeJ1WvNVd2eOepnH
 pxEwW4cfiygFWy9D3NTAmx1iwn/TntCwmyifxzmBL16aTrwpg0ltfFM6lgiUPlATBckD
 i0aA==
X-Gm-Message-State: AOAM533ZmFzcNBiPDX0jQRlVmIa3RA+zG0P03/SOnWylt/Ue5XE5vluC
 6zvAzVfpsZOovNjuTUzxb8GqzHjuWNXrlQ==
X-Google-Smtp-Source: ABdhPJy87XGvoK5Z7jy6s3Xlh84dx7jKI0wMpltbiJGCkOjj8t+iQ9HZ0P4qn/icVYGUZuYg5uBg1g==
X-Received: by 2002:a7b:c5d0:: with SMTP id n16mr23250697wmk.27.1615224798455; 
 Mon, 08 Mar 2021 09:33:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 44/54] tests/qtest/sse-timer-test: Add simple test of the SSE
 counter
Date: Mon,  8 Mar 2021 17:32:34 +0000
Message-Id: <20210308173244.20710-45-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

Add a simple qtest to exercise the new system counter device in the
SSE-300.

We'll add tests of the system timer device here too, so this includes
scaffolding (register definitions, etc) for those.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210219144617.4782-45-peter.maydell@linaro.org
---
 tests/qtest/sse-timer-test.c | 117 +++++++++++++++++++++++++++++++++++
 MAINTAINERS                  |   1 +
 tests/qtest/meson.build      |   1 +
 3 files changed, 119 insertions(+)
 create mode 100644 tests/qtest/sse-timer-test.c

diff --git a/tests/qtest/sse-timer-test.c b/tests/qtest/sse-timer-test.c
new file mode 100644
index 00000000000..5b86ef6dbbf
--- /dev/null
+++ b/tests/qtest/sse-timer-test.c
@@ -0,0 +1,117 @@
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
+int main(int argc, char **argv)
+{
+    int r;
+
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_start("-machine mps3-an547");
+
+    qtest_add_func("/sse-timer/counter", test_counter);
+
+    r = g_test_run();
+
+    qtest_end();
+
+    return r;
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index bd863cfeca4..be8385255d0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -757,6 +757,7 @@ F: hw/timer/sse-counter.c
 F: include/hw/timer/sse-counter.h
 F: hw/timer/sse-timer.c
 F: include/hw/timer/sse-timer.h
+F: tests/qtest/sse-timer-test.c
 F: docs/system/arm/mps2.rst
 
 Musca
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 58efc46144e..2688e1bfad7 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -157,6 +157,7 @@ qtests_npcm7xx = \
    'npcm7xx_watchdog_timer-test'] + \
    (slirp.found() ? ['npcm7xx_emc-test'] : [])
 qtests_arm = \
+  (config_all_devices.has_key('CONFIG_MPS2') ? ['sse-timer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_DUALTIMER') ? ['cmsdk-apb-dualtimer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_TIMER') ? ['cmsdk-apb-timer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_WATCHDOG') ? ['cmsdk-apb-watchdog-test'] : []) + \
-- 
2.20.1


