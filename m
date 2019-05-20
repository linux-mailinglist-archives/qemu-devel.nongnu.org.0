Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 792E022A45
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 05:11:19 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57000 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSYhq-00032I-IR
	for lists+qemu-devel@lfdr.de; Sun, 19 May 2019 23:11:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49104)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hSYfZ-0001qO-5B
	for qemu-devel@nongnu.org; Sun, 19 May 2019 23:08:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hSYfY-0001Tj-9L
	for qemu-devel@nongnu.org; Sun, 19 May 2019 23:08:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36686)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hSYfY-0001TO-4R
	for qemu-devel@nongnu.org; Sun, 19 May 2019 23:08:56 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7CD57883A2
	for <qemu-devel@nongnu.org>; Mon, 20 May 2019 03:08:55 +0000 (UTC)
Received: from xz-x1.nay.redhat.com (dhcp-15-205.nay.redhat.com [10.66.15.205])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 080E2100200A;
	Mon, 20 May 2019 03:08:51 +0000 (UTC)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 20 May 2019 11:08:27 +0800
Message-Id: <20190520030839.6795-4-peterx@redhat.com>
In-Reply-To: <20190520030839.6795-1-peterx@redhat.com>
References: <20190520030839.6795-1-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 20 May 2019 03:08:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 03/15] migration: No need to take rcu during
 sync_dirty_bitmap
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	peterx@redhat.com, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cpu_physical_memory_sync_dirty_bitmap() has one RAMBlock* as
parameter, which means that it must be with RCU read lock held
already.  Taking it again inside seems redundant.  Removing it.
Instead comment on the functions about the RCU read lock.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/exec/ram_addr.h | 5 +----
 migration/ram.c         | 1 +
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 139ad79390..993fb760f3 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -408,6 +408,7 @@ static inline void cpu_physical_memory_clear_dirty_range(ram_addr_t start,
 }
 
 
+/* Must be with rcu read lock held */
 static inline
 uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
                                                ram_addr_t start,
@@ -431,8 +432,6 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
                                         DIRTY_MEMORY_BLOCK_SIZE);
         unsigned long page = BIT_WORD(start >> TARGET_PAGE_BITS);
 
-        rcu_read_lock();
-
         src = atomic_rcu_read(
                 &ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION])->blocks;
 
@@ -452,8 +451,6 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
                 idx++;
             }
         }
-
-        rcu_read_unlock();
     } else {
         ram_addr_t offset = rb->offset;
 
diff --git a/migration/ram.c b/migration/ram.c
index 4c60869226..05f9f36c7c 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1678,6 +1678,7 @@ static inline bool migration_bitmap_clear_dirty(RAMState *rs,
     return ret;
 }
 
+/* Must be with rcu read lock held */
 static void migration_bitmap_sync_range(RAMState *rs, RAMBlock *rb,
                                         ram_addr_t length)
 {
-- 
2.17.1


