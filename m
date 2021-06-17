Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2018B3AB610
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 16:36:14 +0200 (CEST)
Received: from localhost ([::1]:43952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltt7t-0006yb-3y
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 10:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1ltt5U-0004CS-VE
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 10:33:46 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:46006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1ltt5O-0001Mq-FZ
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 10:33:44 -0400
Received: by mail-lf1-x130.google.com with SMTP id a1so10678037lfr.12
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 07:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AsirMuvXQZR2XXuh1voANfL7ODQci6QThA/Q5ruNU1o=;
 b=KFxnJFLubIgqyC8Lw2eNOvnXraf+NEmtXj+ZzJIIsA1SNno9Pa9PYV6IlEhnHd1BEx
 LbOy2KGcJL8JGWCBbOgr+poeYk6EMZT9g6VhDMvf/Q/ouO8fMlSX1XaQDAjiZG2phP6g
 ig3MHGjvCCFI3tCiKwI++IuhXtKDoXVGYO2zcIj2UiGsg+RPe0yHuHpk74FLvrdYKjvJ
 VQuyiVnxcIg9IchPnbXf7K8aY/rMRsv9exXrjCKTv0pcikKItGhNqpHGoNE6XHNUTky/
 1C6iAj8Juszq6Ax1tpnr+QPi8fmQgFWXM/vNkT7PD6N6LJh9gZbgyBIfGLEYqdP8jrsS
 yYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AsirMuvXQZR2XXuh1voANfL7ODQci6QThA/Q5ruNU1o=;
 b=fl384rys4PieW13016LKvURTj+nQ3zXGeFKj+Tlk4AxHGLvx13NdYknJjI/dZQ68v0
 sDMyEx5rt6WPg2znJsmuyxS50sga01+P9i5MRazIp+Eo3bRdwXGeDP4J7LXTfuYJjOQj
 k89HyebvfkHpcuy8sPwdbWl/i1UBDm5mCpwaJS3hqNse3X7W6Q/a94BlRYYd6tw0kRJg
 8KOmeLx+XKn4Ngm4GoJhenRI0FRdciAmu/mnqOnZNqFYwikCzzLN3rI39OsFWXaaUWNs
 JstxyzuPgbGiDf46HPff0j30787Jj0SxvVTi4rrzO+s1V2It/AsqmXG2H33Fre46wjAn
 ZXgA==
X-Gm-Message-State: AOAM533ryFWo3MZy/VknhFMOvGHPzOtxDMYbIMmB4Vrhe15yX2uZ6Sz/
 SnwCLetEY2m5uVqx3rEg1mF/9Cjl3qdelqcQ
X-Google-Smtp-Source: ABdhPJzc41+Fisvjm2jOVYukdzc/5NmDo0gBVpznSGPTgd75ZnB/owgoemPp2ixvP/OmNGkLqp+5PQ==
X-Received: by 2002:a19:c4b:: with SMTP id 72mr4268693lfm.15.1623940416771;
 Thu, 17 Jun 2021 07:33:36 -0700 (PDT)
Received: from localhost.localdomain ([5.18.249.207])
 by smtp.gmail.com with ESMTPSA id d9sm597406lfv.47.2021.06.17.07.33.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Jun 2021 07:33:36 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] net/vmnet: implement shared mode (vmnet-shared)
Date: Thu, 17 Jun 2021 17:32:43 +0300
Message-Id: <20210617143246.55336-5-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210617143246.55336-1-yaroshchuk2000@gmail.com>
References: <20210617143246.55336-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x130.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: jasowang@redhat.com, r.bolshakov@yadro.com,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Still not implemented:
- port forwarding
- ipv6 prefix setting

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 net/meson.build    |   2 +-
 net/vmnet-common.c |  20 ---
 net/vmnet-common.m | 294 +++++++++++++++++++++++++++++++++++++++++++++
 net/vmnet-shared.c |  73 ++++++++++-
 net/vmnet_int.h    |  23 ++++
 5 files changed, 389 insertions(+), 23 deletions(-)
 delete mode 100644 net/vmnet-common.c
 create mode 100644 net/vmnet-common.m

diff --git a/net/meson.build b/net/meson.build
index 82eed63c8f..1df498ad99 100644
--- a/net/meson.build
+++ b/net/meson.build
@@ -39,7 +39,7 @@ softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('tap-win32.c'))
 softmmu_ss.add(when: 'CONFIG_VHOST_NET_VDPA', if_true: files('vhost-vdpa.c'))
 
 vmnet_files = files(
-  'vmnet-common.c',
+  'vmnet-common.m',
   'vmnet-bridged.c',
   'vmnet-host.c',
   'vmnet-shared.c'
diff --git a/net/vmnet-common.c b/net/vmnet-common.c
deleted file mode 100644
index 8ba31dc7b2..0000000000
--- a/net/vmnet-common.c
+++ /dev/null
@@ -1,20 +0,0 @@
-/*
- * vmnet.c - network client wrapper for Apple vmnet.framework
- *
- * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
- * Copyright(c) 2021 Phillip Tennen <phillip@axleos.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-
-#include "qemu/osdep.h"
-#include "qapi-types-net.h"
-#include "vmnet_int.h"
-#include "clients.h"
-#include "qemu/error-report.h"
-#include "qapi/error.h"
-
-#include <vmnet/vmnet.h>
-
diff --git a/net/vmnet-common.m b/net/vmnet-common.m
new file mode 100644
index 0000000000..c6e7df99e0
--- /dev/null
+++ b/net/vmnet-common.m
@@ -0,0 +1,294 @@
+/*
+ * vmnet.c - network backend based on vmnet.framework
+ *
+ * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/main-loop.h"
+#include "qapi-types-net.h"
+#include "vmnet_int.h"
+#include "clients.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+
+#include <vmnet/vmnet.h>
+#include <dispatch/dispatch.h>
+
+typedef struct vmpktdesc vmpktdesc_t;
+typedef struct iovec iovec_t;
+
+static void vmnet_set_send_enabled(VmnetCommonState *s, bool enable)
+{
+    s->send_enabled = enable;
+}
+
+
+static void vmnet_send_completed(NetClientState *nc, ssize_t len)
+{
+    VmnetCommonState *s = DO_UPCAST(VmnetCommonState, nc, nc);
+    vmnet_set_send_enabled(s, true);
+}
+
+
+static void vmnet_send(NetClientState *nc,
+                       interface_event_t event_id,
+                       xpc_object_t event)
+{
+    assert(event_id == VMNET_INTERFACE_PACKETS_AVAILABLE);
+
+    VmnetCommonState *s;
+    uint64_t packets_available;
+
+    struct iovec *iov;
+    struct vmpktdesc *packets;
+    int pkt_cnt;
+    int i;
+
+    vmnet_return_t if_status;
+    ssize_t size;
+
+    s = DO_UPCAST(VmnetCommonState, nc, nc);
+
+    packets_available = xpc_dictionary_get_uint64(
+        event,
+        vmnet_estimated_packets_available_key
+    );
+
+    pkt_cnt = (packets_available < VMNET_PACKETS_LIMIT) ?
+              packets_available :
+              VMNET_PACKETS_LIMIT;
+
+
+    iov = s->iov_buf;
+    packets = s->packets_buf;
+
+    for (i = 0; i < pkt_cnt; ++i) {
+        packets[i].vm_pkt_size = s->max_packet_size;
+        packets[i].vm_pkt_iovcnt = 1;
+        packets[i].vm_flags = 0;
+    }
+
+    if_status = vmnet_read(s->vmnet_if, packets, &pkt_cnt);
+    if (if_status != VMNET_SUCCESS) {
+        error_printf("vmnet: read failed: %s\n",
+                     vmnet_status_map_str(if_status));
+    }
+    qemu_mutex_lock_iothread();
+    for (i = 0; i < pkt_cnt; ++i) {
+        size = qemu_send_packet_async(nc,
+                                      iov[i].iov_base,
+                                      packets[i].vm_pkt_size,
+                                      vmnet_send_completed);
+        if (size == 0) {
+            vmnet_set_send_enabled(s, false);
+        } else if (size < 0) {
+            break;
+        }
+    }
+    qemu_mutex_unlock_iothread();
+
+}
+
+
+static void vmnet_register_event_callback(VmnetCommonState *s)
+{
+    dispatch_queue_t avail_pkt_q = dispatch_queue_create(
+        "org.qemu.vmnet.if_queue",
+        DISPATCH_QUEUE_SERIAL
+    );
+
+    vmnet_interface_set_event_callback(
+        s->vmnet_if,
+        VMNET_INTERFACE_PACKETS_AVAILABLE,
+        avail_pkt_q,
+        ^(interface_event_t event_id, xpc_object_t event) {
+          if (s->send_enabled) {
+              vmnet_send(&s->nc, event_id, event);
+          }
+        });
+}
+
+
+static void vmnet_bufs_init(VmnetCommonState *s)
+{
+    int i;
+    struct vmpktdesc *packets;
+    struct iovec *iov;
+
+    packets = s->packets_buf;
+    iov = s->iov_buf;
+
+    for (i = 0; i < VMNET_PACKETS_LIMIT; ++i) {
+        iov[i].iov_len = s->max_packet_size;
+        iov[i].iov_base = g_malloc0(iov[i].iov_len);
+        packets[i].vm_pkt_iov = iov + i;
+    }
+}
+
+
+const char *vmnet_status_map_str(vmnet_return_t status)
+{
+    switch (status) {
+    case VMNET_SUCCESS:
+        return "success";
+    case VMNET_FAILURE:
+        return "general failure";
+    case VMNET_MEM_FAILURE:
+        return "memory allocation failure";
+    case VMNET_INVALID_ARGUMENT:
+        return "invalid argument specified";
+    case VMNET_SETUP_INCOMPLETE:
+        return "interface setup is not complete";
+    case VMNET_INVALID_ACCESS:
+        return "invalid access, permission denied";
+    case VMNET_PACKET_TOO_BIG:
+        return "packet size is larger than MTU";
+    case VMNET_BUFFER_EXHAUSTED:
+        return "buffers exhausted in kernel";
+    case VMNET_TOO_MANY_PACKETS:
+        return "packet count exceeds limit";
+    default:
+        return "unknown vmnet error";
+    }
+}
+
+
+int vmnet_if_create(NetClientState *nc,
+                    xpc_object_t if_desc,
+                    Error **errp,
+                    void (*completion_callback)(xpc_object_t interface_param))
+{
+    VmnetCommonState *s;
+
+    dispatch_queue_t if_create_q;
+    dispatch_semaphore_t if_created_sem;
+
+    __block vmnet_return_t if_status;
+
+    if_create_q = dispatch_queue_create("org.qemu.vmnet.create",
+                                        DISPATCH_QUEUE_SERIAL);
+    if_created_sem = dispatch_semaphore_create(0);
+
+    s = DO_UPCAST(VmnetCommonState, nc, nc);
+    s->vmnet_if = vmnet_start_interface(
+        if_desc,
+        if_create_q,
+        ^(vmnet_return_t status, xpc_object_t interface_param) {
+          if_status = status;
+          if (status != VMNET_SUCCESS || !interface_param) {
+              dispatch_semaphore_signal(if_created_sem);
+              return;
+          }
+
+          s->mtu = xpc_dictionary_get_uint64(
+              interface_param,
+              vmnet_mtu_key);
+          s->max_packet_size = xpc_dictionary_get_uint64(
+              interface_param,
+              vmnet_max_packet_size_key);
+
+          if (completion_callback) {
+              completion_callback(interface_param);
+          }
+          dispatch_semaphore_signal(if_created_sem);
+        });
+
+    if (s->vmnet_if == NULL) {
+        error_setg(errp, "unable to create interface with requested params");
+        return -1;
+    }
+
+    dispatch_semaphore_wait(if_created_sem, DISPATCH_TIME_FOREVER);
+    dispatch_release(if_create_q);
+
+    if (if_status != VMNET_SUCCESS) {
+        error_setg(errp,
+                   "interface creation error: %s",
+                   vmnet_status_map_str(if_status));
+        return -1;
+    }
+
+    vmnet_register_event_callback(s);
+    vmnet_bufs_init(s);
+    vmnet_set_send_enabled(s, true);
+
+    return 0;
+}
+
+
+ssize_t vmnet_receive_common(NetClientState *nc,
+                             const uint8_t *buf,
+                             size_t size)
+{
+    VmnetCommonState *s;
+    vmpktdesc_t packet;
+    iovec_t iov;
+    int pkt_cnt;
+    vmnet_return_t if_status;
+
+    s = DO_UPCAST(VmnetCommonState, nc, nc);
+
+    if (size > s->max_packet_size) {
+        warn_report("vmnet: packet is too big, %zu > %llu\n",
+                    packet.vm_pkt_size,
+                    s->max_packet_size);
+        return -1;
+    }
+
+    iov.iov_base = (char *) buf;
+    iov.iov_len = size;
+
+    packet.vm_pkt_iovcnt = 1;
+    packet.vm_flags = 0;
+    packet.vm_pkt_size = size;
+    packet.vm_pkt_iov = &iov;
+
+    pkt_cnt = 1;
+    if_status = vmnet_write(s->vmnet_if, &packet, &pkt_cnt);
+
+    if (if_status != VMNET_SUCCESS) {
+        error_report("vmnet: write error: %s\n",
+                     vmnet_status_map_str(if_status));
+    }
+
+    if (if_status == VMNET_SUCCESS && pkt_cnt) {
+        return size;
+    }
+    return 0;
+}
+
+
+void vmnet_cleanup_common(NetClientState *nc)
+{
+    VmnetCommonState *s;
+    dispatch_queue_t if_destroy_q;
+
+    s = DO_UPCAST(VmnetCommonState, nc, nc);
+
+    qemu_purge_queued_packets(nc);
+    vmnet_set_send_enabled(s, false);
+
+    if (s->vmnet_if == NULL) {
+        return;
+    }
+
+    if_destroy_q = dispatch_queue_create(
+        "org.qemu.vmnet.destroy",
+        DISPATCH_QUEUE_SERIAL
+    );
+
+    vmnet_stop_interface(
+        s->vmnet_if,
+        if_destroy_q,
+        ^(vmnet_return_t status) {
+        });
+
+    for (int i = 0; i < VMNET_PACKETS_LIMIT; ++i) {
+        g_free(s->iov_buf[i].iov_base);
+    }
+}
diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c
index 177b5a48ec..a9db0ad52b 100644
--- a/net/vmnet-shared.c
+++ b/net/vmnet-shared.c
@@ -17,9 +17,78 @@
 
 #include <vmnet/vmnet.h>
 
+typedef struct VmnetSharedState {
+  VmnetCommonState common;
+
+} VmnetSharedState;
+
+static xpc_object_t create_if_desc(const Netdev *netdev, Error **errp);
+
+static NetClientInfo net_vmnet_shared_info = {
+    .type = NET_CLIENT_DRIVER_VMNET_SHARED,
+    .size = sizeof(VmnetSharedState),
+    .receive = vmnet_receive_common,
+    .cleanup = vmnet_cleanup_common,
+};
+
 int net_init_vmnet_shared(const Netdev *netdev, const char *name,
                           NetClientState *peer, Error **errp)
 {
-  error_setg(errp, "vmnet-shared is not implemented yet");
-  return -1;
+    NetClientState *nc;
+    xpc_object_t if_desc;
+
+    nc = qemu_new_net_client(&net_vmnet_shared_info,
+                             peer, "vmnet-shared", name);
+    if_desc = create_if_desc(netdev, errp);
+    return vmnet_if_create(nc, if_desc, errp, NULL);
+}
+
+static xpc_object_t create_if_desc(const Netdev *netdev, Error **errp)
+{
+    const NetdevVmnetSharedOptions *options;
+    xpc_object_t if_desc;
+
+    if_desc = xpc_dictionary_create(NULL, NULL, 0);
+    xpc_dictionary_set_uint64(
+        if_desc,
+        vmnet_operation_mode_key,
+        VMNET_SHARED_MODE
+    );
+
+    xpc_dictionary_set_bool(
+        if_desc,
+        vmnet_allocate_mac_address_key,
+        false
+    );
+
+    options = &(netdev->u.vmnet_shared);
+
+    if (options->has_dhcpstart ||
+        options->has_dhcpend ||
+        options->has_subnetmask) {
+
+        if (options->has_dhcpstart &&
+            options->has_dhcpend &&
+            options->has_subnetmask) {
+
+            xpc_dictionary_set_string(if_desc,
+                                      vmnet_start_address_key,
+                                      options->dhcpstart);
+            xpc_dictionary_set_string(if_desc,
+                                      vmnet_end_address_key,
+                                      options->dhcpend);
+            xpc_dictionary_set_string(if_desc,
+                                      vmnet_subnet_mask_key,
+                                      options->subnetmask);
+        } else {
+            error_setg(
+                errp,
+                "'dhcpstart', 'dhcpend', 'subnetmask' "
+                "must be provided together"
+            );
+        }
+    }
+
+    return if_desc;
 }
+
diff --git a/net/vmnet_int.h b/net/vmnet_int.h
index c5982259a4..3979fe4678 100644
--- a/net/vmnet_int.h
+++ b/net/vmnet_int.h
@@ -16,10 +16,33 @@
 
 #include <vmnet/vmnet.h>
 
+#define VMNET_PACKETS_LIMIT 50
+
 typedef struct VmnetCommonState {
   NetClientState nc;
+  interface_ref vmnet_if;
+
+  bool send_enabled;
+
+  uint64_t mtu;
+  uint64_t max_packet_size;
+
+  struct vmpktdesc packets_buf[VMNET_PACKETS_LIMIT];
+  struct iovec iov_buf[VMNET_PACKETS_LIMIT];
 
 } VmnetCommonState;
 
+const char *vmnet_status_map_str(vmnet_return_t status);
+
+int vmnet_if_create(NetClientState *nc,
+                    xpc_object_t if_desc,
+                    Error **errp,
+                    void (*completion_callback)(xpc_object_t interface_param));
+
+ssize_t vmnet_receive_common(NetClientState *nc,
+                             const uint8_t *buf,
+                             size_t size);
+
+void vmnet_cleanup_common(NetClientState *nc);
 
 #endif /* VMNET_INT_H */
-- 
2.23.0


