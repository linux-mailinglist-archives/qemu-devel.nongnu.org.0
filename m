Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3A6453DEF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 02:56:02 +0100 (CET)
Received: from localhost ([::1]:36444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnAB7-0001EG-Ku
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 20:56:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1mnA8t-0000ES-6H; Tue, 16 Nov 2021 20:53:43 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1mnA8q-0000Yq-E9; Tue, 16 Nov 2021 20:53:42 -0500
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Hv5W527klzZd6N;
 Wed, 17 Nov 2021 09:51:13 +0800 (CST)
Received: from kwepemm600002.china.huawei.com (7.193.23.29) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 17 Nov 2021 09:53:28 +0800
Received: from localhost.localdomain (10.175.101.6) by
 kwepemm600002.china.huawei.com (7.193.23.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 17 Nov 2021 09:53:27 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-devel@nongnu.org>, <alex.williamson@redhat.com>
Subject: [PATCH v2] vfio: Fix memory leak of hostwin
Date: Wed, 17 Nov 2021 09:47:39 +0800
Message-ID: <20211117014739.1839263-1-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600002.china.huawei.com (7.193.23.29)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=liangpeng10@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: zhengchuan@huawei.com, liangpeng10@huawei.com, wanghao232@huawei.com,
 qemu-stable@nongnu.org, xiexiangyou@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

hostwin is allocated and added to hostwin_list in vfio_host_win_add, but
it is only deleted from hostwin_list in vfio_host_win_del, which causes
a memory leak.  Also, freeing all elements in hostwin_list is missing in
vfio_disconnect_container.

Fix: 2e4109de8e58 ("vfio/spapr: Create DMA window dynamically (SPAPR IOMMU v2)")
CC: qemu-stable@nongnu.org
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
v1 -> v2:
- Don't change to _SAFE variant in vfio_host_win_del. [Alex]
---
 hw/vfio/common.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index dd387b0d3959..080046e3f511 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -551,6 +551,7 @@ static int vfio_host_win_del(VFIOContainer *container, hwaddr min_iova,
     QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
         if (hostwin->min_iova == min_iova && hostwin->max_iova == max_iova) {
             QLIST_REMOVE(hostwin, hostwin_next);
+            g_free(hostwin);
             return 0;
         }
     }
@@ -2239,6 +2240,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
     if (QLIST_EMPTY(&container->group_list)) {
         VFIOAddressSpace *space = container->space;
         VFIOGuestIOMMU *giommu, *tmp;
+        VFIOHostDMAWindow *hostwin, *next;
 
         QLIST_REMOVE(container, next);
 
@@ -2249,6 +2251,12 @@ static void vfio_disconnect_container(VFIOGroup *group)
             g_free(giommu);
         }
 
+        QLIST_FOREACH_SAFE(hostwin, &container->hostwin_list, hostwin_next,
+                           next) {
+            QLIST_REMOVE(hostwin, hostwin_next);
+            g_free(hostwin);
+        }
+
         trace_vfio_disconnect_container(container->fd);
         close(container->fd);
         g_free(container);
-- 
2.33.1


