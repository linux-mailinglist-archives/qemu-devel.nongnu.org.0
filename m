Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1320A521012
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 10:53:28 +0200 (CEST)
Received: from localhost ([::1]:40374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noLcV-0003sg-3S
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 04:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1noLJr-00069c-Cx
 for qemu-devel@nongnu.org; Tue, 10 May 2022 04:34:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1noLJp-0000Od-7h
 for qemu-devel@nongnu.org; Tue, 10 May 2022 04:34:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652171648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=21VgUC9phFhW+1/H04lLCjbhofsHMJxKSQ2BDHGGwg8=;
 b=AvEKslYy0L18jYQMjY16AdMbqaHsbvwD0qowuo2HjKUbI2e65ml9gM1mVouiWXyxVb+Dwd
 mUmlEDIfuQgLFJ7xy7XBwSHJpEjbigeYI0JU9a4TCw+E75RrSc5gKwL2794heQhXvVeMch
 5QlO9olNXcf44MeaVS9VPRj4AINXkrc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-lXosDzASMNOekE9n7TQcOA-1; Tue, 10 May 2022 04:34:07 -0400
X-MC-Unique: lXosDzASMNOekE9n7TQcOA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42F71801E80
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 08:34:07 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53186403171;
 Tue, 10 May 2022 08:34:06 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com,
 leobras@redhat.com, berrange@redhat.com
Subject: [PULL 05/16] tests: convert XBZRLE migration test to use common helper
Date: Tue, 10 May 2022 09:33:44 +0100
Message-Id: <20220510083355.92738-6-dgilbert@redhat.com>
In-Reply-To: <20220510083355.92738-1-dgilbert@redhat.com>
References: <20220510083355.92738-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

From: Daniel P. Berrangé <berrange@redhat.com>

Most of the XBZRLE migration test logic is common with the rest of the
precopy tests, so it can use the helper with just one small tweak.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220426160048.812266-6-berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tests/qtest/migration-test.c | 67 ++++++++++++++----------------------
 1 file changed, 25 insertions(+), 42 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 5a3edf2da6..a1dc08a93e 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1174,6 +1174,9 @@ typedef struct {
         /* This test should fail, dest qemu should fail with abnormal status */
         MIG_TEST_FAIL_DEST_QUIT_ERR,
     } result;
+
+    /* Optional: set number of migration passes to wait for */
+    unsigned int iterations;
 } MigrateCommon;
 
 static void test_precopy_common(MigrateCommon *args)
@@ -1219,7 +1222,13 @@ static void test_precopy_common(MigrateCommon *args)
             qtest_set_expected_status(to, 1);
         }
     } else {
-        wait_for_migration_pass(from);
+        if (args->iterations) {
+            while (args->iterations--) {
+                wait_for_migration_pass(from);
+            }
+        } else {
+            wait_for_migration_pass(from);
+        }
 
         migrate_set_parameter_int(from, "downtime-limit", CONVERGE_DOWNTIME);
 
@@ -1350,57 +1359,31 @@ static void test_ignore_shared(void)
 }
 #endif
 
-static void test_xbzrle(const char *uri)
+static void *
+test_migrate_xbzrle_start(QTestState *from,
+                          QTestState *to)
 {
-    MigrateStart args = {};
-    QTestState *from, *to;
-
-    if (test_migrate_start(&from, &to, uri, &args)) {
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
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
+    MigrateCommon args = {
+        .connect_uri = uri,
+        .listen_uri = uri,
+
+        .start_hook = test_migrate_xbzrle_start,
 
-    test_xbzrle(uri);
+        .iterations = 2,
+    };
+
+    test_precopy_common(&args);
 }
 
 static void test_precopy_tcp_plain(void)
@@ -1994,6 +1977,7 @@ int main(int argc, char **argv)
     qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
+    qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbzrle);
 #ifdef CONFIG_GNUTLS
     qtest_add_func("/migration/precopy/unix/tls/psk",
                    test_precopy_unix_tls_psk);
@@ -2030,7 +2014,6 @@ int main(int argc, char **argv)
 #endif /* CONFIG_GNUTLS */
 
     /* qtest_add_func("/migration/ignore_shared", test_ignore_shared); */
-    qtest_add_func("/migration/xbzrle/unix", test_xbzrle_unix);
     qtest_add_func("/migration/fd_proto", test_migrate_fd_proto);
     qtest_add_func("/migration/validate_uuid", test_validate_uuid);
     qtest_add_func("/migration/validate_uuid_error", test_validate_uuid_error);
-- 
2.36.0


