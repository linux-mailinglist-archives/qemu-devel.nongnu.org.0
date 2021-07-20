Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758543CFD50
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:20:26 +0200 (CEST)
Received: from localhost ([::1]:42632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5rXl-0003TP-EG
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1m5rS6-00024N-Nd
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:14:34 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:48893
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1m5rS4-00033A-U0
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:14:34 -0400
HMM_SOURCE_IP: 172.18.0.218:43924.1776767911
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-202.80.192.38?logid-12ef1fc3aabe4fd8a6101b785ef452ca
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id D5D47280109;
 Tue, 20 Jul 2021 23:14:22 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 22aaa662ac7d45c38a77c3acc111043d for
 qemu-devel@nongnu.org; Tue Jul 20 23:14:22 2021
X-Transaction-ID: 22aaa662ac7d45c38a77c3acc111043d
X-filter-score: 
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel@nongnu.org
Subject: [PATCH v7 1/2] memory: introduce total_dirty_pages to stat dirty pages
Date: Tue, 20 Jul 2021 23:19:16 +0800
Message-Id: <43f4caeb051eb37f77099420cae2718194d40515.1626794163.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1626794163.git.huangy81@chinatelecom.cn>
References: <cover.1626794163.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1626794163.git.huangy81@chinatelecom.cn>
References: <cover.1626794163.git.huangy81@chinatelecom.cn>
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

introduce global var total_dirty_pages to stat dirty pages
along with memory_global_dirty_log_sync.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 include/exec/ram_addr.h | 9 +++++++++
 migration/dirtyrate.c   | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 45c9132..64fb936 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -26,6 +26,8 @@
 #include "exec/ramlist.h"
 #include "exec/ramblock.h"
 
+extern uint64_t total_dirty_pages;
+
 /**
  * clear_bmap_size: calculate clear bitmap size
  *
@@ -373,6 +375,10 @@ static inline void cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
                         qatomic_or(
                                 &blocks[DIRTY_MEMORY_MIGRATION][idx][offset],
                                 temp);
+                        if (unlikely(
+                            global_dirty_tracking & GLOBAL_DIRTY_DIRTY_RATE)) {
+                            total_dirty_pages += ctpopl(temp);
+                        }
                     }
 
                     if (tcg_enabled()) {
@@ -403,6 +409,9 @@ static inline void cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
         for (i = 0; i < len; i++) {
             if (bitmap[i] != 0) {
                 c = leul_to_cpu(bitmap[i]);
+                if (unlikely(global_dirty_tracking & GLOBAL_DIRTY_DIRTY_RATE)) {
+                    total_dirty_pages += ctpopl(c);
+                }
                 do {
                     j = ctzl(c);
                     c &= ~(1ul << j);
diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index f92c4b4..17b3d2c 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -28,6 +28,13 @@
 #include "sysemu/runstate.h"
 #include "exec/memory.h"
 
+/*
+ * total_dirty_pages is procted by BQL and is used
+ * to stat dirty pages during the period of two
+ * memory_global_dirty_log_sync
+ */
+uint64_t total_dirty_pages;
+
 typedef struct DirtyPageRecord {
     uint64_t start_pages;
     uint64_t end_pages;
-- 
1.8.3.1


