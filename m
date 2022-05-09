Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBBC5200D6
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 17:14:18 +0200 (CEST)
Received: from localhost ([::1]:41778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no55V-0007L8-PQ
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 11:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1no4un-00014C-0g
 for qemu-devel@nongnu.org; Mon, 09 May 2022 11:03:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1no4uk-0002lY-38
 for qemu-devel@nongnu.org; Mon, 09 May 2022 11:03:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652108589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bj9y8CO34CR3RZBg01/lwl8mx2a5a2clvh7Ns6S52f8=;
 b=aGoCNOIrVaOnsxUfrMtNpcNYCg1X/7Pf31wE3hABTwnhIKCym5ZM4uuHF0FJbE+ByUEJRU
 g5+QWQO2LOL6p5vqzRQlzPxYtB6MwYONYe3QwRfXf6lPMwHA7A24GhfGwDSzQyfki30F3V
 CS85wRp93S5onGPsTRlut489Ubcfu+Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-UBXPBRHJMBudaWMhwClsZg-1; Mon, 09 May 2022 11:03:08 -0400
X-MC-Unique: UBXPBRHJMBudaWMhwClsZg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF21F80B91A
 for <qemu-devel@nongnu.org>; Mon,  9 May 2022 15:03:07 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.193.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0D40C28100;
 Mon,  9 May 2022 15:03:06 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com,
 leobras@redhat.com, berrange@redhat.com
Subject: [PULL 07/16] tests: add multifd migration tests of TLS with PSK
 credentials
Date: Mon,  9 May 2022 16:02:44 +0100
Message-Id: <20220509150253.218715-8-dgilbert@redhat.com>
In-Reply-To: <20220509150253.218715-1-dgilbert@redhat.com>
References: <20220509150253.218715-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

This validates that we correctly handle multifd migration success
and failure scenarios when using TLS with pre shared keys.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220426160048.812266-8-berrange@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tests/qtest/migration-test.c | 60 +++++++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index f551c8d030..133665b500 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1816,6 +1816,48 @@ static void test_multifd_tcp_zstd(void)
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
@@ -2026,12 +2068,22 @@ int main(int argc, char **argv)
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
2.36.0


