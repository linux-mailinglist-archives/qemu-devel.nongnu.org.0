Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C645EE24F
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 18:53:30 +0200 (CEST)
Received: from localhost ([::1]:42922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odaJN-0000NS-Qj
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 12:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1odaCo-0002lj-0x
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:46:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1odaCl-0001BF-Qi
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:46:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664383598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+CNGYj0FKt+UPpkQgt3l9xWZuOxd7qImLiu+F26ewYY=;
 b=EkTa8F2ZgW67hyF6AfPIObg4W/I5V9yDmQGU4ENIns8xUrLfd7v8nvWSo1C4aYOgrU4QAn
 Xwj1pgFx4Xhma3ZDr7UtsKZywLAsi2maS1NtxVGhRNMjgJZf6gawh5Xq+tO3tuI0rNYUXB
 /ZXpoY+TEMnMEhj13WZ50uDvtM492QI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-nxZTqGgHMKq7zaNt9Y0Y1g-1; Wed, 28 Sep 2022 12:46:37 -0400
X-MC-Unique: nxZTqGgHMKq7zaNt9Y0Y1g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B206F89F5EC;
 Wed, 28 Sep 2022 16:46:36 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 270FC2166B26;
 Wed, 28 Sep 2022 16:46:29 +0000 (UTC)
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
Subject: [PATCH v1 3/7] util: Introduce ThreadContext user-creatable object
Date: Wed, 28 Sep 2022 18:45:38 +0200
Message-Id: <20220928164542.117952-4-david@redhat.com>
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

Setting the CPU affinity of QEMU threads is a bit problematic, because
QEMU doesn't always have permissions to set the CPU affinity itself,
for example, with seccomp after initialized by QEMU:
    -sandbox enable=on,resourcecontrol=deny

While upper layers are already aware how to handl;e CPU affinities for
long-lived threads like iothreads or vcpu threads, especially short-lived
threads, as used for memory-backend preallocation, are more involved to
handle. These threads are created on demand and upper layers are not even
able to identify and configure them.

Introduce the concept of a ThreadContext, that is essentially a thread
used for creating new threads. All threads created via that context
thread inherit the configured CPU affinity. Consequently, it's
sufficient to create a ThreadContext and configure it once, and have all
threads created via that ThreadContext inherit the same CPU affinity.

The CPU affinity of a ThreadContext can be configured two ways:

(1) Obtaining the thread id via the "thread-id" property and setting the
    CPU affinity manually.

(2) Setting the "cpu-affinity" property and letting QEMU try set the
    CPU affinity itself. This will fail if QEMU doesn't have permissions
    to do so anymore after seccomp was initialized.

A ThreadContext can be reused, simply be reconfiguring the CPU affinity.

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/qemu/thread-context.h |  58 +++++++
 qapi/qom.json                 |  16 ++
 util/meson.build              |   1 +
 util/oslib-posix.c            |   1 +
 util/thread-context.c         | 279 ++++++++++++++++++++++++++++++++++
 5 files changed, 355 insertions(+)
 create mode 100644 include/qemu/thread-context.h
 create mode 100644 util/thread-context.c

diff --git a/include/qemu/thread-context.h b/include/qemu/thread-context.h
new file mode 100644
index 0000000000..c799cbe7a1
--- /dev/null
+++ b/include/qemu/thread-context.h
@@ -0,0 +1,58 @@
+/*
+ * QEMU Thread Context
+ *
+ * Copyright Red Hat Inc., 2022
+ *
+ * Authors:
+ *  David Hildenbrand <david@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef SYSEMU_THREAD_CONTEXT_H
+#define SYSEMU_THREAD_CONTEXT_H
+
+#include "qapi/qapi-types-machine.h"
+#include "qemu/thread.h"
+#include "qom/object.h"
+
+#define TYPE_THREAD_CONTEXT "thread-context"
+OBJECT_DECLARE_TYPE(ThreadContext, ThreadContextClass,
+                    THREAD_CONTEXT)
+
+struct ThreadContextClass {
+    ObjectClass parent_class;
+};
+
+struct ThreadContext {
+    /* private */
+    Object parent;
+
+    /* private */
+    unsigned int thread_id;
+    QemuThread thread;
+
+    /* Semaphore to wait for context thread action. */
+    QemuSemaphore sem;
+    /* Semaphore to wait for action in context thread. */
+    QemuSemaphore sem_thread;
+    /* Mutex to synchronize requests. */
+    QemuMutex mutex;
+
+    /* Commands for the thread to execute. */
+    int thread_cmd;
+    void *thread_cmd_data;
+
+    /* CPU affinity bitmap used for initialization. */
+    unsigned long *init_cpu_bitmap;
+    int init_cpu_nbits;
+};
+
+void thread_context_create_thread(ThreadContext *tc, QemuThread *thread,
+                                  const char *name,
+                                  void *(*start_routine)(void *), void *arg,
+                                  int mode);
+
+#endif /* SYSEMU_THREAD_CONTEXT_H */
diff --git a/qapi/qom.json b/qapi/qom.json
index 80dd419b39..4775a333ed 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -830,6 +830,20 @@
             'reduced-phys-bits': 'uint32',
             '*kernel-hashes': 'bool' } }
 
+##
+# @ThreadContextProperties:
+#
+# Properties for thread context objects.
+#
+# @cpu-affinity: the CPU affinity for all threads created in the thread
+#                context (default: QEMU main thread affinity)
+#
+# Since: 7.2
+##
+{ 'struct': 'ThreadContextProperties',
+  'data': { '*cpu-affinity': ['uint16'] } }
+
+
 ##
 # @ObjectType:
 #
@@ -882,6 +896,7 @@
     { 'name': 'secret_keyring',
       'if': 'CONFIG_SECRET_KEYRING' },
     'sev-guest',
+    'thread-context',
     's390-pv-guest',
     'throttle-group',
     'tls-creds-anon',
@@ -948,6 +963,7 @@
       'secret_keyring':             { 'type': 'SecretKeyringProperties',
                                       'if': 'CONFIG_SECRET_KEYRING' },
       'sev-guest':                  'SevGuestProperties',
+      'thread-context':             'ThreadContextProperties',
       'throttle-group':             'ThrottleGroupProperties',
       'tls-creds-anon':             'TlsCredsAnonProperties',
       'tls-creds-psk':              'TlsCredsPskProperties',
diff --git a/util/meson.build b/util/meson.build
index 5e282130df..e97cd2d779 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -1,4 +1,5 @@
 util_ss.add(files('osdep.c', 'cutils.c', 'unicode.c', 'qemu-timer-common.c'))
+util_ss.add(files('thread-context.c'))
 if not config_host_data.get('CONFIG_ATOMIC64')
   util_ss.add(files('atomic64.c'))
 endif
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 5a2ae4ef3f..46f3def893 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -42,6 +42,7 @@
 #include "qemu/cutils.h"
 #include "qemu/compiler.h"
 #include "qemu/units.h"
+#include "qemu/thread-context.h"
 
 #ifdef CONFIG_LINUX
 #include <sys/syscall.h>
diff --git a/util/thread-context.c b/util/thread-context.c
new file mode 100644
index 0000000000..dcd607c532
--- /dev/null
+++ b/util/thread-context.c
@@ -0,0 +1,279 @@
+/*
+ * QEMU Thread Context
+ *
+ * Copyright Red Hat Inc., 2022
+ *
+ * Authors:
+ *  David Hildenbrand <david@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/thread-context.h"
+#include "qapi/error.h"
+#include "qapi/qapi-builtin-visit.h"
+#include "qapi/visitor.h"
+#include "qemu/config-file.h"
+#include "qapi/qapi-builtin-visit.h"
+#include "qom/object_interfaces.h"
+#include "qemu/module.h"
+#include "qemu/bitmap.h"
+
+enum {
+    TC_CMD_NONE = 0,
+    TC_CMD_STOP,
+    TC_CMD_NEW,
+};
+
+typedef struct ThreadContextCmdNew {
+    QemuThread *thread;
+    const char *name;
+    void *(*start_routine)(void *);
+    void *arg;
+    int mode;
+} ThreadContextCmdNew;
+
+static void *thread_context_run(void *opaque)
+{
+    ThreadContext *tc = opaque;
+
+    tc->thread_id = qemu_get_thread_id();
+    qemu_sem_post(&tc->sem);
+
+    while (true) {
+        /*
+         * Threads inherit the CPU affinity of the creating thread. For this
+         * reason, we create new (especially short-lived) threads from our
+         * persistent context thread.
+         *
+         * Especially when QEMU is not allowed to set the affinity itself,
+         * management tools can simply set the affinity of the context thread
+         * after creating the context, to have new threads created via
+         * the context inherit the CPU affinity automatically.
+         */
+        switch (tc->thread_cmd) {
+        case TC_CMD_NONE:
+            break;
+        case TC_CMD_STOP:
+            tc->thread_cmd = TC_CMD_NONE;
+            qemu_sem_post(&tc->sem);
+            return NULL;
+        case TC_CMD_NEW: {
+            ThreadContextCmdNew *cmd_new = tc->thread_cmd_data;
+
+            qemu_thread_create(cmd_new->thread, cmd_new->name,
+                               cmd_new->start_routine, cmd_new->arg,
+                               cmd_new->mode);
+            tc->thread_cmd = TC_CMD_NONE;
+            tc->thread_cmd_data = NULL;
+            qemu_sem_post(&tc->sem);
+            break;
+        }
+        default:
+            g_assert_not_reached();
+        }
+        qemu_sem_wait(&tc->sem_thread);
+    }
+}
+
+static void thread_context_set_cpu_affinity(Object *obj, Visitor *v,
+                                            const char *name, void *opaque,
+                                            Error **errp)
+{
+    ThreadContext *tc = THREAD_CONTEXT(obj);
+    uint16List *l, *host_cpus = NULL;
+    unsigned long *bitmap = NULL;
+    int nbits = 0, ret;
+    Error *err = NULL;
+
+    visit_type_uint16List(v, name, &host_cpus, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    if (!host_cpus) {
+        error_setg(errp, "CPU list is empty");
+        goto out;
+    }
+
+    for (l = host_cpus; l; l = l->next) {
+        nbits = MAX(nbits, l->value + 1);
+    }
+    bitmap = bitmap_new(nbits);
+    for (l = host_cpus; l; l = l->next) {
+        set_bit(l->value, bitmap);
+    }
+
+    if (tc->thread_id != -1) {
+        /*
+         * Note: we won't be adjusting the affinity of any thread that is still
+         * around, but only the affinity of the context thread.
+         */
+        ret = qemu_thread_set_affinity(&tc->thread, bitmap, nbits);
+        if (ret) {
+            error_setg(errp, "Setting CPU affinity failed: %s", strerror(ret));
+        }
+    } else {
+        tc->init_cpu_bitmap = bitmap;
+        bitmap = NULL;
+        tc->init_cpu_nbits = nbits;
+    }
+out:
+    g_free(bitmap);
+    qapi_free_uint16List(host_cpus);
+}
+
+static void thread_context_get_cpu_affinity(Object *obj, Visitor *v,
+                                            const char *name, void *opaque,
+                                            Error **errp)
+{
+    unsigned long *bitmap, nbits, value;
+    ThreadContext *tc = THREAD_CONTEXT(obj);
+    uint16List *host_cpus = NULL;
+    uint16List **tail = &host_cpus;
+    int ret;
+
+    if (tc->thread_id == -1) {
+        error_setg(errp, "Object not initialized yet");
+        return;
+    }
+
+    ret = qemu_thread_get_affinity(&tc->thread, &bitmap, &nbits);
+    if (ret) {
+        error_setg(errp, "Getting CPU affinity failed: %s", strerror(ret));
+        return;
+    }
+
+    value = find_first_bit(bitmap, nbits);
+    while (value < nbits) {
+        QAPI_LIST_APPEND(tail, value);
+
+        value = find_next_bit(bitmap, nbits, value + 1);
+    }
+    g_free(bitmap);
+
+    visit_type_uint16List(v, name, &host_cpus, errp);
+    qapi_free_uint16List(host_cpus);
+}
+
+static void thread_context_get_thread_id(Object *obj, Visitor *v,
+                                         const char *name, void *opaque,
+                                         Error **errp)
+{
+    ThreadContext *tc = THREAD_CONTEXT(obj);
+    uint64_t value = tc->thread_id;
+
+    visit_type_uint64(v, name, &value, errp);
+}
+
+static void thread_context_instance_complete(UserCreatable *uc, Error **errp)
+{
+    ThreadContext *tc = THREAD_CONTEXT(uc);
+    char *thread_name;
+    int ret;
+
+    thread_name = g_strdup_printf("TC %s",
+                               object_get_canonical_path_component(OBJECT(uc)));
+    qemu_thread_create(&tc->thread, thread_name, thread_context_run, tc,
+                       QEMU_THREAD_JOINABLE);
+    g_free(thread_name);
+
+    /* Wait until initialization of the thread is done. */
+    while (tc->thread_id == -1) {
+        qemu_sem_wait(&tc->sem);
+    }
+
+    if (tc->init_cpu_bitmap) {
+        ret = qemu_thread_set_affinity(&tc->thread, tc->init_cpu_bitmap,
+                                       tc->init_cpu_nbits);
+        if (ret) {
+            error_setg(errp, "Setting CPU affinity failed: %s", strerror(ret));
+        }
+        g_free(tc->init_cpu_bitmap);
+        tc->init_cpu_bitmap = NULL;
+    }
+}
+
+static void thread_context_class_init(ObjectClass *oc, void *data)
+{
+    UserCreatableClass *ucc = USER_CREATABLE_CLASS(oc);
+
+    ucc->complete = thread_context_instance_complete;
+    object_class_property_add(oc, "thread-id", "int",
+                              thread_context_get_thread_id, NULL, NULL,
+                              NULL);
+    object_class_property_add(oc, "cpu-affinity", "int",
+                              thread_context_get_cpu_affinity,
+                              thread_context_set_cpu_affinity, NULL, NULL);
+}
+
+static void thread_context_instance_init(Object *obj)
+{
+    ThreadContext *tc = THREAD_CONTEXT(obj);
+
+    tc->thread_id = -1;
+    qemu_sem_init(&tc->sem, 0);
+    qemu_sem_init(&tc->sem_thread, 0);
+    qemu_mutex_init(&tc->mutex);
+}
+
+static void thread_context_instance_finalize(Object *obj)
+{
+    ThreadContext *tc = THREAD_CONTEXT(obj);
+
+    if (tc->thread_id != -1) {
+        tc->thread_cmd = TC_CMD_STOP;
+        qemu_sem_post(&tc->sem_thread);
+        qemu_thread_join(&tc->thread);
+    }
+    qemu_sem_destroy(&tc->sem);
+    qemu_sem_destroy(&tc->sem_thread);
+    qemu_mutex_destroy(&tc->mutex);
+}
+
+static const TypeInfo thread_context_info = {
+    .name = TYPE_THREAD_CONTEXT,
+    .parent = TYPE_OBJECT,
+    .class_init = thread_context_class_init,
+    .instance_size = sizeof(ThreadContext),
+    .instance_init = thread_context_instance_init,
+    .instance_finalize = thread_context_instance_finalize,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+static void thread_context_register_types(void)
+{
+    type_register_static(&thread_context_info);
+}
+type_init(thread_context_register_types)
+
+void thread_context_create_thread(ThreadContext *tc, QemuThread *thread,
+                                  const char *name,
+                                  void *(*start_routine)(void *), void *arg,
+                                  int mode)
+{
+    ThreadContextCmdNew data = {
+        .thread = thread,
+        .name = name,
+        .start_routine = start_routine,
+        .arg = arg,
+        .mode = mode,
+    };
+
+    qemu_mutex_lock(&tc->mutex);
+    tc->thread_cmd = TC_CMD_NEW;
+    tc->thread_cmd_data = &data;
+    qemu_sem_post(&tc->sem_thread);
+
+    while (tc->thread_cmd != TC_CMD_NONE) {
+        qemu_sem_wait(&tc->sem);
+    }
+    qemu_mutex_unlock(&tc->mutex);
+}
-- 
2.37.3


