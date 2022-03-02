Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C48D4CAD44
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:14:09 +0100 (CET)
Received: from localhost ([::1]:43022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTUG-0007uU-7T
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:14:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPT8X-0000Sm-LA
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:51:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPT8V-00013H-Sc
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:51:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646243499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IQjfg5aIgrM2Dt2SlWrzzlkf5Ue3Yymh+B34IciuF8Y=;
 b=D6NfRsSx9o/u4dL72XwrImHSUZ5UzvIOwqdC++6IwJvDUN7FtlJekhhTB4fUdA9U+Ah5LO
 c/FeJ2kC6eKOKNnyZtVq+3f9UymY1RYW7RPfrYw95IAZkxdSg4SjGbo3mnaX9tBbPvTcPW
 t+LTfGDWFySwRfELI8pIoOX0CdrbpeI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-JZEeHF5bPoGVf2jwH0c86Q-1; Wed, 02 Mar 2022 12:51:38 -0500
X-MC-Unique: JZEeHF5bPoGVf2jwH0c86Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 722F951F6
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 17:51:37 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 032FF8000B;
 Wed,  2 Mar 2022 17:51:09 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/18] tests: convert XBZRLE migration test to use common
 helper
Date: Wed,  2 Mar 2022 17:49:28 +0000
Message-Id: <20220302174932.2692378-15-berrange@redhat.com>
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

Most of the XBZRLE migration test logic is common with the rest of the
precopy tests, so it can use the helper with just one small tweak.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/migration-test.c | 70 ++++++++++++++----------------------
 1 file changed, 26 insertions(+), 44 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 4040443caa..9896fcb134 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1162,6 +1162,7 @@ typedef void (*TestMigrateFinishHook)(QTestState *from,
  * @expect_fail: true if we expect migration to fail
  * @dst_quit: true if we expect the dst QEMU to quit with an
  *            abnormal exit status on failure
+ * @iterations: number of migration passes to wait for
  * @dirty_ring: true to use dirty ring tracking
  *
  * If @connect_uri is NULL, then it will query the dst
@@ -1185,6 +1186,7 @@ static void test_precopy_common(const char *listen_uri,
                                 TestMigrateFinishHook finish_hook,
                                 bool expect_fail,
                                 bool dst_quit,
+                                unsigned int iterations,
                                 bool dirty_ring)
 {
     MigrateStart *args = migrate_start_new();
@@ -1229,7 +1231,9 @@ static void test_precopy_common(const char *listen_uri,
             qtest_set_expected_status(to, 1);
         }
     } else {
-        wait_for_migration_pass(from);
+        while (iterations--) {
+            wait_for_migration_pass(from);
+        }
 
         migrate_set_parameter_int(from, "downtime-limit", CONVERGE_DOWNTIME);
 
@@ -1255,6 +1259,7 @@ static void test_precopy_unix_common(TestMigrateStartHook start_hook,
                                      TestMigrateFinishHook finish_hook,
                                      bool expect_fail,
                                      bool dst_quit,
+                                     unsigned int iterations,
                                      bool dirty_ring)
 {
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
@@ -1265,6 +1270,7 @@ static void test_precopy_unix_common(TestMigrateStartHook start_hook,
                         finish_hook,
                         expect_fail,
                         dst_quit,
+                        iterations,
                         dirty_ring);
 }
 
@@ -1274,6 +1280,7 @@ static void test_precopy_unix_plain(void)
                              NULL, /* finish_hook */
                              false, /* expect_fail */
                              false, /* dst_quit */
+                             1, /* iterations */
                              false /* dirty_ring */);
 }
 
@@ -1283,6 +1290,7 @@ static void test_precopy_unix_dirty_ring(void)
                              NULL, /* finish_hook */
                              false, /* clientReject */
                              false, /* dst_quit */
+                             1, /* iterations */
                              true /* dirty_ring */);
 }
 
@@ -1293,6 +1301,7 @@ static void test_precopy_unix_tls_psk(void)
                              test_migrate_tls_psk_finish,
                              false, /* expect_fail */
                              false, /* dst_quit */
+                             1, /* iterations */
                              false /* dirty_ring */);
 }
 
@@ -1303,6 +1312,7 @@ static void test_precopy_unix_tls_x509_default_host(void)
                              test_migrate_tls_x509_finish,
                              true, /* expect_fail */
                              true, /* dst_quit */
+                             1, /* iterations */
                              false /* dirty_ring */);
 }
 
@@ -1312,6 +1322,7 @@ static void test_precopy_unix_tls_x509_override_host(void)
                              test_migrate_tls_x509_finish,
                              false, /* expect_fail */
                              false, /* dst_quit */
+                             1, /* iterations */
                              false /* dirty_ring */);
 }
 #endif /* CONFIG_TASN1 */
@@ -1354,57 +1365,26 @@ static void test_ignore_shared(void)
 }
 #endif
 
-static void test_xbzrle(const char *uri)
+static void *
+test_migrate_xbzrle_start(QTestState *from,
+                          QTestState *to)
 {
-    MigrateStart *args = migrate_start_new();
-    QTestState *from, *to;
-
-    if (test_migrate_start(&from, &to, uri, args)) {
-        return;
-    }
-
-    /*
-     * We want to pick a speed slow enough that the test completes
-     * quickly, but that it doesn't complete precopy even on a slow
-     * machine, so also set the downtime.
-     */
-    /* 1 ms should make it not converge*/
-    migrate_set_parameter_int(from, "downtime-limit", 1);
-    /* 1GB/s */
-    migrate_set_parameter_int(from, "max-bandwidth", 1000000000);
-
     migrate_set_parameter_int(from, "xbzrle-cache-size", 33554432);
 
     migrate_set_capability(from, "xbzrle", true);
     migrate_set_capability(to, "xbzrle", true);
-    /* Wait for the first serial output from the source */
-    wait_for_serial("src_serial");
 
-    migrate_qmp(from, uri, "{}");
-
-    wait_for_migration_pass(from);
-    /* Make sure we have 2 passes, so the xbzrle cache gets a workout */
-    wait_for_migration_pass(from);
-
-    /* 1000ms should converge */
-    migrate_set_parameter_int(from, "downtime-limit", 1000);
-
-    if (!got_stop) {
-        qtest_qmp_eventwait(from, "STOP");
-    }
-    qtest_qmp_eventwait(to, "RESUME");
-
-    wait_for_serial("dest_serial");
-    wait_for_migration_complete(from);
-
-    test_migrate_end(from, to, true);
+    return NULL;
 }
 
-static void test_xbzrle_unix(void)
+static void test_precopy_unix_xbzrle(void)
 {
-    g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
-
-    test_xbzrle(uri);
+    test_precopy_unix_common(test_migrate_xbzrle_start,
+                             NULL, /* finish_hook */
+                             false, /* expect_fail */
+                             false, /* dst_quit */
+                             2, /* iterations */
+                             false /* dirty_ring */);
 }
 
 static void test_precopy_tcp_common(TestMigrateStartHook start_hook,
@@ -1418,6 +1398,7 @@ static void test_precopy_tcp_common(TestMigrateStartHook start_hook,
                         finish_hook,
                         expect_fail,
                         dst_quit,
+                        1, /* iterations */
                         false /* dirty_ring */);
 }
 
@@ -1572,6 +1553,7 @@ static void test_migrate_fd_proto(void)
                         test_migrate_fd_finish_hook,
                         false, /* expect_fail */
                         false, /* dst_quit */
+                        1, /* iterations */
                         false /* dirty_ring */);
 }
 
@@ -1970,6 +1952,7 @@ int main(int argc, char **argv)
     qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
+    qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbzrle);
 #ifdef CONFIG_GNUTLS
     qtest_add_func("/migration/precopy/unix/tls/psk",
                    test_precopy_unix_tls_psk);
@@ -2006,7 +1989,6 @@ int main(int argc, char **argv)
 #endif /* CONFIG_GNUTLS */
 
     /* qtest_add_func("/migration/ignore_shared", test_ignore_shared); */
-    qtest_add_func("/migration/xbzrle/unix", test_xbzrle_unix);
     qtest_add_func("/migration/fd_proto", test_migrate_fd_proto);
     qtest_add_func("/migration/validate_uuid", test_validate_uuid);
     qtest_add_func("/migration/validate_uuid_error", test_validate_uuid_error);
-- 
2.34.1


