Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AF34CC0A2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:05:56 +0100 (CET)
Received: from localhost ([::1]:33592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPn1f-0007fV-Kp
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:05:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nPmua-0006ta-NG
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:58:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nPmuW-0000pS-Nm
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:58:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646319512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0IJvMiwB3fXMCCWHpy2o8W5h1w30vAktoIKbi/G/mnU=;
 b=GqhfDEubD4ETRwHQ4NYEvXMFXwJXmtHm6Wr+vtAeP1ojuOUvgSuOXiofs4uaLJhCTcZVbb
 eZ0SIWm2W0MFphsVD6DnE0QhaUocWYynZ6G7oPd5w1z85r2zIxjeaLWiMsQDQzCpi0tl+Q
 uEDI7hOfdamvTIf2gXyQU+HX1GUwuhI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-3CaSVq6PPT-xSJsDa47tKQ-1; Thu, 03 Mar 2022 09:58:29 -0500
X-MC-Unique: 3CaSVq6PPT-xSJsDa47tKQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l19-20020a05600c4f1300b003818783847eso1434791wmq.2
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 06:58:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0IJvMiwB3fXMCCWHpy2o8W5h1w30vAktoIKbi/G/mnU=;
 b=6MxOVkVUTio1CCAD8kbgQx4kob/jULdjBhM+vNFaWecDv5FOteoACqmJRIjKEGGnAQ
 xVU+SjhD2ayecPc4c7+PjrFVC47uS5ux0QJSKgMZcwLh50LhXSou8cE19MKiCsS3lhuy
 mlEH3vt+5PopgJt5T3fWuJPJwbVDWXwFU2E8LNc5SRGjDQLJouRXWZFkwTYeCVmagOFR
 jp8wl2zdlQgx9YqKRpGCSen0HKb2mKcPMYO/WOq1FQb+cpjIuSaALqGpluI+/Nv5ExA5
 YHCOgFj0QVcFdDTy0thvPsyIFaJTdxFBs6EAxo+wv55UIheQVlh/8lrc36gL1/uftMpQ
 40tg==
X-Gm-Message-State: AOAM531O02rg/S5EFmQX+fQh1lKTofloyIJALmPgp3x64Kr8OCdwegRQ
 k8LzFcWAjHNkApDddy9cXUTFkKB1J4Z9TgeRYG4Kv8iUF5FnS6LHKaJQMzVZ493FumVFyDzYcuD
 LWaOsPjpyJoV83xw=
X-Received: by 2002:a05:6000:24b:b0:1ef:759f:b12f with SMTP id
 m11-20020a056000024b00b001ef759fb12fmr21593274wrz.130.1646319508370; 
 Thu, 03 Mar 2022 06:58:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmzlVXOqO+/hAZy8dvcByPj0va9UiV3zclcUgR87jXVKrkT6pyUts3lco8qSxOq6Cwnuok+Q==
X-Received: by 2002:a05:6000:24b:b0:1ef:759f:b12f with SMTP id
 m11-20020a056000024b00b001ef759fb12fmr21593237wrz.130.1646319507984; 
 Thu, 03 Mar 2022 06:58:27 -0800 (PST)
Received: from vian.redhat.com ([2a0c:5a80:1b14:b500:abb:f9d1:7bc2:3db8])
 by smtp.gmail.com with ESMTPSA id
 v124-20020a1cac82000000b0037c3d08e0e7sm9139512wme.29.2022.03.03.06.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 06:58:27 -0800 (PST)
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: kwolf@redhat.com,
	stefanha@redhat.com,
	berrange@redhat.com
Subject: [PATCH v2 2/4] Introduce event-loop-base abstract class
Date: Thu,  3 Mar 2022 15:58:20 +0100
Message-Id: <20220303145822.518887-3-nsaenzju@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303145822.518887-1-nsaenzju@redhat.com>
References: <20220303145822.518887-1-nsaenzju@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsaenzju@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, eduardo@habkost.net, qemu-block@nongnu.org,
 michael.roth@amd.com, mtosatti@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, hreitz@redhat.com, pbonzini@redhat.com,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the 'event-loop-base' abstract class, it'll hold the
properties common to all event loops and provide the necessary hooks for
their creation and maintenance. Then have iothread inherit from it.

EventLoopBaseClass is defined as user creatable and provides a hook for
its children to attach themselves to the user creatable class 'complete'
function. It also provides an update_params() callback to propagate
property changes onto its children.

The new 'event-loop-base' class will live in the root directory, and it
imposes new compilation dependencies:

    qom <- event-loop-base <- blockdev (iothread)

It is built with on its own using the link_whole option as there are no
direct function dependencies between the class and its children
(everything happens through the 'contructor' attribute). All this forced
some amount of reordering in meson.build, among other things the 'hw'
subdir is processed earlier as it introduces files into the 'qom' source
set.

No functional changes intended.

Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
---

Changes since v1:
 - Rename to event-loop-base
 - Move event-loop-base into root directory
 - Build event-loop-base on its own, use link_whole to avoid the problem
   of the object file not being linked due to lacking direct calls from
   dependencies.
 - Move poll parameters into iothread, as main loop can't poll
 - Update Authorship (I took what iothread.c had and added myself, I
   hope that's fine)
 - Introduce update_params() callback

 event-loop-base.c                | 104 +++++++++++++++++++++++++++++++
 include/sysemu/event-loop-base.h |  36 +++++++++++
 include/sysemu/iothread.h        |   6 +-
 iothread.c                       |  65 ++++++-------------
 meson.build                      |  23 ++++---
 5 files changed, 175 insertions(+), 59 deletions(-)
 create mode 100644 event-loop-base.c
 create mode 100644 include/sysemu/event-loop-base.h

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
diff --git a/meson.build b/meson.build
index 8df40bfac4..3c90b4f2aa 100644
--- a/meson.build
+++ b/meson.build
@@ -2717,6 +2717,7 @@ subdir('qom')
 subdir('authz')
 subdir('crypto')
 subdir('ui')
+subdir('hw')
 
 
 if enable_modules
@@ -2724,6 +2725,18 @@ if enable_modules
   modulecommon = declare_dependency(link_whole: libmodulecommon, compile_args: '-DBUILD_DSO')
 endif
 
+qom_ss = qom_ss.apply(config_host, strict: false)
+libqom = static_library('qom', qom_ss.sources() + genh,
+                        dependencies: [qom_ss.dependencies()],
+                        name_suffix: 'fa')
+qom = declare_dependency(link_whole: libqom)
+
+event_loop_base = files('event-loop-base.c')
+event_loop_base = static_library('event-loop-base', sources: event_loop_base,
+                                 build_by_default: true)
+event_loop_base = declare_dependency(link_whole: event_loop_base,
+                                     dependencies: [qom])
+
 stub_ss = stub_ss.apply(config_all, strict: false)
 
 util_ss.add_all(trace_ss)
@@ -2810,7 +2823,6 @@ subdir('monitor')
 subdir('net')
 subdir('replay')
 subdir('semihosting')
-subdir('hw')
 subdir('tcg')
 subdir('fpu')
 subdir('accel')
@@ -2935,13 +2947,6 @@ qemu_syms = custom_target('qemu.syms', output: 'qemu.syms',
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
@@ -2994,7 +2999,7 @@ libblockdev = static_library('blockdev', blockdev_ss.sources() + genh,
                              build_by_default: false)
 
 blockdev = declare_dependency(link_whole: [libblockdev],
-                              dependencies: [block])
+                              dependencies: [block, event_loop_base])
 
 qmp_ss = qmp_ss.apply(config_host, strict: false)
 libqmp = static_library('qmp', qmp_ss.sources() + genh,
-- 
2.35.1


