Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5734B5299ED
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 08:53:41 +0200 (CEST)
Received: from localhost ([::1]:36128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqr5Q-0007Tu-Fi
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 02:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nqqoN-0004mB-Kc
 for qemu-devel@nongnu.org; Tue, 17 May 2022 02:36:04 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:46624
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nqqoL-0007mT-Fa
 for qemu-devel@nongnu.org; Tue, 17 May 2022 02:36:03 -0400
HMM_SOURCE_IP: 172.18.0.48:35216.1855245433
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.84 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 35DA62800B4;
 Tue, 17 May 2022 14:35:45 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 9482ce7fa186442aa22549714a1cd696 for
 qemu-devel@nongnu.org; Tue, 17 May 2022 14:35:48 CST
X-Transaction-ID: 9482ce7fa186442aa22549714a1cd696
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hyman Huang <huangy81@chinatelecom.cn>
Subject: [RFC 6/6] tests: Add migration dirtylimit capability test
Date: Tue, 17 May 2022 14:35:06 +0800
Message-Id: <ce310d0859aaff0f1938e689af6387026b7e45b0.1652762652.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1652762652.git.huangy81@chinatelecom.cn>
References: <cover.1652762652.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1652762652.git.huangy81@chinatelecom.cn>
References: <cover.1652762652.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
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

Add migration dirtylimit capability test if kernel support
dirty ring.

Migration dirtylimit capability introduce dirtylimit capability
, two parameters: vcpu-dirtylimit-period and vcpu-dirtylimit to
implement the live migration with dirtylimit.

The test case enable the capability and set the corresponding
parameters to test migration. When migration switch to
pre-switchover phase, like the auto-converge, checking if
migration satisfy the convergence condition.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 tests/qtest/migration-test.c | 89 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 40f2873..b0a53d7 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1650,6 +1650,93 @@ static void test_vcpu_dirty_limit(void)
     dirtylimit_stop_vm(vm);
 }
 
+static void test_migrate_dirty_limit(void)
+{
+    g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
+    MigrateStart *args = migrate_start_new();
+    QTestState *from, *to;
+    int64_t remaining, throttle_us_per_full;
+    /*
+     * We want the test to be stable and as fast as possible.
+     * E.g., with 1Gb/s bandwith migration may pass without dirtylimit,
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
+
+    /* Enable dirty ring logging */
+    args->use_dirty_ring = true;
+
+    if (test_migrate_start(&from, &to, uri, &args)) {
+        return;
+    }
+
+    migrate_set_capability(from, "dirtylimit", true);
+    migrate_set_parameter_int(from, "vcpu-dirtylimit-period",
+                              dirtylimit_period);
+    migrate_set_parameter_int(from, "vcpu-dirtylimit", dirtylimit_value);
+
+    /*
+     * Set the initial parameters so that the migration could not converge
+     * without dirtylimit.
+     */
+    migrate_set_parameter_int(from, "downtime-limit", 1);
+    migrate_set_parameter_int(from, "max-bandwidth", 100000000); /* ~100Mb/s */
+
+    /* To check limit rate after precopy */
+    migrate_set_capability(from, "pause-before-switchover", true);
+
+    /* Wait for the first serial output from the source */
+    wait_for_serial("src_serial");
+
+    migrate_qmp(from, uri, "{}");
+
+    /* Wait for dirtylimit begins */
+    throttle_us_per_full = 0;
+    while (throttle_us_per_full == 0) {
+        throttle_us_per_full =
+            read_migrate_property_int(from, "dirtylimit-throttle-us-per-full");
+        usleep(100);
+        g_assert_false(got_stop);
+    }
+
+    /*
+     * The dirtylimit rate should equals the return value of
+     * query-vcpu-dirty-limit if dirtylimit cap set
+     */
+    g_assert_cmpint(dirtylimit_value, ==, get_limit_rate(from));
+
+    /* Now, when we tested if dirtylimit works, let it converge */
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
@@ -1741,6 +1828,8 @@ int main(int argc, char **argv)
                        test_precopy_unix_dirty_ring);
         qtest_add_func("/migration/vcpu_dirty_limit",
                        test_vcpu_dirty_limit);
+        qtest_add_func("/migration/dirty_limit",
+                       test_migrate_dirty_limit);
     }
 
     ret = g_test_run();
-- 
1.8.3.1


