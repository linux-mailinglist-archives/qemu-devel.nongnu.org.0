Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5094D5024
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:23:51 +0100 (CET)
Received: from localhost ([::1]:50782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSMVy-0001PU-Em
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:23:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMS1-0003H7-Qr
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:19:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMRz-0003gX-RL
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:19:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646932783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b+s/qVxPScKTRe1Tn7crASqMSZwm16ZivF0IZSs9Q5Y=;
 b=WrI0xkywY3KmF+5vBTHXqZ0tMv59gsk67LFDneqs7gaEh45zeCJZOHi35Iu/fUyvKoMAZD
 Kn9fmFSv9d8b3rpT0nI5WIQ9v2rSDfV4XNtfm25/9tCvZTPF/Vrl5zoMzkOL0ROAwT78uL
 E52I4BLcOTqiPYtg013GOIxWYI4dMaY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-8Ex848FVMZ6FmokrAPoqRw-1; Thu, 10 Mar 2022 12:19:41 -0500
X-MC-Unique: 8Ex848FVMZ6FmokrAPoqRw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1D65801AFE
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 17:19:40 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9511A106F96A;
 Thu, 10 Mar 2022 17:19:38 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/18] tests: add migration tests of TLS with PSK
 credentials
Date: Thu, 10 Mar 2022 17:18:15 +0000
Message-Id: <20220310171821.3724080-13-berrange@redhat.com>
In-Reply-To: <20220310171821.3724080-1-berrange@redhat.com>
References: <20220310171821.3724080-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This validates that we correctly handle migration success and failure
scenarios when using TLS with pre shared keys.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/meson.build             |   7 +-
 tests/qtest/migration-test.c        | 159 +++++++++++++++++++++++++++-
 tests/unit/crypto-tls-psk-helpers.c |  18 +++-
 tests/unit/crypto-tls-psk-helpers.h |   1 +
 4 files changed, 177 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 7d8c74fdba..81e7b9d530 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -278,13 +278,18 @@ endif
 
 tpmemu_files = ['tpm-emu.c', 'tpm-util.c', 'tpm-tests.c']
 
+migration_files = [files('migration-helpers.c')]
+if gnutls.found()
+  migration_files += [files('../unit/crypto-tls-psk-helpers.c'), gnutls]
+endif
+
 qtests = {
   'bios-tables-test': [io, 'boot-sector.c', 'acpi-utils.c', 'tpm-emu.c'],
   'cdrom-test': files('boot-sector.c'),
   'dbus-vmstate-test': files('migration-helpers.c') + dbus_vmstate1,
   'erst-test': files('erst-test.c'),
   'ivshmem-test': [rt, '../../contrib/ivshmem-server/ivshmem-server.c'],
-  'migration-test': files('migration-helpers.c'),
+  'migration-test': migration_files,
   'pxe-test': files('boot-sector.c'),
   'qos-test': [chardev, io, qos_test_ss.apply(config_host, strict: false).sources()],
   'tpm-crb-swtpm-test': [io, tpmemu_files],
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 2af36c16a3..f733aa352e 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -23,9 +23,13 @@
 #include "qapi/qapi-visit-sockets.h"
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/qobject-output-visitor.h"
+#include "crypto/tlscredspsk.h"
 
 #include "migration-helpers.h"
 #include "tests/migration/migration-test.h"
+#ifdef CONFIG_GNUTLS
+# include "tests/unit/crypto-tls-psk-helpers.h"
+#endif /* CONFIG_GNUTLS */
 
 /* For dirty ring test; so far only x86_64 is supported */
 #if defined(__linux__) && defined(HOST_X86_64)
@@ -640,6 +644,100 @@ static void test_migrate_end(QTestState *from, QTestState *to, bool test_dest)
     cleanup("dest_serial");
 }
 
+#ifdef CONFIG_GNUTLS
+struct TestMigrateTLSPSKData {
+    char *workdir;
+    char *workdiralt;
+    char *pskfile;
+    char *pskfilealt;
+};
+
+static void *
+test_migrate_tls_psk_start_common(QTestState *from,
+                                  QTestState *to,
+                                  bool mismatch)
+{
+    struct TestMigrateTLSPSKData *data =
+        g_new0(struct TestMigrateTLSPSKData, 1);
+    QDict *rsp;
+
+    data->workdir = g_strdup_printf("%s/tlscredspsk0", tmpfs);
+    data->pskfile = g_strdup_printf("%s/%s", data->workdir,
+                                    QCRYPTO_TLS_CREDS_PSKFILE);
+    mkdir(data->workdir, 0700);
+    test_tls_psk_init(data->pskfile);
+
+    if (mismatch) {
+        data->workdiralt = g_strdup_printf("%s/tlscredspskalt0", tmpfs);
+        data->pskfilealt = g_strdup_printf("%s/%s", data->workdiralt,
+                                           QCRYPTO_TLS_CREDS_PSKFILE);
+        mkdir(data->workdiralt, 0700);
+        test_tls_psk_init_alt(data->pskfilealt);
+    }
+
+    rsp = wait_command(from,
+                       "{ 'execute': 'object-add',"
+                       "  'arguments': { 'qom-type': 'tls-creds-psk',"
+                       "                 'id': 'tlscredspsk0',"
+                       "                 'endpoint': 'client',"
+                       "                 'dir': %s,"
+                       "                 'username': 'qemu'} }",
+                       data->workdir);
+    qobject_unref(rsp);
+
+    rsp = wait_command(to,
+                       "{ 'execute': 'object-add',"
+                       "  'arguments': { 'qom-type': 'tls-creds-psk',"
+                       "                 'id': 'tlscredspsk0',"
+                       "                 'endpoint': 'server',"
+                       "                 'dir': %s } }",
+                       mismatch ? data->workdiralt : data->workdir);
+    qobject_unref(rsp);
+
+    migrate_set_parameter_str(from, "tls-creds", "tlscredspsk0");
+    migrate_set_parameter_str(to, "tls-creds", "tlscredspsk0");
+
+    return data;
+}
+
+static void *
+test_migrate_tls_psk_start_match(QTestState *from,
+                                 QTestState *to)
+{
+    return test_migrate_tls_psk_start_common(from, to, false);
+}
+
+static void *
+test_migrate_tls_psk_start_mismatch(QTestState *from,
+                                    QTestState *to)
+{
+    return test_migrate_tls_psk_start_common(from, to, true);
+}
+
+static void
+test_migrate_tls_psk_finish(QTestState *from,
+                            QTestState *to,
+                            void *opaque)
+{
+    struct TestMigrateTLSPSKData *data = opaque;
+
+    test_tls_psk_cleanup(data->pskfile);
+    if (data->pskfilealt) {
+        test_tls_psk_cleanup(data->pskfilealt);
+    }
+    rmdir(data->workdir);
+    if (data->workdiralt) {
+        rmdir(data->workdiralt);
+    }
+
+    g_free(data->workdiralt);
+    g_free(data->pskfilealt);
+    g_free(data->workdir);
+    g_free(data->pskfile);
+    g_free(data);
+}
+#endif /* CONFIG_GNUTLS */
+
 static int migrate_postcopy_prepare(QTestState **from_ptr,
                                     QTestState **to_ptr,
                                     MigrateStart *args)
@@ -911,7 +1009,7 @@ static void test_precopy_common(MigrateCommon *args)
     test_migrate_end(from, to, args->result == MIG_TEST_SUCCEED);
 }
 
-static void test_precopy_unix(void)
+static void test_precopy_unix_plain(void)
 {
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
     MigrateCommon args = {
@@ -922,6 +1020,19 @@ static void test_precopy_unix(void)
     test_precopy_common(&args);
 }
 
+static void test_precopy_unix_tls_psk(void)
+{
+    g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
+    MigrateCommon args = {
+        .connect_uri = uri,
+        .listen_uri = uri,
+        .start_hook = test_migrate_tls_psk_start_match,
+        .finish_hook = test_migrate_tls_psk_finish,
+    };
+
+    test_precopy_common(&args);
+}
+
 static void test_precopy_unix_dirty_ring(void)
 {
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
@@ -1026,7 +1137,7 @@ static void test_xbzrle_unix(void)
     test_xbzrle(uri);
 }
 
-static void test_precopy_tcp(void)
+static void test_precopy_tcp_plain(void)
 {
     MigrateCommon args = {
         .listen_uri = "tcp:127.0.0.1:0",
@@ -1035,6 +1146,34 @@ static void test_precopy_tcp(void)
     test_precopy_common(&args);
 }
 
+#ifdef CONFIG_GNUTLS
+static void test_precopy_tcp_tls_psk_match(void)
+{
+    MigrateCommon args = {
+        .listen_uri = "tcp:127.0.0.1:0",
+        .start_hook = test_migrate_tls_psk_start_match,
+        .finish_hook = test_migrate_tls_psk_finish,
+    };
+
+    test_precopy_common(&args);
+}
+
+static void test_precopy_tcp_tls_psk_mismatch(void)
+{
+    MigrateCommon args = {
+        .start = {
+            .hide_stderr = true,
+        },
+        .listen_uri = "tcp:127.0.0.1:0",
+        .start_hook = test_migrate_tls_psk_start_mismatch,
+        .finish_hook = test_migrate_tls_psk_finish,
+        .result = MIG_TEST_FAIL,
+    };
+
+    test_precopy_common(&args);
+}
+#endif /* CONFIG_GNUTLS */
+
 static void *test_migrate_fd_start_hook(QTestState *from,
                                         QTestState *to)
 {
@@ -1497,8 +1636,20 @@ int main(int argc, char **argv)
     qtest_add_func("/migration/postcopy/unix", test_postcopy);
     qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
     qtest_add_func("/migration/bad_dest", test_baddest);
-    qtest_add_func("/migration/precopy/unix", test_precopy_unix);
-    qtest_add_func("/migration/precopy/tcp", test_precopy_tcp);
+    qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
+#ifdef CONFIG_GNUTLS
+    qtest_add_func("/migration/precopy/unix/tls/psk",
+                   test_precopy_unix_tls_psk);
+#endif /* CONFIG_GNUTLS */
+
+    qtest_add_func("/migration/precopy/tcp/plain", test_precopy_tcp_plain);
+#ifdef CONFIG_GNUTLS
+    qtest_add_func("/migration/precopy/tcp/tls/psk/match",
+                   test_precopy_tcp_tls_psk_match);
+    qtest_add_func("/migration/precopy/tcp/tls/psk/mismatch",
+                   test_precopy_tcp_tls_psk_mismatch);
+#endif /* CONFIG_GNUTLS */
+
     /* qtest_add_func("/migration/ignore_shared", test_ignore_shared); */
     qtest_add_func("/migration/xbzrle/unix", test_xbzrle_unix);
     qtest_add_func("/migration/fd_proto", test_migrate_fd_proto);
diff --git a/tests/unit/crypto-tls-psk-helpers.c b/tests/unit/crypto-tls-psk-helpers.c
index 4bea7c6fa2..511e08cc9c 100644
--- a/tests/unit/crypto-tls-psk-helpers.c
+++ b/tests/unit/crypto-tls-psk-helpers.c
@@ -24,7 +24,8 @@
 #include "crypto-tls-psk-helpers.h"
 #include "qemu/sockets.h"
 
-void test_tls_psk_init(const char *pskfile)
+static void
+test_tls_psk_init_common(const char *pskfile, const char *user, const char *key)
 {
     FILE *fp;
 
@@ -33,11 +34,22 @@ void test_tls_psk_init(const char *pskfile)
         g_critical("Failed to create pskfile %s: %s", pskfile, strerror(errno));
         abort();
     }
-    /* Don't do this in real applications!  Use psktool. */
-    fprintf(fp, "qemu:009d5638c40fde0c\n");
+    fprintf(fp, "%s:%s\n", user, key);
     fclose(fp);
 }
 
+void test_tls_psk_init(const char *pskfile)
+{
+    /* Don't hard code a key like this in real applications!  Use psktool. */
+    test_tls_psk_init_common(pskfile, "qemu", "009d5638c40fde0c");
+}
+
+void test_tls_psk_init_alt(const char *pskfile)
+{
+    /* Don't hard code a key like this in real applications!  Use psktool. */
+    test_tls_psk_init_common(pskfile, "qemu", "10ffa6a2c42f0388");
+}
+
 void test_tls_psk_cleanup(const char *pskfile)
 {
     unlink(pskfile);
diff --git a/tests/unit/crypto-tls-psk-helpers.h b/tests/unit/crypto-tls-psk-helpers.h
index faa645c629..67f8bdda71 100644
--- a/tests/unit/crypto-tls-psk-helpers.h
+++ b/tests/unit/crypto-tls-psk-helpers.h
@@ -24,6 +24,7 @@
 #include <gnutls/gnutls.h>
 
 void test_tls_psk_init(const char *keyfile);
+void test_tls_psk_init_alt(const char *keyfile);
 void test_tls_psk_cleanup(const char *keyfile);
 
 #endif
-- 
2.34.1


