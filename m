Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A55C46FCE6F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 21:19:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwSqW-0004CN-Qf; Tue, 09 May 2023 15:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwSqV-0004Bv-0a
 for qemu-devel@nongnu.org; Tue, 09 May 2023 15:17:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwSqT-0006b5-Hg
 for qemu-devel@nongnu.org; Tue, 09 May 2023 15:17:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683659877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y8yUWxZBI4WbeI8emXU3tzoUUh9YUQs7F7iFHrOnxz8=;
 b=HAfW/pEo9BJZrHaCwaTZu0KdVHRx3l7BH9xlq0W26dJN9F2MNyZkraKQQqnHycZn7Sgma7
 gMWQhxs6e/dzQd50bQSCs9huKp+dFs00v194CRCkReEuyYkPaOsknanetJ9Jcww4SPtalK
 YHEf2OCcLjm8LW8acdOs/LnLcsuycSw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-aRid8sCIPeyTXkGvJLp9lQ-1; Tue, 09 May 2023 15:17:52 -0400
X-MC-Unique: aRid8sCIPeyTXkGvJLp9lQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94CA585A588;
 Tue,  9 May 2023 19:17:50 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90ED463F84;
 Tue,  9 May 2023 19:17:48 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 Leonardo Bras <leobras@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hailiang Zhang <zhanghailiang@xfusion.com>, Eric Blake <eblake@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PULL 09/10] migration: disallow change capabilities in COLO state
Date: Tue,  9 May 2023 21:17:23 +0200
Message-Id: <20230509191724.86159-10-quintela@redhat.com>
In-Reply-To: <20230509191724.86159-1-quintela@redhat.com>
References: <20230509191724.86159-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

COLO is not listed as running state in migrate_is_running(), so, it's
theoretically possible to disable colo capability in COLO state and the
unexpected error in migration_iteration_finish() is reachable.

Let's disallow that in qmp_migrate_set_capabilities. Than the error
becomes absolutely unreachable: we can get into COLO state only with
enabled capability and can't disable it while we are in COLO state. So
substitute the error by simple assertion.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-Id: <20230428194928.1426370-10-vsementsov@yandex-team.ru>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 5 +----
 migration/options.c   | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 230f91f5a7..4959f7ee44 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2781,10 +2781,7 @@ static void migration_iteration_finish(MigrationState *s)
         runstate_set(RUN_STATE_POSTMIGRATE);
         break;
     case MIGRATION_STATUS_COLO:
-        if (!migrate_colo()) {
-            error_report("%s: critical error: calling COLO code without "
-                         "COLO enabled", __func__);
-        }
+        assert(migrate_colo());
         migrate_start_colo_process(s);
         s->vm_was_running = true;
         /* Fallthrough */
diff --git a/migration/options.c b/migration/options.c
index 9d92b15b76..7ed88b7b32 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -598,7 +598,7 @@ void qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
     MigrationCapabilityStatusList *cap;
     bool new_caps[MIGRATION_CAPABILITY__MAX];
 
-    if (migration_is_running(s->state)) {
+    if (migration_is_running(s->state) || migration_in_colo_state()) {
         error_setg(errp, QERR_MIGRATION_ACTIVE);
         return;
     }
-- 
2.40.0


