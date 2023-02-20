Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FCA69D2A8
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:20:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUAlN-0003vS-0y; Mon, 20 Feb 2023 13:19:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUAlA-0003sw-2A
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:19:32 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUAky-0008E7-V0
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:19:28 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7B5207470B2;
 Mon, 20 Feb 2023 19:19:07 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 47F347470AB; Mon, 20 Feb 2023 19:19:07 +0100 (CET)
Message-Id: <aaa3ddee99c7677d6cc137f637982e94267b99b6.1676916640.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1676916639.git.balaton@eik.bme.hu>
References: <cover.1676916639.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 3/7] usb/ohci: Code style fix missing braces and extra
 parenthesis
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org
Date: Mon, 20 Feb 2023 19:19:07 +0100 (CET)
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

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/usb/hcd-ohci.c | 106 ++++++++++++++++++++++++++--------------------
 1 file changed, 60 insertions(+), 46 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index b8f8fd048d..a2cdba4058 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -499,9 +499,9 @@ static int ohci_copy_td(OHCIState *ohci, struct ohci_td *td,
 
     ptr = td->cbp;
     n = 0x1000 - (ptr & 0xfff);
-    if (n > len)
+    if (n > len) {
         n = len;
-
+    }
     if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf,
                       n, dir, MEMTXATTRS_UNSPECIFIED)) {
         return -1;
@@ -527,9 +527,9 @@ static int ohci_copy_iso_td(OHCIState *ohci,
 
     ptr = start_addr;
     n = 0x1000 - (ptr & 0xfff);
-    if (n > len)
+    if (n > len) {
         n = len;
-
+    }
     if (dma_memory_rw(ohci->as, ptr + ohci->localmem_base, buf,
                       n, dir, MEMTXATTRS_UNSPECIFIED)) {
         return -1;
@@ -617,8 +617,9 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed)
         iso_td.next = ohci->done;
         ohci->done = addr;
         i = OHCI_BM(iso_td.flags, TD_DI);
-        if (i < ohci->done_count)
+        if (i < ohci->done_count) {
             ohci->done_count = i;
+        }
         if (ohci_put_iso_td(ohci, addr, &iso_td)) {
             ohci_die(ohci);
             return 1;
@@ -803,8 +804,9 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed)
         iso_td.next = ohci->done;
         ohci->done = addr;
         i = OHCI_BM(iso_td.flags, TD_DI);
-        if (i < ohci->done_count)
+        if (i < ohci->done_count) {
             ohci->done_count = i;
+        }
     }
     if (ohci_put_iso_td(ohci, addr, &iso_td)) {
         ohci_die(ohci);
@@ -1022,8 +1024,9 @@ static int ohci_service_td(OHCIState *ohci, struct ohci_ed *ed)
 
         /* Setting ED_C is part of the TD retirement process */
         ed->head &= ~OHCI_ED_C;
-        if (td.flags & OHCI_TD_T0)
+        if (td.flags & OHCI_TD_T0) {
             ed->head |= OHCI_ED_C;
+        }
     } else {
         if (ret >= 0) {
             trace_usb_ohci_td_underrun();
@@ -1067,8 +1070,9 @@ static int ohci_service_td(OHCIState *ohci, struct ohci_ed *ed)
     td.next = ohci->done;
     ohci->done = addr;
     i = OHCI_BM(td.flags, TD_DI);
-    if (i < ohci->done_count)
+    if (i < ohci->done_count) {
         ohci->done_count = i;
+    }
 exit_no_retire:
     if (ohci_put_td(ohci, addr, &td)) {
         ohci_die(ohci);
@@ -1087,9 +1091,9 @@ static int ohci_service_ed_list(OHCIState *ohci, uint32_t head)
     uint32_t link_cnt = 0;
     active = 0;
 
-    if (head == 0)
+    if (head == 0) {
         return 0;
-
+    }
     for (cur = head; cur && link_cnt++ < ED_LINK_LIMIT; cur = next_ed) {
         if (ohci_read_ed(ohci, cur, &ed)) {
             trace_usb_ohci_ed_read_error(cur);
@@ -1125,8 +1129,9 @@ static int ohci_service_ed_list(OHCIState *ohci, uint32_t head)
             active = 1;
 
             if ((ed.flags & OHCI_ED_F) == 0) {
-                if (ohci_service_td(ohci, &ed))
+                if (ohci_service_td(ohci, &ed)) {
                     break;
+                }
             } else {
                 /* Handle isochronous endpoints */
                 if (ohci_service_iso_td(ohci, &ed)) {
@@ -1218,19 +1223,21 @@ static void ohci_frame_boundary(void *opaque)
     hcca.frame = cpu_to_le16(ohci->frame_number);
 
     if (ohci->done_count == 0 && !(ohci->intr_status & OHCI_INTR_WD)) {
-        if (!ohci->done)
+        if (!ohci->done) {
             abort();
-        if (ohci->intr & ohci->intr_status)
+        }
+        if (ohci->intr & ohci->intr_status) {
             ohci->done |= 1;
+        }
         hcca.done = cpu_to_le32(ohci->done);
         ohci->done = 0;
         ohci->done_count = 7;
         ohci_set_interrupt(ohci, OHCI_INTR_WD);
     }
 
-    if (ohci->done_count != 7 && ohci->done_count != 0)
+    if (ohci->done_count != 7 && ohci->done_count != 0) {
         ohci->done_count--;
-
+    }
     /* Do SOF stuff here */
     ohci_sof(ohci);
 
@@ -1273,9 +1280,9 @@ static int ohci_port_set_if_connected(OHCIState *ohci, int i, uint32_t val)
     int ret = 1;
 
     /* writing a 0 has no effect */
-    if (val == 0)
+    if (val == 0) {
         return 0;
-
+    }
     /* If CurrentConnectStatus is cleared we set ConnectStatusChange */
     if (!(ohci->rhport[i].ctrl & OHCI_PORT_CCS)) {
         ohci->rhport[i].ctrl |= OHCI_PORT_CSC;
@@ -1285,9 +1292,9 @@ static int ohci_port_set_if_connected(OHCIState *ohci, int i, uint32_t val)
         return 0;
     }
 
-    if (ohci->rhport[i].ctrl & val)
+    if (ohci->rhport[i].ctrl & val) {
         ret = 0;
-
+    }
     /* set the bit */
     ohci->rhport[i].ctrl |= val;
 
@@ -1327,9 +1334,9 @@ static void ohci_set_ctl(OHCIState *ohci, uint32_t val)
     new_state = ohci->ctl & OHCI_CTL_HCFS;
 
     /* no state change */
-    if (old_state == new_state)
+    if (old_state == new_state) {
         return;
-
+    }
     trace_usb_ohci_set_ctl(ohci->name, new_state);
     switch (new_state) {
     case OHCI_USB_OPERATIONAL:
@@ -1355,9 +1362,9 @@ static uint32_t ohci_get_frame_remaining(OHCIState *ohci)
     uint16_t fr;
     int64_t tks;
 
-    if ((ohci->ctl & OHCI_CTL_HCFS) != OHCI_USB_OPERATIONAL)
-        return (ohci->frt << 31);
-
+    if ((ohci->ctl & OHCI_CTL_HCFS) != OHCI_USB_OPERATIONAL) {
+        return ohci->frt << 31;
+    }
     /* Being in USB operational state guarnatees sof_time was set already. */
     tks = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - ohci->sof_time;
     if (tks < 0) {
@@ -1365,9 +1372,9 @@ static uint32_t ohci_get_frame_remaining(OHCIState *ohci)
     }
 
     /* avoid muldiv if possible */
-    if (tks >= usb_frame_time)
-        return (ohci->frt << 31);
-
+    if (tks >= usb_frame_time) {
+        return ohci->frt << 31;
+    }
     tks = tks / usb_bit_time;
     fr = (uint16_t)(ohci->fi - tks);
 
@@ -1383,33 +1390,36 @@ static void ohci_set_hub_status(OHCIState *ohci, uint32_t val)
     old_state = ohci->rhstatus;
 
     /* write 1 to clear OCIC */
-    if (val & OHCI_RHS_OCIC)
+    if (val & OHCI_RHS_OCIC) {
         ohci->rhstatus &= ~OHCI_RHS_OCIC;
-
+    }
     if (val & OHCI_RHS_LPS) {
         int i;
 
-        for (i = 0; i < ohci->num_ports; i++)
+        for (i = 0; i < ohci->num_ports; i++) {
             ohci_port_power(ohci, i, 0);
+        }
         trace_usb_ohci_hub_power_down();
     }
 
     if (val & OHCI_RHS_LPSC) {
         int i;
 
-        for (i = 0; i < ohci->num_ports; i++)
+        for (i = 0; i < ohci->num_ports; i++) {
             ohci_port_power(ohci, i, 1);
+        }
         trace_usb_ohci_hub_power_up();
     }
 
-    if (val & OHCI_RHS_DRWE)
+    if (val & OHCI_RHS_DRWE) {
         ohci->rhstatus |= OHCI_RHS_DRWE;
-
-    if (val & OHCI_RHS_CRWE)
+    }
+    if (val & OHCI_RHS_CRWE) {
         ohci->rhstatus &= ~OHCI_RHS_DRWE;
-
-    if (old_state != ohci->rhstatus)
+    }
+    if (old_state != ohci->rhstatus) {
         ohci_set_interrupt(ohci, OHCI_INTR_RHSC);
+    }
 }
 
 /* Set root hub port status */
@@ -1422,12 +1432,12 @@ static void ohci_port_set_status(OHCIState *ohci, int portnum, uint32_t val)
     old_state = port->ctrl;
 
     /* Write to clear CSC, PESC, PSSC, OCIC, PRSC */
-    if (val & OHCI_PORT_WTC)
+    if (val & OHCI_PORT_WTC) {
         port->ctrl &= ~(val & OHCI_PORT_WTC);
-
-    if (val & OHCI_PORT_CCS)
+    }
+    if (val & OHCI_PORT_CCS) {
         port->ctrl &= ~OHCI_PORT_PES;
-
+    }
     ohci_port_set_if_connected(ohci, portnum, val & OHCI_PORT_PES);
 
     if (ohci_port_set_if_connected(ohci, portnum, val & OHCI_PORT_PSS)) {
@@ -1443,13 +1453,15 @@ static void ohci_port_set_status(OHCIState *ohci, int portnum, uint32_t val)
     }
 
     /* Invert order here to ensure in ambiguous case, device is powered up. */
-    if (val & OHCI_PORT_LSDA)
+    if (val & OHCI_PORT_LSDA) {
         ohci_port_power(ohci, portnum, 0);
-    if (val & OHCI_PORT_PPS)
+    }
+    if (val & OHCI_PORT_PPS) {
         ohci_port_power(ohci, portnum, 1);
-
-    if (old_state != port->ctrl)
+    }
+    if (old_state != port->ctrl) {
         ohci_set_interrupt(ohci, OHCI_INTR_RHSC);
+    }
 }
 
 static uint64_t ohci_mem_read(void *opaque,
@@ -1606,8 +1618,9 @@ static void ohci_mem_write(void *opaque,
         /* Bits written as '0' remain unchanged in the register */
         ohci->status |= val;
 
-        if (ohci->status & OHCI_STATUS_HCR)
+        if (ohci->status & OHCI_STATUS_HCR) {
             ohci_soft_reset(ohci);
+        }
         break;
 
     case 3: /* HcInterruptStatus */
@@ -1685,8 +1698,9 @@ static void ohci_mem_write(void *opaque,
 
     case 25: /* HcHReset */
         ohci->hreset = val & ~OHCI_HRESET_FSBIR;
-        if (val & OHCI_HRESET_FSBIR)
+        if (val & OHCI_HRESET_FSBIR) {
             ohci_hard_reset(ohci);
+        }
         break;
 
     case 26: /* HcHInterruptEnable */
-- 
2.30.7


