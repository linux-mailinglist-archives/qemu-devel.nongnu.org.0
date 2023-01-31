Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BC46836B7
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 20:39:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMwSu-0006u0-5K; Tue, 31 Jan 2023 14:38:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pMwSr-0006sA-0G
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 14:38:45 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pMwSp-0003KJ-BY
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 14:38:44 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3CE7F74635C;
 Tue, 31 Jan 2023 20:36:15 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1A1B8745712; Tue, 31 Jan 2023 20:36:15 +0100 (CET)
Message-Id: <b9ce7922d0b226065e1d1eeed2e37759c9bd7e30.1675193329.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1675193329.git.balaton@eik.bme.hu>
References: <cover.1675193329.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 4/6] usb/ohci: Move a function next to where it is used
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Howard Spoelstra <hsp.cat7@gmail.com>
Date: Tue, 31 Jan 2023 20:36:15 +0100 (CET)
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

The ohci_port_set_if_connected() function is only used by
ohci_port_set_status(), move next to it to have them at the same place.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/usb/hcd-ohci.c | 60 +++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index c262418181..c5306378cc 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -1271,36 +1271,6 @@ void ohci_bus_stop(OHCIState *ohci)
     timer_del(ohci->eof_timer);
 }
 
-/*
- * Sets a flag in a port status reg but only set it if the port is connected.
- * If not set ConnectStatusChange flag. If flag is enabled return 1.
- */
-static int ohci_port_set_if_connected(OHCIState *ohci, int i, uint32_t val)
-{
-    int ret = 1;
-
-    /* writing a 0 has no effect */
-    if (val == 0) {
-        return 0;
-    }
-    /* If CurrentConnectStatus is cleared we set ConnectStatusChange */
-    if (!(ohci->rhport[i].ctrl & OHCI_PORT_CCS)) {
-        ohci->rhport[i].ctrl |= OHCI_PORT_CSC;
-        if (ohci->rhstatus & OHCI_RHS_DRWE) {
-            /* TODO: CSC is a wakeup event */
-        }
-        return 0;
-    }
-
-    if (ohci->rhport[i].ctrl & val) {
-        ret = 0;
-    }
-    /* set the bit */
-    ohci->rhport[i].ctrl |= val;
-
-    return ret;
-}
-
 /* Frame interval toggle is manipulated by the hcd only */
 static void ohci_set_frame_interval(OHCIState *ohci, uint16_t val)
 {
@@ -1422,6 +1392,36 @@ static void ohci_set_hub_status(OHCIState *ohci, uint32_t val)
     }
 }
 
+/*
+ * Sets a flag in a port status reg but only set it if the port is connected.
+ * If not set ConnectStatusChange flag. If flag is enabled return 1.
+ */
+static int ohci_port_set_if_connected(OHCIState *ohci, int i, uint32_t val)
+{
+    int ret = 1;
+
+    /* writing a 0 has no effect */
+    if (val == 0) {
+        return 0;
+    }
+    /* If CurrentConnectStatus is cleared we set ConnectStatusChange */
+    if (!(ohci->rhport[i].ctrl & OHCI_PORT_CCS)) {
+        ohci->rhport[i].ctrl |= OHCI_PORT_CSC;
+        if (ohci->rhstatus & OHCI_RHS_DRWE) {
+            /* TODO: CSC is a wakeup event */
+        }
+        return 0;
+    }
+
+    if (ohci->rhport[i].ctrl & val) {
+        ret = 0;
+    }
+    /* set the bit */
+    ohci->rhport[i].ctrl |= val;
+
+    return ret;
+}
+
 /* Set root hub port status */
 static void ohci_port_set_status(OHCIState *ohci, int portnum, uint32_t val)
 {
-- 
2.30.6


