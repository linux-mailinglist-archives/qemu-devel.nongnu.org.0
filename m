Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CD94BDB2B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:19:12 +0100 (CET)
Received: from localhost ([::1]:34686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMCL7-0006eM-PK
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:19:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nMCEp-00076G-GK
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:12:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nMCEi-0005tZ-Ad
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:12:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645463537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xXURA/YIebUAp/Xc3bbhh+kKiOZjwFAhM+vc/rDpDCU=;
 b=iHTS6YKRUl7LIXI91t+9e+B89kXnDBMBD3jOkzZPfyl3mEUJPFIT0QdwdzJmxVyEfVWbst
 3M5MMZIhswgVrLAOVzZIPPamzN4wzGjXfxudfpdLofMu3Wizxpamej3Vuq2U8wov+NZtgy
 cHq4ESm99Q65XzJjBzX799d4Fysic6A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-ruZWqHhLMmiYphQ5ZXoaZQ-1; Mon, 21 Feb 2022 12:12:16 -0500
X-MC-Unique: ruZWqHhLMmiYphQ5ZXoaZQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 n3-20020a05600c294300b0037bc685b717so4592723wmd.8
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 09:12:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xXURA/YIebUAp/Xc3bbhh+kKiOZjwFAhM+vc/rDpDCU=;
 b=pC7BAtUlsVvnEkEqpU1E4gAwuVaqty9u+zfgMzBXQzFcUiK2AxOOvtSwRQAtXnABL+
 ZYRFhBUeFSdgLh2Hl3hOJ36CmGif58Dut11513XpfafaHZah8YckfNMYKc0C61LLB6Ha
 O1s+zdgDebNtLZMiq+kkx7NJsl6A87szTKREro2CCfWkA7ZM/L1GaWbByDSpW1ypk1pf
 vbK8gmSFjnygEgpp9ctIepU3QhRHY80Vji7deGWv2igLl2yj5JmZfwyT+9RWpaWP/B3A
 qFXOhwluwbZhBvpXAeNeSeoUc1CKn9/Vy8CO87GHjVLWKfihPiwzUPZnjnIrpR69HtU6
 qNVA==
X-Gm-Message-State: AOAM533cXtnnQVZvGtWxHKB6ZcGOV1QujX1F+7CjEbEZ9WF1cbLHvEtV
 XuXZwRpoHHhqviw/u5Fhr1MZmv9pdL26MXX22nyMoLYZvNx9W0yakywTv6ousHFXL5qbABo9v53
 Cye+d1WZg2CX8U34=
X-Received: by 2002:a5d:45c4:0:b0:1e3:35b1:3e98 with SMTP id
 b4-20020a5d45c4000000b001e335b13e98mr16558267wrs.270.1645463535035; 
 Mon, 21 Feb 2022 09:12:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyK6E/pM6Nvj6uGxeUFjdAGU6qiL8xyvdrFss9JdcgSuxMCYsdjHsfTq+nB0c3lRu2j+mtoyA==
X-Received: by 2002:a5d:45c4:0:b0:1e3:35b1:3e98 with SMTP id
 b4-20020a5d45c4000000b001e335b13e98mr16558247wrs.270.1645463534805; 
 Mon, 21 Feb 2022 09:12:14 -0800 (PST)
Received: from vian.redhat.com ([2a0c:5a80:1204:1500:37e7:8150:d9df:36f])
 by smtp.gmail.com with ESMTPSA id a10sm24402149wri.74.2022.02.21.09.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 09:12:14 -0800 (PST)
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: kwolf@redhat.com,
	stefanha@redhat.com,
	berrange@redhat.com
Subject: [PATCH 2/3] util/main-loop: Introduce the main loop into QOM
Date: Mon, 21 Feb 2022 18:08:44 +0100
Message-Id: <20220221170843.849084-3-nsaenzju@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221170843.849084-1-nsaenzju@redhat.com>
References: <20220221170843.849084-1-nsaenzju@redhat.com>
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
Cc: fam@euphon.net, eduardo@habkost.net, qemu-block@nongnu.org,
 michael.roth@amd.com, mtosatti@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, hreitz@redhat.com, pbonzini@redhat.com,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'event-loop-backend' provides basic property handling for all
'AioContext' based event loops. So let's define a new 'MainLoopClass'
that inherits from it. This will permit tweaking the main loop's
properties through qapi as well as through the command line using the
'-object' keyword[1]. Only one instance of 'MainLoopClass' might be
created at any time.

'EventLoopBackendClass' learns a new callback, 'can_be_deleted()' so as
to mark 'MainLoop' as non-deletable.

Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>

[1] For example:
      -object main-loop,id=main-loop,poll-max-ns=<value>
---
 include/qemu/main-loop.h | 11 ++++++++++
 qapi/qom.json            | 10 ++++++----
 qga/meson.build          |  2 +-
 tests/unit/meson.build   | 10 +++++-----
 util/event-loop.c        | 13 ++++++++++++
 util/event-loop.h        |  1 +
 util/main-loop.c         | 43 ++++++++++++++++++++++++++++++++++++++++
 7 files changed, 80 insertions(+), 10 deletions(-)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index 8dbc6fcb89..fea5a3e9d4 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -26,9 +26,20 @@
 #define QEMU_MAIN_LOOP_H
 
 #include "block/aio.h"
+#include "qom/object.h"
+#include "util/event-loop.h"
 
 #define SIG_IPI SIGUSR1
 
+#define TYPE_MAIN_LOOP "main-loop"
+
+struct MainLoop {
+    EventLoopBackend parent_obj;
+};
+typedef struct MainLoop MainLoop;
+
+DECLARE_INSTANCE_CHECKER(MainLoop, MAIN_LOOP, TYPE_MAIN_LOOP)
+
 /**
  * qemu_init_main_loop: Set up the process so that it can run the main loop.
  *
diff --git a/qapi/qom.json b/qapi/qom.json
index eeb5395ff3..e7730ef62f 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -500,9 +500,9 @@
             '*grab-toggle': 'GrabToggleKeys' } }
 
 ##
-# @IothreadProperties:
+# @EventLoopBackendProperties:
 #
-# Properties for iothread objects.
+# Properties for iothread and main-loop objects.
 #
 # @poll-max-ns: the maximum number of nanoseconds to busy wait for events.
 #               0 means polling is disabled (default: 32768 on POSIX hosts,
@@ -522,7 +522,7 @@
 #
 # Since: 2.0
 ##
-{ 'struct': 'IothreadProperties',
+{ 'struct': 'EventLoopBackendProperties',
   'data': { '*poll-max-ns': 'int',
             '*poll-grow': 'int',
             '*poll-shrink': 'int',
@@ -818,6 +818,7 @@
     { 'name': 'input-linux',
       'if': 'CONFIG_LINUX' },
     'iothread',
+    'main-loop',
     { 'name': 'memory-backend-epc',
       'if': 'CONFIG_LINUX' },
     'memory-backend-file',
@@ -882,7 +883,8 @@
       'input-barrier':              'InputBarrierProperties',
       'input-linux':                { 'type': 'InputLinuxProperties',
                                       'if': 'CONFIG_LINUX' },
-      'iothread':                   'IothreadProperties',
+      'iothread':                   'EventLoopBackendProperties',
+      'main-loop':                  'EventLoopBackendProperties',
       'memory-backend-epc':         { 'type': 'MemoryBackendEpcProperties',
                                       'if': 'CONFIG_LINUX' },
       'memory-backend-file':        'MemoryBackendFileProperties',
diff --git a/qga/meson.build b/qga/meson.build
index 1ee9dca60b..3051473e04 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -52,7 +52,7 @@ qga_ss = qga_ss.apply(config_host, strict: false)
 
 qga = executable('qemu-ga', qga_ss.sources(),
                  link_args: config_host['LIBS_QGA'].split(),
-                 dependencies: [qemuutil, libudev],
+                 dependencies: [qemuutil, libudev, qom],
                  install: true)
 all_qga = [qga]
 
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 64a5e7bfde..7a1af584dd 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -51,7 +51,7 @@ tests = {
 
 if have_system or have_tools
   tests += {
-    'test-qmp-event': [testqapi],
+    'test-qmp-event': [testqapi, qom],
   }
 endif
 
@@ -120,17 +120,17 @@ endif
 if have_system
   tests += {
     'test-iov': [],
-    'test-qmp-cmds': [testqapi],
+    'test-qmp-cmds': [testqapi, qom],
     'test-xbzrle': [migration],
-    'test-timed-average': [],
-    'test-util-sockets': ['socket-helpers.c'],
+    'test-timed-average': [qom],
+    'test-util-sockets': ['socket-helpers.c', qom],
     'test-base64': [],
     'test-bufferiszero': [],
     'test-vmstate': [migration, io],
     'test-yank': ['socket-helpers.c', qom, io, chardev]
   }
   if config_host_data.get('CONFIG_INOTIFY1')
-    tests += {'test-util-filemonitor': []}
+    tests += {'test-util-filemonitor': [qom]}
   endif
 
   # Some tests: test-char, test-qdev-global-props, and test-qga,
diff --git a/util/event-loop.c b/util/event-loop.c
index f3e50909a0..c0ddd61f20 100644
--- a/util/event-loop.c
+++ b/util/event-loop.c
@@ -98,10 +98,23 @@ event_loop_backend_complete(UserCreatable *uc, Error **errp)
     }
 }
 
+static bool event_loop_backend_can_be_deleted(UserCreatable *uc)
+{
+    EventLoopBackendClass *bc = EVENT_LOOP_BACKEND_GET_CLASS(uc);
+    EventLoopBackend *backend = EVENT_LOOP_BACKEND(uc);
+
+    if (bc->can_be_deleted) {
+        return bc->can_be_deleted(backend);
+    }
+
+    return true;
+}
+
 static void event_loop_backend_class_init(ObjectClass *klass, void *class_data)
 {
     UserCreatableClass *ucc = USER_CREATABLE_CLASS(klass);
     ucc->complete = event_loop_backend_complete;
+    ucc->can_be_deleted = event_loop_backend_can_be_deleted;
 
     object_class_property_add(klass, "poll-max-ns", "int",
                               event_loop_backend_get_param,
diff --git a/util/event-loop.h b/util/event-loop.h
index 8883a0d086..34cf9309af 100644
--- a/util/event-loop.h
+++ b/util/event-loop.h
@@ -24,6 +24,7 @@ struct EventLoopBackendClass {
     ObjectClass parent_class;
 
     void (*init)(EventLoopBackend *backend, Error **errp);
+    bool (*can_be_deleted)(EventLoopBackend *backend);
 };
 
 struct EventLoopBackend {
diff --git a/util/main-loop.c b/util/main-loop.c
index 4d5a5b9943..395fd9bd3e 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -33,6 +33,7 @@
 #include "qemu/error-report.h"
 #include "qemu/queue.h"
 #include "qemu/compiler.h"
+#include "qom/object.h"
 
 #ifndef _WIN32
 #include <sys/wait.h>
@@ -184,6 +185,48 @@ int qemu_init_main_loop(Error **errp)
     return 0;
 }
 
+MainLoop *mloop;
+
+static void main_loop_init(EventLoopBackend *bc, Error **errp)
+{
+    MainLoop *m = MAIN_LOOP(bc);
+
+    if (mloop) {
+        error_setg(errp, "only one main-loop instance allowed");
+        return;
+    }
+
+    mloop = m;
+    return;
+}
+
+static bool main_loop_can_be_deleted(EventLoopBackend *bc)
+{
+    return false;
+}
+
+static void main_loop_class_init(ObjectClass *oc, void *class_data)
+{
+    EventLoopBackendClass *bc = EVENT_LOOP_BACKEND_CLASS(oc);
+
+    bc->init = main_loop_init;
+    bc->can_be_deleted = main_loop_can_be_deleted;
+}
+
+static const TypeInfo main_loop_info = {
+    .name = TYPE_MAIN_LOOP,
+    .parent = TYPE_EVENT_LOOP_BACKEND,
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


