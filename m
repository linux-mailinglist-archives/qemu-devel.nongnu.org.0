Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8B555C077
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:57:38 +0200 (CEST)
Received: from localhost ([::1]:59364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68uX-0003KK-Dj
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o68rk-0000DD-LP
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:54:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o68rj-0006TT-6n
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:54:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656413682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WP0KrJnO47HaUcIR8S1wU3tfrrwzaaOzYfCUepH0nWE=;
 b=bzx1mRuvrgWlkvstNe2iVsEqg2d9bBkXS5B6ZFuDiBxuS8PASNKwHay083tklnqLFJ9YvK
 48qwmW7u/fdo/bSL8ygo1vBPMwQU/C/jv53nQ1NTiv6Ls25psE7eHwYofNBsngNsg5wyyP
 /NczX69Z/pfMx/ZRnwhaXIdcr7SGjbg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-6vhywzBpPhS3FPBxfLIJkw-1; Tue, 28 Jun 2022 06:54:39 -0400
X-MC-Unique: 6vhywzBpPhS3FPBxfLIJkw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC1D91C01B38;
 Tue, 28 Jun 2022 10:54:38 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6339D112131B;
 Tue, 28 Jun 2022 10:54:37 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 1/5] tests: wait max 120 seconds for migration test status
 changes
Date: Tue, 28 Jun 2022 11:54:30 +0100
Message-Id: <20220628105434.295905-2-berrange@redhat.com>
In-Reply-To: <20220628105434.295905-1-berrange@redhat.com>
References: <20220628105434.295905-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
2.36.1


