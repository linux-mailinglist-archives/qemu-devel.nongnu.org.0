Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDF3690AE3
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 14:52:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ7KC-00012i-Iu; Thu, 09 Feb 2023 08:50:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQ7KA-00012F-4b
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:50:54 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQ7K8-0005RR-Bm
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:50:53 -0500
Received: by mail-wm1-x32d.google.com with SMTP id bg26so1511569wmb.0
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 05:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jKQEXo8yQGsYQylJFf2Ag/MzExR4yu93T7xGgURWHb8=;
 b=uCY7S2Lka/QZt+cVELKAez8u/CSYM4uh75vnXxDQ0g8D0Rf9+FD/iW1NkGQtFH0Q6x
 76Vstc0jKdiz67sC4F07EprLR6XviG8oy/2YNLgw+7hw+7WNj9FUrL3yygOGN0fnebCz
 nsqTRH6ZcysYlezBfc75wqbt07ib6rCUldF0Hw7OsDzW9JA59+oqtVzCRS+6FcBErQwG
 Rc6yE2BxBh5UJGIDXJbjmf2n/782B3glDVDKnltpusVwBPEIbLNMgHFrja+fO7+l9cdv
 oMEFoIOkelZ17wGf1XkyI4hGrtsNXZwAjFLpzhUrZb6yN2olSYllrn3K/82+bd+8yFRO
 aayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jKQEXo8yQGsYQylJFf2Ag/MzExR4yu93T7xGgURWHb8=;
 b=wZFYFc7xAOhO/2Gbl8jlG6HtMcy+fvHdpID0N0ytJ3FvWNiQeYgrrKQ3SWr7Voa+mL
 sOofYLVFX7ZE4cQfsCNsLVtgBdlxzXhUcWMTB4vGNERpAUu56QjaVqjPACoIG8PtO6nt
 kQnFPbIs1NpW+L8IphFyfGjYBJW7rAAwgMqSv7QGD5bjtbpabGmzZDYWWg9cyFLiZqfb
 Q1Em16v9lUJZATxUVYE0lHU7aZi74NbazGxMC0xgE3HLxxPRRyc6Nq828K8TKL0MlJ4P
 H5BbNKlnB/XFVqK02e/m9ZITdIBYhw9rvM6fM4VYpe6bwPrBIrE2XZq+2Fzc2/b/y7+H
 /eDg==
X-Gm-Message-State: AO0yUKXz/esh1tv44cWD3bclNcZbAW1ydUgxkUtkHDKLSrzu9a6pEKdz
 AYBVEj4qC/Hw4sU3IDDb61TdM5ynEIGyTt7a
X-Google-Smtp-Source: AK7set9X501mqJYSHuhpxTp4NiUpYUMGgxzrfVjOqKOsqvN2ljDt4ICFiTcsrn9KqcrpzBCQ9Vwbiw==
X-Received: by 2002:a05:600c:43d2:b0:3df:eedf:df32 with SMTP id
 f18-20020a05600c43d200b003dfeedfdf32mr11417388wmn.17.1675950650424; 
 Thu, 09 Feb 2023 05:50:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c358d00b003dd19baf45asm2151748wmq.40.2023.02.09.05.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 05:50:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH] tests/qtest/npcm7xx_pwm-test: Be less verbose unless V=2
Date: Thu,  9 Feb 2023 13:50:47 +0000
Message-Id: <20230209135047.1753081-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The npcm7xx_pwm-test produces a lot of output at V=1, which
means that on our CI tests the log files exceed the gitlab
500KB limit. Suppress the messages about exactly what is
being tested unless at V=2 and above.

This follows the pattern we use with qom-test.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
An example job log that got truncated because of this is:
https://gitlab.com/qemu-project/qemu/-/jobs/3742560168

 tests/qtest/npcm7xx_pwm-test.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.c
index e320a625c4b..ea4ca1d106e 100644
--- a/tests/qtest/npcm7xx_pwm-test.c
+++ b/tests/qtest/npcm7xx_pwm-test.c
@@ -20,6 +20,8 @@
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qnum.h"
 
+static int verbosity_level;
+
 #define REF_HZ          25000000
 
 /* Register field definitions. */
@@ -221,7 +223,9 @@ static uint64_t pwm_qom_get(QTestState *qts, const char *path, const char *name)
     QDict *response;
     uint64_t val;
 
-    g_test_message("Getting properties %s from %s", name, path);
+    if (verbosity_level >= 2) {
+        g_test_message("Getting properties %s from %s", name, path);
+    }
     response = qtest_qmp(qts, "{ 'execute': 'qom-get',"
             " 'arguments': { 'path': %s, 'property': %s}}",
             path, name);
@@ -260,8 +264,10 @@ static void mft_qom_set(QTestState *qts, int index, const char *name,
     QDict *response;
     char *path = g_strdup_printf("/machine/soc/mft[%d]", index);
 
-    g_test_message("Setting properties %s of mft[%d] with value %u",
-                   name, index, value);
+    if (verbosity_level >= 2) {
+        g_test_message("Setting properties %s of mft[%d] with value %u",
+                       name, index, value);
+    }
     response = qtest_qmp(qts, "{ 'execute': 'qom-set',"
             " 'arguments': { 'path': %s, "
             " 'property': %s, 'value': %u}}",
@@ -506,9 +512,12 @@ static void mft_verify_rpm(QTestState *qts, const TestData *td, uint64_t duty)
     int32_t expected_cnt = mft_compute_cnt(rpm, clk);
 
     qtest_irq_intercept_in(qts, "/machine/soc/a9mpcore/gic");
-    g_test_message(
-        "verifying rpm for mft[%d]: clk: %" PRIu64 ", duty: %" PRIu64 ", rpm: %u, cnt: %d",
-        index, clk, duty, rpm, expected_cnt);
+    if (verbosity_level >= 2) {
+        g_test_message(
+            "verifying rpm for mft[%d]: clk: %" PRIu64 ", duty: %" PRIu64
+            ", rpm: %u, cnt: %d",
+            index, clk, duty, rpm, expected_cnt);
+    }
 
     /* Verify rpm for fan A */
     /* Stop capture */
@@ -670,6 +679,12 @@ int main(int argc, char **argv)
 {
     TestData test_data_list[ARRAY_SIZE(pwm_module_list) * ARRAY_SIZE(pwm_list)];
 
+    char *v_env = getenv("V");
+
+    if (v_env) {
+        verbosity_level = atoi(v_env);
+    }
+
     g_test_init(&argc, &argv, NULL);
 
     for (int i = 0; i < ARRAY_SIZE(pwm_module_list); ++i) {
-- 
2.34.1


