Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E0F244801
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 12:29:45 +0200 (CEST)
Received: from localhost ([::1]:40256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6Wy0-0005bH-KM
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 06:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1k6VuE-0002M1-Od
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:21:46 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:50082 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1k6VuA-00045w-0S
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:21:46 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 90C1DBA49AC8A3FEE16C;
 Fri, 14 Aug 2020 17:21:33 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Fri, 14 Aug 2020
 17:21:26 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <eblake@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH v2 04/10] migration/dirtyrate: move
 RAMBLOCK_FOREACH_MIGRATABLE into ram.h
Date: Fri, 14 Aug 2020 17:32:07 +0800
Message-ID: <1597397532-68043-5-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1597397532-68043-1-git-send-email-zhengchuan@huawei.com>
References: <1597397532-68043-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhengchuan@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/14 05:21:34
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
Cc: zhang.zhanghailiang@huawei.com, linyilu@huawei.com, qemu-devel@nongnu.org,
 alex.chen@huawei.com, ann.zhuangyanying@huawei.com, fangying1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zheng Chuan <zhengchuan@huawei.com>

RAMBLOCK_FOREACH_MIGRATABLE is need in dirtyrate measure,
move the existing definition up into migration/ram.h

Signed-off-by: Zheng Chuan <zhengchuan@huawei.com>
---
 migration/dirtyrate.c |  1 +
 migration/ram.c       | 11 +----------
 migration/ram.h       | 10 ++++++++++
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 8708090..c4304ef 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -21,6 +21,7 @@
 #include "qemu/rcu_queue.h"
 #include "qapi/qapi-commands-migration.h"
 #include "migration.h"
+#include "ram.h"
 #include "dirtyrate.h"
 
 CalculatingDirtyRateState CalculatingState = CAL_DIRTY_RATE_INIT;
diff --git a/migration/ram.c b/migration/ram.c
index 76d4fee..37ef0da 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -158,21 +158,12 @@ out:
     return ret;
 }
 
-static bool ramblock_is_ignored(RAMBlock *block)
+bool ramblock_is_ignored(RAMBlock *block)
 {
     return !qemu_ram_is_migratable(block) ||
            (migrate_ignore_shared() && qemu_ram_is_shared(block));
 }
 
-/* Should be holding either ram_list.mutex, or the RCU lock. */
-#define RAMBLOCK_FOREACH_NOT_IGNORED(block)            \
-    INTERNAL_RAMBLOCK_FOREACH(block)                   \
-        if (ramblock_is_ignored(block)) {} else
-
-#define RAMBLOCK_FOREACH_MIGRATABLE(block)             \
-    INTERNAL_RAMBLOCK_FOREACH(block)                   \
-        if (!qemu_ram_is_migratable(block)) {} else
-
 #undef RAMBLOCK_FOREACH
 
 int foreach_not_ignored_block(RAMBlockIterFunc func, void *opaque)
diff --git a/migration/ram.h b/migration/ram.h
index 2eeaacf..011e854 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -37,6 +37,16 @@ extern MigrationStats ram_counters;
 extern XBZRLECacheStats xbzrle_counters;
 extern CompressionStats compression_counters;
 
+bool ramblock_is_ignored(RAMBlock *block);
+/* Should be holding either ram_list.mutex, or the RCU lock. */
+#define RAMBLOCK_FOREACH_NOT_IGNORED(block)            \
+    INTERNAL_RAMBLOCK_FOREACH(block)                   \
+        if (ramblock_is_ignored(block)) {} else
+
+#define RAMBLOCK_FOREACH_MIGRATABLE(block)             \
+    INTERNAL_RAMBLOCK_FOREACH(block)                   \
+        if (!qemu_ram_is_migratable(block)) {} else
+
 int xbzrle_cache_resize(int64_t new_size, Error **errp);
 uint64_t ram_bytes_remaining(void);
 uint64_t ram_bytes_total(void);
-- 
1.8.3.1


