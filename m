Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1314D5078
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:28:59 +0100 (CET)
Received: from localhost ([::1]:39528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSMaw-0004Qw-Tr
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:28:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMSI-0003cG-6H
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:20:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMSG-0003ht-DQ
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:20:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646932799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AS7t/Zz7vy9dwvTrxrWTYpOdA/K30+nNEz+PqOgM9X4=;
 b=CxnzIacIThu1jK7t4iwUs7flWC+8GEUz/5R7BSpWMKhSpMijOzJ2KGW3UY3sWar0FPySIR
 xPuJyJ1U7di3GhMC7xBDjXcBCiDmQVv/lJOHAG/3kKuIUUnqUyD7YzX+YH8Wf3bppbBqJK
 TX5PKu7E6qIoEM60FoFKKQlakRAhWjM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-kEZIGujwOoSm11H3TNmlUQ-1; Thu, 10 Mar 2022 12:19:56 -0500
X-MC-Unique: kEZIGujwOoSm11H3TNmlUQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C13028DCC40
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 17:19:55 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EF00106D5DC;
 Thu, 10 Mar 2022 17:19:53 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/18] tests: add multifd migration tests of TLS with x509
 credentials
Date: Thu, 10 Mar 2022 17:18:20 +0000
Message-Id: <20220310171821.3724080-18-berrange@redhat.com>
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

This validates that we correctly handle multifd migration success
and failure scenarios when using TLS with x509 certificates. There
are quite a few different scenarios that matter in relation to
hostname validation, but we skip a couple as we can assume that
the non-multifd coverage applies to some extent.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/migration-test.c | 127 +++++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index f47e4797e2..5ea0b9360a 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1832,6 +1832,48 @@ test_migrate_multifd_tcp_tls_psk_start_mismatch(QTestState *from,
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
+test_migrate_multifd_tls_x509_start_allow_anon_client(QTestState *from,
+                                                      QTestState *to)
+{
+    test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
+    return test_migrate_tls_x509_start_allow_anon_client(from, to);
+}
+
+static void *
+test_migrate_multifd_tls_x509_start_reject_anon_client(QTestState *from,
+                                                       QTestState *to)
+{
+    test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
+    return test_migrate_tls_x509_start_reject_anon_client(from, to);
+}
+#endif /* CONFIG_TASN1 */
+
 static void test_multifd_tcp_tls_psk_match(void)
 {
     MigrateCommon args = {
@@ -1855,6 +1897,79 @@ static void test_multifd_tcp_tls_psk_mismatch(void)
     };
     test_precopy_common(&args);
 }
+
+#ifdef CONFIG_TASN1
+static void test_multifd_tcp_tls_x509_default_host(void)
+{
+    MigrateCommon args = {
+        .listen_uri = "defer",
+        .start_hook = test_migrate_multifd_tls_x509_start_default_host,
+        .finish_hook = test_migrate_tls_x509_finish,
+    };
+    test_precopy_common(&args);
+}
+
+static void test_multifd_tcp_tls_x509_override_host(void)
+{
+    MigrateCommon args = {
+        .listen_uri = "defer",
+        .start_hook = test_migrate_multifd_tls_x509_start_override_host,
+        .finish_hook = test_migrate_tls_x509_finish,
+    };
+    test_precopy_common(&args);
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
+    MigrateCommon args = {
+        .start = {
+            .hide_stderr = true,
+        },
+        .listen_uri = "defer",
+        .start_hook = test_migrate_multifd_tls_x509_start_mismatch_host,
+        .finish_hook = test_migrate_tls_x509_finish,
+        .result = MIG_TEST_FAIL,
+    };
+    test_precopy_common(&args);
+}
+
+static void test_multifd_tcp_tls_x509_allow_anon_client(void)
+{
+    MigrateCommon args = {
+        .listen_uri = "defer",
+        .start_hook = test_migrate_multifd_tls_x509_start_allow_anon_client,
+        .finish_hook = test_migrate_tls_x509_finish,
+    };
+    test_precopy_common(&args);
+}
+
+static void test_multifd_tcp_tls_x509_reject_anon_client(void)
+{
+    MigrateCommon args = {
+        .start = {
+            .hide_stderr = true,
+        },
+        .listen_uri = "defer",
+        .start_hook = test_migrate_multifd_tls_x509_start_reject_anon_client,
+        .finish_hook = test_migrate_tls_x509_finish,
+        .result = MIG_TEST_FAIL,
+    };
+    test_precopy_common(&args);
+}
+#endif /* CONFIG_TASN1 */
 #endif /* CONFIG_GNUTLS */
 
 /*
@@ -2082,6 +2197,18 @@ int main(int argc, char **argv)
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
+    qtest_add_func("/migration/multifd/tcp/tls/x509/allow-anon-client",
+                   test_multifd_tcp_tls_x509_allow_anon_client);
+    qtest_add_func("/migration/multifd/tcp/tls/x509/reject-anon-client",
+                   test_multifd_tcp_tls_x509_reject_anon_client);
+#endif /* CONFIG_TASN1 */
 #endif /* CONFIG_GNUTLS */
 
     if (kvm_dirty_ring_supported()) {
-- 
2.34.1


