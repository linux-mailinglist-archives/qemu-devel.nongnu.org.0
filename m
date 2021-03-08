Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC26A331664
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:42:17 +0100 (CET)
Received: from localhost ([::1]:50154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKpc-0007Ig-Tc
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:42:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJlG-0007Od-EF
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:42 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:40819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJku-0007AU-Cd
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:42 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so4304174wmy.5
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=K6nd6g0rxTnLj8XNzFmkG8RGXqmwvZZCv/LbboGnsdc=;
 b=Wdav2/ffWFJs4R2QEHgqyyEoxRPZPGddsU1fB8mF5+F5Mm2q+eRTZFjmkh1Zwp0ahd
 xBMIDoc9heZL50Sn4VKfteEQI3jXfHmBf1NkxfHOdP2C8i4IwhO//1xdxTKZR5GZxTKk
 gABLGLnvgfm7YhPjC24sJXaG58UUJ9fpw6Gu2BPuZ+OPkC3RH98yB0aQyYt92J2KORdy
 G2MtW5UKQ9Q9FPxrdmxCTmqp61+LKcoAIKWyIwWLF6wtcFNjEv+4CQrRAAUApRE3uB34
 Z8dP1W/NXrlAOikq0YJppBR5+FLLgp99t1jjfCG8mwabi3WNN1yF3mmcCC3rTHaRV9f9
 DK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K6nd6g0rxTnLj8XNzFmkG8RGXqmwvZZCv/LbboGnsdc=;
 b=jkCGWDPJdq0ChMh8RbqmPrPpibWWiwW8dJ1U/T59eHQ19TufQg+O571M/7snnGInji
 gs4WOong2vymOqvO02TV0kTe9tbqLtyWm6sHN0aGQnOYGJ5flwobzD9o4mEdjGbonVzq
 Gm+vhoxLWOTTnAVpn99fRur4I9sIIJR0X3t+q42qZS3pUEaSZKENAyq2aqsT6nU5Qdbv
 pj0TIWJzBuVmwZzVEDctx0cKFy7bF04RB1kHBDL9HQexPiFJtAdf5aSrxjKHtsf7ZUQ2
 68GTM4v9MqiF0uZnIJXiuuqTUwikT7ZRyQCrOGObNHK2UIgwxlfllLud8n5XZzAgNP3y
 naQg==
X-Gm-Message-State: AOAM531PQcJe9cIpQ9O8hYZ+hcV+IudCkWuXUjcY3x2Ou4AaP36xwc88
 VZ2gFyewglI8Yr2hNyFy9HefVCYI9u52FQ==
X-Google-Smtp-Source: ABdhPJy7S8L36n6ocBVwrezYZ9kGCjJGv8m4/qDvg9KfY9dT15lRpU6wHj1+YD4aYOHW8KbPOHYYlQ==
X-Received: by 2002:a05:600c:204f:: with SMTP id
 p15mr23419224wmg.165.1615224799046; 
 Mon, 08 Mar 2021 09:33:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 45/54] tests/qtest/sse-timer-test: Test the system timer
Date: Mon,  8 Mar 2021 17:32:35 +0000
Message-Id: <20210308173244.20710-46-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

Add a test which tests various parts of the functionality of the
SSE system timer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/qtest/sse-timer-test.c | 91 ++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/tests/qtest/sse-timer-test.c b/tests/qtest/sse-timer-test.c
index 5b86ef6dbbf..f4f6704b308 100644
--- a/tests/qtest/sse-timer-test.c
+++ b/tests/qtest/sse-timer-test.c
@@ -99,6 +99,96 @@ static void test_counter(void)
     g_assert_cmpuint(readl(COUNTER_BASE + CNTCV_HI), ==, 0);
 }
 
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
 int main(int argc, char **argv)
 {
     int r;
@@ -108,6 +198,7 @@ int main(int argc, char **argv)
     qtest_start("-machine mps3-an547");
 
     qtest_add_func("/sse-timer/counter", test_counter);
+    qtest_add_func("/sse-timer/timer", test_timer);
 
     r = g_test_run();
 
-- 
2.20.1


