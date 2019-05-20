Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEE722A4F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 05:15:54 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57077 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSYmH-0007VD-PB
	for lists+qemu-devel@lfdr.de; Sun, 19 May 2019 23:15:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hSYfm-00022I-1G
	for qemu-devel@nongnu.org; Sun, 19 May 2019 23:09:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hSYfl-0001bU-1Q
	for qemu-devel@nongnu.org; Sun, 19 May 2019 23:09:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44128)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hSYfk-0001bC-Qf
	for qemu-devel@nongnu.org; Sun, 19 May 2019 23:09:08 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2FED97EBAE
	for <qemu-devel@nongnu.org>; Mon, 20 May 2019 03:09:08 +0000 (UTC)
Received: from xz-x1.nay.redhat.com (dhcp-15-205.nay.redhat.com [10.66.15.205])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 123A71001E66;
	Mon, 20 May 2019 03:09:05 +0000 (UTC)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 20 May 2019 11:08:31 +0800
Message-Id: <20190520030839.6795-8-peterx@redhat.com>
In-Reply-To: <20190520030839.6795-1-peterx@redhat.com>
References: <20190520030839.6795-1-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 20 May 2019 03:09:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 07/15] memory: Pass mr into
 snapshot_and_clear_dirty
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

Also we change the 2nd parameter of it to be the relative offset
within the memory region. This is to be used in follow up patches.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 exec.c                  | 3 ++-
 include/exec/ram_addr.h | 2 +-
 memory.c                | 3 +--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/exec.c b/exec.c
index 4e734770c2..2615b4cfed 100644
--- a/exec.c
+++ b/exec.c
@@ -1387,9 +1387,10 @@ bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
 }
 
 DirtyBitmapSnapshot *cpu_physical_memory_snapshot_and_clear_dirty
-     (ram_addr_t start, ram_addr_t length, unsigned client)
+(MemoryRegion *mr, hwaddr addr, hwaddr length, unsigned client)
 {
     DirtyMemoryBlocks *blocks;
+    ram_addr_t start = memory_region_get_ram_addr(mr) + addr;
     unsigned long align = 1UL << (TARGET_PAGE_BITS + BITS_PER_LEVEL);
     ram_addr_t first = QEMU_ALIGN_DOWN(start, align);
     ram_addr_t last  = QEMU_ALIGN_UP(start + length, align);
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 86bc8e1a4a..69cc528c98 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -403,7 +403,7 @@ bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
                                               unsigned client);
 
 DirtyBitmapSnapshot *cpu_physical_memory_snapshot_and_clear_dirty
-    (ram_addr_t start, ram_addr_t length, unsigned client);
+(MemoryRegion *mr, ram_addr_t start, hwaddr length, unsigned client);
 
 bool cpu_physical_memory_snapshot_get_dirty(DirtyBitmapSnapshot *snap,
                                             ram_addr_t start,
diff --git a/memory.c b/memory.c
index cff0ea8f40..84bba7b65c 100644
--- a/memory.c
+++ b/memory.c
@@ -2071,8 +2071,7 @@ DirtyBitmapSnapshot *memory_region_snapshot_and_clear_dirty(MemoryRegion *mr,
 {
     assert(mr->ram_block);
     memory_region_sync_dirty_bitmap(mr);
-    return cpu_physical_memory_snapshot_and_clear_dirty(
-                memory_region_get_ram_addr(mr) + addr, size, client);
+    return cpu_physical_memory_snapshot_and_clear_dirty(mr, addr, size, client);
 }
 
 bool memory_region_snapshot_get_dirty(MemoryRegion *mr, DirtyBitmapSnapshot *snap,
-- 
2.17.1


