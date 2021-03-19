Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C889A3419C2
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 11:18:27 +0100 (CET)
Received: from localhost ([::1]:55246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNCD4-0005n9-O7
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 06:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lNC8J-00013t-Sw
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:13:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lNC8H-0000AD-Vl
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:13:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616148809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W2xadBhOlctA+eFTSVDngodlBQX81CnvqOgmN6nNNlI=;
 b=Z/xVkXq4M2tKtz3N6SAg6LiL/FNuMb9OFQBLoSz6nnVT+efNlQl11JACgUviywMhy4PZ9V
 NNsEK0jhaSwV+HDIxvXvwQxSHD/vvZvceN+lYL9yNjoKX7+Lwz2lyq0AOtbYMv2JjVEynA
 Cds7EGnZLLdmKQQp4Gcy4w+ImXEjjFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-Fgo1wcwNPMORSNnvKg_FUg-1; Fri, 19 Mar 2021 06:13:27 -0400
X-MC-Unique: Fgo1wcwNPMORSNnvKg_FUg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 426829CC01;
 Fri, 19 Mar 2021 10:13:26 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-11.ams2.redhat.com [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B47B10013C1;
 Fri, 19 Mar 2021 10:13:10 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/14] util/mmap-alloc: Factor out calculation of the
 pagesize for the guard page
Date: Fri, 19 Mar 2021 11:12:20 +0100
Message-Id: <20210319101230.21531-5-david@redhat.com>
In-Reply-To: <20210319101230.21531-1-david@redhat.com>
References: <20210319101230.21531-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's factor out calculating the size of the guard page and rename the
variable to make it clearer that this pagesize only applies to the
guard page.

Reviewed-by: Peter Xu <peterx@redhat.com>
Acked-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Cc: Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 util/mmap-alloc.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index e6fa8b598b..24854064b4 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -82,6 +82,16 @@ size_t qemu_mempath_getpagesize(const char *mem_path)
     return qemu_real_host_page_size;
 }
 
+static inline size_t mmap_guard_pagesize(int fd)
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
@@ -90,12 +100,12 @@ void *qemu_ram_mmap(int fd,
                     bool is_pmem,
                     off_t map_offset)
 {
+    const size_t guard_pagesize = mmap_guard_pagesize(fd);
     int prot;
     int flags;
     int map_sync_flags = 0;
     int guardfd;
     size_t offset;
-    size_t pagesize;
     size_t total;
     void *guardptr;
     void *ptr;
@@ -116,8 +126,7 @@ void *qemu_ram_mmap(int fd,
      * anonymous memory is OK.
      */
     flags = MAP_PRIVATE;
-    pagesize = qemu_fd_getpagesize(fd);
-    if (fd == -1 || pagesize == qemu_real_host_page_size) {
+    if (fd == -1 || guard_pagesize == qemu_real_host_page_size) {
         guardfd = -1;
         flags |= MAP_ANONYMOUS;
     } else {
@@ -126,7 +135,6 @@ void *qemu_ram_mmap(int fd,
     }
 #else
     guardfd = -1;
-    pagesize = qemu_real_host_page_size;
     flags = MAP_PRIVATE | MAP_ANONYMOUS;
 #endif
 
@@ -138,7 +146,7 @@ void *qemu_ram_mmap(int fd,
 
     assert(is_power_of_2(align));
     /* Always align to host page size */
-    assert(align >= pagesize);
+    assert(align >= guard_pagesize);
 
     flags = MAP_FIXED;
     flags |= fd == -1 ? MAP_ANONYMOUS : 0;
@@ -193,8 +201,8 @@ void *qemu_ram_mmap(int fd,
      * a guard page guarding against potential buffer overflows.
      */
     total -= offset;
-    if (total > size + pagesize) {
-        munmap(ptr + size + pagesize, total - size - pagesize);
+    if (total > size + guard_pagesize) {
+        munmap(ptr + size + guard_pagesize, total - size - guard_pagesize);
     }
 
     return ptr;
@@ -202,15 +210,8 @@ void *qemu_ram_mmap(int fd,
 
 void qemu_ram_munmap(int fd, void *ptr, size_t size)
 {
-    size_t pagesize;
-
     if (ptr) {
         /* Unmap both the RAM block and the guard page */
-#if defined(__powerpc64__) && defined(__linux__)
-        pagesize = qemu_fd_getpagesize(fd);
-#else
-        pagesize = qemu_real_host_page_size;
-#endif
-        munmap(ptr, size + pagesize);
+        munmap(ptr, size + mmap_guard_pagesize(fd));
     }
 }
-- 
2.29.2


