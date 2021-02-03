Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E0E30D443
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 08:48:55 +0100 (CET)
Received: from localhost ([::1]:38854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7CuE-0008MK-Uo
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 02:48:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1l7Cpi-00031L-1t
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:44:14 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1l7CpW-0008J3-Nr
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:44:13 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DVtv05zzBzjJgg;
 Wed,  3 Feb 2021 15:42:36 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Wed, 3 Feb 2021
 15:43:44 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>, <berrange@redhat.com>
Subject: [PATCH v4 13/18] migration/rdma: Add the function for dynamic page
 registration
Date: Wed, 3 Feb 2021 16:01:46 +0800
Message-ID: <1612339311-114805-14-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhengchuan@huawei.com; helo=szxga05-in.huawei.com
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
Cc: yubihong@huawei.com, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the 'qemu_rdma_registration' function, multifd send threads
call it to register memory.

Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>
Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
---
 migration/rdma.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/migration/rdma.c b/migration/rdma.c
index cff9446..1095a8f 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3739,6 +3739,57 @@ out:
     return ret;
 }
 
+/*
+ * Dynamic page registrations for multifd RDMA threads.
+ */
+static int qemu_rdma_registration(void *opaque)
+{
+    RDMAContext *rdma = opaque;
+    RDMAControlHeader resp = {.type = RDMA_CONTROL_RAM_BLOCKS_RESULT };
+    RDMALocalBlocks *local = &rdma->local_ram_blocks;
+    int reg_result_idx, i, nb_dest_blocks;
+    RDMAControlHeader head = { .len = 0, .repeat = 1 };
+    int ret = 0;
+
+    head.type = RDMA_CONTROL_RAM_BLOCKS_REQUEST;
+
+    ret = qemu_rdma_exchange_send(rdma, &head, NULL, &resp,
+            &reg_result_idx, rdma->pin_all ?
+            qemu_rdma_reg_whole_ram_blocks : NULL);
+    if (ret < 0) {
+        goto out;
+    }
+
+    nb_dest_blocks = resp.len / sizeof(RDMADestBlock);
+
+    if (local->nb_blocks != nb_dest_blocks) {
+        rdma->error_state = -EINVAL;
+        ret = -1;
+        goto out;
+    }
+
+    qemu_rdma_move_header(rdma, reg_result_idx, &resp);
+    memcpy(rdma->dest_blocks,
+           rdma->wr_data[reg_result_idx].control_curr, resp.len);
+
+    for (i = 0; i < nb_dest_blocks; i++) {
+        network_to_dest_block(&rdma->dest_blocks[i]);
+
+        /* We require that the blocks are in the same order */
+        if (rdma->dest_blocks[i].length != local->block[i].length) {
+            rdma->error_state = -EINVAL;
+            ret = -1;
+            goto out;
+        }
+        local->block[i].remote_host_addr =
+            rdma->dest_blocks[i].remote_host_addr;
+        local->block[i].remote_rkey = rdma->dest_blocks[i].remote_rkey;
+    }
+
+out:
+    return ret;
+}
+
 /* Destination:
  * Called via a ram_control_load_hook during the initial RAM load section which
  * lists the RAMBlocks by name.  This lets us know the order of the RAMBlocks
-- 
1.8.3.1


