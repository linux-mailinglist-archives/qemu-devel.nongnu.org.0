Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0494D508F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:32:55 +0100 (CET)
Received: from localhost ([::1]:51766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSMek-0004qH-Lt
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:32:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMSE-0003TV-To
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:19:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMSC-0003hA-Sc
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:19:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646932794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sq118AKNqnoaCPQmAUKU75Jc2YRrn/h61BVIbyHU60Y=;
 b=Q3NEtk4cWi9VjPcE0RWJzA54IdRyM0QuqZJ0ujSVsra3VWzRakT2R/YVRB2MFmQn+wj01E
 N6zpwS0Mz+WSl+JVEqF5qE++tu1qZBtbfnX3onGNKfDgPtmMC5wop5l6TzZq9TOaz5dW3u
 ri6KNZTBb1Iiwy/I07LL2NTjFsaExYM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-l384SRIRPeKGXWzD9ZvVfg-1; Thu, 10 Mar 2022 12:19:52 -0500
X-MC-Unique: l384SRIRPeKGXWzD9ZvVfg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D73A51DF
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 17:19:52 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF0E9106D5DC;
 Thu, 10 Mar 2022 17:19:48 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/18] tests: add multifd migration tests of TLS with PSK
 credentials
Date: Thu, 10 Mar 2022 17:18:19 +0000
Message-Id: <20220310171821.3724080-17-berrange@redhat.com>
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
and failure scenarios when using TLS with pre shared keys.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/migration-test.c | 60 +++++++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index c1b0b3aca4..f47e4797e2 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1815,6 +1815,48 @@ static void test_multifd_tcp_zstd(void)
 }
 #endif
 
+#ifdef CONFIG_GNUTLS
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
+    MigrateCommon args = {
+        .listen_uri = "defer",
+        .start_hook = test_migrate_multifd_tcp_tls_psk_start_match,
+        .finish_hook = test_migrate_tls_psk_finish,
+    };
+    test_precopy_common(&args);
+}
+
+static void test_multifd_tcp_tls_psk_mismatch(void)
+{
+    MigrateCommon args = {
+        .start = {
+            .hide_stderr = true,
+        },
+        .listen_uri = "defer",
+        .start_hook = test_migrate_multifd_tcp_tls_psk_start_mismatch,
+        .finish_hook = test_migrate_tls_psk_finish,
+        .result = MIG_TEST_FAIL,
+    };
+    test_precopy_common(&args);
+}
+#endif /* CONFIG_GNUTLS */
+
 /*
  * This test does:
  *  source               target
@@ -2025,12 +2067,22 @@ int main(int argc, char **argv)
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


