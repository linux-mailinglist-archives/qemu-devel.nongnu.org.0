Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A646B96C0
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 14:48:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc4tc-0008Gn-Tq; Tue, 14 Mar 2023 09:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pc4tV-0008G5-Kq
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 09:40:51 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pc4tD-0001gU-MF
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 09:40:44 -0400
Received: by mail-ed1-x52c.google.com with SMTP id cy23so62070616edb.12
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 06:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678801216;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Fx6oU7tFVBwtFVPkmHAy/oo39HOxm7ugCFwOUIzsQKg=;
 b=MUbJrAwJaDeLUU3nUwZYXcEP5fs/E6vG2PG0BH3z1A2OcWD9JVxhDEB15i2g6UqNSd
 ZAxu4HFOq/ZJFYrHwvc+Yxq4EI1PXQ/FR2oQN+wr1Uq6LYBgIZQiD1FftkAsgoebMT5+
 TejWrCnL8CiTbU37SwWpKml9NN1MNeSO1aO5gAiGs/7UfU1gEPfLpqQivwQMX3qdrR8j
 JuNukFXM2m3YcuDfwL1tFtIAJoiyIMlmQrRw3SYGDk4ajm9ptUjbQ+StAp1x+6yHSxhg
 MjAWDMbOFgfM5QaAVlxgRBr0qLHJwZRWDFe8T9dKmMrFCP5KeJ1otRFyVtjfX+lAZip9
 OPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678801216;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fx6oU7tFVBwtFVPkmHAy/oo39HOxm7ugCFwOUIzsQKg=;
 b=kpVMbeR0INIfV40wIotZPSIDGBjm9ulcSeyD50bYLMqMQEX0/bJDzsnOQOZuOzO8+2
 4dXQAZr987+OgZTkbnawrM6Vjfqq6vEygVenRxV2DW4LDMokvG+pj2YwnC9TShUMojIN
 +9A7sQqSO2J8T8dcaod7PN2I6r/0bXt4P/38gEG37v0uI2jGbekNldh1L5GQryMxeyls
 OdUt0dMkbm16uYGVa855bNYTkhVniwwQrv/4IVDaCI4/RlowmcH1t9yY3keIGyuco/Ms
 OmYBvQlKSYloHLhrIxRL5zNFBkjZq5LiXANHKkWPu6ksQ5j4qdnGaoCz2eNk0hjPCoBT
 qeqQ==
X-Gm-Message-State: AO0yUKWPwT6tdEmdVAO91Fj/XV2JBPfcPFjyIycZprReS9AP/9FK8UeQ
 +ZpTYp67rliZEHf5pYTZRjUE4XvNWH+OXTpXaF8=
X-Google-Smtp-Source: AK7set+/AXouOk8+NWL+Cen5PJtK0atYCErDrPOiJQV9VxjHk532J/tTVi3a0MrEpOvzCWExqBZUtA==
X-Received: by 2002:a05:600c:a04:b0:3eb:2b69:c3c4 with SMTP id
 z4-20020a05600c0a0400b003eb2b69c3c4mr15570670wmp.36.1678800793355; 
 Tue, 14 Mar 2023 06:33:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c2cc600b003df5be8987esm2895330wmc.20.2023.03.14.06.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 06:33:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 peterx@redhat.com
Subject: [PATCH] tests/qtest/migration-test: Disable postcopy/preempt tests
Date: Tue, 14 Mar 2023 13:33:10 +0000
Message-Id: <20230314133310.1177954-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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

The postcopy/preempt tests seem to have a race which makes them hang
on the s390x CI runner.  Disable them for the moment, while we
investigate.  As with the other disabled subtest, you can opt back in
by setting QEMU_TEST_FLAKY_TESTS=1 in your environment.

Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/migration-test.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index d4ab3934ed2..4643f7f49dc 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2464,6 +2464,11 @@ int main(int argc, char **argv)
     const char *arch = qtest_get_arch();
     g_autoptr(GError) err = NULL;
     int ret;
+    /*
+     * Race condition suspected in the postcopy/preempt tests: see
+     * https://lore.kernel.org/qemu-devel/CAFEAcA-q1UwPePdHTzXNSX4i6Urh3j6h51kymy6=7SzDAFU87w@mail.gmail.com/
+     */
+    bool skip_postcopy_preempt = getenv("QEMU_TEST_FLAKY_TESTS");
 
     g_test_init(&argc, &argv, NULL);
 
@@ -2500,9 +2505,11 @@ int main(int argc, char **argv)
         qtest_add_func("/migration/postcopy/plain", test_postcopy);
         qtest_add_func("/migration/postcopy/recovery/plain",
                        test_postcopy_recovery);
-        qtest_add_func("/migration/postcopy/preempt/plain", test_postcopy_preempt);
-        qtest_add_func("/migration/postcopy/preempt/recovery/plain",
-                       test_postcopy_preempt_recovery);
+        if (!skip_postcopy_preempt) {
+            qtest_add_func("/migration/postcopy/preempt/plain", test_postcopy_preempt);
+            qtest_add_func("/migration/postcopy/preempt/recovery/plain",
+                           test_postcopy_preempt_recovery);
+        }
     }
 
     qtest_add_func("/migration/bad_dest", test_baddest);
@@ -2521,10 +2528,12 @@ int main(int argc, char **argv)
         qtest_add_func("/migration/postcopy/tls/psk", test_postcopy_tls_psk);
         qtest_add_func("/migration/postcopy/recovery/tls/psk",
                        test_postcopy_recovery_tls_psk);
-        qtest_add_func("/migration/postcopy/preempt/tls/psk",
-                       test_postcopy_preempt_tls_psk);
-        qtest_add_func("/migration/postcopy/preempt/recovery/tls/psk",
-                       test_postcopy_preempt_all);
+        if (!skip_postcopy_preempt) {
+            qtest_add_func("/migration/postcopy/preempt/tls/psk",
+                           test_postcopy_preempt_tls_psk);
+            qtest_add_func("/migration/postcopy/preempt/recovery/tls/psk",
+                           test_postcopy_preempt_all);
+        }
     }
 #ifdef CONFIG_TASN1
     qtest_add_func("/migration/precopy/unix/tls/x509/default-host",
-- 
2.34.1


