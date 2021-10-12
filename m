Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7848D42A323
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:22:59 +0200 (CEST)
Received: from localhost ([::1]:46776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maFs2-00087U-DH
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1maFSS-0003Ax-V5
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:56:33 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:44574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1maFSP-0003xY-65
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:56:31 -0400
Received: by mail-lf1-x135.google.com with SMTP id y26so86830294lfa.11
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 03:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PrGCu710IIABYJFz1IMbvOBoMmjn1Fmj6xfk0JNLi54=;
 b=KreyB1/fPpyRK2WJWk1CtJOivyKsC+jgfGrWCpphZQPqKYdMKRzmGeHMHEMl1rShLG
 pbv0qo4N9XBvX8iSwllWymyCbdgPbgWAoCQ5xOdfC7pZM/yAM8TnnMiy/Kjw0y2ms+CW
 XABODh88JSqGU2jJq2fiWoWeZaD3/joQTqBspexzLCIvINXjU7JY8NSypsTgk0XeYmgk
 jp5niTAXYPy9Yc/oI7yBxLULuYg5uABMq0QJMlrg+PZtaQ57Qw9a8GSCunWCLZD7qmpR
 9ROj5iY1IUGVQwT4JRQ95/bwj5fZ21Fis6srwH+GgGh1l+owmgj5BwtbWTwrGY3AqfYu
 RwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PrGCu710IIABYJFz1IMbvOBoMmjn1Fmj6xfk0JNLi54=;
 b=NW9wYar4E2z8FAPTlmKDikqDVt56l0Nyg+inOZo6FwizgEzkpJS3fQ2ZJJSlX4UMXF
 F038RVP5tIqovCMUTWQjD99F8Vj+9XWl0PmIH714oLYUZqrXmLdq4cFFPnLyLuFsbacd
 y1wUnysAXbKwYkJI8KfdcX0mKR9J76yOecs2YEQyJNwueVcZBNLQCNkOA7Mmyw55POsf
 qbi+7zc9DRL7yDenBJNzj5o3kosq0khW9VKdFU8vV6audmNBTv+cCzbPoPR1i3NjIfVO
 Gt2Ipt/LCbA/BD5GoYGvhQ+1elVhch6WztK6HZAaaCQdZNszS66rDPBKfONmMFazY82N
 RKCQ==
X-Gm-Message-State: AOAM5314VKZaiFXf8keQuxrrIqLj2BqDoCR6rzFOoELjEPJMTdvvVnJQ
 CmrwVYTrCwouJo7rtIxQuSdP3fAdnt9CUCRs
X-Google-Smtp-Source: ABdhPJzNZSNgdY0e55y3uxTy3Veszg4NC8WNutWNlUO2CSyaJf3zGlF4aC5UKewXbNRzagI5D778NA==
X-Received: by 2002:a05:651c:1596:: with SMTP id
 h22mr28333325ljq.405.1634036187423; 
 Tue, 12 Oct 2021 03:56:27 -0700 (PDT)
Received: from localhost.localdomain ([77.234.205.3])
 by smtp.gmail.com with ESMTPSA id p16sm995361lfe.166.2021.10.12.03.56.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Oct 2021 03:56:26 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/6] net/vmnet: implement shared mode (vmnet-shared)
Date: Tue, 12 Oct 2021 13:55:55 +0300
Message-Id: <20211012105558.21530-4-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211012105558.21530-1-yaroshchuk2000@gmail.com>
References: <20211012105558.21530-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: jasowang@redhat.com, eblake@redhat.com, r.bolshakov@yadro.com,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Still not implemented:
- port forwarding
- ipv6 prefix setting

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 net/vmnet-common.m | 275 +++++++++++++++++++++++++++++++++++++++++++++
 net/vmnet-shared.c |  73 +++++++++++-
 net/vmnet_int.h    |  23 ++++
 3 files changed, 369 insertions(+), 2 deletions(-)

diff --git a/net/vmnet-common.m b/net/vmnet-common.m
index 532d152840..caaf3cfa6d 100644
--- a/net/vmnet-common.m
+++ b/net/vmnet-common.m
@@ -10,6 +10,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/main-loop.h"
 #include "qapi/qapi-types-net.h"
 #include "vmnet_int.h"
 #include "clients.h"
@@ -17,4 +18,278 @@
 #include "qapi/error.h"
 
 #include <vmnet/vmnet.h>
+#include <dispatch/dispatch.h>
 
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
index f8c4a4f3b8..e8d142c9b0 100644
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


