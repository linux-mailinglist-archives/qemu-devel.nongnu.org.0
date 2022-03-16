Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 757644DB170
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:28:34 +0100 (CET)
Received: from localhost ([::1]:56028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUThZ-0002zx-AP
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:28:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nUTOD-0005H5-EX
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:08:33 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:45290
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nUTOA-0001Yp-DY
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:08:33 -0400
HMM_SOURCE_IP: 172.18.0.188:41560.1721706285
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 293282800EC;
 Wed, 16 Mar 2022 21:08:25 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 2e9296348a294551bae1440ab4b30c99 for
 qemu-devel@nongnu.org; Wed, 16 Mar 2022 21:08:29 CST
X-Transaction-ID: 2e9296348a294551bae1440ab4b30c99
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v21 8/9] migration-test: Export migration-test util funtions
Date: Wed, 16 Mar 2022 21:07:20 +0800
Message-Id: <dc7f8ce5fadc148dc2c2e14bc43940d58cd205bc.1647435820.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1647435820.git.huangy81@chinatelecom.cn>
References: <cover.1647435820.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1647435820.git.huangy81@chinatelecom.cn>
References: <cover.1647435820.git.huangy81@chinatelecom.cn>
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

Dirtylimit qtest can reuse the mechanisms that have been
implemented by migration-test to start a vm, so export the
relevant util functions.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 tests/qtest/migration-helpers.c |  87 ++++++++++++++++++++++++++
 tests/qtest/migration-helpers.h |  12 ++++
 tests/qtest/migration-test.c    | 132 ++++++----------------------------------
 3 files changed, 118 insertions(+), 113 deletions(-)

diff --git a/tests/qtest/migration-helpers.c b/tests/qtest/migration-helpers.c
index 4ee2601..4ae4bf1 100644
--- a/tests/qtest/migration-helpers.c
+++ b/tests/qtest/migration-helpers.c
@@ -188,3 +188,90 @@ void wait_for_migration_fail(QTestState *from, bool allow_active)
     g_assert(qdict_get_bool(rsp_return, "running"));
     qobject_unref(rsp_return);
 }
+
+void init_bootfile(const char *bootpath, void *content, size_t len)
+{
+    FILE *bootfile = fopen(bootpath, "wb");
+
+    g_assert_cmpint(fwrite(content, len, 1, bootfile), ==, 1);
+    fclose(bootfile);
+}
+
+/*
+ * Wait for some output in the serial output file,
+ * we get an 'A' followed by an endless string of 'B's
+ * but on the destination we won't have the A.
+ */
+void wait_for_serial(const char *tmpfs, const char *side)
+{
+    g_autofree char *serialpath = g_strdup_printf("%s/%s", tmpfs, side);
+    FILE *serialfile = fopen(serialpath, "r");
+    const char *arch = qtest_get_arch();
+    int started = (strcmp(side, "src_serial") == 0 &&
+                   strcmp(arch, "ppc64") == 0) ? 0 : 1;
+
+    do {
+        int readvalue = fgetc(serialfile);
+
+        if (!started) {
+            /* SLOF prints its banner before starting test,
+             * to ignore it, mark the start of the test with '_',
+             * ignore all characters until this marker
+             */
+            switch (readvalue) {
+            case '_':
+                started = 1;
+                break;
+            case EOF:
+                fseek(serialfile, 0, SEEK_SET);
+                usleep(1000);
+                break;
+            }
+            continue;
+        }
+        switch (readvalue) {
+        case 'A':
+            /* Fine */
+            break;
+
+        case 'B':
+            /* It's alive! */
+            fclose(serialfile);
+            return;
+
+        case EOF:
+            started = (strcmp(side, "src_serial") == 0 &&
+                       strcmp(arch, "ppc64") == 0) ? 0 : 1;
+            fseek(serialfile, 0, SEEK_SET);
+            usleep(1000);
+            break;
+
+        default:
+            fprintf(stderr, "Unexpected %d on %s serial\n", readvalue, side);
+            g_assert_not_reached();
+        }
+    } while (true);
+}
+
+bool kvm_dirty_ring_supported(void)
+{
+#if defined(__linux__) && defined(HOST_X86_64)
+    int ret, kvm_fd = open("/dev/kvm", O_RDONLY);
+
+    if (kvm_fd < 0) {
+        return false;
+    }
+
+    ret = ioctl(kvm_fd, KVM_CHECK_EXTENSION, KVM_CAP_DIRTY_LOG_RING);
+    close(kvm_fd);
+
+    /* We test with 4096 slots */
+    if (ret < 4096) {
+        return false;
+    }
+
+    return true;
+#else
+    return false;
+#endif
+}
diff --git a/tests/qtest/migration-helpers.h b/tests/qtest/migration-helpers.h
index d63bba9..a34cd2f 100644
--- a/tests/qtest/migration-helpers.h
+++ b/tests/qtest/migration-helpers.h
@@ -14,6 +14,12 @@
 
 #include "libqos/libqtest.h"
 
+/* For dirty ring test; so far only x86_64 is supported */
+#if defined(__linux__) && defined(HOST_X86_64)
+#include "linux/kvm.h"
+#endif
+#include <sys/ioctl.h>
+
 extern bool got_stop;
 
 GCC_FMT_ATTR(3, 4)
@@ -34,4 +40,10 @@ void wait_for_migration_complete(QTestState *who);
 
 void wait_for_migration_fail(QTestState *from, bool allow_active);
 
+void init_bootfile(const char *bootpath, void *content, size_t len);
+
+void wait_for_serial(const char *tmpfs, const char *side);
+
+bool kvm_dirty_ring_supported(void);
+
 #endif /* MIGRATION_HELPERS_H_ */
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 0870656..fe5e0a9 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -27,11 +27,6 @@
 #include "migration-helpers.h"
 #include "tests/migration/migration-test.h"
 
-/* For dirty ring test; so far only x86_64 is supported */
-#if defined(__linux__) && defined(HOST_X86_64)
-#include "linux/kvm.h"
-#endif
-
 /* TODO actually test the results and get rid of this */
 #define qtest_qmp_discard_response(...) qobject_unref(qtest_qmp(__VA_ARGS__))
 
@@ -49,7 +44,6 @@ static bool uffd_feature_thread_id;
 
 #if defined(__linux__) && defined(__NR_userfaultfd) && defined(CONFIG_EVENTFD)
 #include <sys/eventfd.h>
-#include <sys/ioctl.h>
 #include <linux/userfaultfd.h>
 
 static bool ufd_version_check(void)
@@ -100,70 +94,6 @@ static const char *tmpfs;
 #include "tests/migration/aarch64/a-b-kernel.h"
 #include "tests/migration/s390x/a-b-bios.h"
 
-static void init_bootfile(const char *bootpath, void *content, size_t len)
-{
-    FILE *bootfile = fopen(bootpath, "wb");
-
-    g_assert_cmpint(fwrite(content, len, 1, bootfile), ==, 1);
-    fclose(bootfile);
-}
-
-/*
- * Wait for some output in the serial output file,
- * we get an 'A' followed by an endless string of 'B's
- * but on the destination we won't have the A.
- */
-static void wait_for_serial(const char *side)
-{
-    g_autofree char *serialpath = g_strdup_printf("%s/%s", tmpfs, side);
-    FILE *serialfile = fopen(serialpath, "r");
-    const char *arch = qtest_get_arch();
-    int started = (strcmp(side, "src_serial") == 0 &&
-                   strcmp(arch, "ppc64") == 0) ? 0 : 1;
-
-    do {
-        int readvalue = fgetc(serialfile);
-
-        if (!started) {
-            /* SLOF prints its banner before starting test,
-             * to ignore it, mark the start of the test with '_',
-             * ignore all characters until this marker
-             */
-            switch (readvalue) {
-            case '_':
-                started = 1;
-                break;
-            case EOF:
-                fseek(serialfile, 0, SEEK_SET);
-                usleep(1000);
-                break;
-            }
-            continue;
-        }
-        switch (readvalue) {
-        case 'A':
-            /* Fine */
-            break;
-
-        case 'B':
-            /* It's alive! */
-            fclose(serialfile);
-            return;
-
-        case EOF:
-            started = (strcmp(side, "src_serial") == 0 &&
-                       strcmp(arch, "ppc64") == 0) ? 0 : 1;
-            fseek(serialfile, 0, SEEK_SET);
-            usleep(1000);
-            break;
-
-        default:
-            fprintf(stderr, "Unexpected %d on %s serial\n", readvalue, side);
-            g_assert_not_reached();
-        }
-    } while (true);
-}
-
 /*
  * It's tricky to use qemu's migration event capability with qtest,
  * events suddenly appearing confuse the qmp()/hmp() responses.
@@ -279,7 +209,6 @@ static void check_guests_ram(QTestState *who)
 static void cleanup(const char *filename)
 {
     g_autofree char *path = g_strdup_printf("%s/%s", tmpfs, filename);
-
     unlink(path);
 }
 
@@ -684,7 +613,7 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
     migrate_set_parameter_int(from, "downtime-limit", 1);
 
     /* Wait for the first serial output from the source */
-    wait_for_serial("src_serial");
+    wait_for_serial(tmpfs, "src_serial");
 
     migrate_qmp(from, uri, "{}");
 
@@ -701,7 +630,7 @@ static void migrate_postcopy_complete(QTestState *from, QTestState *to)
     wait_for_migration_complete(from);
 
     /* Make sure we get at least one "B" on destination */
-    wait_for_serial("dest_serial");
+    wait_for_serial(tmpfs, "dest_serial");
 
     if (uffd_feature_thread_id) {
         read_blocktime(to);
@@ -821,7 +750,7 @@ static void test_precopy_unix_common(bool dirty_ring)
     migrate_set_parameter_int(from, "max-bandwidth", 1000000000);
 
     /* Wait for the first serial output from the source */
-    wait_for_serial("src_serial");
+    wait_for_serial(tmpfs, "src_serial");
 
     migrate_qmp(from, uri, "{}");
 
@@ -835,7 +764,7 @@ static void test_precopy_unix_common(bool dirty_ring)
 
     qtest_qmp_eventwait(to, "RESUME");
 
-    wait_for_serial("dest_serial");
+    wait_for_serial(tmpfs, "dest_serial");
     wait_for_migration_complete(from);
 
     test_migrate_end(from, to, true);
@@ -868,7 +797,7 @@ static void test_ignore_shared(void)
     migrate_set_capability(to, "x-ignore-shared", true);
 
     /* Wait for the first serial output from the source */
-    wait_for_serial("src_serial");
+    wait_for_serial(tmpfs, "src_serial");
 
     migrate_qmp(from, uri, "{}");
 
@@ -880,7 +809,7 @@ static void test_ignore_shared(void)
 
     qtest_qmp_eventwait(to, "RESUME");
 
-    wait_for_serial("dest_serial");
+    wait_for_serial(tmpfs, "dest_serial");
     wait_for_migration_complete(from);
 
     /* Check whether shared RAM has been really skipped */
@@ -914,7 +843,7 @@ static void test_xbzrle(const char *uri)
     migrate_set_capability(from, "xbzrle", true);
     migrate_set_capability(to, "xbzrle", true);
     /* Wait for the first serial output from the source */
-    wait_for_serial("src_serial");
+    wait_for_serial(tmpfs, "src_serial");
 
     migrate_qmp(from, uri, "{}");
 
@@ -930,7 +859,7 @@ static void test_xbzrle(const char *uri)
     }
     qtest_qmp_eventwait(to, "RESUME");
 
-    wait_for_serial("dest_serial");
+    wait_for_serial(tmpfs, "dest_serial");
     wait_for_migration_complete(from);
 
     test_migrate_end(from, to, true);
@@ -964,7 +893,7 @@ static void test_precopy_tcp(void)
     migrate_set_parameter_int(from, "max-bandwidth", 1000000000);
 
     /* Wait for the first serial output from the source */
-    wait_for_serial("src_serial");
+    wait_for_serial(tmpfs, "src_serial");
 
     uri = migrate_get_socket_address(to, "socket-address");
 
@@ -979,7 +908,7 @@ static void test_precopy_tcp(void)
     }
     qtest_qmp_eventwait(to, "RESUME");
 
-    wait_for_serial("dest_serial");
+    wait_for_serial(tmpfs, "dest_serial");
     wait_for_migration_complete(from);
 
     test_migrate_end(from, to, true);
@@ -1009,7 +938,7 @@ static void test_migrate_fd_proto(void)
     migrate_set_parameter_int(from, "max-bandwidth", 1000000000);
 
     /* Wait for the first serial output from the source */
-    wait_for_serial("src_serial");
+    wait_for_serial(tmpfs, "src_serial");
 
     /* Create two connected sockets for migration */
     ret = socketpair(PF_LOCAL, SOCK_STREAM, 0, pair);
@@ -1064,7 +993,7 @@ static void test_migrate_fd_proto(void)
     qobject_unref(rsp);
 
     /* Complete migration */
-    wait_for_serial("dest_serial");
+    wait_for_serial(tmpfs, "dest_serial");
     wait_for_migration_complete(from);
     test_migrate_end(from, to, true);
 }
@@ -1087,7 +1016,7 @@ static void do_test_validate_uuid(MigrateStart *args, bool should_fail)
     migrate_set_capability(from, "validate-uuid", true);
 
     /* Wait for the first serial output from the source */
-    wait_for_serial("src_serial");
+    wait_for_serial(tmpfs, "src_serial");
 
     migrate_qmp(from, uri, "{}");
 
@@ -1186,7 +1115,7 @@ static void test_migrate_auto_converge(void)
     migrate_set_capability(from, "pause-before-switchover", true);
 
     /* Wait for the first serial output from the source */
-    wait_for_serial("src_serial");
+    wait_for_serial(tmpfs, "src_serial");
 
     migrate_qmp(from, uri, "{}");
 
@@ -1221,7 +1150,7 @@ static void test_migrate_auto_converge(void)
 
     qtest_qmp_eventwait(to, "RESUME");
 
-    wait_for_serial("dest_serial");
+    wait_for_serial(tmpfs, "dest_serial");
     wait_for_migration_complete(from);
 
 
@@ -1264,7 +1193,7 @@ static void test_multifd_tcp(const char *method)
     qobject_unref(rsp);
 
     /* Wait for the first serial output from the source */
-    wait_for_serial("src_serial");
+    wait_for_serial(tmpfs, "src_serial");
 
     uri = migrate_get_socket_address(to, "socket-address");
 
@@ -1279,7 +1208,7 @@ static void test_multifd_tcp(const char *method)
     }
     qtest_qmp_eventwait(to, "RESUME");
 
-    wait_for_serial("dest_serial");
+    wait_for_serial(tmpfs, "dest_serial");
     wait_for_migration_complete(from);
     test_migrate_end(from, to, true);
 }
@@ -1347,7 +1276,7 @@ static void test_multifd_tcp_cancel(void)
     qobject_unref(rsp);
 
     /* Wait for the first serial output from the source */
-    wait_for_serial("src_serial");
+    wait_for_serial(tmpfs, "src_serial");
 
     uri = migrate_get_socket_address(to, "socket-address");
 
@@ -1392,34 +1321,11 @@ static void test_multifd_tcp_cancel(void)
     }
     qtest_qmp_eventwait(to2, "RESUME");
 
-    wait_for_serial("dest_serial");
+    wait_for_serial(tmpfs, "dest_serial");
     wait_for_migration_complete(from);
     test_migrate_end(from, to2, true);
 }
 
-static bool kvm_dirty_ring_supported(void)
-{
-#if defined(__linux__) && defined(HOST_X86_64)
-    int ret, kvm_fd = open("/dev/kvm", O_RDONLY);
-
-    if (kvm_fd < 0) {
-        return false;
-    }
-
-    ret = ioctl(kvm_fd, KVM_CHECK_EXTENSION, KVM_CAP_DIRTY_LOG_RING);
-    close(kvm_fd);
-
-    /* We test with 4096 slots */
-    if (ret < 4096) {
-        return false;
-    }
-
-    return true;
-#else
-    return false;
-#endif
-}
-
 int main(int argc, char **argv)
 {
     char template[] = "/tmp/migration-test-XXXXXX";
-- 
1.8.3.1


