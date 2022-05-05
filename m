Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8CB51BC30
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:31:46 +0200 (CEST)
Received: from localhost ([::1]:57984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmXpm-00035h-TA
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nmX44-000287-DN
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:42:24 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:42041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nmX41-0005Iw-Nb
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:42:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651740141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8BoGYR7P0JrC7PScaXeb9yFT3H2nIQ1RmzV+6JIFR7w=;
 b=NMWZ9/SnCmMnWfzdgkZ34Lr5qa/j7Ll+WWU2liKND/7QVH9z/Ni9cQfcODhQm6UHSEsk9O
 Y5uVUaZVSgLrJL95YcU6+6wZ6FpoKjxDkZ+OvoCynpWl1nrSqZHE/yNv3WOhmOlxdUIchF
 xBpfrp5UtZFUDjvDK74Ta+0vGFJrFWs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-X1SCXXk7MEOIVTk32YMlqQ-1; Thu, 05 May 2022 04:42:17 -0400
X-MC-Unique: X1SCXXk7MEOIVTk32YMlqQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2157F1014A68;
 Thu,  5 May 2022 08:42:17 +0000 (UTC)
Received: from localhost (unknown [10.39.193.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF60F401474;
 Thu,  5 May 2022 08:42:16 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: <qemu-block@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL 1/3] Introduce event-loop-base abstract class
Date: Thu,  5 May 2022 09:42:06 +0100
Message-Id: <20220505084208.2338968-2-stefanha@redhat.com>
In-Reply-To: <20220505084208.2338968-1-stefanha@redhat.com>
References: <20220505084208.2338968-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.74; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Nicolas Saenz Julienne <nsaenzju@redhat.com>

Introduce the 'event-loop-base' abstract class, it'll hold the
properties common to all event loops and provide the necessary hooks for
their creation and maintenance. Then have iothread inherit from it.

EventLoopBaseClass is defined as user creatable and provides a hook for
its children to attach themselves to the user creatable class 'complete'
function. It also provides an update_params() callback to propagate
property changes onto its children.

The new 'event-loop-base' class will live in the root directory. It is
built on its own using the 'link_whole' option (there are no direct
function dependencies between the class and its children, it all happens
trough 'constructor' magic). And also imposes new compilation
dependencies:

    qom <- event-loop-base <- blockdev (iothread.c)

And in subsequent patches:

    qom <- event-loop-base <- qemuutil (util/main-loop.c)

All this forced some amount of reordering in meson.build:

 - Moved qom build definition before qemuutil. Doing it the other way
   around (i.e. moving qemuutil after qom) isn't possible as a lot of
   core libraries that live in between the two depend on it.

 - Process the 'hw' subdir earlier, as it introduces files into the
   'qom' source set.

No functional changes intended.

Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Message-id: 20220425075723.20019-2-nsaenzju@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 qapi/qom.json                    |  22 +++++--
 meson.build                      |  23 ++++---
 include/sysemu/event-loop-base.h |  36 +++++++++++
 include/sysemu/iothread.h        |   6 +-
 event-loop-base.c                | 104 +++++++++++++++++++++++++++++++
 iothread.c                       |  65 ++++++-------------
 6 files changed, 192 insertions(+), 64 deletions(-)
 create mode 100644 include/sysemu/event-loop-base.h
 create mode 100644 event-loop-base.c

diff --git a/qapi/qom.json b/qapi/qom.json
index eeb5395ff3..a2439533c5 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -499,6 +499,20 @@
             '*repeat': 'bool',
             '*grab-toggle': 'GrabToggleKeys' } }
 
+##
+# @EventLoopBaseProperties:
+#
+# Common properties for event loops
+#
+# @aio-max-batch: maximum number of requests in a batch for the AIO engine,
+#                 0 means that the engine will use its default.
+#                 (default: 0)
+#
+# Since: 7.1
+##
+{ 'struct': 'EventLoopBaseProperties',
+  'data': { '*aio-max-batch': 'int' } }
+
 ##
 # @IothreadProperties:
 #
@@ -516,17 +530,15 @@
 #               algorithm detects it is spending too long polling without
 #               encountering events. 0 selects a default behaviour (default: 0)
 #
-# @aio-max-batch: maximum number of requests in a batch for the AIO engine,
-#                 0 means that the engine will use its default
-#                 (default:0, since 6.1)
+# The @aio-max-batch option is available since 6.1.
 #
 # Since: 2.0
 ##
 { 'struct': 'IothreadProperties',
+  'base': 'EventLoopBaseProperties',
   'data': { '*poll-max-ns': 'int',
             '*poll-grow': 'int',
-            '*poll-shrink': 'int',
-            '*aio-max-batch': 'int' } }
+            '*poll-shrink': 'int' } }
 
 ##
 # @MemoryBackendProperties:
diff --git a/meson.build b/meson.build
index c26aa442d4..11e9bd4824 100644
--- a/meson.build
+++ b/meson.build
@@ -2899,6 +2899,7 @@ subdir('qom')
 subdir('authz')
 subdir('crypto')
 subdir('ui')
+subdir('hw')
 
 
 if enable_modules
@@ -2906,6 +2907,18 @@ if enable_modules
   modulecommon = declare_dependency(link_whole: libmodulecommon, compile_args: '-DBUILD_DSO')
 endif
 
+qom_ss = qom_ss.apply(config_host, strict: false)
+libqom = static_library('qom', qom_ss.sources() + genh,
+                        dependencies: [qom_ss.dependencies()],
+                        name_suffix: 'fa')
+qom = declare_dependency(link_whole: libqom)
+
+event_loop_base = files('event-loop-base.c')
+event_loop_base = static_library('event-loop-base', sources: event_loop_base + genh,
+                                 build_by_default: true)
+event_loop_base = declare_dependency(link_whole: event_loop_base,
+                                     dependencies: [qom])
+
 stub_ss = stub_ss.apply(config_all, strict: false)
 
 util_ss.add_all(trace_ss)
@@ -2992,7 +3005,6 @@ subdir('monitor')
 subdir('net')
 subdir('replay')
 subdir('semihosting')
-subdir('hw')
 subdir('tcg')
 subdir('fpu')
 subdir('accel')
@@ -3117,13 +3129,6 @@ qemu_syms = custom_target('qemu.syms', output: 'qemu.syms',
                              capture: true,
                              command: [undefsym, nm, '@INPUT@'])
 
-qom_ss = qom_ss.apply(config_host, strict: false)
-libqom = static_library('qom', qom_ss.sources() + genh,
-                        dependencies: [qom_ss.dependencies()],
-                        name_suffix: 'fa')
-
-qom = declare_dependency(link_whole: libqom)
-
 authz_ss = authz_ss.apply(config_host, strict: false)
 libauthz = static_library('authz', authz_ss.sources() + genh,
                           dependencies: [authz_ss.dependencies()],
@@ -3176,7 +3181,7 @@ libblockdev = static_library('blockdev', blockdev_ss.sources() + genh,
                              build_by_default: false)
 
 blockdev = declare_dependency(link_whole: [libblockdev],
-                              dependencies: [block])
+                              dependencies: [block, event_loop_base])
 
 qmp_ss = qmp_ss.apply(config_host, strict: false)
 libqmp = static_library('qmp', qmp_ss.sources() + genh,
diff --git a/include/sysemu/event-loop-base.h b/include/sysemu/event-loop-base.h
new file mode 100644
index 0000000000..8e77d8b69f
--- /dev/null
+++ b/include/sysemu/event-loop-base.h
@@ -0,0 +1,36 @@
+/*
+ * QEMU event-loop backend
+ *
+ * Copyright (C) 2022 Red Hat Inc
+ *
+ * Authors:
+ *  Nicolas Saenz Julienne <nsaenzju@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef QEMU_EVENT_LOOP_BASE_H
+#define QEMU_EVENT_LOOP_BASE_H
+
+#include "qom/object.h"
+#include "block/aio.h"
+#include "qemu/typedefs.h"
+
+#define TYPE_EVENT_LOOP_BASE         "event-loop-base"
+OBJECT_DECLARE_TYPE(EventLoopBase, EventLoopBaseClass,
+                    EVENT_LOOP_BASE)
+
+struct EventLoopBaseClass {
+    ObjectClass parent_class;
+
+    void (*init)(EventLoopBase *base, Error **errp);
+    void (*update_params)(EventLoopBase *base, Error **errp);
+};
+
+struct EventLoopBase {
+    Object parent;
+
+    /* AioContext AIO engine parameters */
+    int64_t aio_max_batch;
+};
+#endif
diff --git a/include/sysemu/iothread.h b/include/sysemu/iothread.h
index 7f714bd136..8f8601d6ab 100644
--- a/include/sysemu/iothread.h
+++ b/include/sysemu/iothread.h
@@ -17,11 +17,12 @@
 #include "block/aio.h"
 #include "qemu/thread.h"
 #include "qom/object.h"
+#include "sysemu/event-loop-base.h"
 
 #define TYPE_IOTHREAD "iothread"
 
 struct IOThread {
-    Object parent_obj;
+    EventLoopBase parent_obj;
 
     QemuThread thread;
     AioContext *ctx;
@@ -37,9 +38,6 @@ struct IOThread {
     int64_t poll_max_ns;
     int64_t poll_grow;
     int64_t poll_shrink;
-
-    /* AioContext AIO engine parameters */
-    int64_t aio_max_batch;
 };
 typedef struct IOThread IOThread;
 
diff --git a/event-loop-base.c b/event-loop-base.c
new file mode 100644
index 0000000000..a924c73a7c
--- /dev/null
+++ b/event-loop-base.c
@@ -0,0 +1,104 @@
+/*
+ * QEMU event-loop base
+ *
+ * Copyright (C) 2022 Red Hat Inc
+ *
+ * Authors:
+ *  Stefan Hajnoczi <stefanha@redhat.com>
+ *  Nicolas Saenz Julienne <nsaenzju@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qom/object_interfaces.h"
+#include "qapi/error.h"
+#include "sysemu/event-loop-base.h"
+
+typedef struct {
+    const char *name;
+    ptrdiff_t offset; /* field's byte offset in EventLoopBase struct */
+} EventLoopBaseParamInfo;
+
+static EventLoopBaseParamInfo aio_max_batch_info = {
+    "aio-max-batch", offsetof(EventLoopBase, aio_max_batch),
+};
+
+static void event_loop_base_get_param(Object *obj, Visitor *v,
+        const char *name, void *opaque, Error **errp)
+{
+    EventLoopBase *event_loop_base = EVENT_LOOP_BASE(obj);
+    EventLoopBaseParamInfo *info = opaque;
+    int64_t *field = (void *)event_loop_base + info->offset;
+
+    visit_type_int64(v, name, field, errp);
+}
+
+static void event_loop_base_set_param(Object *obj, Visitor *v,
+        const char *name, void *opaque, Error **errp)
+{
+    EventLoopBaseClass *bc = EVENT_LOOP_BASE_GET_CLASS(obj);
+    EventLoopBase *base = EVENT_LOOP_BASE(obj);
+    EventLoopBaseParamInfo *info = opaque;
+    int64_t *field = (void *)base + info->offset;
+    int64_t value;
+
+    if (!visit_type_int64(v, name, &value, errp)) {
+        return;
+    }
+
+    if (value < 0) {
+        error_setg(errp, "%s value must be in range [0, %" PRId64 "]",
+                   info->name, INT64_MAX);
+        return;
+    }
+
+    *field = value;
+
+    if (bc->update_params) {
+        bc->update_params(base, errp);
+    }
+
+    return;
+}
+
+static void event_loop_base_complete(UserCreatable *uc, Error **errp)
+{
+    EventLoopBaseClass *bc = EVENT_LOOP_BASE_GET_CLASS(uc);
+    EventLoopBase *base = EVENT_LOOP_BASE(uc);
+
+    if (bc->init) {
+        bc->init(base, errp);
+    }
+}
+
+static void event_loop_base_class_init(ObjectClass *klass, void *class_data)
+{
+    UserCreatableClass *ucc = USER_CREATABLE_CLASS(klass);
+    ucc->complete = event_loop_base_complete;
+
+    object_class_property_add(klass, "aio-max-batch", "int",
+                              event_loop_base_get_param,
+                              event_loop_base_set_param,
+                              NULL, &aio_max_batch_info);
+}
+
+static const TypeInfo event_loop_base_info = {
+    .name = TYPE_EVENT_LOOP_BASE,
+    .parent = TYPE_OBJECT,
+    .instance_size = sizeof(EventLoopBase),
+    .class_size = sizeof(EventLoopBaseClass),
+    .class_init = event_loop_base_class_init,
+    .abstract = true,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+static void register_types(void)
+{
+    type_register_static(&event_loop_base_info);
+}
+type_init(register_types);
diff --git a/iothread.c b/iothread.c
index 0f98af0f2a..8fa2f3bfb8 100644
--- a/iothread.c
+++ b/iothread.c
@@ -17,6 +17,7 @@
 #include "qemu/module.h"
 #include "block/aio.h"
 #include "block/block.h"
+#include "sysemu/event-loop-base.h"
 #include "sysemu/iothread.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-misc.h"
@@ -152,10 +153,15 @@ static void iothread_init_gcontext(IOThread *iothread)
     iothread->main_loop = g_main_loop_new(iothread->worker_context, TRUE);
 }
 
-static void iothread_set_aio_context_params(IOThread *iothread, Error **errp)
+static void iothread_set_aio_context_params(EventLoopBase *base, Error **errp)
 {
+    IOThread *iothread = IOTHREAD(base);
     ERRP_GUARD();
 
+    if (!iothread->ctx) {
+        return;
+    }
+
     aio_context_set_poll_params(iothread->ctx,
                                 iothread->poll_max_ns,
                                 iothread->poll_grow,
@@ -166,14 +172,15 @@ static void iothread_set_aio_context_params(IOThread *iothread, Error **errp)
     }
 
     aio_context_set_aio_params(iothread->ctx,
-                               iothread->aio_max_batch,
+                               iothread->parent_obj.aio_max_batch,
                                errp);
 }
 
-static void iothread_complete(UserCreatable *obj, Error **errp)
+
+static void iothread_init(EventLoopBase *base, Error **errp)
 {
     Error *local_error = NULL;
-    IOThread *iothread = IOTHREAD(obj);
+    IOThread *iothread = IOTHREAD(base);
     char *thread_name;
 
     iothread->stopping = false;
@@ -189,7 +196,7 @@ static void iothread_complete(UserCreatable *obj, Error **errp)
      */
     iothread_init_gcontext(iothread);
 
-    iothread_set_aio_context_params(iothread, &local_error);
+    iothread_set_aio_context_params(base, &local_error);
     if (local_error) {
         error_propagate(errp, local_error);
         aio_context_unref(iothread->ctx);
@@ -201,7 +208,7 @@ static void iothread_complete(UserCreatable *obj, Error **errp)
      * to inherit.
      */
     thread_name = g_strdup_printf("IO %s",
-                        object_get_canonical_path_component(OBJECT(obj)));
+                        object_get_canonical_path_component(OBJECT(base)));
     qemu_thread_create(&iothread->thread, thread_name, iothread_run,
                        iothread, QEMU_THREAD_JOINABLE);
     g_free(thread_name);
@@ -226,9 +233,6 @@ static IOThreadParamInfo poll_grow_info = {
 static IOThreadParamInfo poll_shrink_info = {
     "poll-shrink", offsetof(IOThread, poll_shrink),
 };
-static IOThreadParamInfo aio_max_batch_info = {
-    "aio-max-batch", offsetof(IOThread, aio_max_batch),
-};
 
 static void iothread_get_param(Object *obj, Visitor *v,
         const char *name, IOThreadParamInfo *info, Error **errp)
@@ -288,35 +292,12 @@ static void iothread_set_poll_param(Object *obj, Visitor *v,
     }
 }
 
-static void iothread_get_aio_param(Object *obj, Visitor *v,
-        const char *name, void *opaque, Error **errp)
-{
-    IOThreadParamInfo *info = opaque;
-
-    iothread_get_param(obj, v, name, info, errp);
-}
-
-static void iothread_set_aio_param(Object *obj, Visitor *v,
-        const char *name, void *opaque, Error **errp)
-{
-    IOThread *iothread = IOTHREAD(obj);
-    IOThreadParamInfo *info = opaque;
-
-    if (!iothread_set_param(obj, v, name, info, errp)) {
-        return;
-    }
-
-    if (iothread->ctx) {
-        aio_context_set_aio_params(iothread->ctx,
-                                   iothread->aio_max_batch,
-                                   errp);
-    }
-}
-
 static void iothread_class_init(ObjectClass *klass, void *class_data)
 {
-    UserCreatableClass *ucc = USER_CREATABLE_CLASS(klass);
-    ucc->complete = iothread_complete;
+    EventLoopBaseClass *bc = EVENT_LOOP_BASE_CLASS(klass);
+
+    bc->init = iothread_init;
+    bc->update_params = iothread_set_aio_context_params;
 
     object_class_property_add(klass, "poll-max-ns", "int",
                               iothread_get_poll_param,
@@ -330,23 +311,15 @@ static void iothread_class_init(ObjectClass *klass, void *class_data)
                               iothread_get_poll_param,
                               iothread_set_poll_param,
                               NULL, &poll_shrink_info);
-    object_class_property_add(klass, "aio-max-batch", "int",
-                              iothread_get_aio_param,
-                              iothread_set_aio_param,
-                              NULL, &aio_max_batch_info);
 }
 
 static const TypeInfo iothread_info = {
     .name = TYPE_IOTHREAD,
-    .parent = TYPE_OBJECT,
+    .parent = TYPE_EVENT_LOOP_BASE,
     .class_init = iothread_class_init,
     .instance_size = sizeof(IOThread),
     .instance_init = iothread_instance_init,
     .instance_finalize = iothread_instance_finalize,
-    .interfaces = (InterfaceInfo[]) {
-        {TYPE_USER_CREATABLE},
-        {}
-    },
 };
 
 static void iothread_register_types(void)
@@ -383,7 +356,7 @@ static int query_one_iothread(Object *object, void *opaque)
     info->poll_max_ns = iothread->poll_max_ns;
     info->poll_grow = iothread->poll_grow;
     info->poll_shrink = iothread->poll_shrink;
-    info->aio_max_batch = iothread->aio_max_batch;
+    info->aio_max_batch = iothread->parent_obj.aio_max_batch;
 
     QAPI_LIST_APPEND(*tail, info);
     return 0;
-- 
2.35.1


