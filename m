Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5B46FCE6E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 21:19:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwSqL-00047P-HK; Tue, 09 May 2023 15:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwSqH-00046O-W4
 for qemu-devel@nongnu.org; Tue, 09 May 2023 15:17:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwSqG-0006Yu-HB
 for qemu-devel@nongnu.org; Tue, 09 May 2023 15:17:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683659863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ImCQ+Y4FYqkgMFc7wGSlxrvJOlIh84jvmaO/wR4Nyjs=;
 b=jIGqbGuMO2gCLFE6sHWULfD3PQtfNz5/Zr66Lu3m2Q9SabBsPhzatCPG86zxpOu7J3feV7
 ovF2uardF2X1Y8KxbaSZNN1gVDjpzudumz7S9Ka+3owIGXu9FB93TsOKX9q8TFan7OBF6N
 rgGdo5RH3Et0BOB2iwULqFRpD9zEej4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-WjeNkoKgNbS4QrvhH5SU3g-1; Tue, 09 May 2023 15:17:42 -0400
X-MC-Unique: WjeNkoKgNbS4QrvhH5SU3g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD9E7380673B;
 Tue,  9 May 2023 19:17:40 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9554963F84;
 Tue,  9 May 2023 19:17:38 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 Leonardo Bras <leobras@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hailiang Zhang <zhanghailiang@xfusion.com>, Eric Blake <eblake@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Zhang Chen <chen.zhang@intel.com>
Subject: [PULL 05/10] colo: make colo_checkpoint_notify static and provide
 simpler API
Date: Tue,  9 May 2023 21:17:19 +0200
Message-Id: <20230509191724.86159-6-quintela@redhat.com>
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

colo_checkpoint_notify() is mostly used in colo.c. Outside we use it
once when x-checkpoint-delay migration parameter is set. So, let's
simplify the external API to only that function - notify COLO that
parameter was set. This make external API more robust and hides
implementation details from external callers. Also this helps us to
make COLO module optional in further patch (i.e. we are going to add
possibility not build the COLO module).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Message-Id: <20230428194928.1426370-3-vsementsov@yandex-team.ru>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/migration/colo.h |  9 ++++++++-
 migration/colo.c         | 29 ++++++++++++++++++-----------
 migration/options.c      |  4 +---
 3 files changed, 27 insertions(+), 15 deletions(-)

diff --git a/include/migration/colo.h b/include/migration/colo.h
index 5fbe1a6d5d..7ef315473e 100644
--- a/include/migration/colo.h
+++ b/include/migration/colo.h
@@ -36,6 +36,13 @@ COLOMode get_colo_mode(void);
 /* failover */
 void colo_do_failover(void);
 
-void colo_checkpoint_notify(void *opaque);
+/*
+ * colo_checkpoint_delay_set
+ *
+ * Handles change of x-checkpoint-delay migration parameter, called from
+ * migrate_params_apply() to notify COLO module about the change.
+ */
+void colo_checkpoint_delay_set(void);
+
 void colo_shutdown(void);
 #endif
diff --git a/migration/colo.c b/migration/colo.c
index 07bfa21fea..c9e0b909b9 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -65,6 +65,24 @@ static bool colo_runstate_is_stopped(void)
     return runstate_check(RUN_STATE_COLO) || !runstate_is_running();
 }
 
+static void colo_checkpoint_notify(void *opaque)
+{
+    MigrationState *s = opaque;
+    int64_t next_notify_time;
+
+    qemu_event_set(&s->colo_checkpoint_event);
+    s->colo_checkpoint_time = qemu_clock_get_ms(QEMU_CLOCK_HOST);
+    next_notify_time = s->colo_checkpoint_time + migrate_checkpoint_delay();
+    timer_mod(s->colo_delay_timer, next_notify_time);
+}
+
+void colo_checkpoint_delay_set(void)
+{
+    if (migration_in_colo_state()) {
+        colo_checkpoint_notify(migrate_get_current());
+    }
+}
+
 static void secondary_vm_do_failover(void)
 {
 /* COLO needs enable block-replication */
@@ -644,17 +662,6 @@ out:
     }
 }
 
-void colo_checkpoint_notify(void *opaque)
-{
-    MigrationState *s = opaque;
-    int64_t next_notify_time;
-
-    qemu_event_set(&s->colo_checkpoint_event);
-    s->colo_checkpoint_time = qemu_clock_get_ms(QEMU_CLOCK_HOST);
-    next_notify_time = s->colo_checkpoint_time + migrate_checkpoint_delay();
-    timer_mod(s->colo_delay_timer, next_notify_time);
-}
-
 void migrate_start_colo_process(MigrationState *s)
 {
     qemu_mutex_unlock_iothread();
diff --git a/migration/options.c b/migration/options.c
index 2e759cc306..9d92b15b76 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -1253,9 +1253,7 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
 
     if (params->has_x_checkpoint_delay) {
         s->parameters.x_checkpoint_delay = params->x_checkpoint_delay;
-        if (migration_in_colo_state()) {
-            colo_checkpoint_notify(s);
-        }
+        colo_checkpoint_delay_set();
     }
 
     if (params->has_block_incremental) {
-- 
2.40.0


