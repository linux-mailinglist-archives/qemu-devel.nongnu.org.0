Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C79844CACF7
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:07:50 +0100 (CET)
Received: from localhost ([::1]:53594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTO9-00047N-Se
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:07:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPT8i-0000gT-9w
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:51:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPT8g-00018Q-Jz
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:51:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646243509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+jkcmz3cyufu2+xCWvAltsycGM41zrPK5y7iuNUmPGw=;
 b=A5BR2YXV955PH0yff3eIL2qPUWTdm2cdBT7uWlo78g9b1iB6rrlasNIb2gY4PSud3xuSEe
 fc8LYR+k9VXkYlPT0mV0R52UPOKOX3c2va8NUeAOQ5ylLyaU4Jhv4QoOjJT+KokX8NZr08
 wpiO4rJ/5KR94w3HgWC4vcSSxdmsSEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-67cZUztBP_Cz_LKfmn6MGg-1; Wed, 02 Mar 2022 12:51:48 -0500
X-MC-Unique: 67cZUztBP_Cz_LKfmn6MGg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA686824FA6
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 17:51:47 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1363D80019;
 Wed,  2 Mar 2022 17:51:44 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/18] tests: add multifd migration tests of TLS with x509
 credentials
Date: Wed,  2 Mar 2022 17:49:31 +0000
Message-Id: <20220302174932.2692378-18-berrange@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
and failure scenarios when using TLS with x509 certificates. There
are quite a few different scenarios that matter in relation to
hostname validation, but we skip a couple as we can assume that
the non-multifd coverage applies to some extent.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/migration-test.c | 135 ++++++++++++++++++++++++++++++++---
 1 file changed, 126 insertions(+), 9 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 506c6996e0..95ae843e1b 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1795,20 +1795,21 @@ static void test_multifd_tcp_zstd(void)
 #ifdef CONFIG_GNUTLS
 static void test_multifd_tcp_tls_common(TestMigrateStartHook start_hook,
                                         TestMigrateFinishHook finish_hook,
-                                        bool expect_fail)
+                                        bool expect_fail,
+                                        bool dst_quit)
 {
     test_precopy_common("defer",
                         NULL, /* connect_uri */
                         start_hook,
                         finish_hook,
                         expect_fail,
-                        false, /* dst_quit */
+                        dst_quit,
                         1, /* iterations */
                         false /* dirty_ring */);
 }
 
 static void *
-test_migrate_multifd_tcp_tls_psk_start_match(QTestState *from,
+test_migrate_multifd_tls_psk_start_match(QTestState *from,
                                              QTestState *to)
 {
     test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
@@ -1816,27 +1817,131 @@ test_migrate_multifd_tcp_tls_psk_start_match(QTestState *from,
 }
 
 static void *
-test_migrate_multifd_tcp_tls_psk_start_mismatch(QTestState *from,
+test_migrate_multifd_tls_psk_start_mismatch(QTestState *from,
                                                 QTestState *to)
 {
     test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
     return test_migrate_tls_psk_start_mismatch(from, to);
 }
 
+#ifdef CONFIG_TASN1
+static void *
+test_migrate_multifd_tls_x509_start_default_host(QTestState *from,
+                                                 QTestState *to)
+{
+    test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
+    return test_migrate_tls_x509_start_default_host(from, to);
+}
+
+static void *
+test_migrate_multifd_tls_x509_start_override_host(QTestState *from,
+                                                  QTestState *to)
+{
+    test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
+    return test_migrate_tls_x509_start_override_host(from, to);
+}
+
+static void *
+test_migrate_multifd_tls_x509_start_mismatch_host(QTestState *from,
+                                                  QTestState *to)
+{
+    test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
+    return test_migrate_tls_x509_start_mismatch_host(from, to);
+}
+
+static void *
+test_migrate_multifd_tls_x509_start_allow_anonymous_client(QTestState *from,
+                                                           QTestState *to)
+{
+    test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
+    return test_migrate_tls_x509_start_allow_anonymous_client(from, to);
+}
+
+static void *
+test_migrate_multifd_tls_x509_start_reject_anonymous_client(QTestState *from,
+                                                            QTestState *to)
+{
+    test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
+    return test_migrate_tls_x509_start_reject_anonymous_client(from, to);
+}
+#endif /* CONFIG_TASN1 */
+
 static void test_multifd_tcp_tls_psk_match(void)
 {
-    test_multifd_tcp_tls_common(test_migrate_multifd_tcp_tls_psk_start_match,
+    test_multifd_tcp_tls_common(test_migrate_multifd_tls_psk_start_match,
                                 test_migrate_tls_psk_finish,
-                                false /* expect_fail */);
+                                false, /* expect_fail */
+                                false /* dst_quit */);
 }
 
 static void test_multifd_tcp_tls_psk_mismatch(void)
 {
-    test_multifd_tcp_tls_common(test_migrate_multifd_tcp_tls_psk_start_mismatch,
+    test_multifd_tcp_tls_common(test_migrate_multifd_tls_psk_start_mismatch,
                                 test_migrate_tls_psk_finish,
-                                true /* expect_fail */);
+                                true, /* expect_fail */
+                                false /* dst_quit */);
 }
-#endif
+
+#ifdef CONFIG_TASN1
+static void test_multifd_tcp_tls_x509_default_host(void)
+{
+    test_multifd_tcp_tls_common(
+        test_migrate_multifd_tls_x509_start_default_host,
+        test_migrate_tls_x509_finish,
+        false, /* expect_fail */
+        false /* dst_quit */);
+}
+
+static void test_multifd_tcp_tls_x509_override_host(void)
+{
+    test_multifd_tcp_tls_common(
+        test_migrate_multifd_tls_x509_start_override_host,
+        test_migrate_tls_x509_finish,
+        false, /* expect_fail */
+        false /* dst_quit */);
+}
+
+static void test_multifd_tcp_tls_x509_mismatch_host(void)
+{
+    /*
+     * This has different behaviour to the non-multifd case.
+     *
+     * In non-multifd case when client aborts due to mismatched
+     * cert host, the server has already started trying to load
+     * migration state, and so it exits with I/O  failure.
+     *
+     * In multifd case when client aborts due to mismatched
+     * cert host, the server is still waiting for the other
+     * multifd connections to arrive so hasn't started trying
+     * to load migration state, and thus just aborts the migration
+     * without exiting
+     */
+    test_multifd_tcp_tls_common(
+        test_migrate_multifd_tls_x509_start_mismatch_host,
+        test_migrate_tls_x509_finish,
+        true, /* expect_fail */
+        false /* dst_quit */);
+}
+
+static void test_multifd_tcp_tls_x509_allow_anonymous_client(void)
+{
+    test_multifd_tcp_tls_common(
+        test_migrate_multifd_tls_x509_start_allow_anonymous_client,
+        test_migrate_tls_x509_finish,
+        false, /* expect_fail */
+        false /* dst_quit */);
+}
+
+static void test_multifd_tcp_tls_x509_reject_anonymous_client(void)
+{
+    test_multifd_tcp_tls_common(
+        test_migrate_multifd_tls_x509_start_reject_anonymous_client,
+        test_migrate_tls_x509_finish,
+        true, /* expect_fail */
+        false /* dst_quit */);
+}
+#endif /* CONFIG_TASN1 */
+#endif /* CONFIHG_GNUTLS */
 
 /*
  * This test does:
@@ -2062,6 +2167,18 @@ int main(int argc, char **argv)
                    test_multifd_tcp_tls_psk_match);
     qtest_add_func("/migration/multifd/tcp/tls/psk/mismatch",
                    test_multifd_tcp_tls_psk_mismatch);
+#ifdef CONFIG_TASN1
+    qtest_add_func("/migration/multifd/tcp/tls/x509/default-host",
+                   test_multifd_tcp_tls_x509_default_host);
+    qtest_add_func("/migration/multifd/tcp/tls/x509/override-host",
+                   test_multifd_tcp_tls_x509_override_host);
+    qtest_add_func("/migration/multifd/tcp/tls/x509/mismatch-host",
+                   test_multifd_tcp_tls_x509_mismatch_host);
+    qtest_add_func("/migration/multifd/tcp/tls/x509/allow-anonymous-client",
+                   test_multifd_tcp_tls_x509_allow_anonymous_client);
+    qtest_add_func("/migration/multifd/tcp/tls/x509/reject-anonymous-client",
+                   test_multifd_tcp_tls_x509_reject_anonymous_client);
+#endif /* CONFIG_TASN1 */
 #endif /* CONFIG_GNUTLS */
 
     if (kvm_dirty_ring_supported()) {
-- 
2.34.1


