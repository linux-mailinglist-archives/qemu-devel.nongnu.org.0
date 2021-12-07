Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B9346B366
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 08:08:17 +0100 (CET)
Received: from localhost ([::1]:49704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muUaG-0003B3-69
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 02:08:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1muUYb-0001kL-8w
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:06:33 -0500
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:60230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1muUYT-0008UU-EE
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:06:32 -0500
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id EB8662E1F93;
 Tue,  7 Dec 2021 10:06:17 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 SM0hQ2lux9-6HLS3Y8U; Tue, 07 Dec 2021 10:06:17 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1638860777; bh=RPm/uHsosaeQSlXbxGZcXNpamm54rJ+n/cPQwUb5s4o=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=Z3LmKiUhtSdQdbNVj2//J554HqLfc6brKpa8r6DagPYwuK7JoyPrLJPBKDABobdao
 YH/Ft0IMnDFlk93KUs5SA05x6GcSd7Y5+QoxGvX+PXIEIN9vEm9fgBxZ8B3sjHiNRK
 pkTfGYuhZ47OcJuPqPAWiqji91NTSu0TaQ1Comq0=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from d-tatianin-nix.yandex-team.ru (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8118::1:31])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 0CVY1jOJUY-6HPCSFYP; Tue, 07 Dec 2021 10:06:17 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/2] osdep: support mempolicy for preallocation in
 os_mem_prealloc
Date: Tue,  7 Dec 2021 10:06:07 +0300
Message-Id: <20211207070607.1422670-2-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207070607.1422670-1-d-tatianin@yandex-team.ru>
References: <20211207070607.1422670-1-d-tatianin@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
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
Cc: imammedo@redhat.com, sw@weilnetz.de, pbonzini@redhat.com,
 yc-core@yandex-team.ru, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is needed for cases where we want to make sure that a shared memory
region gets allocated from a specific NUMA node. This is impossible to do
with mbind(2) because it ignores the policy for memory mapped with
MAP_SHARED. We work around this by calling set_mempolicy from prealloc
threads instead.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
---
 backends/hostmem.c   |  6 ++++--
 include/qemu/osdep.h |  3 ++-
 util/meson.build     |  2 ++
 util/oslib-posix.c   | 29 ++++++++++++++++++++++++++---
 util/oslib-win32.c   |  3 ++-
 5 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/backends/hostmem.c b/backends/hostmem.c
index 392026efe6..0c508ed9df 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -269,7 +269,8 @@ static void host_memory_backend_set_prealloc(Object *obj, bool value,
         void *ptr = memory_region_get_ram_ptr(&backend->mr);
         uint64_t sz = memory_region_size(&backend->mr);
 
-        os_mem_prealloc(fd, ptr, sz, backend->prealloc_threads, &local_err);
+        os_mem_prealloc(fd, ptr, sz, backend->prealloc_threads, backend->policy,
+                        backend->host_nodes, MAX_NODES + 1, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return;
@@ -415,7 +416,8 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
          */
         if (backend->prealloc) {
             os_mem_prealloc(memory_region_get_fd(&backend->mr), ptr, sz,
-                            backend->prealloc_threads, &local_err);
+                            backend->prealloc_threads, backend->policy,
+                            backend->host_nodes, MAX_NODES + 1, &local_err);
             if (local_err) {
                 goto out;
             }
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 60718fc342..abf88aeb0e 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -688,7 +688,8 @@ unsigned long qemu_getauxval(unsigned long type);
 void qemu_set_tty_echo(int fd, bool echo);
 
 void os_mem_prealloc(int fd, char *area, size_t sz, int smp_cpus,
-                     Error **errp);
+                     int policy, unsigned long *node_bitmap,
+                     unsigned long max_node, Error **errp);
 
 /**
  * qemu_get_pid_name:
diff --git a/util/meson.build b/util/meson.build
index 05b593055a..25f9fca379 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -87,3 +87,5 @@ if have_block
                                         if_false: files('filemonitor-stub.c'))
   util_ss.add(when: 'CONFIG_LINUX', if_true: files('vfio-helpers.c'))
 endif
+
+util_ss.add(when: 'CONFIG_NUMA', if_true: numa)
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index e8bdb02e1d..bca25698c5 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -38,11 +38,13 @@
 #include "qemu/sockets.h"
 #include "qemu/thread.h"
 #include <libgen.h>
+#include "qemu/bitmap.h"
 #include "qemu/cutils.h"
 #include "qemu/compiler.h"
 
 #ifdef CONFIG_LINUX
 #include <sys/syscall.h>
+#include <numaif.h>
 #endif
 
 #ifdef __FreeBSD__
@@ -79,6 +81,9 @@ struct MemsetThread {
     size_t hpagesize;
     QemuThread pgthread;
     sigjmp_buf env;
+    int policy;
+    unsigned long *node_bitmap;
+    unsigned long max_node;
 };
 typedef struct MemsetThread MemsetThread;
 
@@ -464,6 +469,18 @@ static void *do_touch_pages(void *arg)
     }
     qemu_mutex_unlock(&page_mutex);
 
+#ifdef CONFIG_NUMA
+    if (memset_args->max_node &&
+        !bitmap_empty(memset_args->node_bitmap, memset_args->max_node)) {
+        long ret = set_mempolicy(memset_args->policy, memset_args->node_bitmap,
+                                 memset_args->max_node);
+        if (ret < 0) {
+            memset_thread_failed = true;
+            return NULL;
+        }
+    }
+#endif
+
     /* unblock SIGBUS */
     sigemptyset(&set);
     sigaddset(&set, SIGBUS);
@@ -510,7 +527,8 @@ static inline int get_memset_num_threads(int smp_cpus)
 }
 
 static bool touch_all_pages(char *area, size_t hpagesize, size_t numpages,
-                            int smp_cpus)
+                            int smp_cpus, int policy,
+                            unsigned long *node_bitmap, unsigned long max_node)
 {
     static gsize initialized = 0;
     size_t numpages_per_thread, leftover;
@@ -533,6 +551,9 @@ static bool touch_all_pages(char *area, size_t hpagesize, size_t numpages,
         memset_thread[i].addr = addr;
         memset_thread[i].numpages = numpages_per_thread + (i < leftover);
         memset_thread[i].hpagesize = hpagesize;
+        memset_thread[i].policy = policy;
+        memset_thread[i].node_bitmap = node_bitmap;
+        memset_thread[i].max_node = max_node;
         qemu_thread_create(&memset_thread[i].pgthread, "touch_pages",
                            do_touch_pages, &memset_thread[i],
                            QEMU_THREAD_JOINABLE);
@@ -554,7 +575,8 @@ static bool touch_all_pages(char *area, size_t hpagesize, size_t numpages,
 }
 
 void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
-                     Error **errp)
+                     int policy, unsigned long *node_bitmap,
+                     unsigned long max_node, Error **errp)
 {
     int ret;
     struct sigaction act, oldact;
@@ -573,7 +595,8 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
     }
 
     /* touch pages simultaneously */
-    if (touch_all_pages(area, hpagesize, numpages, smp_cpus)) {
+    if (touch_all_pages(area, hpagesize, numpages, smp_cpus, policy,
+                        node_bitmap, max_node)) {
         error_setg(errp, "os_mem_prealloc: Insufficient free host memory "
             "pages available to allocate guest RAM");
     }
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index af559ef339..3e56bf9f09 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -371,7 +371,8 @@ int getpagesize(void)
 }
 
 void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
-                     Error **errp)
+                     int policy, unsigned long *node_bitmap,
+                     unsigned long max_node, Error **errp)
 {
     int i;
     size_t pagesize = qemu_real_host_page_size;
-- 
2.25.1


