Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D99B650BD4B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 18:41:34 +0200 (CEST)
Received: from localhost ([::1]:37790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwLd-0000wa-0e
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 12:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nhwJQ-0007E2-KM
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:39:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nhwJN-0005Q5-GI
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:39:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650645552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fk4fSjxVQw6si12W5H3ks1fJ9AQynuIoDCvxTXGLYms=;
 b=M7rkP49T+juIFsHSu9UR1oa4+luCkFujS5HlehtomfnvUThzKlMn+R/8PpMNd6vCjntFaX
 vVEpvinJS+LR9Yf8569p4Of0DHUYa/iFOixS73J6UDNQQaG2Tq6+qLbmocGCIOW73dQ0dU
 QL0XRpf4X4av8+M4jPyhaPtvrYAAe6g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-XDl8jb39PTio70KzhTzeZw-1; Fri, 22 Apr 2022 12:39:11 -0400
X-MC-Unique: XDl8jb39PTio70KzhTzeZw-1
Received: by mail-wr1-f72.google.com with SMTP id
 s14-20020adfa28e000000b0020ac7532f08so824335wra.15
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fk4fSjxVQw6si12W5H3ks1fJ9AQynuIoDCvxTXGLYms=;
 b=uOr+513qCfbzB3gO9Qd3OziTv4iHht+3bPvWVuIRIHWl7CkZkpVKvRxFXNMmJMAezl
 8HsgdMB+TlvSQk3yefEnoLA5Wk91nv74Gpw0T4G23oKIGUMKRvFaLBnw3bw5f+U1s/FS
 gJ4YkC7q4egDtbVwiQsDQSLI8+L/bNyENkv0YXjxbESIYo+WI71CtBdVC4DQwkmJq61x
 P5QYah+eV8jYx/79GfHR5Fhdm490EBHMgydlIaRAwfliB2VDcxltJ9ggLca8hyd0dTMX
 nw96E2ZajmtPxE7GuPCM94BIkLmAL7tNx25iA54PJRyv4xIn1taZ+yR+wkPGR3BoZ33N
 LFxw==
X-Gm-Message-State: AOAM532N1D4y8GqKWH+X+iINV+TViD/yWcySFnWwGoFT6y+tivp0naeV
 rt1ErrkRq9dWJInesMIf+xnvNswh638yqYflEv17bjkvWT0qTRTSd6mx+eIQ92tv4BGwzbJexxz
 iBB/5q9L78KFL84E=
X-Received: by 2002:adf:e609:0:b0:20a:8110:2245 with SMTP id
 p9-20020adfe609000000b0020a81102245mr4387782wrm.211.1650645550313; 
 Fri, 22 Apr 2022 09:39:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFWt6IorCghC19Dw3pTSiv7ETmk7i/U2gxNItQxixR//O1ms0cE4H3yAuH+1Fc+lCKGet3SA==
X-Received: by 2002:adf:e609:0:b0:20a:8110:2245 with SMTP id
 p9-20020adfe609000000b0020a81102245mr4387752wrm.211.1650645550026; 
 Fri, 22 Apr 2022 09:39:10 -0700 (PDT)
Received: from vian.redhat.com ([2a0c:5a80:1306:2f00:cfcf:62cf:6f38:dd92])
 by smtp.gmail.com with ESMTPSA id
 f189-20020a1c38c6000000b0038ff83b9792sm4853481wma.43.2022.04.22.09.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:39:09 -0700 (PDT)
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: kwolf@redhat.com,
	stefanha@redhat.com,
	berrange@redhat.com
Subject: [PATCH v5 2/3] util/main-loop: Introduce the main loop into QOM
Date: Fri, 22 Apr 2022 18:38:56 +0200
Message-Id: <20220422163857.703111-3-nsaenzju@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422163857.703111-1-nsaenzju@redhat.com>
References: <20220422163857.703111-1-nsaenzju@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Changes since v4:
 - Move unrelevant qom.json code into patch #1

Changes since v3:
 - Rework qom.json

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
 qapi/qom.json                    | 12 +++++++
 util/main-loop.c                 | 56 ++++++++++++++++++++++++++++++++
 6 files changed, 94 insertions(+), 1 deletion(-)

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
diff --git a/meson.build b/meson.build
index 0a14e88ffc..b3472ae62a 100644
--- a/meson.build
+++ b/meson.build
@@ -2823,7 +2823,8 @@ libqemuutil = static_library('qemuutil',
                              sources: util_ss.sources() + stub_ss.sources() + genh,
                              dependencies: [util_ss.dependencies(), libm, threads, glib, socket, malloc, pixman])
 qemuutil = declare_dependency(link_with: libqemuutil,
-                              sources: genh + version_res)
+                              sources: genh + version_res,
+                              dependencies: [event_loop_base])
 
 if have_system or have_user
   decodetree = generator(find_program('scripts/decodetree.py'),
diff --git a/qapi/qom.json b/qapi/qom.json
index a2439533c5..51f3acaad8 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -540,6 +540,16 @@
             '*poll-grow': 'int',
             '*poll-shrink': 'int' } }
 
+##
+# @MainLoopProperties:
+#
+# Properties for the main-loop object.
+#
+##
+{ 'struct': 'MainLoopProperties',
+  'base': 'EventLoopBaseProperties',
+  'data': {} }
+
 ##
 # @MemoryBackendProperties:
 #
@@ -830,6 +840,7 @@
     { 'name': 'input-linux',
       'if': 'CONFIG_LINUX' },
     'iothread',
+    'main-loop',
     { 'name': 'memory-backend-epc',
       'if': 'CONFIG_LINUX' },
     'memory-backend-file',
@@ -895,6 +906,7 @@
       'input-linux':                { 'type': 'InputLinuxProperties',
                                       'if': 'CONFIG_LINUX' },
       'iothread':                   'IothreadProperties',
+      'main-loop':                  'MainLoopProperties',
       'memory-backend-epc':         { 'type': 'MemoryBackendEpcProperties',
                                       'if': 'CONFIG_LINUX' },
       'memory-backend-file':        'MemoryBackendFileProperties',
diff --git a/util/main-loop.c b/util/main-loop.c
index b7b0ce4ca0..5b13f456fa 100644
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


