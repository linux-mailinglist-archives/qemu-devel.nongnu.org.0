Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B73292941
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 16:26:15 +0200 (CEST)
Received: from localhost ([::1]:56808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUW74-0003WZ-HU
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 10:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhengui@huawei.com>)
 id 1kUW41-0000oE-LW; Mon, 19 Oct 2020 10:23:05 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:53842 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhengui@huawei.com>)
 id 1kUW3z-0004Jt-OY; Mon, 19 Oct 2020 10:23:05 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id BC53CD0ADD4CB2B86550;
 Mon, 19 Oct 2020 22:22:55 +0800 (CST)
Received: from DESKTOP-80C7KIU.china.huawei.com (10.174.187.210) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Mon, 19 Oct 2020 22:22:47 +0800
From: Zhengui li <lizhengui@huawei.com>
To: <pbonzini@redhat.com>, <stefanha@redhat.com>, <mreitz@redhat.com>,
 <kwolf@redhat.com>
Subject: [PATCH] vhost-user: fix incorrect print type
Date: Mon, 19 Oct 2020 14:22:44 +0000
Message-ID: <1603117364-21480-1-git-send-email-lizhengui@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.210]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=lizhengui@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 08:40:50
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: xieyingtai@huawei.com, lizhengui@huawei.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The type of input variable is unsigned int
while the printer type is int. So fix incorrect print type.

Signed-off-by: Zhengui li <lizhengui@huawei.com>
---
 hw/virtio/vhost-user.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 9c5b4f7..db563bd 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -308,7 +308,7 @@ static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
     /* validate message size is sane */
     if (msg->hdr.size > VHOST_USER_PAYLOAD_SIZE) {
         error_report("Failed to read msg header."
-                " Size %d exceeds the maximum %zu.", msg->hdr.size,
+                " Size %u exceeds the maximum %zu.", msg->hdr.size,
                 VHOST_USER_PAYLOAD_SIZE);
         return -1;
     }
@@ -319,7 +319,7 @@ static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
         r = qemu_chr_fe_read_all(chr, p, size);
         if (r != size) {
             error_report("Failed to read msg payload."
-                         " Read %d instead of %d.", r, msg->hdr.size);
+                         " Read %d instead of %u.", r, msg->hdr.size);
             return -1;
         }
     }
@@ -740,7 +740,7 @@ static int send_add_regions(struct vhost_dev *dev,
                  */
                 if (msg_reply.hdr.size != msg->hdr.size) {
                     error_report("%s: Unexpected size for postcopy reply "
-                                 "%d vs %d", __func__, msg_reply.hdr.size,
+                                 "%u vs %u", __func__, msg_reply.hdr.size,
                                  msg->hdr.size);
                     return -1;
                 }
@@ -905,7 +905,7 @@ static int vhost_user_set_mem_table_postcopy(struct vhost_dev *dev,
          */
         if (msg_reply.hdr.size != msg.hdr.size) {
             error_report("%s: Unexpected size for postcopy reply "
-                         "%d vs %d", __func__, msg_reply.hdr.size,
+                         "%u vs %u", __func__, msg_reply.hdr.size,
                          msg.hdr.size);
             return -1;
         }
@@ -1445,7 +1445,7 @@ static void slave_read(void *opaque)
 
     if (hdr.size > VHOST_USER_PAYLOAD_SIZE) {
         error_report("Failed to read msg header."
-                " Size %d exceeds the maximum %zu.", hdr.size,
+                " Size %u exceeds the maximum %zu.", hdr.size,
                 VHOST_USER_PAYLOAD_SIZE);
         goto err;
     }
-- 
1.8.3.1


