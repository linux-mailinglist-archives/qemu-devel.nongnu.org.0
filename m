Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FA64DA406
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 21:31:02 +0100 (CET)
Received: from localhost ([::1]:47742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUDor-0000mk-Dt
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 16:31:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUDmR-0006TK-Ou
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 16:28:31 -0400
Received: from [2a00:1450:4864:20::431] (port=33757
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUDmP-00066J-DM
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 16:28:31 -0400
Received: by mail-wr1-x431.google.com with SMTP id j17so269163wrc.0
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 13:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ixr5uSDJ00PPxw4NqTeX5qcyZkZNGVBvOxgSrLRglTw=;
 b=Nt1fCC3ZLSzuOCekCV1U0cui5cXwsz+fDLHc399ThhS8iiVztTRqUMz0ptcWP4v4Qn
 d0uEg3JqnKdyzaNLsAUTfpMHppL9o/SbZoqkHfb0ilF5YYBNP9tS1X87wUOWlBjjNT/F
 WBJe1M2ejqHsCn7iUP+bHq6+FKVN5w4Ht+9x4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ixr5uSDJ00PPxw4NqTeX5qcyZkZNGVBvOxgSrLRglTw=;
 b=moHTBUY4ZsV8h4HDI5dZvwi/FTLBMvgeC+h6QqojaB6BPejLn5iYrF9Nyx9VMNSgef
 F9adcK/Vobvl1BgxU5mdfSSL9mNDkbbyEaZNUAOQzBWkb2M2ZauWULFy7QdaUxTQjCHN
 JLcq3yIs7R8MAMvQqS6vzwPuLkMsqRD2B4YXYxjVc4Qck2kayK8niJ9KzX/7zytvo/M0
 9trLc/QG7NK/M7ru+hf6B8Nz08ot7Ltxs3xjf8o2LaZMYaswg/qa8Xg001UXRQbhDSSC
 T9urjNL56wnHO0/i9QgoIFlBjgGLZKy00aSktNo9LlWIheZx/pHJsLQ72N6ilr4ysL4h
 9MLA==
X-Gm-Message-State: AOAM530d8SK1Hjq8rTOKR1Mhi1VdKmIAG2evi/sXjSp1+6cwVnmqrGE8
 000m5SPGiGClTklQY6WZlKUCU0zG5BQtgiLx
X-Google-Smtp-Source: ABdhPJx/CpvAvBCGZJhAtOqm6wcIFFNk5fsNLLSQmErjm+xnOvsfXZPlgGF55PP2lJQ5pNxZ8PF97Q==
X-Received: by 2002:a05:6000:188f:b0:1f1:e5da:b116 with SMTP id
 a15-20020a056000188f00b001f1e5dab116mr22395247wri.467.1647376107684; 
 Tue, 15 Mar 2022 13:28:27 -0700 (PDT)
Received: from localhost.localdomain
 (ec2-3-121-162-165.eu-central-1.compute.amazonaws.com. [3.121.162.165])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a056000178a00b0020393321552sm13378166wrg.85.2022.03.15.13.28.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Mar 2022 13:28:27 -0700 (PDT)
From: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
X-Google-Original-From: Vladislav Yaroshchuk
 <Vladislav.Yaroshchuk@jetbrains.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, r.bolshakov@yadro.com, eblake@redhat.com,
 phillip.ennen@gmail.com, phillip@axleos.com, akihiko.odaki@gmail.com,
 armbru@redhat.com, hsp.cat7@gmail.com, hello@adns.io, roman@roolebo.dev,
 peter.maydell@linaro.org, dirty@apple.com, f4bug@amsat.org,
 agraf@csgraf.de, kraxel@redhat.com, alex.bennee@linaro.org,
 qemu_oss@crudebyte.com,
 Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
Subject: [PATCH v19 3/7] net/vmnet: implement shared mode (vmnet-shared)
Date: Tue, 15 Mar 2022 23:27:00 +0300
Message-Id: <20220315202704.18263-4-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
In-Reply-To: <20220315202704.18263-1-Vladislav.Yaroshchuk@jetbrains.com>
References: <20220315202704.18263-1-Vladislav.Yaroshchuk@jetbrains.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Interaction with vmnet.framework in different modes
differs only on configuration stage, so we can create
common `send`, `receive`, etc. procedures and reuse them.

Signed-off-by: Phillip Tennen <phillip@axleos.com>
Signed-off-by: Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
---
 net/vmnet-common.m | 358 +++++++++++++++++++++++++++++++++++++++++++++
 net/vmnet-shared.c |  90 +++++++++++-
 net/vmnet_int.h    |  40 ++++-
 3 files changed, 483 insertions(+), 5 deletions(-)

diff --git a/net/vmnet-common.m b/net/vmnet-common.m
index 06326efb1c..2cb60b9ddd 100644
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
@@ -17,4 +19,360 @@
 #include "qapi/error.h"
 
 #include <vmnet/vmnet.h>
+#include <dispatch/dispatch.h>
 
+
+static void vmnet_send_completed(NetClientState *nc, ssize_t len);
+
+
+const char *vmnet_status_map_str(vmnet_return_t status)
+{
+    switch (status) {
+    case VMNET_SUCCESS:
+        return "success";
+    case VMNET_FAILURE:
+        return "general failure (possibly not enough privileges)";
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
+/**
+ * Write packets from QEMU to vmnet interface.
+ *
+ * vmnet.framework supports iov, but writing more than
+ * one iov into vmnet interface fails with
+ * 'VMNET_INVALID_ARGUMENT'. Collecting provided iovs into
+ * one and passing it to vmnet works fine. That's the
+ * reason why receive_iov() left unimplemented. But it still
+ * works with good performance having .receive() only.
+ */
+ssize_t vmnet_receive_common(NetClientState *nc,
+                             const uint8_t *buf,
+                             size_t size)
+{
+    VmnetState *s = DO_UPCAST(VmnetState, nc, nc);
+    struct vmpktdesc packet;
+    struct iovec iov;
+    int pkt_cnt;
+    vmnet_return_t if_status;
+
+    if (size > s->max_packet_size) {
+        warn_report("vmnet: packet is too big, %zu > %" PRIu64,
+            packet.vm_pkt_size,
+            s->max_packet_size);
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
+    pkt_cnt = 1;
+
+    if_status = vmnet_write(s->vmnet_if, &packet, &pkt_cnt);
+    if (if_status != VMNET_SUCCESS) {
+        error_report("vmnet: write error: %s\n",
+                     vmnet_status_map_str(if_status));
+        return -1;
+    }
+
+    if (pkt_cnt) {
+        return size;
+    }
+    return 0;
+}
+
+
+/**
+ * Read packets from vmnet interface and write them
+ * to temporary buffers in VmnetState.
+ *
+ * Returns read packets number (may be 0) on success,
+ * -1 on error
+ */
+static int vmnet_read_packets(VmnetState *s)
+{
+    assert(s->packets_send_current_pos == s->packets_send_end_pos);
+
+    struct vmpktdesc *packets = s->packets_buf;
+    vmnet_return_t status;
+    int i;
+
+    /* Read as many packets as present */
+    s->packets_send_current_pos = 0;
+    s->packets_send_end_pos = VMNET_PACKETS_LIMIT;
+    for (i = 0; i < s->packets_send_end_pos; ++i) {
+        packets[i].vm_pkt_size = s->max_packet_size;
+        packets[i].vm_pkt_iovcnt = 1;
+        packets[i].vm_flags = 0;
+    }
+
+    status = vmnet_read(s->vmnet_if, packets, &s->packets_send_end_pos);
+    if (status != VMNET_SUCCESS) {
+        error_printf("vmnet: read failed: %s\n",
+                     vmnet_status_map_str(status));
+        s->packets_send_current_pos = 0;
+        s->packets_send_end_pos = 0;
+        return -1;
+    }
+    return s->packets_send_end_pos;
+}
+
+
+/**
+ * Write packets from temporary buffers in VmnetState
+ * to QEMU.
+ */
+static void vmnet_write_packets_to_qemu(VmnetState *s)
+{
+    while (s->packets_send_current_pos < s->packets_send_end_pos) {
+        ssize_t size = qemu_send_packet_async(&s->nc,
+                                      s->iov_buf[s->packets_send_current_pos].iov_base,
+                                      s->packets_buf[s->packets_send_current_pos].vm_pkt_size,
+                                      vmnet_send_completed);
+
+        if (size == 0) {
+            /* QEMU is not ready to consume more packets -
+             * stop and wait for completion callback call */
+            return;
+        }
+        ++s->packets_send_current_pos;
+    }
+}
+
+
+/**
+ * Bottom half callback that transfers packets from vmnet interface
+ * to QEMU.
+ *
+ * The process of transferring packets is three-staged:
+ * 1. Handle vmnet event;
+ * 2. Read packets from vmnet interface into temporary buffer;
+ * 3. Write packets from temporary buffer to QEMU.
+ *
+ * QEMU may suspend this process on the last stage, returning 0 from
+ * qemu_send_packet_async function. If this happens, we should
+ * respectfully wait until it is ready to consume more packets,
+ * write left ones in temporary buffer and only after this
+ * continue reading more packets from vmnet interface.
+ *
+ * Packets to be transferred are stored into packets_buf,
+ * in the window [packets_send_current_pos..packets_send_end_pos)
+ * including current_pos, excluding end_pos.
+ *
+ * Thus, if QEMU is not ready, buffer is not read and
+ * packets_send_current_pos < packets_send_end_pos.
+ */
+static void vmnet_send_bh(void *opaque)
+{
+    NetClientState *nc = (NetClientState *) opaque;
+    VmnetState *s = DO_UPCAST(VmnetState, nc, nc);
+
+    /*
+     * Do nothing if QEMU is not ready - wait
+     * for completion callback invocation
+     */
+    if (s->packets_send_current_pos < s->packets_send_end_pos) {
+        return;
+    }
+
+    /* Read packets from vmnet interface */
+    if (vmnet_read_packets(s) > 0) {
+        /* Send them to QEMU */
+        vmnet_write_packets_to_qemu(s);
+    }
+}
+
+
+/**
+ * Completion callback to be invoked by QEMU when it becomes
+ * ready to consume more packets.
+ */
+static void vmnet_send_completed(NetClientState *nc, ssize_t len)
+{
+    VmnetState *s = DO_UPCAST(VmnetState, nc, nc);
+
+    /* Callback is invoked eq queued packet is sent */
+    ++s->packets_send_current_pos;
+
+    /* Complete sending packets left in VmnetState buffers */
+    vmnet_write_packets_to_qemu(s);
+
+    /* And read new ones from vmnet if VmnetState buffer is ready */
+    if (s->packets_send_current_pos < s->packets_send_end_pos) {
+        qemu_bh_schedule(s->send_bh);
+    }
+}
+
+
+static void vmnet_bufs_init(VmnetState *s)
+{
+    struct vmpktdesc *packets = s->packets_buf;
+    struct iovec *iov = s->iov_buf;
+    int i;
+
+    for (i = 0; i < VMNET_PACKETS_LIMIT; ++i) {
+        iov[i].iov_len = s->max_packet_size;
+        iov[i].iov_base = g_malloc0(iov[i].iov_len);
+        packets[i].vm_pkt_iov = iov + i;
+    }
+}
+
+
+int vmnet_if_create(NetClientState *nc,
+                    xpc_object_t if_desc,
+                    Error **errp)
+{
+    VmnetState *s = DO_UPCAST(VmnetState, nc, nc);
+    dispatch_semaphore_t if_created_sem = dispatch_semaphore_create(0);
+    __block vmnet_return_t if_status;
+
+    s->if_queue = dispatch_queue_create(
+        "org.qemu.vmnet.if_queue",
+        DISPATCH_QUEUE_SERIAL
+    );
+
+    xpc_dictionary_set_bool(
+        if_desc,
+        vmnet_allocate_mac_address_key,
+        false
+    );
+
+#ifdef DEBUG
+    qemu_log("vmnet.start.interface_desc:\n");
+    xpc_dictionary_apply(if_desc,
+                         ^bool(const char *k, xpc_object_t v) {
+                             char *desc = xpc_copy_description(v);
+                             qemu_log("  %s=%s\n", k, desc);
+                             free(desc);
+                             return true;
+                         });
+#endif /* DEBUG */
+
+    s->vmnet_if = vmnet_start_interface(
+        if_desc,
+        s->if_queue,
+        ^(vmnet_return_t status, xpc_object_t interface_param) {
+            if_status = status;
+            if (status != VMNET_SUCCESS || !interface_param) {
+                dispatch_semaphore_signal(if_created_sem);
+                return;
+            }
+
+#ifdef DEBUG
+            qemu_log("vmnet.start.interface_param:\n");
+            xpc_dictionary_apply(interface_param,
+                                 ^bool(const char *k, xpc_object_t v) {
+                                     char *desc = xpc_copy_description(v);
+                                     qemu_log("  %s=%s\n", k, desc);
+                                     free(desc);
+                                     return true;
+                                 });
+#endif /* DEBUG */
+
+            s->mtu = xpc_dictionary_get_uint64(
+                interface_param,
+                vmnet_mtu_key);
+            s->max_packet_size = xpc_dictionary_get_uint64(
+                interface_param,
+                vmnet_max_packet_size_key);
+
+            dispatch_semaphore_signal(if_created_sem);
+        });
+
+    if (s->vmnet_if == NULL) {
+        dispatch_release(s->if_queue);
+        dispatch_release(if_created_sem);
+        error_setg(errp,
+                   "unable to create interface with requested params");
+        return -1;
+    }
+
+    dispatch_semaphore_wait(if_created_sem, DISPATCH_TIME_FOREVER);
+    dispatch_release(if_created_sem);
+
+    if (if_status != VMNET_SUCCESS) {
+        dispatch_release(s->if_queue);
+        error_setg(errp,
+                   "cannot create vmnet interface: %s",
+                   vmnet_status_map_str(if_status));
+        return -1;
+    }
+
+    s->send_bh = aio_bh_new(qemu_get_aio_context(), vmnet_send_bh, nc);
+    vmnet_bufs_init(s);
+
+    s->packets_send_current_pos = 0;
+    s->packets_send_end_pos = 0;
+
+    vmnet_interface_set_event_callback(
+        s->vmnet_if,
+        VMNET_INTERFACE_PACKETS_AVAILABLE,
+        s->if_queue,
+        ^(interface_event_t event_id, xpc_object_t event) {
+            assert(event_id == VMNET_INTERFACE_PACKETS_AVAILABLE);
+            /*
+             * This function is being called from a non qemu thread, so
+             * we only schedule a BH, and do the rest of the io completion
+             * handling from vmnet_send_bh() which runs in a qemu context.
+             */
+            qemu_bh_schedule(s->send_bh);
+        });
+
+    return 0;
+}
+
+
+void vmnet_cleanup_common(NetClientState *nc)
+{
+    VmnetState *s = DO_UPCAST(VmnetState, nc, nc);
+    dispatch_semaphore_t if_stopped_sem;
+
+    if (s->vmnet_if == NULL) {
+        return;
+    }
+
+    if_stopped_sem = dispatch_semaphore_create(0);
+    vmnet_stop_interface(
+        s->vmnet_if,
+        s->if_queue,
+        ^(vmnet_return_t status) {
+            assert(status == VMNET_SUCCESS);
+            dispatch_semaphore_signal(if_stopped_sem);
+        });
+    dispatch_semaphore_wait(if_stopped_sem, DISPATCH_TIME_FOREVER);
+
+    qemu_purge_queued_packets(nc);
+
+    qemu_bh_delete(s->send_bh);
+    dispatch_release(if_stopped_sem);
+    dispatch_release(s->if_queue);
+
+    for (int i = 0; i < VMNET_PACKETS_LIMIT; ++i) {
+        g_free(s->iov_buf[i].iov_base);
+    }
+}
diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c
index 6dfb133a18..2ce2323bdb 100644
--- a/net/vmnet-shared.c
+++ b/net/vmnet-shared.c
@@ -10,16 +10,98 @@
 
 #include "qemu/osdep.h"
 #include "qapi/qapi-types-net.h"
+#include "qapi/error.h"
 #include "vmnet_int.h"
 #include "clients.h"
-#include "qemu/error-report.h"
-#include "qapi/error.h"
 
 #include <vmnet/vmnet.h>
 
+
+static bool validate_options(const Netdev *netdev, Error **errp)
+{
+    const NetdevVmnetSharedOptions *options = &(netdev->u.vmnet_shared);
+
+#if !defined(MAC_OS_VERSION_11_0) || \
+    MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_VERSION_11_0
+    if (options->has_isolated) {
+        error_setg(errp,
+                   "vmnet-shared.isolated feature is "
+                   "unavailable: outdated vmnet.framework API");
+        return false;
+    }
+#endif
+
+    if ((options->has_start_address ||
+         options->has_end_address ||
+         options->has_subnet_mask) &&
+        !(options->has_start_address &&
+          options->has_end_address &&
+          options->has_subnet_mask)) {
+        error_setg(errp,
+                   "'start-address', 'end-address', 'subnet-mask' "
+                   "should be provided together"
+        );
+        return false;
+    }
+
+    return true;
+}
+
+static xpc_object_t build_if_desc(const Netdev *netdev)
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
+    if (options->has_nat66_prefix) {
+        xpc_dictionary_set_string(if_desc,
+                                  vmnet_nat66_prefix_key,
+                                  options->nat66_prefix);
+    }
+
+    if (options->has_start_address) {
+        xpc_dictionary_set_string(if_desc,
+                                  vmnet_start_address_key,
+                                  options->start_address);
+        xpc_dictionary_set_string(if_desc,
+                                  vmnet_end_address_key,
+                                  options->end_address);
+        xpc_dictionary_set_string(if_desc,
+                                  vmnet_subnet_mask_key,
+                                  options->subnet_mask);
+    }
+
+#if defined(MAC_OS_VERSION_11_0) && \
+    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
+    xpc_dictionary_set_bool(
+        if_desc,
+        vmnet_enable_isolation_key,
+        options->isolated
+    );
+#endif
+
+    return if_desc;
+}
+
+static NetClientInfo net_vmnet_shared_info = {
+    .type = NET_CLIENT_DRIVER_VMNET_SHARED,
+    .size = sizeof(VmnetState),
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
+    if (!validate_options(netdev, errp)) {
+        return -1;
+    }
+    return vmnet_if_create(nc, build_if_desc(netdev), errp);
 }
diff --git a/net/vmnet_int.h b/net/vmnet_int.h
index c383038a1d..adf6e8c20d 100644
--- a/net/vmnet_int.h
+++ b/net/vmnet_int.h
@@ -15,11 +15,49 @@
 #include "clients.h"
 
 #include <vmnet/vmnet.h>
+#include <dispatch/dispatch.h>
+
+/**
+ *  From vmnet.framework documentation
+ *
+ *  Each read/write call allows up to 200 packets to be
+ *  read or written for a maximum of 256KB.
+ *
+ *  Each packet written should be a complete
+ *  ethernet frame.
+ *
+ *  https://developer.apple.com/documentation/vmnet
+ */
+#define VMNET_PACKETS_LIMIT 200
 
 typedef struct VmnetState {
-  NetClientState nc;
+    NetClientState nc;
+    interface_ref vmnet_if;
+
+    uint64_t mtu;
+    uint64_t max_packet_size;
 
+    dispatch_queue_t if_queue;
+
+    QEMUBH *send_bh;
+
+    struct vmpktdesc packets_buf[VMNET_PACKETS_LIMIT];
+    int packets_send_current_pos;
+    int packets_send_end_pos;
+
+    struct iovec iov_buf[VMNET_PACKETS_LIMIT];
 } VmnetState;
 
+const char *vmnet_status_map_str(vmnet_return_t status);
+
+int vmnet_if_create(NetClientState *nc,
+                    xpc_object_t if_desc,
+                    Error **errp);
+
+ssize_t vmnet_receive_common(NetClientState *nc,
+                             const uint8_t *buf,
+                             size_t size);
+
+void vmnet_cleanup_common(NetClientState *nc);
 
 #endif /* VMNET_INT_H */
-- 
2.34.1.vfs.0.0


