Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D992BA521
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 09:54:50 +0100 (CET)
Received: from localhost ([::1]:59148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg2Bs-0006vl-LL
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 03:54:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kg2AQ-0005p4-H0; Fri, 20 Nov 2020 03:53:18 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kg2AN-0001V2-OC; Fri, 20 Nov 2020 03:53:18 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Ccr0W0lqXzhdXH;
 Fri, 20 Nov 2020 16:52:43 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.187.37) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Fri, 20 Nov 2020 16:52:52 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>
Subject: [RFC PATCH 1/2] ramlist: Make dirty bitmap blocks of ramlist resizable
Date: Fri, 20 Nov 2020 16:51:56 +0800
Message-ID: <20201120085157.7136-2-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20201120085157.7136-1-zhukeqian1@huawei.com>
References: <20201120085157.7136-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhukeqian1@huawei.com; helo=szxga05-in.huawei.com
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
Cc: wanghaibin.wang@huawei.com, qemu-arm@nongnu.org,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we remove a ramblock, we should decrease the dirty bitmap blocks
of ramlist to avoid memory leakage. This patch rebuilds dirty_memory_
extend to support both "extend" and "decrease".

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 softmmu/physmem.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 3027747c03..f6ff78378e 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1816,17 +1816,19 @@ void qemu_ram_msync(RAMBlock *block, ram_addr_t start, ram_addr_t length)
 }
 
 /* Called with ram_list.mutex held */
-static void dirty_memory_extend(ram_addr_t old_ram_size,
+static void dirty_bitmap_resize(ram_addr_t old_ram_size,
                                 ram_addr_t new_ram_size)
 {
     ram_addr_t old_num_blocks = DIV_ROUND_UP(old_ram_size,
                                              DIRTY_MEMORY_BLOCK_SIZE);
     ram_addr_t new_num_blocks = DIV_ROUND_UP(new_ram_size,
                                              DIRTY_MEMORY_BLOCK_SIZE);
+    ram_addr_t cpy_num_blocks = MIN(old_num_blocks, new_num_blocks);
+    bool extend = new_num_blocks > old_num_blocks;
     int i;
 
-    /* Only need to extend if block count increased */
-    if (new_num_blocks <= old_num_blocks) {
+    /* Only need to resize if block count changed */
+    if (new_num_blocks == old_num_blocks) {
         return;
     }
 
@@ -1839,13 +1841,23 @@ static void dirty_memory_extend(ram_addr_t old_ram_size,
         new_blocks = g_malloc(sizeof(*new_blocks) +
                               sizeof(new_blocks->blocks[0]) * new_num_blocks);
 
-        if (old_num_blocks) {
+        if (cpy_num_blocks) {
             memcpy(new_blocks->blocks, old_blocks->blocks,
-                   old_num_blocks * sizeof(old_blocks->blocks[0]));
+                   cpy_num_blocks * sizeof(old_blocks->blocks[0]));
         }
 
-        for (j = old_num_blocks; j < new_num_blocks; j++) {
-            new_blocks->blocks[j] = bitmap_new(DIRTY_MEMORY_BLOCK_SIZE);
+        if (extend) {
+            for (j = old_num_blocks; j < new_num_blocks; j++) {
+                new_blocks->blocks[j] = bitmap_new(DIRTY_MEMORY_BLOCK_SIZE);
+            }
+        } else {
+            for (j = cpy_num_blocks; j < old_num_blocks; j++) {
+                /*
+                 * We are safe to free it here, for that its RAMblock
+                 * is out-of-use.
+                 */
+                g_free(old_blocks->blocks[j]);
+            }
         }
 
         qatomic_rcu_set(&ram_list.dirty_memory[i], new_blocks);
@@ -1894,7 +1906,7 @@ static void ram_block_add(RAMBlock *new_block, Error **errp, bool shared)
     new_ram_size = MAX(old_ram_size,
               (new_block->offset + new_block->max_length) >> TARGET_PAGE_BITS);
     if (new_ram_size > old_ram_size) {
-        dirty_memory_extend(old_ram_size, new_ram_size);
+        dirty_bitmap_resize(old_ram_size, new_ram_size);
     }
     /* Keep the list sorted from biggest to smallest block.  Unlike QTAILQ,
      * QLIST (which has an RCU-friendly variant) does not have insertion at
-- 
2.23.0


