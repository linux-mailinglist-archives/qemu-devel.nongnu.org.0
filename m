Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F94D6C435
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 03:26:36 +0200 (CEST)
Received: from localhost ([::1]:33612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnvBp-0007sa-JX
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 21:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58821)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hnvBd-0007Lm-Cj
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 21:26:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hnvBc-0002j4-Df
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 21:26:21 -0400
Received: from mga05.intel.com ([192.55.52.43]:8488)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hnvBb-0002hG-43
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 21:26:20 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jul 2019 18:26:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; d="scan'208";a="319493326"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga004.jf.intel.com with ESMTP; 17 Jul 2019 18:26:13 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu, 18 Jul 2019 09:25:47 +0800
Message-Id: <20190718012547.16373-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.43
Subject: [Qemu-devel] [PATCH] migration: just pass RAMBlock is enough
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
Cc: pbonzini@redhat.com, Wei Yang <richardw.yang@linux.intel.com>,
 dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RAMBlock->used_length is always passed to migration_bitmap_sync_range(),
which could be retrieved from RAMBlock.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/ram.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 908517fc2b..0a6070d787 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1669,11 +1669,10 @@ static inline bool migration_bitmap_clear_dirty(RAMState *rs,
     return ret;
 }
 
-static void migration_bitmap_sync_range(RAMState *rs, RAMBlock *rb,
-                                        ram_addr_t length)
+static void migration_bitmap_sync_range(RAMState *rs, RAMBlock *rb)
 {
     rs->migration_dirty_pages +=
-        cpu_physical_memory_sync_dirty_bitmap(rb, 0, length,
+        cpu_physical_memory_sync_dirty_bitmap(rb, 0, rb->used_length,
                                               &rs->num_dirty_pages_period);
 }
 
@@ -1762,7 +1761,7 @@ static void migration_bitmap_sync(RAMState *rs)
     qemu_mutex_lock(&rs->bitmap_mutex);
     rcu_read_lock();
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
-        migration_bitmap_sync_range(rs, block, block->used_length);
+        migration_bitmap_sync_range(rs, block);
     }
     ram_counters.remaining = ram_bytes_remaining();
     rcu_read_unlock();
@@ -4193,7 +4192,7 @@ static void colo_flush_ram_cache(void)
     memory_global_dirty_log_sync();
     rcu_read_lock();
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
-        migration_bitmap_sync_range(ram_state, block, block->used_length);
+        migration_bitmap_sync_range(ram_state, block);
     }
     rcu_read_unlock();
 
-- 
2.17.1


