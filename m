Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEDC4CACC5
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:01:12 +0100 (CET)
Received: from localhost ([::1]:36626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTHj-0000SZ-UI
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:01:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPT87-0007Z7-GC
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:51:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPT84-0000TI-U0
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:51:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646243472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6LQElUWXWVDqSqnr6NtBRmmBdsIJSLXg8swzAqhGGcw=;
 b=GhzXuTGUio2Rk48fWTeMTp7kflE+qDEAWxOwnLDzlNsvJdC5GgMF/hXX1l86drfpmB4yrB
 QVsSNRjSVIJBeX//4yVXqqRwyA2hOqRtvDfxQUyylq8Oh1EgdRtNmJpZsyO/DI1CAnKipI
 5mXuWh1pL7pglcvt17t4NReodeNy5K0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-SWmhrSJCNJSnj-54dG84kA-1; Wed, 02 Mar 2022 12:51:10 -0500
X-MC-Unique: SWmhrSJCNJSnj-54dG84kA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A03991854E21
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 17:51:09 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A9768000B;
 Wed,  2 Mar 2022 17:51:07 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/18] tests: add migration tests of TLS with x509 credentials
Date: Wed,  2 Mar 2022 17:49:27 +0000
Message-Id: <20220302174932.2692378-14-berrange@redhat.com>
In-Reply-To: <20220302174932.2692378-1-berrange@redhat.com>
References: <20220302174932.2692378-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 tests/qtest/migration-test.c | 366 +++++++++++++++++++++++++++++++++--
 3 files changed, 361 insertions(+), 11 deletions(-)

diff --git a/meson.build b/meson.build
index 8df40bfac4..06d2175bdf 100644
--- a/meson.build
+++ b/meson.build
@@ -1548,6 +1548,7 @@ config_host_data.set('CONFIG_KEYUTILS', keyutils.found())
 config_host_data.set('CONFIG_GETTID', has_gettid)
 config_host_data.set('CONFIG_GNUTLS', gnutls.found())
 config_host_data.set('CONFIG_GNUTLS_CRYPTO', gnutls_crypto.found())
+config_host_data.set('CONFIG_TASN1', tasn1.found())
 config_host_data.set('CONFIG_GCRYPT', gcrypt.found())
 config_host_data.set('CONFIG_NETTLE', nettle.found())
 config_host_data.set('CONFIG_QEMU_PRIVATE_XTS', xts == 'private')
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index a95bb5def3..91dc36fb9b 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -279,6 +279,11 @@ tpmemu_files = ['tpm-emu.c', 'tpm-util.c', 'tpm-tests.c']
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
index 744a9f8123..4040443caa 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -29,6 +29,9 @@
 #include "tests/migration/migration-test.h"
 #ifdef CONFIG_GNUTLS
 # include "tests/unit/crypto-tls-psk-helpers.h"
+# ifdef CONFIG_TASN1
+#  include "tests/unit/crypto-tls-x509-helpers.h"
+# endif
 #endif
 
 /* For dirty ring test; so far only x86_64 is supported */
@@ -754,6 +757,237 @@ test_migrate_tls_psk_finish(QTestState *from,
     g_free(data->pskfile);
     g_free(data);
 }
+
+#ifdef CONFIG_TASN1
+struct TestMigrateTLSX509Data {
+    char *workdir;
+    char *keyfile;
+    char *cacert;
+    char *servercert;
+    char *serverkey;
+    char *clientcert;
+    char *clientkey;
+};
+
+static void *
+test_migrate_tls_x509_start_common(QTestState *from,
+                                   QTestState *to,
+                                   bool verifyclient,
+                                   bool clientcert,
+                                   bool hostileclient,
+                                   bool authzclient,
+                                   const char *certhostname,
+                                   const char *certipaddr)
+{
+    struct TestMigrateTLSX509Data *data =
+        g_new0(struct TestMigrateTLSX509Data, 1);
+    QDict *rsp;
+
+    data->workdir = g_strdup_printf("%s/tlscredsx5090", tmpfs);
+    data->keyfile = g_strdup_printf("%s/key.pem", data->workdir);
+
+    data->cacert = g_strdup_printf("%s/ca-cert.pem", data->workdir);
+    data->serverkey = g_strdup_printf("%s/server-key.pem", data->workdir);
+    data->servercert = g_strdup_printf("%s/server-cert.pem", data->workdir);
+    if (clientcert) {
+        data->clientkey = g_strdup_printf("%s/client-key.pem", data->workdir);
+        data->clientcert = g_strdup_printf("%s/client-cert.pem", data->workdir);
+    }
+
+    mkdir(data->workdir, 0700);
+
+    test_tls_init(data->keyfile);
+    g_assert(link(data->keyfile, data->serverkey) == 0);
+    if (clientcert) {
+        g_assert(link(data->keyfile, data->clientkey) == 0);
+    }
+
+    TLS_ROOT_REQ_SIMPLE(cacertreq, data->cacert);
+    if (clientcert) {
+        TLS_CERT_REQ_SIMPLE_CLIENT(servercertreq, cacertreq,
+                                   hostileclient ?
+                                   QCRYPTO_TLS_TEST_CLIENT_HOSTILE_NAME :
+                                   QCRYPTO_TLS_TEST_CLIENT_NAME,
+                                   data->clientcert);
+    }
+
+    TLS_CERT_REQ_SIMPLE_SERVER(clientcertreq, cacertreq,
+                               data->servercert,
+                               certhostname, certipaddr);
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
+    if (certhostname) {
+        migrate_set_parameter_str(from, "tls-hostname", certhostname);
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
+                       data->workdir, verifyclient);
+    qobject_unref(rsp);
+    migrate_set_parameter_str(to, "tls-creds", "tlscredsx509server0");
+
+    if (authzclient) {
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
+    return test_migrate_tls_x509_start_common(from, to,
+                                              true, /* verifyclient */
+                                              true, /* clientcert */
+                                              false, /* hostileclient */
+                                              false, /* authzclient */
+                                              NULL,
+                                              "127.0.0.1");
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
+    return test_migrate_tls_x509_start_common(from, to,
+                                              true, /* verifyclient */
+                                              true, /* clientcert */
+                                              false, /* hostileclient */
+                                              false, /* authzclient */
+                                              "qemu.org",
+                                              NULL);
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
+    return test_migrate_tls_x509_start_common(from, to,
+                                              true, /* verifyclient */
+                                              true, /* clientcert */
+                                              false, /* hostileclient */
+                                              false, /* authzclient */
+                                              NULL,
+                                              "10.0.0.1");
+}
+
+static void *
+test_migrate_tls_x509_start_friendly_client(QTestState *from,
+                                            QTestState *to)
+{
+    return test_migrate_tls_x509_start_common(from, to,
+                                              true, /* verifyclient */
+                                              true, /* clientcert */
+                                              false, /* hostileclient */
+                                              true, /* authzclient */
+                                              NULL,
+                                              "127.0.0.1");
+}
+
+static void *
+test_migrate_tls_x509_start_hostile_client(QTestState *from,
+                                           QTestState *to)
+{
+    return test_migrate_tls_x509_start_common(from, to,
+                                              true, /* verifyclient */
+                                              true, /* clientcert */
+                                              true, /* hostileclient */
+                                              true, /* authzclient */
+                                              NULL,
+                                              "127.0.0.1");
+}
+
+/*
+ * The case with no client certificate presented,
+ * and no server verification
+ */
+static void *
+test_migrate_tls_x509_start_allow_anonymous_client(QTestState *from,
+                                                   QTestState *to)
+{
+    return test_migrate_tls_x509_start_common(from, to,
+                                              false, /* verifyclient */
+                                              false, /* clientcert */
+                                              false, /* hostileclient */
+                                              false, /* authzclient */
+                                              NULL,
+                                              "127.0.0.1");
+}
+
+/*
+ * The case with no client certificate presented,
+ * and server verification rejecting
+ */
+static void *
+test_migrate_tls_x509_start_reject_anonymous_client(QTestState *from,
+                                                    QTestState *to)
+{
+    return test_migrate_tls_x509_start_common(from, to,
+                                              true, /* verifyclient */
+                                              false, /* clientcert */
+                                              false, /* hostileclient */
+                                              false, /* authzclient */
+                                              NULL,
+                                              "127.0.0.1");
+}
+
+static void
+test_migrate_tls_x509_finish(QTestState *from,
+                             QTestState *to,
+                             void *opaque)
+{
+    struct TestMigrateTLSX509Data *data = opaque;
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
@@ -1020,6 +1254,7 @@ static void test_precopy_common(const char *listen_uri,
 static void test_precopy_unix_common(TestMigrateStartHook start_hook,
                                      TestMigrateFinishHook finish_hook,
                                      bool expect_fail,
+                                     bool dst_quit,
                                      bool dirty_ring)
 {
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
@@ -1029,7 +1264,7 @@ static void test_precopy_unix_common(TestMigrateStartHook start_hook,
                         start_hook,
                         finish_hook,
                         expect_fail,
-                        false, /* dst_quit */
+                        dst_quit,
                         dirty_ring);
 }
 
@@ -1038,24 +1273,49 @@ static void test_precopy_unix_plain(void)
     test_precopy_unix_common(NULL, /* start_hook */
                              NULL, /* finish_hook */
                              false, /* expect_fail */
+                             false, /* dst_quit */
                              false /* dirty_ring */);
 }
 
+static void test_precopy_unix_dirty_ring(void)
+{
+    test_precopy_unix_common(NULL, /* start_hook */
+                             NULL, /* finish_hook */
+                             false, /* clientReject */
+                             false, /* dst_quit */
+                             true /* dirty_ring */);
+}
+
+#ifdef CONFIG_GNUTLS
 static void test_precopy_unix_tls_psk(void)
 {
     test_precopy_unix_common(test_migrate_tls_psk_start_match,
                              test_migrate_tls_psk_finish,
                              false, /* expect_fail */
+                             false, /* dst_quit */
                              false /* dirty_ring */);
 }
 
-static void test_precopy_unix_dirty_ring(void)
+#ifdef CONFIG_TASN1
+static void test_precopy_unix_tls_x509_default_host(void)
 {
-    test_precopy_unix_common(NULL, /* start_hook */
-                             NULL, /* finish_hook */
-                             false, /* clientReject */
-                             true /* dirty_ring */);
+    test_precopy_unix_common(test_migrate_tls_x509_start_default_host,
+                             test_migrate_tls_x509_finish,
+                             true, /* expect_fail */
+                             true, /* dst_quit */
+                             false /* dirty_ring */);
+}
+
+static void test_precopy_unix_tls_x509_override_host(void)
+{
+    test_precopy_unix_common(test_migrate_tls_x509_start_override_host,
+                             test_migrate_tls_x509_finish,
+                             false, /* expect_fail */
+                             false, /* dst_quit */
+                             false /* dirty_ring */);
 }
+#endif /* CONFIG_TASN1 */
+#endif /* CONFIG_GNUTLS */
 
 #if 0
 /* Currently upset on aarch64 TCG */
@@ -1149,14 +1409,15 @@ static void test_xbzrle_unix(void)
 
 static void test_precopy_tcp_common(TestMigrateStartHook start_hook,
                                     TestMigrateFinishHook finish_hook,
-                                    bool expect_fail)
+                                    bool expect_fail,
+                                    bool dst_quit)
 {
     test_precopy_common("tcp:127.0.0.1:0",
                         NULL, /* connect_uri */
                         start_hook,
                         finish_hook,
                         expect_fail,
-                        false, /* dst_quit */
+                        dst_quit,
                         false /* dirty_ring */);
 }
 
@@ -1165,7 +1426,8 @@ static void test_precopy_tcp_plain(void)
 {
     test_precopy_tcp_common(NULL, /* start_hook */
                             NULL, /* finish_hook */
-                            false /* expect_fail */);
+                            false, /* expect_fail */
+                            false /* dst_quit */);
 }
 
 #ifdef CONFIG_GNUTLS
@@ -1173,15 +1435,75 @@ static void test_precopy_tcp_tls_psk_match(void)
 {
     test_precopy_tcp_common(test_migrate_tls_psk_start_match,
                             test_migrate_tls_psk_finish,
-                            false /* expect_fail */);
+                            false, /* expect_fail */
+                            false /* dst_quit */);
 }
 
 static void test_precopy_tcp_tls_psk_mismatch(void)
 {
     test_precopy_tcp_common(test_migrate_tls_psk_start_mismatch,
                             test_migrate_tls_psk_finish,
-                            true /* expect_fail */);
+                            true, /* expect_fail */
+                            false /* dst_quit */);
+}
+
+#ifdef CONFIG_TASN1
+static void test_precopy_tcp_tls_x509_default_host(void)
+{
+    test_precopy_tcp_common(test_migrate_tls_x509_start_default_host,
+                            test_migrate_tls_x509_finish,
+                            false, /* expect_fail */
+                            false /* dst_quit */);
+}
+
+static void test_precopy_tcp_tls_x509_override_host(void)
+{
+    test_precopy_tcp_common(test_migrate_tls_x509_start_override_host,
+                            test_migrate_tls_x509_finish,
+                            false, /* expect_fail */
+                            false /* dst_quit */);
+}
+
+static void test_precopy_tcp_tls_x509_mismatch_host(void)
+{
+    test_precopy_tcp_common(test_migrate_tls_x509_start_mismatch_host,
+                            test_migrate_tls_x509_finish,
+                            true, /* expect_fail */
+                            true /* dst_quit */);
+}
+
+static void test_precopy_tcp_tls_x509_friendly_client(void)
+{
+    test_precopy_tcp_common(test_migrate_tls_x509_start_friendly_client,
+                            test_migrate_tls_x509_finish,
+                            false, /* expect_fail */
+                            false /* dst_quit */);
+}
+
+static void test_precopy_tcp_tls_x509_hostile_client(void)
+{
+    test_precopy_tcp_common(test_migrate_tls_x509_start_hostile_client,
+                            test_migrate_tls_x509_finish,
+                            true, /* expect_quit */
+                            false /* dst_quit */);
+}
+
+static void test_precopy_tcp_tls_x509_allow_anonymous_client(void)
+{
+    test_precopy_tcp_common(test_migrate_tls_x509_start_allow_anonymous_client,
+                            test_migrate_tls_x509_finish,
+                            false, /* expect_fail */
+                            false /* dst_quit */);
+}
+
+static void test_precopy_tcp_tls_x509_reject_anonymous_client(void)
+{
+    test_precopy_tcp_common(test_migrate_tls_x509_start_reject_anonymous_client,
+                            test_migrate_tls_x509_finish,
+                            true, /* expect_fail */
+                            false /* dst_quit */);
 }
+#endif /* CONFIG_TASN1 */
 #endif /* CONFIG_GNUTLS */
 
 static void *test_migrate_fd_start_hook(QTestState *from,
@@ -1651,6 +1973,12 @@ int main(int argc, char **argv)
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
@@ -1659,6 +1987,22 @@ int main(int argc, char **argv)
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
+    qtest_add_func("/migration/precopy/tcp/tls/x509/allow-anonymous-client",
+                   test_precopy_tcp_tls_x509_allow_anonymous_client);
+    qtest_add_func("/migration/precopy/tcp/tls/x509/reject-anonymous-client",
+                   test_precopy_tcp_tls_x509_reject_anonymous_client);
+#endif /* CONFIG_TASN1 */
 #endif /* CONFIG_GNUTLS */
 
     /* qtest_add_func("/migration/ignore_shared", test_ignore_shared); */
-- 
2.34.1


