Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AA52DAD60
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 13:40:07 +0100 (CET)
Received: from localhost ([::1]:52884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp9cc-0000j6-Em
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 07:40:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kp9Tl-0007uE-8T; Tue, 15 Dec 2020 07:30:57 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kp9Tc-0006ud-Pz; Tue, 15 Dec 2020 07:30:57 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CwHdN6Ql9zkqXY;
 Tue, 15 Dec 2020 20:29:44 +0800 (CST)
Received: from localhost (10.174.184.155) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.498.0; Tue, 15 Dec 2020
 20:30:25 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 2/7] block-backend: Introduce retry timer
Date: Tue, 15 Dec 2020 20:30:06 +0800
Message-ID: <20201215123011.4048-3-cenjiahui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201215123011.4048-1-cenjiahui@huawei.com>
References: <20201215123011.4048-1-cenjiahui@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=cenjiahui@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Add a timer to regularly trigger retry on errors.

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 block/block-backend.c | 21 ++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/block/block-backend.c b/block/block-backend.c
index ce78d30794..fe775ea298 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -35,6 +35,9 @@
 
 static AioContext *blk_aiocb_get_aio_context(BlockAIOCB *acb);
 
+/* block backend default retry interval */
+#define BLOCK_BACKEND_DEFAULT_RETRY_INTERVAL   1000
+
 typedef struct BlockBackendAioNotifier {
     void (*attached_aio_context)(AioContext *new_context, void *opaque);
     void (*detach_aio_context)(void *opaque);
@@ -95,6 +98,15 @@ struct BlockBackend {
      * Accessed with atomic ops.
      */
     unsigned int in_flight;
+
+    /* Timer for retry on errors. */
+    QEMUTimer *retry_timer;
+    /* Interval in ms to trigger next retry. */
+    int64_t retry_interval;
+    /* Start time of the first error. Used to check timeout. */
+    int64_t retry_start_time;
+    /* Retry timeout. 0 represents infinite retry. */
+    int64_t retry_timeout;
 };
 
 typedef struct BlockBackendAIOCB {
@@ -345,6 +357,11 @@ BlockBackend *blk_new(AioContext *ctx, uint64_t perm, uint64_t shared_perm)
     blk->on_read_error = BLOCKDEV_ON_ERROR_REPORT;
     blk->on_write_error = BLOCKDEV_ON_ERROR_ENOSPC;
 
+    blk->retry_timer = NULL;
+    blk->retry_interval = BLOCK_BACKEND_DEFAULT_RETRY_INTERVAL;
+    blk->retry_start_time = 0;
+    blk->retry_timeout = 0;
+
     block_acct_init(&blk->stats);
 
     qemu_co_queue_init(&blk->queued_requests);
@@ -456,6 +473,10 @@ static void blk_delete(BlockBackend *blk)
     QTAILQ_REMOVE(&block_backends, blk, link);
     drive_info_del(blk->legacy_dinfo);
     block_acct_cleanup(&blk->stats);
+    if (blk->retry_timer) {
+        timer_del(blk->retry_timer);
+        timer_free(blk->retry_timer);
+    }
     g_free(blk);
 }
 
-- 
2.28.0


