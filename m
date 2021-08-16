Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 031283ED147
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 11:49:33 +0200 (CEST)
Received: from localhost ([::1]:43140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFZFM-0000Af-0v
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 05:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mFZDu-0005zj-Ds
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 05:48:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mFZDq-00054Y-Ly
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 05:48:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629107277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CDblSe79PevFXlIG9pmr7FIZErmmX/OFSZk3ZvoQmfs=;
 b=YhuToyX7GGQaGN5D6zHuem5tvoNh3P+eqRh8q8+BnPMbnENgL9OLlUMVniq5V6w4AqDtF+
 MJtb63qzN76KS2e4tjal+2yycZ7lGJKcbZNI8abTp4qVvb18bpxpBtVW0xGtULMSHKOfZx
 GG3S5Dv+4+/m7o4dQoLH3r39aicNKzs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-AUXUlVSsNve9X6KQc4ou8g-1; Mon, 16 Aug 2021 05:47:54 -0400
X-MC-Unique: AUXUlVSsNve9X6KQc4ou8g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94F1E1008063;
 Mon, 16 Aug 2021 09:47:53 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12AE619C44;
 Mon, 16 Aug 2021 09:47:50 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/7] util/oslib-posix: Let touch_all_pages() return an error
Date: Mon, 16 Aug 2021 11:47:33 +0200
Message-Id: <20210816094739.21970-2-david@redhat.com>
In-Reply-To: <20210816094739.21970-1-david@redhat.com>
References: <20210816094739.21970-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's prepare touch_all_pages() for returning differing errors. Return
an error from the thread and report the last processed error.

Translate SIGBUS to -EFAULT, as a SIGBUS can mean all different kind of
things (memory error, read error, out of memory). When allocating memory
fails via the current SIGBUS-based mechanism, we'll get:
    os_mem_prealloc: preallocating memory failed: Bad address

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 util/oslib-posix.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index e8bdb02e1d..b146beef78 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -84,7 +84,6 @@ typedef struct MemsetThread MemsetThread;
 
 static MemsetThread *memset_thread;
 static int memset_num_threads;
-static bool memset_thread_failed;
 
 static QemuMutex page_mutex;
 static QemuCond page_cond;
@@ -452,6 +451,7 @@ static void *do_touch_pages(void *arg)
 {
     MemsetThread *memset_args = (MemsetThread *)arg;
     sigset_t set, oldset;
+    int ret = 0;
 
     /*
      * On Linux, the page faults from the loop below can cause mmap_sem
@@ -470,7 +470,7 @@ static void *do_touch_pages(void *arg)
     pthread_sigmask(SIG_UNBLOCK, &set, &oldset);
 
     if (sigsetjmp(memset_args->env, 1)) {
-        memset_thread_failed = true;
+        ret = -EFAULT;
     } else {
         char *addr = memset_args->addr;
         size_t numpages = memset_args->numpages;
@@ -494,7 +494,7 @@ static void *do_touch_pages(void *arg)
         }
     }
     pthread_sigmask(SIG_SETMASK, &oldset, NULL);
-    return NULL;
+    return (void *)(uintptr_t)ret;
 }
 
 static inline int get_memset_num_threads(int smp_cpus)
@@ -509,13 +509,13 @@ static inline int get_memset_num_threads(int smp_cpus)
     return ret;
 }
 
-static bool touch_all_pages(char *area, size_t hpagesize, size_t numpages,
-                            int smp_cpus)
+static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
+                           int smp_cpus)
 {
     static gsize initialized = 0;
     size_t numpages_per_thread, leftover;
+    int ret = 0, i = 0;
     char *addr = area;
-    int i = 0;
 
     if (g_once_init_enter(&initialized)) {
         qemu_mutex_init(&page_mutex);
@@ -523,7 +523,6 @@ static bool touch_all_pages(char *area, size_t hpagesize, size_t numpages,
         g_once_init_leave(&initialized, 1);
     }
 
-    memset_thread_failed = false;
     threads_created_flag = false;
     memset_num_threads = get_memset_num_threads(smp_cpus);
     memset_thread = g_new0(MemsetThread, memset_num_threads);
@@ -545,12 +544,16 @@ static bool touch_all_pages(char *area, size_t hpagesize, size_t numpages,
     qemu_mutex_unlock(&page_mutex);
 
     for (i = 0; i < memset_num_threads; i++) {
-        qemu_thread_join(&memset_thread[i].pgthread);
+        int tmp = (uintptr_t)qemu_thread_join(&memset_thread[i].pgthread);
+
+        if (tmp) {
+            ret = tmp;
+        }
     }
     g_free(memset_thread);
     memset_thread = NULL;
 
-    return memset_thread_failed;
+    return ret;
 }
 
 void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
@@ -573,9 +576,10 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
     }
 
     /* touch pages simultaneously */
-    if (touch_all_pages(area, hpagesize, numpages, smp_cpus)) {
-        error_setg(errp, "os_mem_prealloc: Insufficient free host memory "
-            "pages available to allocate guest RAM");
+    ret = touch_all_pages(area, hpagesize, numpages, smp_cpus);
+    if (ret) {
+        error_setg_errno(errp, -ret,
+                         "os_mem_prealloc: preallocating memory failed");
     }
 
     ret = sigaction(SIGBUS, &oldact, NULL);
-- 
2.31.1


