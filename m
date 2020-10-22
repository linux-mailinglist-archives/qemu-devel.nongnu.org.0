Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E09C295F67
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 15:09:22 +0200 (CEST)
Received: from localhost ([::1]:60798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVaLJ-0002D6-IK
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 09:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kVaG3-0004ul-0p; Thu, 22 Oct 2020 09:03:55 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:57164 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kVaFx-0000gG-M9; Thu, 22 Oct 2020 09:03:54 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id B751AA64C74A8280319E;
 Thu, 22 Oct 2020 21:03:38 +0800 (CST)
Received: from localhost (10.174.184.155) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Thu, 22 Oct 2020
 21:03:31 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>, <kwolf@redhat.com>, <mreitz@redhat.com>,
 <eblake@redhat.com>
Subject: [PATCH v3 4/9] block-backend: add I/O rehandle pause/unpause
Date: Thu, 22 Oct 2020 21:02:58 +0800
Message-ID: <20201022130303.1092-5-cenjiahui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201022130303.1092-1-cenjiahui@huawei.com>
References: <20201022130303.1092-1-cenjiahui@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=cenjiahui@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 09:03:40
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
Cc: cenjiahui@huawei.com, zhang.zhanghailiang@huawei.com, qemu-block@nongnu.org,
 stefanha@redhat.com, fangying1@huawei.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sometimes there is no need to rehandle AIOs although I/O hang is enabled. For
example, when deleting a block backend, we have to wait AIO completed by calling
blk_drain(), but not care about the results. So a pause interface of I/O hang
is helpful to bypass the rehandle mechanism.

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 block/block-backend.c          | 60 +++++++++++++++++++++++++++++++---
 include/sysemu/block-backend.h |  2 ++
 2 files changed, 58 insertions(+), 4 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 90fcc678b5..c16d95a2c9 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -37,6 +37,9 @@ static AioContext *blk_aiocb_get_aio_context(BlockAIOCB *acb);
 
 /* block backend rehandle timer interval 5s */
 #define BLOCK_BACKEND_REHANDLE_TIMER_INTERVAL   5000
+#define BLOCK_BACKEND_REHANDLE_NORMAL           1
+#define BLOCK_BACKEND_REHANDLE_DRAIN_REQUESTED  2
+#define BLOCK_BACKEND_REHANDLE_DRAINED          3
 
 enum BlockIOHangStatus {
     BLOCK_IO_HANG_STATUS_NORMAL = 0,
@@ -50,6 +53,8 @@ typedef struct BlockBackendRehandleInfo {
 
     unsigned int in_flight;
     QTAILQ_HEAD(, BlkAioEmAIOCB) re_aios;
+
+    int status;
 } BlockBackendRehandleInfo;
 
 typedef struct BlockBackendAioNotifier {
@@ -2461,6 +2466,51 @@ static void blk_rehandle_remove_aiocb(BlockBackend *blk, BlkAioEmAIOCB *acb)
     qatomic_dec(&blk->reinfo.in_flight);
 }
 
+static void blk_rehandle_drain(BlockBackend *blk)
+{
+    if (blk_bs(blk)) {
+        bdrv_drained_begin(blk_bs(blk));
+        BDRV_POLL_WHILE(blk_bs(blk), qatomic_read(&blk->reinfo.in_flight) > 0);
+        bdrv_drained_end(blk_bs(blk));
+    }
+}
+
+static bool blk_rehandle_is_paused(BlockBackend *blk)
+{
+    return blk->reinfo.status == BLOCK_BACKEND_REHANDLE_DRAIN_REQUESTED ||
+           blk->reinfo.status == BLOCK_BACKEND_REHANDLE_DRAINED;
+}
+
+void blk_rehandle_pause(BlockBackend *blk)
+{
+    BlockBackendRehandleInfo *reinfo = &blk->reinfo;
+
+    aio_context_acquire(blk_get_aio_context(blk));
+    if (!reinfo->enable || reinfo->status == BLOCK_BACKEND_REHANDLE_DRAINED) {
+        aio_context_release(blk_get_aio_context(blk));
+        return;
+    }
+
+    reinfo->status = BLOCK_BACKEND_REHANDLE_DRAIN_REQUESTED;
+    blk_rehandle_drain(blk);
+    reinfo->status = BLOCK_BACKEND_REHANDLE_DRAINED;
+    aio_context_release(blk_get_aio_context(blk));
+}
+
+void blk_rehandle_unpause(BlockBackend *blk)
+{
+    BlockBackendRehandleInfo *reinfo = &blk->reinfo;
+
+    aio_context_acquire(blk_get_aio_context(blk));
+    if (!reinfo->enable || reinfo->status == BLOCK_BACKEND_REHANDLE_NORMAL) {
+        aio_context_release(blk_get_aio_context(blk));
+        return;
+    }
+
+    reinfo->status = BLOCK_BACKEND_REHANDLE_NORMAL;
+    aio_context_release(blk_get_aio_context(blk));
+}
+
 static void blk_rehandle_timer_cb(void *opaque)
 {
     BlockBackend *blk = opaque;
@@ -2560,10 +2610,12 @@ static void blk_rehandle_aio_complete(BlkAioEmAIOCB *acb)
 
     if (acb->has_returned) {
         blk_dec_in_flight(acb->rwco.blk);
-        need_rehandle = blk_rehandle_aio(acb, &has_timeout);
-        if (need_rehandle) {
-            blk_rehandle_insert_aiocb(acb->rwco.blk, acb);
-            return;
+        if (!blk_rehandle_is_paused(acb->rwco.blk)) {
+            need_rehandle = blk_rehandle_aio(acb, &has_timeout);
+            if (need_rehandle) {
+                blk_rehandle_insert_aiocb(acb->rwco.blk, acb);
+                return;
+            }
         }
 
         acb->common.cb(acb->common.opaque, acb->rwco.ret);
diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index bfebe3a960..391a047444 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -268,6 +268,8 @@ const BdrvChild *blk_root(BlockBackend *blk);
 
 int blk_make_empty(BlockBackend *blk, Error **errp);
 
+void blk_rehandle_pause(BlockBackend *blk);
+void blk_rehandle_unpause(BlockBackend *blk);
 void blk_iohang_init(BlockBackend *blk, int64_t iohang_timeout);
 
 #endif
-- 
2.19.1


