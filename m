Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B203B48E3BC
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 06:26:35 +0100 (CET)
Received: from localhost ([::1]:51344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8F6g-0005gV-Qe
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 00:26:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8Eqn-0006SM-NI
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 00:10:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8Eqk-0001br-4n
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 00:10:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642137005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7saLi4T+ZtOa7i+ZXzf825eMCE+KLaZL0yKFtOjKlBc=;
 b=eUrkGYapnhihhJV7FTKygwBo6kJczypzyDp//bU53OjAVS205LiNMahJ7RZxMTAlEYwoaW
 mVFgJneC9ACSdo2pA5ZfA1y+hsDwpWvVEgQko+Klf4KpkbqsiY/wT2y18Fj547iHVo4EbH
 vgsDplPIcaUF13LwB1h83vS1DrWnrr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-rMxeEqlGN7WYFIZGcl2PFg-1; Fri, 14 Jan 2022 00:10:04 -0500
X-MC-Unique: rMxeEqlGN7WYFIZGcl2PFg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF96E81EE63;
 Fri, 14 Jan 2022 05:10:02 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-172.pek2.redhat.com
 [10.72.13.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0A84108A9;
 Fri, 14 Jan 2022 05:10:00 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL V3 09/13] net/vmnet: implement shared mode (vmnet-shared)
Date: Fri, 14 Jan 2022 13:09:05 +0800
Message-Id: <20220114050909.27133-10-jasowang@redhat.com>
In-Reply-To: <20220114050909.27133-1-jasowang@redhat.com>
References: <20220114050909.27133-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>,
 Phillip Tennen <phillip@axleos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>

Interaction with vmnet.framework in different modes
differs only on configuration stage, so we can create
common `send`, `receive`, etc. procedures and reuse them.

vmnet.framework supports iov, but writing more than
one iov into vmnet interface fails with
'VMNET_INVALID_ARGUMENT'. Collecting provided iovs into
one and passing it to vmnet works fine. That's the
reason why receive_iov() left unimplemented. But it still
works with good enough performance having .receive()
implemented only.

Also, there is no way to unsubscribe from vmnet packages
receiving except registering and unregistering event
callback or simply drop packages just ignoring and
not processing them when related flag is set. Here we do
using the second way.

Signed-off-by: Phillip Tennen <phillip@axleos.com>
Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/vmnet-common.m | 314 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 net/vmnet-shared.c |  83 +++++++++++++-
 net/vmnet_int.h    |  23 ++++
 3 files changed, 416 insertions(+), 4 deletions(-)

diff --git a/net/vmnet-common.m b/net/vmnet-common.m
index f949eb6..e780985 100644
--- a/net/vmnet-common.m
+++ b/net/vmnet-common.m
@@ -10,6 +10,8 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/main-loop.h"
+#include "qemu/log.h"
 #include "qapi/qapi-types-net.h"
 #include "vmnet_int.h"
 #include "clients.h"
@@ -17,3 +19,315 @@
 #include "qapi/error.h"
 
 #include <vmnet/vmnet.h>
+#include <dispatch/dispatch.h>
+
+#ifdef DEBUG
+#define D(x) x
+#define D_LOG(...) qemu_log(__VA_ARGS__)
+#else
+#define D(x) do { } while (0)
+#define D_LOG(...) do { } while (0)
+#endif
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
+#if defined(MAC_OS_VERSION_11_0) && \
+    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
+    case VMNET_SHARING_SERVICE_BUSY:
+        return "conflict, sharing service is in use";
+#endif
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
+    xpc_dictionary_set_bool(
+        if_desc,
+        vmnet_allocate_mac_address_key,
+        false
+    );
+
+    D(D_LOG("vmnet.start.interface_desc:\n");
+    xpc_dictionary_apply(if_desc,
+                         ^bool(const char *k, xpc_object_t v) {
+                           char *desc = xpc_copy_description(v);
+                           D_LOG("  %s=%s\n", k, desc);
+                           free(desc);
+                           return true;
+                         }));
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
+          D(D_LOG("vmnet.start.interface_param:\n");
+                xpc_dictionary_apply(interface_param,
+                                     ^bool(const char *k, xpc_object_t v) {
+                                       char *desc = xpc_copy_description(v);
+                                       D_LOG("  %s=%s\n", k, desc);
+                                       free(desc);
+                                       return true;
+                                     }));
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
+                   "cannot create vmnet interface: %s",
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
index f8c4a4f..61f3e92 100644
--- a/net/vmnet-shared.c
+++ b/net/vmnet-shared.c
@@ -10,16 +10,91 @@
 
 #include "qemu/osdep.h"
 #include "qapi/qapi-types-net.h"
+#include "qapi/error.h"
 #include "vmnet_int.h"
 #include "clients.h"
-#include "qemu/error-report.h"
-#include "qapi/error.h"
 
 #include <vmnet/vmnet.h>
 
+typedef struct VmnetSharedState {
+  VmnetCommonState cs;
+} VmnetSharedState;
+
+
+static xpc_object_t create_if_desc(const Netdev *netdev, Error **errp)
+{
+    const NetdevVmnetSharedOptions *options = &(netdev->u.vmnet_shared);
+    xpc_object_t if_desc = xpc_dictionary_create(NULL, NULL, 0);
+
+    xpc_dictionary_set_uint64(
+        if_desc,
+        vmnet_operation_mode_key,
+        VMNET_SHARED_MODE
+    );
+
+#if defined(MAC_OS_VERSION_11_0) && \
+    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
+    xpc_dictionary_set_bool(
+        if_desc,
+        vmnet_enable_isolation_key,
+        options->isolated
+    );
+#else
+    if (options->has_isolated) {
+        error_setg(errp,
+                   "vmnet-shared.isolated feature is "
+                   "unavailable: outdated vmnet.framework API");
+    }
+#endif
+
+    if (options->has_nat66_prefix) {
+        xpc_dictionary_set_string(if_desc,
+                                  vmnet_nat66_prefix_key,
+                                  options->nat66_prefix);
+    }
+
+    if (options->has_start_address ||
+        options->has_end_address ||
+        options->has_subnet_mask) {
+
+        if (options->has_start_address &&
+            options->has_end_address &&
+            options->has_subnet_mask) {
+
+            xpc_dictionary_set_string(if_desc,
+                                      vmnet_start_address_key,
+                                      options->start_address);
+            xpc_dictionary_set_string(if_desc,
+                                      vmnet_end_address_key,
+                                      options->end_address);
+            xpc_dictionary_set_string(if_desc,
+                                      vmnet_subnet_mask_key,
+                                      options->subnet_mask);
+        } else {
+            error_setg(
+                errp,
+                "'start-address', 'end-address', 'subnet-mask' "
+                "should be provided together"
+            );
+        }
+    }
+
+    return if_desc;
+}
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
+    NetClientState *nc = qemu_new_net_client(&net_vmnet_shared_info,
+                                             peer, "vmnet-shared", name);
+    xpc_object_t if_desc = create_if_desc(netdev, errp);
+
+    return vmnet_if_create(nc, if_desc, errp, NULL);
 }
diff --git a/net/vmnet_int.h b/net/vmnet_int.h
index c598225..3979fe4 100644
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
2.7.4


