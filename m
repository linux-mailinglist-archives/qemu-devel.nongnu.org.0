Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41175528AB6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:38:24 +0200 (CEST)
Received: from localhost ([::1]:42628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdjj-0003Xf-D4
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nqcnp-0002MD-AN
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:38:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nqcnn-0008Ez-Ca
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652715510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yXXkZWKN8LrPxOaOLf+mp2FVQYecb/UvK2VWosQ8Q/U=;
 b=ZG2EcZT2GiHMP7psJlAfCkemoArp5qptF6uV0vcIYh/mpqM5MVdXSlDwJqS1vW0DPuNVtf
 aDai+OUB6UT2WpbS17aiT2pV7ES+g2VruEENZ7cCumXSu5gmpzWvtXmxKwKEC75GfkDlgF
 VkrMlMZWRhVoHlSvk/Z3Ox6QULBvTkY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-MmIOikY8N82o-pv7xYeIyg-1; Mon, 16 May 2022 11:38:29 -0400
X-MC-Unique: MmIOikY8N82o-pv7xYeIyg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDA20395AFE5
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 15:38:28 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.194.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10F0015215E9;
 Mon, 16 May 2022 15:38:27 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com,
 leobras@redhat.com, berrange@redhat.com
Subject: [PULL 09/17] tests: ensure migration status isn't reported as failed
Date: Mon, 16 May 2022 16:38:04 +0100
Message-Id: <20220516153812.127155-10-dgilbert@redhat.com>
In-Reply-To: <20220516153812.127155-1-dgilbert@redhat.com>
References: <20220516153812.127155-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

Various methods in the migration test call 'query_migrate' to fetch the
current status and then access a particular field. Almost all of these
cases expect the migration to be in a non-failed state. In the case of
'wait_for_migration_pass' in particular, if the status is 'failed' then
it will get into an infinite loop. By validating that the status is
not 'failed' the test suite will assert rather than hang when getting
into an unexpected state.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220426160048.812266-10-berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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
index 2731399aaa..78587c2b82 100644
--- a/tests/qtest/migration-helpers.h
+++ b/tests/qtest/migration-helpers.h
@@ -27,6 +27,7 @@ G_GNUC_PRINTF(3, 4)
 void migrate_qmp(QTestState *who, const char *uri, const char *fmt, ...);
 
 QDict *migrate_query(QTestState *who);
+QDict *migrate_query_not_failed(QTestState *who);
 
 void wait_for_migration_status(QTestState *who,
                                const char *goal, const char **ungoals);
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index efc6ec1614..d33e8060f9 100644
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
2.36.1


