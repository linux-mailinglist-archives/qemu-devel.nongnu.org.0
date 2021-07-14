Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D463C83D9
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 13:25:53 +0200 (CEST)
Received: from localhost ([::1]:60482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3d1U-0003EK-F2
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 07:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m3czB-0000hV-QC
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 07:23:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m3cz9-0007rf-VM
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 07:23:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626261807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v9MM6B2QJGKsy+4sX43eJugclE59Bro/XzlqqeBD3bU=;
 b=U4WkFDGaoPxEHGsYi3HL0fGS0aw7S2gaD4UlHFobfy9yuutNgZkqkGQrCr2mjdlADukq0g
 Pl3SBVYTIrXks3r8Bz7hTddyaSk/XVRM0AzsaP9OrZIdIyihBxckPQewuFF8pt3mQmDfgH
 Iuun/gqnMvyG+Om8S5QcufHsyOT+UzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-wuJQd4B3Py6yQ0cBFNRkaA-1; Wed, 14 Jul 2021 07:23:23 -0400
X-MC-Unique: wuJQd4B3Py6yQ0cBFNRkaA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4485100CCC2;
 Wed, 14 Jul 2021 11:23:22 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-63.ams2.redhat.com [10.36.114.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8F03100F49F;
 Wed, 14 Jul 2021 11:23:16 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/3] util/oslib-posix: Support MADV_POPULATE_WRITE for
 os_mem_prealloc()
Date: Wed, 14 Jul 2021 13:23:04 +0200
Message-Id: <20210714112306.67793-2-david@redhat.com>
In-Reply-To: <20210714112306.67793-1-david@redhat.com>
References: <20210714112306.67793-1-david@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's sense support and use it for preallocation. MADV_POPULATE_WRITE
does not require a SIGBUS handler, doesn't actually touch page content,
and avoids context switches; it is, therefore, faster and easier to handle
than our current approach.

This resolves the TODO in do_touch_pages().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/qemu/osdep.h |  7 ++++
 util/oslib-posix.c   | 84 +++++++++++++++++++++++++++++++++-----------
 2 files changed, 71 insertions(+), 20 deletions(-)

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
index e8bdb02e1d..679796ac1f 100644
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
@@ -497,6 +493,27 @@ static void *do_touch_pages(void *arg)
     return NULL;
 }
 
+static void *do_madv_populate_write_pages(void *arg)
+{
+    MemsetThread *memset_args = (MemsetThread *)arg;
+    const size_t size = memset_args->numpages * memset_args->hpagesize;
+    char * const addr = memset_args->addr;
+    int ret;
+
+    /* See do_touch_pages(). */
+    qemu_mutex_lock(&page_mutex);
+    while (!threads_created_flag) {
+        qemu_cond_wait(&page_cond, &page_mutex);
+    }
+    qemu_mutex_unlock(&page_mutex);
+
+    ret = qemu_madvise(addr, size, QEMU_MADV_POPULATE_WRITE);
+    if (ret) {
+        memset_thread_failed = true;
+    }
+    return NULL;
+}
+
 static inline int get_memset_num_threads(int smp_cpus)
 {
     long host_procs = sysconf(_SC_NPROCESSORS_ONLN);
@@ -510,10 +527,11 @@ static inline int get_memset_num_threads(int smp_cpus)
 }
 
 static bool touch_all_pages(char *area, size_t hpagesize, size_t numpages,
-                            int smp_cpus)
+                            int smp_cpus, bool use_madv_populate_write)
 {
     static gsize initialized = 0;
     size_t numpages_per_thread, leftover;
+    void *(*touch_fn)(void *);
     char *addr = area;
     int i = 0;
 
@@ -523,6 +541,12 @@ static bool touch_all_pages(char *area, size_t hpagesize, size_t numpages,
         g_once_init_leave(&initialized, 1);
     }
 
+    if (use_madv_populate_write) {
+        touch_fn = do_madv_populate_write_pages;
+    } else {
+        touch_fn = do_touch_pages;
+    }
+
     memset_thread_failed = false;
     threads_created_flag = false;
     memset_num_threads = get_memset_num_threads(smp_cpus);
@@ -534,7 +558,7 @@ static bool touch_all_pages(char *area, size_t hpagesize, size_t numpages,
         memset_thread[i].numpages = numpages_per_thread + (i < leftover);
         memset_thread[i].hpagesize = hpagesize;
         qemu_thread_create(&memset_thread[i].pgthread, "touch_pages",
-                           do_touch_pages, &memset_thread[i],
+                           touch_fn, &memset_thread[i],
                            QEMU_THREAD_JOINABLE);
         addr += memset_thread[i].numpages * hpagesize;
     }
@@ -553,6 +577,12 @@ static bool touch_all_pages(char *area, size_t hpagesize, size_t numpages,
     return memset_thread_failed;
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
@@ -560,29 +590,43 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
     struct sigaction act, oldact;
     size_t hpagesize = qemu_fd_getpagesize(fd);
     size_t numpages = DIV_ROUND_UP(memory, hpagesize);
+    bool use_madv_populate_write;
+
+    /*
+     * Sense on every invocation, as MADV_POPULATE_WRITE cannot be used for
+     * some special mappings, such as mapping /dev/mem.
+     */
+    if (madv_populate_write_possible(area, hpagesize)) {
+        use_madv_populate_write = true;
+    }
 
-    memset(&act, 0, sizeof(act));
-    act.sa_handler = &sigbus_handler;
-    act.sa_flags = 0;
+    if (!use_madv_populate_write) {
+        memset(&act, 0, sizeof(act));
+        act.sa_handler = &sigbus_handler;
+        act.sa_flags = 0;
 
-    ret = sigaction(SIGBUS, &act, &oldact);
-    if (ret) {
-        error_setg_errno(errp, errno,
-            "os_mem_prealloc: failed to install signal handler");
-        return;
+        ret = sigaction(SIGBUS, &act, &oldact);
+        if (ret) {
+            error_setg_errno(errp, errno,
+                "os_mem_prealloc: failed to install signal handler");
+            return;
+        }
     }
 
     /* touch pages simultaneously */
-    if (touch_all_pages(area, hpagesize, numpages, smp_cpus)) {
+    if (touch_all_pages(area, hpagesize, numpages, smp_cpus,
+                        use_madv_populate_write)) {
         error_setg(errp, "os_mem_prealloc: Insufficient free host memory "
             "pages available to allocate guest RAM");
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


