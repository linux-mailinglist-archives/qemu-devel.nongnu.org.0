Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 016B62DAD58
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 13:34:26 +0100 (CET)
Received: from localhost ([::1]:34626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp9X7-0001Rr-0z
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 07:34:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kp9Te-0007lc-EA; Tue, 15 Dec 2020 07:30:50 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kp9TZ-0006vK-F8; Tue, 15 Dec 2020 07:30:50 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CwHdf4lLxzhsTL;
 Tue, 15 Dec 2020 20:29:58 +0800 (CST)
Received: from localhost (10.174.184.155) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.498.0; Tue, 15 Dec 2020
 20:30:28 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 7/7] virtio_blk: Add support for retry on errors
Date: Tue, 15 Dec 2020 20:30:11 +0800
Message-ID: <20201215123011.4048-8-cenjiahui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201215123011.4048-1-cenjiahui@huawei.com>
References: <20201215123011.4048-1-cenjiahui@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=cenjiahui@huawei.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, cenjiahui@huawei.com,
 zhang.zhanghailiang@huawei.com, qemu-block@nongnu.org, "Michael S.
 Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 fangying1@huawei.com, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Insert failed requests into device's list for later retry and handle
queued requests to implement retry_request_cb.

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 hw/block/virtio-blk.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index bac2d6fa2b..cf8b350eaf 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -108,6 +108,10 @@ static int virtio_blk_handle_rw_error(VirtIOBlockReq *req, int error,
             block_acct_failed(blk_get_stats(s->blk), &req->acct);
         }
         virtio_blk_free_request(req);
+    } else if (action == BLOCK_ERROR_ACTION_RETRY) {
+        req->mr_next = NULL;
+        req->next = s->rq;
+        s->rq = req;
     }
 
     blk_error_action(s->blk, action, is_read, error);
@@ -149,6 +153,7 @@ static void virtio_blk_rw_complete(void *opaque, int ret)
             }
         }
 
+        blk_error_retry_reset_timeout(s->blk);
         virtio_blk_req_complete(req, VIRTIO_BLK_S_OK);
         block_acct_done(blk_get_stats(s->blk), &req->acct);
         virtio_blk_free_request(req);
@@ -828,12 +833,12 @@ static void virtio_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
 
 void virtio_blk_process_queued_requests(VirtIOBlock *s, bool is_bh)
 {
-    VirtIOBlockReq *req = s->rq;
+    VirtIOBlockReq *req;
     MultiReqBuffer mrb = {};
 
-    s->rq = NULL;
-
     aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
+    req = s->rq;
+    s->rq = NULL;
     while (req) {
         VirtIOBlockReq *next = req->next;
         if (virtio_blk_handle_request(req, &mrb)) {
@@ -1134,8 +1139,16 @@ static void virtio_blk_resize(void *opaque)
     aio_bh_schedule_oneshot(qemu_get_aio_context(), virtio_resize_cb, vdev);
 }
 
+static void virtio_blk_retry_request(void *opaque)
+{
+    VirtIOBlock *s = VIRTIO_BLK(opaque);
+
+    virtio_blk_process_queued_requests(s, false);
+}
+
 static const BlockDevOps virtio_block_ops = {
     .resize_cb = virtio_blk_resize,
+    .retry_request_cb = virtio_blk_retry_request,
 };
 
 static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
-- 
2.28.0


