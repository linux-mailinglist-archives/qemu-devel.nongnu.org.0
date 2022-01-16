Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156A448FD44
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jan 2022 14:46:18 +0100 (CET)
Received: from localhost ([::1]:33874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n95rN-0007jm-6q
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 08:46:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n95in-0000kf-7C
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 08:37:25 -0500
Received: from [2001:738:2001:2001::2001] (port=53160 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n95ik-0001h0-DF
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 08:37:24 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 711EA7470C2;
 Sun, 16 Jan 2022 14:37:19 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 46BCC7470BA; Sun, 16 Jan 2022 14:37:19 +0100 (CET)
Message-Id: <a207b2537c1547e0983d66afe6d9471245f9230b.1642339238.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1642339238.git.balaton@eik.bme.hu>
References: <cover.1642339238.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 4/5] usb/ohci: Merge ohci_async_cancel_device() into
 ohci_child_detach()
Date: Sun, 16 Jan 2022 14:20:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

These two do the same and only used once so no need to have two
functions, simplify by merging them.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/usb/hcd-ohci.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index d1907afd3f..e87f5bd813 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -1725,8 +1725,10 @@ static void ohci_attach(USBPort *port1)
     }
 }
 
-static void ohci_async_cancel_device(OHCIState *ohci, USBDevice *dev)
+static void ohci_child_detach(USBPort *port1, USBDevice *dev)
 {
+    OHCIState *ohci = port1->opaque;
+
     if (ohci->async_td &&
         usb_packet_is_inflight(&ohci->usb_packet) &&
         ohci->usb_packet.ep->dev == dev) {
@@ -1735,20 +1737,13 @@ static void ohci_async_cancel_device(OHCIState *ohci, USBDevice *dev)
     }
 }
 
-static void ohci_child_detach(USBPort *port1, USBDevice *child)
-{
-    OHCIState *s = port1->opaque;
-
-    ohci_async_cancel_device(s, child);
-}
-
 static void ohci_detach(USBPort *port1)
 {
     OHCIState *s = port1->opaque;
     OHCIPort *port = &s->rhport[port1->index];
     uint32_t old_state = port->ctrl;
 
-    ohci_async_cancel_device(s, port1->dev);
+    ohci_child_detach(port1, port1->dev);
 
     /* set connect status */
     if (port->ctrl & OHCI_PORT_CCS) {
-- 
2.30.2


