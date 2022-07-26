Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E766D5817BF
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 18:44:10 +0200 (CEST)
Received: from localhost ([::1]:48102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGNfF-0002rd-Vb
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 12:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGNA3-0003NQ-Cw
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:55 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:20708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGNA1-0006DW-Eg
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:55 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFn3Uk016260;
 Tue, 26 Jul 2022 16:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=kxdQx9CE7uT5if5wDUJhL1lr37CWJESfcBIHXjjwzHY=;
 b=3YtUdceVqqHtEpiGGrKyTg/PO002AyCcNs8uSLvg7U3GPoyOuJIJAP99eZ6xeT73irLj
 +q9SQkjXeAAelXnp+2jauHi5L5RUKuKWef0C9TnATzOpyoAKNCYkmTjNmml505I5zNUq
 xYp7ty1z0Z6iQKQJqEIrc2PvkvpAuDoXbr6Yej1ab8/CG1KidUUoBsw5WHbxylRwkpd5
 pd9V3WHsWrZHagEpExfFzd145RN8wD9Ci0HU+YENMKmT7qWjEOKkwSVxl60B1D93+zkp
 p6wZ8C+fzRVHaC/8Nx/EDEv8mTO83EQMRSksSllxMB52/5KGpzVHQWJH/NH2RAp5trbr Hw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9a9f0um-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:10 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QEdoxC006239; Tue, 26 Jul 2022 16:11:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq1sa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:09 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uSf023334;
 Tue, 26 Jul 2022 16:11:08 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-17; Tue, 26 Jul 2022 16:11:08 +0000
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
Subject: [PATCH V9 16/46] migration: simplify notifiers
Date: Tue, 26 Jul 2022 09:10:13 -0700
Message-Id: <1658851843-236870-17-git-send-email-steven.sistare@oracle.com>
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
X-Proofpoint-GUID: Rak7uNJcz9lZEDMLSP6ncvqpAQAs3bFg
X-Proofpoint-ORIG-GUID: Rak7uNJcz9lZEDMLSP6ncvqpAQAs3bFg
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

Pass the callback function to add_migration_state_change_notifier so
that migration can initialize the notifier on add and clear it on
delete, which simplifies the call sites.  Also shorten the function
names.

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
index dd0d056..29af1a5 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3443,8 +3443,8 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
         n->primary_listener.hide_device = failover_hide_primary_device;
         qatomic_set(&n->failover_primary_hidden, true);
         device_listener_register(&n->primary_listener);
-        n->migration_state.notify = virtio_net_migration_state_notifier;
-        add_migration_state_change_notifier(&n->migration_state);
+        migration_add_notifier(&n->migration_state,
+                               virtio_net_migration_state_notifier);
         n->host_features |= (1ULL << VIRTIO_NET_F_STANDBY);
     }
 
@@ -3607,7 +3607,7 @@ static void virtio_net_device_unrealize(DeviceState *dev)
     if (n->failover) {
         qobject_unref(n->primary_opts);
         device_listener_unregister(&n->primary_listener);
-        remove_migration_state_change_notifier(&n->migration_state);
+        migration_remove_notifier(&n->migration_state);
     } else {
         assert(n->primary_opts == NULL);
     }
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index d6f9e29..5109124 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -839,8 +839,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
     migration->vm_state = qdev_add_vm_change_state_handler(vbasedev->dev,
                                                            vfio_vmstate_change,
                                                            vbasedev);
-    migration->migration_state.notify = vfio_migration_state_notifier;
-    add_migration_state_change_notifier(&migration->migration_state);
+    migration_add_notifier(&migration->migration_state,
+                           vfio_migration_state_notifier);
     return 0;
 
 err:
@@ -895,7 +895,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
     if (vbasedev->migration) {
         VFIOMigration *migration = vbasedev->migration;
 
-        remove_migration_state_change_notifier(&migration->migration_state);
+        migration_remove_notifier(&migration->migration_state);
         qemu_del_vm_change_state_handler(migration->vm_state);
         unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
         vfio_migration_exit(vbasedev);
diff --git a/include/migration/misc.h b/include/migration/misc.h
index 71b6285..d4c2d7d 100644
--- a/include/migration/misc.h
+++ b/include/migration/misc.h
@@ -60,8 +60,10 @@ void migration_object_init(void);
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
index 80b7d09..d7c6902 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1962,7 +1962,7 @@ static void migrate_fd_cleanup(MigrationState *s)
         /* It is used on info migrate.  We can't free it */
         error_report_err(error_copy(s->error));
     }
-    notifier_list_notify(&migration_state_notifiers, s);
+    migration_call_notifiers(s);
     block_cleanup_parameters(s);
     yank_unregister_instance(MIGRATION_YANK_INSTANCE);
 }
@@ -2057,14 +2057,24 @@ static void migrate_fd_cancel(MigrationState *s)
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
@@ -3341,7 +3351,7 @@ static int postcopy_start(MigrationState *ms)
      * spice needs to trigger a transition now
      */
     ms->postcopy_after_devices = true;
-    notifier_list_notify(&migration_state_notifiers, ms);
+    migration_call_notifiers(ms);
 
     ms->downtime =  qemu_clock_get_ms(QEMU_CLOCK_REALTIME) - time_at_stop;
 
@@ -4378,7 +4388,7 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
         rate_limit = s->parameters.max_bandwidth / XFER_LIMIT_RATIO;
 
         /* Notify before starting migration thread */
-        notifier_list_notify(&migration_state_notifiers, s);
+        migration_call_notifiers(s);
     }
 
     qemu_file_set_rate_limit(s->to_dst_file, rate_limit);
diff --git a/ui/spice-core.c b/ui/spice-core.c
index c3ac20a..62b7893 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -819,8 +819,7 @@ static void qemu_spice_init(void)
     };
     using_spice = 1;
 
-    migration_state.notify = migration_state_notifier;
-    add_migration_state_change_notifier(&migration_state);
+    migration_add_notifier(&migration_state, migration_state_notifier);
     spice_migrate.base.sif = &migrate_interface.base;
     qemu_spice.add_interface(&spice_migrate.base);
 
-- 
1.8.3.1


