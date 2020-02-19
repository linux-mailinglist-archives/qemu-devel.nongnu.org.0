Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF207164AFA
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 17:51:32 +0100 (CET)
Received: from localhost ([::1]:56370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4SZP-0002HP-T8
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 11:51:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39242)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1j4S47-0002GN-RH
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:19:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1j4S46-0004ZT-8z
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:19:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43257
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1j4S46-0004ZH-4r
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:19:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582129149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yPC5Hy+VE7F399uarscyVDDSRm1XhDzk8oLkrBH0Wrw=;
 b=YCR8u08hFvuIa4F/1mLNbckznYtO7TFk3PjXmzrFczRvotQTMSeD1FNH20Z36aCwLuHzU7
 Qxkgmc/3VFIvMP5b2Tl2CJOQ5KMMJVIJ8ZH+vIViVFH5TaOfN6BEr/eU/qHf8moNVOkQxG
 lvM26rVSqVo6z0b8iUzOnVZacpk9B4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-g072Y3JwNQ-2JeXy2Qqkvg-1; Wed, 19 Feb 2020 11:19:06 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F30595BBA;
 Wed, 19 Feb 2020 16:19:05 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-116-151.ams2.redhat.com [10.36.116.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 128B78AC45;
 Wed, 19 Feb 2020 16:18:54 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 10/13] migrate/ram: Handle RAM block resizes during postcopy
Date: Wed, 19 Feb 2020 17:17:22 +0100
Message-Id: <20200219161725.115218-11-david@redhat.com>
In-Reply-To: <20200219161725.115218-1-david@redhat.com>
References: <20200219161725.115218-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: g072Y3JwNQ-2JeXy2Qqkvg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhao@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Resizing while migrating is dangerous and does not work as expected.
The whole migration code works on the usable_length of ram blocks and does
not expect this to change at random points in time.

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

Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Shannon Zhao <shannon.zhao@linaro.org>
Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Cc: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/exec/ramblock.h  |  9 +++++++++
 migration/postcopy-ram.c | 15 ++++++++++++---
 migration/ram.c          | 11 +++++++++--
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/include/exec/ramblock.h b/include/exec/ramblock.h
index 07d50864d8..0e9e9b346b 100644
--- a/include/exec/ramblock.h
+++ b/include/exec/ramblock.h
@@ -59,6 +59,15 @@ struct RAMBlock {
      */
     unsigned long *clear_bmap;
     uint8_t clear_bmap_shift;
+
+    /*
+     * RAM block used_length before the guest started running while postco=
py
+     * was active. Once the guest is running, used_length can change. Used=
 to
+     * register/unregister uffd handlers and as the size of the recv bitma=
p.
+     * Receiving any page beyond this length will bail out, as it could no=
t have
+     * been valid on the source.
+     */
+    ram_addr_t postcopy_length;
 };
 #endif
 #endif
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index a36402722b..c68caf4e42 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -17,6 +17,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/rcu.h"
 #include "exec/target_page.h"
 #include "migration.h"
 #include "qemu-file.h"
@@ -31,6 +32,7 @@
 #include "qemu/error-report.h"
 #include "trace.h"
 #include "hw/boards.h"
+#include "exec/ramblock.h"
=20
 /* Arbitrary limit on size of each discard command,
  * keeps them around ~200 bytes
@@ -456,6 +458,13 @@ static int init_range(RAMBlock *rb, void *opaque)
     ram_addr_t length =3D qemu_ram_get_used_length(rb);
     trace_postcopy_init_range(block_name, host_addr, offset, length);
=20
+    /*
+     * Save the used_length before running the guest. In case we have to
+     * resize RAM blocks when syncing RAM block sizes from the source duri=
ng
+     * precopy, we'll update it manually via the ram block notifier.
+     */
+    rb->postcopy_length =3D length;
+
     /*
      * We need the whole of RAM to be truly empty for postcopy, so things
      * like ROMs and any data tables built during init must be zero'd
@@ -478,7 +487,7 @@ static int cleanup_range(RAMBlock *rb, void *opaque)
     const char *block_name =3D qemu_ram_get_idstr(rb);
     void *host_addr =3D qemu_ram_get_host_addr(rb);
     ram_addr_t offset =3D qemu_ram_get_offset(rb);
-    ram_addr_t length =3D qemu_ram_get_used_length(rb);
+    ram_addr_t length =3D rb->postcopy_length;
     MigrationIncomingState *mis =3D opaque;
     struct uffdio_range range_struct;
     trace_postcopy_cleanup_range(block_name, host_addr, offset, length);
@@ -600,7 +609,7 @@ static int nhp_range(RAMBlock *rb, void *opaque)
     const char *block_name =3D qemu_ram_get_idstr(rb);
     void *host_addr =3D qemu_ram_get_host_addr(rb);
     ram_addr_t offset =3D qemu_ram_get_offset(rb);
-    ram_addr_t length =3D qemu_ram_get_used_length(rb);
+    ram_addr_t length =3D rb->postcopy_length;
     trace_postcopy_nhp_range(block_name, host_addr, offset, length);
=20
     /*
@@ -644,7 +653,7 @@ static int ram_block_enable_notify(RAMBlock *rb, void *=
opaque)
     struct uffdio_register reg_struct;
=20
     reg_struct.range.start =3D (uintptr_t)qemu_ram_get_host_addr(rb);
-    reg_struct.range.len =3D qemu_ram_get_used_length(rb);
+    reg_struct.range.len =3D rb->postcopy_length;
     reg_struct.mode =3D UFFDIO_REGISTER_MODE_MISSING;
=20
     /* Now tell our userfault_fd that it's responsible for this area */
diff --git a/migration/ram.c b/migration/ram.c
index ab1f5534cf..6d1dcb362c 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -244,7 +244,7 @@ int64_t ramblock_recv_bitmap_send(QEMUFile *file,
         return -1;
     }
=20
-    nbits =3D block->used_length >> TARGET_PAGE_BITS;
+    nbits =3D block->postcopy_length >> TARGET_PAGE_BITS;
=20
     /*
      * Make sure the tmp bitmap buffer is big enough, e.g., on 32bit
@@ -3159,7 +3159,13 @@ static int ram_load_postcopy(QEMUFile *f)
                 break;
             }
=20
-            if (!offset_in_ramblock(block, addr)) {
+            /*
+             * Relying on used_length is racy and can result in false posi=
tives.
+             * We might place pages beyond used_length in case RAM was shr=
unk
+             * while in postcopy, which is fine - trying to place via
+             * UFFDIO_COPY/UFFDIO_ZEROPAGE will never segfault.
+             */
+            if (!block->host || addr >=3D block->postcopy_length) {
                 error_report("Illegal RAM offset " RAM_ADDR_FMT, addr);
                 ret =3D -EINVAL;
                 break;
@@ -3744,6 +3750,7 @@ static void ram_mig_ram_block_resized(RAMBlockNotifie=
r *n, void *host,
                              rb->idstr);
             }
         }
+        rb->postcopy_length =3D new_size;
         return;
     }
=20
--=20
2.24.1


