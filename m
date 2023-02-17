Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC6D69A543
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 06:45:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pStXU-0000cl-Nb; Fri, 17 Feb 2023 00:44:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pStXR-0000bl-FL
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 00:44:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pStXP-0001OX-SA
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 00:44:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676612643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JuAj2RerwCW16Em+2Oozz0Rt6lQtGEWwdHG10QBo1xI=;
 b=da54vqCG1CDQI3PmUuzCepqICfX3aXzS3H3XJCGukLcrDXP2BAWo1xHHw1NeJRBkISUDnN
 e1yiNNkHzbDuk5RxFmlt1pt9onym7PwDqUOZgRh2SQsFd2ADVK4fZqZZA2DqFZNQ5fYLMY
 eP52CvrT6LmB1FgcVcpmJdZWCT9+Hsc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-xxKGE2OlM1udcZY86bhX8A-1; Fri, 17 Feb 2023 00:44:01 -0500
X-MC-Unique: xxKGE2OlM1udcZY86bhX8A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC51685A588;
 Fri, 17 Feb 2023 05:44:00 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-47.pek2.redhat.com [10.72.12.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 893F9492B15;
 Fri, 17 Feb 2023 05:43:58 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, Joelle van Dyne <j@getutm.app>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL V3 7/9] vmnet: stop recieving events when VM is stopped
Date: Fri, 17 Feb 2023 13:43:33 +0800
Message-Id: <20230217054335.57595-8-jasowang@redhat.com>
In-Reply-To: <20230217054335.57595-1-jasowang@redhat.com>
References: <20230217054335.57595-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Joelle van Dyne <j@getutm.app>

When the VM is stopped using the HMP command "stop", soon the handler will
stop reading from the vmnet interface. This causes a flood of
`VMNET_INTERFACE_PACKETS_AVAILABLE` events to arrive and puts the host CPU
at 100%. We fix this by removing the event handler from vmnet when the VM
is no longer in a running state and restore it when we return to a running
state.

Signed-off-by: Joelle van Dyne <j@getutm.app>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/vmnet-common.m | 48 +++++++++++++++++++++++++++++++++++-------------
 net/vmnet_int.h    |  2 ++
 2 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/net/vmnet-common.m b/net/vmnet-common.m
index 2cb60b9..2958283 100644
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
diff --git a/net/vmnet_int.h b/net/vmnet_int.h
index d0b9059..a8a033d 100644
--- a/net/vmnet_int.h
+++ b/net/vmnet_int.h
@@ -45,6 +45,8 @@ typedef struct VmnetState {
     int packets_send_end_pos;
 
     struct iovec iov_buf[VMNET_PACKETS_LIMIT];
+
+    VMChangeStateEntry *change;
 } VmnetState;
 
 const char *vmnet_status_map_str(vmnet_return_t status);
-- 
2.7.4


