Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E9836E9A7
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 13:34:04 +0200 (CEST)
Received: from localhost ([::1]:34022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc4vj-00047e-V5
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 07:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc4qh-0000e6-Po
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 07:28:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc4qf-00040h-Iv
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 07:28:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619695729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OD3byHF/qXMVsJmYoEoajd2ySkwEjyveLb2xvi/YObU=;
 b=MuomOXP9MRg7GNf/u/r0dXXqIVvdyZDywFYRHyd8mb4phFIRxkullV65bJ5c2YnRKW+Ne2
 rlPKaIy5QrPCFUVueh5/U5QIHiI6P18TvaEPritGLuIQTfOmcBf9mYjWXaHJ6B+zcUpGZs
 CmpC4D6R4x77Sh+wPcsJHU9BnKWXqik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-SxrB0BEWMRSsemympi3tKA-1; Thu, 29 Apr 2021 07:28:46 -0400
X-MC-Unique: SxrB0BEWMRSsemympi3tKA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE4B11005E5F;
 Thu, 29 Apr 2021 11:28:45 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-50.ams2.redhat.com [10.36.114.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E4F461D31;
 Thu, 29 Apr 2021 11:28:32 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/10] migration/ram: Handle RAM block resizes during
 postcopy
Date: Thu, 29 Apr 2021 13:27:06 +0200
Message-Id: <20210429112708.12291-9-david@redhat.com>
In-Reply-To: <20210429112708.12291-1-david@redhat.com>
References: <20210429112708.12291-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Resizing while migrating is dangerous and does not work as expected.
The whole migration code works with the usable_length of a ram block and
does not expect this value to change at random points in time.

In the case of postcopy, relying on used_length is racy as soon as the
guest is running. Also, when used_length changes we might leave the
uffd handler registered for some memory regions, reject valid pages
when migrating and fail when sending the recv bitmap to the source.

Resizing can be trigger *after* (but not during) a reset in
ACPI code by the guest
- hw/arm/virt-acpi-build.c:acpi_ram_update()
- hw/i386/acpi-build.c:acpi_ram_update()

Let's remember the original used_length in a separate variable and
use it in relevant postcopy code. Make sure to update it when we resize
during precopy, when synchronizing the RAM block sizes with the source.

Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/exec/ramblock.h  | 10 ++++++++++
 migration/postcopy-ram.c | 15 ++++++++++++---
 migration/ram.c          | 11 +++++++++--
 3 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/include/exec/ramblock.h b/include/exec/ramblock.h
index 07d50864d8..664701b759 100644
--- a/include/exec/ramblock.h
+++ b/include/exec/ramblock.h
@@ -59,6 +59,16 @@ struct RAMBlock {
      */
     unsigned long *clear_bmap;
     uint8_t clear_bmap_shift;
+
+    /*
+     * RAM block length that corresponds to the used_length on the migration
+     * source (after RAM block sizes were synchronized). Especially, after
+     * starting to run the guest, used_length and postcopy_length can differ.
+     * Used to register/unregister uffd handlers and as the size of the received
+     * bitmap. Receiving any page beyond this length will bail out, as it
+     * could not have been valid on the source.
+     */
+    ram_addr_t postcopy_length;
 };
 #endif
 #endif
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index ab482adef1..2e9697bdd2 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -17,6 +17,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/rcu.h"
 #include "exec/target_page.h"
 #include "migration.h"
 #include "qemu-file.h"
@@ -30,6 +31,7 @@
 #include "qemu/error-report.h"
 #include "trace.h"
 #include "hw/boards.h"
+#include "exec/ramblock.h"
 
 /* Arbitrary limit on size of each discard command,
  * keeps them around ~200 bytes
@@ -452,6 +454,13 @@ static int init_range(RAMBlock *rb, void *opaque)
     ram_addr_t length = qemu_ram_get_used_length(rb);
     trace_postcopy_init_range(block_name, host_addr, offset, length);
 
+    /*
+     * Save the used_length before running the guest. In case we have to
+     * resize RAM blocks when syncing RAM block sizes from the source during
+     * precopy, we'll update it manually via the ram block notifier.
+     */
+    rb->postcopy_length = length;
+
     /*
      * We need the whole of RAM to be truly empty for postcopy, so things
      * like ROMs and any data tables built during init must be zero'd
@@ -474,7 +483,7 @@ static int cleanup_range(RAMBlock *rb, void *opaque)
     const char *block_name = qemu_ram_get_idstr(rb);
     void *host_addr = qemu_ram_get_host_addr(rb);
     ram_addr_t offset = qemu_ram_get_offset(rb);
-    ram_addr_t length = qemu_ram_get_used_length(rb);
+    ram_addr_t length = rb->postcopy_length;
     MigrationIncomingState *mis = opaque;
     struct uffdio_range range_struct;
     trace_postcopy_cleanup_range(block_name, host_addr, offset, length);
@@ -580,7 +589,7 @@ static int nhp_range(RAMBlock *rb, void *opaque)
     const char *block_name = qemu_ram_get_idstr(rb);
     void *host_addr = qemu_ram_get_host_addr(rb);
     ram_addr_t offset = qemu_ram_get_offset(rb);
-    ram_addr_t length = qemu_ram_get_used_length(rb);
+    ram_addr_t length = rb->postcopy_length;
     trace_postcopy_nhp_range(block_name, host_addr, offset, length);
 
     /*
@@ -624,7 +633,7 @@ static int ram_block_enable_notify(RAMBlock *rb, void *opaque)
     struct uffdio_register reg_struct;
 
     reg_struct.range.start = (uintptr_t)qemu_ram_get_host_addr(rb);
-    reg_struct.range.len = qemu_ram_get_used_length(rb);
+    reg_struct.range.len = rb->postcopy_length;
     reg_struct.mode = UFFDIO_REGISTER_MODE_MISSING;
 
     /* Now tell our userfault_fd that it's responsible for this area */
diff --git a/migration/ram.c b/migration/ram.c
index 72df5228ee..6d4d13d345 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -243,7 +243,7 @@ int64_t ramblock_recv_bitmap_send(QEMUFile *file,
         return -1;
     }
 
-    nbits = block->used_length >> TARGET_PAGE_BITS;
+    nbits = block->postcopy_length >> TARGET_PAGE_BITS;
 
     /*
      * Make sure the tmp bitmap buffer is big enough, e.g., on 32bit
@@ -3573,7 +3573,13 @@ static int ram_load_postcopy(QEMUFile *f)
                 break;
             }
 
-            if (!offset_in_ramblock(block, addr)) {
+            /*
+             * Relying on used_length is racy and can result in false positives.
+             * We might place pages beyond used_length in case RAM was shrunk
+             * while in postcopy, which is fine - trying to place via
+             * UFFDIO_COPY/UFFDIO_ZEROPAGE will never segfault.
+             */
+            if (!block->host || addr >= block->postcopy_length) {
                 error_report("Illegal RAM offset " RAM_ADDR_FMT, addr);
                 ret = -EINVAL;
                 break;
@@ -4186,6 +4192,7 @@ static void ram_mig_ram_block_resized(RAMBlockNotifier *n, void *host,
                              rb->idstr);
             }
         }
+        rb->postcopy_length = new_size;
         break;
     case POSTCOPY_INCOMING_NONE:
     case POSTCOPY_INCOMING_RUNNING:
-- 
2.30.2


