Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC3465ACB3
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 02:10:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pC9JW-0005An-6i; Sun, 01 Jan 2023 20:08:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1pC9JU-0005AZ-9l
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 20:08:28 -0500
Received: from mail-pl1-f180.google.com ([209.85.214.180])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1pC9JS-0000We-Is
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 20:08:27 -0500
Received: by mail-pl1-f180.google.com with SMTP id 17so28167223pll.0
 for <qemu-devel@nongnu.org>; Sun, 01 Jan 2023 17:08:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IXAzYnsybSKtqz0ldd8h/jtRm84KA9pbk7CARh/8mEk=;
 b=m+/HEH6fVI6wG3uVoI2qgZH9VeQ2TTn0HjQFUGNbQA6X654CLUJO/8DJU3UhSqQUE9
 ERm+Qu8kBPHHtRetl3UN/O5KBbuz/ki2fVd0zrhsh1FTXcrq0nM82oXd6UtY6AQYGKSp
 W80QhNnxQFfsWnGvSiR5/NH44abUe1z9zJdvB5O2FRKh21i0DuINupt4vDdFSMVLXiu1
 1bj2Ay2bZ6q5QvQZjwA7n0mv/blYMxjr//MS4cHHDYoqGizLeg+QMVw176Sb2JAeHC9i
 HZ2bUV6we/jieYNjuGgcFFTBQxKGAsWFkniWXyXC4eVnWzx8+13EXWCiDc3qUdTUdP4Q
 jGBQ==
X-Gm-Message-State: AFqh2kpEG3ijGI/MhqlzBWJJXDkcdpr5a2+ODEJffz39ig7lWBYyZHlY
 cMT0VxKe0/dMYsxZaTFaVqU/82lL1gty0w==
X-Google-Smtp-Source: AMrXdXtef1lnanqWmfWazTWaKqRwOPN3GrMq76T81Snx8vwtLcjjLZ3jmjn0O0hpB8OfSSI2iqpqSA==
X-Received: by 2002:a17:903:32ce:b0:192:8d15:350 with SMTP id
 i14-20020a17090332ce00b001928d150350mr28335533plr.56.1672621704066; 
 Sun, 01 Jan 2023 17:08:24 -0800 (PST)
Received: from localhost.localdomain ([2601:642:4c02:19a7:6141:5cc4:4791:5601])
 by smtp.gmail.com with ESMTPSA id
 jd15-20020a170903260f00b00186b69157ecsm18719417plb.202.2023.01.01.17.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 17:08:23 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Cc: Joelle van Dyne <j@getutm.app>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] vmnet: stop recieving events when VM is stopped
Date: Sun,  1 Jan 2023 17:08:21 -0800
Message-Id: <20230102010821.5462-1-j@getutm.app>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.180; envelope-from=osy86dev@gmail.com;
 helo=mail-pl1-f180.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When the VM is stopped using the HMP command "stop", soon the handler will
stop reading from the vmnet interface. This causes a flood of
`VMNET_INTERFACE_PACKETS_AVAILABLE` events to arrive and puts the host CPU
at 100%. We fix this by removing the event handler from vmnet when the VM
is no longer in a running state and restore it when we return to a running
state.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 net/vmnet_int.h    |  2 ++
 net/vmnet-common.m | 48 +++++++++++++++++++++++++++++++++-------------
 2 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/net/vmnet_int.h b/net/vmnet_int.h
index adf6e8c20d..ffba92108f 100644
--- a/net/vmnet_int.h
+++ b/net/vmnet_int.h
@@ -46,6 +46,8 @@ typedef struct VmnetState {
     int packets_send_end_pos;
 
     struct iovec iov_buf[VMNET_PACKETS_LIMIT];
+
+    VMChangeStateEntry *change;
 } VmnetState;
 
 const char *vmnet_status_map_str(vmnet_return_t status);
diff --git a/net/vmnet-common.m b/net/vmnet-common.m
index 2cb60b9ddd..2958283485 100644
--- a/net/vmnet-common.m
+++ b/net/vmnet-common.m
@@ -17,6 +17,7 @@
 #include "clients.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
+#include "sysemu/runstate.h"
 
 #include <vmnet/vmnet.h>
 #include <dispatch/dispatch.h>
@@ -242,6 +243,35 @@ static void vmnet_bufs_init(VmnetState *s)
     }
 }
 
+/**
+ * Called on state change to un-register/re-register handlers
+ */
+static void vmnet_vm_state_change_cb(void *opaque, bool running, RunState state)
+{
+    VmnetState *s = opaque;
+
+    if (running) {
+        vmnet_interface_set_event_callback(
+            s->vmnet_if,
+            VMNET_INTERFACE_PACKETS_AVAILABLE,
+            s->if_queue,
+            ^(interface_event_t event_id, xpc_object_t event) {
+                assert(event_id == VMNET_INTERFACE_PACKETS_AVAILABLE);
+                /*
+                 * This function is being called from a non qemu thread, so
+                 * we only schedule a BH, and do the rest of the io completion
+                 * handling from vmnet_send_bh() which runs in a qemu context.
+                 */
+                qemu_bh_schedule(s->send_bh);
+            });
+    } else {
+        vmnet_interface_set_event_callback(
+            s->vmnet_if,
+            VMNET_INTERFACE_PACKETS_AVAILABLE,
+            NULL,
+            NULL);
+    }
+}
 
 int vmnet_if_create(NetClientState *nc,
                     xpc_object_t if_desc,
@@ -329,19 +359,9 @@ int vmnet_if_create(NetClientState *nc,
     s->packets_send_current_pos = 0;
     s->packets_send_end_pos = 0;
 
-    vmnet_interface_set_event_callback(
-        s->vmnet_if,
-        VMNET_INTERFACE_PACKETS_AVAILABLE,
-        s->if_queue,
-        ^(interface_event_t event_id, xpc_object_t event) {
-            assert(event_id == VMNET_INTERFACE_PACKETS_AVAILABLE);
-            /*
-             * This function is being called from a non qemu thread, so
-             * we only schedule a BH, and do the rest of the io completion
-             * handling from vmnet_send_bh() which runs in a qemu context.
-             */
-            qemu_bh_schedule(s->send_bh);
-        });
+    vmnet_vm_state_change_cb(s, 1, RUN_STATE_RUNNING);
+
+    s->change = qemu_add_vm_change_state_handler(vmnet_vm_state_change_cb, s);
 
     return 0;
 }
@@ -356,6 +376,8 @@ void vmnet_cleanup_common(NetClientState *nc)
         return;
     }
 
+    vmnet_vm_state_change_cb(s, 0, RUN_STATE_SHUTDOWN);
+    qemu_del_vm_change_state_handler(s->change);
     if_stopped_sem = dispatch_semaphore_create(0);
     vmnet_stop_interface(
         s->vmnet_if,
-- 
2.28.0


