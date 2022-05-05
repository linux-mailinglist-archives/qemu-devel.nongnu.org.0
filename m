Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4543F51BC5E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:44:12 +0200 (CEST)
Received: from localhost ([::1]:49056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmY1r-00006w-2q
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nmX4A-0002CM-KF
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:42:32 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:49091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nmX48-0005KF-Nu
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:42:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651740148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RSdDfD8SF1ZXumd7iDyL3MzHVXBe4qffvfv4Cif5hU8=;
 b=MwFYCkBu6DS8Qrj46ymEVrGS8iNp6cwWdrgcjnZHUT8Lf1lUSnbfIDlu0xguOqu8qlDvKf
 OOssIB8PkDiBoJt/xnWgl4+h8WdHAL6tnHPmsiYqqKEhHosZ5Z+qJM480tyhKp9tt7bzr8
 QqzuY77i7Vf/yf+uK1haG8UoSdsLnLM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-N3_ZCiRoNsaEvyfSYt7htQ-1; Thu, 05 May 2022 04:42:18 -0400
X-MC-Unique: N3_ZCiRoNsaEvyfSYt7htQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51DFF1801389;
 Thu,  5 May 2022 08:42:18 +0000 (UTC)
Received: from localhost (unknown [10.39.193.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E03F054E860;
 Thu,  5 May 2022 08:42:17 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: <qemu-block@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL 2/3] util/main-loop: Introduce the main loop into QOM
Date: Thu,  5 May 2022 09:42:07 +0100
Message-Id: <20220505084208.2338968-3-stefanha@redhat.com>
In-Reply-To: <20220505084208.2338968-1-stefanha@redhat.com>
References: <20220505084208.2338968-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.74; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nicolas Saenz Julienne <nsaenzju@redhat.com>

'event-loop-base' provides basic property handling for all 'AioContext'
based event loops. So let's define a new 'MainLoopClass' that inherits
from it. This will permit tweaking the main loop's properties through
qapi as well as through the command line using the '-object' keyword[1].
Only one instance of 'MainLoopClass' might be created at any time.

'EventLoopBaseClass' learns a new callback, 'can_be_deleted()' so as to
mark 'MainLoop' as non-deletable.

[1] For example:
      -object main-loop,id=main-loop,aio-max-batch=<value>

Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Message-id: 20220425075723.20019-3-nsaenzju@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 qapi/qom.json                    | 13 ++++++++
 meson.build                      |  3 +-
 include/qemu/main-loop.h         | 10 ++++++
 include/sysemu/event-loop-base.h |  1 +
 event-loop-base.c                | 13 ++++++++
 util/main-loop.c                 | 56 ++++++++++++++++++++++++++++++++
 6 files changed, 95 insertions(+), 1 deletion(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index a2439533c5..7d4a2ac1b9 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -540,6 +540,17 @@
             '*poll-grow': 'int',
             '*poll-shrink': 'int' } }
 
+##
+# @MainLoopProperties:
+#
+# Properties for the main-loop object.
+#
+# Since: 7.1
+##
+{ 'struct': 'MainLoopProperties',
+  'base': 'EventLoopBaseProperties',
+  'data': {} }
+
 ##
 # @MemoryBackendProperties:
 #
@@ -830,6 +841,7 @@
     { 'name': 'input-linux',
       'if': 'CONFIG_LINUX' },
     'iothread',
+    'main-loop',
     { 'name': 'memory-backend-epc',
       'if': 'CONFIG_LINUX' },
     'memory-backend-file',
@@ -895,6 +907,7 @@
       'input-linux':                { 'type': 'InputLinuxProperties',
                                       'if': 'CONFIG_LINUX' },
       'iothread':                   'IothreadProperties',
+      'main-loop':                  'MainLoopProperties',
       'memory-backend-epc':         { 'type': 'MemoryBackendEpcProperties',
                                       'if': 'CONFIG_LINUX' },
       'memory-backend-file':        'MemoryBackendFileProperties',
diff --git a/meson.build b/meson.build
index 11e9bd4824..b3d7ed41f9 100644
--- a/meson.build
+++ b/meson.build
@@ -2927,7 +2927,8 @@ libqemuutil = static_library('qemuutil',
                              sources: util_ss.sources() + stub_ss.sources() + genh,
                              dependencies: [util_ss.dependencies(), libm, threads, glib, socket, malloc, pixman])
 qemuutil = declare_dependency(link_with: libqemuutil,
-                              sources: genh + version_res)
+                              sources: genh + version_res,
+                              dependencies: [event_loop_base])
 
 if have_system or have_user
   decodetree = generator(find_program('scripts/decodetree.py'),
diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index d3750c8e76..20c9387654 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -26,9 +26,19 @@
 #define QEMU_MAIN_LOOP_H
 
 #include "block/aio.h"
+#include "qom/object.h"
+#include "sysemu/event-loop-base.h"
 
 #define SIG_IPI SIGUSR1
 
+#define TYPE_MAIN_LOOP  "main-loop"
+OBJECT_DECLARE_TYPE(MainLoop, MainLoopClass, MAIN_LOOP)
+
+struct MainLoop {
+    EventLoopBase parent_obj;
+};
+typedef struct MainLoop MainLoop;
+
 /**
  * qemu_init_main_loop: Set up the process so that it can run the main loop.
  *
diff --git a/include/sysemu/event-loop-base.h b/include/sysemu/event-loop-base.h
index 8e77d8b69f..fced4c9fea 100644
--- a/include/sysemu/event-loop-base.h
+++ b/include/sysemu/event-loop-base.h
@@ -25,6 +25,7 @@ struct EventLoopBaseClass {
 
     void (*init)(EventLoopBase *base, Error **errp);
     void (*update_params)(EventLoopBase *base, Error **errp);
+    bool (*can_be_deleted)(EventLoopBase *base);
 };
 
 struct EventLoopBase {
diff --git a/event-loop-base.c b/event-loop-base.c
index a924c73a7c..e7f99a6ec8 100644
--- a/event-loop-base.c
+++ b/event-loop-base.c
@@ -73,10 +73,23 @@ static void event_loop_base_complete(UserCreatable *uc, Error **errp)
     }
 }
 
+static bool event_loop_base_can_be_deleted(UserCreatable *uc)
+{
+    EventLoopBaseClass *bc = EVENT_LOOP_BASE_GET_CLASS(uc);
+    EventLoopBase *backend = EVENT_LOOP_BASE(uc);
+
+    if (bc->can_be_deleted) {
+        return bc->can_be_deleted(backend);
+    }
+
+    return true;
+}
+
 static void event_loop_base_class_init(ObjectClass *klass, void *class_data)
 {
     UserCreatableClass *ucc = USER_CREATABLE_CLASS(klass);
     ucc->complete = event_loop_base_complete;
+    ucc->can_be_deleted = event_loop_base_can_be_deleted;
 
     object_class_property_add(klass, "aio-max-batch", "int",
                               event_loop_base_get_param,
diff --git a/util/main-loop.c b/util/main-loop.c
index 9afac10dff..e30f034815 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -33,6 +33,7 @@
 #include "qemu/error-report.h"
 #include "qemu/queue.h"
 #include "qemu/compiler.h"
+#include "qom/object.h"
 
 #ifndef _WIN32
 #include <sys/wait.h>
@@ -184,6 +185,61 @@ int qemu_init_main_loop(Error **errp)
     return 0;
 }
 
+static void main_loop_update_params(EventLoopBase *base, Error **errp)
+{
+    if (!qemu_aio_context) {
+        error_setg(errp, "qemu aio context not ready");
+        return;
+    }
+
+    aio_context_set_aio_params(qemu_aio_context, base->aio_max_batch, errp);
+}
+
+MainLoop *mloop;
+
+static void main_loop_init(EventLoopBase *base, Error **errp)
+{
+    MainLoop *m = MAIN_LOOP(base);
+
+    if (mloop) {
+        error_setg(errp, "only one main-loop instance allowed");
+        return;
+    }
+
+    main_loop_update_params(base, errp);
+
+    mloop = m;
+    return;
+}
+
+static bool main_loop_can_be_deleted(EventLoopBase *base)
+{
+    return false;
+}
+
+static void main_loop_class_init(ObjectClass *oc, void *class_data)
+{
+    EventLoopBaseClass *bc = EVENT_LOOP_BASE_CLASS(oc);
+
+    bc->init = main_loop_init;
+    bc->update_params = main_loop_update_params;
+    bc->can_be_deleted = main_loop_can_be_deleted;
+}
+
+static const TypeInfo main_loop_info = {
+    .name = TYPE_MAIN_LOOP,
+    .parent = TYPE_EVENT_LOOP_BASE,
+    .class_init = main_loop_class_init,
+    .instance_size = sizeof(MainLoop),
+};
+
+static void main_loop_register_types(void)
+{
+    type_register_static(&main_loop_info);
+}
+
+type_init(main_loop_register_types)
+
 static int max_priority;
 
 #ifndef _WIN32
-- 
2.35.1


