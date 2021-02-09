Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AE83150FF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 14:56:35 +0100 (CET)
Received: from localhost ([::1]:38154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9TVK-0007qX-S0
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 08:56:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l9TPm-0002TA-4g
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:50:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l9TPc-0005IE-Sa
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:50:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612878640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XdaS7okp619II8UKBgP2/duGtymX+5MXrqjxkpAQe34=;
 b=BUdMkX7dp3dGo2kShtMRXpRPqwhBc8rzUqRIZlUzR5Z/Y3hZHhECKJIjqaqlCurLNn9SnH
 YzEuBRoP2Btmx5gHA3xQRpoA5Xv2t2XokIWpGvZkc+YMw3qYsUviOiKCQosshBtgIVUbTm
 DMzbDRlgUa7XJvOXr9zwTxDox8NdVoA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200--6Ai2bvNPNCxwU0hX2MVrg-1; Tue, 09 Feb 2021 08:50:37 -0500
X-MC-Unique: -6Ai2bvNPNCxwU0hX2MVrg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C713835E20;
 Tue,  9 Feb 2021 13:50:35 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-141.ams2.redhat.com [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 900F87086A;
 Tue,  9 Feb 2021 13:50:28 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 4/9] util/mmap-alloc: factor out activating of memory to
 mmap_activate()
Date: Tue,  9 Feb 2021 14:49:34 +0100
Message-Id: <20210209134939.13083-5-david@redhat.com>
In-Reply-To: <20210209134939.13083-1-david@redhat.com>
References: <20210209134939.13083-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>,
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
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to activate memory within a reserved memory region, to make it
accessible. Let's factor that out.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 util/mmap-alloc.c | 91 +++++++++++++++++++++++++----------------------
 1 file changed, 48 insertions(+), 43 deletions(-)

diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 5c2bfe4c99..b50dc86a3c 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -114,6 +114,51 @@ static void *mmap_reserve(size_t size, int fd)
     return mmap(0, size, PROT_NONE, flags, fd, 0);
 }
 
+/*
+ * Activate memory in a reserved region from the given fd (if any), to make
+ * it accessible.
+ */
+static void *mmap_activate(void *ptr, size_t size, int fd, bool readonly,
+                           bool shared, bool is_pmem)
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
+    activated_ptr = mmap(ptr, size, prot, flags | map_sync_flags, fd, 0);
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
+        activated_ptr = mmap(ptr, size, prot, flags, fd, 0);
+    }
+    return activated_ptr;
+}
+
 static inline size_t mmap_guard_pagesize(int fd)
 {
 #if defined(__powerpc64__) && defined(__linux__)
@@ -132,13 +177,8 @@ void *qemu_ram_mmap(int fd,
                     bool is_pmem)
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
@@ -155,44 +195,9 @@ void *qemu_ram_mmap(int fd,
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
-    ptr = mmap(guardptr + offset, size, prot, flags | map_sync_flags, fd, 0);
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
-        ptr = mmap(guardptr + offset, size, prot, flags, fd, 0);
-    }
-
+    ptr = mmap_activate(guardptr + offset, size, fd, readonly, shared, is_pmem);
     if (ptr == MAP_FAILED) {
         munmap(guardptr, total);
         return MAP_FAILED;
-- 
2.29.2


