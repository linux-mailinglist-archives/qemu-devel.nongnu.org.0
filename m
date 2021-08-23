Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5C83F43F1
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 05:31:20 +0200 (CEST)
Received: from localhost ([::1]:33616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI0g6-0004YA-CA
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 23:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mI0eU-0002dR-8S
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 23:29:34 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:33624
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1mI0eR-0000aQ-ET
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 23:29:34 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A75HwBqgu/0VGKV7KBpTqQkuKiHBQXj4ji2hC?=
 =?us-ascii?q?6mlwRA09TySZ//rBoB19726TtN9xYgBYpTnuAsm9qB/nmaKdpLNhWItKPzOW31?=
 =?us-ascii?q?dATrsSjrcKqgeIc0aVm9K1l50QF5SWY+eQMbEVt6nHCXGDYrQdKce8gd2VrNab?=
 =?us-ascii?q?33FwVhtrdq0lyw94DzyQGkpwSBIuP+tDKLOsotpAuyG7eWkaKuCyBnw+VeDFoN?=
 =?us-ascii?q?HR0L38ZxpuPW9c1CC+ySOv9KXhEwWVmjMXUzZ0y78k9mTf1yzVj5/Ty82G9g?=
 =?us-ascii?q?=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.84,343,1620662400"; d="scan'208";a="113303536"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Aug 2021 11:29:28 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 54D7E4D0D9D1;
 Mon, 23 Aug 2021 11:29:28 +0800 (CST)
Received: from G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 23 Aug 2021 11:29:19 +0800
Received: from localhost.localdomain (10.167.225.141) by
 G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.23 via Frontend Transport; Mon, 23 Aug 2021 11:29:17 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH v2 2/2] migration/rdma: advise prefetch write for ODP region
Date: Mon, 23 Aug 2021 11:33:58 +0800
Message-ID: <20210823033358.3002-3-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823033358.3002-1-lizhijian@cn.fujitsu.com>
References: <20210823033358.3002-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: 54D7E4D0D9D1.A1274
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lizhijian@fujitsu.com
Received-SPF: neutral client-ip=183.91.158.132;
 envelope-from=lizhijian@fujitsu.com; helo=heian.cn.fujitsu.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The responder mr registering with ODP will sent RNR NAK back to
the requester in the face of the page fault.
---------
ibv_poll_cq wc.status=13 RNR retry counter exceeded!
ibv_poll_cq wrid=WRITE RDMA!
---------
ibv_advise_mr(3) helps to make pages present before the actual IO is
conducted so that the responder does page fault as little as possible.

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>

---
V2: use IBV_ADVISE_MR_FLAG_FLUSH instead of IB_UVERBS_ADVISE_MR_FLAG_FLUSH
    and add Reviewed-by tag. # Marcel
---
 migration/rdma.c       | 40 ++++++++++++++++++++++++++++++++++++++++
 migration/trace-events |  1 +
 2 files changed, 41 insertions(+)

diff --git a/migration/rdma.c b/migration/rdma.c
index eb80431aae2..6c2cc3f617c 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1133,6 +1133,30 @@ static bool rdma_support_odp(struct ibv_context *dev)
     return false;
 }
 
+/*
+ * ibv_advise_mr to avoid RNR NAK error as far as possible.
+ * The responder mr registering with ODP will sent RNR NAK back to
+ * the requester in the face of the page fault.
+ */
+static void qemu_rdma_advise_prefetch_mr(struct ibv_pd *pd, uint64_t addr,
+                                         uint32_t len,  uint32_t lkey,
+                                         const char *name, bool wr)
+{
+    int ret;
+    int advice = wr ? IBV_ADVISE_MR_ADVICE_PREFETCH_WRITE :
+                 IBV_ADVISE_MR_ADVICE_PREFETCH;
+    struct ibv_sge sg_list = {.lkey = lkey, .addr = addr, .length = len};
+
+    ret = ibv_advise_mr(pd, advice,
+                        IBV_ADVISE_MR_FLAG_FLUSH, &sg_list, 1);
+    /* ignore the error */
+    if (ret) {
+        trace_qemu_rdma_advise_mr(name, len, addr, strerror(errno));
+    } else {
+        trace_qemu_rdma_advise_mr(name, len, addr, "successed");
+    }
+}
+
 static int qemu_rdma_reg_whole_ram_blocks(RDMAContext *rdma)
 {
     int i;
@@ -1156,6 +1180,15 @@ static int qemu_rdma_reg_whole_ram_blocks(RDMAContext *rdma)
                                local->block[i].local_host_addr,
                                local->block[i].length, access);
                 trace_qemu_rdma_register_odp_mr(local->block[i].block_name);
+
+                if (local->block[i].mr) {
+                    qemu_rdma_advise_prefetch_mr(rdma->pd,
+                                    (uintptr_t)local->block[i].local_host_addr,
+                                    local->block[i].length,
+                                    local->block[i].mr->lkey,
+                                    local->block[i].block_name,
+                                    true);
+                }
         }
 
         if (!local->block[i].mr) {
@@ -1255,6 +1288,13 @@ static int qemu_rdma_register_and_get_keys(RDMAContext *rdma,
             /* register ODP mr */
             block->pmr[chunk] = ibv_reg_mr(rdma->pd, chunk_start, len, access);
             trace_qemu_rdma_register_odp_mr(block->block_name);
+
+            if (block->pmr[chunk]) {
+                qemu_rdma_advise_prefetch_mr(rdma->pd, (uintptr_t)chunk_start,
+                                            len, block->pmr[chunk]->lkey,
+                                            block->block_name, rkey);
+
+            }
         }
     }
     if (!block->pmr[chunk]) {
diff --git a/migration/trace-events b/migration/trace-events
index 5f6aa580def..a8ae163707c 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -213,6 +213,7 @@ qemu_rdma_poll_other(const char *compstr, int64_t comp, int left) "other complet
 qemu_rdma_post_send_control(const char *desc) "CONTROL: sending %s.."
 qemu_rdma_register_and_get_keys(uint64_t len, void *start) "Registering %" PRIu64 " bytes @ %p"
 qemu_rdma_register_odp_mr(const char *name) "Try to register On-Demand Paging memory region: %s"
+qemu_rdma_advise_mr(const char *name, uint32_t len, uint64_t addr, const char *res) "Try to advise block %s prefetch at %" PRIu32 "@0x%" PRIx64 ": %s"
 qemu_rdma_registration_handle_compress(int64_t length, int index, int64_t offset) "Zapping zero chunk: %" PRId64 " bytes, index %d, offset %" PRId64
 qemu_rdma_registration_handle_finished(void) ""
 qemu_rdma_registration_handle_ram_blocks(void) ""
-- 
2.31.1




