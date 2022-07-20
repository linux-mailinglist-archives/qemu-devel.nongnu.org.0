Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEB857B5C1
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 13:45:37 +0200 (CEST)
Received: from localhost ([::1]:51302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE892-0000cD-Q9
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 07:45:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oE7kK-0004nz-Ks
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:20:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oE7kF-0000Cp-RR
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:20:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658315999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y2pstOpyS5q0HGz0C0nPmO9QNrrO+IjEy/Q8DBfc4qg=;
 b=X4Xe79S3QeNvpa8I4PKQxzFiyOtbfW2DzSkL0SK9FQnVB+ewEunIEtuzDMkwV9q6snQupC
 f9qTiUqWypZno9/UCb4KPE/iYKh6s4Zj33Z4pdoX5dE89ZrKjAtBem2trhwWjOXSpMg/Qf
 UrNzAoq5qk4k8JjOuK94DLdUaT9QVoc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-3IEojeZrMCyBNc9-Qq_llA-1; Wed, 20 Jul 2022 07:19:58 -0400
X-MC-Unique: 3IEojeZrMCyBNc9-Qq_llA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFE26801585;
 Wed, 20 Jul 2022 11:19:57 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B76BA2166B26;
 Wed, 20 Jul 2022 11:19:56 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, leobras@redhat.com, quintela@redhat.com,
 berrange@redhat.com, peterx@redhat.com, iii@linux.ibm.com,
 huangy81@chinatelecom.cn
Subject: [PULL 21/30] tests: Add postcopy tls migration test
Date: Wed, 20 Jul 2022 12:19:17 +0100
Message-Id: <20220720111926.107055-22-dgilbert@redhat.com>
In-Reply-To: <20220720111926.107055-1-dgilbert@redhat.com>
References: <20220720111926.107055-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

From: Peter Xu <peterx@redhat.com>

We just added TLS tests for precopy but not postcopy.  Add the
corresponding test for vanilla postcopy.

Rename the vanilla postcopy to "postcopy/plain" because all postcopy tests
will only use unix sockets as channel.

Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20220707185525.27692-1-peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
  dgilbert: Manual merge
---
 tests/qtest/migration-test.c | 61 ++++++++++++++++++++++++++++++------
 1 file changed, 51 insertions(+), 10 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index f3931e0a92..b2020ef6c5 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -573,6 +573,9 @@ typedef struct {
 
     /* Optional: set number of migration passes to wait for */
     unsigned int iterations;
+
+    /* Postcopy specific fields */
+    void *postcopy_data;
 } MigrateCommon;
 
 static int test_migrate_start(QTestState **from, QTestState **to,
@@ -1061,15 +1064,19 @@ test_migrate_tls_x509_finish(QTestState *from,
 
 static int migrate_postcopy_prepare(QTestState **from_ptr,
                                     QTestState **to_ptr,
-                                    MigrateStart *args)
+                                    MigrateCommon *args)
 {
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
     QTestState *from, *to;
 
-    if (test_migrate_start(&from, &to, uri, args)) {
+    if (test_migrate_start(&from, &to, uri, &args->start)) {
         return -1;
     }
 
+    if (args->start_hook) {
+        args->postcopy_data = args->start_hook(from, to);
+    }
+
     migrate_set_capability(from, "postcopy-ram", true);
     migrate_set_capability(to, "postcopy-ram", true);
     migrate_set_capability(to, "postcopy-blocktime", true);
@@ -1089,7 +1096,8 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
     return 0;
 }
 
-static void migrate_postcopy_complete(QTestState *from, QTestState *to)
+static void migrate_postcopy_complete(QTestState *from, QTestState *to,
+                                      MigrateCommon *args)
 {
     wait_for_migration_complete(from);
 
@@ -1100,25 +1108,50 @@ static void migrate_postcopy_complete(QTestState *from, QTestState *to)
         read_blocktime(to);
     }
 
+    if (args->finish_hook) {
+        args->finish_hook(from, to, args->postcopy_data);
+        args->postcopy_data = NULL;
+    }
+
     test_migrate_end(from, to, true);
 }
 
-static void test_postcopy(void)
+static void test_postcopy_common(MigrateCommon *args)
 {
-    MigrateStart args = {};
     QTestState *from, *to;
 
-    if (migrate_postcopy_prepare(&from, &to, &args)) {
+    if (migrate_postcopy_prepare(&from, &to, args)) {
         return;
     }
     migrate_postcopy_start(from, to);
-    migrate_postcopy_complete(from, to);
+    migrate_postcopy_complete(from, to, args);
 }
 
+static void test_postcopy(void)
+{
+    MigrateCommon args = { };
+
+    test_postcopy_common(&args);
+}
+
+#ifdef CONFIG_GNUTLS
+static void test_postcopy_tls_psk(void)
+{
+    MigrateCommon args = {
+        .start_hook = test_migrate_tls_psk_start_match,
+        .finish_hook = test_migrate_tls_psk_finish,
+    };
+
+    test_postcopy_common(&args);
+}
+#endif
+
 static void test_postcopy_recovery(void)
 {
-    MigrateStart args = {
-        .hide_stderr = true,
+    MigrateCommon args = {
+        .start = {
+            .hide_stderr = true,
+        },
     };
     QTestState *from, *to;
     g_autofree char *uri = NULL;
@@ -1174,7 +1207,7 @@ static void test_postcopy_recovery(void)
     /* Restore the postcopy bandwidth to unlimited */
     migrate_set_parameter_int(from, "max-postcopy-bandwidth", 0);
 
-    migrate_postcopy_complete(from, to);
+    migrate_postcopy_complete(from, to, &args);
 }
 
 static void test_baddest(void)
@@ -2378,12 +2411,20 @@ int main(int argc, char **argv)
 
     qtest_add_func("/migration/postcopy/unix", test_postcopy);
     qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
+    qtest_add_func("/migration/postcopy/plain", test_postcopy);
+
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
     qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbzrle);
 #ifdef CONFIG_GNUTLS
     qtest_add_func("/migration/precopy/unix/tls/psk",
                    test_precopy_unix_tls_psk);
+    /*
+     * NOTE: psk test is enough for postcopy, as other types of TLS
+     * channels are tested under precopy.  Here what we want to test is the
+     * general postcopy path that has TLS channel enabled.
+     */
+    qtest_add_func("/migration/postcopy/tls/psk", test_postcopy_tls_psk);
 #ifdef CONFIG_TASN1
     qtest_add_func("/migration/precopy/unix/tls/x509/default-host",
                    test_precopy_unix_tls_x509_default_host);
-- 
2.36.1


