Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553714CD6BB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:48:26 +0100 (CET)
Received: from localhost ([::1]:54778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9EH-00015F-4k
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:48:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8pX-0001oD-UF
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:22:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8pW-0000Nz-2L
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:22:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646403769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1MnnL79aZQCXXDFaQnWXnSPY4kihmAYEB3BQdjZSKdA=;
 b=SziKUfM/RdbzaB1TYklSvjOrsW2iqbmQTcZZInNFlhV3zwKgmjsV3Kch12MCEaZH2jHrCW
 YJXz3vx8+y3anozhuNF0rhEVs3txubEP37jOLv74r1M46B3F65ufMGYRVtLDYyvLORUSoI
 lSzW/HEBzHTSoUozO2dHJ85ZpuKDF6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-sRhndiq5Mumc-xSD2244PA-1; Fri, 04 Mar 2022 09:22:46 -0500
X-MC-Unique: sRhndiq5Mumc-xSD2244PA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EFDB1006AA6;
 Fri,  4 Mar 2022 14:22:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B80C779903;
 Fri,  4 Mar 2022 14:22:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2E7CB180092D; Fri,  4 Mar 2022 15:21:24 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/35] usb/ohci: Don't use packet from OHCIState for
 isochronous transfers
Date: Fri,  4 Mar 2022 15:20:55 +0100
Message-Id: <20220304142123.956171-8-kraxel@redhat.com>
In-Reply-To: <20220304142123.956171-1-kraxel@redhat.com>
References: <20220304142123.956171-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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

Since isochronous transfers cannot be handled async (the function
returns error in that case) we don't need to remember the packet.
Avoid using the usb_packet field in OHCIState (as that can be a
waiting async packet on another endpoint) and allocate and use a local
USBPacket for the iso transfer instead. After this we don't have to
care if we're called from a completion callback or not so we can drop
that parameter as well.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <bf523d40f8088a84383cb00ffd2e6e82fa47790d.1643117600.git.balaton@eik.bme.hu>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-ohci.c | 71 +++++++++++++++++++++++++----------------------
 1 file changed, 38 insertions(+), 33 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 09d07367cc09..895b29fb8657 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -548,8 +548,7 @@ static int ohci_copy_iso_td(OHCIState *ohci,
 
 #define USUB(a, b) ((int16_t)((uint16_t)(a) - (uint16_t)(b)))
 
-static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed,
-                               int completion)
+static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed)
 {
     int dir;
     size_t len = 0;
@@ -559,6 +558,9 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed,
     int i;
     USBDevice *dev;
     USBEndpoint *ep;
+    USBPacket *pkt;
+    uint8_t buf[8192];
+    bool int_req;
     struct ohci_iso_td iso_td;
     uint32_t addr;
     uint16_t starting_frame;
@@ -693,40 +695,42 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed,
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
@@ -734,7 +738,7 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed,
     /* Writeback */
     if (dir == OHCI_TD_DIR_IN && ret >= 0 && ret <= len) {
         /* IN transfer succeeded */
-        if (ohci_copy_iso_td(ohci, start_addr, end_addr, ohci->usb_buf, ret,
+        if (ohci_copy_iso_td(ohci, start_addr, end_addr, buf, ret,
                              DMA_DIRECTION_FROM_DEVICE)) {
             ohci_die(ohci);
             return 1;
@@ -1057,7 +1061,7 @@ exit_no_retire:
 }
 
 /* Service an endpoint list.  Returns nonzero if active TD were found.  */
-static int ohci_service_ed_list(OHCIState *ohci, uint32_t head, int completion)
+static int ohci_service_ed_list(OHCIState *ohci, uint32_t head)
 {
     struct ohci_ed ed;
     uint32_t next_ed;
@@ -1108,8 +1112,9 @@ static int ohci_service_ed_list(OHCIState *ohci, uint32_t head, int completion)
                     break;
             } else {
                 /* Handle isochronous endpoints */
-                if (ohci_service_iso_td(ohci, &ed, completion))
+                if (ohci_service_iso_td(ohci, &ed)) {
                     break;
+                }
             }
         }
 
@@ -1136,20 +1141,20 @@ static void ohci_sof(OHCIState *ohci)
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
@@ -1173,7 +1178,7 @@ static void ohci_frame_boundary(void *opaque)
         int n;
 
         n = ohci->frame_number & 0x1f;
-        ohci_service_ed_list(ohci, le32_to_cpu(hcca.intr[n]), 0);
+        ohci_service_ed_list(ohci, le32_to_cpu(hcca.intr[n]));
     }
 
     /* Cancel all pending packets if either of the lists has been disabled.  */
@@ -1181,7 +1186,7 @@ static void ohci_frame_boundary(void *opaque)
         ohci_stop_endpoints(ohci);
     }
     ohci->old_ctl = ohci->ctl;
-    ohci_process_lists(ohci, 0);
+    ohci_process_lists(ohci);
 
     /* Stop if UnrecoverableError happened or ohci_sof will crash */
     if (ohci->intr_status & OHCI_INTR_UE) {
@@ -1794,7 +1799,7 @@ static void ohci_async_complete_packet(USBPort *port, USBPacket *packet)
 
     trace_usb_ohci_async_complete();
     ohci->async_complete = true;
-    ohci_process_lists(ohci, 1);
+    ohci_process_lists(ohci);
 }
 
 static USBPortOps ohci_port_ops = {
-- 
2.35.1


