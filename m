Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCACA48FD46
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jan 2022 14:46:21 +0100 (CET)
Received: from localhost ([::1]:34100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n95rR-0007sk-09
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 08:46:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n95io-0000lL-UW
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 08:37:27 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:53173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n95in-0001i0-2b
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 08:37:26 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 92DB97470BA;
 Sun, 16 Jan 2022 14:37:20 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 42D197470BF; Sun, 16 Jan 2022 14:37:19 +0100 (CET)
Message-Id: <8e2deb83f2bf2846f9115962e1e2fedf5a56317f.1642339238.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1642339238.git.balaton@eik.bme.hu>
References: <cover.1642339238.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 3/5] usb/ohci: Move USBPortOps related functions together
Date: Sun, 16 Jan 2022 14:20:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This also allows removing two forward declarations

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/usb/hcd-ohci.c | 204 +++++++++++++++++++++++-----------------------
 1 file changed, 100 insertions(+), 104 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 6d762973eb..d1907afd3f 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -58,8 +58,6 @@ struct ohci_hcca {
 #define ED_WBACK_OFFSET offsetof(struct ohci_ed, head)
 #define ED_WBACK_SIZE   4
 
-static void ohci_async_cancel_device(OHCIState *ohci, USBDevice *dev);
-
 /* Bitfields for the first word of an Endpoint Desciptor.  */
 #define OHCI_ED_FA_SHIFT  0
 #define OHCI_ED_FA_MASK   (0x7f<<OHCI_ED_FA_SHIFT)
@@ -261,92 +259,6 @@ static inline void ohci_set_interrupt(OHCIState *ohci, uint32_t intr)
     ohci_intr_update(ohci);
 }
 
-/* Attach or detach a device on a root hub port.  */
-static void ohci_attach(USBPort *port1)
-{
-    OHCIState *s = port1->opaque;
-    OHCIPort *port = &s->rhport[port1->index];
-    uint32_t old_state = port->ctrl;
-
-    /* set connect status */
-    port->ctrl |= OHCI_PORT_CCS | OHCI_PORT_CSC;
-
-    /* update speed */
-    if (port->port.dev->speed == USB_SPEED_LOW) {
-        port->ctrl |= OHCI_PORT_LSDA;
-    } else {
-        port->ctrl &= ~OHCI_PORT_LSDA;
-    }
-
-    /* notify of remote-wakeup */
-    if ((s->ctl & OHCI_CTL_HCFS) == OHCI_USB_SUSPEND) {
-        ohci_set_interrupt(s, OHCI_INTR_RD);
-    }
-
-    trace_usb_ohci_port_attach(port1->index);
-
-    if (old_state != port->ctrl) {
-        ohci_set_interrupt(s, OHCI_INTR_RHSC);
-    }
-}
-
-static void ohci_detach(USBPort *port1)
-{
-    OHCIState *s = port1->opaque;
-    OHCIPort *port = &s->rhport[port1->index];
-    uint32_t old_state = port->ctrl;
-
-    ohci_async_cancel_device(s, port1->dev);
-
-    /* set connect status */
-    if (port->ctrl & OHCI_PORT_CCS) {
-        port->ctrl &= ~OHCI_PORT_CCS;
-        port->ctrl |= OHCI_PORT_CSC;
-    }
-    /* disable port */
-    if (port->ctrl & OHCI_PORT_PES) {
-        port->ctrl &= ~OHCI_PORT_PES;
-        port->ctrl |= OHCI_PORT_PESC;
-    }
-    trace_usb_ohci_port_detach(port1->index);
-
-    if (old_state != port->ctrl) {
-        ohci_set_interrupt(s, OHCI_INTR_RHSC);
-    }
-}
-
-static void ohci_wakeup(USBPort *port1)
-{
-    OHCIState *s = port1->opaque;
-    OHCIPort *port = &s->rhport[port1->index];
-    uint32_t intr = 0;
-    if (port->ctrl & OHCI_PORT_PSS) {
-        trace_usb_ohci_port_wakeup(port1->index);
-        port->ctrl |= OHCI_PORT_PSSC;
-        port->ctrl &= ~OHCI_PORT_PSS;
-        intr = OHCI_INTR_RHSC;
-    }
-    /* Note that the controller can be suspended even if this port is not */
-    if ((s->ctl & OHCI_CTL_HCFS) == OHCI_USB_SUSPEND) {
-        trace_usb_ohci_remote_wakeup(s->name);
-        /* This is the one state transition the controller can do by itself */
-        s->ctl &= ~OHCI_CTL_HCFS;
-        s->ctl |= OHCI_USB_RESUME;
-        /* In suspend mode only ResumeDetected is possible, not RHSC:
-         * see the OHCI spec 5.1.2.3.
-         */
-        intr = OHCI_INTR_RD;
-    }
-    ohci_set_interrupt(s, intr);
-}
-
-static void ohci_child_detach(USBPort *port1, USBDevice *child)
-{
-    OHCIState *s = port1->opaque;
-
-    ohci_async_cancel_device(s, child);
-}
-
 static USBDevice *ohci_find_device(OHCIState *ohci, uint8_t addr)
 {
     USBDevice *dev;
@@ -634,17 +546,6 @@ static int ohci_copy_iso_td(OHCIState *ohci,
     return 0;
 }
 
-static void ohci_process_lists(OHCIState *ohci, int completion);
-
-static void ohci_async_complete_packet(USBPort *port, USBPacket *packet)
-{
-    OHCIState *ohci = container_of(packet, OHCIState, usb_packet);
-
-    trace_usb_ohci_async_complete();
-    ohci->async_complete = true;
-    ohci_process_lists(ohci, 1);
-}
-
 #define USUB(a, b) ((int16_t)((uint16_t)(a) - (uint16_t)(b)))
 
 static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed,
@@ -1789,6 +1690,41 @@ static void ohci_mem_write(void *opaque,
     }
 }
 
+static const MemoryRegionOps ohci_mem_ops = {
+    .read = ohci_mem_read,
+    .write = ohci_mem_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+/* USBPortOps */
+static void ohci_attach(USBPort *port1)
+{
+    OHCIState *s = port1->opaque;
+    OHCIPort *port = &s->rhport[port1->index];
+    uint32_t old_state = port->ctrl;
+
+    /* set connect status */
+    port->ctrl |= OHCI_PORT_CCS | OHCI_PORT_CSC;
+
+    /* update speed */
+    if (port->port.dev->speed == USB_SPEED_LOW) {
+        port->ctrl |= OHCI_PORT_LSDA;
+    } else {
+        port->ctrl &= ~OHCI_PORT_LSDA;
+    }
+
+    /* notify of remote-wakeup */
+    if ((s->ctl & OHCI_CTL_HCFS) == OHCI_USB_SUSPEND) {
+        ohci_set_interrupt(s, OHCI_INTR_RD);
+    }
+
+    trace_usb_ohci_port_attach(port1->index);
+
+    if (old_state != port->ctrl) {
+        ohci_set_interrupt(s, OHCI_INTR_RHSC);
+    }
+}
+
 static void ohci_async_cancel_device(OHCIState *ohci, USBDevice *dev)
 {
     if (ohci->async_td &&
@@ -1799,11 +1735,71 @@ static void ohci_async_cancel_device(OHCIState *ohci, USBDevice *dev)
     }
 }
 
-static const MemoryRegionOps ohci_mem_ops = {
-    .read = ohci_mem_read,
-    .write = ohci_mem_write,
-    .endianness = DEVICE_LITTLE_ENDIAN,
-};
+static void ohci_child_detach(USBPort *port1, USBDevice *child)
+{
+    OHCIState *s = port1->opaque;
+
+    ohci_async_cancel_device(s, child);
+}
+
+static void ohci_detach(USBPort *port1)
+{
+    OHCIState *s = port1->opaque;
+    OHCIPort *port = &s->rhport[port1->index];
+    uint32_t old_state = port->ctrl;
+
+    ohci_async_cancel_device(s, port1->dev);
+
+    /* set connect status */
+    if (port->ctrl & OHCI_PORT_CCS) {
+        port->ctrl &= ~OHCI_PORT_CCS;
+        port->ctrl |= OHCI_PORT_CSC;
+    }
+    /* disable port */
+    if (port->ctrl & OHCI_PORT_PES) {
+        port->ctrl &= ~OHCI_PORT_PES;
+        port->ctrl |= OHCI_PORT_PESC;
+    }
+    trace_usb_ohci_port_detach(port1->index);
+
+    if (old_state != port->ctrl) {
+        ohci_set_interrupt(s, OHCI_INTR_RHSC);
+    }
+}
+
+static void ohci_wakeup(USBPort *port1)
+{
+    OHCIState *s = port1->opaque;
+    OHCIPort *port = &s->rhport[port1->index];
+    uint32_t intr = 0;
+    if (port->ctrl & OHCI_PORT_PSS) {
+        trace_usb_ohci_port_wakeup(port1->index);
+        port->ctrl |= OHCI_PORT_PSSC;
+        port->ctrl &= ~OHCI_PORT_PSS;
+        intr = OHCI_INTR_RHSC;
+    }
+    /* Note that the controller can be suspended even if this port is not */
+    if ((s->ctl & OHCI_CTL_HCFS) == OHCI_USB_SUSPEND) {
+        trace_usb_ohci_remote_wakeup(s->name);
+        /* This is the one state transition the controller can do by itself */
+        s->ctl &= ~OHCI_CTL_HCFS;
+        s->ctl |= OHCI_USB_RESUME;
+        /* In suspend mode only ResumeDetected is possible, not RHSC:
+         * see the OHCI spec 5.1.2.3.
+         */
+        intr = OHCI_INTR_RD;
+    }
+    ohci_set_interrupt(s, intr);
+}
+
+static void ohci_async_complete_packet(USBPort *port, USBPacket *packet)
+{
+    OHCIState *ohci = container_of(packet, OHCIState, usb_packet);
+
+    trace_usb_ohci_async_complete();
+    ohci->async_complete = true;
+    ohci_process_lists(ohci, 1);
+}
 
 static USBPortOps ohci_port_ops = {
     .attach = ohci_attach,
-- 
2.30.2


