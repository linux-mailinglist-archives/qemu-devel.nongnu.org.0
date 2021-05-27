Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA5D392E61
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 14:53:00 +0200 (CEST)
Received: from localhost ([::1]:38804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmFVT-0006y0-OE
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 08:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lmFAx-000416-2d
 for qemu-devel@nongnu.org; Thu, 27 May 2021 08:31:48 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lmFAs-0004SO-Lp
 for qemu-devel@nongnu.org; Thu, 27 May 2021 08:31:46 -0400
Received: from dggeml701-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FrRtq2yYqz67gr;
 Thu, 27 May 2021 20:28:35 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggeml701-chm.china.huawei.com (10.3.17.134) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 27 May 2021 20:31:28 +0800
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 27 May 2021 20:31:27 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [PATCH] vfio: Fix unregister SaveVMHandler in vfio_migration_finalize
Date: Thu, 27 May 2021 20:31:01 +0800
Message-ID: <20210527123101.289-1-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=jiangkunkun@huawei.com; helo=szxga02-in.huawei.com
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Kunkun Jiang <jiangkunkun@huawei.com>, Keqian Zhu <zhukeqian1@huawei.com>,
 ganqixin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the vfio_migration_init(), the SaveVMHandler is registered for
VFIO device. But it lacks the operation of 'unregister'. It will
lead to 'Segmentation fault (core dumped)' in
qemu_savevm_state_setup(), if performing live migration after a
VFIO device is hot deleted.

Fixes: 7c2f5f75f94 (vfio: Register SaveVMHandlers for VFIO device)
Reported-by: Qixin Gan <ganqixin@huawei.com>
Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 hw/vfio/migration.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 201642d75e..ef397ebe6c 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -892,6 +892,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
 
         remove_migration_state_change_notifier(&migration->migration_state);
         qemu_del_vm_change_state_handler(migration->vm_state);
+        unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
         vfio_migration_exit(vbasedev);
     }
 
-- 
2.23.0


