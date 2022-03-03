Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E54C4CC09A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:03:26 +0100 (CET)
Received: from localhost ([::1]:57596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPmzF-0004lw-C0
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:03:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nPmuZ-0006t1-FJ
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:58:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nPmuX-0000pi-Jg
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:58:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646319512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jl6KwEcnRlrfZnUtJs5X9/w23yLIP3/rFHbhfvDj+eg=;
 b=ZYtv9L7ymT+hhVZ5bwmLp8NPLymRXJbuNKoFBDjC0zj7PRA0/9Uw32vEpIZJqUs2MRAr40
 C+kxNcaNe1DI4lGdXyw3hUAve2i++MXvO1RF7UTRa18XDyZTmaHBitA0YyQKmThGsu1SIf
 bjsklcXyogyKZs6/n3wxKbxG6tmadck=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-iByvRTzONbGfptNDJwAW_A-1; Thu, 03 Mar 2022 09:58:32 -0500
X-MC-Unique: iByvRTzONbGfptNDJwAW_A-1
Received: by mail-wm1-f72.google.com with SMTP id
 s129-20020a1ca987000000b0038707017dd7so926957wme.1
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 06:58:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jl6KwEcnRlrfZnUtJs5X9/w23yLIP3/rFHbhfvDj+eg=;
 b=JF4vtLU2ryJ48zY8LcdRKUhu0cMa5da6aPXonUomfsZlIcm65j49WHozRdNw3XSKpJ
 +cUVXes7bR0CWHMw2GMGD54FYO4VEWudG2fI1uaYrkg5EgDIfvwhxabGAO3f9R+r9bcB
 M6sG6Y1c77wxhHwgKfDDPaR86od24kfwHCOI4oKkt8qupbsrdftQXDE6KEDZzVVNJAuT
 4ksco1cosGhK7PSyMoosXRjsmV7XmhErBX+Guxm3YKNLsGjF+B2WRMrSIOtKPzBf4Lh2
 rjchr9UT4wBN4Ym439fqe7fNsFzRqkJ8HyABumf1RjoL+f5K92TbuDAd1GDH5A6A4KuC
 /fjw==
X-Gm-Message-State: AOAM531mC0Ajr7HDsz144fy6pdXThldgFikuAidJyivRWYlFF+CkX16p
 8wL+nTR8CE8S/hIQbBYub9shTpYpIDCsIFUjh/CptSc5H+CplpyJqSxBAeJdbVIpm5yzqCP48YX
 GA1CTYO9cTI/E7C0=
X-Received: by 2002:a05:6000:1846:b0:1ea:78fc:1d60 with SMTP id
 c6-20020a056000184600b001ea78fc1d60mr26136206wri.590.1646319510041; 
 Thu, 03 Mar 2022 06:58:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzw3h8ojaFhRBYjl9tKOfmsIEHtH2BD7OQXNgLz/mWNXd3P50c66Kv6c/cV9U5JaIjqb80RoQ==
X-Received: by 2002:a05:6000:1846:b0:1ea:78fc:1d60 with SMTP id
 c6-20020a056000184600b001ea78fc1d60mr26136185wri.590.1646319509777; 
 Thu, 03 Mar 2022 06:58:29 -0800 (PST)
Received: from vian.redhat.com ([2a0c:5a80:1b14:b500:abb:f9d1:7bc2:3db8])
 by smtp.gmail.com with ESMTPSA id
 v124-20020a1cac82000000b0037c3d08e0e7sm9139512wme.29.2022.03.03.06.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 06:58:29 -0800 (PST)
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: kwolf@redhat.com,
	stefanha@redhat.com,
	berrange@redhat.com
Subject: [PATCH v2 3/4] util/main-loop: Introduce the main loop into QOM
Date: Thu,  3 Mar 2022 15:58:21 +0100
Message-Id: <20220303145822.518887-4-nsaenzju@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsaenzju@redhat.com;
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

'event-loop-base' provides basic property handling for all 'AioContext'
based event loops. So let's define a new 'MainLoopClass' that inherits
from it. This will permit tweaking the main loop's properties through
qapi as well as through the command line using the '-object' keyword[1].
Only one instance of 'MainLoopClass' might be created at any time.

'EventLoopBaseClass' learns a new callback, 'can_be_deleted()' so as to
mark 'MainLoop' as non-deletable.

Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>

[1] For example:
      -object main-loop,id=main-loop,aio-max-batch=<value>
---

Changes since v1:
 - Fix json files to differentiate between iothread and main-loop
 - Use OBJECT_DECLARE_TYPE()
 - Fix build dependencies

 event-loop-base.c                | 13 ++++++++
 include/qemu/main-loop.h         | 10 ++++++
 include/sysemu/event-loop-base.h |  1 +
 meson.build                      |  3 +-
 qapi/qom.json                    | 16 +++++++++
 util/main-loop.c                 | 56 ++++++++++++++++++++++++++++++++
 6 files changed, 98 insertions(+), 1 deletion(-)

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
diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index 8dbc6fcb89..71231729c2 100644
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
diff --git a/meson.build b/meson.build
index 3c90b4f2aa..2b9b7202ac 100644
--- a/meson.build
+++ b/meson.build
@@ -2745,7 +2745,8 @@ libqemuutil = static_library('qemuutil',
                              sources: util_ss.sources() + stub_ss.sources() + genh,
                              dependencies: [util_ss.dependencies(), libm, threads, glib, socket, malloc, pixman])
 qemuutil = declare_dependency(link_with: libqemuutil,
-                              sources: genh + version_res)
+                              sources: genh + version_res,
+                              dependencies: [event_loop_base])
 
 if have_system or have_user
   decodetree = generator(find_program('scripts/decodetree.py'),
diff --git a/qapi/qom.json b/qapi/qom.json
index eeb5395ff3..c8eb192772 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -528,6 +528,20 @@
             '*poll-shrink': 'int',
             '*aio-max-batch': 'int' } }
 
+##
+# @MainLoopProperties:
+#
+# Properties for the main-loop object.
+#
+# @aio-max-batch: maximum number of requests in a batch for the AIO engine,
+#                 0 means that the engine will use its default
+#                 (default:0, since 6.1)
+#
+# Since: 2.0
+##
+{ 'struct': 'MainLoopProperties',
+  'data': { '*aio-max-batch': 'int' } }
+
 ##
 # @MemoryBackendProperties:
 #
@@ -818,6 +832,7 @@
     { 'name': 'input-linux',
       'if': 'CONFIG_LINUX' },
     'iothread',
+    'main-loop',
     { 'name': 'memory-backend-epc',
       'if': 'CONFIG_LINUX' },
     'memory-backend-file',
@@ -883,6 +898,7 @@
       'input-linux':                { 'type': 'InputLinuxProperties',
                                       'if': 'CONFIG_LINUX' },
       'iothread':                   'IothreadProperties',
+      'main-loop':                  'MainLoopProperties',
       'memory-backend-epc':         { 'type': 'MemoryBackendEpcProperties',
                                       'if': 'CONFIG_LINUX' },
       'memory-backend-file':        'MemoryBackendFileProperties',
diff --git a/util/main-loop.c b/util/main-loop.c
index 4d5a5b9943..3bf5709374 100644
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


