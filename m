Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFEE4D508D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:31:09 +0100 (CET)
Received: from localhost ([::1]:45924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSMd2-0000cn-LJ
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:31:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMSI-0003eU-P0
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:20:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMSH-0003hz-3a
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:20:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646932800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VNmNxGvHxKTPwv8QcX9cJuFt1D6tDOFiamlyqdR555E=;
 b=BN8q9FPj6TTPLcfB/5tlbfGeCugYNTKrCHKkPlxsUjUINWY+FT08CVQ3b21YNU3/XF9upA
 3nvQURI2JsyldDa/yICCPFHi3SDIGKEzyMeh7Npmnipw6PDtkIsjPLpb3DCkotvDnXVHTW
 mzAz1GMJq/P0lIKPWJMhN0ahx5P9poU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-FBB3b0LhMRuopNMKx7UBQw-1; Thu, 10 Mar 2022 12:19:59 -0500
X-MC-Unique: FBB3b0LhMRuopNMKx7UBQw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6550281E22C
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 17:19:58 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E6C6106D5DC;
 Thu, 10 Mar 2022 17:19:55 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/18] tests: ensure migration status isn't reported as
 failed
Date: Thu, 10 Mar 2022 17:18:21 +0000
Message-Id: <20220310171821.3724080-19-berrange@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

Various methods in the migration test call 'query_migrate' to fetch the
current status and then access a particular field. Almost all of these
cases expect the migration to be in a non-failed state. In the case of
'wait_for_migration_pass' in particular, if the status is 'failed' then
it will get into an infinite loop. By validating that the status is
not 'failed' the test suite will assert rather than hang when getting
into an unexpected state.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/migration-helpers.c | 13 +++++++++++++
 tests/qtest/migration-helpers.h |  1 +
 tests/qtest/migration-test.c    |  6 +++---
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/migration-helpers.c b/tests/qtest/migration-helpers.c
index 4ee26014b7..a6aa59e4e6 100644
--- a/tests/qtest/migration-helpers.c
+++ b/tests/qtest/migration-helpers.c
@@ -107,6 +107,19 @@ QDict *migrate_query(QTestState *who)
     return wait_command(who, "{ 'execute': 'query-migrate' }");
 }
 
+QDict *migrate_query_not_failed(QTestState *who)
+{
+    const char *status;
+    QDict *rsp = migrate_query(who);
+    status = qdict_get_str(rsp, "status");
+    if (g_str_equal(status, "failed")) {
+        g_printerr("query-migrate shows failed migration: %s\n",
+                   qdict_get_str(rsp, "error-desc"));
+    }
+    g_assert(!g_str_equal(status, "failed"));
+    return rsp;
+}
+
 /*
  * Note: caller is responsible to free the returned object via
  * g_free() after use
diff --git a/tests/qtest/migration-helpers.h b/tests/qtest/migration-helpers.h
index d63bba9630..b710ece67e 100644
--- a/tests/qtest/migration-helpers.h
+++ b/tests/qtest/migration-helpers.h
@@ -26,6 +26,7 @@ GCC_FMT_ATTR(3, 4)
 void migrate_qmp(QTestState *who, const char *uri, const char *fmt, ...);
 
 QDict *migrate_query(QTestState *who);
+QDict *migrate_query_not_failed(QTestState *who);
 
 void wait_for_migration_status(QTestState *who,
                                const char *goal, const char **ungoals);
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 5ea0b9360a..d9f444ea14 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -181,7 +181,7 @@ static int64_t read_ram_property_int(QTestState *who, const char *property)
     QDict *rsp_return, *rsp_ram;
     int64_t result;
 
-    rsp_return = migrate_query(who);
+    rsp_return = migrate_query_not_failed(who);
     if (!qdict_haskey(rsp_return, "ram")) {
         /* Still in setup */
         result = 0;
@@ -198,7 +198,7 @@ static int64_t read_migrate_property_int(QTestState *who, const char *property)
     QDict *rsp_return;
     int64_t result;
 
-    rsp_return = migrate_query(who);
+    rsp_return = migrate_query_not_failed(who);
     result = qdict_get_try_int(rsp_return, property, 0);
     qobject_unref(rsp_return);
     return result;
@@ -213,7 +213,7 @@ static void read_blocktime(QTestState *who)
 {
     QDict *rsp_return;
 
-    rsp_return = migrate_query(who);
+    rsp_return = migrate_query_not_failed(who);
     g_assert(qdict_haskey(rsp_return, "postcopy-blocktime"));
     qobject_unref(rsp_return);
 }
-- 
2.34.1


