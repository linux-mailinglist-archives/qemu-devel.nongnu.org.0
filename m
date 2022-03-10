Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC46C4D5075
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:27:14 +0100 (CET)
Received: from localhost ([::1]:34124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSMZF-0000i6-Ka
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:27:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMSX-0003tZ-FJ
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:20:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMSV-0003uY-1q
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:20:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646932814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v9WDAA+aqX60gpg8a9BzhGwCiNqeYDBoLASJv63T52U=;
 b=Ls68R+l7V2WgZU3hezXfvEGHorv+bU0ZmYq/hvjnYpTMVMvjCWLUfVq3dlOIILAGJS4Gl9
 o5oYxGfcoHgkFkpWlAS46MWYgcNUr0EDBpp6ym2xZC9N/pQ4eGjoA6B2pbPHwYN+O66+cv
 rx98z3YYbcBtgvkhu92SZV7NJdz657k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-bRGzM5F9M5-GyfP9BW8zGg-1; Thu, 10 Mar 2022 12:19:44 -0500
X-MC-Unique: bRGzM5F9M5-GyfP9BW8zGg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC646800D55
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 17:19:42 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 344CB106D5B8;
 Thu, 10 Mar 2022 17:19:41 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/18] tests: add migration tests of TLS with x509
 credentials
Date: Thu, 10 Mar 2022 17:18:16 +0000
Message-Id: <20220310171821.3724080-14-berrange@redhat.com>
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
scenarios when using TLS with x509 certificates. There are quite a few
different scenarios that matter in relation to hostname validation.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 meson.build                  |   1 +
 tests/qtest/meson.build      |   5 +
 tests/qtest/migration-test.c | 382 ++++++++++++++++++++++++++++++++++-
 3 files changed, 386 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 2d6601467f..89c0283ebe 100644
--- a/meson.build
+++ b/meson.build
@@ -1562,6 +1562,7 @@ config_host_data.set('CONFIG_KEYUTILS', keyutils.found())
 config_host_data.set('CONFIG_GETTID', has_gettid)
 config_host_data.set('CONFIG_GNUTLS', gnutls.found())
 config_host_data.set('CONFIG_GNUTLS_CRYPTO', gnutls_crypto.found())
+config_host_data.set('CONFIG_TASN1', tasn1.found())
 config_host_data.set('CONFIG_GCRYPT', gcrypt.found())
 config_host_data.set('CONFIG_NETTLE', nettle.found())
 config_host_data.set('CONFIG_QEMU_PRIVATE_XTS', xts == 'private')
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 81e7b9d530..ce94380a08 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -281,6 +281,11 @@ tpmemu_files = ['tpm-emu.c', 'tpm-util.c', 'tpm-tests.c']
 migration_files = [files('migration-helpers.c')]
 if gnutls.found()
   migration_files += [files('../unit/crypto-tls-psk-helpers.c'), gnutls]
+
+  if tasn1.found()
+    migration_files += [files('../unit/crypto-tls-x509-helpers.c',
+                              '../unit/pkix_asn1_tab.c'), tasn1]
+  endif
 endif
 
 qtests = {
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index f733aa352e..c730697f74 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -29,6 +29,9 @@
 #include "tests/migration/migration-test.h"
 #ifdef CONFIG_GNUTLS
 # include "tests/unit/crypto-tls-psk-helpers.h"
+# ifdef CONFIG_TASN1
+#  include "tests/unit/crypto-tls-x509-helpers.h"
+# endif /* CONFIG_TASN1 */
 #endif /* CONFIG_GNUTLS */
 
 /* For dirty ring test; so far only x86_64 is supported */
@@ -736,6 +739,234 @@ test_migrate_tls_psk_finish(QTestState *from,
     g_free(data->pskfile);
     g_free(data);
 }
+
+#ifdef CONFIG_TASN1
+typedef struct {
+    char *workdir;
+    char *keyfile;
+    char *cacert;
+    char *servercert;
+    char *serverkey;
+    char *clientcert;
+    char *clientkey;
+} TestMigrateTLSX509Data;
+
+typedef struct {
+    bool verifyclient;
+    bool clientcert;
+    bool hostileclient;
+    bool authzclient;
+    const char *certhostname;
+    const char *certipaddr;
+} TestMigrateTLSX509;
+
+static void *
+test_migrate_tls_x509_start_common(QTestState *from,
+                                   QTestState *to,
+                                   TestMigrateTLSX509 *args)
+{
+    TestMigrateTLSX509Data *data = g_new0(TestMigrateTLSX509Data, 1);
+    QDict *rsp;
+
+    data->workdir = g_strdup_printf("%s/tlscredsx5090", tmpfs);
+    data->keyfile = g_strdup_printf("%s/key.pem", data->workdir);
+
+    data->cacert = g_strdup_printf("%s/ca-cert.pem", data->workdir);
+    data->serverkey = g_strdup_printf("%s/server-key.pem", data->workdir);
+    data->servercert = g_strdup_printf("%s/server-cert.pem", data->workdir);
+    if (args->clientcert) {
+        data->clientkey = g_strdup_printf("%s/client-key.pem", data->workdir);
+        data->clientcert = g_strdup_printf("%s/client-cert.pem", data->workdir);
+    }
+
+    mkdir(data->workdir, 0700);
+
+    test_tls_init(data->keyfile);
+    g_assert(link(data->keyfile, data->serverkey) == 0);
+    if (args->clientcert) {
+        g_assert(link(data->keyfile, data->clientkey) == 0);
+    }
+
+    TLS_ROOT_REQ_SIMPLE(cacertreq, data->cacert);
+    if (args->clientcert) {
+        TLS_CERT_REQ_SIMPLE_CLIENT(servercertreq, cacertreq,
+                                   args->hostileclient ?
+                                   QCRYPTO_TLS_TEST_CLIENT_HOSTILE_NAME :
+                                   QCRYPTO_TLS_TEST_CLIENT_NAME,
+                                   data->clientcert);
+    }
+
+    TLS_CERT_REQ_SIMPLE_SERVER(clientcertreq, cacertreq,
+                               data->servercert,
+                               args->certhostname,
+                               args->certipaddr);
+
+    rsp = wait_command(from,
+                       "{ 'execute': 'object-add',"
+                       "  'arguments': { 'qom-type': 'tls-creds-x509',"
+                       "                 'id': 'tlscredsx509client0',"
+                       "                 'endpoint': 'client',"
+                       "                 'dir': %s,"
+                       "                 'sanity-check': true,"
+                       "                 'verify-peer': true} }",
+                       data->workdir);
+    qobject_unref(rsp);
+    migrate_set_parameter_str(from, "tls-creds", "tlscredsx509client0");
+    if (args->certhostname) {
+        migrate_set_parameter_str(from, "tls-hostname", args->certhostname);
+    }
+
+    rsp = wait_command(to,
+                       "{ 'execute': 'object-add',"
+                       "  'arguments': { 'qom-type': 'tls-creds-x509',"
+                       "                 'id': 'tlscredsx509server0',"
+                       "                 'endpoint': 'server',"
+                       "                 'dir': %s,"
+                       "                 'sanity-check': true,"
+                       "                 'verify-peer': %i} }",
+                       data->workdir, args->verifyclient);
+    qobject_unref(rsp);
+    migrate_set_parameter_str(to, "tls-creds", "tlscredsx509server0");
+
+    if (args->authzclient) {
+        rsp = wait_command(to,
+                           "{ 'execute': 'object-add',"
+                           "  'arguments': { 'qom-type': 'authz-simple',"
+                           "                 'id': 'tlsauthz0',"
+                           "                 'identity': %s} }",
+                           "CN=" QCRYPTO_TLS_TEST_CLIENT_NAME);
+        migrate_set_parameter_str(to, "tls-authz", "tlsauthz0");
+    }
+
+    return data;
+}
+
+/*
+ * The normal case: match server's cert hostname against
+ * whatever host we were telling QEMU to connect to (if any)
+ */
+static void *
+test_migrate_tls_x509_start_default_host(QTestState *from,
+                                         QTestState *to)
+{
+    TestMigrateTLSX509 args = {
+        .verifyclient = true,
+        .clientcert = true,
+        .certipaddr = "127.0.0.1"
+    };
+    return test_migrate_tls_x509_start_common(from, to, &args);
+}
+
+/*
+ * The unusual case: the server's cert is different from
+ * the address we're telling QEMU to connect to (if any),
+ * so we must give QEMU an explicit hostname to validate
+ */
+static void *
+test_migrate_tls_x509_start_override_host(QTestState *from,
+                                          QTestState *to)
+{
+    TestMigrateTLSX509 args = {
+        .verifyclient = true,
+        .clientcert = true,
+        .certhostname = "qemu.org",
+    };
+    return test_migrate_tls_x509_start_common(from, to, &args);
+}
+
+/*
+ * The unusual case: the server's cert is different from
+ * the address we're telling QEMU to connect to, and so we
+ * expect the client to reject the server
+ */
+static void *
+test_migrate_tls_x509_start_mismatch_host(QTestState *from,
+                                          QTestState *to)
+{
+    TestMigrateTLSX509 args = {
+        .verifyclient = true,
+        .clientcert = true,
+        .certipaddr = "10.0.0.1",
+    };
+    return test_migrate_tls_x509_start_common(from, to, &args);
+}
+
+static void *
+test_migrate_tls_x509_start_friendly_client(QTestState *from,
+                                            QTestState *to)
+{
+    TestMigrateTLSX509 args = {
+        .verifyclient = true,
+        .clientcert = true,
+        .authzclient = true,
+        .certipaddr = "127.0.0.1",
+    };
+    return test_migrate_tls_x509_start_common(from, to, &args);
+}
+
+static void *
+test_migrate_tls_x509_start_hostile_client(QTestState *from,
+                                           QTestState *to)
+{
+    TestMigrateTLSX509 args = {
+        .verifyclient = true,
+        .clientcert = true,
+        .hostileclient = true,
+        .authzclient = true,
+        .certipaddr = "127.0.0.1",
+    };
+    return test_migrate_tls_x509_start_common(from, to, &args);
+}
+
+/*
+ * The case with no client certificate presented,
+ * and no server verification
+ */
+static void *
+test_migrate_tls_x509_start_allow_anon_client(QTestState *from,
+                                              QTestState *to)
+{
+    TestMigrateTLSX509 args = {
+        .certipaddr = "127.0.0.1",
+    };
+    return test_migrate_tls_x509_start_common(from, to, &args);
+}
+
+/*
+ * The case with no client certificate presented,
+ * and server verification rejecting
+ */
+static void *
+test_migrate_tls_x509_start_reject_anon_client(QTestState *from,
+                                               QTestState *to)
+{
+    TestMigrateTLSX509 args = {
+        .verifyclient = true,
+        .certipaddr = "127.0.0.1",
+    };
+    return test_migrate_tls_x509_start_common(from, to, &args);
+}
+
+static void
+test_migrate_tls_x509_finish(QTestState *from,
+                             QTestState *to,
+                             void *opaque)
+{
+    TestMigrateTLSX509Data *data = opaque;
+
+    test_tls_cleanup(data->keyfile);
+    unlink(data->cacert);
+    unlink(data->servercert);
+    unlink(data->serverkey);
+    unlink(data->clientcert);
+    unlink(data->clientkey);
+    rmdir(data->workdir);
+
+    g_free(data->workdir);
+    g_free(data->keyfile);
+    g_free(data);
+}
+#endif /* CONFIG_TASN1 */
 #endif /* CONFIG_GNUTLS */
 
 static int migrate_postcopy_prepare(QTestState **from_ptr,
@@ -1020,6 +1251,21 @@ static void test_precopy_unix_plain(void)
     test_precopy_common(&args);
 }
 
+static void test_precopy_unix_dirty_ring(void)
+{
+    g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
+    MigrateCommon args = {
+        .start = {
+            .use_dirty_ring = true,
+        },
+        .listen_uri = uri,
+        .connect_uri = uri,
+    };
+
+    test_precopy_common(&args);
+}
+
+#ifdef CONFIG_GNUTLS
 static void test_precopy_unix_tls_psk(void)
 {
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
@@ -1033,19 +1279,38 @@ static void test_precopy_unix_tls_psk(void)
     test_precopy_common(&args);
 }
 
-static void test_precopy_unix_dirty_ring(void)
+#ifdef CONFIG_TASN1
+static void test_precopy_unix_tls_x509_default_host(void)
 {
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
     MigrateCommon args = {
         .start = {
-            .use_dirty_ring = true,
+            .hide_stderr = true,
         },
+        .connect_uri = uri,
         .listen_uri = uri,
+        .start_hook = test_migrate_tls_x509_start_default_host,
+        .finish_hook = test_migrate_tls_x509_finish,
+        .result = MIG_TEST_FAIL_DEST_QUIT_ERR,
+    };
+
+    test_precopy_common(&args);
+}
+
+static void test_precopy_unix_tls_x509_override_host(void)
+{
+    g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
+    MigrateCommon args = {
         .connect_uri = uri,
+        .listen_uri = uri,
+        .start_hook = test_migrate_tls_x509_start_override_host,
+        .finish_hook = test_migrate_tls_x509_finish,
     };
 
     test_precopy_common(&args);
 }
+#endif /* CONFIG_TASN1 */
+#endif /* CONFIG_GNUTLS */
 
 #if 0
 /* Currently upset on aarch64 TCG */
@@ -1172,6 +1437,97 @@ static void test_precopy_tcp_tls_psk_mismatch(void)
 
     test_precopy_common(&args);
 }
+
+#ifdef CONFIG_TASN1
+static void test_precopy_tcp_tls_x509_default_host(void)
+{
+    MigrateCommon args = {
+        .listen_uri = "tcp:127.0.0.1:0",
+        .start_hook = test_migrate_tls_x509_start_default_host,
+        .finish_hook = test_migrate_tls_x509_finish,
+    };
+
+    test_precopy_common(&args);
+}
+
+static void test_precopy_tcp_tls_x509_override_host(void)
+{
+    MigrateCommon args = {
+        .listen_uri = "tcp:127.0.0.1:0",
+        .start_hook = test_migrate_tls_x509_start_override_host,
+        .finish_hook = test_migrate_tls_x509_finish,
+    };
+
+    test_precopy_common(&args);
+}
+
+static void test_precopy_tcp_tls_x509_mismatch_host(void)
+{
+    MigrateCommon args = {
+        .start = {
+            .hide_stderr = true,
+        },
+        .listen_uri = "tcp:127.0.0.1:0",
+        .start_hook = test_migrate_tls_x509_start_mismatch_host,
+        .finish_hook = test_migrate_tls_x509_finish,
+        .result = MIG_TEST_FAIL_DEST_QUIT_ERR,
+    };
+
+    test_precopy_common(&args);
+}
+
+static void test_precopy_tcp_tls_x509_friendly_client(void)
+{
+    MigrateCommon args = {
+        .listen_uri = "tcp:127.0.0.1:0",
+        .start_hook = test_migrate_tls_x509_start_friendly_client,
+        .finish_hook = test_migrate_tls_x509_finish,
+    };
+
+    test_precopy_common(&args);
+}
+
+static void test_precopy_tcp_tls_x509_hostile_client(void)
+{
+    MigrateCommon args = {
+        .start = {
+            .hide_stderr = true,
+        },
+        .listen_uri = "tcp:127.0.0.1:0",
+        .start_hook = test_migrate_tls_x509_start_hostile_client,
+        .finish_hook = test_migrate_tls_x509_finish,
+        .result = MIG_TEST_FAIL,
+    };
+
+    test_precopy_common(&args);
+}
+
+static void test_precopy_tcp_tls_x509_allow_anon_client(void)
+{
+    MigrateCommon args = {
+        .listen_uri = "tcp:127.0.0.1:0",
+        .start_hook = test_migrate_tls_x509_start_allow_anon_client,
+        .finish_hook = test_migrate_tls_x509_finish,
+    };
+
+    test_precopy_common(&args);
+}
+
+static void test_precopy_tcp_tls_x509_reject_anon_client(void)
+{
+    MigrateCommon args = {
+        .start = {
+            .hide_stderr = true,
+        },
+        .listen_uri = "tcp:127.0.0.1:0",
+        .start_hook = test_migrate_tls_x509_start_reject_anon_client,
+        .finish_hook = test_migrate_tls_x509_finish,
+        .result = MIG_TEST_FAIL,
+    };
+
+    test_precopy_common(&args);
+}
+#endif /* CONFIG_TASN1 */
 #endif /* CONFIG_GNUTLS */
 
 static void *test_migrate_fd_start_hook(QTestState *from,
@@ -1640,6 +1996,12 @@ int main(int argc, char **argv)
 #ifdef CONFIG_GNUTLS
     qtest_add_func("/migration/precopy/unix/tls/psk",
                    test_precopy_unix_tls_psk);
+#ifdef CONFIG_TASN1
+    qtest_add_func("/migration/precopy/unix/tls/x509/default-host",
+                   test_precopy_unix_tls_x509_default_host);
+    qtest_add_func("/migration/precopy/unix/tls/x509/override-host",
+                   test_precopy_unix_tls_x509_override_host);
+#endif /* CONFIG_TASN1 */
 #endif /* CONFIG_GNUTLS */
 
     qtest_add_func("/migration/precopy/tcp/plain", test_precopy_tcp_plain);
@@ -1648,6 +2010,22 @@ int main(int argc, char **argv)
                    test_precopy_tcp_tls_psk_match);
     qtest_add_func("/migration/precopy/tcp/tls/psk/mismatch",
                    test_precopy_tcp_tls_psk_mismatch);
+#ifdef CONFIG_TASN1
+    qtest_add_func("/migration/precopy/tcp/tls/x509/default-host",
+                   test_precopy_tcp_tls_x509_default_host);
+    qtest_add_func("/migration/precopy/tcp/tls/x509/override-host",
+                   test_precopy_tcp_tls_x509_override_host);
+    qtest_add_func("/migration/precopy/tcp/tls/x509/mismatch-host",
+                   test_precopy_tcp_tls_x509_mismatch_host);
+    qtest_add_func("/migration/precopy/tcp/tls/x509/friendly-client",
+                   test_precopy_tcp_tls_x509_friendly_client);
+    qtest_add_func("/migration/precopy/tcp/tls/x509/hostile-client",
+                   test_precopy_tcp_tls_x509_hostile_client);
+    qtest_add_func("/migration/precopy/tcp/tls/x509/allow-anon-client",
+                   test_precopy_tcp_tls_x509_allow_anon_client);
+    qtest_add_func("/migration/precopy/tcp/tls/x509/reject-anon-client",
+                   test_precopy_tcp_tls_x509_reject_anon_client);
+#endif /* CONFIG_TASN1 */
 #endif /* CONFIG_GNUTLS */
 
     /* qtest_add_func("/migration/ignore_shared", test_ignore_shared); */
-- 
2.34.1


