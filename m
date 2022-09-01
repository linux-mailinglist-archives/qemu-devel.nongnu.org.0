Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65985A9E01
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 19:30:43 +0200 (CEST)
Received: from localhost ([::1]:48302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTo1a-0008Mt-EN
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 13:30:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1oTnuD-0000Ob-8e
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 13:23:05 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:56541
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1oTnuA-00038U-RY
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 13:23:04 -0400
HMM_SOURCE_IP: 172.18.0.218:57590.1734067809
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.99.60 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 2C4262800DA;
 Fri,  2 Sep 2022 01:22:59 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id f300b4319fd64ad39d95133196a26818 for
 qemu-devel@nongnu.org; Fri, 02 Sep 2022 01:23:01 CST
X-Transaction-ID: f300b4319fd64ad39d95133196a26818
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>
Subject: [PATCH v1 6/8] tests: Add migration dirty-limit capability test
Date: Fri,  2 Sep 2022 01:22:34 +0800
Message-Id: <a4f8f9279d478f503da2e73f87cc484abb3cd445.1662052189.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1662052189.git.huangy81@chinatelecom.cn>
References: <cover.1662052189.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1662052189.git.huangy81@chinatelecom.cn>
References: <cover.1662052189.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Add migration dirty-limit capability test if kernel support
dirty ring.

Migration dirty-limit capability introduce dirty limit
capability, two parameters: x-vcpu-dirty-limit-period and
x-vcpu-dirty-limit are introduced to implement the live
migration with dirty limit.

The test case does the following things:
1. start src, dst vm and enable dirty-limit capability
2. start migrate and set cancel it to check if dirty limit
   stop working.
3. restart dst vm
4. start migrate and enable dirty-limit capability
5. check if migration satisfy the convergence condition
   during pre-switchover phase.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 tests/qtest/migration-test.c | 154 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 4728d52..f3bfd85 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2409,6 +2409,158 @@ static void test_vcpu_dirty_limit(void)
     dirtylimit_stop_vm(vm);
 }
 
+static void migrate_dirty_limit_wait_showup(QTestState *from,
+                                            const int64_t period,
+                                            const int64_t value)
+{
+    /* Enable dirty limit capability */
+    migrate_set_capability(from, "dirty-limit", true);
+
+    /* Set dirty limit parameters */
+    migrate_set_parameter_int(from, "x-vcpu-dirty-limit-period", period);
+    migrate_set_parameter_int(from, "x-vcpu-dirty-limit", value);
+
+    /* Make sure migrate can't converge */
+    migrate_ensure_non_converge(from);
+
+    /* To check limit rate after precopy */
+    migrate_set_capability(from, "pause-before-switchover", true);
+
+    /* Wait for the serial output from the source */
+    wait_for_serial("src_serial");
+}
+
+/*
+ * This test does:
+ *  source               target
+ *                       migrate_incoming
+ *     migrate
+ *     migrate_cancel
+ *                       restart target
+ *     migrate
+ *
+ *  And see that if dirty limit works correctly
+ */
+static void test_migrate_dirty_limit(void)
+{
+    g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
+    QTestState *from, *to;
+    int64_t remaining, throttle_us_per_full;
+    /*
+     * We want the test to be stable and as fast as possible.
+     * E.g., with 1Gb/s bandwith migration may pass without dirty limit,
+     * so we need to decrease a bandwidth.
+     */
+    const int64_t dirtylimit_period = 1000, dirtylimit_value = 50;
+    const int64_t max_bandwidth = 400000000; /* ~400Mb/s */
+    const int64_t downtime_limit = 250; /* 250ms */
+    /*
+     * We migrate through unix-socket (> 500Mb/s).
+     * Thus, expected migration speed ~= bandwidth limit (< 500Mb/s).
+     * So, we can predict expected_threshold
+     */
+    const int64_t expected_threshold = max_bandwidth * downtime_limit / 1000;
+    int max_try_count = 10;
+    MigrateCommon args = {
+        .start = {
+            .hide_stderr = true,
+            .use_dirty_ring = true,
+        },
+        .listen_uri = uri,
+        .connect_uri = uri,
+    };
+
+    /* Start src, dst vm */
+    if (test_migrate_start(&from, &to, args.listen_uri, &args.start)) {
+        return;
+    }
+
+    /* Prepare for dirty limit migration and wait src vm show up */
+    migrate_dirty_limit_wait_showup(from, dirtylimit_period, dirtylimit_value);
+
+    /* Start migrate */
+    migrate_qmp(from, uri, "{}");
+
+    /* Wait for dirty limit throttle begin */
+    throttle_us_per_full = 0;
+    while (throttle_us_per_full == 0) {
+        throttle_us_per_full =
+            read_migrate_property_int(from, "dirty-limit-throttle-us-per-full");
+        usleep(100);
+        g_assert_false(got_stop);
+    }
+
+    /* Now cancel migrate and wait for dirty limit throttle switch off */
+    migrate_cancel(from);
+    wait_for_migration_status(from, "cancelled", NULL);
+
+    /* Check if dirty limit throttle switched off, set timeout 1ms */
+    do {
+        throttle_us_per_full =
+            read_migrate_property_int(from, "dirty-limit-throttle-us-per-full");
+        usleep(100);
+        g_assert_false(got_stop);
+    } while (throttle_us_per_full != 0 && --max_try_count);
+
+    /* Assert dirty limit is not in service */
+    g_assert_cmpint(throttle_us_per_full, ==, 0);
+
+    args = (MigrateCommon) {
+        .start = {
+            .only_target = true,
+            .use_dirty_ring = true,
+        },
+        .listen_uri = uri,
+        .connect_uri = uri,
+    };
+
+    /* Restart dst vm, src vm already show up so we needn't wait anymore */
+    if (test_migrate_start(&from, &to, args.listen_uri, &args.start)) {
+        return;
+    }
+
+    /* Start migrate */
+    migrate_qmp(from, uri, "{}");
+
+    /* Wait for dirty limit throttle begin */
+    throttle_us_per_full = 0;
+    while (throttle_us_per_full == 0) {
+        throttle_us_per_full =
+            read_migrate_property_int(from, "dirty-limit-throttle-us-per-full");
+        usleep(100);
+        g_assert_false(got_stop);
+    }
+
+    /*
+     * The dirty limit rate should equals the return value of
+     * query-vcpu-dirty-limit if dirty limit cap set
+     */
+    g_assert_cmpint(dirtylimit_value, ==, get_limit_rate(from));
+
+    /* Now, we have tested if dirty limit works, let it converge */
+    migrate_set_parameter_int(from, "downtime-limit", downtime_limit);
+    migrate_set_parameter_int(from, "max-bandwidth", max_bandwidth);
+
+    /*
+     * Wait for pre-switchover status to check if migration
+     * satisfy the convergence condition
+     */
+    wait_for_migration_status(from, "pre-switchover", NULL);
+
+    remaining = read_ram_property_int(from, "remaining");
+    g_assert_cmpint(remaining, <,
+                    (expected_threshold + expected_threshold / 100));
+
+    migrate_continue(from, "pre-switchover");
+
+    qtest_qmp_eventwait(to, "RESUME");
+
+    wait_for_serial("dest_serial");
+    wait_for_migration_complete(from);
+
+    test_migrate_end(from, to, true);
+}
+
 static bool kvm_dirty_ring_supported(void)
 {
 #if defined(__linux__) && defined(HOST_X86_64)
@@ -2578,6 +2730,8 @@ int main(int argc, char **argv)
                        test_precopy_unix_dirty_ring);
         qtest_add_func("/migration/vcpu_dirty_limit",
                        test_vcpu_dirty_limit);
+        qtest_add_func("/migration/dirty_limit",
+                       test_migrate_dirty_limit);
     }
 
     ret = g_test_run();
-- 
1.8.3.1


