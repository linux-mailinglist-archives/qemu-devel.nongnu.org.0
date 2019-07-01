Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E0E328FD
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 08:56:48 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58748 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXgtk-0002kb-3x
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 02:56:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hXgoL-0007RF-Tz
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 02:51:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hXgoK-00022X-Qg
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 02:51:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55638)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hXgoK-00021f-LL
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 02:51:12 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 056C33082AFF
	for <qemu-devel@nongnu.org>; Mon,  3 Jun 2019 06:51:12 +0000 (UTC)
Received: from xz-x1.nay.redhat.com (dhcp-15-205.nay.redhat.com [10.66.15.205])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F403F648AA;
	Mon,  3 Jun 2019 06:51:07 +0000 (UTC)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  3 Jun 2019 14:50:48 +0800
Message-Id: <20190603065056.25211-4-peterx@redhat.com>
In-Reply-To: <20190603065056.25211-1-peterx@redhat.com>
References: <20190603065056.25211-1-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 03 Jun 2019 06:51:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 03/11] memory: Don't set migration bitmap
 when without migration
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

Similar to 9460dee4b2 ("memory: do not touch code dirty bitmap unless
TCG is enabled", 2015-06-05) but for the migration bitmap - we can
skip the MIGRATION bitmap update if migration not enabled.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/exec/memory.h   |  2 ++
 include/exec/ram_addr.h | 12 +++++++++++-
 memory.c                |  2 +-
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index e6140e8a04..f29300c54d 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -46,6 +46,8 @@
         OBJECT_GET_CLASS(IOMMUMemoryRegionClass, (obj), \
                          TYPE_IOMMU_MEMORY_REGION)
 
+extern bool global_dirty_log;
+
 typedef struct MemoryRegionOps MemoryRegionOps;
 typedef struct MemoryRegionMmio MemoryRegionMmio;
 
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 6fc49e5db5..79e70a96ee 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -348,8 +348,13 @@ static inline void cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
             if (bitmap[k]) {
                 unsigned long temp = leul_to_cpu(bitmap[k]);
 
-                atomic_or(&blocks[DIRTY_MEMORY_MIGRATION][idx][offset], temp);
                 atomic_or(&blocks[DIRTY_MEMORY_VGA][idx][offset], temp);
+
+                if (global_dirty_log) {
+                    atomic_or(&blocks[DIRTY_MEMORY_MIGRATION][idx][offset],
+                              temp);
+                }
+
                 if (tcg_enabled()) {
                     atomic_or(&blocks[DIRTY_MEMORY_CODE][idx][offset], temp);
                 }
@@ -366,6 +371,11 @@ static inline void cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
         xen_hvm_modified_memory(start, pages << TARGET_PAGE_BITS);
     } else {
         uint8_t clients = tcg_enabled() ? DIRTY_CLIENTS_ALL : DIRTY_CLIENTS_NOCODE;
+
+        if (!global_dirty_log) {
+            clients &= ~(1 << DIRTY_MEMORY_MIGRATION);
+        }
+
         /*
          * bitmap-traveling is faster than memory-traveling (for addr...)
          * especially when most of the memory is not dirty.
diff --git a/memory.c b/memory.c
index 0920c105aa..cff0ea8f40 100644
--- a/memory.c
+++ b/memory.c
@@ -38,7 +38,7 @@
 static unsigned memory_region_transaction_depth;
 static bool memory_region_update_pending;
 static bool ioeventfd_update_pending;
-static bool global_dirty_log = false;
+bool global_dirty_log;
 
 static QTAILQ_HEAD(, MemoryListener) memory_listeners
     = QTAILQ_HEAD_INITIALIZER(memory_listeners);
-- 
2.17.1


