Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 376D4463183
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 11:48:20 +0100 (CET)
Received: from localhost ([::1]:47546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms0gN-0007qi-BE
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 05:48:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ms0aF-0005eT-Gp
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 05:42:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ms0aC-00011Q-RO
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 05:41:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638268914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E2hPa3OeU2VShLBIWGRBI4Pl+wvAn0MdoP0MtSPhYqc=;
 b=bBGfyLO/QutWzKYIGKD/+uaF77kF3S6Q/Msd5y9l1gm6CTrV/32wEWdGI3U4xzMxqqEI9J
 eTy7IU3OziTgoxgmogGq47DuVsvNEBv0ITaC+h8QeCqecVzDWyNN8Kaw1KkV9CI8am6eaW
 LHUsSFDy7PKQY+FaYnNnP2+KQeWoMdU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-431-SG0WxjdeMu-F5UuEfvNdww-1; Tue, 30 Nov 2021 05:41:51 -0500
X-MC-Unique: SG0WxjdeMu-F5UuEfvNdww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C03CF1018722;
 Tue, 30 Nov 2021 10:41:50 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3866100AE22;
 Tue, 30 Nov 2021 10:41:47 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 3/8] util/oslib-posix: Introduce and use MemsetContext for
 touch_all_pages()
Date: Tue, 30 Nov 2021 11:41:31 +0100
Message-Id: <20211130104136.40927-4-david@redhat.com>
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
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hui Zhu <teawater@gmail.com>
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
 util/oslib-posix.c | 73 +++++++++++++++++++++++++++++-----------------
 1 file changed, 47 insertions(+), 26 deletions(-)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index cb89e07770..cf2ead54ad 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -73,21 +73,30 @@
 
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
+/* used by sigbus_handler() */
+static MemsetContext *sigbus_memset_context;
 
 static QemuMutex page_mutex;
 static QemuCond page_cond;
-static bool threads_created_flag;
 
 int qemu_get_thread_id(void)
 {
@@ -438,10 +447,13 @@ const char *qemu_get_exec_dir(void)
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
@@ -459,7 +471,7 @@ static void *do_touch_pages(void *arg)
      * clearing until all threads have been created.
      */
     qemu_mutex_lock(&page_mutex);
-    while(!threads_created_flag){
+    while (!memset_args->context->all_threads_created) {
         qemu_cond_wait(&page_cond, &page_mutex);
     }
     qemu_mutex_unlock(&page_mutex);
@@ -502,7 +514,7 @@ static void *do_madv_populate_write_pages(void *arg)
 
     /* See do_touch_pages(). */
     qemu_mutex_lock(&page_mutex);
-    while (!threads_created_flag) {
+    while (!memset_args->context->all_threads_created) {
         qemu_cond_wait(&page_cond, &page_mutex);
     }
     qemu_mutex_unlock(&page_mutex);
@@ -529,6 +541,9 @@ static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
                            int smp_cpus, bool use_madv_populate_write)
 {
     static gsize initialized = 0;
+    MemsetContext context = {
+        .num_threads = get_memset_num_threads(smp_cpus),
+    };
     size_t numpages_per_thread, leftover;
     void *(*touch_fn)(void *);
     int ret = 0, i = 0;
@@ -546,35 +561,41 @@ static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
         touch_fn = do_touch_pages;
     }
 
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
-        int tmp = (uintptr_t)qemu_thread_join(&memset_thread[i].pgthread);
+    for (i = 0; i < context.num_threads; i++) {
+        int tmp = (uintptr_t)qemu_thread_join(&context.threads[i].pgthread);
 
         if (tmp) {
             ret = tmp;
         }
     }
-    g_free(memset_thread);
-    memset_thread = NULL;
+
+    if (!use_madv_populate_write) {
+        sigbus_memset_context = NULL;
+    }
+    g_free(context.threads);
 
     return ret;
 }
-- 
2.31.1


