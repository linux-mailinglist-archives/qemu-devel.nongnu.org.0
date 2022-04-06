Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D4D4F57C9
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 10:33:55 +0200 (CEST)
Received: from localhost ([::1]:58194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc16w-0004Fy-Ir
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 04:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1nc0u9-0003mf-3y
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 04:20:42 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:3862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1nc0u4-0001Jz-W2
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 04:20:40 -0400
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KYHW01ByCz1HBW4;
 Wed,  6 Apr 2022 16:19:56 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 kwepemi500016.china.huawei.com (7.221.188.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 6 Apr 2022 16:20:22 +0800
To: <alex.williamson@redhat.com>
CC: <qemu-devel@nongnu.org>, <linuxarm@huawei.com>, Xiang Chen
 <chenxiang66@hisilicon.com>
Subject: [PATCH] hw/vfio/common: Fix a small boundary issue of a trace
Date: Wed, 6 Apr 2022 16:14:49 +0800
Message-ID: <1649232889-191210-1-git-send-email-chenxiang66@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=chenxiang66@hisilicon.com; helo=szxga08-in.huawei.com
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

Right now the trace of vfio_region_sparse_mmap_entry is as follows:
vfio_region_sparse_mmap_entry sparse entry 0 [0x1000 - 0x9000]
Actually the range it wants to show is [0x1000 - 0x8fff]，so fix it.

Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
---
 hw/vfio/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 080046e3f5..0b3808caf8 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1546,7 +1546,7 @@ static int vfio_setup_region_sparse_mmaps(VFIORegion *region,
     for (i = 0, j = 0; i < sparse->nr_areas; i++) {
         trace_vfio_region_sparse_mmap_entry(i, sparse->areas[i].offset,
                                             sparse->areas[i].offset +
-                                            sparse->areas[i].size);
+                                            sparse->areas[i].size - 1);
 
         if (sparse->areas[i].size) {
             region->mmaps[j].offset = sparse->areas[i].offset;
-- 
2.33.0


