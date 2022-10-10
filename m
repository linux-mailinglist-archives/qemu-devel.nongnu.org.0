Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2375F9BD5
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 11:27:09 +0200 (CEST)
Received: from localhost ([::1]:58824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohp3z-0001zv-Gy
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 05:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ohoov-0003FN-TO
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:11:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ohoor-0000z1-4M
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:11:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665393088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JmU4qW/qMHX4cizrbM9+JYbp01hAFOZCMtWcHYj6Cu4=;
 b=NWDZG7MiV74QECwrNysNkNzNkPbWWGO0C1ipjQbtLgBPp6gBo9wn1krOzR/qZdzgO04kZg
 m12AbqzXilS8gfGF1KiFodjZ2cN6pVJGqQsHxfR0FGO6DF4e7FVwmrtOVxLBkHpf+NgTZS
 ji1sANsqAtXr5Lawr3WmyiZ9ES5xr94=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-Zy9yR3VtPN2XashvtoMaPw-1; Mon, 10 Oct 2022 05:11:25 -0400
X-MC-Unique: Zy9yR3VtPN2XashvtoMaPw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF03185A59D;
 Mon, 10 Oct 2022 09:11:24 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F4092112D164;
 Mon, 10 Oct 2022 09:11:21 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PATCH v2 1/7] util: Cleanup and rename os_mem_prealloc()
Date: Mon, 10 Oct 2022 11:11:11 +0200
Message-Id: <20221010091117.88603-2-david@redhat.com>
In-Reply-To: <20221010091117.88603-1-david@redhat.com>
References: <20221010091117.88603-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's
* give the function a "qemu_*" style name
* make sure the parameters in the implementation match the prototype
* rename smp_cpus to max_threads, which makes the semantics of that
  parameter clearer

... and add a function documentation.

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 backends/hostmem.c     |  6 +++---
 hw/virtio/virtio-mem.c |  2 +-
 include/qemu/osdep.h   | 17 +++++++++++++++--
 softmmu/cpus.c         |  2 +-
 util/oslib-posix.c     | 24 ++++++++++++------------
 util/oslib-win32.c     |  8 ++++----
 6 files changed, 36 insertions(+), 23 deletions(-)

diff --git a/backends/hostmem.c b/backends/hostmem.c
index 4428e06738..491cb10b97 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -232,7 +232,7 @@ static void host_memory_backend_set_prealloc(Object *obj, bool value,
         void *ptr = memory_region_get_ram_ptr(&backend->mr);
         uint64_t sz = memory_region_size(&backend->mr);
 
-        os_mem_prealloc(fd, ptr, sz, backend->prealloc_threads, &local_err);
+        qemu_prealloc_mem(fd, ptr, sz, backend->prealloc_threads, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return;
@@ -383,8 +383,8 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
          * specified NUMA policy in place.
          */
         if (backend->prealloc) {
-            os_mem_prealloc(memory_region_get_fd(&backend->mr), ptr, sz,
-                            backend->prealloc_threads, &local_err);
+            qemu_prealloc_mem(memory_region_get_fd(&backend->mr), ptr, sz,
+                              backend->prealloc_threads, &local_err);
             if (local_err) {
                 goto out;
             }
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 30d03e987a..0e9ef4ff19 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -467,7 +467,7 @@ static int virtio_mem_set_block_state(VirtIOMEM *vmem, uint64_t start_gpa,
             int fd = memory_region_get_fd(&vmem->memdev->mr);
             Error *local_err = NULL;
 
-            os_mem_prealloc(fd, area, size, 1, &local_err);
+            qemu_prealloc_mem(fd, area, size, 1, &local_err);
             if (local_err) {
                 static bool warned;
 
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index b1c161c035..e556e45143 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -568,8 +568,21 @@ unsigned long qemu_getauxval(unsigned long type);
 
 void qemu_set_tty_echo(int fd, bool echo);
 
-void os_mem_prealloc(int fd, char *area, size_t sz, int smp_cpus,
-                     Error **errp);
+/**
+ * qemu_prealloc_mem:
+ * @fd: the fd mapped into the area, -1 for anonymous memory
+ * @area: start address of the are to preallocate
+ * @sz: the size of the area to preallocate
+ * @max_threads: maximum number of threads to use
+ * @errp: returns an error if this function fails
+ *
+ * Preallocate memory (populate/prefault page tables writable) for the virtual
+ * memory area starting at @area with the size of @sz. After a successful call,
+ * each page in the area was faulted in writable at least once, for example,
+ * after allocating file blocks for mapped files.
+ */
+void qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
+                       Error **errp);
 
 /**
  * qemu_get_pid_name:
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 61b27ff59d..01c94fd298 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -354,7 +354,7 @@ static void qemu_init_sigbus(void)
 
     /*
      * ALERT: when modifying this, take care that SIGBUS forwarding in
-     * os_mem_prealloc() will continue working as expected.
+     * qemu_prealloc_mem() will continue working as expected.
      */
     memset(&action, 0, sizeof(action));
     action.sa_flags = SA_SIGINFO;
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 827a7aadba..905cbc27cc 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -329,7 +329,7 @@ static void sigbus_handler(int signal)
         return;
     }
 #endif /* CONFIG_LINUX */
-    warn_report("os_mem_prealloc: unrelated SIGBUS detected and ignored");
+    warn_report("qemu_prealloc_mem: unrelated SIGBUS detected and ignored");
 }
 
 static void *do_touch_pages(void *arg)
@@ -399,13 +399,13 @@ static void *do_madv_populate_write_pages(void *arg)
 }
 
 static inline int get_memset_num_threads(size_t hpagesize, size_t numpages,
-                                         int smp_cpus)
+                                         int max_threads)
 {
     long host_procs = sysconf(_SC_NPROCESSORS_ONLN);
     int ret = 1;
 
     if (host_procs > 0) {
-        ret = MIN(MIN(host_procs, MAX_MEM_PREALLOC_THREAD_COUNT), smp_cpus);
+        ret = MIN(MIN(host_procs, MAX_MEM_PREALLOC_THREAD_COUNT), max_threads);
     }
 
     /* Especially with gigantic pages, don't create more threads than pages. */
@@ -418,11 +418,11 @@ static inline int get_memset_num_threads(size_t hpagesize, size_t numpages,
 }
 
 static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
-                           int smp_cpus, bool use_madv_populate_write)
+                           int max_threads, bool use_madv_populate_write)
 {
     static gsize initialized = 0;
     MemsetContext context = {
-        .num_threads = get_memset_num_threads(hpagesize, numpages, smp_cpus),
+        .num_threads = get_memset_num_threads(hpagesize, numpages, max_threads),
     };
     size_t numpages_per_thread, leftover;
     void *(*touch_fn)(void *);
@@ -494,13 +494,13 @@ static bool madv_populate_write_possible(char *area, size_t pagesize)
            errno != EINVAL;
 }
 
-void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
-                     Error **errp)
+void qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
+                       Error **errp)
 {
     static gsize initialized;
     int ret;
     size_t hpagesize = qemu_fd_getpagesize(fd);
-    size_t numpages = DIV_ROUND_UP(memory, hpagesize);
+    size_t numpages = DIV_ROUND_UP(sz, hpagesize);
     bool use_madv_populate_write;
     struct sigaction act;
 
@@ -530,24 +530,24 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
         if (ret) {
             qemu_mutex_unlock(&sigbus_mutex);
             error_setg_errno(errp, errno,
-                "os_mem_prealloc: failed to install signal handler");
+                "qemu_prealloc_mem: failed to install signal handler");
             return;
         }
     }
 
     /* touch pages simultaneously */
-    ret = touch_all_pages(area, hpagesize, numpages, smp_cpus,
+    ret = touch_all_pages(area, hpagesize, numpages, max_threads,
                           use_madv_populate_write);
     if (ret) {
         error_setg_errno(errp, -ret,
-                         "os_mem_prealloc: preallocating memory failed");
+                         "qemu_prealloc_mem: preallocating memory failed");
     }
 
     if (!use_madv_populate_write) {
         ret = sigaction(SIGBUS, &sigbus_oldact, NULL);
         if (ret) {
             /* Terminate QEMU since it can't recover from error */
-            perror("os_mem_prealloc: failed to reinstall signal handler");
+            perror("qemu_prealloc_mem: failed to reinstall signal handler");
             exit(1);
         }
         qemu_mutex_unlock(&sigbus_mutex);
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 5723d3eb4c..e1cb725ecc 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -268,14 +268,14 @@ int getpagesize(void)
     return system_info.dwPageSize;
 }
 
-void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
-                     Error **errp)
+void qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
+                       Error **errp)
 {
     int i;
     size_t pagesize = qemu_real_host_page_size();
 
-    memory = (memory + pagesize - 1) & -pagesize;
-    for (i = 0; i < memory / pagesize; i++) {
+    sz = (sz + pagesize - 1) & -pagesize;
+    for (i = 0; i < sz / pagesize; i++) {
         memset(area + pagesize * i, 0, 1);
     }
 }
-- 
2.37.3


