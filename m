Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85125510298
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:09:38 +0200 (CEST)
Received: from localhost ([::1]:36458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njNkv-0004U5-Ic
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njNcn-00041N-Uz
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:01:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njNcg-0007R8-BO
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:01:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650988865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cs4XidUMc4tUZWMoserwt+Hi9nBDr1/rE9neHcid6Ig=;
 b=gUOXR3jv5bKt7Aq0xLumVWMSdelaehYRQYRULH5Hc8iUgeHqqyBy1PFjPr0oQpVXBjVVpQ
 R9FdMdkaaG7euiASWFv9t4M4OVqzPuVm7eSeq0V4lAbK88+P+HocdOLaB+r5cDoAslBTox
 AmTjgOR6uzS7CBYYQDyBape4Eoxhb1c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-ZQkvn-KpNcWWqgAjyFt77Q-1; Tue, 26 Apr 2022 12:01:04 -0400
X-MC-Unique: ZQkvn-KpNcWWqgAjyFt77Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D87413832186
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 16:01:03 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96D2CC28137;
 Tue, 26 Apr 2022 16:01:02 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 9/9] tests: ensure migration status isn't reported as failed
Date: Tue, 26 Apr 2022 17:00:48 +0100
Message-Id: <20220426160048.812266-10-berrange@redhat.com>
In-Reply-To: <20220426160048.812266-1-berrange@redhat.com>
References: <20220426160048.812266-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
index 555adafce1..d07e0fb748 100644
--- a/tests/qtest/migration-helpers.h
+++ b/tests/qtest/migration-helpers.h
@@ -26,6 +26,7 @@ G_GNUC_PRINTF(3, 4)
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
2.35.1


