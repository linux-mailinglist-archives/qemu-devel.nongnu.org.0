Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A36B3788F5
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 13:49:36 +0200 (CEST)
Received: from localhost ([::1]:54782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg4Pn-0008H1-2E
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 07:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lg4Ka-0000G6-7l
 for qemu-devel@nongnu.org; Mon, 10 May 2021 07:44:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lg4KX-0003h2-RD
 for qemu-devel@nongnu.org; Mon, 10 May 2021 07:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620647049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1AuyFLgbrhSLl+Xc/bn3QakF+zY/5tyHpGNlgisVbh8=;
 b=ahUNEWGpLxAuhZvdgLlnJGbgvSvXH2w9WHexQhmB65mnAEOQ0BQjv+bAB2421el4i+0txb
 BFKrtP6pOSR1Qr54rlsLCntfXO4082CEEalIEbm+9ItqcdqkPCB39efvNCTE8UuYZsKlCs
 kMdpy8sF7ba9syG8KiaFvUo5nCHbvaQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-0KS_RDyAMbWCxrOyUyL4OA-1; Mon, 10 May 2021 07:44:08 -0400
X-MC-Unique: 0KS_RDyAMbWCxrOyUyL4OA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C24D801817;
 Mon, 10 May 2021 11:44:03 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-137.ams2.redhat.com [10.36.114.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACF1F1007606;
 Mon, 10 May 2021 11:44:01 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 03/15] util/mmap-alloc: Factor out activating of memory to
 mmap_activate()
Date: Mon, 10 May 2021 13:43:16 +0200
Message-Id: <20210510114328.21835-4-david@redhat.com>
In-Reply-To: <20210510114328.21835-1-david@redhat.com>
References: <20210510114328.21835-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to activate memory within a reserved memory region, to make it
accessible. Let's factor that out.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 util/mmap-alloc.c | 94 +++++++++++++++++++++++++----------------------
 1 file changed, 50 insertions(+), 44 deletions(-)

diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 223d66219c..0e2bd7bc0e 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -114,6 +114,52 @@ static void *mmap_reserve(size_t size, int fd)
     return mmap(0, size, PROT_NONE, flags, fd, 0);
 }
 
+/*
+ * Activate memory in a reserved region from the given fd (if any), to make
+ * it accessible.
+ */
+static void *mmap_activate(void *ptr, size_t size, int fd, bool readonly,
+                           bool shared, bool is_pmem, off_t map_offset)
+{
+    const int prot = PROT_READ | (readonly ? 0 : PROT_WRITE);
+    int map_sync_flags = 0;
+    int flags = MAP_FIXED;
+    void *activated_ptr;
+
+    flags |= fd == -1 ? MAP_ANONYMOUS : 0;
+    flags |= shared ? MAP_SHARED : MAP_PRIVATE;
+    if (shared && is_pmem) {
+        map_sync_flags = MAP_SYNC | MAP_SHARED_VALIDATE;
+    }
+
+    activated_ptr = mmap(ptr, size, prot, flags | map_sync_flags, fd,
+                         map_offset);
+    if (activated_ptr == MAP_FAILED && map_sync_flags) {
+        if (errno == ENOTSUP) {
+            char *proc_link = g_strdup_printf("/proc/self/fd/%d", fd);
+            char *file_name = g_malloc0(PATH_MAX);
+            int len = readlink(proc_link, file_name, PATH_MAX - 1);
+
+            if (len < 0) {
+                len = 0;
+            }
+            file_name[len] = '\0';
+            fprintf(stderr, "Warning: requesting persistence across crashes "
+                    "for backend file %s failed. Proceeding without "
+                    "persistence, data might become corrupted in case of host "
+                    "crash.\n", file_name);
+            g_free(proc_link);
+            g_free(file_name);
+        }
+        /*
+         * If mmap failed with MAP_SHARED_VALIDATE | MAP_SYNC, we will try
+         * again without these flags to handle backwards compatibility.
+         */
+        activated_ptr = mmap(ptr, size, prot, flags, fd, map_offset);
+    }
+    return activated_ptr;
+}
+
 static inline size_t mmap_guard_pagesize(int fd)
 {
 #if defined(__powerpc64__) && defined(__linux__)
@@ -133,13 +179,8 @@ void *qemu_ram_mmap(int fd,
                     off_t map_offset)
 {
     const size_t guard_pagesize = mmap_guard_pagesize(fd);
-    int prot;
-    int flags;
-    int map_sync_flags = 0;
-    size_t offset;
-    size_t total;
-    void *guardptr;
-    void *ptr;
+    size_t offset, total;
+    void *ptr, *guardptr;
 
     /*
      * Note: this always allocates at least one extra page of virtual address
@@ -156,45 +197,10 @@ void *qemu_ram_mmap(int fd,
     /* Always align to host page size */
     assert(align >= guard_pagesize);
 
-    flags = MAP_FIXED;
-    flags |= fd == -1 ? MAP_ANONYMOUS : 0;
-    flags |= shared ? MAP_SHARED : MAP_PRIVATE;
-    if (shared && is_pmem) {
-        map_sync_flags = MAP_SYNC | MAP_SHARED_VALIDATE;
-    }
-
     offset = QEMU_ALIGN_UP((uintptr_t)guardptr, align) - (uintptr_t)guardptr;
 
-    prot = PROT_READ | (readonly ? 0 : PROT_WRITE);
-
-    ptr = mmap(guardptr + offset, size, prot,
-               flags | map_sync_flags, fd, map_offset);
-
-    if (ptr == MAP_FAILED && map_sync_flags) {
-        if (errno == ENOTSUP) {
-            char *proc_link, *file_name;
-            int len;
-            proc_link = g_strdup_printf("/proc/self/fd/%d", fd);
-            file_name = g_malloc0(PATH_MAX);
-            len = readlink(proc_link, file_name, PATH_MAX - 1);
-            if (len < 0) {
-                len = 0;
-            }
-            file_name[len] = '\0';
-            fprintf(stderr, "Warning: requesting persistence across crashes "
-                    "for backend file %s failed. Proceeding without "
-                    "persistence, data might become corrupted in case of host "
-                    "crash.\n", file_name);
-            g_free(proc_link);
-            g_free(file_name);
-        }
-        /*
-         * if map failed with MAP_SHARED_VALIDATE | MAP_SYNC,
-         * we will remove these flags to handle compatibility.
-         */
-        ptr = mmap(guardptr + offset, size, prot, flags, fd, map_offset);
-    }
-
+    ptr = mmap_activate(guardptr + offset, size, fd, readonly, shared, is_pmem,
+                        map_offset);
     if (ptr == MAP_FAILED) {
         munmap(guardptr, total);
         return MAP_FAILED;
-- 
2.30.2


