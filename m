Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD11B1714DB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 11:22:10 +0100 (CET)
Received: from localhost ([::1]:56656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7GIz-0002FR-S5
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 05:22:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40226)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1j7GBZ-0003uo-JN
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 05:14:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1j7GBY-0000h9-3V
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 05:14:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27948
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1j7GBX-0000e9-Tm
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 05:14:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582798466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=40hhBbONGQBxpq10wEMGQ4Cqgszu2Aqt/JdYW098rXc=;
 b=WpulvFU+xgNbOoQYQ0UPlLf1vvCrXt1zAQ+8hlcw6hRFe3vh42dndUZMn4xnsi5ZIC61KU
 o6t543Q4zuXqBrTRLS5P3MziJ71HoGC8yHf1eNxaWGo9deLaUiPxFZGmIWGOq6wc6kJr0Y
 hf8og3cn5dqn1/SLxAfZapuGnjss/X8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-awGq2DrlMqeDQDbP8-q4Ag-1; Thu, 27 Feb 2020 05:14:25 -0500
X-MC-Unique: awGq2DrlMqeDQDbP8-q4Ag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C03398017CC;
 Thu, 27 Feb 2020 10:14:23 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-116-36.ams2.redhat.com [10.36.116.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0AA9F90CCB;
 Thu, 27 Feb 2020 10:14:20 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/15] util/mmap-alloc: Implement resizeable mmaps
Date: Thu, 27 Feb 2020 11:12:01 +0100
Message-Id: <20200227101205.5616-12-david@redhat.com>
In-Reply-To: <20200227101205.5616-1-david@redhat.com>
References: <20200227101205.5616-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement resizeable mmaps. For now, the actual resizing is not wired up.
Introduce qemu_ram_mmap_resizeable() and qemu_ram_mmap_resize(). Make
qemu_ram_mmap() a wrapper of qemu_ram_mmap_resizeable().

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Greg Kurz <groug@kaod.org>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/qemu/mmap-alloc.h | 21 +++++++++++--------
 util/mmap-alloc.c         | 43 ++++++++++++++++++++++++++++-----------
 2 files changed, 44 insertions(+), 20 deletions(-)

diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h
index e786266b92..ca8f7edf70 100644
--- a/include/qemu/mmap-alloc.h
+++ b/include/qemu/mmap-alloc.h
@@ -7,11 +7,13 @@ size_t qemu_fd_getpagesize(int fd);
 size_t qemu_mempath_getpagesize(const char *mem_path);
=20
 /**
- * qemu_ram_mmap: mmap the specified file or device.
+ * qemu_ram_mmap_resizeable: reserve a memory region of @max_size to mmap =
the
+ *                           specified file or device and mmap @size of it=
.
  *
  * Parameters:
  *  @fd: the file or the device to mmap
  *  @size: the number of bytes to be mmaped
+ *  @max_size: the number of bytes to be reserved
  *  @align: if not zero, specify the alignment of the starting mapping add=
ress;
  *          otherwise, the alignment in use will be determined by QEMU.
  *  @shared: map has RAM_SHARED flag.
@@ -21,12 +23,15 @@ size_t qemu_mempath_getpagesize(const char *mem_path);
  *  On success, return a pointer to the mapped area.
  *  On failure, return MAP_FAILED.
  */
-void *qemu_ram_mmap(int fd,
-                    size_t size,
-                    size_t align,
-                    bool shared,
-                    bool is_pmem);
-
-void qemu_ram_munmap(int fd, void *ptr, size_t size);
+void *qemu_ram_mmap_resizeable(int fd, size_t size, size_t max_size,
+                              size_t align, bool shared, bool is_pmem);
+bool qemu_ram_mmap_resize(void *ptr, int fd, size_t old_size, size_t new_s=
ize,
+                          bool shared, bool is_pmem);
+static inline void *qemu_ram_mmap(int fd, size_t size, size_t align,
+                                  bool shared, bool is_pmem)
+{
+    return qemu_ram_mmap_resizeable(fd, size, size, align, shared, is_pmem=
);
+}
+void qemu_ram_munmap(int fd, void *ptr, size_t max_size);
=20
 #endif
diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index c6a6075215..8f9c533f32 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -173,11 +173,8 @@ static inline size_t mmap_guard_pagesize(int fd)
 #endif
 }
=20
-void *qemu_ram_mmap(int fd,
-                    size_t size,
-                    size_t align,
-                    bool shared,
-                    bool is_pmem)
+void *qemu_ram_mmap_resizeable(int fd, size_t size, size_t max_size,
+                               size_t align, bool shared, bool is_pmem)
 {
     const size_t guard_pagesize =3D mmap_guard_pagesize(fd);
     const size_t pagesize =3D qemu_fd_getpagesize(fd);
@@ -185,12 +182,14 @@ void *qemu_ram_mmap(int fd,
     void *ptr, *guardptr;
=20
     g_assert(QEMU_IS_ALIGNED(size, pagesize));
+    g_assert(QEMU_IS_ALIGNED(max_size, pagesize));
=20
     /*
      * Note: this always allocates at least one extra page of virtual addr=
ess
-     * space, even if size is already aligned.
+     * space, even if the size is already aligned. We will reserve an area=
 of
+     * at least max_size, but only populate the requested part of it.
      */
-    total =3D size + align;
+    total =3D max_size + align;
=20
     guardptr =3D mmap_reserve(NULL, total, fd);
     if (guardptr =3D=3D MAP_FAILED) {
@@ -218,21 +217,41 @@ void *qemu_ram_mmap(int fd,
      * a guard page guarding against potential buffer overflows.
      */
     total -=3D offset;
-    if (total > size + guard_pagesize) {
-        munmap(ptr + size + guard_pagesize, total - size - guard_pagesize)=
;
+    if (total > max_size + guard_pagesize) {
+        munmap(ptr + max_size + guard_pagesize,
+               total - max_size - guard_pagesize);
     }
=20
     return ptr;
 }
=20
-void qemu_ram_munmap(int fd, void *ptr, size_t size)
+bool qemu_ram_mmap_resize(void *ptr, int fd, size_t old_size, size_t new_s=
ize,
+                          bool shared, bool is_pmem)
 {
     const size_t pagesize =3D qemu_fd_getpagesize(fd);
=20
-    g_assert(QEMU_IS_ALIGNED(size, pagesize));
+    g_assert(QEMU_IS_ALIGNED(old_size, pagesize));
+    g_assert(QEMU_IS_ALIGNED(new_size, pagesize));
+
+    if (old_size < new_size) {
+        /* populate the missing piece into the reserved area */
+        ptr =3D mmap_populate(ptr + old_size, new_size - old_size, fd, old=
_size,
+                            shared, is_pmem);
+    } else if (old_size > new_size) {
+        /* discard this piece, marking it reserved */
+        ptr =3D mmap_reserve(ptr + new_size, old_size - new_size, fd);
+    }
+    return ptr !=3D MAP_FAILED;
+}
+
+void qemu_ram_munmap(int fd, void *ptr, size_t max_size)
+{
+    const size_t pagesize =3D qemu_fd_getpagesize(fd);
+
+    g_assert(QEMU_IS_ALIGNED(max_size, pagesize));
=20
     if (ptr) {
         /* Unmap both the RAM block and the guard page */
-        munmap(ptr, size + mmap_guard_pagesize(fd));
+        munmap(ptr, max_size + mmap_guard_pagesize(fd));
     }
 }
--=20
2.24.1


