Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 931194E78B4
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 17:11:28 +0100 (CET)
Received: from localhost ([::1]:50322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXmX9-0000jd-1a
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 12:11:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1nXm24-0000BR-Ca; Fri, 25 Mar 2022 11:39:20 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:58762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1nXm20-0002M9-Ai; Fri, 25 Mar 2022 11:39:18 -0400
Received: from vla3-850de775f4df.qloud-c.yandex.net
 (vla3-850de775f4df.qloud-c.yandex.net
 [IPv6:2a02:6b8:c15:341d:0:640:850d:e775])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 02A2C2E1258;
 Fri, 25 Mar 2022 18:39:11 +0300 (MSK)
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net [2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by vla3-850de775f4df.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 HOCI4adfGb-dAJaQ5Ya; Fri, 25 Mar 2022 18:39:10 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.com;
 s=default; 
 t=1648222750; bh=zhdTGnnbnK4KuDpQI3IAMmb8MvlkgyeurkITdOfI43k=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=DhlOz2TykruZ7DF1lBuIt/7QydijW8byxi7uhUpUS2WDlR7v534s3We5Q2OppFOYW
 RUcdm3hawtjZU7AR7A5jrQf62DlPHB3aTU6qor/DLo5muxIzE82X6tygapJq5q+CC5
 +UDUxB4R/Wo171MSMvVg5xtNI3YVwS9n/BNDiIB4=
Authentication-Results: vla3-850de775f4df.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.com
Received: from dellarbn.yandex.net (dynamic-red3.dhcp.yndx.net
 [2a02:6b8:0:107:3e85:844d:5b1d:60a])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 RLr4sOPFvu-dAJOYfQS; Fri, 25 Mar 2022 18:39:10 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Andrey Ryabinin <arbn@yandex-team.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 2/2] softmmu/physmem: fix dirty memory bitmap memleak
Date: Fri, 25 Mar 2022 18:40:13 +0300
Message-Id: <20220325154013.16809-2-arbn@yandex-team.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325154013.16809-1-arbn@yandex-team.com>
References: <20220325154013.16809-1-arbn@yandex-team.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=77.88.29.217; envelope-from=arbn@yandex-team.com;
 helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 25 Mar 2022 12:08:47 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrey Ryabinin <arbn@yandex-team.com>, qemu-devel@nongnu.org,
 yc-core@yandex-team.ru, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sequence of ram_block_add()/qemu_ram_free()/ram_block_add()
function calls leads to leaking some memory.

ram_block_add() calls dirty_memory_extend() to allocate bitmap blocks
for new memory. These blocks only grow but never shrink. So the
qemu_ram_free() restores RAM size back to it's original stat but
doesn't touch dirty memory bitmaps.

After qemu_ram_free() there is no way of knowing that we have
allocated dirty memory bitmaps beyond current RAM size.
So the next ram_block_add() will call dirty_memory_extend() again to
to allocate new bitmaps and rewrite pointers to bitmaps left after
the first ram_block_add()/dirty_memory_extend() calls.

Rework dirty_memory_extend() to be able to shrink dirty maps,
also rename it to dirty_memory_resize(). And fix the leak by
shrinking dirty memory maps on qemu_ram_free() if needed.

Fixes: 5b82b703b69a ("memory: RCU ram_list.dirty_memory[] for safe RAM hotplug")
Cc: qemu-stable@nongnu.org
Signed-off-by: Andrey Ryabinin <arbn@yandex-team.com>
---
 include/exec/ramlist.h |  2 ++
 softmmu/physmem.c      | 38 ++++++++++++++++++++++++++++++++------
 2 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/include/exec/ramlist.h b/include/exec/ramlist.h
index 2ad2a81acc..019e238e7c 100644
--- a/include/exec/ramlist.h
+++ b/include/exec/ramlist.h
@@ -41,6 +41,8 @@ typedef struct RAMBlockNotifier RAMBlockNotifier;
 #define DIRTY_MEMORY_BLOCK_SIZE ((ram_addr_t)256 * 1024 * 8)
 typedef struct {
     struct rcu_head rcu;
+    unsigned int nr_blocks;
+    unsigned int nr_blocks_inuse;
     unsigned long *blocks[];
 } DirtyMemoryBlocks;
 
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 32f76362bf..073ab37351 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1919,8 +1919,23 @@ void qemu_ram_msync(RAMBlock *block, ram_addr_t start, ram_addr_t length)
     }
 }
 
+static void dirty_memory_free(DirtyMemoryBlocks *blocks)
+{
+    int i;
+
+    /*
+     *'nr_blocks_inuse' is more than nr_blocks (memory was extended)
+     * or it's less than 'nr_blocks' (memory shrunk). In the second case
+     * we free all the blocks above the nr_blocks_inuse.
+     */
+    for (i = blocks->nr_blocks_inuse; i < blocks->nr_blocks; i++) {
+        g_free(blocks->blocks[i]);
+    }
+    g_free(blocks);
+}
+
 /* Called with ram_list.mutex held */
-static void dirty_memory_extend(ram_addr_t old_ram_size,
+static void dirty_memory_resize(ram_addr_t old_ram_size,
                                 ram_addr_t new_ram_size)
 {
     ram_addr_t old_num_blocks = DIV_ROUND_UP(old_ram_size,
@@ -1929,25 +1944,28 @@ static void dirty_memory_extend(ram_addr_t old_ram_size,
                                              DIRTY_MEMORY_BLOCK_SIZE);
     int i;
 
-    /* Only need to extend if block count increased */
-    if (new_num_blocks <= old_num_blocks) {
+    /* Only need to resize if block count changed */
+    if (new_num_blocks == old_num_blocks) {
         return;
     }
 
     for (i = 0; i < DIRTY_MEMORY_NUM; i++) {
         DirtyMemoryBlocks *old_blocks;
         DirtyMemoryBlocks *new_blocks;
+        unsigned int num_blocks = MAX(old_num_blocks, new_num_blocks);
         int j;
 
         old_blocks = qatomic_rcu_read(&ram_list.dirty_memory[i]);
         new_blocks = g_malloc(sizeof(*new_blocks) +
-                              sizeof(new_blocks->blocks[0]) * new_num_blocks);
+                              sizeof(new_blocks->blocks[0]) * num_blocks);
+        new_blocks->nr_blocks = new_num_blocks;
 
         if (old_num_blocks) {
             memcpy(new_blocks->blocks, old_blocks->blocks,
                    old_num_blocks * sizeof(old_blocks->blocks[0]));
         }
 
+        /* memory extend case (new>old): allocate new blocks*/
         for (j = old_num_blocks; j < new_num_blocks; j++) {
             new_blocks->blocks[j] = bitmap_new(DIRTY_MEMORY_BLOCK_SIZE);
         }
@@ -1955,7 +1973,8 @@ static void dirty_memory_extend(ram_addr_t old_ram_size,
         qatomic_rcu_set(&ram_list.dirty_memory[i], new_blocks);
 
         if (old_blocks) {
-            g_free_rcu(old_blocks, rcu);
+            old_blocks->nr_blocks_inuse = new_num_blocks;
+            call_rcu(old_blocks, dirty_memory_free, rcu);
         }
     }
 }
@@ -2001,7 +2020,7 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
     new_ram_size = MAX(old_ram_size,
               (new_block->offset + new_block->max_length) >> TARGET_PAGE_BITS);
     if (new_ram_size > old_ram_size) {
-        dirty_memory_extend(old_ram_size, new_ram_size);
+        dirty_memory_resize(old_ram_size, new_ram_size);
     }
     /* Keep the list sorted from biggest to smallest block.  Unlike QTAILQ,
      * QLIST (which has an RCU-friendly variant) does not have insertion at
@@ -2218,6 +2237,8 @@ static void reclaim_ramblock(RAMBlock *block)
 
 void qemu_ram_free(RAMBlock *block)
 {
+    ram_addr_t old_ram_size, new_ram_size;
+
     if (!block) {
         return;
     }
@@ -2228,12 +2249,17 @@ void qemu_ram_free(RAMBlock *block)
     }
 
     qemu_mutex_lock_ramlist();
+    old_ram_size = last_ram_page();
+
     QLIST_REMOVE_RCU(block, next);
     ram_list.mru_block = NULL;
     /* Write list before version */
     smp_wmb();
     ram_list.version++;
     call_rcu(block, reclaim_ramblock, rcu);
+
+    new_ram_size = last_ram_page();
+    dirty_memory_resize(old_ram_size, new_ram_size);
     qemu_mutex_unlock_ramlist();
 }
 
-- 
2.34.1


