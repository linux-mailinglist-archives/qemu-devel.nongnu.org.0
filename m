Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 220B115AA80
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 14:56:12 +0100 (CET)
Received: from localhost ([::1]:38266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1sUt-0003Fu-62
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 08:56:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39480)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1j1sJH-0007tV-5N
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 08:44:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1j1sJF-0004bl-Pu
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 08:44:11 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:33943
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1j1sJF-0004bT-M8
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 08:44:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581515049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LnJzdyGqoAQKx+1rnNUMeCg39x2uBiI+oIICFGxMjgU=;
 b=Dm3c9poYRwF6xEmz2Z4uuV5UnsEfGKuRiuqZcrAks4NMNDE06VC+yAlf8WbFnaoJgDoCF5
 0mdrksPGrOoMUf6U4OesGW1v4t3RhyfDQMkdDxtfgEgA1tAtFLlCMsNRQGmdFZTfEJkhhx
 mglIDrpxQePDIm/pEgLln01rGtvyNH0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-yX8BHRaIOYup158mDf75Yg-1; Wed, 12 Feb 2020 08:44:06 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50651190D340;
 Wed, 12 Feb 2020 13:44:04 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-117-92.ams2.redhat.com [10.36.117.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7552F1001281;
 Wed, 12 Feb 2020 13:43:54 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 fixed 12/16] util/mmap-alloc: Implement resizable mmaps
Date: Wed, 12 Feb 2020 14:42:50 +0100
Message-Id: <20200212134254.11073-13-david@redhat.com>
In-Reply-To: <20200212134254.11073-1-david@redhat.com>
References: <20200212134254.11073-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: yX8BHRaIOYup158mDf75Yg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement resizable mmaps. For now, the actual resizing is not wired up.
Introduce qemu_ram_mmap_resizable() and qemu_ram_mmap_resize(). Make
qemu_ram_mmap() a wrapper of qemu_ram_mmap_resizable().

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
 include/qemu/mmap-alloc.h | 21 ++++++++++++--------
 util/mmap-alloc.c         | 42 ++++++++++++++++++++++++++++-----------
 2 files changed, 43 insertions(+), 20 deletions(-)

diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h
index e786266b92..3a219721e3 100644
--- a/include/qemu/mmap-alloc.h
+++ b/include/qemu/mmap-alloc.h
@@ -7,11 +7,13 @@ size_t qemu_fd_getpagesize(int fd);
 size_t qemu_mempath_getpagesize(const char *mem_path);
=20
 /**
- * qemu_ram_mmap: mmap the specified file or device.
+ * qemu_ram_mmap_resizable: reserve a memory region of @max_size to mmap t=
he
+ *                          specified file or device and mmap @size of it.
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
+void *qemu_ram_mmap_resizable(int fd, size_t size, size_t max_size,
+                              size_t align, bool shared, bool is_pmem);
+bool qemu_ram_mmap_resize(void *ptr, int fd, size_t old_size, size_t new_s=
ize,
+                          bool shared, bool is_pmem);
+static inline void *qemu_ram_mmap(int fd, size_t size, size_t align,
+                                  bool shared, bool is_pmem)
+{
+    return qemu_ram_mmap_resizable(fd, size, size, align, shared, is_pmem)=
;
+}
+void qemu_ram_munmap(int fd, void *ptr, size_t max_size);
=20
 #endif
diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index fb7ef588fe..164b88a088 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -173,23 +173,22 @@ static inline size_t mmap_pagesize(int fd)
 #endif
 }
=20
-void *qemu_ram_mmap(int fd,
-                    size_t size,
-                    size_t align,
-                    bool shared,
-                    bool is_pmem)
+void *qemu_ram_mmap_resizable(int fd, size_t size, size_t max_size,
+                              size_t align, bool shared, bool is_pmem)
 {
     const size_t pagesize =3D mmap_pagesize(fd);
     size_t offset, total;
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
     guardptr =3D mmap_reserve(0, total, fd);
     if (guardptr =3D=3D MAP_FAILED) {
@@ -217,21 +216,40 @@ void *qemu_ram_mmap(int fd,
      * a guard page guarding against potential buffer overflows.
      */
     total -=3D offset;
-    if (total > size + pagesize) {
-        munmap(ptr + size + pagesize, total - size - pagesize);
+    if (total > max_size + pagesize) {
+        munmap(ptr + max_size + pagesize, total - max_size - pagesize);
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
     const size_t pagesize =3D mmap_pagesize(fd);
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
+    const size_t pagesize =3D mmap_pagesize(fd);
+
+    g_assert(QEMU_IS_ALIGNED(max_size, pagesize));
=20
     if (ptr) {
         /* Unmap both the RAM block and the guard page */
-        munmap(ptr, size + pagesize);
+        munmap(ptr, max_size + pagesize);
     }
 }
--=20
2.24.1


