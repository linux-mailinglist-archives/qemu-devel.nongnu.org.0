Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A33D5EE438
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 20:20:06 +0200 (CEST)
Received: from localhost ([::1]:55510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odbfB-000688-Mo
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 14:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1odaCw-0002pw-0a
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:46:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1odaCu-0001Bf-Bz
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:46:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664383607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MFcuZ/5qYH8tqaW++iXSEuKmHCOsMxrstefyjV2UI/0=;
 b=RwkTNjTciR6WcLoM1GaI07WNnof7jjAriiCdenOqA7D9Kv6RuOvbmedV7IIQmXqG+jwxuB
 8ps/oFScVwk+Tf5RzDgRZ+lnTQdabyRTPqmHswkc3Oux7N8nOy7KxgfNP5csmDapfidgje
 kBB1i78EGMK+Nipb2TUE1wEcpWT7sGI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-yYRjEujsMQi0jJRhQa8P2Q-1; Wed, 28 Sep 2022 12:46:44 -0400
X-MC-Unique: yYRjEujsMQi0jJRhQa8P2Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2E271871CCB;
 Wed, 28 Sep 2022 16:46:43 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5DA62166B2B;
 Wed, 28 Sep 2022 16:46:40 +0000 (UTC)
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
Subject: [PATCH v1 5/7] util: Make qemu_prealloc_mem() optionally consume a
 ThreadContext
Date: Wed, 28 Sep 2022 18:45:40 +0200
Message-Id: <20220928164542.117952-6-david@redhat.com>
In-Reply-To: <20220928164542.117952-1-david@redhat.com>
References: <20220928164542.117952-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

... and implement it under POSIX. When a ThreadContext is provided,
create new threads via the context such that these new threads obtain a
porperly configured CPU affinity.

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 backends/hostmem.c     |  5 +++--
 hw/virtio/virtio-mem.c |  2 +-
 include/qemu/osdep.h   |  4 +++-
 util/oslib-posix.c     | 20 ++++++++++++++------
 util/oslib-win32.c     |  2 +-
 5 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/backends/hostmem.c b/backends/hostmem.c
index 491cb10b97..76f0394490 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -232,7 +232,8 @@ static void host_memory_backend_set_prealloc(Object *obj, bool value,
         void *ptr = memory_region_get_ram_ptr(&backend->mr);
         uint64_t sz = memory_region_size(&backend->mr);
 
-        qemu_prealloc_mem(fd, ptr, sz, backend->prealloc_threads, &local_err);
+        qemu_prealloc_mem(fd, ptr, sz, backend->prealloc_threads, NULL,
+                          &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return;
@@ -384,7 +385,7 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
          */
         if (backend->prealloc) {
             qemu_prealloc_mem(memory_region_get_fd(&backend->mr), ptr, sz,
-                              backend->prealloc_threads, &local_err);
+                              backend->prealloc_threads, NULL, &local_err);
             if (local_err) {
                 goto out;
             }
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 0e9ef4ff19..ed170def48 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -467,7 +467,7 @@ static int virtio_mem_set_block_state(VirtIOMEM *vmem, uint64_t start_gpa,
             int fd = memory_region_get_fd(&vmem->memdev->mr);
             Error *local_err = NULL;
 
-            qemu_prealloc_mem(fd, area, size, 1, &local_err);
+            qemu_prealloc_mem(fd, area, size, 1, NULL, &local_err);
             if (local_err) {
                 static bool warned;
 
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index e556e45143..625298c8bc 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -568,6 +568,8 @@ unsigned long qemu_getauxval(unsigned long type);
 
 void qemu_set_tty_echo(int fd, bool echo);
 
+typedef struct ThreadContext ThreadContext;
+
 /**
  * qemu_prealloc_mem:
  * @fd: the fd mapped into the area, -1 for anonymous memory
@@ -582,7 +584,7 @@ void qemu_set_tty_echo(int fd, bool echo);
  * after allocating file blocks for mapped files.
  */
 void qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
-                       Error **errp);
+                       ThreadContext *tc, Error **errp);
 
 /**
  * qemu_get_pid_name:
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 46f3def893..22980a11b1 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -400,7 +400,8 @@ static inline int get_memset_num_threads(size_t hpagesize, size_t numpages,
 }
 
 static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
-                           int max_threads, bool use_madv_populate_write)
+                           int max_threads, ThreadContext *tc,
+                           bool use_madv_populate_write)
 {
     static gsize initialized = 0;
     MemsetContext context = {
@@ -439,9 +440,16 @@ static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
         context.threads[i].numpages = numpages_per_thread + (i < leftover);
         context.threads[i].hpagesize = hpagesize;
         context.threads[i].context = &context;
-        qemu_thread_create(&context.threads[i].pgthread, "touch_pages",
-                           touch_fn, &context.threads[i],
-                           QEMU_THREAD_JOINABLE);
+        if (tc) {
+            thread_context_create_thread(tc, &context.threads[i].pgthread,
+                                         "touch_pages",
+                                         touch_fn, &context.threads[i],
+                                         QEMU_THREAD_JOINABLE);
+        } else {
+            qemu_thread_create(&context.threads[i].pgthread, "touch_pages",
+                               touch_fn, &context.threads[i],
+                               QEMU_THREAD_JOINABLE);
+        }
         addr += context.threads[i].numpages * hpagesize;
     }
 
@@ -477,7 +485,7 @@ static bool madv_populate_write_possible(char *area, size_t pagesize)
 }
 
 void qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
-                       Error **errp)
+                       ThreadContext *tc, Error **errp)
 {
     static gsize initialized;
     int ret;
@@ -518,7 +526,7 @@ void qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
     }
 
     /* touch pages simultaneously */
-    ret = touch_all_pages(area, hpagesize, numpages, max_threads,
+    ret = touch_all_pages(area, hpagesize, numpages, max_threads, tc,
                           use_madv_populate_write);
     if (ret) {
         error_setg_errno(errp, -ret,
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index e1cb725ecc..a67cb3822e 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -269,7 +269,7 @@ int getpagesize(void)
 }
 
 void qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
-                       Error **errp)
+                       ThreadContext *tc, Error **errp)
 {
     int i;
     size_t pagesize = qemu_real_host_page_size();
-- 
2.37.3


