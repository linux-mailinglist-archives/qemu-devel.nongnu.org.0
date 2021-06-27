Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 046773B523A
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Jun 2021 07:41:25 +0200 (CEST)
Received: from localhost ([::1]:53608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxNXo-0000XJ-Ho
	for lists+qemu-devel@lfdr.de; Sun, 27 Jun 2021 01:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lxNVA-0007df-PC
 for qemu-devel@nongnu.org; Sun, 27 Jun 2021 01:38:41 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.227]:44580
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lxNV6-0001I8-6y
 for qemu-devel@nongnu.org; Sun, 27 Jun 2021 01:38:40 -0400
HMM_SOURCE_IP: 172.18.0.218:60506.95674552
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.99.176?logid-0210caab79734a8b87be68778a878dff
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 44C94280098;
 Sun, 27 Jun 2021 13:38:29 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id bfc85ca1d7fa4d4da61ae2fb94d56ac3 for
 qemu-devel@nongnu.org; Sun Jun 27 13:38:29 2021
X-Transaction-ID: bfc85ca1d7fa4d4da61ae2fb94d56ac3
X-filter-score: 
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] memory: introduce DIRTY_MEMORY_DIRTY_RATE dirty bits
Date: Sun, 27 Jun 2021 13:38:14 +0800
Message-Id: <b858f91a8df4233afa5cc93d27f0b1adee30fc52.1624771216.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1624768443.git.huangy81@chinatelecom.cn>
References: <cover.1624768443.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1624771216.git.huangy81@chinatelecom.cn>
References: <cover.1624771216.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.227;
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

intrduce DIRTY_MEMORY_DIRTY_RATE dirty bits to tracking vm
dirty page for calculating dirty rate

since dirtyrate and migration may be trigger concurrently,
reusing the exsiting DIRTY_MEMORY_MIGRATION dirty bits seems
not a good choice. introduce a fresh new dirty bits for
dirtyrate to ensure both dirtyrate and migration work fine.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 include/exec/ram_addr.h | 15 ++++++++++++++-
 include/exec/ramlist.h  |  9 +++++----
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 45c9132..6070a52 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -308,6 +308,10 @@ static inline void cpu_physical_memory_set_dirty_range(ram_addr_t start,
         while (page < end) {
             unsigned long next = MIN(end, base + DIRTY_MEMORY_BLOCK_SIZE);
 
+            if (unlikely(mask & (1 << DIRTY_MEMORY_DIRTY_RATE))) {
+                bitmap_set_atomic(blocks[DIRTY_MEMORY_DIRTY_RATE]->blocks[idx],
+                                  offset, next - page);
+            }
             if (likely(mask & (1 << DIRTY_MEMORY_MIGRATION))) {
                 bitmap_set_atomic(blocks[DIRTY_MEMORY_MIGRATION]->blocks[idx],
                                   offset, next - page);
@@ -370,9 +374,17 @@ static inline void cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
                     qatomic_or(&blocks[DIRTY_MEMORY_VGA][idx][offset], temp);
 
                     if (global_dirty_tracking) {
-                        qatomic_or(
+                        if (global_dirty_tracking & GLOBAL_DIRTY_MIGRATION) {
+                            qatomic_or(
                                 &blocks[DIRTY_MEMORY_MIGRATION][idx][offset],
                                 temp);
+                        }
+
+                        if (global_dirty_tracking & GLOBAL_DIRTY_DIRTY_RATE) {
+                            qatomic_or(
+                                &blocks[DIRTY_MEMORY_DIRTY_RATE][idx][offset],
+                                temp);
+                        }
                     }
 
                     if (tcg_enabled()) {
@@ -394,6 +406,7 @@ static inline void cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
 
         if (!global_dirty_tracking) {
             clients &= ~(1 << DIRTY_MEMORY_MIGRATION);
+            clients &= ~(1 << DIRTY_MEMORY_DIRTY_RATE);
         }
 
         /*
diff --git a/include/exec/ramlist.h b/include/exec/ramlist.h
index ece6497..8585f00 100644
--- a/include/exec/ramlist.h
+++ b/include/exec/ramlist.h
@@ -8,10 +8,11 @@
 
 typedef struct RAMBlockNotifier RAMBlockNotifier;
 
-#define DIRTY_MEMORY_VGA       0
-#define DIRTY_MEMORY_CODE      1
-#define DIRTY_MEMORY_MIGRATION 2
-#define DIRTY_MEMORY_NUM       3        /* num of dirty bits */
+#define DIRTY_MEMORY_VGA        0
+#define DIRTY_MEMORY_CODE       1
+#define DIRTY_MEMORY_MIGRATION  2
+#define DIRTY_MEMORY_DIRTY_RATE 3
+#define DIRTY_MEMORY_NUM        4        /* num of dirty bits */
 
 /* The dirty memory bitmap is split into fixed-size blocks to allow growth
  * under RCU.  The bitmap for a block can be accessed as follows:
-- 
1.8.3.1


