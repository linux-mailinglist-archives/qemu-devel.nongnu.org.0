Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE232610DDD
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 11:54:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooM2x-0002aH-Ok; Fri, 28 Oct 2022 05:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ooM2u-0002Ua-Je
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:53:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ooM2s-0003hP-Aq
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:53:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666950777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p8M+64sZ8+aq4CSOXpNdol1e0LcXBAo4jh1/N/Q1jWU=;
 b=BBM6AmJOVbGrTXrgRi0UG7adotJXcLWxnKGUYKvzFeAdCfOO0AFNU2eftLo/4Y+8yW7+Tz
 abbDsfLIhd2u5rjHXlnl/mOUaZ5O+D8/CRZTU03HkM3g5cvLqO8gHsj3P9jOJJSmcn9W86
 Ri1bA2DqWrW2kHkeZ5xzcDPhqw/gAOc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-BZh9YzEpMSWgJUyqVYHzNg-1; Fri, 28 Oct 2022 05:52:54 -0400
X-MC-Unique: BZh9YzEpMSWgJUyqVYHzNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B79741C09B8F;
 Fri, 28 Oct 2022 09:52:53 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.241])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0B34140006F;
 Fri, 28 Oct 2022 09:52:48 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, David Hildenbrand <david@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [GIT PULL 4/8] util: Introduce ThreadContext user-creatable object
Date: Fri, 28 Oct 2022 11:52:21 +0200
Message-Id: <20221028095225.86118-5-david@redhat.com>
In-Reply-To: <20221028095225.86118-1-david@redhat.com>
References: <20221028095225.86118-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Setting the CPU affinity of QEMU threads is a bit problematic, because
QEMU doesn't always have permissions to set the CPU affinity itself,
for example, with seccomp after initialized by QEMU:
    -sandbox enable=on,resourcecontrol=deny

General information about CPU affinities can be found in the man page of
taskset:
    CPU affinity is a scheduler property that "bonds" a process to a given
    set of CPUs on the system. The Linux scheduler will honor the given CPU
    affinity and the process will not run on any other CPUs.

While upper layers are already aware of how to handle CPU affinities for
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
    CPU affinity manually (e.g., via taskset).

(2) Setting the "cpu-affinity" property and letting QEMU try set the
    CPU affinity itself. This will fail if QEMU doesn't have permissions
    to do so anymore after seccomp was initialized.

A simple QEMU example to set the CPU affinity to host CPU 0,1,6,7 would be:
    qemu-system-x86_64 -S \
      -object thread-context,id=tc1,cpu-affinity=0-1,cpu-affinity=6-7

And we can query it via HMP/QMP:
    (qemu) qom-get tc1 cpu-affinity
    [
        0,
        1,
        6,
        7
    ]

But note that due to dynamic library loading this example will not work
before we actually make use of thread_context_create_thread() in QEMU
code, because the type will otherwise not get registered. We'll wire
this up next to make it work.

In general, the interface behaves like pthread_setaffinity_np(): host
CPU numbers that are currently not available are ignored; only host CPU
numbers that are impossible with the current kernel will fail. If the
list of host CPU numbers does not include a single CPU that is
available, setting the CPU affinity will fail.

A ThreadContext can be reused, simply by reconfiguring the CPU affinity.
Note that the CPU affinity of previously created threads will not get
adjusted.

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221014134720.168738-4-david@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/qemu/thread-context.h |  57 +++++++
 qapi/qom.json                 |  17 +++
 util/meson.build              |   1 +
 util/oslib-posix.c            |   1 +
 util/thread-context.c         | 278 ++++++++++++++++++++++++++++++++++
 5 files changed, 354 insertions(+)
 create mode 100644 include/qemu/thread-context.h
 create mode 100644 util/thread-context.c

diff --git a/include/qemu/thread-context.h b/include/qemu/thread-context.h
new file mode 100644
index 0000000000..2ebd6b7fe1
--- /dev/null
+++ b/include/qemu/thread-context.h
@@ -0,0 +1,57 @@
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
index 80dd419b39..8013ba4b82 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -830,6 +830,21 @@
             'reduced-phys-bits': 'uint32',
             '*kernel-hashes': 'bool' } }
 
+##
+# @ThreadContextProperties:
+#
+# Properties for thread context objects.
+#
+# @cpu-affinity: the list of host CPU numbers used as CPU affinity for all
+#                threads created in the thread context (default: QEMU main
+#                thread CPU affinity)
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
@@ -882,6 +897,7 @@
     { 'name': 'secret_keyring',
       'if': 'CONFIG_SECRET_KEYRING' },
     'sev-guest',
+    'thread-context',
     's390-pv-guest',
     'throttle-group',
     'tls-creds-anon',
@@ -948,6 +964,7 @@
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
index 905cbc27cc..28305cdea3 100644
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
index 0000000000..c921905396
--- /dev/null
+++ b/util/thread-context.c
@@ -0,0 +1,278 @@
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


