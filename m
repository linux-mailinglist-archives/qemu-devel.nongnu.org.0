Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 160C141292A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 01:04:23 +0200 (CEST)
Received: from localhost ([::1]:45990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSSKk-0007Jl-5F
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 19:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mSSIn-0005HI-Li
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:02:21 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mSSIk-0004bd-V4
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:02:21 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HD0MX5kWLzbmdX;
 Tue, 21 Sep 2021 06:58:00 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 21 Sep 2021 07:02:11 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 21 Sep 2021 07:02:10 +0800
From: "Longpeng(Mike)" <longpeng2@huawei.com>
To: <alex.williamson@redhat.com>, <philmd@redhat.com>, <pbonzini@redhat.com>, 
 <marcel.apfelbaum@gmail.com>, <mst@redhat.com>
Subject: [PATCH v3 3/9] vfio: simplify the failure path in vfio_msi_enable
Date: Tue, 21 Sep 2021 07:01:56 +0800
Message-ID: <20210920230202.1439-4-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20210920230202.1439-1-longpeng2@huawei.com>
References: <20210920230202.1439-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml100016.china.huawei.com (7.185.36.216)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
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
Cc: chenjiashang@huawei.com, "Longpeng\(Mike\)" <longpeng2@huawei.com>,
 arei.gonglei@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use vfio_msi_disable_common to simplify the error handling
in vfio_msi_enable.

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
---
 hw/vfio/pci.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 1e6797fd4b..8e97ca93cf 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -47,6 +47,7 @@
 
 static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
 static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled);
+static void vfio_msi_disable_common(VFIOPCIDevice *vdev);
 
 /*
  * Disabling BAR mmaping can be slow, but toggling it around INTx can
@@ -655,24 +656,12 @@ retry:
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
+        vfio_msi_disable_common(vdev);
 
         if (ret > 0) {
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
-- 
2.23.0


