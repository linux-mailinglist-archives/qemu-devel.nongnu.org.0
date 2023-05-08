Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201246FB3BF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 17:28:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw2le-0004Sn-5N; Mon, 08 May 2023 11:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw2lX-0004S1-Aw
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:27:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw2lV-0004Y0-Os
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:27:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683559625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sk8840cRsyBLlJUbP42YuaREGqNT2920nPNsu+n0ets=;
 b=Ck3wkGWfh8Z7dVh2P4hueKrsm48+6jiVwKj/8dzQq1tq2dnRk11aN9dcpMTLq6/NyIK22x
 KogCoqDNwYUsr5apUTJvPTgNXc5dV8LlO1cMJ/bTqmk5QlESKPYso9QAj4Bjo1AomdCtxo
 UXxxV2YCHkqriZUF+e7WvFQJXceiocc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-171-di0GMXIDM56iwgltNw6-0g-1; Mon, 08 May 2023 11:27:03 -0400
X-MC-Unique: di0GMXIDM56iwgltNw6-0g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86FB41C075B3;
 Mon,  8 May 2023 15:27:03 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED7FB40C6F42;
 Mon,  8 May 2023 15:27:01 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>
Subject: [PATCH 02/13] qtest/migration-test.c: Add postcopy tests with
 compress enabled
Date: Mon,  8 May 2023 17:26:46 +0200
Message-Id: <20230508152657.66701-3-quintela@redhat.com>
In-Reply-To: <20230508152657.66701-1-quintela@redhat.com>
References: <20230508152657.66701-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Lukas Straub <lukasstraub2@web.de>

Add postcopy tests with compress enabled to ensure nothing breaks
with the refactoring in the next commits.

preempt+compress is blocked, so no test needed for that case.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/qtest/migration-test.c | 85 +++++++++++++++++++++++-------------
 1 file changed, 55 insertions(+), 30 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index ea0d3fad2a..8a5df84624 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1127,6 +1127,36 @@ test_migrate_tls_x509_finish(QTestState *from,
 #endif /* CONFIG_TASN1 */
 #endif /* CONFIG_GNUTLS */
 
+static void *
+test_migrate_compress_start(QTestState *from,
+                            QTestState *to)
+{
+    migrate_set_parameter_int(from, "compress-level", 1);
+    migrate_set_parameter_int(from, "compress-threads", 4);
+    migrate_set_parameter_bool(from, "compress-wait-thread", true);
+    migrate_set_parameter_int(to, "decompress-threads", 4);
+
+    migrate_set_capability(from, "compress", true);
+    migrate_set_capability(to, "compress", true);
+
+    return NULL;
+}
+
+static void *
+test_migrate_compress_nowait_start(QTestState *from,
+                                   QTestState *to)
+{
+    migrate_set_parameter_int(from, "compress-level", 9);
+    migrate_set_parameter_int(from, "compress-threads", 1);
+    migrate_set_parameter_bool(from, "compress-wait-thread", false);
+    migrate_set_parameter_int(to, "decompress-threads", 1);
+
+    migrate_set_capability(from, "compress", true);
+    migrate_set_capability(to, "compress", true);
+
+    return NULL;
+}
+
 static int migrate_postcopy_prepare(QTestState **from_ptr,
                                     QTestState **to_ptr,
                                     MigrateCommon *args)
@@ -1204,6 +1234,15 @@ static void test_postcopy(void)
     test_postcopy_common(&args);
 }
 
+static void test_postcopy_compress(void)
+{
+    MigrateCommon args = {
+        .start_hook = test_migrate_compress_start
+    };
+
+    test_postcopy_common(&args);
+}
+
 static void test_postcopy_preempt(void)
 {
     MigrateCommon args = {
@@ -1305,6 +1344,15 @@ static void test_postcopy_recovery(void)
     test_postcopy_recovery_common(&args);
 }
 
+static void test_postcopy_recovery_compress(void)
+{
+    MigrateCommon args = {
+        .start_hook = test_migrate_compress_start
+    };
+
+    test_postcopy_recovery_common(&args);
+}
+
 #ifdef CONFIG_GNUTLS
 static void test_postcopy_recovery_tls_psk(void)
 {
@@ -1338,6 +1386,7 @@ static void test_postcopy_preempt_all(void)
 
     test_postcopy_recovery_common(&args);
 }
+
 #endif
 
 static void test_baddest(void)
@@ -1559,21 +1608,6 @@ static void test_precopy_unix_xbzrle(void)
     test_precopy_common(&args);
 }
 
-static void *
-test_migrate_compress_start(QTestState *from,
-                            QTestState *to)
-{
-    migrate_set_parameter_int(from, "compress-level", 1);
-    migrate_set_parameter_int(from, "compress-threads", 4);
-    migrate_set_parameter_bool(from, "compress-wait-thread", true);
-    migrate_set_parameter_int(to, "decompress-threads", 4);
-
-    migrate_set_capability(from, "compress", true);
-    migrate_set_capability(to, "compress", true);
-
-    return NULL;
-}
-
 static void test_precopy_unix_compress(void)
 {
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
@@ -1591,21 +1625,6 @@ static void test_precopy_unix_compress(void)
     test_precopy_common(&args);
 }
 
-static void *
-test_migrate_compress_nowait_start(QTestState *from,
-                                   QTestState *to)
-{
-    migrate_set_parameter_int(from, "compress-level", 9);
-    migrate_set_parameter_int(from, "compress-threads", 1);
-    migrate_set_parameter_bool(from, "compress-wait-thread", false);
-    migrate_set_parameter_int(to, "decompress-threads", 1);
-
-    migrate_set_capability(from, "compress", true);
-    migrate_set_capability(to, "compress", true);
-
-    return NULL;
-}
-
 static void test_precopy_unix_compress_nowait(void)
 {
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
@@ -2631,6 +2650,12 @@ int main(int argc, char **argv)
         qtest_add_func("/migration/postcopy/preempt/plain", test_postcopy_preempt);
         qtest_add_func("/migration/postcopy/preempt/recovery/plain",
                        test_postcopy_preempt_recovery);
+        if (getenv("QEMU_TEST_FLAKY_TESTS")) {
+            qtest_add_func("/migration/postcopy/compress/plain",
+                           test_postcopy_compress);
+            qtest_add_func("/migration/postcopy/recovery/compress/plain",
+                           test_postcopy_recovery_compress);
+        }
     }
 
     qtest_add_func("/migration/bad_dest", test_baddest);
-- 
2.40.0


