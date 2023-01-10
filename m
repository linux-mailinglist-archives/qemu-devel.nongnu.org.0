Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9304D66434E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 15:32:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFDuA-0007SP-4l; Tue, 10 Jan 2023 07:39:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+b726f73bd8c89da575c8+7079+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pFDtF-0007Bj-Ah
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 07:38:10 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+b726f73bd8c89da575c8+7079+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pFDtB-0006ZF-3e
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 07:38:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=5E7uFdJ+jsCRtDSBIps7BGwtGetzrkuJDy+53RojQvs=; b=ks0hGageea2d2FXCNNPri8+IXD
 lTWvzmcE+TAVIYo0QNf8IrTfZEhSOJzW5w8tW3y5QhURTGIdc65r6B1uFArVeGUJfhK6dVRtkhHQU
 1NYgvmiFtJqfTJ2iXwGt5xRXS/kzvMsf9yxoQk3QVoQeQHBFqFn+a8VHkAJnZ/EKL4bcISERx/ixm
 WnT2u52vcg3q/r06pZZLihHg7qM/DJ+y/RdxmJPutfkm/xi/vZqBkHurt7oVizbzZACiO1KctSc8Q
 O5ZLxcIhrhOQQ8Y9tovH4hWrxpd7d5rr3MlgIH2q6A0yu0v7584ZkcIgngw6sZ8excy41ib6/MRiZ
 GTBekEUg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pFDtJ-003Ct9-67; Tue, 10 Jan 2023 12:38:09 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pFDt6-006Z5m-6x; Tue, 10 Jan 2023 12:37:56 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
Subject: [RFC PATCH v1 01/15] hw/xen: Add evtchn operations to allow
 redirection to internal emulation
Date: Tue, 10 Jan 2023 12:37:40 +0000
Message-Id: <20230110123754.1564465-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230110123754.1564465-1-dwmw2@infradead.org>
References: <20230110122042.1562155-1-dwmw2@infradead.org>
 <20230110123754.1564465-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+b726f73bd8c89da575c8+7079+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
 hw/9pfs/xen-9p-backend.c            |  24 +++---
 hw/i386/xen/xen-hvm.c               |  28 ++++---
 hw/xen/meson.build                  |   1 +
 hw/xen/xen-bus.c                    |  22 +++---
 hw/xen/xen-legacy-backend.c         |   8 +-
 hw/xen/xen-operations.c             |  71 +++++++++++++++++
 hw/xen/xen_pvdev.c                  |  12 +--
 include/hw/xen/xen-bus.h            |   1 +
 include/hw/xen/xen-legacy-backend.h |   1 +
 include/hw/xen/xen_backend_ops.h    | 118 ++++++++++++++++++++++++++++
 include/hw/xen/xen_common.h         |  12 ---
 include/hw/xen/xen_pvdev.h          |   1 +
 softmmu/globals.c                   |   1 +
 13 files changed, 243 insertions(+), 57 deletions(-)
 create mode 100644 hw/xen/xen-operations.c
 create mode 100644 include/hw/xen/xen_backend_ops.h

diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
index 65c4979c3c..864bdaf952 100644
--- a/hw/9pfs/xen-9p-backend.c
+++ b/hw/9pfs/xen-9p-backend.c
@@ -241,7 +241,7 @@ static void xen_9pfs_push_and_notify(V9fsPDU *pdu)
     xen_wmb();
 
     ring->inprogress = false;
-    xenevtchn_notify(ring->evtchndev, ring->local_port);
+    qemu_xen_evtchn_notify(ring->evtchndev, ring->local_port);
 
     qemu_bh_schedule(ring->bh);
 }
@@ -324,8 +324,8 @@ static void xen_9pfs_evtchn_event(void *opaque)
     Xen9pfsRing *ring = opaque;
     evtchn_port_t port;
 
-    port = xenevtchn_pending(ring->evtchndev);
-    xenevtchn_unmask(ring->evtchndev, port);
+    port = qemu_xen_evtchn_pending(ring->evtchndev);
+    qemu_xen_evtchn_unmask(ring->evtchndev, port);
 
     qemu_bh_schedule(ring->bh);
 }
@@ -337,10 +337,10 @@ static void xen_9pfs_disconnect(struct XenLegacyDevice *xendev)
 
     for (i = 0; i < xen_9pdev->num_rings; i++) {
         if (xen_9pdev->rings[i].evtchndev != NULL) {
-            qemu_set_fd_handler(xenevtchn_fd(xen_9pdev->rings[i].evtchndev),
-                    NULL, NULL, NULL);
-            xenevtchn_unbind(xen_9pdev->rings[i].evtchndev,
-                             xen_9pdev->rings[i].local_port);
+            qemu_set_fd_handler(qemu_xen_evtchn_fd(xen_9pdev->rings[i].evtchndev),
+                                NULL, NULL, NULL);
+            qemu_xen_evtchn_unbind(xen_9pdev->rings[i].evtchndev,
+                                   xen_9pdev->rings[i].local_port);
             xen_9pdev->rings[i].evtchndev = NULL;
         }
     }
@@ -447,12 +447,12 @@ static int xen_9pfs_connect(struct XenLegacyDevice *xendev)
         xen_9pdev->rings[i].inprogress = false;
 
 
-        xen_9pdev->rings[i].evtchndev = xenevtchn_open(NULL, 0);
+        xen_9pdev->rings[i].evtchndev = qemu_xen_evtchn_open();
         if (xen_9pdev->rings[i].evtchndev == NULL) {
             goto out;
         }
-        qemu_set_cloexec(xenevtchn_fd(xen_9pdev->rings[i].evtchndev));
-        xen_9pdev->rings[i].local_port = xenevtchn_bind_interdomain
+        qemu_set_cloexec(qemu_xen_evtchn_fd(xen_9pdev->rings[i].evtchndev));
+        xen_9pdev->rings[i].local_port = qemu_xen_evtchn_bind_interdomain
                                             (xen_9pdev->rings[i].evtchndev,
                                              xendev->dom,
                                              xen_9pdev->rings[i].evtchn);
@@ -463,8 +463,8 @@ static int xen_9pfs_connect(struct XenLegacyDevice *xendev)
             goto out;
         }
         xen_pv_printf(xendev, 2, "bind evtchn port %d\n", xendev->local_port);
-        qemu_set_fd_handler(xenevtchn_fd(xen_9pdev->rings[i].evtchndev),
-                xen_9pfs_evtchn_event, NULL, &xen_9pdev->rings[i]);
+        qemu_set_fd_handler(qemu_xen_evtchn_fd(xen_9pdev->rings[i].evtchndev),
+                            xen_9pfs_evtchn_event, NULL, &xen_9pdev->rings[i]);
     }
 
     xen_9pdev->security_model = xenstore_read_be_str(xendev, "security_model");
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index e4293d6d66..38146efb5a 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -18,6 +18,7 @@
 #include "hw/irq.h"
 #include "hw/hw.h"
 #include "hw/i386/apic-msidef.h"
+#include "hw/xen/xen_backend_ops.h"
 #include "hw/xen/xen_common.h"
 #include "hw/xen/xen-legacy-backend.h"
 #include "hw/xen/xen-bus.h"
@@ -761,7 +762,7 @@ static ioreq_t *cpu_get_ioreq(XenIOState *state)
     int i;
     evtchn_port_t port;
 
-    port = xenevtchn_pending(state->xce_handle);
+    port = qemu_xen_evtchn_pending(state->xce_handle);
     if (port == state->bufioreq_local_port) {
         timer_mod(state->buffered_io_timer,
                 BUFFER_IO_MAX_DELAY + qemu_clock_get_ms(QEMU_CLOCK_REALTIME));
@@ -780,7 +781,7 @@ static ioreq_t *cpu_get_ioreq(XenIOState *state)
         }
 
         /* unmask the wanted port again */
-        xenevtchn_unmask(state->xce_handle, port);
+        qemu_xen_evtchn_unmask(state->xce_handle, port);
 
         /* get the io packet from shared memory */
         state->send_vcpu = i;
@@ -1147,7 +1148,7 @@ static void handle_buffered_io(void *opaque)
                 BUFFER_IO_MAX_DELAY + qemu_clock_get_ms(QEMU_CLOCK_REALTIME));
     } else {
         timer_del(state->buffered_io_timer);
-        xenevtchn_unmask(state->xce_handle, state->bufioreq_local_port);
+        qemu_xen_evtchn_unmask(state->xce_handle, state->bufioreq_local_port);
     }
 }
 
@@ -1196,8 +1197,8 @@ static void cpu_handle_ioreq(void *opaque)
         }
 
         req->state = STATE_IORESP_READY;
-        xenevtchn_notify(state->xce_handle,
-                         state->ioreq_local_port[state->send_vcpu]);
+        qemu_xen_evtchn_notify(state->xce_handle,
+                               state->ioreq_local_port[state->send_vcpu]);
     }
 }
 
@@ -1206,7 +1207,7 @@ static void xen_main_loop_prepare(XenIOState *state)
     int evtchn_fd = -1;
 
     if (state->xce_handle != NULL) {
-        evtchn_fd = xenevtchn_fd(state->xce_handle);
+        evtchn_fd = qemu_xen_evtchn_fd(state->xce_handle);
     }
 
     state->buffered_io_timer = timer_new_ms(QEMU_CLOCK_REALTIME, handle_buffered_io,
@@ -1249,7 +1250,7 @@ static void xen_exit_notifier(Notifier *n, void *data)
         xenforeignmemory_unmap_resource(xen_fmem, state->fres);
     }
 
-    xenevtchn_close(state->xce_handle);
+    qemu_xen_evtchn_close(state->xce_handle);
     xs_daemon_close(state->xenstore);
 }
 
@@ -1397,9 +1398,11 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
     xen_pfn_t ioreq_pfn;
     XenIOState *state;
 
+    setup_xen_backend_ops();
+
     state = g_new0(XenIOState, 1);
 
-    state->xce_handle = xenevtchn_open(NULL, 0);
+    state->xce_handle = qemu_xen_evtchn_open();
     if (state->xce_handle == NULL) {
         perror("xen: event channel open");
         goto err;
@@ -1463,8 +1466,9 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
 
     /* FIXME: how about if we overflow the page here? */
     for (i = 0; i < max_cpus; i++) {
-        rc = xenevtchn_bind_interdomain(state->xce_handle, xen_domid,
-                                        xen_vcpu_eport(state->shared_page, i));
+        rc = qemu_xen_evtchn_bind_interdomain(state->xce_handle, xen_domid,
+                                              xen_vcpu_eport(state->shared_page,
+                                                             i));
         if (rc == -1) {
             error_report("shared evtchn %d bind error %d", i, errno);
             goto err;
@@ -1472,8 +1476,8 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
         state->ioreq_local_port[i] = rc;
     }
 
-    rc = xenevtchn_bind_interdomain(state->xce_handle, xen_domid,
-                                    state->bufioreq_remote_port);
+    rc = qemu_xen_evtchn_bind_interdomain(state->xce_handle, xen_domid,
+                                          state->bufioreq_remote_port);
     if (rc == -1) {
         error_report("buffered evtchn bind error %d", errno);
         goto err;
diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index ae0ace3046..f195bbd25c 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -5,6 +5,7 @@ softmmu_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
   'xen-legacy-backend.c',
   'xen_devconfig.c',
   'xen_pvdev.c',
+  'xen-operations.c',
 ))
 
 xen_specific_ss = ss.source_set()
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 645a29a5a0..e93df75d4f 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -1094,12 +1094,12 @@ static bool xen_device_poll(void *opaque)
 static void xen_device_event(void *opaque)
 {
     XenEventChannel *channel = opaque;
-    unsigned long port = xenevtchn_pending(channel->xeh);
+    unsigned long port = qemu_xen_evtchn_pending(channel->xeh);
 
     if (port == channel->local_port) {
         xen_device_poll(channel);
 
-        xenevtchn_unmask(channel->xeh, port);
+        qemu_xen_evtchn_unmask(channel->xeh, port);
     }
 }
 
@@ -1114,11 +1114,11 @@ void xen_device_set_event_channel_context(XenDevice *xendev,
     }
 
     if (channel->ctx)
-        aio_set_fd_handler(channel->ctx, xenevtchn_fd(channel->xeh), true,
+        aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh), true,
                            NULL, NULL, NULL, NULL, NULL);
 
     channel->ctx = ctx;
-    aio_set_fd_handler(channel->ctx, xenevtchn_fd(channel->xeh), true,
+    aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh), true,
                        xen_device_event, NULL, xen_device_poll, NULL, channel);
 }
 
@@ -1130,13 +1130,13 @@ XenEventChannel *xen_device_bind_event_channel(XenDevice *xendev,
     XenEventChannel *channel = g_new0(XenEventChannel, 1);
     xenevtchn_port_or_error_t local_port;
 
-    channel->xeh = xenevtchn_open(NULL, 0);
+    channel->xeh = qemu_xen_evtchn_open();
     if (!channel->xeh) {
         error_setg_errno(errp, errno, "failed xenevtchn_open");
         goto fail;
     }
 
-    local_port = xenevtchn_bind_interdomain(channel->xeh,
+    local_port = qemu_xen_evtchn_bind_interdomain(channel->xeh,
                                             xendev->frontend_id,
                                             port);
     if (local_port < 0) {
@@ -1159,7 +1159,7 @@ XenEventChannel *xen_device_bind_event_channel(XenDevice *xendev,
 
 fail:
     if (channel->xeh) {
-        xenevtchn_close(channel->xeh);
+        qemu_xen_evtchn_close(channel->xeh);
     }
 
     g_free(channel);
@@ -1176,7 +1176,7 @@ void xen_device_notify_event_channel(XenDevice *xendev,
         return;
     }
 
-    if (xenevtchn_notify(channel->xeh, channel->local_port) < 0) {
+    if (qemu_xen_evtchn_notify(channel->xeh, channel->local_port) < 0) {
         error_setg_errno(errp, errno, "xenevtchn_notify failed");
     }
 }
@@ -1192,14 +1192,14 @@ void xen_device_unbind_event_channel(XenDevice *xendev,
 
     QLIST_REMOVE(channel, list);
 
-    aio_set_fd_handler(channel->ctx, xenevtchn_fd(channel->xeh), true,
+    aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh), true,
                        NULL, NULL, NULL, NULL, NULL);
 
-    if (xenevtchn_unbind(channel->xeh, channel->local_port) < 0) {
+    if (qemu_xen_evtchn_unbind(channel->xeh, channel->local_port) < 0) {
         error_setg_errno(errp, errno, "xenevtchn_unbind failed");
     }
 
-    xenevtchn_close(channel->xeh);
+    qemu_xen_evtchn_close(channel->xeh);
     g_free(channel);
 }
 
diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 085fd31ef7..23e8a6fbd8 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -294,13 +294,13 @@ static struct XenLegacyDevice *xen_be_get_xendev(const char *type, int dom,
     xendev->debug      = debug;
     xendev->local_port = -1;
 
-    xendev->evtchndev = xenevtchn_open(NULL, 0);
+    xendev->evtchndev = qemu_xen_evtchn_open();
     if (xendev->evtchndev == NULL) {
         xen_pv_printf(NULL, 0, "can't open evtchn device\n");
         qdev_unplug(DEVICE(xendev), NULL);
         return NULL;
     }
-    qemu_set_cloexec(xenevtchn_fd(xendev->evtchndev));
+    qemu_set_cloexec(qemu_xen_evtchn_fd(xendev->evtchndev));
 
     xen_pv_insert_xendev(xendev);
 
@@ -763,14 +763,14 @@ int xen_be_bind_evtchn(struct XenLegacyDevice *xendev)
     if (xendev->local_port != -1) {
         return 0;
     }
-    xendev->local_port = xenevtchn_bind_interdomain
+    xendev->local_port = qemu_xen_evtchn_bind_interdomain
         (xendev->evtchndev, xendev->dom, xendev->remote_port);
     if (xendev->local_port == -1) {
         xen_pv_printf(xendev, 0, "xenevtchn_bind_interdomain failed\n");
         return -1;
     }
     xen_pv_printf(xendev, 2, "bind evtchn port %d\n", xendev->local_port);
-    qemu_set_fd_handler(xenevtchn_fd(xendev->evtchndev),
+    qemu_set_fd_handler(qemu_xen_evtchn_fd(xendev->evtchndev),
                         xen_pv_evtchn_event, NULL, xendev);
     return 0;
 }
diff --git a/hw/xen/xen-operations.c b/hw/xen/xen-operations.c
new file mode 100644
index 0000000000..1a959d89e8
--- /dev/null
+++ b/hw/xen/xen-operations.c
@@ -0,0 +1,71 @@
+/*
+ * QEMU Xen backend support: Operations for true Xen
+ *
+ * Copyright © 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * Authors: David Woodhouse <dwmw2@infradead.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+
+#include "hw/xen/xen_backend_ops.h"
+#include "hw/xen/xen_common.h"
+
+/*
+ * If we have new enough libxenctrl then we do not want/need these compat
+ * interfaces, despite what the user supplied cflags might say. They
+ * must be undefined before including xenctrl.h
+ */
+#undef XC_WANT_COMPAT_EVTCHN_API
+
+#include <xenctrl.h>
+
+/*
+ * We don't support Xen prior to 4.2.0.
+ */
+
+/* Xen 4.2 through 4.6 */
+#if CONFIG_XEN_CTRL_INTERFACE_VERSION < 40701
+
+typedef xc_evtchn xenevtchn_handle;
+typedef evtchn_port_or_error_t xenevtchn_port_or_error_t;
+
+#define xenevtchn_open(l, f) xc_evtchn_open(l, f);
+#define xenevtchn_close(h) xc_evtchn_close(h)
+#define xenevtchn_fd(h) xc_evtchn_fd(h)
+#define xenevtchn_pending(h) xc_evtchn_pending(h)
+#define xenevtchn_notify(h, p) xc_evtchn_notify(h, p)
+#define xenevtchn_bind_interdomain(h, d, p) xc_evtchn_bind_interdomain(h, d, p)
+#define xenevtchn_unmask(h, p) xc_evtchn_unmask(h, p)
+#define xenevtchn_unbind(h, p) xc_evtchn_unbind(h, p)
+
+#else /* CONFIG_XEN_CTRL_INTERFACE_VERSION >= 40701 */
+
+#include <xenevtchn.h>
+
+#endif
+
+static xenevtchn_handle *libxenevtchn_backend_open(void)
+{
+    return xenevtchn_open(NULL, 0);
+}
+
+struct evtchn_backend_ops libxenevtchn_backend_ops = {
+    .open = libxenevtchn_backend_open,
+    .close = xenevtchn_close,
+    .bind_interdomain = xenevtchn_bind_interdomain,
+    .unbind = xenevtchn_unbind,
+    .get_fd = xenevtchn_fd,
+    .notify = xenevtchn_notify,
+    .unmask = xenevtchn_unmask,
+    .pending = xenevtchn_pending,
+};
+
+void setup_xen_backend_ops(void)
+{
+    xen_evtchn_ops = &libxenevtchn_backend_ops;
+}
diff --git a/hw/xen/xen_pvdev.c b/hw/xen/xen_pvdev.c
index 037152f063..ccdba28363 100644
--- a/hw/xen/xen_pvdev.c
+++ b/hw/xen/xen_pvdev.c
@@ -237,14 +237,14 @@ void xen_pv_evtchn_event(void *opaque)
     struct XenLegacyDevice *xendev = opaque;
     evtchn_port_t port;
 
-    port = xenevtchn_pending(xendev->evtchndev);
+    port = qemu_xen_evtchn_pending(xendev->evtchndev);
     if (port != xendev->local_port) {
         xen_pv_printf(xendev, 0,
                       "xenevtchn_pending returned %d (expected %d)\n",
                       port, xendev->local_port);
         return;
     }
-    xenevtchn_unmask(xendev->evtchndev, port);
+    qemu_xen_evtchn_unmask(xendev->evtchndev, port);
 
     if (xendev->ops->event) {
         xendev->ops->event(xendev);
@@ -256,15 +256,15 @@ void xen_pv_unbind_evtchn(struct XenLegacyDevice *xendev)
     if (xendev->local_port == -1) {
         return;
     }
-    qemu_set_fd_handler(xenevtchn_fd(xendev->evtchndev), NULL, NULL, NULL);
-    xenevtchn_unbind(xendev->evtchndev, xendev->local_port);
+    qemu_set_fd_handler(qemu_xen_evtchn_fd(xendev->evtchndev), NULL, NULL, NULL);
+    qemu_xen_evtchn_unbind(xendev->evtchndev, xendev->local_port);
     xen_pv_printf(xendev, 2, "unbind evtchn port %d\n", xendev->local_port);
     xendev->local_port = -1;
 }
 
 int xen_pv_send_notify(struct XenLegacyDevice *xendev)
 {
-    return xenevtchn_notify(xendev->evtchndev, xendev->local_port);
+    return qemu_xen_evtchn_notify(xendev->evtchndev, xendev->local_port);
 }
 
 /* ------------------------------------------------------------- */
@@ -305,7 +305,7 @@ void xen_pv_del_xendev(struct XenLegacyDevice *xendev)
     }
 
     if (xendev->evtchndev != NULL) {
-        xenevtchn_close(xendev->evtchndev);
+        qemu_xen_evtchn_close(xendev->evtchndev);
     }
     if (xendev->gnttabdev != NULL) {
         xengnttab_close(xendev->gnttabdev);
diff --git a/include/hw/xen/xen-bus.h b/include/hw/xen/xen-bus.h
index 713e763348..71292286b8 100644
--- a/include/hw/xen/xen-bus.h
+++ b/include/hw/xen/xen-bus.h
@@ -8,6 +8,7 @@
 #ifndef HW_XEN_BUS_H
 #define HW_XEN_BUS_H
 
+#include "hw/xen/xen_backend_ops.h"
 #include "hw/xen/xen_common.h"
 #include "hw/sysbus.h"
 #include "qemu/notify.h"
diff --git a/include/hw/xen/xen-legacy-backend.h b/include/hw/xen/xen-legacy-backend.h
index be281e1f38..0ef9b772ac 100644
--- a/include/hw/xen/xen-legacy-backend.h
+++ b/include/hw/xen/xen-legacy-backend.h
@@ -2,6 +2,7 @@
 #define HW_XEN_LEGACY_BACKEND_H
 
 #include "hw/xen/xen_common.h"
+#include "hw/xen/xen_backend_ops.h"
 #include "hw/xen/xen_pvdev.h"
 #include "net/net.h"
 #include "qom/object.h"
diff --git a/include/hw/xen/xen_backend_ops.h b/include/hw/xen/xen_backend_ops.h
new file mode 100644
index 0000000000..9605456e81
--- /dev/null
+++ b/include/hw/xen/xen_backend_ops.h
@@ -0,0 +1,118 @@
+/*
+ * QEMU Xen backend support
+ *
+ * Copyright © 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * Authors: David Woodhouse <dwmw2@infradead.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_XEN_BACKEND_OPS_H
+#define QEMU_XEN_BACKEND_OPS_H
+
+/*
+ * For the time being, these operations map fairly closely to the API of
+ * the actual Xen libraries, e.g. libxenevtchn. As we complete the migration
+ * from XenLegacyDevice back ends to the new XenDevice model, they may
+ * evolve to slightly higher-level APIs.
+ *
+ * The internal emulations do not emulate the Xen APIs entirely faithfully;
+ * only enough to be used by the Xen backend devices. For example, only one
+ * event channel can be bound to each handle, since that's sufficient for
+ * the device support (only the true Xen HVM backend uses more). And the
+ * behaviour of unmask() and pending() is different too because the device
+ * backends don't care.
+ */
+
+typedef struct xenevtchn_handle xenevtchn_handle;
+typedef int xenevtchn_port_or_error_t;
+typedef uint32_t evtchn_port_t;
+
+struct evtchn_backend_ops {
+    xenevtchn_handle *(*open)(void);
+    int (*bind_interdomain)(xenevtchn_handle *xc, uint32_t domid,
+                            evtchn_port_t guest_port);
+    int (*unbind)(xenevtchn_handle *xc, evtchn_port_t port);
+    int (*close)(struct xenevtchn_handle *xc);
+    int (*get_fd)(struct xenevtchn_handle *xc);
+    int (*notify)(struct xenevtchn_handle *xc, evtchn_port_t port);
+    int (*unmask)(struct xenevtchn_handle *xc, evtchn_port_t port);
+    int (*pending)(struct xenevtchn_handle *xc);
+};
+
+extern struct evtchn_backend_ops *xen_evtchn_ops;
+
+static inline xenevtchn_handle *qemu_xen_evtchn_open(void)
+{
+    if (!xen_evtchn_ops) {
+        return NULL;
+    }
+    return xen_evtchn_ops->open();
+}
+
+static inline int qemu_xen_evtchn_bind_interdomain(xenevtchn_handle *xc,
+                                                   uint32_t domid,
+                                                   evtchn_port_t guest_port)
+{
+    if (!xen_evtchn_ops) {
+        return -ENOSYS;
+    }
+    return xen_evtchn_ops->bind_interdomain(xc, domid, guest_port);
+}
+
+static inline int qemu_xen_evtchn_unbind(xenevtchn_handle *xc,
+                                         evtchn_port_t port)
+{
+    if (!xen_evtchn_ops) {
+        return -ENOSYS;
+    }
+    return xen_evtchn_ops->unbind(xc, port);
+}
+
+static inline int qemu_xen_evtchn_close(xenevtchn_handle *xc)
+{
+    if (!xen_evtchn_ops) {
+        return -ENOSYS;
+    }
+    return xen_evtchn_ops->close(xc);
+}
+
+static inline int qemu_xen_evtchn_fd(xenevtchn_handle *xc)
+{
+    if (!xen_evtchn_ops) {
+        return -ENOSYS;
+    }
+    return xen_evtchn_ops->get_fd(xc);
+}
+
+static inline int qemu_xen_evtchn_notify(xenevtchn_handle *xc,
+                                         evtchn_port_t port)
+{
+    if (!xen_evtchn_ops) {
+        return -ENOSYS;
+    }
+    return xen_evtchn_ops->notify(xc, port);
+}
+
+static inline int qemu_xen_evtchn_unmask(xenevtchn_handle *xc,
+                                         evtchn_port_t port)
+{
+    if (!xen_evtchn_ops) {
+        return -ENOSYS;
+    }
+    return xen_evtchn_ops->unmask(xc, port);
+}
+
+static inline int qemu_xen_evtchn_pending(xenevtchn_handle *xc)
+{
+    if (!xen_evtchn_ops) {
+        return -ENOSYS;
+    }
+    return xen_evtchn_ops->pending(xc);
+}
+
+void setup_xen_backend_ops(void);
+
+#endif /* QEMU_XEN_BACKEND_OPS_H */
diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
index 77ce17d8a4..ee2c7d8695 100644
--- a/include/hw/xen/xen_common.h
+++ b/include/hw/xen/xen_common.h
@@ -28,18 +28,7 @@ extern xc_interface *xen_xc;
 #if CONFIG_XEN_CTRL_INTERFACE_VERSION < 40701
 
 typedef xc_interface xenforeignmemory_handle;
-typedef xc_evtchn xenevtchn_handle;
 typedef xc_gnttab xengnttab_handle;
-typedef evtchn_port_or_error_t xenevtchn_port_or_error_t;
-
-#define xenevtchn_open(l, f) xc_evtchn_open(l, f);
-#define xenevtchn_close(h) xc_evtchn_close(h)
-#define xenevtchn_fd(h) xc_evtchn_fd(h)
-#define xenevtchn_pending(h) xc_evtchn_pending(h)
-#define xenevtchn_notify(h, p) xc_evtchn_notify(h, p)
-#define xenevtchn_bind_interdomain(h, d, p) xc_evtchn_bind_interdomain(h, d, p)
-#define xenevtchn_unmask(h, p) xc_evtchn_unmask(h, p)
-#define xenevtchn_unbind(h, p) xc_evtchn_unbind(h, p)
 
 #define xengnttab_open(l, f) xc_gnttab_open(l, f)
 #define xengnttab_close(h) xc_gnttab_close(h)
@@ -69,7 +58,6 @@ static inline void *xenforeignmemory_map(xc_interface *h, uint32_t dom,
 
 #else /* CONFIG_XEN_CTRL_INTERFACE_VERSION >= 40701 */
 
-#include <xenevtchn.h>
 #include <xengnttab.h>
 #include <xenforeignmemory.h>
 
diff --git a/include/hw/xen/xen_pvdev.h b/include/hw/xen/xen_pvdev.h
index 7cd4bc2b82..9c27b14764 100644
--- a/include/hw/xen/xen_pvdev.h
+++ b/include/hw/xen/xen_pvdev.h
@@ -1,6 +1,7 @@
 #ifndef QEMU_HW_XEN_PVDEV_H
 #define QEMU_HW_XEN_PVDEV_H
 
+#include "hw/xen/xen_backend_ops.h"
 #include "hw/xen/xen_common.h"
 /* ------------------------------------------------------------- */
 
diff --git a/softmmu/globals.c b/softmmu/globals.c
index 0a4405614e..eb62739be1 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -65,3 +65,4 @@ bool qemu_uuid_set;
 uint32_t xen_domid;
 enum xen_mode xen_mode = XEN_DISABLED;
 bool xen_domid_restrict;
+struct evtchn_backend_ops *xen_evtchn_ops;
-- 
2.35.3


