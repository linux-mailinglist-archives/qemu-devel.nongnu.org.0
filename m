Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D0141F6CF
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 23:20:55 +0200 (CEST)
Received: from localhost ([::1]:35182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWPxe-0004fl-Hf
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 17:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mWPti-0001dc-6O
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 17:16:50 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:46257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mWPte-0007v5-7o
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 17:16:49 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 02F09748F5D;
 Fri,  1 Oct 2021 23:16:43 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 84A71748F4E; Fri,  1 Oct 2021 23:16:42 +0200 (CEST)
Message-Id: <457b7ce06f15f982441572ac7c0576432ee227dc.1633122670.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1633122670.git.balaton@eik.bme.hu>
References: <cover.1633122670.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [RFC PATCH 1/4] usb/ohci: Move cancelling async packet to
 ohci_stop_endpoints()
Date: Fri, 01 Oct 2021 23:11:10 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
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

This is always done before calling this function so remove duplicated
code and do it within the function at one place.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/usb/hcd-ohci.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 1cf2816772..405abbb62d 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -369,6 +369,10 @@ void ohci_stop_endpoints(OHCIState *ohci)
     USBDevice *dev;
     int i, j;
 
+    if (ohci->async_td) {
+        usb_cancel_packet(&ohci->usb_packet);
+        ohci->async_td = 0;
+    }
     for (i = 0; i < ohci->num_ports; i++) {
         dev = ohci->rhport[i].port.dev;
         if (dev && dev->attached) {
@@ -398,10 +402,6 @@ static void ohci_roothub_reset(OHCIState *ohci)
             usb_port_reset(&port->port);
         }
     }
-    if (ohci->async_td) {
-        usb_cancel_packet(&ohci->usb_packet);
-        ohci->async_td = 0;
-    }
     ohci_stop_endpoints(ohci);
 }
 
@@ -1271,10 +1271,6 @@ static void ohci_frame_boundary(void *opaque)
 
     /* Cancel all pending packets if either of the lists has been disabled.  */
     if (ohci->old_ctl & (~ohci->ctl) & (OHCI_CTL_BLE | OHCI_CTL_CLE)) {
-        if (ohci->async_td) {
-            usb_cancel_packet(&ohci->usb_packet);
-            ohci->async_td = 0;
-        }
         ohci_stop_endpoints(ohci);
     }
     ohci->old_ctl = ohci->ctl;
-- 
2.21.4


