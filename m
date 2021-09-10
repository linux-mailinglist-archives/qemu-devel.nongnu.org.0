Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BE740676F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 08:59:21 +0200 (CEST)
Received: from localhost ([::1]:33814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOaVM-0007Qx-Do
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 02:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mOaUG-00063a-3z
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 02:58:12 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:20368
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1mOaUD-0005Xd-SH
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 02:58:11 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AJhGOyK2YDDYX+bS7WY3MkwqjBI4kLtp133Aq?=
 =?us-ascii?q?2lEZdPU1SL39qynKppkmPHDP5gr5J0tLpTntAsi9qBDnhPtICOsqTNSftWDd0Q?=
 =?us-ascii?q?PGEGgI1/qB/9SPIU3D398Y/aJhXow7M9foEGV95PyQ3CCIV/om3/mLmZrFudvj?=
X-IronPort-AV: E=Sophos;i="5.85,282,1624291200"; d="scan'208";a="114273057"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Sep 2021 14:58:09 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id ED1CB4D0DC66;
 Fri, 10 Sep 2021 14:58:03 +0800 (CST)
Received: from G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Fri, 10 Sep 2021 14:57:53 +0800
Received: from localhost.localdomain (10.167.225.141) by
 G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.23 via Frontend Transport; Fri, 10 Sep 2021 14:57:52 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <peter.maydell@linaro.org>, <quintela@redhat.com>, <dgilbert@redhat.com>, 
 <qemu-devel@nongnu.org>
Subject: [PATCH v3 2/2] migration/rdma: advise prefetch write for ODP region
Date: Fri, 10 Sep 2021 15:02:55 +0800
Message-ID: <20210910070255.509349-3-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910070255.509349-1-lizhijian@cn.fujitsu.com>
References: <20210910070255.509349-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: ED1CB4D0DC66.AFF2E
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
V3: Fix FreeBSD compiling errors
V2: use IBV_ADVISE_MR_FLAG_FLUSH instead of IB_UVERBS_ADVISE_MR_FLAG_FLUSH
    and add Reviewed-by tag. # Marcel
---
 meson.build            |  6 ++++++
 migration/rdma.c       | 42 ++++++++++++++++++++++++++++++++++++++++++
 migration/trace-events |  1 +
 3 files changed, 49 insertions(+)

diff --git a/meson.build b/meson.build
index 6e4d2d80343..97406d1b79b 100644
--- a/meson.build
+++ b/meson.build
@@ -1328,6 +1328,12 @@ config_host_data.set('HAVE_COPY_FILE_RANGE', cc.has_function('copy_file_range'))
 config_host_data.set('HAVE_OPENPTY', cc.has_function('openpty', dependencies: util))
 config_host_data.set('HAVE_STRCHRNUL', cc.has_function('strchrnul'))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
+if rdma.found()
+  config_host_data.set('HAVE_IBV_ADVISE_MR',
+                       cc.has_function('ibv_advise_mr',
+                                       args: config_host['RDMA_LIBS'].split(),
+                                       prefix: '#include <infiniband/verbs.h>'))
+endif
 
 # has_header_symbol
 config_host_data.set('CONFIG_BYTESWAP_H',
diff --git a/migration/rdma.c b/migration/rdma.c
index eb80431aae2..2a3c7889b9f 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1133,6 +1133,32 @@ static bool rdma_support_odp(struct ibv_context *dev)
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
+#ifdef HAVE_IBV_ADVISE_MR
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
+#endif
+}
+
 static int qemu_rdma_reg_whole_ram_blocks(RDMAContext *rdma)
 {
     int i;
@@ -1156,6 +1182,15 @@ static int qemu_rdma_reg_whole_ram_blocks(RDMAContext *rdma)
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
@@ -1255,6 +1290,13 @@ static int qemu_rdma_register_and_get_keys(RDMAContext *rdma,
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




