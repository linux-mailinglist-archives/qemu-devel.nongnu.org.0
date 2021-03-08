Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB68B331632
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:35:09 +0100 (CET)
Received: from localhost ([::1]:35188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKii-0000rl-M5
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:35:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJlE-0007Kn-TW
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:40 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:43826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJku-0007Aa-W1
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:40 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 u5-20020a7bcb050000b029010e9316b9d5so1354751wmj.2
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ziICIXGPvQZza0uMOa3mR8fWI7bLdTpYK7osvD3e7VI=;
 b=N7sdkzGgAZ3RxRvkjnnuaS6tLGu/n1RfpsjL88Jb3x25HR21pHCjgjSd+mjyA9NDAj
 zWZtT7N3NIORASnHU0cC3As/SMCM2+fjktOSl/BnSX5s3t3QpMK6mDpfBz1T5rNSAfdf
 wJ3Q74fsAe76k40iBuAPxS9hzWUp4G/e+37OhvmogzlyyDsLbKPl6GeEwZaM0vIyYZok
 GWC/NWi2EEL4BNcryiK/QwfKmSjY9sQC0POU+kxYGiK0w3F6ZMtxRaWspkxxMJ317JBu
 ruaaj0cDM0NUxa6BlA83nyjApXyfaCQz+wmfd80R6eCbfryfALUwUJKbZchl3oHQPCuo
 2mHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ziICIXGPvQZza0uMOa3mR8fWI7bLdTpYK7osvD3e7VI=;
 b=rmuD2LPjpPRTZqIzDA5QZjRBrPJ9eqGjB1OyMyG/LxVZB1ZrcyK12Dvj6OoKByLALi
 7WqRlMRb7Typ76dMaLLOR3+MByKbk34rSDbq/rFHqq0G3GEUDe0L3r1TuXbtM/z3nef6
 IeVf5ynIMZ6IhrLG4p10X3b+Flo7OofUQqISJUf3bCLF7NrUSD4zya6MQJnHzQlvT58/
 VuD6bdNLmDQ0B/gVB/+CBPzOcDT/ehsA73MOCblBHnp51smjlBhXIzV6zwxihh/oLPOg
 KRQHGMrg+E6Yx2J7ZkXWknrBrx+t5nvjjSeSTOIhKr+jGevktwiRGJ1l+kHcJGF6szNq
 zPPA==
X-Gm-Message-State: AOAM532Mv+e000Xdg5d1Top5Zn+2arriFDx6Zyt6LST78yENJ4PP0jBK
 u6x4Q6dXLBQGsd8Z5dQD4iFwryefdyTJFg==
X-Google-Smtp-Source: ABdhPJz807v0nf9G8n02jyy7pmgefxuLfuSF3rRdajZLcQu0GKcD46b0wyVyZE4lDH0v5f3Z1+45Jw==
X-Received: by 2002:a05:600c:1992:: with SMTP id
 t18mr3035296wmq.125.1615224799635; 
 Mon, 08 Mar 2021 09:33:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 46/54] tests/qtest/sse-timer-test: Test counter scaling changes
Date: Mon,  8 Mar 2021 17:32:36 +0000
Message-Id: <20210308173244.20710-47-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

Test that when we change the scaling of the system counter that the
system timer responds appropriately.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/qtest/sse-timer-test.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tests/qtest/sse-timer-test.c b/tests/qtest/sse-timer-test.c
index f4f6704b308..a65d7542d51 100644
--- a/tests/qtest/sse-timer-test.c
+++ b/tests/qtest/sse-timer-test.c
@@ -189,6 +189,37 @@ static void test_timer(void)
     g_assert_cmpuint(readl(TIMER_BASE + CNTP_AIVAL_HI), ==, 0x42);
 }
 
+static void test_timer_scale_change(void)
+{
+    /*
+     * Test that the timer responds correctly to counter
+     * scaling changes while it has an active timer.
+     */
+    reset_counter_and_timer();
+    /* Give ourselves access to the timer, and enable the counter and timer */
+    writel(PERIPHNSPPC0, 1);
+    writel(COUNTER_BASE + CNTCR, 1);
+    writel(TIMER_BASE + CNTP_CTL, 1);
+    /* Set the CompareValue to 4000 ticks */
+    writel(TIMER_BASE + CNTP_CVAL_LO, 4000);
+    writel(TIMER_BASE + CNTP_CVAL_HI, 0);
+    /* Advance halfway and check ISTATUS is not set */
+    clock_step_ticks(2000);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTP_CTL), ==, 1);
+    /* Reprogram the counter to run at 1/16th speed */
+    writel(COUNTER_BASE + CNTCR, 0);
+    writel(COUNTER_BASE + CNTSCR, 0x00100000); /* 1/16th normal speed */
+    writel(COUNTER_BASE + CNTCR, 5); /* EN, SCEN */
+    /* Advance to where the timer would have fired and check it has not */
+    clock_step_ticks(2000);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTP_CTL), ==, 1);
+    /* Advance to where the timer must fire at the new clock rate */
+    clock_step_ticks(29996);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTP_CTL), ==, 1);
+    clock_step_ticks(4);
+    g_assert_cmpuint(readl(TIMER_BASE + CNTP_CTL), ==, 5);
+}
+
 int main(int argc, char **argv)
 {
     int r;
@@ -199,6 +230,7 @@ int main(int argc, char **argv)
 
     qtest_add_func("/sse-timer/counter", test_counter);
     qtest_add_func("/sse-timer/timer", test_timer);
+    qtest_add_func("/sse-timer/timer-scale-change", test_timer_scale_change);
 
     r = g_test_run();
 
-- 
2.20.1


