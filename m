Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5AF30884A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:33:18 +0100 (CET)
Received: from localhost ([::1]:50448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5S1d-0005Lf-Pw
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:33:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWP-00059q-3t
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:01:01 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWH-00079q-Sy
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:01:00 -0500
Received: by mail-wm1-x32e.google.com with SMTP id i9so6832745wmq.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=I+7L5SpLExP6qZhOnla6nrvNT3mA6kf2oerfjRIUi8o=;
 b=MjWu6j1J0olS5a4qfbUKDzDRHG3JdN4lzMRUNxPbMFp4e8J7mpzKNmpnu7t2X+QtFj
 AglvAyGCfGG3HQjfroATfz04UVoNHyLwKno4wnm6QhRxuGqTTOAMET2X0clXB1Dvux+f
 PvGo1rtBzWfqJm3fpwrh2oF916pOI2Ea2F6ieB56nAnJKNZKjQdlPgK+eLgpBBmVVIQe
 fG0obiChm8U+xRxiq+0Ev9jDSob32ddhtxRyU+v8nEXB6/Qm0nOWInmpNKbHMzuMeIx2
 6xPrpTmZdTZiEH7HE7cKeahsG6ahUcuG+bpvThbM2P774Z7e2moBMroSbbbx5mfPumP+
 X7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I+7L5SpLExP6qZhOnla6nrvNT3mA6kf2oerfjRIUi8o=;
 b=n4iJGeTNWPTVjTPA2Lt3soGTXT3PSxPxfVwdRmDgdOFVJo1wksvWe2UXKVG4i2FJuy
 by0grMW3UPvp63ZQRu8x0ZS9b97FCC3pUVgkpxAlL96Bo2mkMSzo+Ubl8CHFwGawj+Hm
 LaQcNixINxhtWzMq83Dvm3a5C59RWKmCWhdoQhRzNQisTX+Ej7nnZer0lkm8xbpreK3+
 nn9ltqNut90BgA9sFS0yT51RJEpXnw60q0eFCN7QthclsecgNahu/KOtndSecTWmniaq
 5/IMmN6mqg3AEwfs4jTG0L7pbO20K2lNb/kaXbDGIWsNxWXocbNtRyiHACi9+RrZ3vb+
 4Ejg==
X-Gm-Message-State: AOAM5322I6czn7/p6yOCYXZ9lPhV6NwlSs77la9bN6isuE6LJK5jz0jT
 Lw9tw2pTETuS7abmV/MFLFsF9jkChRitUA==
X-Google-Smtp-Source: ABdhPJxo0iMrVWVGaYZkJtrCip4HS85qjVqZenTffKvwlPliF4jo6Cg2gVrKi+XfaSJNazZ9uyBCKA==
X-Received: by 2002:a7b:c8c3:: with SMTP id f3mr3286643wml.110.1611918052432; 
 Fri, 29 Jan 2021 03:00:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 42/46] tests/qtest/cmsdk-apb-watchdog-test: Test clock changes
Date: Fri, 29 Jan 2021 11:00:08 +0000
Message-Id: <20210129110012.8660-43-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

Now that the CMSDK APB watchdog uses its Clock input, it will
correctly respond when the system clock frequency is changed using
the RCC register on in the Stellaris board system registers.  Test
that when the RCC register is written it causes the watchdog timer to
change speed.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210128114145.20536-22-peter.maydell@linaro.org
Message-id: 20210121190622.22000-22-peter.maydell@linaro.org
---
 tests/qtest/cmsdk-apb-watchdog-test.c | 52 +++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/tests/qtest/cmsdk-apb-watchdog-test.c b/tests/qtest/cmsdk-apb-watchdog-test.c
index 950f64c527b..2710cb17b86 100644
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
     int r;
@@ -70,6 +120,8 @@ int main(int argc, char **argv)
     qtest_start("-machine lm3s811evb");
 
     qtest_add_func("/cmsdk-apb-watchdog/watchdog", test_watchdog);
+    qtest_add_func("/cmsdk-apb-watchdog/watchdog_clock_change",
+                   test_clock_change);
 
     r = g_test_run();
 
-- 
2.20.1


