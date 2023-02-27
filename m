Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4561D6A449C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:36:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeBW-0003hp-ND; Mon, 27 Feb 2023 09:08:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeBH-0003Ho-94
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:08:46 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeBB-0000R9-4E
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:08:39 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so7266189wms.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=g1WFgmQi9RTPdbhVn2Otree0rWFPQ8KugT3/QR1c5Yo=;
 b=VppkSAy2ThYZerfqb9FGVrNkvqUcOHzJlwVUaWtURunO8pChLTNiLFqvdfRs3rQbev
 vQvJlKJ91f9REZOAohil+I+dKM8mW9ohSN4VhQwDOFs3oby8xuLyzoRahyLFGLIXx5D6
 ALhal8vYU9pz1hkMoWIsjsUkx4OHcWJRUSPdg+9YNCI+UzklhDoSyMeYwquYPTlcBwHc
 jqx0o354kBArsYWbUbUx6mwMaNrTMvBXrxSGZIgTZeTGgkQoBTCVWELdDibQCGxEHgSR
 1FFyNof52yTYaSjVsLLrVQN/nVgOrHJLcWQqdm3UzMP2UnGH6ejhsmTn8ttPoTK2ffdu
 ypXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g1WFgmQi9RTPdbhVn2Otree0rWFPQ8KugT3/QR1c5Yo=;
 b=rF5m5M2/BMPdfJdmRSNGqug0a0Qce8qCT2RH0tHf+2RpNeq/1BZbAr/QV2jg9PzvmG
 vYw04+ef3hUhpSJuxuh3+mJ0ExMMF3ob6btPeBu9J0tnS1nAVTTVFoesEpjqZpUxbQ/m
 50opUtlJyW8EKafyq6AcvLacYK9z9a2ZJnAb+YYEwo3a62urRgCLxbotDZzxxG0pqo72
 JCL6tsa4MjLB3xRgDM6GQmmxyK7rn2SPvoE4SbC/pZS5z5lg3uvisosUP8zBDYU/FZ8b
 ZoGe0+Bm+sxHFnopW+4EjmwCHKhkNCZ4d9orPGn825EaERY/aiSsHlnY5M6/3axyd5bX
 FJrA==
X-Gm-Message-State: AO0yUKWe27I5yfI94PdckQBXFv99g68DfxVx1vqJNa7aJ9q6nOpWIKgp
 5qy0RyI/onolINEJj6Cz255u4rIh++ouf8bk
X-Google-Smtp-Source: AK7set/TES6bUxdy0rdX9NuE4Y3TBaiISV/uWMmYEA1ckxh93QiwHrBtXxxaNV6lZQ6NG8Dgxw4n6g==
X-Received: by 2002:a05:600c:4f96:b0:3db:8de:6993 with SMTP id
 n22-20020a05600c4f9600b003db08de6993mr6685644wmq.4.1677506915104; 
 Mon, 27 Feb 2023 06:08:35 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n41-20020a05600c3ba900b003e20fa01a86sm9873340wms.13.2023.02.27.06.08.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:08:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 079/126] hw/usb/ohci: Code style fix comments
Date: Mon, 27 Feb 2023 15:01:26 +0100
Message-Id: <20230227140213.35084-70-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: BALATON Zoltan <balaton@eik.bme.hu>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <9b0aadedc7c4780fefdc27f14f72ac9003032fbf.1676916639.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/hcd-ohci.c | 99 +++++++++++++++++++++++------------------------
 1 file changed, 49 insertions(+), 50 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 7ecf9b15b7..93fc592161 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -23,7 +23,7 @@
  *  o Disable timers when nothing needs to be done, or remove timer usage
  *    all together.
  *  o BIOS work to boot from USB storage
-*/
+ */
 
 #include "qemu/osdep.h"
 #include "hw/irq.h"
@@ -39,7 +39,7 @@
 #include "hcd-ohci.h"
 
 /* This causes frames to occur 1000x slower */
-//#define OHCI_TIME_WARP 1
+/*#define OHCI_TIME_WARP 1*/
 
 #define ED_LINK_LIMIT 32
 
@@ -58,7 +58,7 @@ struct ohci_hcca {
 #define ED_WBACK_OFFSET offsetof(struct ohci_ed, head)
 #define ED_WBACK_SIZE   4
 
-/* Bitfields for the first word of an Endpoint Desciptor.  */
+/* Bitfields for the first word of an Endpoint Desciptor. */
 #define OHCI_ED_FA_SHIFT  0
 #define OHCI_ED_FA_MASK   (0x7f<<OHCI_ED_FA_SHIFT)
 #define OHCI_ED_EN_SHIFT  7
@@ -71,11 +71,11 @@ struct ohci_hcca {
 #define OHCI_ED_MPS_SHIFT 16
 #define OHCI_ED_MPS_MASK  (0x7ff<<OHCI_ED_MPS_SHIFT)
 
-/* Flags in the head field of an Endpoint Desciptor.  */
+/* Flags in the head field of an Endpoint Desciptor. */
 #define OHCI_ED_H         1
 #define OHCI_ED_C         2
 
-/* Bitfields for the first word of a Transfer Desciptor.  */
+/* Bitfields for the first word of a Transfer Desciptor. */
 #define OHCI_TD_R         (1<<18)
 #define OHCI_TD_DP_SHIFT  19
 #define OHCI_TD_DP_MASK   (3<<OHCI_TD_DP_SHIFT)
@@ -88,7 +88,7 @@ struct ohci_hcca {
 #define OHCI_TD_CC_SHIFT  28
 #define OHCI_TD_CC_MASK   (0xf<<OHCI_TD_CC_SHIFT)
 
-/* Bitfields for the first word of an Isochronous Transfer Desciptor.  */
+/* Bitfields for the first word of an Isochronous Transfer Desciptor. */
 /* CC & DI - same as in the General Transfer Desciptor */
 #define OHCI_TD_SF_SHIFT  0
 #define OHCI_TD_SF_MASK   (0xffff<<OHCI_TD_SF_SHIFT)
@@ -335,8 +335,8 @@ static void ohci_soft_reset(OHCIState *ohci)
     ohci->per_cur = 0;
     ohci->done = 0;
     ohci->done_count = 7;
-
-    /* FSMPS is marked TBD in OCHI 1.0, what gives ffs?
+    /*
+     * FSMPS is marked TBD in OCHI 1.0, what gives ffs?
      * I took the value linux sets ...
      */
     ohci->fsmps = 0x2778;
@@ -460,10 +460,10 @@ static inline int ohci_read_hcca(OHCIState *ohci,
 static inline int ohci_put_ed(OHCIState *ohci,
                               dma_addr_t addr, struct ohci_ed *ed)
 {
-    /* ed->tail is under control of the HCD.
+    /*
+     * ed->tail is under control of the HCD.
      * Since just ed->head is changed by HC, just write back this
      */
-
     return put_dwords(ohci, addr + ED_WBACK_OFFSET,
                       (uint32_t *)((char *)ed + ED_WBACK_OFFSET),
                       ED_WBACK_SIZE >> 2);
@@ -601,8 +601,10 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed)
         trace_usb_ohci_iso_td_relative_frame_number_neg(relative_frame_number);
         return 1;
     } else if (relative_frame_number > frame_count) {
-        /* ISO TD expired - retire the TD to the Done Queue and continue with
-           the next ISO TD of the same ED */
+        /*
+         * ISO TD expired - retire the TD to the Done Queue and continue with
+         * the next ISO TD of the same ED
+         */
         trace_usb_ohci_iso_td_relative_frame_number_big(relative_frame_number,
                                                         frame_count);
         if (OHCI_CC_DATAOVERRUN == OHCI_BM(iso_td.flags, TD_CC)) {
@@ -845,9 +847,10 @@ static void ohci_td_pkt(const char *msg, const uint8_t *buf, size_t len)
     }
 }
 
-/* Service a transport descriptor.
-   Returns nonzero to terminate processing of this endpoint.  */
-
+/*
+ * Service a transport descriptor.
+ * Returns nonzero to terminate processing of this endpoint.
+ */
 static int ohci_service_td(OHCIState *ohci, struct ohci_ed *ed)
 {
     int dir;
@@ -869,7 +872,7 @@ static int ohci_service_td(OHCIState *ohci, struct ohci_ed *ed)
         return 1;
     }
 
-    /* See if this TD has already been submitted to the device.  */
+    /* See if this TD has already been submitted to the device. */
     completion = (addr == ohci->async_td);
     if (completion && !ohci->async_complete) {
         trace_usb_ohci_td_skip_async();
@@ -885,7 +888,7 @@ static int ohci_service_td(OHCIState *ohci, struct ohci_ed *ed)
     switch (dir) {
     case OHCI_TD_DIR_OUT:
     case OHCI_TD_DIR_IN:
-        /* Same value.  */
+        /* Same value. */
         break;
     default:
         dir = OHCI_BM(td.flags, TD_DP);
@@ -956,11 +959,12 @@ static int ohci_service_td(OHCIState *ohci, struct ohci_ed *ed)
         }
         ep = usb_ep_get(dev, pid, OHCI_BM(ed->flags, ED_EN));
         if (ohci->async_td) {
-            /* ??? The hardware should allow one active packet per
-               endpoint.  We only allow one active packet per controller.
-               This should be sufficient as long as devices respond in a
-               timely manner.
-            */
+            /*
+             * ??? The hardware should allow one active packet per
+             * endpoint.  We only allow one active packet per controller.
+             * This should be sufficient as long as devices respond in a
+             * timely manner.
+             */
             trace_usb_ohci_td_too_many_pending(ep->nr);
             return 1;
         }
@@ -996,7 +1000,7 @@ static int ohci_service_td(OHCIState *ohci, struct ohci_ed *ed)
 
     /* Writeback */
     if (ret == pktlen || (dir == OHCI_TD_DIR_IN && ret >= 0 && flag_r)) {
-        /* Transmission succeeded.  */
+        /* Transmission succeeded. */
         if (ret == len) {
             td.cbp = 0;
         } else {
@@ -1048,8 +1052,10 @@ static int ohci_service_td(OHCIState *ohci, struct ohci_ed *ed)
                 OHCI_SET_BM(td.flags, TD_EC, 3);
                 break;
             }
-            /* An error occurred so we have to clear the interrupt counter. See
-             * spec at 6.4.4 on page 104 */
+            /*
+             * An error occurred so we have to clear the interrupt counter.
+             * See spec at 6.4.4 on page 104
+             */
             ohci->done_count = 0;
         }
         ed->head |= OHCI_ED_H;
@@ -1071,7 +1077,7 @@ exit_no_retire:
     return OHCI_BM(td.flags, TD_CC) != OHCI_CC_NOERROR;
 }
 
-/* Service an endpoint list.  Returns nonzero if active TD were found.  */
+/* Service an endpoint list.  Returns nonzero if active TD were found. */
 static int ohci_service_ed_list(OHCIState *ohci, uint32_t head)
 {
     struct ohci_ed ed;
@@ -1095,7 +1101,7 @@ static int ohci_service_ed_list(OHCIState *ohci, uint32_t head)
 
         if ((ed.head & OHCI_ED_H) || (ed.flags & OHCI_ED_K)) {
             uint32_t addr;
-            /* Cancel pending packets for ED that have been paused.  */
+            /* Cancel pending packets for ED that have been paused. */
             addr = ed.head & OHCI_DPTR_MASK;
             if (ohci->async_td && addr == ohci->async_td) {
                 usb_cancel_packet(&ohci->usb_packet);
@@ -1151,7 +1157,7 @@ static void ohci_sof(OHCIState *ohci)
     ohci_set_interrupt(ohci, OHCI_INTR_SF);
 }
 
-/* Process Control and Bulk lists.  */
+/* Process Control and Bulk lists. */
 static void ohci_process_lists(OHCIState *ohci)
 {
     if ((ohci->ctl & OHCI_CTL_CLE) && (ohci->status & OHCI_STATUS_CLF)) {
@@ -1192,7 +1198,7 @@ static void ohci_frame_boundary(void *opaque)
         ohci_service_ed_list(ohci, le32_to_cpu(hcca.intr[n]));
     }
 
-    /* Cancel all pending packets if either of the lists has been disabled.  */
+    /* Cancel all pending packets if either of the lists has been disabled. */
     if (ohci->old_ctl & (~ohci->ctl) & (OHCI_CTL_BLE | OHCI_CTL_CLE)) {
         ohci_stop_endpoints(ohci);
     }
@@ -1234,18 +1240,17 @@ static void ohci_frame_boundary(void *opaque)
     }
 }
 
-/* Start sending SOF tokens across the USB bus, lists are processed in
+/*
+ * Start sending SOF tokens across the USB bus, lists are processed in
  * next frame
  */
 static int ohci_bus_start(OHCIState *ohci)
 {
     trace_usb_ohci_start(ohci->name);
-
-    /* Delay the first SOF event by one frame time as
-     * linux driver is not ready to receive it and
-     * can meet some race conditions
+    /*
+     * Delay the first SOF event by one frame time as linux driver is
+     * not ready to receive it and can meet some race conditions
      */
-
     ohci->sof_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     ohci_eof_timer(ohci);
 
@@ -1259,9 +1264,9 @@ void ohci_bus_stop(OHCIState *ohci)
     timer_del(ohci->eof_timer);
 }
 
-/* Sets a flag in a port status register but only set it if the port is
- * connected, if not set ConnectStatusChange flag. If flag is enabled
- * return 1.
+/*
+ * Sets a flag in a port status reg but only set it if the port is connected.
+ * If not set ConnectStatusChange flag. If flag is enabled return 1.
  */
 static int ohci_port_set_if_connected(OHCIState *ohci, int i, uint32_t val)
 {
@@ -1271,9 +1276,7 @@ static int ohci_port_set_if_connected(OHCIState *ohci, int i, uint32_t val)
     if (val == 0)
         return 0;
 
-    /* If CurrentConnectStatus is cleared we set
-     * ConnectStatusChange
-     */
+    /* If CurrentConnectStatus is cleared we set ConnectStatusChange */
     if (!(ohci->rhport[i].ctrl & OHCI_PORT_CCS)) {
         ohci->rhport[i].ctrl |= OHCI_PORT_CSC;
         if (ohci->rhstatus & OHCI_RHS_DRWE) {
@@ -1291,7 +1294,7 @@ static int ohci_port_set_if_connected(OHCIState *ohci, int i, uint32_t val)
     return ret;
 }
 
-/* Set the frame interval - frame interval toggle is manipulated by the hcd only */
+/* Frame interval toggle is manipulated by the hcd only */
 static void ohci_set_frame_interval(OHCIState *ohci, uint16_t val)
 {
     val &= OHCI_FMI_FI;
@@ -1357,9 +1360,7 @@ static uint32_t ohci_get_frame_remaining(OHCIState *ohci)
     if ((ohci->ctl & OHCI_CTL_HCFS) != OHCI_USB_OPERATIONAL)
         return (ohci->frt << 31);
 
-    /* Being in USB operational state guarnatees sof_time was
-     * set already.
-     */
+    /* Being in USB operational state guarnatees sof_time was set already. */
     tks = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - ohci->sof_time;
     if (tks < 0) {
         tks = 0;
@@ -1439,13 +1440,11 @@ static void ohci_port_set_status(OHCIState *ohci, int portnum, uint32_t val)
         trace_usb_ohci_port_reset(portnum);
         usb_device_reset(port->port.dev);
         port->ctrl &= ~OHCI_PORT_PRS;
-        /* ??? Should this also set OHCI_PORT_PESC.  */
+        /* ??? Should this also set OHCI_PORT_PESC. */
         port->ctrl |= OHCI_PORT_PES | OHCI_PORT_PRSC;
     }
 
-    /* Invert order here to ensure in ambiguous case, device is
-     * powered up...
-     */
+    /* Invert order here to ensure in ambiguous case, device is powered up. */
     if (val & OHCI_PORT_LSDA)
         ohci_port_power(ohci, portnum, 0);
     if (val & OHCI_PORT_PPS)
@@ -1892,7 +1891,7 @@ void usb_ohci_init(OHCIState *ohci, DeviceState *dev, uint32_t num_ports,
                                    ohci_frame_boundary, ohci);
 }
 
-/**
+/*
  * A typical OHCI will stop operating and set itself into error state
  * (which can be queried by MMIO) to signal that it got an error.
  */
-- 
2.38.1


