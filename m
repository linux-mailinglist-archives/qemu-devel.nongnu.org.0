Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C0952CA5D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 05:29:54 +0200 (CEST)
Received: from localhost ([::1]:53754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrWrJ-0006Cc-2R
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 23:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nrWnh-0008DV-KU
 for qemu-devel@nongnu.org; Wed, 18 May 2022 23:26:10 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:45084
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nrWnb-0006xA-MX
 for qemu-devel@nongnu.org; Wed, 18 May 2022 23:26:07 -0400
HMM_SOURCE_IP: 172.18.0.188:41488.828472601
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.84 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 790242800AE;
 Thu, 19 May 2022 11:25:57 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id f866e01f7cf34a5d88f2ddbb20b46047 for
 qemu-devel@nongnu.org; Thu, 19 May 2022 11:26:02 CST
X-Transaction-ID: f866e01f7cf34a5d88f2ddbb20b46047
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hyman Huang <huangy81@chinatelecom.cn>
Subject: [PATCH v23 8/8] tests: Add dirty page rate limit test
Date: Thu, 19 May 2022 11:25:19 +0800
Message-Id: <fa7cc445dc4698f77e465e4619d6550292a46300.1652929817.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1652929816.git.huangy81@chinatelecom.cn>
References: <cover.1652929816.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1652929816.git.huangy81@chinatelecom.cn>
References: <cover.1652929816.git.huangy81@chinatelecom.cn>
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

Add dirty page rate limit test if kernel support dirty ring,
create a standalone file to implement the test case.

The following qmp commands are covered by this test case:
"calc-dirty-rate", "query-dirty-rate", "set-vcpu-dirty-limit",
"cancel-vcpu-dirty-limit" and "query-vcpu-dirty-limit".

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 tests/qtest/migration-helpers.c |  22 ++++
 tests/qtest/migration-helpers.h |   2 +
 tests/qtest/migration-test.c    | 255 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 279 insertions(+)

diff --git a/tests/qtest/migration-helpers.c b/tests/qtest/migration-helpers.c
index a6aa59e..4849cba 100644
--- a/tests/qtest/migration-helpers.c
+++ b/tests/qtest/migration-helpers.c
@@ -76,6 +76,28 @@ QDict *wait_command(QTestState *who, const char *command, ...)
 }
 
 /*
+ * Execute the qmp command only
+ */
+QDict *qmp_command(QTestState *who, const char *command, ...)
+{
+    va_list ap;
+    QDict *resp, *ret;
+
+    va_start(ap, command);
+    resp = qtest_vqmp(who, command, ap);
+    va_end(ap);
+
+    g_assert(!qdict_haskey(resp, "error"));
+    g_assert(qdict_haskey(resp, "return"));
+
+    ret = qdict_get_qdict(resp, "return");
+    qobject_ref(ret);
+    qobject_unref(resp);
+
+    return ret;
+}
+
+/*
  * Send QMP command "migrate".
  * Arguments are built from @fmt... (formatted like
  * qobject_from_jsonf_nofail()) with "uri": @uri spliced in.
diff --git a/tests/qtest/migration-helpers.h b/tests/qtest/migration-helpers.h
index 78587c2..5956189 100644
--- a/tests/qtest/migration-helpers.h
+++ b/tests/qtest/migration-helpers.h
@@ -23,6 +23,8 @@ QDict *wait_command_fd(QTestState *who, int fd, const char *command, ...);
 G_GNUC_PRINTF(2, 3)
 QDict *wait_command(QTestState *who, const char *command, ...);
 
+QDict *qmp_command(QTestState *who, const char *command, ...);
+
 G_GNUC_PRINTF(3, 4)
 void migrate_qmp(QTestState *who, const char *uri, const char *fmt, ...);
 
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index d33e806..f59d31b 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -24,6 +24,7 @@
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/qobject-output-visitor.h"
 #include "crypto/tlscredspsk.h"
+#include "qapi/qmp/qlist.h"
 
 #include "migration-helpers.h"
 #include "tests/migration/migration-test.h"
@@ -58,6 +59,11 @@ static bool uffd_feature_thread_id;
 #include <sys/eventfd.h>
 #include <sys/ioctl.h>
 #include <linux/userfaultfd.h>
+/*
+ * Dirtylimit stop working if dirty page rate error
+ * value less than DIRTYLIMIT_TOLERANCE_RANGE
+ */
+#define DIRTYLIMIT_TOLERANCE_RANGE  25  /* MB/s */
 
 static bool ufd_version_check(void)
 {
@@ -2070,6 +2076,253 @@ static void test_multifd_tcp_cancel(void)
     test_migrate_end(from, to2, true);
 }
 
+static void calc_dirty_rate(QTestState *who, uint64_t calc_time)
+{
+    qobject_unref(qmp_command(who,
+                  "{ 'execute': 'calc-dirty-rate',"
+                  "'arguments': { "
+                  "'calc-time': %ld,"
+                  "'mode': 'dirty-ring' }}",
+                  calc_time));
+}
+
+static QDict *query_dirty_rate(QTestState *who)
+{
+    return qmp_command(who, "{ 'execute': 'query-dirty-rate' }");
+}
+
+static void dirtylimit_set_all(QTestState *who, uint64_t dirtyrate)
+{
+    qobject_unref(qmp_command(who,
+                  "{ 'execute': 'set-vcpu-dirty-limit',"
+                  "'arguments': { "
+                  "'dirty-rate': %ld } }",
+                  dirtyrate));
+}
+
+static void cancel_vcpu_dirty_limit(QTestState *who)
+{
+    qobject_unref(qmp_command(who,
+                  "{ 'execute': 'cancel-vcpu-dirty-limit' }"));
+}
+
+static QDict *query_vcpu_dirty_limit(QTestState *who)
+{
+    QDict *rsp;
+
+    rsp = qtest_qmp(who, "{ 'execute': 'query-vcpu-dirty-limit' }");
+    g_assert(!qdict_haskey(rsp, "error"));
+    g_assert(qdict_haskey(rsp, "return"));
+
+    return rsp;
+}
+
+static bool calc_dirtyrate_ready(QTestState *who)
+{
+    QDict *rsp_return;
+    gchar *status;
+
+    rsp_return = query_dirty_rate(who);
+    g_assert(rsp_return);
+
+    status = g_strdup(qdict_get_str(rsp_return, "status"));
+    g_assert(status);
+
+    return g_strcmp0(status, "measuring");
+}
+
+static void wait_for_calc_dirtyrate_complete(QTestState *who,
+                                             int64_t time_s)
+{
+    int max_try_count = 10000;
+    usleep(time_s * 1000000);
+
+    while (!calc_dirtyrate_ready(who) && max_try_count--) {
+        usleep(1000);
+    }
+
+    /*
+     * Set the timeout with 10 s(max_try_count * 1000us),
+     * if dirtyrate measurement not complete, fail test.
+     */
+    g_assert_cmpint(max_try_count, !=, 0);
+}
+
+static int64_t get_dirty_rate(QTestState *who)
+{
+    QDict *rsp_return;
+    gchar *status;
+    QList *rates;
+    const QListEntry *entry;
+    QDict *rate;
+    int64_t dirtyrate;
+
+    rsp_return = query_dirty_rate(who);
+    g_assert(rsp_return);
+
+    status = g_strdup(qdict_get_str(rsp_return, "status"));
+    g_assert(status);
+    g_assert_cmpstr(status, ==, "measured");
+
+    rates = qdict_get_qlist(rsp_return, "vcpu-dirty-rate");
+    g_assert(rates && !qlist_empty(rates));
+
+    entry = qlist_first(rates);
+    g_assert(entry);
+
+    rate = qobject_to(QDict, qlist_entry_obj(entry));
+    g_assert(rate);
+
+    dirtyrate = qdict_get_try_int(rate, "dirty-rate", -1);
+
+    qobject_unref(rsp_return);
+    return dirtyrate;
+}
+
+static int64_t get_limit_rate(QTestState *who)
+{
+    QDict *rsp_return;
+    QList *rates;
+    const QListEntry *entry;
+    QDict *rate;
+    int64_t dirtyrate;
+
+    rsp_return = query_vcpu_dirty_limit(who);
+    g_assert(rsp_return);
+
+    rates = qdict_get_qlist(rsp_return, "return");
+    g_assert(rates && !qlist_empty(rates));
+
+    entry = qlist_first(rates);
+    g_assert(entry);
+
+    rate = qobject_to(QDict, qlist_entry_obj(entry));
+    g_assert(rate);
+
+    dirtyrate = qdict_get_try_int(rate, "limit-rate", -1);
+
+    qobject_unref(rsp_return);
+    return dirtyrate;
+}
+
+static QTestState *dirtylimit_start_vm(void)
+{
+    QTestState *vm = NULL;
+    g_autofree gchar *cmd = NULL;
+    const char *arch = qtest_get_arch();
+    g_autofree char *bootpath = NULL;
+
+    assert((strcmp(arch, "x86_64") == 0));
+    bootpath = g_strdup_printf("%s/bootsect", tmpfs);
+    assert(sizeof(x86_bootsect) == 512);
+    init_bootfile(bootpath, x86_bootsect, sizeof(x86_bootsect));
+
+    cmd = g_strdup_printf("-accel kvm,dirty-ring-size=4096 "
+                          "-name dirtylimit-test,debug-threads=on "
+                          "-m 150M -smp 1 "
+                          "-serial file:%s/vm_serial "
+                          "-drive file=%s,format=raw ",
+                          tmpfs, bootpath);
+
+    vm = qtest_init(cmd);
+    return vm;
+}
+
+static void dirtylimit_stop_vm(QTestState *vm)
+{
+    qtest_quit(vm);
+    cleanup("bootsect");
+    cleanup("vm_serial");
+}
+
+static void test_vcpu_dirty_limit(void)
+{
+    QTestState *vm;
+    int64_t origin_rate;
+    int64_t quota_rate;
+    int64_t rate ;
+    int max_try_count = 20;
+    int hit = 0;
+
+    /* Start vm for vcpu dirtylimit test */
+    vm = dirtylimit_start_vm();
+
+    /* Wait for the first serial output from the vm*/
+    wait_for_serial("vm_serial");
+
+    /* Do dirtyrate measurement with calc time equals 1s */
+    calc_dirty_rate(vm, 1);
+
+    /* Sleep calc time and wait for calc dirtyrate complete */
+    wait_for_calc_dirtyrate_complete(vm, 1);
+
+    /* Query original dirty page rate */
+    origin_rate = get_dirty_rate(vm);
+
+    /* VM booted from bootsect should dirty memory steadily */
+    assert(origin_rate != 0);
+
+    /* Setup quota dirty page rate at half of origin */
+    quota_rate = origin_rate / 2;
+
+    /* Set dirtylimit */
+    dirtylimit_set_all(vm, quota_rate);
+
+    /*
+     * Check if set-vcpu-dirty-limit and query-vcpu-dirty-limit
+     * works literally
+     */
+    g_assert_cmpint(quota_rate, ==, get_limit_rate(vm));
+
+    /* Sleep a bit to check if it take effect */
+    usleep(2000000);
+
+    /*
+     * Check if dirtylimit take effect realistically, set the
+     * timeout with 20 s(max_try_count * 1s), if dirtylimit
+     * doesn't take effect, fail test.
+     */
+    while (--max_try_count) {
+        calc_dirty_rate(vm, 1);
+        wait_for_calc_dirtyrate_complete(vm, 1);
+        rate = get_dirty_rate(vm);
+
+        /*
+         * Assume hitting if current rate is less
+         * than quota rate (within accepting error)
+         */
+        if (rate < (quota_rate + DIRTYLIMIT_TOLERANCE_RANGE)) {
+            hit = 1;
+            break;
+        }
+    }
+
+    g_assert_cmpint(hit, ==, 1);
+
+    hit = 0;
+    max_try_count = 20;
+
+    /* Check if dirtylimit cancellation take effect */
+    cancel_vcpu_dirty_limit(vm);
+    while (--max_try_count) {
+        calc_dirty_rate(vm, 1);
+        wait_for_calc_dirtyrate_complete(vm, 1);
+        rate = get_dirty_rate(vm);
+
+        /*
+         * Assume dirtylimit be canceled if current rate is
+         * greater than quota rate (within accepting error)
+         */
+        if (rate > (quota_rate + DIRTYLIMIT_TOLERANCE_RANGE)) {
+            hit = 1;
+            break;
+        }
+    }
+
+    g_assert_cmpint(hit, ==, 1);
+    dirtylimit_stop_vm(vm);
+}
+
 static bool kvm_dirty_ring_supported(void)
 {
 #if defined(__linux__) && defined(HOST_X86_64)
@@ -2215,6 +2468,8 @@ int main(int argc, char **argv)
     if (kvm_dirty_ring_supported()) {
         qtest_add_func("/migration/dirty_ring",
                        test_precopy_unix_dirty_ring);
+        qtest_add_func("/migration/vcpu_dirty_limit",
+                       test_vcpu_dirty_limit);
     }
 
     ret = g_test_run();
-- 
1.8.3.1


