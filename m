Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD8A6567CB
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 08:22:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pA4Gc-0004lY-8x; Tue, 27 Dec 2022 02:20:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1pA4GM-0004hB-8G
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 02:20:38 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1pA4GI-000790-36
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 02:20:36 -0500
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Nh5YV4JTVzJpVH;
 Tue, 27 Dec 2022 15:16:30 +0800 (CST)
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 27 Dec 2022 15:20:21 +0800
To: <stefanha@redhat.com>, <mst@redhat.com>, <jasowang@redhat.com>,
 <philmd@linaro.org>
CC: <cohuck@redhat.com>, <sgarzare@redhat.com>, <pbonzini@redhat.com>,
 <arei.gonglei@huawei.com>, <yechuan@huawei.com>, <huangzhichao@huawei.com>,
 <qemu-devel@nongnu.org>, Longpeng <longpeng2@huawei.com>
Subject: [PATCH v3 3/3] vdpa: commit all host notifier MRs in a single MR
 transaction
Date: Tue, 27 Dec 2022 15:20:15 +0800
Message-ID: <20221227072015.3134-4-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20221227072015.3134-1-longpeng2@huawei.com>
References: <20221227072015.3134-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi100025.china.huawei.com (7.221.188.158)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189; envelope-from=longpeng2@huawei.com;
 helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  "Longpeng(Mike)" <longpeng2@huawei.com>
From:  "Longpeng(Mike)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Longpeng <longpeng2@huawei.com>

This allows the vhost-vdpa device to batch the setup of all its MRs of
host notifiers.

This significantly reduces the device starting time, e.g. the time spend
on setup the host notifier MRs reduce from 423ms to 32ms for a VM with
64 vCPUs and 3 vhost-vDPA generic devices (vdpa_sim_blk, 64vq per device).

Signed-off-by: Longpeng <longpeng2@huawei.com>
---
 hw/virtio/vhost-vdpa.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index fd0c33b0e1..870265188a 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -512,9 +512,18 @@ static void vhost_vdpa_host_notifiers_uninit(struct vhost_dev *dev, int n)
 {
     int i;
 
+    /*
+     * Pack all the changes to the memory regions in a single
+     * transaction to avoid a few updating of the address space
+     * topology.
+     */
+    memory_region_transaction_begin();
+
     for (i = dev->vq_index; i < dev->vq_index + n; i++) {
         vhost_vdpa_host_notifier_uninit(dev, i);
     }
+
+    memory_region_transaction_commit();
 }
 
 static void vhost_vdpa_host_notifiers_init(struct vhost_dev *dev)
@@ -527,17 +536,21 @@ static void vhost_vdpa_host_notifiers_init(struct vhost_dev *dev)
         return;
     }
 
+    /*
+     * Pack all the changes to the memory regions in a single
+     * transaction to avoid a few updating of the address space
+     * topology.
+     */
+    memory_region_transaction_begin();
+
     for (i = dev->vq_index; i < dev->vq_index + dev->nvqs; i++) {
         if (vhost_vdpa_host_notifier_init(dev, i)) {
-            goto err;
+            vhost_vdpa_host_notifiers_uninit(dev, i - dev->vq_index);
+            break;
         }
     }
 
-    return;
-
-err:
-    vhost_vdpa_host_notifiers_uninit(dev, i - dev->vq_index);
-    return;
+    memory_region_transaction_commit();
 }
 
 static void vhost_vdpa_svq_cleanup(struct vhost_dev *dev)
-- 
2.23.0


