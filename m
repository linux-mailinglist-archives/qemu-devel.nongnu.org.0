Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BAF4880C6
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:59:18 +0100 (CET)
Received: from localhost ([::1]:32924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n610n-0002Rl-5W
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:59:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Ai-0004iV-9X
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:05:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Af-0002bX-3q
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:05:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g64Nj4WV+Irx5qvL3Yea9s2X356RYx1CceDWXAsokho=;
 b=duUMKSRd3MU79AQgJRIYYCS5qOtmjNG2ZBwO51C1AJNSz1VM5afiSQbUhDp/IktgTAeQKO
 cogIaHontKtm4WbiytJ8SU4wm8xEEfWbAZxFSc+GTTxZV01Dqdk4OJ07tR++Nt8aqsMyty
 PYkoyKFTyqDk/MYrLQxKlUlEzZ6DW7s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-u-hriRM7NZir5IL9IdVPPA-1; Fri, 07 Jan 2022 20:05:16 -0500
X-MC-Unique: u-hriRM7NZir5IL9IdVPPA-1
Received: by mail-wr1-f72.google.com with SMTP id
 e4-20020adfa444000000b001a667c09a23so167551wra.6
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:05:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=g64Nj4WV+Irx5qvL3Yea9s2X356RYx1CceDWXAsokho=;
 b=iKvXLe8VmANZr+6+LtVyEDpmM+56mNqUSvIQzEEFb57redi/dRragIHoLjNIkhHp2k
 +e830ONKdwJSFsgYlON4/rUTf8TIbIpA0LLmPwMs+4dgZBi0RPC7cWzAK+mnK1Bsp1Nd
 YkAmUh38HyHQVgmKIkKdy9eJlWilPBEEapncSxhUggnLa8UDSRoHbn4yQJsd8txmPtKt
 U2d0fqo/+Kg04xkHINS3xy2fX89TTcdMJQtKNM0877K86eUnKDgemhCnYoZGdXedxTcR
 FAX/5Kk8kVYfFZ2n/KYHvUg+7diVM6ROV+BKNHMoOwpAic6lZn/E7QAO7X9FCu0oyFyf
 t1EA==
X-Gm-Message-State: AOAM5332buftooeKTY6ok4d7kOzBVu2U8u3E9ZfxMy5zq0PPHBPGnunu
 zMsrZTiBcU45u290RyPZnFn10WDiTfJbLTglOD+L2XCVK43ph6P3MghiwrXbbV2uWPRC+p4tHEM
 noejQS97duybL1bH9IKicQJupJTiKUB1K3I1idK8TB8BTjwW0cA9oqrhNaohg
X-Received: by 2002:a5d:60ce:: with SMTP id x14mr55720044wrt.149.1641603914882; 
 Fri, 07 Jan 2022 17:05:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwm9V65kXq65K7SPfFJ6OK10SmryQY1OOy6p4qEMDc/aczApc6VPUhenx9ozToizbgW2//tmg==
X-Received: by 2002:a5d:60ce:: with SMTP id x14mr55720031wrt.149.1641603914648; 
 Fri, 07 Jan 2022 17:05:14 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id az1sm207738wrb.104.2022.01.07.17.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:05:14 -0800 (PST)
Date: Fri, 7 Jan 2022 20:05:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 31/55] util/oslib-posix: Introduce and use MemsetContext
 for touch_all_pages()
Message-ID: <20220108003423.15830-32-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: Michal Privoznik <mprivozn@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Let's minimize the number of global variables to prepare for
os_mem_prealloc() getting called concurrently and make the code a bit
easier to read.

The only consumer that really needs a global variable is the sigbus
handler, which will require protection via a mutex in the future either way
as we cannot concurrently mess with the SIGBUS handler.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20211217134611.31172-4-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
MST


