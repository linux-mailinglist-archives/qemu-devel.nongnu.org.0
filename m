Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 748314DA708
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 01:43:14 +0100 (CET)
Received: from localhost ([::1]:49584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUHkv-00088M-He
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 20:43:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nUHZw-000462-LG
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 20:31:52 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:40389
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nUHZu-0000CC-Ak
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 20:31:52 -0400
HMM_SOURCE_IP: 172.18.0.218:51032.1870135587
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.98.168 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id D1B3C2800D6;
 Wed, 16 Mar 2022 08:31:43 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 4611ffe7e2fb45409fefc54785c15e28 for
 qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:31:46 CST
X-Transaction-ID: 4611ffe7e2fb45409fefc54785c15e28
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v19 8/9] migration-test: Export migration-test util funtions
Date: Wed, 16 Mar 2022 08:30:47 +0800
Message-Id: <413ae4585ef1f87f4342d1a231ca172c6588bc92.1647390160.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1647390160.git.huangy81@chinatelecom.cn>
References: <cover.1647390160.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1647390160.git.huangy81@chinatelecom.cn>
References: <cover.1647390160.git.huangy81@chinatelecom.cn>
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
 tests/qtest/migration-helpers.c |  95 +++++++++++++++++++++++++++++++++++++
 tests/qtest/migration-helpers.h |  15 ++++++
 tests/qtest/migration-test.c    | 102 ----------------------------------------
 3 files changed, 110 insertions(+), 102 deletions(-)

diff --git a/tests/qtest/migration-helpers.c b/tests/qtest/migration-helpers.c
index 4ee2601..ffec54b 100644
--- a/tests/qtest/migration-helpers.c
+++ b/tests/qtest/migration-helpers.c
@@ -16,6 +16,7 @@
 #include "migration-helpers.h"
 
 bool got_stop;
+const char *tmpfs;
 
 static void check_stop_event(QTestState *who)
 {
@@ -188,3 +189,97 @@ void wait_for_migration_fail(QTestState *from, bool allow_active)
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
+void wait_for_serial(const char *side)
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
+
+void cleanup(const char *filename)
+{
+    g_autofree char *path = g_strdup_printf("%s/%s", tmpfs, filename);
+
+    unlink(path);
+}
diff --git a/tests/qtest/migration-helpers.h b/tests/qtest/migration-helpers.h
index d63bba9..d08551f 100644
--- a/tests/qtest/migration-helpers.h
+++ b/tests/qtest/migration-helpers.h
@@ -14,7 +14,14 @@
 
 #include "libqos/libqtest.h"
 
+/* For dirty ring test; so far only x86_64 is supported */
+#if defined(__linux__) && defined(HOST_X86_64)
+#include "linux/kvm.h"
+#endif
+#include <sys/ioctl.h>
+
 extern bool got_stop;
+extern const char *tmpfs;
 
 GCC_FMT_ATTR(3, 4)
 QDict *wait_command_fd(QTestState *who, int fd, const char *command, ...);
@@ -34,4 +41,12 @@ void wait_for_migration_complete(QTestState *who);
 
 void wait_for_migration_fail(QTestState *from, bool allow_active);
 
+void init_bootfile(const char *bootpath, void *content, size_t len);
+
+void wait_for_serial(const char *side);
+
+bool kvm_dirty_ring_supported(void);
+
+void cleanup(const char *filename);
+
 #endif /* MIGRATION_HELPERS_H_ */
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 0870656..eec6dd0 100644
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
@@ -91,8 +85,6 @@ static bool ufd_version_check(void)
 
 #endif
 
-static const char *tmpfs;
-
 /* The boot file modifies memory area in [start_address, end_address)
  * repeatedly. It outputs a 'B' at a fixed rate while it's still running.
  */
@@ -100,70 +92,6 @@ static const char *tmpfs;
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
@@ -276,13 +204,6 @@ static void check_guests_ram(QTestState *who)
     g_assert(bad == 0);
 }
 
-static void cleanup(const char *filename)
-{
-    g_autofree char *path = g_strdup_printf("%s/%s", tmpfs, filename);
-
-    unlink(path);
-}
-
 static char *SocketAddress_to_str(SocketAddress *addr)
 {
     switch (addr->type) {
@@ -1397,29 +1318,6 @@ static void test_multifd_tcp_cancel(void)
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


