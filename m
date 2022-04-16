Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E96503595
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Apr 2022 11:18:41 +0200 (CEST)
Received: from localhost ([::1]:49726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfeZj-0004Ze-M1
	for lists+qemu-devel@lfdr.de; Sat, 16 Apr 2022 05:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1nfeVT-0002yO-92
 for qemu-devel@nongnu.org; Sat, 16 Apr 2022 05:14:15 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:4507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1nfeVQ-0003iy-0F
 for qemu-devel@nongnu.org; Sat, 16 Apr 2022 05:14:15 -0400
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KgSD23b0xzfYrd;
 Sat, 16 Apr 2022 17:13:22 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 kwepemi500016.china.huawei.com (7.221.188.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 16 Apr 2022 17:14:02 +0800
To: <alex.williamson@redhat.com>, <damien.hedde@greensocs.com>
CC: <linuxarm@huawei.com>, <qemu-devel@nongnu.org>, Xiang Chen
 <chenxiang66@hisilicon.com>
Subject: [PATCH v2] hw/vfio/common: Fix a small boundary issue of a trace
Date: Sat, 16 Apr 2022 17:08:24 +0800
Message-ID: <1650100104-130737-1-git-send-email-chenxiang66@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=chenxiang66@hisilicon.com; helo=szxga01-in.huawei.com
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
Reply-to:  chenxiang <chenxiang66@hisilicon.com>
From:  chenxiang via <qemu-devel@nongnu.org>

From: Xiang Chen <chenxiang66@hisilicon.com>

It uses [offset, offset + size - 1] to indicate that the length of range is
size in most places in vfio trace code (such as
trace_vfio_region_region_mmap()) execpt trace_vfio_region_sparse_mmap_entry().
So change it for trace_vfio_region_sparse_mmap_entry(), but if size is zero,
the trace will be weird with an underflow, so move the trace and trace it 
only if size is not zero.

Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
---
 hw/vfio/common.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 080046e3f5..345ea7bd8a 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1544,11 +1544,10 @@ static int vfio_setup_region_sparse_mmaps(VFIORegion *region,
     region->mmaps = g_new0(VFIOMmap, sparse->nr_areas);
 
     for (i = 0, j = 0; i < sparse->nr_areas; i++) {
-        trace_vfio_region_sparse_mmap_entry(i, sparse->areas[i].offset,
-                                            sparse->areas[i].offset +
-                                            sparse->areas[i].size);
-
         if (sparse->areas[i].size) {
+            trace_vfio_region_sparse_mmap_entry(i, sparse->areas[i].offset,
+                                            sparse->areas[i].offset +
+                                            sparse->areas[i].size - 1);
             region->mmaps[j].offset = sparse->areas[i].offset;
             region->mmaps[j].size = sparse->areas[i].size;
             j++;
-- 
2.33.0


