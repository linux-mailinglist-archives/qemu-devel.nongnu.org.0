Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0124754CC1F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:04:08 +0200 (CEST)
Received: from localhost ([::1]:56280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1UYw-00034G-Pn
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOX-0007HR-Tv
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:23 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:34582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOV-00015T-R9
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:21 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FDrshi015214;
 Wed, 15 Jun 2022 14:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=u+USWiZ7o3DyQxWHdJI7EwK8AIskaFZDpN+FFhGWYKM=;
 b=XoR7Cc3PrSieTnP1mm+SUS+MhF+Kxc7XOsPBukQuqgow4JlZ7lPQpLAgI6TrIpuNsPFO
 9g89KtaN4CE+jywXtGE7VOC6zOh92tbxChPn1yX91bQGrhk0BqIkrJ9lqM2jcRCf7GPA
 SZsOUI5jd3+DXawjNcHdvj3LKPw+641BBl5n3O7A4gZH9tScVFeqdxOnG1tISaZbi4lB
 XG356DdozQlybIBWwW9y3dQiJjvp/TOkzqZk+a53JUfgVncx2AjeqpKZPNRiX+7X1MUZ
 OLNxFJc5CLpRCVX8/Nt1TR6xL+hTKeEPMkysX7+mNhOku3NpVK+Ap5J1WNp6wk67jRoX 8Q== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhn0gvfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:53:07 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ7KB023155; Wed, 15 Jun 2022 14:53:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vq3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:53:06 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSNj018501;
 Wed, 15 Jun 2022 14:53:05 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-32; Wed, 15 Jun 2022 14:53:05 +0000
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
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH V8 31/39] vhost: reset vhost devices for cpr
Date: Wed, 15 Jun 2022 07:52:18 -0700
Message-Id: <1655304746-102776-32-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-GUID: Qr0T5rhpOzzWG1gwnovkgnz-cuq7IxNH
X-Proofpoint-ORIG-GUID: Qr0T5rhpOzzWG1gwnovkgnz-cuq7IxNH
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
 hw/virtio/vhost.c         | 17 +++++++++++++++++
 include/hw/virtio/vhost.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index dd3263d..efaa28c 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -23,6 +23,7 @@
 #include "standard-headers/linux/vhost_types.h"
 #include "hw/virtio/virtio-bus.h"
 #include "hw/virtio/virtio-access.h"
+#include "migration/cpr.h"
 #include "migration/blocker.h"
 #include "migration/qemu-file-types.h"
 #include "sysemu/dma.h"
@@ -1306,6 +1307,17 @@ static void vhost_virtqueue_cleanup(struct vhost_virtqueue *vq)
     event_notifier_cleanup(&vq->masked_notifier);
 }
 
+static void vhost_cpr_exec_notifier(Notifier *notifier, void *data)
+{
+    struct vhost_dev *dev = container_of(notifier, struct vhost_dev,
+                                         cpr_notifier);
+    int r = dev->vhost_ops->vhost_reset_device(dev);
+
+    if (r < 0) {
+        VHOST_OPS_DEBUG(r, "vhost_reset_device failed");
+    }
+}
+
 int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
                    VhostBackendType backend_type, uint32_t busyloop_timeout,
                    Error **errp)
@@ -1405,6 +1417,8 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
     hdev->log_enabled = false;
     hdev->started = false;
     memory_listener_register(&hdev->memory_listener, &address_space_memory);
+    cpr_add_notifier(&hdev->cpr_notifier, vhost_cpr_exec_notifier,
+                     CPR_NOTIFY_EXEC);
     QLIST_INSERT_HEAD(&vhost_devices, hdev, entry);
 
     if (used_memslots > hdev->vhost_ops->vhost_backend_memslots_limit(hdev)) {
@@ -1444,6 +1458,9 @@ void vhost_dev_cleanup(struct vhost_dev *hdev)
         migrate_del_blocker(hdev->migration_blocker);
         error_free(hdev->migration_blocker);
     }
+    if (hdev->cpr_notifier.notify) {
+        cpr_remove_notifier(&hdev->cpr_notifier);
+    }
     g_free(hdev->mem);
     g_free(hdev->mem_sections);
     if (hdev->vhost_ops) {
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index b291fe4..1316b14 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -100,6 +100,7 @@ struct vhost_dev {
     QLIST_ENTRY(vhost_dev) entry;
     QLIST_HEAD(, vhost_iommu) iommu_list;
     IOMMUNotifier n;
+    Notifier cpr_notifier;
     const VhostDevConfigOps *config_ops;
 };
 
-- 
1.8.3.1


