Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F101E27E592
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 11:49:11 +0200 (CEST)
Received: from localhost ([::1]:49532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNYjX-0008In-15
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 05:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kNYhM-00071P-ON
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 05:46:56 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:38500 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kNYhK-0003nw-Sb
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 05:46:56 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 34EF048E18F327774F91;
 Wed, 30 Sep 2020 17:46:48 +0800 (CST)
Received: from localhost (10.174.186.107) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Wed, 30 Sep 2020
 17:46:41 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH v2 1/8] block-backend: introduce I/O rehandle info
Date: Wed, 30 Sep 2020 17:45:59 +0800
Message-ID: <20200930094606.5323-2-cenjiahui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200930094606.5323-1-cenjiahui@huawei.com>
References: <20200930094606.5323-1-cenjiahui@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.107]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=cenjiahui@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 05:46:49
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
Cc: kwolf@redhat.com, fangying1@huawei.com, cenjiahui@huawei.com,
 zhang.zhanghailiang@huawei.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The I/O hang feature is realized based on a rehandle mechanism.
Each block backend will have a list to store hanging block AIOs,
and a timer to regularly resend these aios. In order to issue
the AIOs again, each block AIOs also need to store its coroutine entry.

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 block/block-backend.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/block/block-backend.c b/block/block-backend.c
index ce78d30794..b8367d82cc 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -35,6 +35,18 @@
 
 static AioContext *blk_aiocb_get_aio_context(BlockAIOCB *acb);
 
+/* block backend rehandle timer interval 5s */
+#define BLOCK_BACKEND_REHANDLE_TIMER_INTERVAL   5000
+
+typedef struct BlockBackendRehandleInfo {
+    bool enable;
+    QEMUTimer *ts;
+    unsigned timer_interval_ms;
+
+    unsigned int in_flight;
+    QTAILQ_HEAD(, BlkAioEmAIOCB) re_aios;
+} BlockBackendRehandleInfo;
+
 typedef struct BlockBackendAioNotifier {
     void (*attached_aio_context)(AioContext *new_context, void *opaque);
     void (*detach_aio_context)(void *opaque);
@@ -95,6 +107,8 @@ struct BlockBackend {
      * Accessed with atomic ops.
      */
     unsigned int in_flight;
+
+    BlockBackendRehandleInfo reinfo;
 };
 
 typedef struct BlockBackendAIOCB {
@@ -350,6 +364,7 @@ BlockBackend *blk_new(AioContext *ctx, uint64_t perm, uint64_t shared_perm)
     qemu_co_queue_init(&blk->queued_requests);
     notifier_list_init(&blk->remove_bs_notifiers);
     notifier_list_init(&blk->insert_bs_notifiers);
+
     QLIST_INIT(&blk->aio_notifiers);
 
     QTAILQ_INSERT_TAIL(&block_backends, blk, link);
@@ -1392,6 +1407,10 @@ typedef struct BlkAioEmAIOCB {
     BlkRwCo rwco;
     int bytes;
     bool has_returned;
+
+    /* for rehandle */
+    CoroutineEntry *co_entry;
+    QTAILQ_ENTRY(BlkAioEmAIOCB) list;
 } BlkAioEmAIOCB;
 
 static AioContext *blk_aio_em_aiocb_get_aio_context(BlockAIOCB *acb_)
-- 
2.28.0


