Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4321246B8CD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 11:23:51 +0100 (CET)
Received: from localhost ([::1]:50338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muXdW-0001AA-B1
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 05:23:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1muXYl-0001kL-HZ
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:18:55 -0500
Received: from [2a00:1450:4864:20::233] (port=45690
 helo=mail-lj1-x233.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1muXYj-0007D1-6i
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:18:55 -0500
Received: by mail-lj1-x233.google.com with SMTP id j18so26409345ljc.12
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 02:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UooPoY0MVV/Y1dF1WCBxe5LUUmT/aqG+eGQmvWF3yb0=;
 b=KKMo4uF9WVPv9U943nfRIOa+defHbVL+KOmtqNBH5p/QzRiCTZZCzybUHvpJovmPJF
 zLKm4Xx33bw6f09bcNq9gwSpGcLJocic3Z6qUhuIC8/Lyyy45U4x88bOvejk0yyZr7I4
 2MQXor0pMmdBQGBuY/0gV0Npb1awBajK7JYqSSaxl5+k8H+f1DAyu1bfkzH0G0xSJ/1C
 l1TUX59C7v5EfHwvTH3MQdvuZAMVgcUvO34YLbCr97v/0DsDK1BImCAKwLfrtKAeVo1W
 7S4jiO0aWGZW7S61+Ly3hL1yB4Zftu14BbuJ+16mqb1K6YS2D4Ny8lYjMfZG0UlSkiN8
 akig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UooPoY0MVV/Y1dF1WCBxe5LUUmT/aqG+eGQmvWF3yb0=;
 b=UspJc1ooocYO2YWxNik/WVqN4EOUuHVYwgdRrO50XoR8vzVVKz9sTMj2gxGiis1z8O
 8d6UAmP6EmyLRku5von3fr9lSq7umslr6avToDPSVw76+hIKnyb01SLlnmx7lQwgXLMO
 9KjjWmyR01rRwBH9mO2akVTTVqWOesZy14enA0CgsMcq7achQp4eTE//yN+BW07uWxlI
 zE2hjFhG2mc1JuT2BVVKH/NlW/5RsLsCuD4H+P9QhatEUHJ38aCih4/8sifDr5GMUE8i
 f2IQKH7k5FsDg031EOx6vej0nQ95Aw44+kGfHDam6LzTF2EfgoNx3LdOPbSnaS9+/Mfb
 BAiQ==
X-Gm-Message-State: AOAM5317IKUmtKejbldbQy/ISLTL8Mxfb14/7h0Z2i3rqTUsy1hRKoz5
 y0fowWNlgixVxAPYZRhiqPm6V8XO2jXquw==
X-Google-Smtp-Source: ABdhPJwGvvK8nA39UitZ0OAxEEJ/n/aNauI2XQPA6YF+IliauqXlkB6/jx3I46LwAvlBXrkgk/0iVg==
X-Received: by 2002:a2e:8350:: with SMTP id l16mr39871361ljh.428.1638872331313; 
 Tue, 07 Dec 2021 02:18:51 -0800 (PST)
Received: from UNIT-808.labs.intellij.net ([91.132.204.19])
 by smtp.gmail.com with ESMTPSA id w10sm1629022lfn.308.2021.12.07.02.18.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Dec 2021 02:18:50 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 3/7] net/vmnet: implement shared mode (vmnet-shared)
Date: Tue,  7 Dec 2021 13:18:24 +0300
Message-Id: <20211207101828.22033-4-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211207101828.22033-1-yaroshchuk2000@gmail.com>
References: <20211207101828.22033-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::233
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lj1-x233.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, jasowang@redhat.com,
 phillip.ennen@gmail.com, armbru@redhat.com, r.bolshakov@yadro.com,
 phillip@axleos.com, akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 net/vmnet-common.m | 310 +++++++++++++++++++++++++++++++++++++++++++++
 net/vmnet-shared.c |  75 ++++++++++-
 net/vmnet_int.h    |  23 ++++
 3 files changed, 404 insertions(+), 4 deletions(-)

diff --git a/net/vmnet-common.m b/net/vmnet-common.m
index 532d152840..6d474af4be 100644
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
@@ -17,4 +19,312 @@
 #include "qapi/error.h"
 
 #include <vmnet/vmnet.h>
+#include <dispatch/dispatch.h>
 
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
+    case VMNET_SHARING_SERVICE_BUSY:
+        return "conflict, sharing service is in use";
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
index f8c4a4f3b8..08f7004427 100644
--- a/net/vmnet-shared.c
+++ b/net/vmnet-shared.c
@@ -10,16 +10,83 @@
 
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
+    xpc_dictionary_set_bool(
+        if_desc,
+        vmnet_enable_isolation_key,
+        options->isolated
+    );
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
+                "'start-address', 'end-address', 'subnet_mask' "
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


