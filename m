Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A93A99815D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 19:35:11 +0200 (CEST)
Received: from localhost ([::1]:51128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0UVq-0005fx-7e
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 13:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40338)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1i0UPc-0006rL-SQ
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:28:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1i0UPb-0005Pn-Th
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:28:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56320)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1i0UPb-0005P0-OK
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:28:43 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1C385308FC20
 for <qemu-devel@nongnu.org>; Wed, 21 Aug 2019 17:28:43 +0000 (UTC)
Received: from 640k.localdomain.com (ovpn-112-20.ams2.redhat.com
 [10.36.112.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4F2760E1C;
 Wed, 21 Aug 2019 17:28:39 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 Aug 2019 19:28:16 +0200
Message-Id: <1566408501-48680-9-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1566408501-48680-1-git-send-email-pbonzini@redhat.com>
References: <1566408501-48680-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Wed, 21 Aug 2019 17:28:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 08/13] memory: Refactor
 memory_region_clear_coalescing
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
Cc: Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Removing the update variable and quit earlier if the memory region has
no coalesced range.  This prepares for the next patch.

Fixes: 3ac7d43a6fbb5d4a3
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20190820141328.10009-4-peterx@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 memory.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/memory.c b/memory.c
index 4aa38eb..9a1193a 100644
--- a/memory.c
+++ b/memory.c
@@ -2281,7 +2281,10 @@ void memory_region_add_coalescing(MemoryRegion *mr,
 void memory_region_clear_coalescing(MemoryRegion *mr)
 {
     CoalescedMemoryRange *cmr;
-    bool updated = false;
+
+    if (QTAILQ_EMPTY(&mr->coalesced)) {
+        return;
+    }
 
     qemu_flush_coalesced_mmio_buffer();
     mr->flush_coalesced_mmio = false;
@@ -2290,12 +2293,9 @@ void memory_region_clear_coalescing(MemoryRegion *mr)
         cmr = QTAILQ_FIRST(&mr->coalesced);
         QTAILQ_REMOVE(&mr->coalesced, cmr, link);
         g_free(cmr);
-        updated = true;
     }
 
-    if (updated) {
-        memory_region_update_coalesced_range(mr);
-    }
+    memory_region_update_coalesced_range(mr);
 }
 
 void memory_region_set_flush_coalesced(MemoryRegion *mr)
-- 
1.8.3.1



