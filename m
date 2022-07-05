Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C503B56686D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 12:45:51 +0200 (CEST)
Received: from localhost ([::1]:35842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8g3y-0003T6-R4
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 06:45:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8fwv-0006Kf-I4
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:38:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8fwt-0005z3-WC
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657017511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DzXTaa+S/Tz0rpf24ziPITkSB+RlupAHfjNEw/9caaE=;
 b=eGp80KvewZetee4ZIuEG97LqqAEthROkB3D6KrrInb7n0zKFsIAW3JAEe3cVF6RHPtRysa
 TYPVE9pR6UW0Yz9NPNOLfupEyPu7/9dmlgHYGFz0IeHdszOpdCuAb307eINdt0fbaASJX4
 snwYPMHxZCL/E/Zk1x8n4SyBgJP5Tik=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-3afyXwI3Mr2yQCw2BYkMZg-1; Tue, 05 Jul 2022 06:38:29 -0400
X-MC-Unique: 3afyXwI3Mr2yQCw2BYkMZg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 877BB1019C8A;
 Tue,  5 Jul 2022 10:38:29 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 711F4492C3B;
 Tue,  5 Jul 2022 10:38:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 07/14] tests: wait max 120 seconds for migration test status
 changes
Date: Tue,  5 Jul 2022 12:38:09 +0200
Message-Id: <20220705103816.608166-8-thuth@redhat.com>
In-Reply-To: <20220705103816.608166-1-thuth@redhat.com>
References: <20220705103816.608166-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

Currently the wait_for_migration_fail and wait_for_migration_complete
functions will spin in an infinite loop checking query-migrate status
to detect a specific change/goal. This is fine when everything goes
to plan, but when the unusual happens, these will hang the test suite
forever.

Any normally executing migration test case normally takes < 1 second
for a state change, with exception of the autoconverge test which
takes about 5 seconds. Taking into account possibility of people
running tests inside TCG, allowing a factor of x20 slowdown gives
a reasonable worst case of 120 seconds. Anything taking longer than
this is a strong sign that the test has hung, or the test should be
rewritten to be faster.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220628105434.295905-2-berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/migration-helpers.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/qtest/migration-helpers.c b/tests/qtest/migration-helpers.c
index a6aa59e4e6..e81e831c85 100644
--- a/tests/qtest/migration-helpers.c
+++ b/tests/qtest/migration-helpers.c
@@ -15,6 +15,14 @@
 
 #include "migration-helpers.h"
 
+/*
+ * Number of seconds we wait when looking for migration
+ * status changes, to avoid test suite hanging forever
+ * when things go wrong. Needs to be higher enough to
+ * avoid false positives on loaded hosts.
+ */
+#define MIGRATION_STATUS_WAIT_TIMEOUT 120
+
 bool got_stop;
 
 static void check_stop_event(QTestState *who)
@@ -166,8 +174,11 @@ static bool check_migration_status(QTestState *who, const char *goal,
 void wait_for_migration_status(QTestState *who,
                                const char *goal, const char **ungoals)
 {
+    g_test_timer_start();
     while (!check_migration_status(who, goal, ungoals)) {
         usleep(1000);
+
+        g_assert(g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT);
     }
 }
 
@@ -178,6 +189,7 @@ void wait_for_migration_complete(QTestState *who)
 
 void wait_for_migration_fail(QTestState *from, bool allow_active)
 {
+    g_test_timer_start();
     QDict *rsp_return;
     char *status;
     bool failed;
@@ -193,6 +205,8 @@ void wait_for_migration_fail(QTestState *from, bool allow_active)
         g_assert(result);
         failed = !strcmp(status, "failed");
         g_free(status);
+
+        g_assert(g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT);
     } while (!failed);
 
     /* Is the machine currently running? */
-- 
2.31.1


