Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBE748FD37
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jan 2022 14:42:42 +0100 (CET)
Received: from localhost ([::1]:55590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n95ns-0003OG-Oo
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 08:42:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n95im-0000je-CR
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 08:37:24 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:53165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n95ik-0001h5-2T
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 08:37:23 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id ABEBA7470C9;
 Sun, 16 Jan 2022 14:37:19 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3EE447470BB; Sun, 16 Jan 2022 14:37:19 +0100 (CET)
Message-Id: <291c729fb55d31b9291d25353dbae29bc93430ed.1642339238.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1642339238.git.balaton@eik.bme.hu>
References: <cover.1642339238.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 2/5] usb/ohci: Move cancelling async packet to
 ohci_stop_endpoints()
Date: Sun, 16 Jan 2022 14:20:40 +0100
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


