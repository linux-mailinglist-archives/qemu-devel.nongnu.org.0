Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3917457B551
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 13:23:44 +0200 (CEST)
Received: from localhost ([::1]:36840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE7nr-0003Ok-Bk
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 07:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oE7k2-0004BH-2D
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:19:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oE7k0-00008E-4U
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658315983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6JSm6iPU4BWC9XfYMizhbu0JItXu66AtE2Eg/Y7YpyE=;
 b=hVCS+oVZn5TKH3eVZhbu9cw8UK1+ACF5S+mWCsfdk9RexC0b/OMCKatB6QRZeUjjE1Fdkx
 M/lEoqOtKzUHK7/1dNaSShwL5JJ+GycH4OeNnkT4br/oAkQZwRNAjveYjwGYjyA+h3sIBj
 4v1d4/+FIKIumpTWv9ZG1DPgdQwFjyE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-QAfwse_RPqqdZ8weBfKz2w-1; Wed, 20 Jul 2022 07:19:42 -0400
X-MC-Unique: QAfwse_RPqqdZ8weBfKz2w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DAC43C11724;
 Wed, 20 Jul 2022 11:19:42 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45B6B2166B26;
 Wed, 20 Jul 2022 11:19:41 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, leobras@redhat.com, quintela@redhat.com,
 berrange@redhat.com, peterx@redhat.com, iii@linux.ibm.com,
 huangy81@chinatelecom.cn
Subject: [PULL 08/30] tests: Add dirty page rate limit test
Date: Wed, 20 Jul 2022 12:19:04 +0100
Message-Id: <20220720111926.107055-9-dgilbert@redhat.com>
In-Reply-To: <20220720111926.107055-1-dgilbert@redhat.com>
References: <20220720111926.107055-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following qmp commands are covered by this test case:
"calc-dirty-rate", "query-dirty-rate", "set-vcpu-dirty-limit",
"cancel-vcpu-dirty-limit" and "query-vcpu-dirty-limit".

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Acked-by: Peter Xu <peterx@redhat.com>
Message-Id: <eed5b847a6ef0a9c02a36383dbdd7db367dd1e7e.1656177590.git.huangy81@chinatelecom.cn>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tests/qtest/migration-helpers.c |  22 +++
 tests/qtest/migration-helpers.h |   2 +
 tests/qtest/migration-test.c    | 256 ++++++++++++++++++++++++++++++++
 3 files changed, 280 insertions(+)

diff --git a/tests/qtest/migration-helpers.c b/tests/qtest/migration-helpers.c
index e81e831c85..c6fbeb3974 100644
--- a/tests/qtest/migration-helpers.c
+++ b/tests/qtest/migration-helpers.c
@@ -83,6 +83,28 @@ QDict *wait_command(QTestState *who, const char *command, ...)
     return ret;
 }
 
+/*
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
 /*
  * Send QMP command "migrate".
  * Arguments are built from @fmt... (formatted like
diff --git a/tests/qtest/migration-helpers.h b/tests/qtest/migration-helpers.h
index 78587c2b82..59561898d0 100644
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
index 9e64125f02..db4dcc5b31 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -24,6 +24,7 @@
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/qobject-output-visitor.h"
 #include "crypto/tlscredspsk.h"
+#include "qapi/qmp/qlist.h"
 
 #include "migration-helpers.h"
 #include "tests/migration/migration-test.h"
@@ -46,6 +47,12 @@ unsigned start_address;
 unsigned end_address;
 static bool uffd_feature_thread_id;
 
+/*
+ * Dirtylimit stop working if dirty page rate error
+ * value less than DIRTYLIMIT_TOLERANCE_RANGE
+ */
+#define DIRTYLIMIT_TOLERANCE_RANGE  25  /* MB/s */
+
 #if defined(__linux__)
 #include <sys/syscall.h>
 #include <sys/vfs.h>
@@ -2059,6 +2066,253 @@ static void test_multifd_tcp_cancel(void)
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
@@ -2204,6 +2458,8 @@ int main(int argc, char **argv)
     if (kvm_dirty_ring_supported()) {
         qtest_add_func("/migration/dirty_ring",
                        test_precopy_unix_dirty_ring);
+        qtest_add_func("/migration/vcpu_dirty_limit",
+                       test_vcpu_dirty_limit);
     }
 
     ret = g_test_run();
-- 
2.36.1


