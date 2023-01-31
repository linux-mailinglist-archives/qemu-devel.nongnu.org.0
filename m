Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9E76836B4
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 20:39:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMwSv-0006uB-1P; Tue, 31 Jan 2023 14:38:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pMwSt-0006tQ-1i
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 14:38:47 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pMwSr-0003Kx-FT
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 14:38:46 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 61ED974632B;
 Tue, 31 Jan 2023 20:36:17 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 41310746324; Tue, 31 Jan 2023 20:36:17 +0100 (CET)
Message-Id: <ca6b5e2b87d9e0c9edb361227bb45c29b3ceeff6.1675193329.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1675193329.git.balaton@eik.bme.hu>
References: <cover.1675193329.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 6/6] usb/ohci: Implement resume on connection status change
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Howard Spoelstra <hsp.cat7@gmail.com>
Date: Tue, 31 Jan 2023 20:36:17 +0100 (CET)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

If certain bit is set remote wake up should change state from
suspended to resume and generate interrupt. There was a todo comment
for this, implement that by moving existing resume logic to a function
and call that.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/usb/hcd-ohci.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index c5bec4e4d7..7f98ab8924 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -1401,6 +1401,18 @@ static void ohci_set_hub_status(OHCIState *ohci, uint32_t val)
     }
 }
 
+/* This is the one state transition the controller can do by itself */
+static int ohci_resume(OHCIState *s)
+{
+    if ((s->ctl & OHCI_CTL_HCFS) == OHCI_USB_SUSPEND) {
+        trace_usb_ohci_remote_wakeup(s->name);
+        s->ctl &= ~OHCI_CTL_HCFS;
+        s->ctl |= OHCI_USB_RESUME;
+        return 1;
+    }
+    return 0;
+}
+
 /*
  * Sets a flag in a port status reg but only set it if the port is connected.
  * If not set ConnectStatusChange flag. If flag is enabled return 1.
@@ -1417,7 +1429,10 @@ static int ohci_port_set_if_connected(OHCIState *ohci, int i, uint32_t val)
     if (!(ohci->rhport[i].ctrl & OHCI_PORT_CCS)) {
         ohci->rhport[i].ctrl |= OHCI_PORT_CSC;
         if (ohci->rhstatus & OHCI_RHS_DRWE) {
-            /* TODO: CSC is a wakeup event */
+            /* CSC is a wakeup event */
+            if (ohci_resume(ohci)) {
+                ohci_set_interrupt(ohci, OHCI_INTR_RD);
+            }
         }
         return 0;
     }
@@ -1820,11 +1835,7 @@ static void ohci_wakeup(USBPort *port1)
         intr = OHCI_INTR_RHSC;
     }
     /* Note that the controller can be suspended even if this port is not */
-    if ((s->ctl & OHCI_CTL_HCFS) == OHCI_USB_SUSPEND) {
-        trace_usb_ohci_remote_wakeup(s->name);
-        /* This is the one state transition the controller can do by itself */
-        s->ctl &= ~OHCI_CTL_HCFS;
-        s->ctl |= OHCI_USB_RESUME;
+    if (ohci_resume(s)) {
         /*
          * In suspend mode only ResumeDetected is possible, not RHSC:
          * see the OHCI spec 5.1.2.3.
-- 
2.30.6


