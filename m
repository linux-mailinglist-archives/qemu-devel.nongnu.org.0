Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B46F917A7FA
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 15:42:45 +0100 (CET)
Received: from localhost ([::1]:50466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9ri0-0000vJ-NY
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 09:42:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36023)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1j9rYO-0001Bm-Qx
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 09:32:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1j9rYN-0003tl-CS
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 09:32:48 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26600
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1j9rYN-0003tZ-7v
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 09:32:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583418766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rsKZZfmGf4FTjYAGcSvxDcDvtjCsMTO9zMXFazmq4nI=;
 b=dLVvAOBD/nZ8ykR99frX8Vw9gBV8ZOlHZ1GdqOi7A3nakhPvwoqQLP/BTzjTMV965rHVWo
 MLluD4Oj12Ftoc2+IfrU81XcilGNtCDym7z1jRXzI4Ah2j6p+61QIkJ5w/N7aDbNRczL2r
 jwcEoUuk+R7gb8dR5Ekbk5CkZQbi6+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-SFyd3lYwP0K6PPThgbjaBQ-1; Thu, 05 Mar 2020 09:32:45 -0500
X-MC-Unique: SFyd3lYwP0K6PPThgbjaBQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC82E13E6;
 Thu,  5 Mar 2020 14:32:43 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-120-166.rdu2.redhat.com [10.10.120.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3A4390538;
 Thu,  5 Mar 2020 14:32:30 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/15] util: oslib: Resizeable anonymous allocations under
 POSIX
Date: Thu,  5 Mar 2020 15:29:43 +0100
Message-Id: <20200305142945.216465-14-david@redhat.com>
In-Reply-To: <20200305142945.216465-1-david@redhat.com>
References: <20200305142945.216465-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce qemu_anon_ram_alloc_resizeable() and qemu_anon_ram_resize().
Implement them under POSIX and make them return NULL under WIN32.

Under POSIX, we make use of resizeable mmaps. An implementation under
WIN32 is theoretically possible AFAIK and can be added later.

In qemu_anon_ram_free(), rename the size parameter to max_size, to make
it clearer that we have to use the maximum size when freeing resizeable
anonymous allocations.

Reviewed-by: Peter Xu <peterx@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Stefan Weil <sw@weilnetz.de>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/qemu/osdep.h |  6 +++++-
 util/oslib-posix.c   | 37 ++++++++++++++++++++++++++++++++++---
 util/oslib-win32.c   | 14 ++++++++++++++
 util/trace-events    |  4 +++-
 4 files changed, 56 insertions(+), 5 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 9bd3dcfd13..a1ea9e043d 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -311,8 +311,12 @@ int qemu_daemon(int nochdir, int noclose);
 void *qemu_try_memalign(size_t alignment, size_t size);
 void *qemu_memalign(size_t alignment, size_t size);
 void *qemu_anon_ram_alloc(size_t size, uint64_t *align, bool shared);
+void *qemu_anon_ram_alloc_resizeable(size_t size, size_t max_size,
+                                     uint64_t *align, bool shared);
+bool qemu_anon_ram_resize(void *ptr, size_t old_size, size_t new_size,
+                          bool shared);
 void qemu_vfree(void *ptr);
-void qemu_anon_ram_free(void *ptr, size_t size);
+void qemu_anon_ram_free(void *ptr, size_t max_size);
=20
 #define QEMU_MADV_INVALID -1
=20
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 897e8f3ba6..34b1ce74b7 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -223,16 +223,47 @@ void *qemu_anon_ram_alloc(size_t size, uint64_t *alig=
nment, bool shared)
     return ptr;
 }
=20
+void *qemu_anon_ram_alloc_resizeable(size_t size, size_t max_size,
+                                     uint64_t *alignment, bool shared)
+{
+    size_t align =3D QEMU_VMALLOC_ALIGN;
+    void *ptr =3D qemu_ram_mmap_resizeable(-1, size, max_size, align, shar=
ed,
+                                         false);
+
+    if (ptr =3D=3D MAP_FAILED) {
+        return NULL;
+    }
+
+    if (alignment) {
+        *alignment =3D align;
+    }
+
+    trace_qemu_anon_ram_alloc_resizeable(size, max_size, ptr);
+    return ptr;
+}
+
+bool qemu_anon_ram_resize(void *ptr, size_t old_size, size_t new_size,
+                          bool shared)
+{
+    bool resized =3D qemu_ram_mmap_resize(ptr, -1, old_size, new_size, sha=
red,
+                                        false);
+
+    if (resized) {
+        trace_qemu_anon_ram_resize(old_size, new_size, ptr);
+    }
+    return resized;
+}
+
 void qemu_vfree(void *ptr)
 {
     trace_qemu_vfree(ptr);
     free(ptr);
 }
=20
-void qemu_anon_ram_free(void *ptr, size_t size)
+void qemu_anon_ram_free(void *ptr, size_t max_size)
 {
-    trace_qemu_anon_ram_free(ptr, size);
-    qemu_ram_munmap(-1, ptr, size);
+    trace_qemu_anon_ram_free(ptr, max_size);
+    qemu_ram_munmap(-1, ptr, max_size);
 }
=20
 void qemu_set_block(int fd)
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index e9b14ab178..c034fdfe01 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -90,6 +90,20 @@ void *qemu_anon_ram_alloc(size_t size, uint64_t *align, =
bool shared)
     return ptr;
 }
=20
+void *qemu_anon_ram_alloc_resizeable(size_t size, size_t max_size,
+                                     uint64_t *align, bool shared)
+{
+    /* resizeable ram not implemented yet */
+    return NULL;
+}
+
+bool qemu_anon_ram_resize(void *ptr, size_t old_size, size_t new_size,
+                          bool shared)
+{
+    /* resizeable ram not implemented yet */
+    return false;
+}
+
 void qemu_vfree(void *ptr)
 {
     trace_qemu_vfree(ptr);
diff --git a/util/trace-events b/util/trace-events
index a4d39eca5e..24a6f1a1e1 100644
--- a/util/trace-events
+++ b/util/trace-events
@@ -46,8 +46,10 @@ qemu_co_mutex_unlock_return(void *mutex, void *self) "mu=
tex %p self %p"
 # oslib-posix.c
 qemu_memalign(size_t alignment, size_t size, void *ptr) "alignment %zu siz=
e %zu ptr %p"
 qemu_anon_ram_alloc(size_t size, void *ptr) "size %zu ptr %p"
+qemu_anon_ram_alloc_resizeable(size_t size, size_t max_size, void *ptr) "s=
ize %zu max_size %zu ptr %p"
+qemu_anon_ram_resize(size_t old_size, size_t new_size, void *ptr) "old_siz=
e %zu new_size %zu ptr %p"
 qemu_vfree(void *ptr) "ptr %p"
-qemu_anon_ram_free(void *ptr, size_t size) "ptr %p size %zu"
+qemu_anon_ram_free(void *ptr, size_t max_size) "ptr %p max_size %zu"
=20
 # hbitmap.c
 hbitmap_iter_skip_words(const void *hb, void *hbi, uint64_t pos, unsigned =
long cur) "hb %p hbi %p pos %"PRId64" cur 0x%lx"
--=20
2.24.1


