Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BF157B5C0
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 13:45:28 +0200 (CEST)
Received: from localhost ([::1]:51174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE88t-0000WX-Si
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 07:45:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oE7kM-0004qJ-8c
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:20:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oE7kK-0000D7-9e
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:20:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658315999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aKsuB/JNxOOWX3OGmYf+GMg3cVxhKwx2rs3zswmo+aE=;
 b=Gc5oZmvfrd8O+f2EbPYJ3rg24dMvZ+nRXeWSepZlBN2N0rYFS5kYj+Ru9+yo26FMsRBGL8
 2osPl9z3YfGOEYOvrTkl/roMunPGm1j/TP4G0O6Pq9Pvg93lL+pFWUQuFk5h6DLzoE/5TA
 LoD+8mZeiYqVMe2G+gmxrCircGj1mKs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-H0vRWNy0OcmHN2ehOgYJwA-1; Wed, 20 Jul 2022 07:19:56 -0400
X-MC-Unique: H0vRWNy0OcmHN2ehOgYJwA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8553F185A7B2;
 Wed, 20 Jul 2022 11:19:56 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CC3D2166B29;
 Wed, 20 Jul 2022 11:19:55 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, leobras@redhat.com, quintela@redhat.com,
 berrange@redhat.com, peterx@redhat.com, iii@linux.ibm.com,
 huangy81@chinatelecom.cn
Subject: [PULL 20/30] tests: Move MigrateCommon upper
Date: Wed, 20 Jul 2022 12:19:16 +0100
Message-Id: <20220720111926.107055-21-dgilbert@redhat.com>
In-Reply-To: <20220720111926.107055-1-dgilbert@redhat.com>
References: <20220720111926.107055-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

So that it can be used in postcopy tests too soon.

Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20220707185522.27638-1-peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tests/qtest/migration-test.c | 144 +++++++++++++++++------------------
 1 file changed, 72 insertions(+), 72 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index db4dcc5b31..f3931e0a92 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -503,6 +503,78 @@ typedef struct {
     const char *opts_target;
 } MigrateStart;
 
+/*
+ * A hook that runs after the src and dst QEMUs have been
+ * created, but before the migration is started. This can
+ * be used to set migration parameters and capabilities.
+ *
+ * Returns: NULL, or a pointer to opaque state to be
+ *          later passed to the TestMigrateFinishHook
+ */
+typedef void * (*TestMigrateStartHook)(QTestState *from,
+                                       QTestState *to);
+
+/*
+ * A hook that runs after the migration has finished,
+ * regardless of whether it succeeded or failed, but
+ * before QEMU has terminated (unless it self-terminated
+ * due to migration error)
+ *
+ * @opaque is a pointer to state previously returned
+ * by the TestMigrateStartHook if any, or NULL.
+ */
+typedef void (*TestMigrateFinishHook)(QTestState *from,
+                                      QTestState *to,
+                                      void *opaque);
+
+typedef struct {
+    /* Optional: fine tune start parameters */
+    MigrateStart start;
+
+    /* Required: the URI for the dst QEMU to listen on */
+    const char *listen_uri;
+
+    /*
+     * Optional: the URI for the src QEMU to connect to
+     * If NULL, then it will query the dst QEMU for its actual
+     * listening address and use that as the connect address.
+     * This allows for dynamically picking a free TCP port.
+     */
+    const char *connect_uri;
+
+    /* Optional: callback to run at start to set migration parameters */
+    TestMigrateStartHook start_hook;
+    /* Optional: callback to run at finish to cleanup */
+    TestMigrateFinishHook finish_hook;
+
+    /*
+     * Optional: normally we expect the migration process to complete.
+     *
+     * There can be a variety of reasons and stages in which failure
+     * can happen during tests.
+     *
+     * If a failure is expected to happen at time of establishing
+     * the connection, then MIG_TEST_FAIL will indicate that the dst
+     * QEMU is expected to stay running and accept future migration
+     * connections.
+     *
+     * If a failure is expected to happen while processing the
+     * migration stream, then MIG_TEST_FAIL_DEST_QUIT_ERR will indicate
+     * that the dst QEMU is expected to quit with non-zero exit status
+     */
+    enum {
+        /* This test should succeed, the default */
+        MIG_TEST_SUCCEED = 0,
+        /* This test should fail, dest qemu should keep alive */
+        MIG_TEST_FAIL,
+        /* This test should fail, dest qemu should fail with abnormal status */
+        MIG_TEST_FAIL_DEST_QUIT_ERR,
+    } result;
+
+    /* Optional: set number of migration passes to wait for */
+    unsigned int iterations;
+} MigrateCommon;
+
 static int test_migrate_start(QTestState **from, QTestState **to,
                               const char *uri, MigrateStart *args)
 {
@@ -1120,78 +1192,6 @@ static void test_baddest(void)
     test_migrate_end(from, to, false);
 }
 
-/*
- * A hook that runs after the src and dst QEMUs have been
- * created, but before the migration is started. This can
- * be used to set migration parameters and capabilities.
- *
- * Returns: NULL, or a pointer to opaque state to be
- *          later passed to the TestMigrateFinishHook
- */
-typedef void * (*TestMigrateStartHook)(QTestState *from,
-                                       QTestState *to);
-
-/*
- * A hook that runs after the migration has finished,
- * regardless of whether it succeeded or failed, but
- * before QEMU has terminated (unless it self-terminated
- * due to migration error)
- *
- * @opaque is a pointer to state previously returned
- * by the TestMigrateStartHook if any, or NULL.
- */
-typedef void (*TestMigrateFinishHook)(QTestState *from,
-                                      QTestState *to,
-                                      void *opaque);
-
-typedef struct {
-    /* Optional: fine tune start parameters */
-    MigrateStart start;
-
-    /* Required: the URI for the dst QEMU to listen on */
-    const char *listen_uri;
-
-    /*
-     * Optional: the URI for the src QEMU to connect to
-     * If NULL, then it will query the dst QEMU for its actual
-     * listening address and use that as the connect address.
-     * This allows for dynamically picking a free TCP port.
-     */
-    const char *connect_uri;
-
-    /* Optional: callback to run at start to set migration parameters */
-    TestMigrateStartHook start_hook;
-    /* Optional: callback to run at finish to cleanup */
-    TestMigrateFinishHook finish_hook;
-
-    /*
-     * Optional: normally we expect the migration process to complete.
-     *
-     * There can be a variety of reasons and stages in which failure
-     * can happen during tests.
-     *
-     * If a failure is expected to happen at time of establishing
-     * the connection, then MIG_TEST_FAIL will indicate that the dst
-     * QEMU is expected to stay running and accept future migration
-     * connections.
-     *
-     * If a failure is expected to happen while processing the
-     * migration stream, then MIG_TEST_FAIL_DEST_QUIT_ERR will indicate
-     * that the dst QEMU is expected to quit with non-zero exit status
-     */
-    enum {
-        /* This test should succeed, the default */
-        MIG_TEST_SUCCEED = 0,
-        /* This test should fail, dest qemu should keep alive */
-        MIG_TEST_FAIL,
-        /* This test should fail, dest qemu should fail with abnormal status */
-        MIG_TEST_FAIL_DEST_QUIT_ERR,
-    } result;
-
-    /* Optional: set number of migration passes to wait for */
-    unsigned int iterations;
-} MigrateCommon;
-
 static void test_precopy_common(MigrateCommon *args)
 {
     QTestState *from, *to;
-- 
2.36.1


