Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63469295F60
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 15:07:58 +0200 (CEST)
Received: from localhost ([::1]:54574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVaJx-00087q-Du
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 09:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kVaG2-0004tQ-5S; Thu, 22 Oct 2020 09:03:54 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5203 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kVaFx-0000g6-MB; Thu, 22 Oct 2020 09:03:53 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 134122B5CC07D50BF9A1;
 Thu, 22 Oct 2020 21:03:38 +0800 (CST)
Received: from localhost (10.174.184.155) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Thu, 22 Oct 2020
 21:03:29 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>, <kwolf@redhat.com>, <mreitz@redhat.com>,
 <eblake@redhat.com>
Subject: [PATCH v3 1/9] block-backend: introduce I/O rehandle info
Date: Thu, 22 Oct 2020 21:02:55 +0800
Message-ID: <20201022130303.1092-2-cenjiahui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201022130303.1092-1-cenjiahui@huawei.com>
References: <20201022130303.1092-1-cenjiahui@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=cenjiahui@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 09:03:38
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
2.19.1


