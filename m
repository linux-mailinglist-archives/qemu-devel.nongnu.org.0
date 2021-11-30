Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72B646317E
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 11:46:59 +0100 (CET)
Received: from localhost ([::1]:43462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms0f4-00050t-SD
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 05:46:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ms0aA-0005bL-Id
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 05:41:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ms0a8-00010h-Nr
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 05:41:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638268912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FuqDVk/VmU0BGNDYQ+fzVu3fCHn52LEbJwMF35lPkRA=;
 b=IVmLPMqt4kicVXkT+Zt33yuUWjlHttdcZGxh02iu7cGls7R8wAKFbr9iT+vx0+GCFDLWkL
 KFp3wAhO5wE0Z2F7cOKLTvoqM24oTrIwZ7lLB5PAfBjNGF0arS7LH6119+QX9A4oc5PocJ
 SrVfw65w+joij9Aqyhox1XxFdgS/K30=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-eAv_ePAIOXGY_UlF_H3x1g-1; Tue, 30 Nov 2021 05:41:48 -0500
X-MC-Unique: eAv_ePAIOXGY_UlF_H3x1g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66578192CC41;
 Tue, 30 Nov 2021 10:41:47 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F30A100AE22;
 Tue, 30 Nov 2021 10:41:44 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/8] util/oslib-posix: Support MADV_POPULATE_WRITE for
 os_mem_prealloc()
Date: Tue, 30 Nov 2021 11:41:30 +0100
Message-Id: <20211130104136.40927-3-david@redhat.com>
In-Reply-To: <20211130104136.40927-1-david@redhat.com>
References: <20211130104136.40927-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Michal=20Pr=C3=ADvozn=C3=ADk?= <mprivozn@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Pankaj Gupta <pankaj.gupta@ionos.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's sense support and use it for preallocation. MADV_POPULATE_WRITE
does not require a SIGBUS handler, doesn't actually touch page content,
and avoids context switches; it is, therefore, faster and easier to handle
than our current approach.

While MADV_POPULATE_WRITE is, in general, faster than manual
prefaulting, and especially faster with 4k pages, there is still value in
prefaulting using multiple threads to speed up preallocation.

More details on MADV_POPULATE_WRITE can be found in the Linux commits
4ca9b3859dac ("mm/madvise: introduce MADV_POPULATE_(READ|WRITE) to prefault
page tables") and eb2faa513c24 ("mm/madvise: report SIGBUS as -EFAULT for
MADV_POPULATE_(READ|WRITE)"), and in the man page proposal [1].

This resolves the TODO in do_touch_pages().

In the future, we might want to look into using fallocate(), eventually
combined with MADV_POPULATE_READ, when dealing with shared file/fd
mappings and not caring about memory bindings.

[1] https://lkml.kernel.org/r/20210816081922.5155-1-david@redhat.com

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/qemu/osdep.h |  7 ++++
 util/oslib-posix.c   | 83 +++++++++++++++++++++++++++++++++-----------
 2 files changed, 69 insertions(+), 21 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 60718fc342..d1660d67fa 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -471,6 +471,11 @@ static inline void qemu_cleanup_generic_vfree(void *p)
 #else
 #define QEMU_MADV_REMOVE QEMU_MADV_DONTNEED
 #endif
+#ifdef MADV_POPULATE_WRITE
+#define QEMU_MADV_POPULATE_WRITE MADV_POPULATE_WRITE
+#else
+#define QEMU_MADV_POPULATE_WRITE QEMU_MADV_INVALID
+#endif
 
 #elif defined(CONFIG_POSIX_MADVISE)
 
@@ -484,6 +489,7 @@ static inline void qemu_cleanup_generic_vfree(void *p)
 #define QEMU_MADV_HUGEPAGE  QEMU_MADV_INVALID
 #define QEMU_MADV_NOHUGEPAGE  QEMU_MADV_INVALID
 #define QEMU_MADV_REMOVE QEMU_MADV_DONTNEED
+#define QEMU_MADV_POPULATE_WRITE QEMU_MADV_INVALID
 
 #else /* no-op */
 
@@ -497,6 +503,7 @@ static inline void qemu_cleanup_generic_vfree(void *p)
 #define QEMU_MADV_HUGEPAGE  QEMU_MADV_INVALID
 #define QEMU_MADV_NOHUGEPAGE  QEMU_MADV_INVALID
 #define QEMU_MADV_REMOVE QEMU_MADV_INVALID
+#define QEMU_MADV_POPULATE_WRITE QEMU_MADV_INVALID
 
 #endif
 
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index b146beef78..cb89e07770 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -484,10 +484,6 @@ static void *do_touch_pages(void *arg)
              *
              * 'volatile' to stop compiler optimizing this away
              * to a no-op
-             *
-             * TODO: get a better solution from kernel so we
-             * don't need to write at all so we don't cause
-             * wear on the storage backing the region...
              */
             *(volatile char *)addr = *addr;
             addr += hpagesize;
@@ -497,6 +493,26 @@ static void *do_touch_pages(void *arg)
     return (void *)(uintptr_t)ret;
 }
 
+static void *do_madv_populate_write_pages(void *arg)
+{
+    MemsetThread *memset_args = (MemsetThread *)arg;
+    const size_t size = memset_args->numpages * memset_args->hpagesize;
+    char * const addr = memset_args->addr;
+    int ret = 0;
+
+    /* See do_touch_pages(). */
+    qemu_mutex_lock(&page_mutex);
+    while (!threads_created_flag) {
+        qemu_cond_wait(&page_cond, &page_mutex);
+    }
+    qemu_mutex_unlock(&page_mutex);
+
+    if (size && qemu_madvise(addr, size, QEMU_MADV_POPULATE_WRITE)) {
+        ret = -errno;
+    }
+    return (void *)(uintptr_t)ret;
+}
+
 static inline int get_memset_num_threads(int smp_cpus)
 {
     long host_procs = sysconf(_SC_NPROCESSORS_ONLN);
@@ -510,10 +526,11 @@ static inline int get_memset_num_threads(int smp_cpus)
 }
 
 static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
-                           int smp_cpus)
+                           int smp_cpus, bool use_madv_populate_write)
 {
     static gsize initialized = 0;
     size_t numpages_per_thread, leftover;
+    void *(*touch_fn)(void *);
     int ret = 0, i = 0;
     char *addr = area;
 
@@ -523,6 +540,12 @@ static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
         g_once_init_leave(&initialized, 1);
     }
 
+    if (use_madv_populate_write) {
+        touch_fn = do_madv_populate_write_pages;
+    } else {
+        touch_fn = do_touch_pages;
+    }
+
     threads_created_flag = false;
     memset_num_threads = get_memset_num_threads(smp_cpus);
     memset_thread = g_new0(MemsetThread, memset_num_threads);
@@ -533,7 +556,7 @@ static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
         memset_thread[i].numpages = numpages_per_thread + (i < leftover);
         memset_thread[i].hpagesize = hpagesize;
         qemu_thread_create(&memset_thread[i].pgthread, "touch_pages",
-                           do_touch_pages, &memset_thread[i],
+                           touch_fn, &memset_thread[i],
                            QEMU_THREAD_JOINABLE);
         addr += memset_thread[i].numpages * hpagesize;
     }
@@ -556,6 +579,12 @@ static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
     return ret;
 }
 
+static bool madv_populate_write_possible(char *area, size_t pagesize)
+{
+    return !qemu_madvise(area, pagesize, QEMU_MADV_POPULATE_WRITE) ||
+           errno != EINVAL;
+}
+
 void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
                      Error **errp)
 {
@@ -563,30 +592,42 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
     struct sigaction act, oldact;
     size_t hpagesize = qemu_fd_getpagesize(fd);
     size_t numpages = DIV_ROUND_UP(memory, hpagesize);
+    bool use_madv_populate_write;
 
-    memset(&act, 0, sizeof(act));
-    act.sa_handler = &sigbus_handler;
-    act.sa_flags = 0;
-
-    ret = sigaction(SIGBUS, &act, &oldact);
-    if (ret) {
-        error_setg_errno(errp, errno,
-            "os_mem_prealloc: failed to install signal handler");
-        return;
+    /*
+     * Sense on every invocation, as MADV_POPULATE_WRITE cannot be used for
+     * some special mappings, such as mapping /dev/mem.
+     */
+    use_madv_populate_write = madv_populate_write_possible(area, hpagesize);
+
+    if (!use_madv_populate_write) {
+        memset(&act, 0, sizeof(act));
+        act.sa_handler = &sigbus_handler;
+        act.sa_flags = 0;
+
+        ret = sigaction(SIGBUS, &act, &oldact);
+        if (ret) {
+            error_setg_errno(errp, errno,
+                "os_mem_prealloc: failed to install signal handler");
+            return;
+        }
     }
 
     /* touch pages simultaneously */
-    ret = touch_all_pages(area, hpagesize, numpages, smp_cpus);
+    ret = touch_all_pages(area, hpagesize, numpages, smp_cpus,
+                          use_madv_populate_write);
     if (ret) {
         error_setg_errno(errp, -ret,
                          "os_mem_prealloc: preallocating memory failed");
     }
 
-    ret = sigaction(SIGBUS, &oldact, NULL);
-    if (ret) {
-        /* Terminate QEMU since it can't recover from error */
-        perror("os_mem_prealloc: failed to reinstall signal handler");
-        exit(1);
+    if (!use_madv_populate_write) {
+        ret = sigaction(SIGBUS, &oldact, NULL);
+        if (ret) {
+            /* Terminate QEMU since it can't recover from error */
+            perror("os_mem_prealloc: failed to reinstall signal handler");
+            exit(1);
+        }
     }
 }
 
-- 
2.31.1


