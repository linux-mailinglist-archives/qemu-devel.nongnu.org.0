Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4604E7F46
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 07:04:25 +0100 (CET)
Received: from localhost ([::1]:59246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXzXE-00057E-5m
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 02:04:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nXzVe-00037L-Qi
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 02:02:46 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:4217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nXzVc-00005o-RL
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 02:02:46 -0400
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4KQStw3LhSz9st6;
 Sat, 26 Mar 2022 13:58:32 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 26 Mar 2022 14:02:31 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 26 Mar 2022 14:02:30 +0800
To: <alex.williamson@redhat.com>
CC: <pbonzini@redhat.com>, <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>,
 <arei.gonglei@huawei.com>, <huangzhichao@huawei.com>, <yechuan@huawei.com>,
 "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: [PATCH v6 2/5] vfio: move re-enabling INTX out of the common helper
Date: Sat, 26 Mar 2022 14:02:23 +0800
Message-ID: <20220326060226.1892-3-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20220326060226.1892-1-longpeng2@huawei.com>
References: <20220326060226.1892-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml100016.china.huawei.com (7.185.36.216)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189; envelope-from=longpeng2@huawei.com;
 helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  "Longpeng(Mike)" <longpeng2@huawei.com>
From:  "Longpeng(Mike)" via <qemu-devel@nongnu.org>

Move re-enabling INTX out, and the callers should decide to
re-enable it or not.

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
---
 hw/vfio/pci.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 1433989aeb..a1916e2e36 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -693,7 +693,6 @@ retry:
 
 static void vfio_msi_disable_common(VFIOPCIDevice *vdev)
 {
-    Error *err = NULL;
     int i;
 
     for (i = 0; i < vdev->nr_vectors; i++) {
@@ -712,15 +711,11 @@ static void vfio_msi_disable_common(VFIOPCIDevice *vdev)
     vdev->msi_vectors = NULL;
     vdev->nr_vectors = 0;
     vdev->interrupt = VFIO_INT_NONE;
-
-    vfio_intx_enable(vdev, &err);
-    if (err) {
-        error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
-    }
 }
 
 static void vfio_msix_disable(VFIOPCIDevice *vdev)
 {
+    Error *err = NULL;
     int i;
 
     msix_unset_vector_notifiers(&vdev->pdev);
@@ -741,6 +736,10 @@ static void vfio_msix_disable(VFIOPCIDevice *vdev)
     }
 
     vfio_msi_disable_common(vdev);
+    vfio_intx_enable(vdev, &err);
+    if (err) {
+        error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
+    }
 
     memset(vdev->msix->pending, 0,
            BITS_TO_LONGS(vdev->msix->entries) * sizeof(unsigned long));
@@ -750,8 +749,14 @@ static void vfio_msix_disable(VFIOPCIDevice *vdev)
 
 static void vfio_msi_disable(VFIOPCIDevice *vdev)
 {
+    Error *err = NULL;
+
     vfio_disable_irqindex(&vdev->vbasedev, VFIO_PCI_MSI_IRQ_INDEX);
     vfio_msi_disable_common(vdev);
+    vfio_intx_enable(vdev, &err);
+    if (err) {
+        error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
+    }
 
     trace_vfio_msi_disable(vdev->vbasedev.name);
 }
-- 
2.23.0


