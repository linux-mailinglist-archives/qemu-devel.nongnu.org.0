Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FBC4CD6C7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:51:42 +0100 (CET)
Received: from localhost ([::1]:34890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9HN-00071I-Rk
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:51:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8pL-00015S-Fp
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:22:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8pJ-0000Mj-4a
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:22:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646403756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GjR+4qjtFklzx6/r/Mu6DDEFmuJDYJjNypVS7eElvrw=;
 b=clk108BoNZFVq3HKss5G4zaCJM2GGp8U6fuw1ikNJVxDP/Mj6y7CkXrRLD0YpE+OLTj55u
 l+xzPa4JKym2J7HXYOHz8j0r7LLlUquakR5sfqnWQ8hN7MOKHUNIOqpWTRrNQf7U7kW4YB
 8GwORaJFSEyHsafZhMEm4hmb7VAtZmo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-ut3IOS2yNWur971_VJN9Hw-1; Fri, 04 Mar 2022 09:22:34 -0500
X-MC-Unique: ut3IOS2yNWur971_VJN9Hw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E85A41091DA0;
 Fri,  4 Mar 2022 14:22:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8731F866F5;
 Fri,  4 Mar 2022 14:22:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1573918003A8; Fri,  4 Mar 2022 15:21:24 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/35] usb/ohci: Move USBPortOps related functions together
Date: Fri,  4 Mar 2022 15:20:53 +0100
Message-Id: <20220304142123.956171-6-kraxel@redhat.com>
In-Reply-To: <20220304142123.956171-1-kraxel@redhat.com>
References: <20220304142123.956171-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

This also allows removing two forward declarations

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <9fd730375c4cad0b11163631660d68711d3fc13f.1643117600.git.balaton@eik.bme.hu>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-ohci.c | 215 +++++++++++++++++++++++-----------------------
 1 file changed, 106 insertions(+), 109 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 6d762973ebd2..190f5a8aba18 100644
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
@@ -1789,22 +1690,118 @@ static void ohci_mem_write(void *opaque,
     }
 }
 
-static void ohci_async_cancel_device(OHCIState *ohci, USBDevice *dev)
-{
-    if (ohci->async_td &&
-        usb_packet_is_inflight(&ohci->usb_packet) &&
-        ohci->usb_packet.ep->dev == dev) {
-        usb_cancel_packet(&ohci->usb_packet);
-        ohci->async_td = 0;
-    }
-}
-
 static const MemoryRegionOps ohci_mem_ops = {
     .read = ohci_mem_read,
     .write = ohci_mem_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
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
+static void ohci_async_cancel_device(OHCIState *ohci, USBDevice *dev)
+{
+    if (ohci->async_td &&
+        usb_packet_is_inflight(&ohci->usb_packet) &&
+        ohci->usb_packet.ep->dev == dev) {
+        usb_cancel_packet(&ohci->usb_packet);
+        ohci->async_td = 0;
+    }
+}
+
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
+        /*
+         * In suspend mode only ResumeDetected is possible, not RHSC:
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
+
 static USBPortOps ohci_port_ops = {
     .attach = ohci_attach,
     .detach = ohci_detach,
-- 
2.35.1


