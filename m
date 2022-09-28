Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AC55EE3FE
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 20:12:16 +0200 (CEST)
Received: from localhost ([::1]:34808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odbXb-0001UV-8Y
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 14:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1odaCf-0002Ot-Un
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:46:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1odaCe-0001AT-21
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:46:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664383591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vgufmHeyiyqoOCYrL5AaulMhDVJZ97tu9a+bovIVq70=;
 b=LJk3HzGfl8eNdjxycMym8ZmFbm+jWmjS5EPq4zG2UgMqoKxGljoM8jSsOSjL9s3nV6tv7B
 2uxtn3PJQhote9qzSKHfRd9e5V7KFGX3ancr1KmMzMT56cjyhV40qzHR/r1bvgIvTsyTIa
 d0kZqxG2ziBXk8cHyPc9doH4wzuHHqw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-tzizHIDPN_uL_TgzmSrS-g-1; Wed, 28 Sep 2022 12:46:30 -0400
X-MC-Unique: tzizHIDPN_uL_TgzmSrS-g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB1E52932498;
 Wed, 28 Sep 2022 16:46:29 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7A672166B26;
 Wed, 28 Sep 2022 16:46:02 +0000 (UTC)
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
Subject: [PATCH v1 2/7] util: Introduce qemu_thread_set_affinity() and
 qemu_thread_get_affinity()
Date: Wed, 28 Sep 2022 18:45:37 +0200
Message-Id: <20220928164542.117952-3-david@redhat.com>
In-Reply-To: <20220928164542.117952-1-david@redhat.com>
References: <20220928164542.117952-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

Usually, we let upper layers handle CPU pinning, because
pthread_setaffinity_np() (-> sched_setaffinity()) is blocked via
seccomp when starting QEMU with
    -sandbox enable=on,resourcecontrol=deny

However, we want to configure and observe the CPU affinity of threads
from QEMU directly in some cases when the sandbox option is either not
enabled or not active yet.

So let's add a way to configure CPU pinning via
qemu_thread_set_affinity() and obtain CPU affinity via
qemu_thread_get_affinity() and implement them under POSIX using
pthread_setaffinity_np() + pthread_getaffinity_np().

Implementation under Windows is possible using SetProcessAffinityMask()
+ GetProcessAffinityMask(), however, that is left as future work.

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/qemu/thread.h    |  4 +++
 meson.build              | 16 +++++++++
 util/qemu-thread-posix.c | 70 ++++++++++++++++++++++++++++++++++++++++
 util/qemu-thread-win32.c | 12 +++++++
 4 files changed, 102 insertions(+)

diff --git a/include/qemu/thread.h b/include/qemu/thread.h
index af19f2b3fc..79e507c7f0 100644
--- a/include/qemu/thread.h
+++ b/include/qemu/thread.h
@@ -185,6 +185,10 @@ void qemu_event_destroy(QemuEvent *ev);
 void qemu_thread_create(QemuThread *thread, const char *name,
                         void *(*start_routine)(void *),
                         void *arg, int mode);
+int qemu_thread_set_affinity(QemuThread *thread, unsigned long *host_cpus,
+                             unsigned long nbits);
+int qemu_thread_get_affinity(QemuThread *thread, unsigned long **host_cpus,
+                             unsigned long *nbits);
 void *qemu_thread_join(QemuThread *thread);
 void qemu_thread_get_self(QemuThread *thread);
 bool qemu_thread_is_self(QemuThread *thread);
diff --git a/meson.build b/meson.build
index 8dc661363f..9121f99e71 100644
--- a/meson.build
+++ b/meson.build
@@ -2088,7 +2088,23 @@ config_host_data.set('CONFIG_PTHREAD_CONDATTR_SETCLOCK', cc.links(gnu_source_pre
     pthread_condattr_setclock(&attr, CLOCK_MONOTONIC);
     return 0;
   }''', dependencies: threads))
+config_host_data.set('CONFIG_PTHREAD_AFFINITY_NP', cc.links(gnu_source_prefix + '''
+  #include <pthread.h>
 
+  static void *f(void *p) { return NULL; }
+  int main(void)
+  {
+    int setsize = CPU_ALLOC_SIZE(64);
+    pthread_t thread;
+    cpu_set_t *cpuset;
+    pthread_create(&thread, 0, f, 0);
+    cpuset = CPU_ALLOC(64);
+    CPU_ZERO_S(setsize, cpuset);
+    pthread_setaffinity_np(thread, setsize, cpuset);
+    pthread_getaffinity_np(thread, setsize, cpuset);
+    CPU_FREE(cpuset);
+    return 0;
+  }''', dependencies: threads))
 config_host_data.set('CONFIG_SIGNALFD', cc.links(gnu_source_prefix + '''
   #include <sys/signalfd.h>
   #include <stddef.h>
diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index ac1d56e673..bae938c670 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -16,6 +16,7 @@
 #include "qemu/notify.h"
 #include "qemu-thread-common.h"
 #include "qemu/tsan.h"
+#include "qemu/bitmap.h"
 
 static bool name_threads;
 
@@ -552,6 +553,75 @@ void qemu_thread_create(QemuThread *thread, const char *name,
     pthread_attr_destroy(&attr);
 }
 
+int qemu_thread_set_affinity(QemuThread *thread, unsigned long *host_cpus,
+                             unsigned long nbits)
+{
+#if defined(CONFIG_PTHREAD_AFFINITY_NP)
+    const size_t setsize = CPU_ALLOC_SIZE(nbits);
+    unsigned long value;
+    cpu_set_t *cpuset;
+    int err;
+
+    cpuset = CPU_ALLOC(nbits);
+    g_assert(cpuset);
+
+    CPU_ZERO_S(setsize, cpuset);
+    value = find_first_bit(host_cpus, nbits);
+    while (value < nbits) {
+        CPU_SET_S(value, setsize, cpuset);
+        value = find_next_bit(host_cpus, nbits, value + 1);
+    }
+
+    err = pthread_setaffinity_np(thread->thread, setsize, cpuset);
+    CPU_FREE(cpuset);
+    return err;
+#else
+    return -ENOSYS;
+#endif
+}
+
+int qemu_thread_get_affinity(QemuThread *thread, unsigned long **host_cpus,
+                             unsigned long *nbits)
+{
+#if defined(CONFIG_PTHREAD_AFFINITY_NP)
+    unsigned long tmpbits;
+    cpu_set_t *cpuset;
+    size_t setsize;
+    int i, err;
+
+    tmpbits = CPU_SETSIZE;
+    while (true) {
+        setsize = CPU_ALLOC_SIZE(tmpbits);
+        cpuset = CPU_ALLOC(tmpbits);
+        g_assert(cpuset);
+
+        err = pthread_getaffinity_np(thread->thread, setsize, cpuset);
+        if (err) {
+            CPU_FREE(cpuset);
+            if (err != -EINVAL) {
+                return err;
+            }
+            tmpbits *= 2;
+        } else {
+            break;
+        }
+    }
+
+    /* Convert the result into a proper bitmap. */
+    *nbits = tmpbits;
+    *host_cpus = bitmap_new(tmpbits);
+    for (i = 0; i < tmpbits; i++) {
+        if (CPU_ISSET(i, cpuset)) {
+            set_bit(i, *host_cpus);
+        }
+    }
+    CPU_FREE(cpuset);
+    return 0;
+#else
+    return -ENOSYS;
+#endif
+}
+
 void qemu_thread_get_self(QemuThread *thread)
 {
     thread->thread = pthread_self();
diff --git a/util/qemu-thread-win32.c b/util/qemu-thread-win32.c
index a2d5a6e825..72338148bd 100644
--- a/util/qemu-thread-win32.c
+++ b/util/qemu-thread-win32.c
@@ -427,6 +427,18 @@ void qemu_thread_create(QemuThread *thread, const char *name,
     thread->data = data;
 }
 
+int qemu_thread_set_affinity(QemuThread *thread, unsigned long *host_cpus,
+                             unsigned long nbits)
+{
+    return -ENOSYS;
+}
+
+int qemu_thread_get_affinity(QemuThread *thread, unsigned long **host_cpus,
+                             unsigned long *nbits)
+{
+    return -ENOSYS;
+}
+
 void qemu_thread_get_self(QemuThread *thread)
 {
     thread->data = qemu_thread_data;
-- 
2.37.3


