Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3EB44CFFF
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 03:21:09 +0100 (CET)
Received: from localhost ([::1]:52164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkzi8-0003t4-GN
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 21:21:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mkzgy-0003BX-5g
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 21:19:56 -0500
Received: from mga01.intel.com ([192.55.52.88]:22641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mkzgv-0008DU-AG
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 21:19:55 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="256530959"
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="256530959"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 18:19:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="452560541"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.156.105])
 by orsmga006.jf.intel.com with ESMTP; 10 Nov 2021 18:19:48 -0800
From: "Rao, Lei" <lei.rao@intel.com>
To: chen.zhang@intel.com, zhang.zhanghailiang@huawei.com, quintela@redhat.com,
 dgilbert@redhat.com
Subject: [PATCH v2] Fixed a QEMU hang when guest poweroff in COLO mode
Date: Thu, 11 Nov 2021 10:11:33 +0800
Message-Id: <1636596693-8477-1-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=192.55.52.88; envelope-from=lei.rao@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
 migration/colo.c         | 20 ++++++++++++++++++++
 migration/migration.c    |  6 ++++++
 3 files changed, 27 insertions(+)

diff --git a/include/migration/colo.h b/include/migration/colo.h
index 768e1f0..5fbe1a6 100644
--- a/include/migration/colo.h
+++ b/include/migration/colo.h
@@ -37,4 +37,5 @@ COLOMode get_colo_mode(void);
 void colo_do_failover(void);
 
 void colo_checkpoint_notify(void *opaque);
+void colo_shutdown(void);
 #endif
diff --git a/migration/colo.c b/migration/colo.c
index 2415325..0d3d98f 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -820,6 +820,26 @@ static void colo_wait_handle_message(MigrationIncomingState *mis,
     }
 }
 
+void colo_shutdown(void)
+{
+    MigrationIncomingState *mis = NULL;
+    MigrationState *s = NULL;
+
+    switch (get_colo_mode()) {
+    case COLO_MODE_PRIMARY:
+        s = migrate_get_current();
+        qemu_event_set(&s->colo_checkpoint_event);
+        qemu_sem_post(&s->colo_exit_sem);
+        break;
+    case COLO_MODE_SECONDARY:
+        mis = migration_incoming_get_current();
+        qemu_sem_post(&mis->colo_incoming_sem);
+        break;
+    default:
+        break;
+    }
+}
+
 void *colo_process_incoming_thread(void *opaque)
 {
     MigrationIncomingState *mis = opaque;
diff --git a/migration/migration.c b/migration/migration.c
index abaf6f9..c0ab86e 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -226,6 +226,12 @@ void migration_cancel(const Error *error)
 void migration_shutdown(void)
 {
     /*
+     * When the QEMU main thread exit, the COLO thread
+     * may wait a semaphore. So, we should wakeup the
+     * COLO thread before migration shutdown.
+     */
+    colo_shutdown();
+    /*
      * Cancel the current migration - that will (eventually)
      * stop the migration using this structure
      */
-- 
1.8.3.1


