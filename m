Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBA74DB259
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 15:15:09 +0100 (CET)
Received: from localhost ([::1]:53206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUUQe-00038t-5Z
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 10:15:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nUU6n-0005Su-CF
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:54:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nUU6k-0000cO-Q0
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647438874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o2oHDkXntfXJQYcQDYIHU2biG/79LTv3yT9m6YzK7mg=;
 b=IspCooUoCJ4wJQ77qv5CGpsw9vUvPiA+Sus+X1LTVZfyGrsuIiB5BCSk1W0RrPVKjqW3jl
 B1CX29hpv1Le8//OjDEY2eTOxAOrlJ/4NgqXsh6nbogZul0xN1gM+4oYTAG1A/hrAGULa8
 LdpcF/dyaNMVhTnYnOhMDcA2cwYV8kw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-EWNHfciFNp66-ialHwF1jA-1; Wed, 16 Mar 2022 09:54:31 -0400
X-MC-Unique: EWNHfciFNp66-ialHwF1jA-1
Received: by mail-wm1-f70.google.com with SMTP id
 r64-20020a1c2b43000000b0038b59eb1940so1952193wmr.0
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 06:54:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o2oHDkXntfXJQYcQDYIHU2biG/79LTv3yT9m6YzK7mg=;
 b=JqN7uG0VbWZLnGOzdUPeOZPFUqBPWqJ3Ds3o89MHd1JugfQ1VIYvBATBFMk70lZBjQ
 VpSqV7n7rQDTjf9qWPKxnMudOtV3Ysh24iy7KuYCQj260rbohDtFWfzNAaxQ9XM9dCQr
 MjP2bjEr5n8XBLJRxSnevQ9H2e1RIODVfNqTyKLODIMCLkmN1RSztYMsEytNNXxnc9Zu
 DIJVWHVIoMX0SqATv/TD/oCj2TV0GL/S0g4U7tG5XAb6ABB0BpV6FxeRIL36hpNLCOZ4
 Q7Dk+Y1M7sCfxbiUhl0YcVeLeiq0nXuoCp+BaaZ51yLmaihoNhOEBAtqbSfDWMUDX7Vv
 TJ0w==
X-Gm-Message-State: AOAM531Jb3rOcNr5ICpjlO63lTdMPpGwVo4fxG/w/d9K/5u/8kOZVKdX
 pN7k+OuqP8vIxk+2pHooCgWyyohrolGreyRX8reuHIzR6DXD1C79STJ7MkedcM7atERcw9lbDpZ
 iEnzFoyYFfEOUq/k=
X-Received: by 2002:a5d:4a8f:0:b0:1f0:4af2:4e29 with SMTP id
 o15-20020a5d4a8f000000b001f04af24e29mr35731wrq.519.1647438869976; 
 Wed, 16 Mar 2022 06:54:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9XRrqiTK4yUlFzGasmvX5eicANWWdAHMf72ZcpS7Cjfs5cI6v/UlWZk8HAWNYSKXjUQAIMQ==
X-Received: by 2002:a5d:4a8f:0:b0:1f0:4af2:4e29 with SMTP id
 o15-20020a5d4a8f000000b001f04af24e29mr35708wrq.519.1647438869757; 
 Wed, 16 Mar 2022 06:54:29 -0700 (PDT)
Received: from vian.redhat.com ([2a0c:5a80:3506:3400:69b5:c807:1d52:ff67])
 by smtp.gmail.com with ESMTPSA id
 w7-20020a1cf607000000b00389a5390180sm1770157wmc.25.2022.03.16.06.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 06:54:29 -0700 (PDT)
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: kwolf@redhat.com,
	stefanha@redhat.com,
	berrange@redhat.com
Subject: [PATCH v3 2/3] util/main-loop: Introduce the main loop into QOM
Date: Wed, 16 Mar 2022 14:53:22 +0100
Message-Id: <20220316135321.142850-3-nsaenzju@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316135321.142850-1-nsaenzju@redhat.com>
References: <20220316135321.142850-1-nsaenzju@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsaenzju@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

[1] For example:
      -object main-loop,id=main-loop,aio-max-batch=<value>

Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---

Changes since v2:
 - Fix mainloop's qapi versioning

Changes since v1:
 - Fix json files to differentiate between iothread and main-loop
 - Use OBJECT_DECLARE_TYPE()
 - Fix build dependencies

 event-loop-base.c                | 13 ++++++++
 include/qemu/main-loop.h         | 10 ++++++
 include/sysemu/event-loop-base.h |  1 +
 meson.build                      |  3 +-
 qapi/qom.json                    | 15 +++++++++
 util/main-loop.c                 | 56 ++++++++++++++++++++++++++++++++
 6 files changed, 97 insertions(+), 1 deletion(-)

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
index 7a4d6a0920..0aa36a4f17 100644
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
index 281c0691cc..2931904ffe 100644
--- a/meson.build
+++ b/meson.build
@@ -2769,7 +2769,8 @@ libqemuutil = static_library('qemuutil',
                              sources: util_ss.sources() + stub_ss.sources() + genh,
                              dependencies: [util_ss.dependencies(), libm, threads, glib, socket, malloc, pixman])
 qemuutil = declare_dependency(link_with: libqemuutil,
-                              sources: genh + version_res)
+                              sources: genh + version_res,
+                              dependencies: [event_loop_base])
 
 if have_system or have_user
   decodetree = generator(find_program('scripts/decodetree.py'),
diff --git a/qapi/qom.json b/qapi/qom.json
index eeb5395ff3..10800166e8 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -528,6 +528,19 @@
             '*poll-shrink': 'int',
             '*aio-max-batch': 'int' } }
 
+##
+# @MainLoopProperties:
+#
+# Properties for the main-loop object.
+#
+# @aio-max-batch: maximum number of requests in a batch for the AIO engine,
+#                 0 means that the engine will use its default (default:0)
+#
+# Since: 7.1
+##
+{ 'struct': 'MainLoopProperties',
+  'data': { '*aio-max-batch': 'int' } }
+
 ##
 # @MemoryBackendProperties:
 #
@@ -818,6 +831,7 @@
     { 'name': 'input-linux',
       'if': 'CONFIG_LINUX' },
     'iothread',
+    'main-loop',
     { 'name': 'memory-backend-epc',
       'if': 'CONFIG_LINUX' },
     'memory-backend-file',
@@ -883,6 +897,7 @@
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


