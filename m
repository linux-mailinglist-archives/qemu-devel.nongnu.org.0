Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767895EBD54
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 10:31:53 +0200 (CEST)
Received: from localhost ([::1]:45258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od60O-0005Pu-Bm
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 04:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od5oQ-0005Os-7a
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:19:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od5oO-0000J8-G5
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:19:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664266767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5nyN9zf4XTCE2tFR3Vt7TfVm0hv0qRla4YlTg9dQiCI=;
 b=a1n7qII9h/3dGdagKpCAsiwLcIMd6qSzEnRQW4eQL6+1oc/hpgWyddt/Q0/Snd642KKQCN
 awYKFQeowYxFY+lO7c8eletmqzXnAnW5jUib01ukvnPiPws9yBXa0JeIEp7TKs8+TmyIn2
 j3fETCOGXH3kkrAhP9cdvDsPXPKuBks=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-KSadr7CxNomHjU5Vjv264Q-1; Tue, 27 Sep 2022 04:19:24 -0400
X-MC-Unique: KSadr7CxNomHjU5Vjv264Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 235AA101A528;
 Tue, 27 Sep 2022 08:19:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABE532087440;
 Tue, 27 Sep 2022 08:19:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7BB3A1800996; Tue, 27 Sep 2022 10:19:13 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Qiuhao Li <Qiuhao.Li@outlook.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Alexandre Ratchov <alex@caoua.org>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 11/24] hw/usb/hcd-xhci: Check whether DMA accesses fail
Date: Tue, 27 Sep 2022 10:18:59 +0200
Message-Id: <20220927081912.180983-12-kraxel@redhat.com>
In-Reply-To: <20220927081912.180983-1-kraxel@redhat.com>
References: <20220927081912.180983-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

If a guest sets up bad descriptors, it could force QEMU to access
non-existing memory regions. Thus we should check the return value
of dma_memory_read/write() to make sure that these errors don't go
unnoticed.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220817160016.49752-1-thuth@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-xhci.c | 64 +++++++++++++++++++++++++++++++++++------------
 1 file changed, 48 insertions(+), 16 deletions(-)

diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index 3c48b58ddeb5..acd60b1a4904 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -463,6 +463,12 @@ static void xhci_mfwrap_timer(void *opaque)
     xhci_mfwrap_update(xhci);
 }
 
+static void xhci_die(XHCIState *xhci)
+{
+    xhci->usbsts |= USBSTS_HCE;
+    DPRINTF("xhci: asserted controller error\n");
+}
+
 static inline dma_addr_t xhci_addr64(uint32_t low, uint32_t high)
 {
     if (sizeof(dma_addr_t) == 4) {
@@ -488,7 +494,14 @@ static inline void xhci_dma_read_u32s(XHCIState *xhci, dma_addr_t addr,
 
     assert((len % sizeof(uint32_t)) == 0);
 
-    dma_memory_read(xhci->as, addr, buf, len, MEMTXATTRS_UNSPECIFIED);
+    if (dma_memory_read(xhci->as, addr, buf, len,
+                        MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA memory access failed!\n",
+                      __func__);
+        memset(buf, 0xff, len);
+        xhci_die(xhci);
+        return;
+    }
 
     for (i = 0; i < (len / sizeof(uint32_t)); i++) {
         buf[i] = le32_to_cpu(buf[i]);
@@ -496,7 +509,7 @@ static inline void xhci_dma_read_u32s(XHCIState *xhci, dma_addr_t addr,
 }
 
 static inline void xhci_dma_write_u32s(XHCIState *xhci, dma_addr_t addr,
-                                       uint32_t *buf, size_t len)
+                                       const uint32_t *buf, size_t len)
 {
     int i;
     uint32_t tmp[5];
@@ -508,7 +521,13 @@ static inline void xhci_dma_write_u32s(XHCIState *xhci, dma_addr_t addr,
     for (i = 0; i < n; i++) {
         tmp[i] = cpu_to_le32(buf[i]);
     }
-    dma_memory_write(xhci->as, addr, tmp, len, MEMTXATTRS_UNSPECIFIED);
+    if (dma_memory_write(xhci->as, addr, tmp, len,
+                         MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA memory access failed!\n",
+                      __func__);
+        xhci_die(xhci);
+        return;
+    }
 }
 
 static XHCIPort *xhci_lookup_port(XHCIState *xhci, struct USBPort *uport)
@@ -593,12 +612,6 @@ static inline int xhci_running(XHCIState *xhci)
     return !(xhci->usbsts & USBSTS_HCH);
 }
 
-static void xhci_die(XHCIState *xhci)
-{
-    xhci->usbsts |= USBSTS_HCE;
-    DPRINTF("xhci: asserted controller error\n");
-}
-
 static void xhci_write_event(XHCIState *xhci, XHCIEvent *event, int v)
 {
     XHCIInterrupter *intr = &xhci->intr[v];
@@ -619,7 +632,12 @@ static void xhci_write_event(XHCIState *xhci, XHCIEvent *event, int v)
                                ev_trb.status, ev_trb.control);
 
     addr = intr->er_start + TRB_SIZE*intr->er_ep_idx;
-    dma_memory_write(xhci->as, addr, &ev_trb, TRB_SIZE, MEMTXATTRS_UNSPECIFIED);
+    if (dma_memory_write(xhci->as, addr, &ev_trb, TRB_SIZE,
+                         MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA memory access failed!\n",
+                      __func__);
+        xhci_die(xhci);
+    }
 
     intr->er_ep_idx++;
     if (intr->er_ep_idx >= intr->er_size) {
@@ -680,8 +698,12 @@ static TRBType xhci_ring_fetch(XHCIState *xhci, XHCIRing *ring, XHCITRB *trb,
 
     while (1) {
         TRBType type;
-        dma_memory_read(xhci->as, ring->dequeue, trb, TRB_SIZE,
-                        MEMTXATTRS_UNSPECIFIED);
+        if (dma_memory_read(xhci->as, ring->dequeue, trb, TRB_SIZE,
+                            MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA memory access failed!\n",
+                          __func__);
+            return 0;
+        }
         trb->addr = ring->dequeue;
         trb->ccs = ring->ccs;
         le64_to_cpus(&trb->parameter);
@@ -798,8 +820,14 @@ static void xhci_er_reset(XHCIState *xhci, int v)
         xhci_die(xhci);
         return;
     }
-    dma_memory_read(xhci->as, erstba, &seg, sizeof(seg),
-                    MEMTXATTRS_UNSPECIFIED);
+    if (dma_memory_read(xhci->as, erstba, &seg, sizeof(seg),
+                    MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA memory access failed!\n",
+                      __func__);
+        xhci_die(xhci);
+        return;
+    }
+
     le32_to_cpus(&seg.addr_low);
     le32_to_cpus(&seg.addr_high);
     le32_to_cpus(&seg.size);
@@ -2415,8 +2443,12 @@ static TRBCCode xhci_get_port_bandwidth(XHCIState *xhci, uint64_t pctx)
     /* TODO: actually implement real values here */
     bw_ctx[0] = 0;
     memset(&bw_ctx[1], 80, xhci->numports); /* 80% */
-    dma_memory_write(xhci->as, ctx, bw_ctx, sizeof(bw_ctx),
-                     MEMTXATTRS_UNSPECIFIED);
+    if (dma_memory_write(xhci->as, ctx, bw_ctx, sizeof(bw_ctx),
+                     MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA memory write failed!\n",
+                      __func__);
+        return CC_TRB_ERROR;
+    }
 
     return CC_SUCCESS;
 }
-- 
2.37.3


