Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F0C56D2B6
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 03:48:46 +0200 (CEST)
Received: from localhost ([::1]:36446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAiXV-00042V-2Y
	for lists+qemu-devel@lfdr.de; Sun, 10 Jul 2022 21:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1oAiWH-0002hG-WA
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 21:47:30 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1oAiWF-0003YS-Ek
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 21:47:29 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Lh6Cn5v8BzlVtQ;
 Mon, 11 Jul 2022 09:45:41 +0800 (CST)
Received: from kwepemm600007.china.huawei.com (7.193.23.208) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 11 Jul 2022 09:47:08 +0800
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 11 Jul 2022 09:47:07 +0800
To: Alex Williamson <alex.williamson@redhat.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <wanghaibin.wang@huawei.com>, <yuzenghui@huawei.com>, Kunkun Jiang
 <jiangkunkun@huawei.com>
Subject: [PATCH] vfio/migration: Fix incorrect initialization value for
 parameters in VFIOMigration
Date: Mon, 11 Jul 2022 09:46:51 +0800
Message-ID: <20220711014651.1327-1-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=jiangkunkun@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Kunkun Jiang <jiangkunkun@huawei.com>
From:  Kunkun Jiang via <qemu-devel@nongnu.org>

The structure VFIOMigration of a VFIODevice is allocated and initialized
in vfio_migration_init(). "device_state" and "vm_running" are initialized
to 0, indicating that VFIO device is_STOP and VM is not-running. The
initialization value is incorrect. According to the agreement, default
state of VFIO device is _RUNNING. And if a VFIO device is hot-plugged
while the VM is running, "vm_running" should be 1. This patch fixes it.

Fixes: 02a7e71b1e5 (vfio: Add VM state change handler to know state of VM)
Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 hw/vfio/migration.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index a6ad1f8945..3de4252111 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -806,6 +806,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
     }
 
     vbasedev->migration = g_new0(VFIOMigration, 1);
+    vbasedev->migration->device_state = VFIO_DEVICE_STATE_RUNNING;
+    vbasedev->migration->vm_running = runstate_is_running();
 
     ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
                             info->index, "migration");
-- 
2.27.0


