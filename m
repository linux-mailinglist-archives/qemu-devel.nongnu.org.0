Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E1741F6D0
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 23:20:55 +0200 (CEST)
Received: from localhost ([::1]:35206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWPxe-0004gL-Ut
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 17:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mWPtw-0001yl-6f
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 17:17:04 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:46268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mWPti-00084D-Q1
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 17:17:03 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 86B9D748F4E;
 Fri,  1 Oct 2021 23:16:49 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 910BF748F5A; Fri,  1 Oct 2021 23:16:42 +0200 (CEST)
Message-Id: <3b131f4b448feed92422602a2b1cfe9a2d302810.1633122670.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1633122670.git.balaton@eik.bme.hu>
References: <cover.1633122670.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [RFC PATCH 3/4] usb/ohci: Merge ohci_async_cancel_device() into
 ohci_child_detach()
Date: Fri, 01 Oct 2021 23:11:10 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These two do the same and only used once so no need to have two
functions, simplify by merging them.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/usb/hcd-ohci.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index f8761370e3..212d0aabbe 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -1719,8 +1719,10 @@ static void ohci_attach(USBPort *port1)
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
@@ -1729,20 +1731,13 @@ static void ohci_async_cancel_device(OHCIState *ohci, USBDevice *dev)
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
2.21.4


