Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7D668E090
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 19:51:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPT3T-0006Fj-Vn; Tue, 07 Feb 2023 13:51:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPT37-0005yQ-8H
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:50:37 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPT34-0001Zq-Pe
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:50:36 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317GntVq000488; Tue, 7 Feb 2023 18:50:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2022-7-12;
 bh=UqBTeeBjYRX4+r9TD3zuN9IdNjqDfgUQ5dpM4c7Nlh0=;
 b=N90qSNi14CqZQ+yXgUaNDEc+S8EQtMMT/X9UUfgyHmcMlOH3kSysi343dl4jrHTKp6pO
 7G9W/Bh7BOm+dERfWVo5PmlmdxZSmXJfRlZngH0Ewv3iVXQLtwm8ozSbLi6dlMN4q636
 Jpej8p5rEYN8qSFGp2+KDlLiJ0f15X36Keq3P1bygrq4vxJ31qTvx0NNQyuqvuTlkuaK
 MAfnDiz8ECJPNnUJlgsXGqDkpj/3av6kgBlUr74lpWFKR5GB7PeihN5lsuUq5NgXGxKf
 YCbqo9b/KIiOFS15YCGfiqdM/2gEqVtMLiccAe1do4l36b7ycmE7R9iJBdweKAKivnAz sQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhdy16d9n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 18:50:31 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 317HUSCE035650; Tue, 7 Feb 2023 18:50:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdt6jgy5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 18:50:31 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 317IoU9s020172;
 Tue, 7 Feb 2023 18:50:30 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3nhdt6jgum-1; Tue, 07 Feb 2023 18:50:30 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>
Subject: [PATCH V2 10/20] migration: simplify notifiers
Date: Tue,  7 Feb 2023 10:50:26 -0800
Message-Id: <1675795826-235150-1-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_10,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070167
X-Proofpoint-GUID: Okuqf4HxbZalEo6Gw_E9akk3eB5natKu
X-Proofpoint-ORIG-GUID: Okuqf4HxbZalEo6Gw_E9akk3eB5natKu
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Pass the callback function to add_migration_state_change_notifier so
that migration can initialize the notifier on add and clear it on
delete, which simplifies the call sites.  Shorten the function names
so the extra arg can be added more legibly.  Hide the global notifier
list in a new function migration_call_notifiers, and make it externally
visible so future cpr code can call it.

No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/net/virtio-net.c      |  6 +++---
 hw/vfio/migration.c      |  6 +++---
 include/migration/misc.h |  6 ++++--
 migration/migration.c    | 22 ++++++++++++++++------
 ui/spice-core.c          |  3 +--
 5 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 3ae9090..4a44f99 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3570,8 +3570,8 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
         n->primary_listener.hide_device = failover_hide_primary_device;
         qatomic_set(&n->failover_primary_hidden, true);
         device_listener_register(&n->primary_listener);
-        n->migration_state.notify = virtio_net_migration_state_notifier;
-        add_migration_state_change_notifier(&n->migration_state);
+        migration_add_notifier(&n->migration_state,
+                               virtio_net_migration_state_notifier);
         n->host_features |= (1ULL << VIRTIO_NET_F_STANDBY);
     }
 
@@ -3734,7 +3734,7 @@ static void virtio_net_device_unrealize(DeviceState *dev)
     if (n->failover) {
         qobject_unref(n->primary_opts);
         device_listener_unregister(&n->primary_listener);
-        remove_migration_state_change_notifier(&n->migration_state);
+        migration_remove_notifier(&n->migration_state);
     } else {
         assert(n->primary_opts == NULL);
     }
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index d149176..8897b48 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -841,8 +841,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
     migration->vm_state = qdev_add_vm_change_state_handler(vbasedev->dev,
                                                            vfio_vmstate_change,
                                                            vbasedev);
-    migration->migration_state.notify = vfio_migration_state_notifier;
-    add_migration_state_change_notifier(&migration->migration_state);
+    migration_add_notifier(&migration->migration_state,
+                           vfio_migration_state_notifier);
     return 0;
 
 err:
@@ -897,7 +897,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
     if (vbasedev->migration) {
         VFIOMigration *migration = vbasedev->migration;
 
-        remove_migration_state_change_notifier(&migration->migration_state);
+        migration_remove_notifier(&migration->migration_state);
         qemu_del_vm_change_state_handler(migration->vm_state);
         unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
         vfio_migration_exit(vbasedev);
diff --git a/include/migration/misc.h b/include/migration/misc.h
index 4659067..888fd1b 100644
--- a/include/migration/misc.h
+++ b/include/migration/misc.h
@@ -59,8 +59,10 @@ void migration_object_init(void);
 void migration_shutdown(void);
 bool migration_is_idle(void);
 bool migration_is_active(MigrationState *);
-void add_migration_state_change_notifier(Notifier *notify);
-void remove_migration_state_change_notifier(Notifier *notify);
+void migration_add_notifier(Notifier *notify,
+                            void (*func)(Notifier *notifier, void *data));
+void migration_remove_notifier(Notifier *notify);
+void migration_call_notifiers(MigrationState *s);
 bool migration_in_setup(MigrationState *);
 bool migration_has_finished(MigrationState *);
 bool migration_has_failed(MigrationState *);
diff --git a/migration/migration.c b/migration/migration.c
index 6c5283c..2a4894b 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1980,7 +1980,7 @@ static void migrate_fd_cleanup(MigrationState *s)
         /* It is used on info migrate.  We can't free it */
         error_report_err(error_copy(s->error));
     }
-    notifier_list_notify(&migration_state_notifiers, s);
+    migration_call_notifiers(s);
     block_cleanup_parameters(s);
     yank_unregister_instance(MIGRATION_YANK_INSTANCE);
 }
@@ -2075,14 +2075,24 @@ static void migrate_fd_cancel(MigrationState *s)
     }
 }
 
-void add_migration_state_change_notifier(Notifier *notify)
+void migration_add_notifier(Notifier *notify,
+                            void (*func)(Notifier *notifier, void *data))
 {
+    notify->notify = func;
     notifier_list_add(&migration_state_notifiers, notify);
 }
 
-void remove_migration_state_change_notifier(Notifier *notify)
+void migration_remove_notifier(Notifier *notify)
+{
+    if (notify->notify) {
+        notifier_remove(notify);
+        notify->notify = NULL;
+    }
+}
+
+void migration_call_notifiers(MigrationState *s)
 {
-    notifier_remove(notify);
+    notifier_list_notify(&migration_state_notifiers, s);
 }
 
 bool migration_in_setup(MigrationState *s)
@@ -3257,7 +3267,7 @@ static int postcopy_start(MigrationState *ms)
      * spice needs to trigger a transition now
      */
     ms->postcopy_after_devices = true;
-    notifier_list_notify(&migration_state_notifiers, ms);
+    migration_call_notifiers(ms);
 
     ms->downtime =  qemu_clock_get_ms(QEMU_CLOCK_REALTIME) - time_at_stop;
 
@@ -4282,7 +4292,7 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
         rate_limit = s->parameters.max_bandwidth / XFER_LIMIT_RATIO;
 
         /* Notify before starting migration thread */
-        notifier_list_notify(&migration_state_notifiers, s);
+        migration_call_notifiers(s);
     }
 
     qemu_file_set_rate_limit(s->to_dst_file, rate_limit);
diff --git a/ui/spice-core.c b/ui/spice-core.c
index 72f8f16..d902d00 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -814,8 +814,7 @@ static void qemu_spice_init(void)
     };
     using_spice = 1;
 
-    migration_state.notify = migration_state_notifier;
-    add_migration_state_change_notifier(&migration_state);
+    migration_add_notifier(&migration_state, migration_state_notifier);
     spice_migrate.base.sif = &migrate_interface.base;
     qemu_spice.add_interface(&spice_migrate.base);
 
-- 
1.8.3.1


