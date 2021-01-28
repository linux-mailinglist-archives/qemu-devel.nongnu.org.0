Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5435C30754A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 12:58:10 +0100 (CET)
Received: from localhost ([::1]:51508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l55w9-00057f-Ds
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 06:58:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gr-0001hn-Po
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:21 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gg-0006Do-E1
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:21 -0500
Received: by mail-wr1-x435.google.com with SMTP id z6so5009044wrq.10
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 03:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iLfQwzRXcvknxpkyMmoH4p1ex2pddLgB3eHdSm55wjg=;
 b=bwwv7KEmATInReiDbCBFcHGyBcUZ53s8dsPWBufV3bWMQiRK96Rof6CB4H9cZZE3Ic
 M1/mdkrDVgiXxuOZSzAYebUOmo+vsEXWZI3q/GP1sLzeE2YdCiyRqhsWRfM3odUmuGRA
 YmIFZ2uBbyVgcQxfNacgALYcIhq9UK8pFCD1XucWBBHtbtmoE3cQ7t0PxKMYrU1GofBG
 AIzAXVkkiSLQanRSAfkgFPWzIXi7hIqXgIYon/TWPDHqE4h3mRvDmWB++otkEHoaeXEu
 5t/DE9LCWlDftlTNSf7cBRjNg0TqmxZenqnyW4X1AoNngG625hfUPYTaccT9ItsRK2tG
 khUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iLfQwzRXcvknxpkyMmoH4p1ex2pddLgB3eHdSm55wjg=;
 b=T/DQJPK1iA8G4opF+vzppf+AVtikmWC7040+1B1wHW94Eih3tpM201pV3gUfHnieDS
 iRl+h8qhIE44Br7QLkfMQtVjTeFfB5PjBOiY5VKnuQQ4Q+iBYI9HBrJw95uztLsuH1oi
 XWqN2EPyRYJiZlVcnJP51RbSOHIhhfVVVT9h59NR6a3SU73MKimWbmEjYgVg/yYhpN8a
 EYGpUu1OjfyPgmeNgVmQj6gg+hQ1F2GLN6qJw8W2zuTT7oUlA7mqLbB4/noJaGG5DYZn
 aNtl6UxhP4mucdT6xaeydm7Ht/VJq+4vsh0g33b3bUSsdgqRGnZKy0BEfNxFsLFOrZ5P
 ZLng==
X-Gm-Message-State: AOAM532LbED5M90xdrwjj3ImHaA5CLiRMWB9rMnk8/I5gQ14OLyK09kE
 1TQyC7PDlcLx6iYKWXgebWgPiQ==
X-Google-Smtp-Source: ABdhPJyT3RhlRzzrd538Maf2qicyvsTCcWi1bt8LcnmvDCoyl6s0EDNFtTaC1TPzSpS5CsCkjUVfwg==
X-Received: by 2002:a5d:4402:: with SMTP id z2mr15797119wrq.265.1611834128404; 
 Thu, 28 Jan 2021 03:42:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:42:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 21/25] tests/qtest/cmsdk-apb-watchdog-test: Test clock
 changes
Date: Thu, 28 Jan 2021 11:41:41 +0000
Message-Id: <20210128114145.20536-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

Now that the CMSDK APB watchdog uses its Clock input, it will
correctly respond when the system clock frequency is changed using
the RCC register on in the Stellaris board system registers.  Test
that when the RCC register is written it causes the watchdog timer to
change speed.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
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


