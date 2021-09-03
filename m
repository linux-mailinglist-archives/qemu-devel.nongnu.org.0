Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82993FFD56
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:41:16 +0200 (CEST)
Received: from localhost ([::1]:59114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5hD-0005Vc-VS
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1mM5cq-0006iY-48
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:36:44 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1mM5co-0006oj-3K
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:36:43 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4H1CMs4jJqzYwyJ;
 Fri,  3 Sep 2021 17:35:53 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 3 Sep 2021 17:36:38 +0800
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Fri, 3 Sep 2021 17:36:37 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>, Eric Auger
 <eric.auger@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH 2/2] vfio/common: Add trace point when a MMIO RAM section less
 than PAGE_SIZE
Date: Fri, 3 Sep 2021 17:36:11 +0800
Message-ID: <20210903093611.1159-3-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20210903093611.1159-1-jiangkunkun@huawei.com>
References: <20210903093611.1159-1-jiangkunkun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=jiangkunkun@huawei.com; helo=szxga01-in.huawei.com
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
Cc: wanghaibin.wang@huawei.com, Kunkun Jiang <jiangkunkun@huawei.com>,
 tangnianyao@huawei.com, ganqixin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MSI-X structures of some devices and other non-MSI-X structures
are in the same BAR. They may share one host page, especially in the
case of large page granularity, suck as 64K.

For example, MSIX-Table size of 82599 NIC is 0x30 and the offset in
Bar 3(size 64KB) is 0x0. If host page size is 64KB.
vfio_listenerregion_add() will be called to map the remaining range
(0x30-0xffff). And it will return early at
'int128_ge((int128_make64(iova), llend))' and hasn't any message.
Let's add a trace point to informed users like 5c08600547c did.

Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 hw/vfio/common.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 8728d4d5c2..2fc6213c0f 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -892,6 +892,13 @@ static void vfio_listener_region_add(MemoryListener *listener,
     llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask));
 
     if (int128_ge(int128_make64(iova), llend)) {
+        if (memory_region_is_ram_device(section->mr)) {
+            trace_vfio_listener_region_add_no_dma_map(
+                memory_region_name(section->mr),
+                section->offset_within_address_space,
+                int128_getlo(section->size),
+                qemu_real_host_page_size);
+        }
         return;
     }
     end = int128_get64(int128_sub(llend, int128_one()));
-- 
2.23.0


