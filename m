Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6203CA1B7
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 17:55:16 +0200 (CEST)
Received: from localhost ([::1]:39982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m43hj-0000P9-9g
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 11:55:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1m43ep-000309-SP
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 11:52:15 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:35930
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1m43eo-0002ai-4r
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 11:52:15 -0400
HMM_SOURCE_IP: 172.18.0.48:41252.1306426439
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.97.37?logid-5ad577dca6294f93a78c774e52779d08
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id C32462800C5;
 Thu, 15 Jul 2021 23:52:00 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 666ee4b855de41d6816d509752fb1126 for
 qemu-devel@nongnu.org; Thu Jul 15 23:52:00 2021
X-Transaction-ID: 666ee4b855de41d6816d509752fb1126
X-filter-score: 
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] memory: introduce DirtyRateDirtyPages and util function
Date: Thu, 15 Jul 2021 23:51:32 +0800
Message-Id: <316de737c2fee577cbf75a47dc7537ce38844a63.1626364220.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1626354884.git.huangy81@chinatelecom.cn>
References: <cover.1626354884.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1626364220.git.huangy81@chinatelecom.cn>
References: <cover.1626364220.git.huangy81@chinatelecom.cn>
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

introduce DirtyRateDirtyPages and use it to the dirty pages
along with memory_global_dirty_log_sync.
introduce cpu_physical_memory_dirtyrate_reset_protect to
clear dirty bitmap within slot in kvm

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 include/exec/ram_addr.h | 19 +++++++++++++++++++
 migration/dirtyrate.c   |  2 ++
 2 files changed, 21 insertions(+)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 45c9132..dce0f46 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -26,6 +26,8 @@
 #include "exec/ramlist.h"
 #include "exec/ramblock.h"
 
+extern uint64_t DirtyRateDirtyPages;
+
 /**
  * clear_bmap_size: calculate clear bitmap size
  *
@@ -415,6 +417,17 @@ static inline void cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
             }
         }
     }
+
+    if (global_dirty_tracking &&
+        global_dirty_tracking & GLOBAL_DIRTY_DIRTY_RATE) {
+        long nr = BITS_TO_LONGS(pages);
+        for (i = 0; i < nr; i++) {
+            if (bitmap[i]) {
+                unsigned long temp = leul_to_cpu(bitmap[i]);
+                DirtyRateDirtyPages += ctpopl(temp);
+            }
+        }
+    }
 }
 #endif /* not _WIN32 */
 
@@ -510,5 +523,11 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
 
     return num_dirty;
 }
+
+static inline
+void cpu_physical_memory_dirtyrate_reset_protect(RAMBlock *rb)
+{
+    memory_region_clear_dirty_bitmap(rb->mr, 0, rb->used_length);
+}
 #endif
 #endif
diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 3c8c5e2..c465e62 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -28,6 +28,8 @@
 #include "sysemu/runstate.h"
 #include "exec/memory.h"
 
+uint64_t DirtyRateDirtyPages;
+
 typedef struct DirtyPageRecord {
     uint64_t start_pages;
     uint64_t end_pages;
-- 
1.8.3.1


