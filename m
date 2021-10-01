Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB7741F6D4
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 23:23:02 +0200 (CEST)
Received: from localhost ([::1]:41438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWPzg-0000e0-J0
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 17:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mWPti-0001e2-AJ
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 17:16:50 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:46259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mWPte-0007v8-Ig
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 17:16:50 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E26A7748F58;
 Fri,  1 Oct 2021 23:16:42 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 976D7748F4F; Fri,  1 Oct 2021 23:16:42 +0200 (CEST)
Message-Id: <ba152156c87768b4b8c4f591faf427d326da4f74.1633122670.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1633122670.git.balaton@eik.bme.hu>
References: <cover.1633122670.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [RFC PATCH 4/4] usb/ohci: Don't use packet from OHCIState for
 isochronous transfers
Date: Fri, 01 Oct 2021 23:11:10 +0200
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

Since isochronous transfers cannot be handled async (the function
returns error in that case) we don't need to remember the packet.
Avoid using the usb_pkt in OHCIState (as that can be a waiting async
packet on another endpoint) and allocate and use a local USBPacket for
the iso transfer instead. After this we don't have to care if we're
called from a completion callback or not so we can drop that parameter
as well.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/usb/hcd-ohci.c | 70 +++++++++++++++++++++++++----------------------
 1 file changed, 37 insertions(+), 33 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 212d0aabbe..18170e7256 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -542,8 +542,7 @@ static int ohci_copy_iso_td(OHCIState *ohci,
 
 #define USUB(a, b) ((int16_t)((uint16_t)(a) - (uint16_t)(b)))
 
-static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed,
-                               int completion)
+static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed)
 {
     int dir;
     size_t len = 0;
@@ -553,6 +552,9 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed,
     int i;
     USBDevice *dev;
     USBEndpoint *ep;
+    USBPacket *pkt;
+    uint8_t buf[8192];
+    bool int_req;
     struct ohci_iso_td iso_td;
     uint32_t addr;
     uint16_t starting_frame;
@@ -687,40 +689,42 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed,
     } else {
         len = end_addr - start_addr + 1;
     }
-    if (len > sizeof(ohci->usb_buf)) {
-        len = sizeof(ohci->usb_buf);
+    if (len > sizeof(buf)) {
+        len = sizeof(buf);
     }
 
     if (len && dir != OHCI_TD_DIR_IN) {
-        if (ohci_copy_iso_td(ohci, start_addr, end_addr, ohci->usb_buf, len,
+        if (ohci_copy_iso_td(ohci, start_addr, end_addr, buf, len,
                              DMA_DIRECTION_TO_DEVICE)) {
             ohci_die(ohci);
             return 1;
         }
     }
 
-    if (!completion) {
-        bool int_req = relative_frame_number == frame_count &&
-                       OHCI_BM(iso_td.flags, TD_DI) == 0;
-        dev = ohci_find_device(ohci, OHCI_BM(ed->flags, ED_FA));
-        if (dev == NULL) {
-            trace_usb_ohci_td_dev_error();
-            return 1;
-        }
-        ep = usb_ep_get(dev, pid, OHCI_BM(ed->flags, ED_EN));
-        usb_packet_setup(&ohci->usb_packet, pid, ep, 0, addr, false, int_req);
-        usb_packet_addbuf(&ohci->usb_packet, ohci->usb_buf, len);
-        usb_handle_packet(dev, &ohci->usb_packet);
-        if (ohci->usb_packet.status == USB_RET_ASYNC) {
-            usb_device_flush_ep_queue(dev, ep);
-            return 1;
-        }
+    dev = ohci_find_device(ohci, OHCI_BM(ed->flags, ED_FA));
+    if (dev == NULL) {
+        trace_usb_ohci_td_dev_error();
+        return 1;
     }
-    if (ohci->usb_packet.status == USB_RET_SUCCESS) {
-        ret = ohci->usb_packet.actual_length;
+    ep = usb_ep_get(dev, pid, OHCI_BM(ed->flags, ED_EN));
+    pkt = g_new0(USBPacket, 1);
+    usb_packet_init(pkt);
+    int_req = relative_frame_number == frame_count &&
+              OHCI_BM(iso_td.flags, TD_DI) == 0;
+    usb_packet_setup(pkt, pid, ep, 0, addr, false, int_req);
+    usb_packet_addbuf(pkt, buf, len);
+    usb_handle_packet(dev, pkt);
+    if (pkt->status == USB_RET_ASYNC) {
+        usb_device_flush_ep_queue(dev, ep);
+        g_free(pkt);
+        return 1;
+    }
+    if (pkt->status == USB_RET_SUCCESS) {
+        ret = pkt->actual_length;
     } else {
-        ret = ohci->usb_packet.status;
+        ret = pkt->status;
     }
+    g_free(pkt);
 
     trace_usb_ohci_iso_td_so(start_offset, end_offset, start_addr, end_addr,
                              str, len, ret);
@@ -728,7 +732,7 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed,
     /* Writeback */
     if (dir == OHCI_TD_DIR_IN && ret >= 0 && ret <= len) {
         /* IN transfer succeeded */
-        if (ohci_copy_iso_td(ohci, start_addr, end_addr, ohci->usb_buf, ret,
+        if (ohci_copy_iso_td(ohci, start_addr, end_addr, buf, ret,
                              DMA_DIRECTION_FROM_DEVICE)) {
             ohci_die(ohci);
             return 1;
@@ -1051,7 +1055,7 @@ exit_no_retire:
 }
 
 /* Service an endpoint list.  Returns nonzero if active TD were found.  */
-static int ohci_service_ed_list(OHCIState *ohci, uint32_t head, int completion)
+static int ohci_service_ed_list(OHCIState *ohci, uint32_t head)
 {
     struct ohci_ed ed;
     uint32_t next_ed;
@@ -1102,7 +1106,7 @@ static int ohci_service_ed_list(OHCIState *ohci, uint32_t head, int completion)
                     break;
             } else {
                 /* Handle isochronous endpoints */
-                if (ohci_service_iso_td(ohci, &ed, completion))
+                if (ohci_service_iso_td(ohci, &ed))
                     break;
             }
         }
@@ -1130,20 +1134,20 @@ static void ohci_sof(OHCIState *ohci)
 }
 
 /* Process Control and Bulk lists.  */
-static void ohci_process_lists(OHCIState *ohci, int completion)
+static void ohci_process_lists(OHCIState *ohci)
 {
     if ((ohci->ctl & OHCI_CTL_CLE) && (ohci->status & OHCI_STATUS_CLF)) {
         if (ohci->ctrl_cur && ohci->ctrl_cur != ohci->ctrl_head) {
             trace_usb_ohci_process_lists(ohci->ctrl_head, ohci->ctrl_cur);
         }
-        if (!ohci_service_ed_list(ohci, ohci->ctrl_head, completion)) {
+        if (!ohci_service_ed_list(ohci, ohci->ctrl_head)) {
             ohci->ctrl_cur = 0;
             ohci->status &= ~OHCI_STATUS_CLF;
         }
     }
 
     if ((ohci->ctl & OHCI_CTL_BLE) && (ohci->status & OHCI_STATUS_BLF)) {
-        if (!ohci_service_ed_list(ohci, ohci->bulk_head, completion)) {
+        if (!ohci_service_ed_list(ohci, ohci->bulk_head)) {
             ohci->bulk_cur = 0;
             ohci->status &= ~OHCI_STATUS_BLF;
         }
@@ -1167,7 +1171,7 @@ static void ohci_frame_boundary(void *opaque)
         int n;
 
         n = ohci->frame_number & 0x1f;
-        ohci_service_ed_list(ohci, le32_to_cpu(hcca.intr[n]), 0);
+        ohci_service_ed_list(ohci, le32_to_cpu(hcca.intr[n]));
     }
 
     /* Cancel all pending packets if either of the lists has been disabled.  */
@@ -1175,7 +1179,7 @@ static void ohci_frame_boundary(void *opaque)
         ohci_stop_endpoints(ohci);
     }
     ohci->old_ctl = ohci->ctl;
-    ohci_process_lists(ohci, 0);
+    ohci_process_lists(ohci);
 
     /* Stop if UnrecoverableError happened or ohci_sof will crash */
     if (ohci->intr_status & OHCI_INTR_UE) {
@@ -1787,7 +1791,7 @@ static void ohci_async_complete_packet(USBPort *port, USBPacket *packet)
 
     trace_usb_ohci_async_complete();
     ohci->async_complete = true;
-    ohci_process_lists(ohci, 1);
+    ohci_process_lists(ohci);
 }
 
 static USBPortOps ohci_port_ops = {
-- 
2.21.4


