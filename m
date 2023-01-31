Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6976836B5
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 20:39:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMwSw-0006vR-6K; Tue, 31 Jan 2023 14:38:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pMwSs-0006sV-1s
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 14:38:46 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pMwSq-0003Kc-EV
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 14:38:45 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4C534745712;
 Tue, 31 Jan 2023 20:36:16 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2684C746376; Tue, 31 Jan 2023 20:36:16 +0100 (CET)
Message-Id: <6c788d629e8caef69041f8fbb18bfe169285b58e.1675193329.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1675193329.git.balaton@eik.bme.hu>
References: <cover.1675193329.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 5/6] usb/ohci: Add trace points for register access
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Howard Spoelstra <hsp.cat7@gmail.com>
Date: Tue, 31 Jan 2023 20:36:16 +0100 (CET)
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

To help debugging add trace points that print values read from or
written to the device's registers.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/usb/hcd-ohci.c   | 19 +++++++++++++++++++
 hw/usb/trace-events |  4 ++++
 2 files changed, 23 insertions(+)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index c5306378cc..c5bec4e4d7 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -235,6 +235,15 @@ struct ohci_iso_td {
 
 #define OHCI_HRESET_FSBIR       (1 << 0)
 
+static const char *ohci_reg_names[] = {
+    "HcRevision", "HcControl", "HcCommandStatus", "HcInterruptStatus",
+    "HcInterruptEnable", "HcInterruptDisable", "HcHCCA", "HcPeriodCurrentED",
+    "HcControlHeadED", "HcControlCurrentED", "HcBulkHeadED", "HcBulkCurrentED",
+    "HcDoneHead", "HcFmInterval", "HcFmRemaining", "HcFmNumber",
+    "HcPeriodicStart", "HcLSThreshold", "HcRhDescriptorA", "HcRhDescriptorB",
+    "HcRhStatus"
+};
+
 static void ohci_die(OHCIState *ohci)
 {
     ohci->ohci_die(ohci);
@@ -1478,6 +1487,8 @@ static uint64_t ohci_mem_read(void *opaque,
     } else if (addr >= 0x54 && addr < 0x54 + ohci->num_ports * 4) {
         /* HcRhPortStatus */
         retval = ohci->rhport[(addr - 0x54) >> 2].ctrl | OHCI_PORT_PPS;
+        trace_usb_ohci_mem_port_read(size, "HcRhPortStatus", (addr - 0x50) >> 2,
+                                     addr, addr >> 2, retval);
     } else {
         switch (addr >> 2) {
         case 0: /* HcRevision */
@@ -1582,6 +1593,10 @@ static uint64_t ohci_mem_read(void *opaque,
             trace_usb_ohci_mem_read_bad_offset(addr);
             retval = 0xffffffff;
         }
+        if (addr != 0xc || retval) {
+            trace_usb_ohci_mem_read(size, ohci_reg_names[addr >> 2],
+                                    addr, addr >> 2, retval);
+        }
     }
 
     return retval;
@@ -1602,10 +1617,14 @@ static void ohci_mem_write(void *opaque,
 
     if (addr >= 0x54 && addr < 0x54 + ohci->num_ports * 4) {
         /* HcRhPortStatus */
+        trace_usb_ohci_mem_port_write(size, "HcRhPortStatus", (addr - 0x50) >> 2,
+                                      addr, addr >> 2, val);
         ohci_port_set_status(ohci, (addr - 0x54) >> 2, val);
         return;
     }
 
+    trace_usb_ohci_mem_write(size, ohci_reg_names[addr >> 2],
+                             addr, addr >> 2, val);
     switch (addr >> 2) {
     case 1: /* HcControl */
         ohci_set_ctl(ohci, val);
diff --git a/hw/usb/trace-events b/hw/usb/trace-events
index b65269892c..6bb9655c8d 100644
--- a/hw/usb/trace-events
+++ b/hw/usb/trace-events
@@ -57,8 +57,12 @@ usb_ohci_ed_read_error(uint32_t addr) "ED read error at 0x%x"
 usb_ohci_ed_pkt(uint32_t cur, int h, int c, uint32_t head, uint32_t tail, uint32_t next) "ED @ 0x%.8x h=%u c=%u\n  head=0x%.8x tailp=0x%.8x next=0x%.8x"
 usb_ohci_ed_pkt_flags(uint32_t fa, uint32_t en, uint32_t d, int s, int k, int f, uint32_t mps) "fa=%u en=%u d=%u s=%u k=%u f=%u mps=%u"
 usb_ohci_hcca_read_error(uint32_t addr) "HCCA read error at 0x%x"
+usb_ohci_mem_read(uint32_t size, const char *name, uint32_t addr, uint32_t offs, uint32_t val) "%d %s 0x%x %d -> 0x%x"
+usb_ohci_mem_port_read(uint32_t size, const char *name, uint32_t port, uint32_t addr, uint32_t offs, uint32_t val) "%d %s[%d] 0x%x %d -> 0x%x"
 usb_ohci_mem_read_unaligned(uint32_t addr) "at 0x%x"
 usb_ohci_mem_read_bad_offset(uint32_t addr) "0x%x"
+usb_ohci_mem_write(uint32_t size, const char *name, uint32_t addr, uint32_t offs, uint32_t val) "%d %s 0x%x %d <- 0x%x"
+usb_ohci_mem_port_write(uint32_t size, const char *name, uint32_t port, uint32_t addr, uint32_t offs, uint32_t val) "%d %s[%d] 0x%x %d <- 0x%x"
 usb_ohci_mem_write_unaligned(uint32_t addr) "at 0x%x"
 usb_ohci_mem_write_bad_offset(uint32_t addr) "0x%x"
 usb_ohci_process_lists(uint32_t head, uint32_t cur) "head 0x%x, cur 0x%x"
-- 
2.30.6


