Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6602D44BD45
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 09:47:15 +0100 (CET)
Received: from localhost ([::1]:53530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkjGE-0002cq-J2
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 03:47:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mkjF5-0001Fe-TQ
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 03:46:03 -0500
Received: from mga18.intel.com ([134.134.136.126]:44316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mkjF4-0004rP-48
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 03:46:03 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="219524185"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="219524185"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 00:45:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="533980311"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.156.105])
 by orsmga001.jf.intel.com with ESMTP; 10 Nov 2021 00:45:46 -0800
From: "Rao, Lei" <lei.rao@intel.com>
To: chen.zhang@intel.com, zhang.zhanghailiang@huawei.com, quintela@redhat.com,
 dgilbert@redhat.com
Subject: [PATCH 1/2] Fixed a QEMU hang when guest poweroff in COLO mode
Date: Wed, 10 Nov 2021 16:37:35 +0800
Message-Id: <1636533456-5374-1-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=134.134.136.126; envelope-from=lei.rao@intel.com;
 helo=mga18.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Rao, Lei" <lei.rao@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

When the PVM guest poweroff, the COLO thread may wait a semaphore
in colo_process_checkpoint().So, we should wake up the COLO thread
before migration shutdown.

Signed-off-by: Lei Rao <lei.rao@intel.com>
---
 include/migration/colo.h |  1 +
 migration/colo.c         | 14 ++++++++++++++
 migration/migration.c    | 10 ++++++++++
 3 files changed, 25 insertions(+)

diff --git a/include/migration/colo.h b/include/migration/colo.h
index 768e1f0..525b45a 100644
--- a/include/migration/colo.h
+++ b/include/migration/colo.h
@@ -37,4 +37,5 @@ COLOMode get_colo_mode(void);
 void colo_do_failover(void);
 
 void colo_checkpoint_notify(void *opaque);
+void colo_shutdown(COLOMode mode);
 #endif
diff --git a/migration/colo.c b/migration/colo.c
index 2415325..385c1d7 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -820,6 +820,20 @@ static void colo_wait_handle_message(MigrationIncomingState *mis,
     }
 }
 
+void colo_shutdown(COLOMode mode)
+{
+    if (mode == COLO_MODE_PRIMARY) {
+        MigrationState *s = migrate_get_current();
+
+        qemu_event_set(&s->colo_checkpoint_event);
+        qemu_sem_post(&s->colo_exit_sem);
+    } else {
+        MigrationIncomingState *mis = migration_incoming_get_current();
+
+        qemu_sem_post(&mis->colo_incoming_sem);
+    }
+}
+
 void *colo_process_incoming_thread(void *opaque)
 {
     MigrationIncomingState *mis = opaque;
diff --git a/migration/migration.c b/migration/migration.c
index abaf6f9..9df6328 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -225,6 +225,16 @@ void migration_cancel(const Error *error)
 
 void migration_shutdown(void)
 {
+    COLOMode mode = get_colo_mode();
+
+    /*
+     * When the QEMU main thread exit, the COLO thread
+     * may wait a semaphore. So, we should wakeup the
+     * COLO thread before migration shutdown.
+     */
+    if (mode != COLO_MODE_NONE) {
+        colo_shutdown(mode);
+     }
     /*
      * Cancel the current migration - that will (eventually)
      * stop the migration using this structure
-- 
1.8.3.1


