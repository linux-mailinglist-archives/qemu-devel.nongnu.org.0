Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2177C3AB459
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 15:10:58 +0200 (CEST)
Received: from localhost ([::1]:49634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrnM-0002UM-Rk
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 09:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1ltraG-0004Ai-UN
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:57:24 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:47978
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1ltraC-00057i-Qk
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:57:24 -0400
HMM_SOURCE_IP: 172.18.0.218:49202.1515610665
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-202.80.192.39?logid-ac66d9f6950e4d63a4038c372b328dd9
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 08AFE2800E8;
 Thu, 17 Jun 2021 20:57:11 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id e1cf2a8e009948bda93c4aaff09ffe4a for
 qemu-devel@nongnu.org; Thu Jun 17 20:57:12 2021
X-Transaction-ID: e1cf2a8e009948bda93c4aaff09ffe4a
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/6] memory: rename global_dirty_log to
 global_dirty_tracking
Date: Thu, 17 Jun 2021 21:01:16 +0800
Message-Id: <3cf8b84e41bb27d863f4e4d4148aee52a112bb3d.1623934182.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1623934182.git.huangy81@chinatelecom.cn>
References: <cover.1623934182.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1623934182.git.huangy81@chinatelecom.cn>
References: <cover.1623934182.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Hyman <huangy81@chinatelecom.cn>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

since dirty ring has been introduced, there are two methods
to track dirty pages of vm. it seems that "logging" has
a hint on the method, so rename the global_dirty_log to
global_dirty_tracking would make description more accurate.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 include/exec/memory.h   |  2 +-
 include/exec/ram_addr.h |  4 ++--
 softmmu/memory.c        | 10 +++++-----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index b114f54..cc0e549 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -55,7 +55,7 @@ static inline void fuzz_dma_read_cb(size_t addr,
 }
 #endif
 
-extern bool global_dirty_log;
+extern bool global_dirty_tracking;
 
 typedef struct MemoryRegionOps MemoryRegionOps;
 
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 3cb9791..a0bce11 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -372,7 +372,7 @@ static inline void cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
 
                     qatomic_or(&blocks[DIRTY_MEMORY_VGA][idx][offset], temp);
 
-                    if (global_dirty_log) {
+                    if (global_dirty_tracking) {
                         qatomic_or(
                                 &blocks[DIRTY_MEMORY_MIGRATION][idx][offset],
                                 temp);
@@ -395,7 +395,7 @@ static inline void cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
     } else {
         uint8_t clients = tcg_enabled() ? DIRTY_CLIENTS_ALL : DIRTY_CLIENTS_NOCODE;
 
-        if (!global_dirty_log) {
+        if (!global_dirty_tracking) {
             clients &= ~(1 << DIRTY_MEMORY_MIGRATION);
         }
 
diff --git a/softmmu/memory.c b/softmmu/memory.c
index c19b0be..5682053 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -39,7 +39,7 @@
 static unsigned memory_region_transaction_depth;
 static bool memory_region_update_pending;
 static bool ioeventfd_update_pending;
-bool global_dirty_log;
+bool global_dirty_tracking;
 
 static QTAILQ_HEAD(, MemoryListener) memory_listeners
     = QTAILQ_HEAD_INITIALIZER(memory_listeners);
@@ -1813,7 +1813,7 @@ uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr)
     uint8_t mask = mr->dirty_log_mask;
     RAMBlock *rb = mr->ram_block;
 
-    if (global_dirty_log && ((rb && qemu_ram_is_migratable(rb)) ||
+    if (global_dirty_tracking && ((rb && qemu_ram_is_migratable(rb)) ||
                              memory_region_is_iommu(mr))) {
         mask |= (1 << DIRTY_MEMORY_MIGRATION);
     }
@@ -2666,7 +2666,7 @@ void memory_global_dirty_log_start(void)
         vmstate_change = NULL;
     }
 
-    global_dirty_log = true;
+    global_dirty_tracking = true;
 
     MEMORY_LISTENER_CALL_GLOBAL(log_global_start, Forward);
 
@@ -2678,7 +2678,7 @@ void memory_global_dirty_log_start(void)
 
 static void memory_global_dirty_log_do_stop(void)
 {
-    global_dirty_log = false;
+    global_dirty_tracking = false;
 
     /* Refresh DIRTY_MEMORY_MIGRATION bit.  */
     memory_region_transaction_begin();
@@ -2724,7 +2724,7 @@ static void listener_add_address_space(MemoryListener *listener,
     if (listener->begin) {
         listener->begin(listener);
     }
-    if (global_dirty_log) {
+    if (global_dirty_tracking) {
         if (listener->log_global_start) {
             listener->log_global_start(listener);
         }
-- 
1.8.3.1


