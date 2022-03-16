Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8444DA875
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 03:31:33 +0100 (CET)
Received: from localhost ([::1]:53948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUJRl-0005Ty-3F
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 22:31:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nUJJA-0000km-FM
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 22:22:42 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:33776
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nUJJ7-0001PM-Sa
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 22:22:40 -0400
HMM_SOURCE_IP: 172.18.0.188:44508.143425817
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 334082800C3;
 Wed, 16 Mar 2022 10:22:31 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 54fe2837ebe44013b9a2127e484cc957 for
 qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:22:35 CST
X-Transaction-ID: 54fe2837ebe44013b9a2127e484cc957
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v20 9/9] tests: Add dirty page rate limit test
Date: Wed, 16 Mar 2022 10:21:39 +0800
Message-Id: <0ee233873a758dd81f8d7235ee9c434ed4603b62.1647396907.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1647396907.git.huangy81@chinatelecom.cn>
References: <cover.1647396907.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1647396907.git.huangy81@chinatelecom.cn>
References: <cover.1647396907.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 Hyman <huangy81@chinatelecom.cn>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
 tests/qtest/dirtylimit-test.c | 319 ++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build       |   2 +
 2 files changed, 321 insertions(+)
 create mode 100644 tests/qtest/dirtylimit-test.c

diff --git a/tests/qtest/dirtylimit-test.c b/tests/qtest/dirtylimit-test.c
new file mode 100644
index 0000000..c9af620
--- /dev/null
+++ b/tests/qtest/dirtylimit-test.c
@@ -0,0 +1,319 @@
+/*
+ * QTest testcase for Dirty Page Rate Limit
+ *
+ * Copyright (c) 2022 CHINA TELECOM CO.,LTD.
+ *
+ * Authors:
+ *  Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "libqos/libqtest.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qlist.h"
+#include "qapi/qobject-input-visitor.h"
+#include "qapi/qobject-output-visitor.h"
+
+#include "migration-helpers.h"
+#include "tests/migration/i386/a-b-bootblock.h"
+
+/*
+ * Dirtylimit stop working if dirty page rate error
+ * value less than DIRTYLIMIT_TOLERANCE_RANGE
+ */
+#define DIRTYLIMIT_TOLERANCE_RANGE  25  /* MB/s */
+
+static QDict *qmp_command(QTestState *who, const char *command, ...)
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
+                                             int64_t calc_time)
+{
+    int max_try_count = 200;
+    usleep(calc_time);
+
+    while (!calc_dirtyrate_ready(who) && max_try_count--) {
+        usleep(1000);
+    }
+
+    /*
+     * Set the timeout with 200 ms(max_try_count * 1000us),
+     * if dirtyrate measurement not complete, test failed.
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
+static QTestState *start_vm(void)
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
+static void stop_vm(QTestState *vm)
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
+    int max_try_count = 5;
+    int hit = 0;
+
+    vm = start_vm();
+    if (!vm) {
+        return;
+    }
+
+    /* Wait for the first serial output from the vm*/
+    wait_for_serial("vm_serial");
+
+    /* Do dirtyrate measurement with calc time equals 1s */
+    calc_dirty_rate(vm, 1);
+
+    /* Sleep a calc time and wait for calc dirtyrate complete */
+    wait_for_calc_dirtyrate_complete(vm, 1 * 1000000);
+
+    /* Query original dirty page rate */
+    origin_rate = get_dirty_rate(vm);
+
+    /* VM booted from bootsect should dirty memory */
+    assert(origin_rate != 0);
+
+    /* Setup quota dirty page rate at one-third of origin */
+    quota_rate = origin_rate / 3;
+
+    /* Set dirtylimit and wait a bit to check if it take effect */
+    dirtylimit_set_all(vm, quota_rate);
+    usleep(2000000);
+
+    /*
+     * Check if set-vcpu-dirty-limit and query-vcpu-dirty-limit
+     * works literally
+     */
+    g_assert_cmpint(quota_rate, ==, get_limit_rate(vm));
+
+    /* Check if dirtylimit take effect realistically */
+    while (--max_try_count) {
+        calc_dirty_rate(vm, 1);
+        wait_for_calc_dirtyrate_complete(vm, 1 * 1000000);
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
+    max_try_count = 5;
+
+    /* Check if dirtylimit cancellation take effect */
+    cancel_vcpu_dirty_limit(vm);
+    while (--max_try_count) {
+        calc_dirty_rate(vm, 1);
+        wait_for_calc_dirtyrate_complete(vm, 1 * 1000000);
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
+    stop_vm(vm);
+}
+
+int main(int argc, char **argv)
+{
+    char template[] = "/tmp/dirtylimit-test-XXXXXX";
+    int ret;
+
+    tmpfs = mkdtemp(template);
+    if (!tmpfs) {
+        g_test_message("mkdtemp on path (%s): %s", template, strerror(errno));
+    }
+    g_assert(tmpfs);
+
+    if (!kvm_dirty_ring_supported()) {
+        return 0;
+    }
+
+    g_test_init(&argc, &argv, NULL);
+    qtest_add_func("/dirtylimit/test", test_vcpu_dirty_limit);
+    ret = g_test_run();
+
+    g_assert_cmpint(ret, ==, 0);
+
+    ret = rmdir(tmpfs);
+    if (ret != 0) {
+        g_test_message("unable to rmdir: path (%s): %s",
+                       tmpfs, strerror(errno));
+    }
+
+    return ret;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index d25f82b..6b041e0 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -32,6 +32,7 @@ qtests_generic = \
   'qom-test',
   'test-hmp',
   'qos-test',
+  'dirtylimit-test',
 ]
 if config_host.has_key('CONFIG_MODULES')
   qtests_generic += [ 'modules-test' ]
@@ -296,6 +297,7 @@ qtests = {
   'tpm-tis-device-swtpm-test': [io, tpmemu_files, 'tpm-tis-util.c'],
   'tpm-tis-device-test': [io, tpmemu_files, 'tpm-tis-util.c'],
   'vmgenid-test': files('boot-sector.c', 'acpi-utils.c'),
+  'dirtylimit-test': files('migration-helpers.c'),
 }
 
 if dbus_display
-- 
1.8.3.1


