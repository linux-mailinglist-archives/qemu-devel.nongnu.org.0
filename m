Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D69C581800
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 18:58:48 +0200 (CEST)
Received: from localhost ([::1]:44380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGNtO-0003fr-6U
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 12:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9z-0003EW-PL
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:52 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:61180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9x-0006Fx-MP
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:51 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFniXO026856;
 Tue, 26 Jul 2022 16:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=eLKl1cpF1HINsl2amArCE04tfWdJ8MGhRXFnI18REuc=;
 b=C/QXjZeljkE/jwPlpaENjZPaaq5cLCWy7+kOK1B6+BVbAnAW6sqnROQVWePmBgK5kzoL
 5oEKxay8e93u2diSIu84iOHv7Qe9UeMSERlJhHxBNPDneIq6iizcBv6jdx3cm09V11zz
 qVb62wdaNsdeiLibq+XMUcV30zU1BkzkRimktsblGwfR/OQ/l6nTxiPgRkYVe2/la4Lv
 Evr75rDLB3raZ7rQSu8On1r0zOHnCLPTBiCNUVyIUNHXy1pJ0FWrmAObQsIkIHETMpDv
 rvk0Ku6GlrKiX5+HbcjU3Fo9LsJJTCJZS6dQSqgtyGt56+qYRpEZI8eKs0TGJhgvdviQ WQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9anxn19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:37 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QF2X5D006282; Tue, 26 Jul 2022 16:11:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq2hu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:36 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uTJ023334;
 Tue, 26 Jul 2022 16:11:35 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-36; Tue, 26 Jul 2022 16:11:35 +0000
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
Subject: [PATCH V9 35/46] vhost: reset vhost devices for cpr
Date: Tue, 26 Jul 2022 09:10:32 -0700
Message-Id: <1658851843-236870-36-git-send-email-steven.sistare@oracle.com>
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
X-Proofpoint-ORIG-GUID: l93yUVNPZ_MdLw2yJr2agaT1Z0htXhZa
X-Proofpoint-GUID: l93yUVNPZ_MdLw2yJr2agaT1Z0htXhZa
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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

A vhost device is implicitly preserved across re-exec because its fd is not
closed, and the value of the fd is specified on the command line for the
new qemu to find.  However, new qemu issues an VHOST_RESET_OWNER ioctl,
which fails because the device already has an owner.  To fix, reset the
owner prior to exec.

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/virtio/vhost.c         | 23 +++++++++++++++++++++++
 include/hw/virtio/vhost.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 8d2a136..bc8df55 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -23,6 +23,7 @@
 #include "standard-headers/linux/vhost_types.h"
 #include "hw/virtio/virtio-bus.h"
 #include "hw/virtio/virtio-access.h"
+#include "migration/misc.h"
 #include "migration/blocker.h"
 #include "migration/qemu-file-types.h"
 #include "sysemu/dma.h"
@@ -1347,6 +1348,25 @@ static void vhost_virtqueue_cleanup(struct vhost_virtqueue *vq)
     }
 }
 
+static void vhost_cpr_exec_notifier(Notifier *notifier, void *data)
+{
+    MigrationState *s = data;
+    struct vhost_dev *dev;
+    int r;
+
+    if (migrate_mode_of(s) == MIG_MODE_CPR_EXEC) {
+        dev = container_of(notifier, struct vhost_dev, cpr_notifier);
+        if (migration_has_failed(s)) {
+            r = dev->vhost_ops->vhost_set_owner(dev);
+        } else {
+            r = dev->vhost_ops->vhost_reset_device(dev);
+        }
+        if (r < 0) {
+            VHOST_OPS_DEBUG(r, "vhost_reset_device failed");
+        }
+    }
+}
+
 int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
                    VhostBackendType backend_type, uint32_t busyloop_timeout,
                    Error **errp)
@@ -1356,6 +1376,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
 
     hdev->vdev = NULL;
     hdev->migration_blocker = NULL;
+    hdev->cpr_notifier.notify = NULL;
 
     r = vhost_set_backend_type(hdev, backend_type);
     assert(r >= 0);
@@ -1446,6 +1467,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
     hdev->log_enabled = false;
     hdev->started = false;
     memory_listener_register(&hdev->memory_listener, &address_space_memory);
+    migration_add_notifier(&hdev->cpr_notifier, vhost_cpr_exec_notifier);
     QLIST_INSERT_HEAD(&vhost_devices, hdev, entry);
 
     if (used_memslots > hdev->vhost_ops->vhost_backend_memslots_limit(hdev)) {
@@ -1482,6 +1504,7 @@ void vhost_dev_cleanup(struct vhost_dev *hdev)
         QLIST_REMOVE(hdev, entry);
     }
     migrate_del_blocker(&hdev->migration_blocker);
+    migration_remove_notifier(&hdev->cpr_notifier);
     g_free(hdev->mem);
     g_free(hdev->mem_sections);
     if (hdev->vhost_ops) {
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index a346f23..a12c4e1 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -101,6 +101,7 @@ struct vhost_dev {
     QLIST_ENTRY(vhost_dev) entry;
     QLIST_HEAD(, vhost_iommu) iommu_list;
     IOMMUNotifier n;
+    Notifier cpr_notifier;
     const VhostDevConfigOps *config_ops;
 };
 
-- 
1.8.3.1


