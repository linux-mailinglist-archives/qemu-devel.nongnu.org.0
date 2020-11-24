Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832EF2C2A67
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 15:51:52 +0100 (CET)
Received: from localhost ([::1]:52112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khZfb-0000Lr-KE
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 09:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1khZdf-0007Nv-Gm; Tue, 24 Nov 2020 09:49:51 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1khZdc-0004tW-Tn; Tue, 24 Nov 2020 09:49:51 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CgRk809jJzhfCf;
 Tue, 24 Nov 2020 22:49:20 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Tue, 24 Nov 2020
 22:49:32 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <mst@redhat.com>, <raphael.norwitz@nutanix.com>
Subject: [PATCH] vhost-user-scsi: Fix memleaks in vus_proc_req()
Date: Tue, 24 Nov 2020 14:37:27 +0000
Message-ID: <20201124143727.47037-1-alex.chen@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
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
Cc: alex.chen@huawei.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'elem' is allocated memory in vu_queue_pop(), and it's memory should be
freed in all error branchs after vu_queue_pop().
In addition, in order to free 'elem' memory outside of while(1) loop, move the
definition of 'elem' to the begin of vus_proc_req().

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 contrib/vhost-user-scsi/vhost-user-scsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-user-scsi/vhost-user-scsi.c
index 0f9ba4b2a2..4639440a70 100644
--- a/contrib/vhost-user-scsi/vhost-user-scsi.c
+++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
@@ -232,6 +232,7 @@ static void vus_proc_req(VuDev *vu_dev, int idx)
     VugDev *gdev;
     VusDev *vdev_scsi;
     VuVirtq *vq;
+    VuVirtqElement *elem = NULL;
 
     assert(vu_dev);
 
@@ -248,7 +249,6 @@ static void vus_proc_req(VuDev *vu_dev, int idx)
     g_debug("Got kicked on vq[%d]@%p", idx, vq);
 
     while (1) {
-        VuVirtqElement *elem;
         VirtIOSCSICmdReq *req;
         VirtIOSCSICmdResp *rsp;
 
@@ -288,6 +288,7 @@ static void vus_proc_req(VuDev *vu_dev, int idx)
 
         free(elem);
     }
+    free(elem);
 }
 
 static void vus_queue_set_started(VuDev *vu_dev, int idx, bool started)
-- 
2.19.1


