Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C09A750A884
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 20:54:02 +0200 (CEST)
Received: from localhost ([::1]:36190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhbwH-0006kD-Sn
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 14:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhbjt-0001eV-3H
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:41:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhbjq-0005zW-RO
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:41:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650566470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vtDZHV/9as3nKwr1dLZppHup5qfkwMfGr6pqHzzkvqI=;
 b=imKNaDXiho6DZ+xZL1qtiFClsC2NFsIiHkmPCex3KWYIJH3hztYbPtngIy5Ot0+l8eJqln
 RTcI/w9V2D/6fQbwjTAxVUNP2uoG/hbMeNO7VPVgatDSvEH0VVQrTe6dDI747GOsFDpLOm
 mrivMnu3vK7qPacSPWoxfsC4UM0JmXk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-gOy89NIbPCyPQcY1WKD3iQ-1; Thu, 21 Apr 2022 14:41:08 -0400
X-MC-Unique: gOy89NIbPCyPQcY1WKD3iQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D186101AA42
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 18:41:08 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A61F540E80F5;
 Thu, 21 Apr 2022 18:41:07 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	peterx@redhat.com,
	berrange@redhat.com
Subject: [PULL 09/18] tests: expand the migration precopy helper to support
 failures
Date: Thu, 21 Apr 2022 19:40:43 +0100
Message-Id: <20220421184052.306581-10-dgilbert@redhat.com>
In-Reply-To: <20220421184052.306581-1-dgilbert@redhat.com>
References: <20220421184052.306581-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The migration precopy testing helper function always expects the
migration to run to a completion state. There will be test scenarios
for TLS where expect either the client or server to fail the migration.
This expands the helper to cope with these scenarios.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220310171821.3724080-12-berrange@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tests/qtest/migration-test.c | 51 +++++++++++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 9 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 04f749aaa1..2af36c16a3 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -821,6 +821,30 @@ typedef struct {
     TestMigrateStartHook start_hook;
     /* Optional: callback to run at finish to cleanup */
     TestMigrateFinishHook finish_hook;
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
 } MigrateCommon;
 
 static void test_precopy_common(MigrateCommon *args)
@@ -858,24 +882,33 @@ static void test_precopy_common(MigrateCommon *args)
     }
 
 
-    wait_for_migration_pass(from);
+    if (args->result != MIG_TEST_SUCCEED) {
+        bool allow_active = args->result == MIG_TEST_FAIL;
+        wait_for_migration_fail(from, allow_active);
 
-    migrate_set_parameter_int(from, "downtime-limit", CONVERGE_DOWNTIME);
+        if (args->result == MIG_TEST_FAIL_DEST_QUIT_ERR) {
+            qtest_set_expected_status(to, 1);
+        }
+    } else {
+        wait_for_migration_pass(from);
 
-    if (!got_stop) {
-        qtest_qmp_eventwait(from, "STOP");
-    }
+        migrate_set_parameter_int(from, "downtime-limit", CONVERGE_DOWNTIME);
 
-    qtest_qmp_eventwait(to, "RESUME");
+        if (!got_stop) {
+            qtest_qmp_eventwait(from, "STOP");
+        }
 
-    wait_for_serial("dest_serial");
-    wait_for_migration_complete(from);
+        qtest_qmp_eventwait(to, "RESUME");
+
+        wait_for_serial("dest_serial");
+        wait_for_migration_complete(from);
+    }
 
     if (args->finish_hook) {
         args->finish_hook(from, to, data_hook);
     }
 
-    test_migrate_end(from, to, true);
+    test_migrate_end(from, to, args->result == MIG_TEST_SUCCEED);
 }
 
 static void test_precopy_unix(void)
-- 
2.35.1


