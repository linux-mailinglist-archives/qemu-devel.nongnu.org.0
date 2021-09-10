Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9C9406772
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 09:03:05 +0200 (CEST)
Received: from localhost ([::1]:40184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOaYy-0003QP-IR
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 03:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mOaUA-0005uT-Dc
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 02:58:06 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:20368
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1mOaU8-0005Xd-9z
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 02:58:06 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3ANVr0j6j7MK25Btr7MVgYMKzpFnBQXuYji2hC?=
 =?us-ascii?q?6mlwRA09TyX4rbHLoB1/73LJYVkqNk3I5urrBEDtexLhHP1OkOws1NWZLWrbUQ?=
 =?us-ascii?q?KTRekM0WKI+UyDJ8SRzI5g/JYlW61/Jfm1NlJikPv9iTPSL/8QhPWB74Ck7N2z?=
 =?us-ascii?q?80tQ?=
X-IronPort-AV: E=Sophos;i="5.85,282,1624291200"; d="scan'208";a="114273042"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Sep 2021 14:57:56 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id BCE594D0DC65;
 Fri, 10 Sep 2021 14:57:52 +0800 (CST)
Received: from G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Fri, 10 Sep 2021 14:57:54 +0800
Received: from localhost.localdomain (10.167.225.141) by
 G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.23 via Frontend Transport; Fri, 10 Sep 2021 14:57:51 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <peter.maydell@linaro.org>, <quintela@redhat.com>, <dgilbert@redhat.com>, 
 <qemu-devel@nongnu.org>
Subject: [PATCH v3 1/2] migration/rdma: Try to register On-Demand Paging
 memory region
Date: Fri, 10 Sep 2021 15:02:54 +0800
Message-ID: <20210910070255.509349-2-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910070255.509349-1-lizhijian@cn.fujitsu.com>
References: <20210910070255.509349-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: BCE594D0DC65.AEE25
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
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previously, for the fsdax mem-backend-file, it will register failed with
Operation not supported. In this case, we can try to register it with
On-Demand Paging[1] like what rpma_mr_reg() does on rpma[2].

[1]: https://community.mellanox.com/s/article/understanding-on-demand-paging--odp-x
[2]: http://pmem.io/rpma/manpages/v0.9.0/rpma_mr_reg.3

CC: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>

---
V2: add ODP sanity check and remove goto
---
 migration/rdma.c       | 73 ++++++++++++++++++++++++++++++------------
 migration/trace-events |  1 +
 2 files changed, 54 insertions(+), 20 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 5c2d113aa94..eb80431aae2 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1117,19 +1117,47 @@ static int qemu_rdma_alloc_qp(RDMAContext *rdma)
     return 0;
 }
 
+/* Check whether On-Demand Paging is supported by RDAM device */
+static bool rdma_support_odp(struct ibv_context *dev)
+{
+    struct ibv_device_attr_ex attr = {0};
+    int ret = ibv_query_device_ex(dev, NULL, &attr);
+    if (ret) {
+        return false;
+    }
+
+    if (attr.odp_caps.general_caps & IBV_ODP_SUPPORT) {
+        return true;
+    }
+
+    return false;
+}
+
 static int qemu_rdma_reg_whole_ram_blocks(RDMAContext *rdma)
 {
     int i;
     RDMALocalBlocks *local = &rdma->local_ram_blocks;
 
     for (i = 0; i < local->nb_blocks; i++) {
+        int access = IBV_ACCESS_LOCAL_WRITE | IBV_ACCESS_REMOTE_WRITE;
+
         local->block[i].mr =
             ibv_reg_mr(rdma->pd,
                     local->block[i].local_host_addr,
-                    local->block[i].length,
-                    IBV_ACCESS_LOCAL_WRITE |
-                    IBV_ACCESS_REMOTE_WRITE
+                    local->block[i].length, access
                     );
+
+        if (!local->block[i].mr &&
+            errno == ENOTSUP && rdma_support_odp(rdma->verbs)) {
+                access |= IBV_ACCESS_ON_DEMAND;
+                /* register ODP mr */
+                local->block[i].mr =
+                    ibv_reg_mr(rdma->pd,
+                               local->block[i].local_host_addr,
+                               local->block[i].length, access);
+                trace_qemu_rdma_register_odp_mr(local->block[i].block_name);
+        }
+
         if (!local->block[i].mr) {
             perror("Failed to register local dest ram block!");
             break;
@@ -1215,28 +1243,33 @@ static int qemu_rdma_register_and_get_keys(RDMAContext *rdma,
      */
     if (!block->pmr[chunk]) {
         uint64_t len = chunk_end - chunk_start;
+        int access = rkey ? IBV_ACCESS_LOCAL_WRITE | IBV_ACCESS_REMOTE_WRITE :
+                     0;
 
         trace_qemu_rdma_register_and_get_keys(len, chunk_start);
 
-        block->pmr[chunk] = ibv_reg_mr(rdma->pd,
-                chunk_start, len,
-                (rkey ? (IBV_ACCESS_LOCAL_WRITE |
-                        IBV_ACCESS_REMOTE_WRITE) : 0));
-
-        if (!block->pmr[chunk]) {
-            perror("Failed to register chunk!");
-            fprintf(stderr, "Chunk details: block: %d chunk index %d"
-                            " start %" PRIuPTR " end %" PRIuPTR
-                            " host %" PRIuPTR
-                            " local %" PRIuPTR " registrations: %d\n",
-                            block->index, chunk, (uintptr_t)chunk_start,
-                            (uintptr_t)chunk_end, host_addr,
-                            (uintptr_t)block->local_host_addr,
-                            rdma->total_registrations);
-            return -1;
+        block->pmr[chunk] = ibv_reg_mr(rdma->pd, chunk_start, len, access);
+        if (!block->pmr[chunk] &&
+            errno == ENOTSUP && rdma_support_odp(rdma->verbs)) {
+            access |= IBV_ACCESS_ON_DEMAND;
+            /* register ODP mr */
+            block->pmr[chunk] = ibv_reg_mr(rdma->pd, chunk_start, len, access);
+            trace_qemu_rdma_register_odp_mr(block->block_name);
         }
-        rdma->total_registrations++;
     }
+    if (!block->pmr[chunk]) {
+        perror("Failed to register chunk!");
+        fprintf(stderr, "Chunk details: block: %d chunk index %d"
+                        " start %" PRIuPTR " end %" PRIuPTR
+                        " host %" PRIuPTR
+                        " local %" PRIuPTR " registrations: %d\n",
+                        block->index, chunk, (uintptr_t)chunk_start,
+                        (uintptr_t)chunk_end, host_addr,
+                        (uintptr_t)block->local_host_addr,
+                        rdma->total_registrations);
+        return -1;
+    }
+    rdma->total_registrations++;
 
     if (lkey) {
         *lkey = block->pmr[chunk]->lkey;
diff --git a/migration/trace-events b/migration/trace-events
index a1c0f034ab8..5f6aa580def 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -212,6 +212,7 @@ qemu_rdma_poll_write(const char *compstr, int64_t comp, int left, uint64_t block
 qemu_rdma_poll_other(const char *compstr, int64_t comp, int left) "other completion %s (%" PRId64 ") received left %d"
 qemu_rdma_post_send_control(const char *desc) "CONTROL: sending %s.."
 qemu_rdma_register_and_get_keys(uint64_t len, void *start) "Registering %" PRIu64 " bytes @ %p"
+qemu_rdma_register_odp_mr(const char *name) "Try to register On-Demand Paging memory region: %s"
 qemu_rdma_registration_handle_compress(int64_t length, int index, int64_t offset) "Zapping zero chunk: %" PRId64 " bytes, index %d, offset %" PRId64
 qemu_rdma_registration_handle_finished(void) ""
 qemu_rdma_registration_handle_ram_blocks(void) ""
-- 
2.31.1




