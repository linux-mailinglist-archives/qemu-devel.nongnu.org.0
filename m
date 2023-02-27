Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1703F6A4455
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:27:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeBY-0003rf-3N; Mon, 27 Feb 2023 09:09:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeBR-0003PL-A4
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:08:54 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeBL-0000UE-Hl
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:08:49 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso3902480wmp.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2VoGtTwgHmiA8Fb4MxVYfdhh5AZ0EXQI7N3heOlGcxs=;
 b=LIXgDJ81Z151oyLml54ijgZiGVE847D8Im8Ut9rXi7Mi/gWO7+i3bkKfHbTi1HfASd
 TTPN4NndhYeQQ0DoG07MGPDkcGs7q7+lt5eRRXIPypS8cDp0VSCPkZxAtSlIf0xhfh1l
 +fcm8sI03qHVhoSSV9/c1RV/4pzGdj685hogB+sNK4jkNqooNFvf849eNHMhCvaKeh3X
 8xDJelxMUslZePc1A/r+fnPL6N8y5cVFxXbn7ppSLKqeOmwkMoZ3sc5BDhSMnWV7jsXG
 qRkwFUSHbj/35IQzKd7UfGwCAoBUsqfcfwWlmSPrK23Plt+eIj6Y2bi7FcCiGt5EIr2t
 jn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2VoGtTwgHmiA8Fb4MxVYfdhh5AZ0EXQI7N3heOlGcxs=;
 b=fIfFJRtYhI6NjfxzQwOFM6Oql0APnUS6jEvd7Q2U+i2FfcGilugFv8Pk3ZJWMjdYi1
 Fa8oAz6oI6i2yEVYf5bkzDxfSMNHIlkLl39Yjcb0+g11QmyxoL6NA+YnrpjNBBfeP11W
 sXoGfhGwhtPnemMkhDbtdqLn6Y3+xEl+stkeQdFIlim6pxGzNrKOAANXIkK+QaHyLLNf
 opePO+C1eVbnzH1WcDiyNkhFbN7YFOtrcB4FdzYsaT+RdwkLwVpITNRImP3ca+y6uJ0u
 SHWn2yK7SIoCYus98t8G9oQOZrN+jNzHW/pZubSlMKZD7cTNCXaWuKbEI3kuUkWJ3a++
 QsPw==
X-Gm-Message-State: AO0yUKV2u/RX0ztDpUqMHfm8UQ2l+NPMpRWkvdTZIfZqjOA82psN8n5+
 UjaHpp+2ZRUXqVqogEgfOwyTO67BFzj7Jms1
X-Google-Smtp-Source: AK7set9F96Zcoy0BuN78AhbeEtpKhxq+sxnOWzebW+e7xXXSGQUaf/MfPvmi3JSQb5ZvurtiyKAJ3w==
X-Received: by 2002:a05:600c:3113:b0:3eb:2b88:999f with SMTP id
 g19-20020a05600c311300b003eb2b88999fmr7547861wmo.5.1677506925254; 
 Mon, 27 Feb 2023 06:08:45 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a05600c128a00b003dfee43863fsm12663166wmd.26.2023.02.27.06.08.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:08:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 081/126] hw/usb/ohci: Code style fix missing braces and extra
 parenthesis
Date: Mon, 27 Feb 2023 15:01:28 +0100
Message-Id: <20230227140213.35084-72-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
Message-Id: <aaa3ddee99c7677d6cc137f637982e94267b99b6.1676916640.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/hcd-ohci.c | 106 ++++++++++++++++++++++++++--------------------
 1 file changed, 60 insertions(+), 46 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 9d6bb8312e..b7877866f6 100644
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
2.38.1


