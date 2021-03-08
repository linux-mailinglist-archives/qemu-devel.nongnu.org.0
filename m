Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 868B13311A9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 16:09:04 +0100 (CET)
Received: from localhost ([::1]:46758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJHVH-0007qe-Iq
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 10:09:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lJHTk-0006Bd-3C
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 10:07:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lJHTi-0001US-Bf
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 10:07:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615216045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IcSEGod7KTi/JjEkRbArfe4hY+fUndoBU72cDZ+8n6E=;
 b=aRxYtRux0gez0+beaWbBU6piGFz0WIXLiHHNJuu102/10wRMv/Xg+kiwCe2d4g5uSR/xTx
 CdtBl3cR+1LrFfGHxJS1feT6n6JIJt8hdnxo6WfTvaY0LpiEqsT7It4FPJpIV3QsVJkGzs
 6FOpiqj+JS7ugpXx2CPKm8qMHYfZ0Jo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-NZrrJDi-MUemDr_Qg4UD5A-1; Mon, 08 Mar 2021 10:07:24 -0500
X-MC-Unique: NZrrJDi-MUemDr_Qg4UD5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 797D61966321;
 Mon,  8 Mar 2021 15:07:22 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-123.ams2.redhat.com [10.36.113.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED8165D9CD;
 Mon,  8 Mar 2021 15:07:04 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/12] util/mmap-alloc: Factor out reserving of a memory
 region to mmap_reserve()
Date: Mon,  8 Mar 2021 16:05:53 +0100
Message-Id: <20210308150600.14440-6-david@redhat.com>
In-Reply-To: <20210308150600.14440-1-david@redhat.com>
References: <20210308150600.14440-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
 Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to reserve a memory region without actually populating memory.
Let's factor that out.

Reviewed-by: Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Acked-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 util/mmap-alloc.c | 58 +++++++++++++++++++++++++++--------------------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 24854064b4..223d66219c 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -82,6 +82,38 @@ size_t qemu_mempath_getpagesize(const char *mem_path)
     return qemu_real_host_page_size;
 }
 
+/*
+ * Reserve a new memory region of the requested size to be used for mapping
+ * from the given fd (if any).
+ */
+static void *mmap_reserve(size_t size, int fd)
+{
+    int flags = MAP_PRIVATE;
+
+#if defined(__powerpc64__) && defined(__linux__)
+    /*
+     * On ppc64 mappings in the same segment (aka slice) must share the same
+     * page size. Since we will be re-allocating part of this segment
+     * from the supplied fd, we should make sure to use the same page size, to
+     * this end we mmap the supplied fd.  In this case, set MAP_NORESERVE to
+     * avoid allocating backing store memory.
+     * We do this unless we are using the system page size, in which case
+     * anonymous memory is OK.
+     */
+    if (fd == -1 || qemu_fd_getpagesize(fd) == qemu_real_host_page_size) {
+        fd = -1;
+        flags |= MAP_ANONYMOUS;
+    } else {
+        flags |= MAP_NORESERVE;
+    }
+#else
+    fd = -1;
+    flags |= MAP_ANONYMOUS;
+#endif
+
+    return mmap(0, size, PROT_NONE, flags, fd, 0);
+}
+
 static inline size_t mmap_guard_pagesize(int fd)
 {
 #if defined(__powerpc64__) && defined(__linux__)
@@ -104,7 +136,6 @@ void *qemu_ram_mmap(int fd,
     int prot;
     int flags;
     int map_sync_flags = 0;
-    int guardfd;
     size_t offset;
     size_t total;
     void *guardptr;
@@ -116,30 +147,7 @@ void *qemu_ram_mmap(int fd,
      */
     total = size + align;
 
-#if defined(__powerpc64__) && defined(__linux__)
-    /* On ppc64 mappings in the same segment (aka slice) must share the same
-     * page size. Since we will be re-allocating part of this segment
-     * from the supplied fd, we should make sure to use the same page size, to
-     * this end we mmap the supplied fd.  In this case, set MAP_NORESERVE to
-     * avoid allocating backing store memory.
-     * We do this unless we are using the system page size, in which case
-     * anonymous memory is OK.
-     */
-    flags = MAP_PRIVATE;
-    if (fd == -1 || guard_pagesize == qemu_real_host_page_size) {
-        guardfd = -1;
-        flags |= MAP_ANONYMOUS;
-    } else {
-        guardfd = fd;
-        flags |= MAP_NORESERVE;
-    }
-#else
-    guardfd = -1;
-    flags = MAP_PRIVATE | MAP_ANONYMOUS;
-#endif
-
-    guardptr = mmap(0, total, PROT_NONE, flags, guardfd, 0);
-
+    guardptr = mmap_reserve(total, fd);
     if (guardptr == MAP_FAILED) {
         return MAP_FAILED;
     }
-- 
2.29.2


