Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D8D49B789
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 16:27:00 +0100 (CET)
Received: from localhost ([::1]:37140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCNil-00071T-EC
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 10:26:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nCM5w-0006Xc-II
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 08:42:52 -0500
Received: from [2001:738:2001:2001::2001] (port=53384 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nCM5u-0000IF-VC
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 08:42:48 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C82FE7456E3;
 Tue, 25 Jan 2022 14:42:30 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 54CEF74632B; Tue, 25 Jan 2022 14:42:18 +0100 (CET)
Message-Id: <ce766722506bfd7145cccbec750692ff57072280.1643117600.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1643117600.git.balaton@eik.bme.hu>
References: <cover.1643117600.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 2/5] usb/ohci: Move cancelling async packet to
 ohci_stop_endpoints()
Date: Tue, 25 Jan 2022 14:33:20 +0100
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

This is always done before calling this function so remove duplicated
code and do it within the function at one place.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/usb/hcd-ohci.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index f915cc5473..6d762973eb 100644
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
 
@@ -1277,10 +1277,6 @@ static void ohci_frame_boundary(void *opaque)
 
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
2.30.2


