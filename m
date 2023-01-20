Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F75675630
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 14:57:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIrs9-0007nM-Mk; Fri, 20 Jan 2023 08:56:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1pIrs5-0007mJ-1n
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:55:57 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1pIrs2-0001n6-Ow
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:55:56 -0500
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id F10AD5FD79;
 Fri, 20 Jan 2023 16:48:04 +0300 (MSK)
Received: from d-tatianin-nix.yandex.net (unknown
 [2a02:6b8:0:419:8f3f:2197:162b:4096])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 wlngUQ0WWiE1-uHMgKX7j; Fri, 20 Jan 2023 16:48:04 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1674222484; bh=o94S0ghzsViae90R7vBqSqgRMFVyIdapQaUB50thZWs=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=DTQ7LCKX+li9YBbXe/JPabqkBBInDy8blSMswuSHY9G46Caii/XhZZZ9CG3X2wPqT
 JaJsetCprMqXgyyQ2PjdhAVcB5d6b2SD1udUxdBnlqVlVeogbT4BQwhcy9bNGeaqCR
 2F3hVLA+/kN2Oa1MEG6Poy5HSFq5caTFUBqYluhw=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Daniil Tatianin <d-tatianin@yandex-team.ru>, qemu-devel@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, David Hildenbrand <david@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, yc-core@yandex-team.ru
Subject: [PATCH 1/4] oslib: introduce new qemu_prealloc_mem_with_timeout() api
Date: Fri, 20 Jan 2023 16:47:46 +0300
Message-Id: <20230120134749.550639-2-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230120134749.550639-1-d-tatianin@yandex-team.ru>
References: <20230120134749.550639-1-d-tatianin@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This helper allows limiting the maximum amount time to be spent
preallocating a block of memory, which is important on systems that
might have unpredictable page allocation delays because of possible
fragmentation or other reasons specific to the backend.

It also exposes a way to register a callback that is invoked in case the
specified timeout is exceeded. The callback is provided with a
PreallocStats structure that includes a bunch of statistics about the
progress including total & allocated number of pages, as well as page
size and number of allocation threads.

The win32 implementation is currently a stub that just calls into the
old qemu_prealloc_mem api.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
---
 include/qemu/osdep.h |  19 ++++++++
 util/oslib-posix.c   | 114 +++++++++++++++++++++++++++++++++++++++----
 util/oslib-win32.c   |   9 ++++
 3 files changed, 133 insertions(+), 9 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index bd23a08595..21757e5144 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -595,6 +595,25 @@ typedef struct ThreadContext ThreadContext;
 void qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
                        ThreadContext *tc, Error **errp);
 
+typedef struct PreallocStats {
+    size_t page_size;
+    size_t total_pages;
+    size_t allocated_pages;
+    int threads;
+    time_t seconds_elapsed;
+} PreallocStats;
+
+typedef struct PreallocTimeout {
+    time_t seconds;
+    void *user;
+    void (*on_timeout)(void *user, const PreallocStats *stats);
+} PreallocTimeout;
+
+void qemu_prealloc_mem_with_timeout(int fd, char *area, size_t sz,
+                                    int max_threads, ThreadContext *tc,
+                                    const PreallocTimeout *timeout,
+                                    Error **errp);
+
 /**
  * qemu_get_pid_name:
  * @pid: pid of a process
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 59a891b6a8..570fca601f 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -74,6 +74,7 @@ typedef struct MemsetContext {
     bool any_thread_failed;
     struct MemsetThread *threads;
     int num_threads;
+    PreallocStats stats;
 } MemsetContext;
 
 struct MemsetThread {
@@ -83,6 +84,7 @@ struct MemsetThread {
     QemuThread pgthread;
     sigjmp_buf env;
     MemsetContext *context;
+    size_t touched_pages;
 };
 typedef struct MemsetThread MemsetThread;
 
@@ -373,6 +375,7 @@ static void *do_touch_pages(void *arg)
              */
             *(volatile char *)addr = *addr;
             addr += hpagesize;
+            qatomic_inc(&memset_args->touched_pages);
         }
     }
     pthread_sigmask(SIG_SETMASK, &oldset, NULL);
@@ -396,6 +399,11 @@ static void *do_madv_populate_write_pages(void *arg)
     if (size && qemu_madvise(addr, size, QEMU_MADV_POPULATE_WRITE)) {
         ret = -errno;
     }
+
+    if (!ret) {
+        qatomic_set(&memset_args->touched_pages, memset_args->numpages);
+    }
+
     return (void *)(uintptr_t)ret;
 }
 
@@ -418,8 +426,68 @@ static inline int get_memset_num_threads(size_t hpagesize, size_t numpages,
     return ret;
 }
 
+static int do_join_memset_threads_with_timeout(MemsetContext *context,
+                                               time_t seconds)
+{
+    struct timespec ts;
+    int i = 0;
+
+    if (clock_gettime(CLOCK_REALTIME, &ts) < 0) {
+        return i;
+    }
+    ts.tv_sec += seconds;
+
+    for (; i < context->num_threads; ++i) {
+        if (pthread_timedjoin_np(context->threads[i].pgthread.thread,
+                                 NULL, &ts)) {
+            break;
+        }
+    }
+
+    return i;
+}
+
+static void memset_stats_count_pages(MemsetContext *context)
+{
+    int i;
+
+    for (i = 0; i < context->num_threads; ++i) {
+        size_t pages = qatomic_load_acquire(
+                            &context->threads[i].touched_pages);
+        context->stats.allocated_pages += pages;
+    }
+}
+
+static int timed_join_memset_threads(MemsetContext *context,
+                                     const PreallocTimeout *timeout)
+{
+    int i, off;
+    PreallocStats *stats = &context->stats;
+    off = do_join_memset_threads_with_timeout(context, timeout->seconds);
+
+    if (off != context->num_threads && timeout->on_timeout) {
+        memset_stats_count_pages(context);
+
+        /*
+         * Guard against possible races if preallocation finishes right
+         * after the timeout is exceeded.
+         */
+        if (stats->allocated_pages < stats->total_pages) {
+            stats->seconds_elapsed = timeout->seconds;
+            timeout->on_timeout(timeout->user, stats);
+        }
+    }
+
+    for (i = off; i < context->num_threads; ++i) {
+        pthread_cancel(context->threads[i].pgthread.thread);
+    }
+
+    return off;
+}
+
 static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
                            int max_threads, ThreadContext *tc,
+                           const PreallocTimeout *timeout,
                            bool use_madv_populate_write)
 {
     static gsize initialized = 0;
@@ -452,6 +520,9 @@ static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
     }
 
     context.threads = g_new0(MemsetThread, context.num_threads);
+    context.stats.page_size = hpagesize;
+    context.stats.total_pages = numpages;
+    context.stats.threads = context.num_threads;
     numpages_per_thread = numpages / context.num_threads;
     leftover = numpages % context.num_threads;
     for (i = 0; i < context.num_threads; i++) {
@@ -481,11 +552,20 @@ static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
     qemu_cond_broadcast(&page_cond);
     qemu_mutex_unlock(&page_mutex);
 
-    for (i = 0; i < context.num_threads; i++) {
-        int tmp = (uintptr_t)qemu_thread_join(&context.threads[i].pgthread);
+    if (timeout) {
+        i = timed_join_memset_threads(&context, timeout);
+
+        if (i != context.num_threads &&
+            context.stats.allocated_pages != context.stats.total_pages) {
+            ret = -ETIMEDOUT;
+        }
+    }
+
+    for (; i < context.num_threads; i++) {
+        void *thread_ret = qemu_thread_join(&context.threads[i].pgthread);
 
-        if (tmp) {
-            ret = tmp;
+        if (thread_ret && thread_ret != PTHREAD_CANCELED) {
+            ret = (uintptr_t)thread_ret;
         }
     }
 
@@ -503,8 +583,10 @@ static bool madv_populate_write_possible(char *area, size_t pagesize)
            errno != EINVAL;
 }
 
-void qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
-                       ThreadContext *tc, Error **errp)
+void qemu_prealloc_mem_with_timeout(int fd, char *area, size_t sz,
+                                    int max_threads, ThreadContext *tc,
+                                    const PreallocTimeout *timeout,
+                                    Error **errp)
 {
     static gsize initialized;
     int ret;
@@ -546,10 +628,18 @@ void qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
 
     /* touch pages simultaneously */
     ret = touch_all_pages(area, hpagesize, numpages, max_threads, tc,
-                          use_madv_populate_write);
+                          timeout, use_madv_populate_write);
+
     if (ret) {
-        error_setg_errno(errp, -ret,
-                         "qemu_prealloc_mem: preallocating memory failed");
+        const char *msg;
+
+        if (timeout && ret == -ETIMEDOUT) {
+            msg = "preallocation timed out";
+        } else {
+            msg = "preallocating memory failed";
+        }
+
+        error_setg_errno(errp, -ret, "qemu_prealloc_mem: %s", msg);
     }
 
     if (!use_madv_populate_write) {
@@ -563,6 +653,12 @@ void qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
     }
 }
 
+void qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
+                       ThreadContext *tc, Error **errp)
+{
+    qemu_prealloc_mem_with_timeout(fd, area, sz, max_threads, tc, NULL, errp);
+}
+
 char *qemu_get_pid_name(pid_t pid)
 {
     char *name = NULL;
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 07ade41800..27f39ef66a 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -276,6 +276,15 @@ void qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
     }
 }
 
+void qemu_prealloc_mem_with_timeout(int fd, char *area, size_t sz,
+                                    int max_threads, ThreadContext *tc,
+                                    const PreallocTimeout *timeout,
+                                    Error **errp)
+{
+    /* FIXME: actually implement timing out here */
+    qemu_prealloc_mem(fd, area, sz, max_threads, tc, errp);
+}
+
 char *qemu_get_pid_name(pid_t pid)
 {
     /* XXX Implement me */
-- 
2.25.1


