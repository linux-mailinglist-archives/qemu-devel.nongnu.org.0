Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9E05817DF
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 18:50:01 +0200 (CEST)
Received: from localhost ([::1]:55838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGNku-0008Nk-9K
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 12:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9y-00038l-VY
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:51 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:5776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9v-0006Bj-Hu
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:49 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFnPIo006232;
 Tue, 26 Jul 2022 16:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=BZdgwcLHdh9RxgHARQpnfNRJnvfV9+0XhbZC6FwQLnU=;
 b=OMfc04Mld/WEUYQWh5t/V9f6bof+RZOo7aemP+x0+8JRH1eAeRKgX5AQDizL2M230nCL
 S+eGYnHHVVJviwDAo24V2fcquR9qdT6rBXKJ0DZv2hhifZ6Yw2QX5o5Xc/ZuTdl4fAGL
 aezgaHUzuRt+VULrTTqGm0LOXj1k5eqZ3E9JiEPbbkyprGEplv6XiTkRLHRyZFHOAYaN
 hSHTSs+fdDtlmfkpciw7yD6EFGHUfNhr+izgusQd6Wpg+h3xBVBEjoxa/9hG+zy9CkmZ
 QisiskevQjfPohjBfPx2iL1zixbrg1nHwh2DLzt0LwoD/8RhPUbEleXflbO5Nra48/7x XA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg940pu02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:10:57 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QEu0Up006207; Tue, 26 Jul 2022 16:10:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq1bp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:10:56 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uSN023334;
 Tue, 26 Jul 2022 16:10:55 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-8; Tue, 26 Jul 2022 16:10:55 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Peng Liang <tcx4c70@gmail.com>
Subject: [PATCH V9 07/46] migration: per-mode blockers
Date: Tue, 26 Jul 2022 09:10:04 -0700
Message-Id: <1658851843-236870-8-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
References: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207260063
X-Proofpoint-GUID: Myb_eXE9ZD1lQFNLwD97NVvK9MBTLkOE
X-Proofpoint-ORIG-GUID: Myb_eXE9ZD1lQFNLwD97NVvK9MBTLkOE
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Extend the blocker interface so that a blocker can be registered for
one or more migration modes.  The existing interfaces register a
blocker for all modes, and the new interfaces take a varargs list
of modes.

Internally, maintain a separate blocker list per mode.  The same Error
object may be added to multiple lists.  When a block is deleted, it is
removed from every list, and the Error is freed.

No functional change until a new mode is added.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/migration/blocker.h | 45 ++++++++++++++++++++---
 migration/migration.c       | 87 +++++++++++++++++++++++++++++++++++++++------
 stubs/migr-blocker.c        |  5 +++
 3 files changed, 123 insertions(+), 14 deletions(-)

diff --git a/include/migration/blocker.h b/include/migration/blocker.h
index 1483f5d..1a21937 100644
--- a/include/migration/blocker.h
+++ b/include/migration/blocker.h
@@ -14,8 +14,12 @@
 #ifndef MIGRATION_BLOCKER_H
 #define MIGRATION_BLOCKER_H
 
+#include "qapi/qapi-types-migration.h"
+
+#define MIG_MODE_ALL MIG_MODE__MAX
+
 /**
- * @migrate_add_blocker - prevent migration from proceeding
+ * @migrate_add_blocker - prevent all modes of migration from proceeding
  *
  * @reasonp - address of an error to be returned whenever migration is attempted
  *
@@ -29,8 +33,41 @@
 int migrate_add_blocker(Error **reasonp, Error **errp);
 
 /**
+ * @migrate_add_blockers - prevent migration for specified modes from proceeding
+ *
+ * @reasonp - address of an error to be returned whenever migration is attempted
+ *
+ * @errp - [out] The reason (if any) we cannot block migration right now.
+ *
+ * @mode - one or more migration modes to be blocked.  The list is terminated
+ *         by -1 or MIG_MODE_ALL.  For the latter, all modes are blocked.
+ *
+ * @returns - 0 on success, -EBUSY/-EACCES on failure, with errp set.
+ *
+ * *@reasonp is freed and set to NULL if failure is returned.
+ * On success, the caller must not free *@reasonp before the blocker is removed.
+ */
+int migrate_add_blockers(Error **reasonp, Error **errp, MigMode mode, ...);
+
+/**
+ * @migrate_add_blocker_always - permanently prevent migration for specified
+ *  modes from proceeding.  The blocker cannot be deleted.
+ *
+ * @msg - text of error to be returned whenever migration is attempted
+ *
+ * @errp - [out] The reason (if any) we cannot block migration right now.
+ *
+ * @mode - one or more migration modes to be blocked.  The list is terminated
+ *         by -1 or MIG_MODE_ALL.  For the latter, all modes are blocked.
+ *
+ * @returns - 0 on success, -EBUSY/-EACCES on failure, with errp set.
+ */
+int
+migrate_add_blocker_always(const char *msg, Error **errp, MigMode mode, ...);
+
+/**
  * @migrate_add_blocker_internal - prevent migration from proceeding without
- *                                 only-migrate implications
+ *                                 only-migrate implications, for all modes
  *
  * @reasonp - address of an error to be returned whenever migration is attempted
  *
@@ -48,7 +85,7 @@ int migrate_add_blocker(Error **reasonp, Error **errp);
 int migrate_add_blocker_internal(Error **reasonp, Error **errp);
 
 /**
- * @migrate_del_blocker - remove a blocking error from migration and free it.
+ * @migrate_del_blocker - remove a migration blocker for all modes and free it.
  *
  * @reasonp - address of the error blocking migration
  *
@@ -57,7 +94,7 @@ int migrate_add_blocker_internal(Error **reasonp, Error **errp);
 void migrate_del_blocker(Error **reasonp);
 
 /**
- * @migrate_remove_blocker - remove a migration blocker.
+ * @migrate_remove_blocker - remove a migration blocker for all modes.
  *
  * @reason - the error blocking migration
  *
diff --git a/migration/migration.c b/migration/migration.c
index 0d3bed5..0e62227 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -175,7 +175,7 @@ static MigrationState *current_migration;
 static MigrationIncomingState *current_incoming;
 static int migrate_enabled_modes = BIT(MIG_MODE_NORMAL);
 
-static GSList *migration_blockers;
+static GSList *migration_blockers[MIG_MODE__MAX];
 
 static bool migration_object_check(MigrationState *ms, Error **errp);
 static int migration_maybe_pause(MigrationState *s,
@@ -1123,7 +1123,7 @@ static void fill_source_migration_info(MigrationInfo *info)
 {
     MigrationState *s = migrate_get_current();
     int state = qatomic_read(&s->state);
-    GSList *cur_blocker = migration_blockers;
+    GSList *cur_blocker = migration_blockers[migrate_mode()];
 
     info->blocked_reasons = NULL;
 
@@ -2198,8 +2198,10 @@ void migrate_init(MigrationState *s)
     s->threshold_size = 0;
 }
 
-int migrate_add_blocker_internal(Error **reasonp, Error **errp)
+static int add_blockers(Error **reasonp, Error **errp, int modes)
 {
+    MigMode mode;
+
     /* Snapshots are similar to migrations, so check RUN_STATE_SAVE_VM too. */
     if (runstate_check(RUN_STATE_SAVE_VM) || !migration_is_idle()) {
         error_propagate_prepend(errp, *reasonp,
@@ -2209,13 +2211,20 @@ int migrate_add_blocker_internal(Error **reasonp, Error **errp)
         return -EBUSY;
     }
 
-    migration_blockers = g_slist_prepend(migration_blockers, *reasonp);
+    for (mode = 0; mode < MIG_MODE__MAX; mode++) {
+        if (modes & BIT(mode)) {
+            migration_blockers[mode] = g_slist_prepend(migration_blockers[mode],
+                                                       *reasonp);
+        }
+    }
     return 0;
 }
 
-int migrate_add_blocker(Error **reasonp, Error **errp)
+static int check_blockers(Error **reasonp, Error **errp, int modes)
 {
-    if (only_migratable) {
+    ERRP_GUARD();
+
+    if (only_migratable && (modes & BIT(MIG_MODE_NORMAL))) {
         error_propagate_prepend(errp, *reasonp,
                                 "disallowing migration blocker "
                                 "(--only-migratable) for: ");
@@ -2223,7 +2232,60 @@ int migrate_add_blocker(Error **reasonp, Error **errp)
         return -EACCES;
     }
 
-    return migrate_add_blocker_internal(reasonp, errp);
+    return add_blockers(reasonp, errp, modes);
+}
+
+int migrate_add_blocker(Error **reasonp, Error **errp)
+{
+    return migrate_add_blockers(reasonp, errp, MIG_MODE_ALL);
+}
+
+int migrate_add_blocker_internal(Error **reasonp, Error **errp)
+{
+    int modes = BIT(MIG_MODE__MAX) - 1;
+
+    return add_blockers(reasonp, errp, modes);
+}
+
+static int get_modes(MigMode mode, va_list ap)
+{
+    int modes = 0;
+
+    while (mode != -1 && mode != MIG_MODE_ALL) {
+        assert(mode >= MIG_MODE_NORMAL && mode < MIG_MODE__MAX);
+        modes |= BIT(mode);
+        mode = va_arg(ap, MigMode);
+    }
+    if (mode == MIG_MODE_ALL) {
+        modes = BIT(MIG_MODE__MAX) - 1;
+    }
+    return modes;
+}
+
+int migrate_add_blockers(Error **reasonp, Error **errp, MigMode mode, ...)
+{
+    int modes;
+    va_list ap;
+
+    va_start(ap, mode);
+    modes = get_modes(mode, ap);
+    va_end(ap);
+
+    return check_blockers(reasonp, errp, modes);
+}
+
+int migrate_add_blocker_always(const char *msg, Error **errp, MigMode mode, ...)
+{
+    int modes;
+    va_list ap;
+    Error *reason = NULL;
+
+    va_start(ap, mode);
+    modes = get_modes(mode, ap);
+    va_end(ap);
+
+    error_setg(&reason, "%s", msg);
+    return check_blockers(&reason, errp, modes);
 }
 
 void migrate_del_blocker(Error **reasonp)
@@ -2238,7 +2300,10 @@ void migrate_del_blocker(Error **reasonp)
 void migrate_remove_blocker(Error *reason)
 {
     if (reason) {
-        migration_blockers = g_slist_remove(migration_blockers, reason);
+        for (MigMode mode = 0; mode < MIG_MODE__MAX; mode++) {
+            migration_blockers[mode] = g_slist_remove(migration_blockers[mode],
+                                                      reason);
+        }
     }
 }
 
@@ -2333,12 +2398,14 @@ void qmp_migrate_pause(Error **errp)
 
 bool migration_is_blocked(Error **errp)
 {
+    GSList *blockers = migration_blockers[migrate_mode()];
+
     if (qemu_savevm_state_blocked(errp)) {
         return true;
     }
 
-    if (migration_blockers) {
-        error_propagate(errp, error_copy(migration_blockers->data));
+    if (blockers) {
+        error_propagate(errp, error_copy(blockers->data));
         return true;
     }
 
diff --git a/stubs/migr-blocker.c b/stubs/migr-blocker.c
index 17a5dbf..60769d8 100644
--- a/stubs/migr-blocker.c
+++ b/stubs/migr-blocker.c
@@ -6,6 +6,11 @@ int migrate_add_blocker(Error **reasonp, Error **errp)
     return 0;
 }
 
+int migrate_add_blockers(Error **reasonp, Error **errp, MigMode mode, ...)
+{
+    return 0;
+}
+
 void migrate_del_blocker(Error **reasonp)
 {
 }
-- 
1.8.3.1


