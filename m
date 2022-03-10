Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B4A4D5077
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:28:59 +0100 (CET)
Received: from localhost ([::1]:39464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSMaw-0004O5-J9
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:28:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMS0-0003Be-2u
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:19:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMRw-0003gR-TO
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:19:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646932780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=feQ6R35Em400uk3AeVZDLlrm3mJQVi3dKsvmVIK3SkM=;
 b=QkCT1fX9narmcy+XQvQO9aQoGjqCnNyZTPyiXQs8VxUFRZ/eUdYJiSPUbWiktE/sWbRKiC
 xFr9DHQtiG2RrUyeeJoPXor87lcssGQ5dVwKkWsww7afVBgHf1ic1FFRJ6Ns5tvyBruhe0
 Hq5Y3xdtusJ7vTGJ5WFHVv/F9cXKlbk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-h5JxZrfcMGSvONyB3lc8gw-1; Thu, 10 Mar 2022 12:19:39 -0500
X-MC-Unique: h5JxZrfcMGSvONyB3lc8gw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3127F180FD74
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 17:19:38 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EB3D106D5B8;
 Thu, 10 Mar 2022 17:19:36 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/18] tests: expand the migration precopy helper to
 support failures
Date: Thu, 10 Mar 2022 17:18:14 +0000
Message-Id: <20220310171821.3724080-12-berrange@redhat.com>
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

The migration precopy testing helper function always expects the
migration to run to a completion state. There will be test scenarios
for TLS where expect either the client or server to fail the migration.
This expands the helper to cope with these scenarios.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
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
2.34.1


