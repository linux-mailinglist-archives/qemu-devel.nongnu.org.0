Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17884CACDF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:03:29 +0100 (CET)
Received: from localhost ([::1]:42110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTJw-0004Pk-SN
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:03:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPT8g-0000fa-NX
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:51:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPT8f-00017N-4L
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:51:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646243508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1PD6iur7JlTnLW5DNO2YlWsDiOaLEQJa+ikoPJ5LJB8=;
 b=UGRaYKKE4YPZUXJDBbXv7dCeSA8lQ6T7pN4pohLaq9uuYmNFmip52a86kYVcAYiMzM7XQz
 Onf8Tf0yKrD/hN3u8MErrLXcZv+wmkxGjPLc5CT0mxN0hfkbTvRtTENnzM67piGC2jI71D
 u+LpDXFVPml3vEfRNFxlgsrMxgouLQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-SWzqt4AdNneRzkLX2Zn7sA-1; Wed, 02 Mar 2022 12:51:45 -0500
X-MC-Unique: SWzqt4AdNneRzkLX2Zn7sA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E11951DF
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 17:51:44 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F37E38000B;
 Wed,  2 Mar 2022 17:51:41 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/18] tests: add multifd migration tests of TLS with PSK
 credentials
Date: Wed,  2 Mar 2022 17:49:30 +0000
Message-Id: <20220302174932.2692378-17-berrange@redhat.com>
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

This validates that we correctly handle multifd migration success
and failure scenarios when using TLS with pre shared keys.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/migration-test.c | 94 ++++++++++++++++++++++++++++--------
 1 file changed, 75 insertions(+), 19 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 7c69268aa8..506c6996e0 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1717,9 +1717,9 @@ static void test_migrate_auto_converge(void)
 }
 
 static void *
-test_migration_precopy_tcp_multifd_start_common(QTestState *from,
-                                                QTestState *to,
-                                                const char *method)
+test_migrate_precopy_tcp_multifd_start_common(QTestState *from,
+                                              QTestState *to,
+                                              const char *method)
 {
     QDict *rsp;
 
@@ -1741,25 +1741,25 @@ test_migration_precopy_tcp_multifd_start_common(QTestState *from,
 }
 
 static void *
-test_migration_precopy_tcp_multifd_start(QTestState *from,
-                                         QTestState *to)
+test_migrate_precopy_tcp_multifd_start(QTestState *from,
+                                       QTestState *to)
 {
-    return test_migration_precopy_tcp_multifd_start_common(from, to, "none");
+    return test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
 }
 
 static void *
-test_migration_precopy_tcp_multifd_zlib_start(QTestState *from,
-                                              QTestState *to)
+test_migrate_precopy_tcp_multifd_zlib_start(QTestState *from,
+                                            QTestState *to)
 {
-    return test_migration_precopy_tcp_multifd_start_common(from, to, "zlib");
+    return test_migrate_precopy_tcp_multifd_start_common(from, to, "zlib");
 }
 
 #ifdef CONFIG_ZSTD
 static void *
-test_migration_precopy_tcp_multifd_zstd_start(QTestState *from,
-                                              QTestState *to)
+test_migrate_precopy_tcp_multifd_zstd_start(QTestState *from,
+                                            QTestState *to)
 {
-    return test_migration_precopy_tcp_multifd_start_common(from, to, "zstd");
+    return test_migrate_precopy_tcp_multifd_start_common(from, to, "zstd");
 }
 #endif /* CONFIG_ZSTD */
 
@@ -1777,18 +1777,64 @@ static void test_multifd_tcp_common(TestMigrateStartHook start_hook)
 
 static void test_multifd_tcp_none(void)
 {
-    test_multifd_tcp_common(test_migration_precopy_tcp_multifd_start);
+    test_multifd_tcp_common(test_migrate_precopy_tcp_multifd_start);
 }
 
 static void test_multifd_tcp_zlib(void)
 {
-    test_multifd_tcp_common(test_migration_precopy_tcp_multifd_zlib_start);
+    test_multifd_tcp_common(test_migrate_precopy_tcp_multifd_zlib_start);
 }
 
 #ifdef CONFIG_ZSTD
 static void test_multifd_tcp_zstd(void)
 {
-    test_multifd_tcp_common(test_migration_precopy_tcp_multifd_zstd_start);
+    test_multifd_tcp_common(test_migrate_precopy_tcp_multifd_zstd_start);
+}
+#endif
+
+#ifdef CONFIG_GNUTLS
+static void test_multifd_tcp_tls_common(TestMigrateStartHook start_hook,
+                                        TestMigrateFinishHook finish_hook,
+                                        bool expect_fail)
+{
+    test_precopy_common("defer",
+                        NULL, /* connect_uri */
+                        start_hook,
+                        finish_hook,
+                        expect_fail,
+                        false, /* dst_quit */
+                        1, /* iterations */
+                        false /* dirty_ring */);
+}
+
+static void *
+test_migrate_multifd_tcp_tls_psk_start_match(QTestState *from,
+                                             QTestState *to)
+{
+    test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
+    return test_migrate_tls_psk_start_match(from, to);
+}
+
+static void *
+test_migrate_multifd_tcp_tls_psk_start_mismatch(QTestState *from,
+                                                QTestState *to)
+{
+    test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
+    return test_migrate_tls_psk_start_mismatch(from, to);
+}
+
+static void test_multifd_tcp_tls_psk_match(void)
+{
+    test_multifd_tcp_tls_common(test_migrate_multifd_tcp_tls_psk_start_match,
+                                test_migrate_tls_psk_finish,
+                                false /* expect_fail */);
+}
+
+static void test_multifd_tcp_tls_psk_mismatch(void)
+{
+    test_multifd_tcp_tls_common(test_migrate_multifd_tcp_tls_psk_start_mismatch,
+                                test_migrate_tls_psk_finish,
+                                true /* expect_fail */);
 }
 #endif
 
@@ -2001,12 +2047,22 @@ int main(int argc, char **argv)
                    test_validate_uuid_dst_not_set);
 
     qtest_add_func("/migration/auto_converge", test_migrate_auto_converge);
-    qtest_add_func("/migration/multifd/tcp/none", test_multifd_tcp_none);
-    qtest_add_func("/migration/multifd/tcp/cancel", test_multifd_tcp_cancel);
-    qtest_add_func("/migration/multifd/tcp/zlib", test_multifd_tcp_zlib);
+    qtest_add_func("/migration/multifd/tcp/plain/none",
+                   test_multifd_tcp_none);
+    qtest_add_func("/migration/multifd/tcp/plain/cancel",
+                   test_multifd_tcp_cancel);
+    qtest_add_func("/migration/multifd/tcp/plain/zlib",
+                   test_multifd_tcp_zlib);
 #ifdef CONFIG_ZSTD
-    qtest_add_func("/migration/multifd/tcp/zstd", test_multifd_tcp_zstd);
+    qtest_add_func("/migration/multifd/tcp/plain/zstd",
+                   test_multifd_tcp_zstd);
 #endif
+#ifdef CONFIG_GNUTLS
+    qtest_add_func("/migration/multifd/tcp/tls/psk/match",
+                   test_multifd_tcp_tls_psk_match);
+    qtest_add_func("/migration/multifd/tcp/tls/psk/mismatch",
+                   test_multifd_tcp_tls_psk_mismatch);
+#endif /* CONFIG_GNUTLS */
 
     if (kvm_dirty_ring_supported()) {
         qtest_add_func("/migration/dirty_ring",
-- 
2.34.1


