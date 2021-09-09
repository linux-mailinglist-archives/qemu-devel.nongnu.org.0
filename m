Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B635840457B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 08:13:54 +0200 (CEST)
Received: from localhost ([::1]:35608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mODJp-0007pU-I3
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 02:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mODCk-0004DT-BQ
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 02:06:34 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mODCe-000658-QQ
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 02:06:34 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4H4pQJ1TyQz1DGs8;
 Thu,  9 Sep 2021 14:05:28 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 9 Sep 2021 14:06:20 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 9 Sep 2021 14:06:18 +0800
From: "Longpeng(Mike)" <longpeng2@huawei.com>
To: <alex.williamson@redhat.com>, <philmd@redhat.com>, <pbonzini@redhat.com>
Subject: [PATCH v2 3/9] vfio: simplify the failure path in vfio_msi_enable
Date: Thu, 9 Sep 2021 14:06:07 +0800
Message-ID: <20210909060613.2815-4-longpeng2@huawei.com>
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
Received-SPF: pass client-ip=45.249.212.255; envelope-from=longpeng2@huawei.com;
 helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Use vfio_msi_disable_common to simplify the error handling
in vfio_msi_enable.

Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
---
 hw/vfio/pci.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 1e6797f..8236cd7 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -655,24 +655,12 @@ retry:
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
@@ -680,7 +668,6 @@ retry:
          * out to fall back to INTx for this device.
          */
         error_report("vfio: Error: Failed to enable MSI");
-        vdev->interrupt = VFIO_INT_NONE;
 
         return;
     }
-- 
1.8.3.1


