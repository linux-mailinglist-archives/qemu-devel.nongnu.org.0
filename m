Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C3C6FE3A6
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 20:11:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwoGU-0002a4-7J; Wed, 10 May 2023 14:10:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwoGS-0002ZB-2J
 for qemu-devel@nongnu.org; Wed, 10 May 2023 14:10:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwoGQ-0000yM-HD
 for qemu-devel@nongnu.org; Wed, 10 May 2023 14:10:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683742209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CCxXIa18KpSXzXqC8g+dFBy27xtXlV3MGkh4EnCx/j0=;
 b=MKJoCs9PFo+qIoVeyFsRNVW8vsWdXkXPY3LJ3my0QmGoKP4K5pAW4DPrJEDHeCv6JGNbtA
 jcEQ1nW+WFIhtHahoV9p3/L8Woffzb/eAkftfZPiOZKZMKnYK+u40XK9sXwQ/pjh75kpQo
 agt+OmILozxwhMXvxFXE6K+foqsV0HQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-IJjZ2BMzNPuiv-LvwmfUfg-1; Wed, 10 May 2023 14:10:08 -0400
X-MC-Unique: IJjZ2BMzNPuiv-LvwmfUfg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15A3F38184E6;
 Wed, 10 May 2023 18:10:08 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BAFEE14171BC;
 Wed, 10 May 2023 18:10:05 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eric Blake <eblake@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Markus Armbruster <armbru@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 qemu-block@nongnu.org, Hailiang Zhang <zhanghailiang@xfusion.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PULL 09/10] migration: disallow change capabilities in COLO state
Date: Wed, 10 May 2023 20:09:37 +0200
Message-Id: <20230510180938.6338-10-quintela@redhat.com>
In-Reply-To: <20230510180938.6338-1-quintela@redhat.com>
References: <20230510180938.6338-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
index 140b2a4de6..bb254e4f07 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2785,10 +2785,7 @@ static void migration_iteration_finish(MigrationState *s)
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
2.40.1


