Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA24A47568F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:37:58 +0100 (CET)
Received: from localhost ([::1]:53912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxRfZ-0001Ob-O9
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:37:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRaP-0002vk-F2
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:32:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRaN-0007Gt-1r
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:32:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639564354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IueGQ5vGsurlSi24esPo3NVJeeyROrP31iJRN0y7JBI=;
 b=ZwX1NUDWB1LhTc1vn9mUYqeur9O4v/zeu78Gzqyp8NFLsVliTJfjFFsdG2YfWa2h7sLvsS
 YH8lOLePWa4iedn0jLgbN/VFDCyjDRQaMCjKcLx+B7d8BStrJAq67ZhhHzdSjOLZGxlkIw
 3v8YmcCmFZ05lxpGlTj/FUUsQrktgcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-KmqLlw4ZOHC0rStgFcfkLg-1; Wed, 15 Dec 2021 05:32:31 -0500
X-MC-Unique: KmqLlw4ZOHC0rStgFcfkLg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A80A2F24;
 Wed, 15 Dec 2021 10:32:30 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13A1A6E978;
 Wed, 15 Dec 2021 10:32:27 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/18] migration/colo: Optimize COLO primary node start code
 path
Date: Wed, 15 Dec 2021 11:32:04 +0100
Message-Id: <20211215103218.17527-5-quintela@redhat.com>
In-Reply-To: <20211215103218.17527-1-quintela@redhat.com>
References: <20211215103218.17527-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zhang Chen <chen.zhang@intel.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

Optimize COLO primary start path from:
MIGRATION_STATUS_XXX --> MIGRATION_STATUS_ACTIVE --> MIGRATION_STATUS_COLO --> MIGRATION_STATUS_COMPLETED
To:
MIGRATION_STATUS_XXX --> MIGRATION_STATUS_COLO --> MIGRATION_STATUS_COMPLETED
No need to start primary COLO through "MIGRATION_STATUS_ACTIVE".

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/colo.c      |  2 --
 migration/migration.c | 13 +++++++------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/migration/colo.c b/migration/colo.c
index 2a85504966..4a772afe78 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -666,8 +666,6 @@ void migrate_start_colo_process(MigrationState *s)
                                 colo_checkpoint_notify, s);
 
     qemu_sem_init(&s->colo_exit_sem, 0);
-    migrate_set_state(&s->state, MIGRATION_STATUS_ACTIVE,
-                      MIGRATION_STATUS_COLO);
     colo_process_checkpoint(s);
     qemu_mutex_lock_iothread();
 }
diff --git a/migration/migration.c b/migration/migration.c
index c0ab86e9a5..2c1edb2cb9 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3613,12 +3613,7 @@ static void migration_iteration_finish(MigrationState *s)
         migration_calculate_complete(s);
         runstate_set(RUN_STATE_POSTMIGRATE);
         break;
-
-    case MIGRATION_STATUS_ACTIVE:
-        /*
-         * We should really assert here, but since it's during
-         * migration, let's try to reduce the usage of assertions.
-         */
+    case MIGRATION_STATUS_COLO:
         if (!migrate_colo_enabled()) {
             error_report("%s: critical error: calling COLO code without "
                          "COLO enabled", __func__);
@@ -3628,6 +3623,12 @@ static void migration_iteration_finish(MigrationState *s)
          * Fixme: we will run VM in COLO no matter its old running state.
          * After exited COLO, we will keep running.
          */
+         /* Fallthrough */
+    case MIGRATION_STATUS_ACTIVE:
+        /*
+         * We should really assert here, but since it's during
+         * migration, let's try to reduce the usage of assertions.
+         */
         s->vm_was_running = true;
         /* Fallthrough */
     case MIGRATION_STATUS_FAILED:
-- 
2.33.1


