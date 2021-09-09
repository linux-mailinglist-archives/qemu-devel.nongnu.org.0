Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18051404569
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 08:08:32 +0200 (CEST)
Received: from localhost ([::1]:50116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mODEc-0006sD-VN
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 02:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mODCi-0004AV-UX
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 02:06:32 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mODCe-00065B-Pj
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 02:06:32 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H4pLJ2HbPz8yPV;
 Thu,  9 Sep 2021 14:02:00 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 9 Sep 2021 14:06:21 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 9 Sep 2021 14:06:21 +0800
From: "Longpeng(Mike)" <longpeng2@huawei.com>
To: <alex.williamson@redhat.com>, <philmd@redhat.com>, <pbonzini@redhat.com>
Subject: [PATCH v2 8/9] Revert "vfio: Avoid disabling and enabling vectors
 repeatedly in VFIO migration"
Date: Thu, 9 Sep 2021 14:06:12 +0800
Message-ID: <20210909060613.2815-9-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20210909060613.2815-1-longpeng2@huawei.com>
References: <20210909060613.2815-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml100016.china.huawei.com (7.185.36.216)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=longpeng2@huawei.com;
 helo=szxga02-in.huawei.com
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
Cc: chenjiashang@huawei.com, mst@redhat.com, qemu-devel@nongnu.org,
 arei.gonglei@huawei.com, "Longpeng\(Mike\)" <longpeng2@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit ecebe53fe993 ("vfio: Avoid disabling and enabling vectors
repeatedly in VFIO migration") avoid inefficiently disabling and
enabling vectors repeatedly and let the unmasked vectors to be
enabled one by one.

But we want to batch multiple routes and defer the commit, and only
commit once out side the loop of setting vector notifiers, so we
cannot to enable the vectors one by one in the loop now.

Revert that commit and we will take another way in the next patch,
it can not only avoid disabling/enabling vectors repeatedly, but
also satisfy our requirement of defer to commit.

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
---
 hw/vfio/pci.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index dda60a5..4aedb5a 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -608,9 +608,6 @@ static void vfio_commit_kvm_msi_virq(VFIOPCIDevice *vdev)
 
 static void vfio_msix_enable(VFIOPCIDevice *vdev)
 {
-    PCIDevice *pdev = &vdev->pdev;
-    unsigned int nr, max_vec = 0;
-
     vfio_disable_interrupts(vdev);
 
     vdev->msi_vectors = g_new0(VFIOMSIVector, vdev->msix->entries);
@@ -629,22 +626,11 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
      * triggering to userspace, then immediately release the vector, leaving
      * the physical device with no vectors enabled, but MSI-X enabled, just
      * like the guest view.
-     * If there are already unmasked vectors (in migration resume phase and
-     * some guest startups) which will be enabled soon, we can allocate all
-     * of them here to avoid inefficiently disabling and enabling vectors
-     * repeatedly later.
      */
-    if (!pdev->msix_function_masked) {
-        for (nr = 0; nr < msix_nr_vectors_allocated(pdev); nr++) {
-            if (!msix_is_masked(pdev, nr)) {
-                max_vec = nr;
-            }
-        }
-    }
-    vfio_msix_vector_do_use(pdev, max_vec, NULL, NULL);
-    vfio_msix_vector_release(pdev, max_vec);
+    vfio_msix_vector_do_use(&vdev->pdev, 0, NULL, NULL);
+    vfio_msix_vector_release(&vdev->pdev, 0);
 
-    if (msix_set_vector_notifiers(pdev, vfio_msix_vector_use,
+    if (msix_set_vector_notifiers(&vdev->pdev, vfio_msix_vector_use,
                                   vfio_msix_vector_release, NULL)) {
         error_report("vfio: msix_set_vector_notifiers failed");
     }
-- 
1.8.3.1


