Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C62D85893
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Aug 2019 05:33:06 +0200 (CEST)
Received: from localhost ([::1]:46740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvZAn-0003ZO-Ln
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 23:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40439)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hvZA9-00039L-H7
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 23:32:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hvZA8-0002nO-Ia
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 23:32:25 -0400
Received: from mga02.intel.com ([134.134.136.20]:8183)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hvZA8-0002mu-4G
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 23:32:24 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2019 20:32:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,360,1559545200"; d="scan'208";a="179711190"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga006.jf.intel.com with ESMTP; 07 Aug 2019 20:32:18 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu,  8 Aug 2019 11:31:55 +0800
Message-Id: <20190808033155.30162-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.20
Subject: [Qemu-devel] [PATCH v2] migration: rename
 migration_bitmap_sync_range to ramblock_sync_dirty_bitmap
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

Rename for better understanding of the code.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

---
v2:
  * rebase on top of "just pass RAMBlock is enough"

---
 migration/ram.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index eee68a7991..0d12fa8e92 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1748,7 +1748,7 @@ static inline bool migration_bitmap_clear_dirty(RAMState *rs,
 }
 
 /* Called with RCU critical section */
-static void migration_bitmap_sync_range(RAMState *rs, RAMBlock *rb)
+static void ramblock_sync_dirty_bitmap(RAMState *rs, RAMBlock *rb)
 {
     rs->migration_dirty_pages +=
         cpu_physical_memory_sync_dirty_bitmap(rb, 0, rb->used_length,
@@ -1840,7 +1840,7 @@ static void migration_bitmap_sync(RAMState *rs)
     qemu_mutex_lock(&rs->bitmap_mutex);
     rcu_read_lock();
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
-        migration_bitmap_sync_range(rs, block);
+        ramblock_sync_dirty_bitmap(rs, block);
     }
     ram_counters.remaining = ram_bytes_remaining();
     rcu_read_unlock();
@@ -4261,7 +4261,7 @@ static void colo_flush_ram_cache(void)
     memory_global_dirty_log_sync();
     rcu_read_lock();
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
-        migration_bitmap_sync_range(ram_state, block);
+        ramblock_sync_dirty_bitmap(ram_state, block);
     }
     rcu_read_unlock();
 
-- 
2.17.1


