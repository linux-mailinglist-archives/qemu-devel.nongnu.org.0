Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E19858181D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 19:09:13 +0200 (CEST)
Received: from localhost ([::1]:33700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGO3U-00006I-88
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 13:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGNAR-0003ul-8I
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:12:20 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:9066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGNAL-0006Iy-SI
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:12:17 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFnQMs006253;
 Tue, 26 Jul 2022 16:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=tkGH8BE2NwM2eY2fKoFLUgmPXYSgkXEsjJ53haabH7c=;
 b=hZR54CL3n2Pk4gdcJxeB1jAPr8oGf37elUStfJ8ACwGlC9A2Rno7hVM1ppZH4bljwY0T
 OoHMxBGtTMD/ogUb65t7G5ZRZUFtBODXcw/9YoipFBc9VO49Nc37ul6Vse8c+dvquAsv
 sJ6DQ/VybBWbtflVDL4CDSAf5N6jz2zFGNWS5N7OWKvmaMkilQxeY5XYhj6OkiwVu0J9
 V7bnxtr13/uCk1MDc/XevI582YCRh6/k/DYLFUrAWDncms+SqJOzEl3ujR3DoZysu2P1
 RGYasgdG+Nt0e7Jva/xgOSkhXd/g0hebajP12M/U2DrTFXEnjbo3AyfYEn1Omsyb+8Hg QA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg940pu4x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:53 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QEbnNn006229; Tue, 26 Jul 2022 16:11:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq30n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:52 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uTf023334;
 Tue, 26 Jul 2022 16:11:51 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-47; Tue, 26 Jul 2022 16:11:51 +0000
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
Subject: [PATCH V9 46/46] vfio: allow cpr-reboot migration if suspended
Date: Tue, 26 Jul 2022 09:10:43 -0700
Message-Id: <1658851843-236870-47-git-send-email-steven.sistare@oracle.com>
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
X-Proofpoint-GUID: gvPo2sl689da3-owImaYkWZ0PBzf99Qr
X-Proofpoint-ORIG-GUID: gvPo2sl689da3-owImaYkWZ0PBzf99Qr
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

The cpr-reboot mode supports vfio devices if the caller first suspends the
guest, such as by issuing guest-suspend-ram to the qemu guest agent.  The
guest drivers' suspend methods flush outstanding requests and re-initialize
the devices, and thus there is no device state to save and restore.

Relax the vfio blocker, and add a notifier that verifies the guest is
suspended.  Skip dirty page tracking to avoid ioctl errors.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/vfio/common.c              |  8 ++++++--
 hw/vfio/cpr.c                 | 21 +++++++++++++++++++++
 hw/vfio/migration.c           |  3 ++-
 include/hw/vfio/vfio-common.h |  1 +
 4 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index de821e1..5b54cbe 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1355,14 +1355,18 @@ static void vfio_listener_log_global_start(MemoryListener *listener)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
 
-    vfio_set_dirty_page_tracking(container, true);
+    if (!runstate_check(RUN_STATE_SUSPENDED)) {
+        vfio_set_dirty_page_tracking(container, true);
+    }
 }
 
 static void vfio_listener_log_global_stop(MemoryListener *listener)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
 
-    vfio_set_dirty_page_tracking(container, false);
+    if (!runstate_check(RUN_STATE_SUSPENDED)) {
+        vfio_set_dirty_page_tracking(container, false);
+    }
 }
 
 static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
diff --git a/hw/vfio/cpr.c b/hw/vfio/cpr.c
index 1f682cb..ef8827c 100644
--- a/hw/vfio/cpr.c
+++ b/hw/vfio/cpr.c
@@ -10,6 +10,7 @@
 #include <linux/vfio.h>
 #include "hw/vfio/vfio-common.h"
 #include "sysemu/kvm.h"
+#include "sysemu/runstate.h"
 #include "qapi/error.h"
 #include "migration/blocker.h"
 #include "migration/migration.h"
@@ -132,8 +133,26 @@ static void vfio_cpr_fail_notifier(Notifier *notifier, void *data)
     }
 }
 
+static void vfio_cpr_reboot_notifier(Notifier *notifier, void *data)
+{
+    MigrationState *s = data;
+
+    if (migrate_mode_of(s) == MIG_MODE_CPR_REBOOT &&
+        !migration_has_failed(s) &&
+        !runstate_check(RUN_STATE_SUSPENDED)) {
+
+        Error *err = NULL;
+        error_setg(&err, "VFIO device only supports cpr-reboot for "
+                         "runstate suspended");
+        migration_notifier_set_error(s, err);
+    }
+}
+
 int vfio_cpr_register_container(VFIOContainer *container, Error **errp)
 {
+    migration_add_notifier(&container->cpr_reboot_notifier,
+                           vfio_cpr_reboot_notifier);
+
     container->cpr_blocker = NULL;
     if (!vfio_is_cpr_capable(container, &container->cpr_blocker)) {
         return migrate_add_blockers(&container->cpr_blocker, errp,
@@ -148,6 +167,8 @@ int vfio_cpr_register_container(VFIOContainer *container, Error **errp)
 
 void vfio_cpr_unregister_container(VFIOContainer *container)
 {
+    migration_remove_notifier(&container->cpr_reboot_notifier);
+
     migrate_del_blocker(&container->cpr_blocker);
 
     vmstate_unregister(NULL, &vfio_container_vmstate, container);
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 6b0d401..3919941 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -890,7 +890,8 @@ add_blocker:
                "VFIO device doesn't support migration");
     g_free(info);
 
-    return migrate_add_blocker(&vbasedev->migration_blocker, errp);
+    return migrate_add_blockers(&vbasedev->migration_blocker, errp,
+                                MIG_MODE_NORMAL, -1);
 }
 
 void vfio_migration_finalize(VFIODevice *vbasedev)
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index b682645..243376b 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -83,6 +83,7 @@ typedef struct VFIOContainer {
     MemoryListener prereg_listener;
     Notifier cpr_notifier;
     Error *cpr_blocker;
+    Notifier cpr_reboot_notifier;
     unsigned iommu_type;
     Error *error;
     bool initialized;
-- 
1.8.3.1


