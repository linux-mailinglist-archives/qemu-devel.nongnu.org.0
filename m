Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 694652FF44D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:24:37 +0100 (CET)
Received: from localhost ([::1]:35134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fZM-0000zO-F8
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fIX-0002fb-Lf
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:07:13 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fI7-0005wf-2t
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:07:13 -0500
Received: by mail-wr1-x42a.google.com with SMTP id m4so2809967wrx.9
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=drkjv5Dr4fNxDyNRqjV5mGa+nW4Kje9Rbck6xlQDEzo=;
 b=YHf0cUWqP75ModYpAPc8KsC8hT4kMqRKyGlWW9/za7CxJLWzpPZWtgsmH4nraxh6l7
 cSEJv6v/joGmXITlKI6RKW92Mpxko0Jrmipncc9MX2UcEJFF5rN1rz4sCdr5mlnW1OuL
 8w3FBu7AMx42+MV4315utqfjdZk20tulI7QsZGAwGfNwtmIgrLjQ5gTrepqwTY5jfaMS
 3M6/7PruEd8btc1aNZuM2f0SYAUSpJEa0m1eCfCMigRwc6uvFpccNSEBmGsu25en1A6Q
 7dYicb01BEBDeQMGMEb1C0vXNoBatu4jcCWpaapo2w4oBMWEarlQTsuMLeB7rMmee5YS
 bEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=drkjv5Dr4fNxDyNRqjV5mGa+nW4Kje9Rbck6xlQDEzo=;
 b=m0SWbBahG8wLBHEdcKZewmtYxRVYpL5DrUj9IAiYDZfm1bhljg9eVnbJaGJ9ADcP8d
 qQfg3cREnxp4vjpsMcHvNAaxIckr5XZ31CP8ozIpCjTYIoT6LoMzKSlwsfcbU/MEVks7
 OjdrGJtl75xOYCHnEIZIqEbqqebb7wG5hFENEyNBqz3dX8l3M6pC40S268uRgmDdg+w7
 fZkBbHSrHgEIFtF7YR7He6jM6xFTq/kcrSds2+RS+5PdHhN7+H4cO5Ykzt/gFyCYfY05
 Z2OvbwzMCT++rJpzhlvfLZxdL/ZmMqgnlKwkO2bOeaILachiU8ojbplvZLS2rvytPZJU
 SN0A==
X-Gm-Message-State: AOAM5331JUUQKsfyVnkiqSbJvtGcN//lTCD0FnwNCwJaGztU52fR2WBt
 QaXdtiGTRSiNuyk2SKUWxGT85A==
X-Google-Smtp-Source: ABdhPJxN2ScO4ZhhqNnJ0dhyxsakpBE11cXKA/UCwVX84Drb+XB55pEsNlTXjXc3/4u3f9pIdtrVCA==
X-Received: by 2002:adf:dc89:: with SMTP id r9mr933062wrj.52.1611256005478;
 Thu, 21 Jan 2021 11:06:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m18sm9820686wrw.43.2021.01.21.11.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:06:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 21/25] tests/qtest/cmsdk-apb-watchdog-test: Test clock changes
Date: Thu, 21 Jan 2021 19:06:18 +0000
Message-Id: <20210121190622.22000-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121190622.22000-1-peter.maydell@linaro.org>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

Now that the CMSDK APB watchdog uses its Clock input, it will
correctly respond when the system clock frequency is changed using
the RCC register on in the Stellaris board system registers.  Test
that when the RCC register is written it causes the watchdog timer to
change speed.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/cmsdk-apb-watchdog-test.c | 52 +++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/tests/qtest/cmsdk-apb-watchdog-test.c b/tests/qtest/cmsdk-apb-watchdog-test.c
index c6add1fee85..9a4873a8314 100644
--- a/tests/qtest/cmsdk-apb-watchdog-test.c
+++ b/tests/qtest/cmsdk-apb-watchdog-test.c
@@ -15,6 +15,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/bitops.h"
 #include "libqtest-single.h"
 
 /*
@@ -31,6 +32,11 @@
 #define WDOGMIS 0x14
 #define WDOGLOCK 0xc00
 
+#define SSYS_BASE 0x400fe000
+#define RCC 0x60
+#define SYSDIV_SHIFT 23
+#define SYSDIV_LENGTH 4
+
 static void test_watchdog(void)
 {
     g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 0);
@@ -61,6 +67,50 @@ static void test_watchdog(void)
     g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 0);
 }
 
+static void test_clock_change(void)
+{
+    uint32_t rcc;
+
+    /*
+     * Test that writing to the stellaris board's RCC register to
+     * change the system clock frequency causes the watchdog
+     * to change the speed it counts at.
+     */
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 0);
+
+    writel(WDOG_BASE + WDOGCONTROL, 1);
+    writel(WDOG_BASE + WDOGLOAD, 1000);
+
+    /* Step to just past the 500th tick */
+    clock_step(80 * 500 + 1);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 0);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 500);
+
+    /* Rewrite RCC.SYSDIV from 16 to 8, so the clock is now 40ns per tick */
+    rcc = readl(SSYS_BASE + RCC);
+    g_assert_cmpuint(extract32(rcc, SYSDIV_SHIFT, SYSDIV_LENGTH), ==, 0xf);
+    rcc = deposit32(rcc, SYSDIV_SHIFT, SYSDIV_LENGTH, 7);
+    writel(SSYS_BASE + RCC, rcc);
+
+    /* Just past the 1000th tick: timer should have fired */
+    clock_step(40 * 500);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 1);
+
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 0);
+
+    /* VALUE reloads at following tick */
+    clock_step(41);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 1000);
+
+    /* Writing any value to WDOGINTCLR clears the interrupt and reloads */
+    clock_step(40 * 500);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 500);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 1);
+    writel(WDOG_BASE + WDOGINTCLR, 0);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGVALUE), ==, 1000);
+    g_assert_cmpuint(readl(WDOG_BASE + WDOGRIS), ==, 0);
+}
+
 int main(int argc, char **argv)
 {
     QTestState *s;
@@ -71,6 +121,8 @@ int main(int argc, char **argv)
     s = qtest_start("-machine lm3s811evb");
 
     qtest_add_func("/cmsdk-apb-watchdog/watchdog", test_watchdog);
+    qtest_add_func("/cmsdk-apb-watchdog/watchdog_clock_change",
+                   test_clock_change);
 
     r = g_test_run();
 
-- 
2.20.1


