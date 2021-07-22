Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13FA3D236D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 14:39:43 +0200 (CEST)
Received: from localhost ([::1]:44848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6XzK-0006cm-KZ
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 08:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m6Xwj-0003BC-35
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:37:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m6Xwg-0004VK-GR
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626957417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+qAU83THdgeQguJ8G6XvnPUlZLqvsJzMQQl3IMu6I6I=;
 b=IBATPEK4btSiAOdEP0eLPqdB4u+wmTU6YIbwhYO8qsWaufMUJdn8zouqu4FQQsdIRUVK+m
 4KTVaIsEdckhcsQjLOwG7c/J7i/avS52TiJQYu3E1FnQy2BCgpfDIXsXFv1C+DlATv/KVb
 UTV2O90tUAz/+5ohvTja4gld8maCR90=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-jDWcma8nOxOZ3UxGsdu_wA-1; Thu, 22 Jul 2021 08:36:55 -0400
X-MC-Unique: jDWcma8nOxOZ3UxGsdu_wA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8953802C80;
 Thu, 22 Jul 2021 12:36:54 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-116.ams2.redhat.com [10.36.112.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA1D517A63;
 Thu, 22 Jul 2021 12:36:52 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] util/oslib-posix: Introduce and use MemsetContext for
 touch_all_pages()
Date: Thu, 22 Jul 2021 14:36:31 +0200
Message-Id: <20210722123635.60608-3-david@redhat.com>
In-Reply-To: <20210722123635.60608-1-david@redhat.com>
References: <20210722123635.60608-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's minimize the number of global variables to prepare for
os_mem_prealloc() getting called concurrently and make the code a bit
easier to read.

The only consumer that really needs a global variable is the sigbus
handler, which will require protection via a mutex in the future either way
as we cannot concurrently mess with the SIGBUS handler.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 util/oslib-posix.c | 81 ++++++++++++++++++++++++++++------------------
 1 file changed, 50 insertions(+), 31 deletions(-)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 1cb80bf94c..2ae6c3aaab 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -73,22 +73,30 @@
 
 #define MAX_MEM_PREALLOC_THREAD_COUNT 16
 
+struct MemsetThread;
+
+typedef struct MemsetContext {
+    bool all_threads_created;
+    bool any_thread_failed;
+    struct MemsetThread *threads;
+    int num_threads;
+} MemsetContext;
+
 struct MemsetThread {
     char *addr;
     size_t numpages;
     size_t hpagesize;
     QemuThread pgthread;
     sigjmp_buf env;
+    MemsetContext *context;
 };
 typedef struct MemsetThread MemsetThread;
 
-static MemsetThread *memset_thread;
-static int memset_num_threads;
-static bool memset_thread_failed;
+/* used by sigbus_handler() */
+static MemsetContext *sigbus_memset_context;
 
 static QemuMutex page_mutex;
 static QemuCond page_cond;
-static bool threads_created_flag;
 
 int qemu_get_thread_id(void)
 {
@@ -439,10 +447,13 @@ const char *qemu_get_exec_dir(void)
 static void sigbus_handler(int signal)
 {
     int i;
-    if (memset_thread) {
-        for (i = 0; i < memset_num_threads; i++) {
-            if (qemu_thread_is_self(&memset_thread[i].pgthread)) {
-                siglongjmp(memset_thread[i].env, 1);
+
+    if (sigbus_memset_context) {
+        for (i = 0; i < sigbus_memset_context->num_threads; i++) {
+            MemsetThread *thread = &sigbus_memset_context->threads[i];
+
+            if (qemu_thread_is_self(&thread->pgthread)) {
+                siglongjmp(thread->env, 1);
             }
         }
     }
@@ -459,7 +470,7 @@ static void *do_touch_pages(void *arg)
      * clearing until all threads have been created.
      */
     qemu_mutex_lock(&page_mutex);
-    while(!threads_created_flag){
+    while (!memset_args->context->all_threads_created) {
         qemu_cond_wait(&page_cond, &page_mutex);
     }
     qemu_mutex_unlock(&page_mutex);
@@ -470,7 +481,7 @@ static void *do_touch_pages(void *arg)
     pthread_sigmask(SIG_UNBLOCK, &set, &oldset);
 
     if (sigsetjmp(memset_args->env, 1)) {
-        memset_thread_failed = true;
+        memset_args->context->any_thread_failed = true;
     } else {
         char *addr = memset_args->addr;
         size_t numpages = memset_args->numpages;
@@ -506,14 +517,14 @@ static void *do_madv_populate_write_pages(void *arg)
 
     /* See do_touch_pages(). */
     qemu_mutex_lock(&page_mutex);
-    while (!threads_created_flag) {
+    while (!memset_args->context->all_threads_created) {
         qemu_cond_wait(&page_cond, &page_mutex);
     }
     qemu_mutex_unlock(&page_mutex);
 
     ret = qemu_madvise(addr, size, QEMU_MADV_POPULATE_WRITE);
     if (ret) {
-        memset_thread_failed = true;
+        memset_args->context->any_thread_failed = true;
     }
     return NULL;
 }
@@ -534,6 +545,9 @@ static bool touch_all_pages(char *area, size_t hpagesize, size_t numpages,
                             int smp_cpus, bool use_madv_populate_write)
 {
     static gsize initialized = 0;
+    MemsetContext context = {
+        .num_threads = get_memset_num_threads(smp_cpus),
+    };
     size_t numpages_per_thread, leftover;
     void *(*touch_fn)(void *);
     char *addr = area;
@@ -551,34 +565,39 @@ static bool touch_all_pages(char *area, size_t hpagesize, size_t numpages,
         touch_fn = do_touch_pages;
     }
 
-    memset_thread_failed = false;
-    threads_created_flag = false;
-    memset_num_threads = get_memset_num_threads(smp_cpus);
-    memset_thread = g_new0(MemsetThread, memset_num_threads);
-    numpages_per_thread = numpages / memset_num_threads;
-    leftover = numpages % memset_num_threads;
-    for (i = 0; i < memset_num_threads; i++) {
-        memset_thread[i].addr = addr;
-        memset_thread[i].numpages = numpages_per_thread + (i < leftover);
-        memset_thread[i].hpagesize = hpagesize;
-        qemu_thread_create(&memset_thread[i].pgthread, "touch_pages",
-                           touch_fn, &memset_thread[i],
+    context.threads = g_new0(MemsetThread, context.num_threads);
+    numpages_per_thread = numpages / context.num_threads;
+    leftover = numpages % context.num_threads;
+    for (i = 0; i < context.num_threads; i++) {
+        context.threads[i].addr = addr;
+        context.threads[i].numpages = numpages_per_thread + (i < leftover);
+        context.threads[i].hpagesize = hpagesize;
+        context.threads[i].context = &context;
+        qemu_thread_create(&context.threads[i].pgthread, "touch_pages",
+                           touch_fn, &context.threads[i],
                            QEMU_THREAD_JOINABLE);
-        addr += memset_thread[i].numpages * hpagesize;
+        addr += context.threads[i].numpages * hpagesize;
+    }
+
+    if (!use_madv_populate_write) {
+        sigbus_memset_context = &context;
     }
 
     qemu_mutex_lock(&page_mutex);
-    threads_created_flag = true;
+    context.all_threads_created = true;
     qemu_cond_broadcast(&page_cond);
     qemu_mutex_unlock(&page_mutex);
 
-    for (i = 0; i < memset_num_threads; i++) {
-        qemu_thread_join(&memset_thread[i].pgthread);
+    for (i = 0; i < context.num_threads; i++) {
+        qemu_thread_join(&context.threads[i].pgthread);
+    }
+
+    if (!use_madv_populate_write) {
+        sigbus_memset_context = NULL;
     }
-    g_free(memset_thread);
-    memset_thread = NULL;
+    g_free(context.threads);
 
-    return memset_thread_failed;
+    return context.any_thread_failed;
 }
 
 static bool madv_populate_write_possible(char *area, size_t pagesize)
-- 
2.31.1


