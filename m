Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679CA4CACF6
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:07:50 +0100 (CET)
Received: from localhost ([::1]:53568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTO9-00046W-Gb
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:07:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPT81-0007VG-Pp
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:51:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPT7y-00007F-Tz
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:51:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646243466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B3meqorGqJZo7c0U7Q1uHKQ5b/cTHVIUmhiF9bz5lTo=;
 b=gWSGY46OKjDKA7oG829Kidd8Mxw75gsDtYywveqT43qx6xGyhxA3ixuOzGKx/0KVOdDMt/
 Q20QwAhkACBayU6K9mBWMnMKAELUZ2Rl0eEPsLcRmDmOGUcnDt0dRgKJt/cMe894Q5BQIp
 0EbFYz0OKRTzBTqzOOgQyfZ9C9pwOYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-6GKXYG_7N6Sp7hy2Vuzhrg-1; Wed, 02 Mar 2022 12:51:05 -0500
X-MC-Unique: 6GKXYG_7N6Sp7hy2Vuzhrg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77D69824FA7
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 17:51:04 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 061488000B;
 Wed,  2 Mar 2022 17:51:01 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/18] tests: expand the migration precopy helper to support
 failures
Date: Wed,  2 Mar 2022 17:49:25 +0000
Message-Id: <20220302174932.2692378-12-berrange@redhat.com>
In-Reply-To: <20220302174932.2692378-1-berrange@redhat.com>
References: <20220302174932.2692378-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 tests/qtest/migration-test.c | 47 +++++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 9 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 2082c58e8b..e40b408988 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -827,17 +827,32 @@ typedef void (*TestMigrateFinishHook)(QTestState *from,
  * @connect_uri: the URI for the src QEMU to connect to
  * @start_hook: (optional) callback to run at start to set migration parameters
  * @finish_hook: (optional) callback to run at finish to cleanup
+ * @expect_fail: true if we expect migration to fail
+ * @dst_quit: true if we expect the dst QEMU to quit with an
+ *            abnormal exit status on failure
  * @dirty_ring: true to use dirty ring tracking
  *
  * If @connect_uri is NULL, then it will query the dst
  * QEMU for its actual listening address and use that
  * as the connect address. This allows for dynamically
  * picking a free TCP port.
+ *
+ * If @expect_fail is true then we expect the migration process to
+ * fail instead of completing. There can be a variety of reasons
+ * and stages in which this may happen. If a failure is expected
+ * to happen at time of establishing the connection, then @dst_quit
+ * should be false to indicate that the dst QEMU is espected to
+ * stay running and accept future migration connections. If a
+ * failure is expected to happen while processing the migration
+ * stream, then @dst_quit should be true to indicate that the
+ * dst QEMU is expected to quit with non-zero exit status
  */
 static void test_precopy_common(const char *listen_uri,
                                 const char *connect_uri,
                                 TestMigrateStartHook start_hook,
                                 TestMigrateFinishHook finish_hook,
+                                bool expect_fail,
+                                bool dst_quit,
                                 bool dirty_ring)
 {
     MigrateStart *args = migrate_start_new();
@@ -875,24 +890,32 @@ static void test_precopy_common(const char *listen_uri,
 
     migrate_qmp(from, connect_uri, "{}");
 
-    wait_for_migration_pass(from);
+    if (expect_fail) {
+        wait_for_migration_fail(from, !dst_quit);
 
-    migrate_set_parameter_int(from, "downtime-limit", CONVERGE_DOWNTIME);
+        if (dst_quit) {
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
 
     if (finish_hook) {
         finish_hook(from, to, data_hook);
     }
 
-    test_migrate_end(from, to, true);
+    test_migrate_end(from, to, !expect_fail);
 }
 
 static void test_precopy_unix_common(bool dirty_ring)
@@ -903,6 +926,8 @@ static void test_precopy_unix_common(bool dirty_ring)
                         uri,
                         NULL, /* start_hook */
                         NULL, /* finish_hook */
+                        false, /* expect_fail */
+                        false, /* dst_quit */
                         dirty_ring);
 }
 
@@ -1012,6 +1037,8 @@ static void test_precopy_tcp(void)
                         NULL, /* connect_uri */
                         NULL, /* start_hook */
                         NULL, /* finish_hook */
+                        false, /* expect_fail */
+                        false, /* dst_quit */
                         false /* dirty_ring */);
 }
 
@@ -1079,6 +1106,8 @@ static void test_migrate_fd_proto(void)
                         "fd:fd-mig",
                         test_migrate_fd_start_hook,
                         test_migrate_fd_finish_hook,
+                        false, /* expect_fail */
+                        false, /* dst_quit */
                         false /* dirty_ring */);
 }
 
-- 
2.34.1


