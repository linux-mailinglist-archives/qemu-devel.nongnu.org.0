Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1026D5102F2
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:13:18 +0200 (CEST)
Received: from localhost ([::1]:42862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njNoS-0000Vn-SQ
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njNcn-00041L-PO
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:01:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njNce-0007Qg-EB
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:01:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650988862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kSSj3+MpvOD5KvDsmk6yAcbQURn96dMy+WcXfNkv0x4=;
 b=HhGLaWyIWgwA5HhgTc4x6XSE+JeG2yOPfjyYYy31sAeWZFZiwBXOIcSiLOwedCzRtNPM/W
 EW/FlILgk5lojXeS5nh1VVJSltd74cLlZ2cie62RHGF5LGuHauZjAWSEJs1l+qM6H6uvIr
 ra2R8qSy7+XAvnrroxfi71CES/I8eco=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-f-AUUgzWNmaBaQipkLHWxQ-1; Tue, 26 Apr 2022 12:01:01 -0400
X-MC-Unique: f-AUUgzWNmaBaQipkLHWxQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC5351E1AE4C
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 16:01:00 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C26CC202C8;
 Tue, 26 Apr 2022 16:00:59 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/9] tests: add multifd migration tests of TLS with PSK
 credentials
Date: Tue, 26 Apr 2022 17:00:46 +0100
Message-Id: <20220426160048.812266-8-berrange@redhat.com>
In-Reply-To: <20220426160048.812266-1-berrange@redhat.com>
References: <20220426160048.812266-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
2.35.1


