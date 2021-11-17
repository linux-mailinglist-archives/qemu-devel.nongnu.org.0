Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6078C4542D5
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 09:42:08 +0100 (CET)
Received: from localhost ([::1]:38142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnGW7-0002yR-GT
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 03:42:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mnGUQ-0001Ci-2l
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:40:22 -0500
Received: from mga02.intel.com ([134.134.136.20]:10626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mnGUN-0003n6-4K
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:40:21 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10170"; a="221121557"
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="221121557"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 00:40:16 -0800
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="506822168"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 00:40:14 -0800
From: Zhang Chen <chen.zhang@intel.com>
To: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH V2] migration/colo: Optimize COLO primary node start code path
Date: Wed, 17 Nov 2021 16:30:02 +0800
Message-Id: <20211117083002.206290-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=chen.zhang@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Zhang Chen <chen.zhang@intel.com>, qemu-dev <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Optimize COLO primary start path from:
MIGRATION_STATUS_XXX --> MIGRATION_STATUS_ACTIVE --> MIGRATION_STATUS_COLO --> MIGRATION_STATUS_COMPLETED
To:
MIGRATION_STATUS_XXX --> MIGRATION_STATUS_COLO --> MIGRATION_STATUS_COMPLETED
No need to start primary COLO through "MIGRATION_STATUS_ACTIVE".

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 migration/colo.c      |  2 --
 migration/migration.c | 13 +++++++------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/migration/colo.c b/migration/colo.c
index 2415325262..ad1a4426b3 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -667,8 +667,6 @@ void migrate_start_colo_process(MigrationState *s)
                                 colo_checkpoint_notify, s);
 
     qemu_sem_init(&s->colo_exit_sem, 0);
-    migrate_set_state(&s->state, MIGRATION_STATUS_ACTIVE,
-                      MIGRATION_STATUS_COLO);
     colo_process_checkpoint(s);
     qemu_mutex_lock_iothread();
 }
diff --git a/migration/migration.c b/migration/migration.c
index abaf6f9e3d..380fa05f12 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3607,12 +3607,7 @@ static void migration_iteration_finish(MigrationState *s)
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
@@ -3622,6 +3617,12 @@ static void migration_iteration_finish(MigrationState *s)
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
2.25.1


