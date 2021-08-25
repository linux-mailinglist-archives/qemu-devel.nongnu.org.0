Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CD23F70C8
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:58:27 +0200 (CEST)
Received: from localhost ([::1]:35174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInnm-0001lb-K9
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mInmK-0007XU-Kd
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:56:56 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mInmG-0005cr-2z
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:56:56 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4GvdbD43GZz89Bv;
 Wed, 25 Aug 2021 15:56:24 +0800 (CST)
Received: from dggpeml500016.china.huawei.com (7.185.36.70) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 25 Aug 2021 15:56:39 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml500016.china.huawei.com (7.185.36.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 25 Aug 2021 15:56:35 +0800
From: "Longpeng(Mike)" <longpeng2@huawei.com>
To: <alex.williamson@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <pbonzini@redhat.com>
Subject: [PATCH 1/5] vfio: use helper to simplfy the failure path in
 vfio_msi_enable
Date: Wed, 25 Aug 2021 15:56:16 +0800
Message-ID: <20210825075620.2607-2-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20210825075620.2607-1-longpeng2@huawei.com>
References: <20210825075620.2607-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500016.china.huawei.com (7.185.36.70)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189; envelope-from=longpeng2@huawei.com;
 helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Longpeng\(Mike\)" <longpeng2@huawei.com>, arei.gonglei@huawei.com,
 huangzhichao@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The main difference of the failure path in vfio_msi_enable and
vfio_msi_disable_common is enable INTX or not.

Extend the vfio_msi_disable_common to provide a arg to decide
whether need to fallback, and then we can use this helper to
instead the redundant code in vfio_msi_enable.

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
---
 hw/vfio/pci.c | 34 ++++++++++++----------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index e1ea1d8..7cc43fe 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -47,6 +47,7 @@
 
 static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
 static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled);
+static void vfio_msi_disable_common(VFIOPCIDevice *vdev, bool enable_intx);
 
 /*
  * Disabling BAR mmaping can be slow, but toggling it around INTx can
@@ -650,29 +651,17 @@ retry:
     if (ret) {
         if (ret < 0) {
             error_report("vfio: Error: Failed to setup MSI fds: %m");
-        } else if (ret != vdev->nr_vectors) {
+        } else {
             error_report("vfio: Error: Failed to enable %d "
                          "MSI vectors, retry with %d", vdev->nr_vectors, ret);
         }
 
-        for (i = 0; i < vdev->nr_vectors; i++) {
-            VFIOMSIVector *vector = &vdev->msi_vectors[i];
-            if (vector->virq >= 0) {
-                vfio_remove_kvm_msi_virq(vector);
-            }
-            qemu_set_fd_handler(event_notifier_get_fd(&vector->interrupt),
-                                NULL, NULL, NULL);
-            event_notifier_cleanup(&vector->interrupt);
-        }
-
-        g_free(vdev->msi_vectors);
-        vdev->msi_vectors = NULL;
+        vfio_msi_disable_common(vdev, false);
 
-        if (ret > 0 && ret != vdev->nr_vectors) {
+        if (ret > 0) {
             vdev->nr_vectors = ret;
             goto retry;
         }
-        vdev->nr_vectors = 0;
 
         /*
          * Failing to setup MSI doesn't really fall within any specification.
@@ -680,7 +669,6 @@ retry:
          * out to fall back to INTx for this device.
          */
         error_report("vfio: Error: Failed to enable MSI");
-        vdev->interrupt = VFIO_INT_NONE;
 
         return;
     }
@@ -688,7 +676,7 @@ retry:
     trace_vfio_msi_enable(vdev->vbasedev.name, vdev->nr_vectors);
 }
 
-static void vfio_msi_disable_common(VFIOPCIDevice *vdev)
+static void vfio_msi_disable_common(VFIOPCIDevice *vdev, bool enable_intx)
 {
     Error *err = NULL;
     int i;
@@ -710,9 +698,11 @@ static void vfio_msi_disable_common(VFIOPCIDevice *vdev)
     vdev->nr_vectors = 0;
     vdev->interrupt = VFIO_INT_NONE;
 
-    vfio_intx_enable(vdev, &err);
-    if (err) {
-        error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
+    if (enable_intx) {
+        vfio_intx_enable(vdev, &err);
+        if (err) {
+            error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
+        }
     }
 }
 
@@ -737,7 +727,7 @@ static void vfio_msix_disable(VFIOPCIDevice *vdev)
         vfio_disable_irqindex(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX);
     }
 
-    vfio_msi_disable_common(vdev);
+    vfio_msi_disable_common(vdev, true);
 
     memset(vdev->msix->pending, 0,
            BITS_TO_LONGS(vdev->msix->entries) * sizeof(unsigned long));
@@ -748,7 +738,7 @@ static void vfio_msix_disable(VFIOPCIDevice *vdev)
 static void vfio_msi_disable(VFIOPCIDevice *vdev)
 {
     vfio_disable_irqindex(&vdev->vbasedev, VFIO_PCI_MSI_IRQ_INDEX);
-    vfio_msi_disable_common(vdev);
+    vfio_msi_disable_common(vdev, true);
 
     trace_vfio_msi_disable(vdev->vbasedev.name);
 }
-- 
1.8.3.1


