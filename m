Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A964531B9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 13:04:44 +0100 (CET)
Received: from localhost ([::1]:60418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmxCd-0003KP-CW
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 07:04:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1mmxAH-0001l7-So; Tue, 16 Nov 2021 07:02:17 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:2899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1mmxAB-0004md-Qg; Tue, 16 Nov 2021 07:02:17 -0500
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Htl3d4Wssz1DJWp;
 Tue, 16 Nov 2021 19:59:41 +0800 (CST)
Received: from kwepemm600002.china.huawei.com (7.193.23.29) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 16 Nov 2021 20:01:52 +0800
Received: from localhost.localdomain (10.175.101.6) by
 kwepemm600002.china.huawei.com (7.193.23.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Tue, 16 Nov 2021 20:01:51 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-devel@nongnu.org>, <alex.williamson@redhat.com>
Subject: [PATCH] vfio: Fix memory leak of hostwin
Date: Tue, 16 Nov 2021 19:56:26 +0800
Message-ID: <20211116115626.1627186-1-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600002.china.huawei.com (7.193.23.29)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=liangpeng10@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 hw/vfio/common.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index dd387b0d3959..2cce60c5fac3 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -546,11 +546,12 @@ static void vfio_host_win_add(VFIOContainer *container,
 static int vfio_host_win_del(VFIOContainer *container, hwaddr min_iova,
                              hwaddr max_iova)
 {
-    VFIOHostDMAWindow *hostwin;
+    VFIOHostDMAWindow *hostwin, *next;
 
-    QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
+    QLIST_FOREACH_SAFE(hostwin, &container->hostwin_list, hostwin_next, next) {
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


