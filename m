Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC9815AA6B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 14:52:47 +0100 (CET)
Received: from localhost ([::1]:38186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1sRa-0005R5-5y
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 08:52:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39381)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1j1sIw-0007Wk-NS
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 08:43:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1j1sIv-0004HW-Ht
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 08:43:50 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:31265
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1j1sIv-0004HA-EA
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 08:43:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581515029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PeNV+R9SkRzKBUQroDIA7kCYiKwN6U06vRHB5GJs2/4=;
 b=WTUprPGKFGVnUM6ZbQwk3xW5zb5quqr2KmtcucZ+skYzUvNq6z3Dcz2wr9N47C5J74h+qK
 84bBSJGh8riDfhutMg8gPjIQRu7nS3rzal0J8bleQp0T5gRILEZCiJz9c+cxO8xO6RorzU
 gZmDv1oCAMw2xRRe/JRKdjIriogkCjI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-T93ADSFIMOOdDdh7nezg0w-1; Wed, 12 Feb 2020 08:43:47 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B530BDBA3;
 Wed, 12 Feb 2020 13:43:45 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-117-92.ams2.redhat.com [10.36.117.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B41D1001B08;
 Wed, 12 Feb 2020 13:43:43 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 fixed 08/16] util/mmap-alloc: Factor out calculation of
 pagesize to mmap_pagesize()
Date: Wed, 12 Feb 2020 14:42:46 +0100
Message-Id: <20200212134254.11073-9-david@redhat.com>
In-Reply-To: <20200212134254.11073-1-david@redhat.com>
References: <20200212134254.11073-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: T93ADSFIMOOdDdh7nezg0w-1
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

Factor it out and add a comment.

Reviewed-by: Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Acked-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Cc: Greg Kurz <groug@kaod.org>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 util/mmap-alloc.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 27dcccd8ec..82f02a2cec 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -82,17 +82,27 @@ size_t qemu_mempath_getpagesize(const char *mem_path)
     return qemu_real_host_page_size;
 }
=20
+static inline size_t mmap_pagesize(int fd)
+{
+#if defined(__powerpc64__) && defined(__linux__)
+    /* Mappings in the same segment must share the same page size */
+    return qemu_fd_getpagesize(fd);
+#else
+    return qemu_real_host_page_size;
+#endif
+}
+
 void *qemu_ram_mmap(int fd,
                     size_t size,
                     size_t align,
                     bool shared,
                     bool is_pmem)
 {
+    const size_t pagesize =3D mmap_pagesize(fd);
     int flags;
     int map_sync_flags =3D 0;
     int guardfd;
     size_t offset;
-    size_t pagesize;
     size_t total;
     void *guardptr;
     void *ptr;
@@ -113,7 +123,6 @@ void *qemu_ram_mmap(int fd,
      * anonymous memory is OK.
      */
     flags =3D MAP_PRIVATE;
-    pagesize =3D qemu_fd_getpagesize(fd);
     if (fd =3D=3D -1 || pagesize =3D=3D qemu_real_host_page_size) {
         guardfd =3D -1;
         flags |=3D MAP_ANONYMOUS;
@@ -123,7 +132,6 @@ void *qemu_ram_mmap(int fd,
     }
 #else
     guardfd =3D -1;
-    pagesize =3D qemu_real_host_page_size;
     flags =3D MAP_PRIVATE | MAP_ANONYMOUS;
 #endif
=20
@@ -198,15 +206,10 @@ void *qemu_ram_mmap(int fd,
=20
 void qemu_ram_munmap(int fd, void *ptr, size_t size)
 {
-    size_t pagesize;
+    const size_t pagesize =3D mmap_pagesize(fd);
=20
     if (ptr) {
         /* Unmap both the RAM block and the guard page */
-#if defined(__powerpc64__) && defined(__linux__)
-        pagesize =3D qemu_fd_getpagesize(fd);
-#else
-        pagesize =3D qemu_real_host_page_size;
-#endif
         munmap(ptr, size + pagesize);
     }
 }
--=20
2.24.1


