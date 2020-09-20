Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8FA2711C0
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Sep 2020 04:16:25 +0200 (CEST)
Received: from localhost ([::1]:34986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJotr-00071u-UH
	for lists+qemu-devel@lfdr.de; Sat, 19 Sep 2020 22:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pauldzim@gmail.com>)
 id 1kJosp-0006X9-UN
 for qemu-devel@nongnu.org; Sat, 19 Sep 2020 22:15:19 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:37986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pauldzim@gmail.com>)
 id 1kJosn-0007Sd-OX
 for qemu-devel@nongnu.org; Sat, 19 Sep 2020 22:15:19 -0400
Received: by mail-pg1-x543.google.com with SMTP id l191so5904613pgd.5
 for <qemu-devel@nongnu.org>; Sat, 19 Sep 2020 19:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=nqEmb/DHt9pyYwlRz+NZ5g+nwWgBISpQTOdkOdOSGwc=;
 b=smha0kZw/P4OU64X+LaqwqaHYuZNIcyG2gkP6K9fQGD57QcUPLr3tq+ExG7LM6iLYR
 6JvbUbNfxyJ6kh5VGcCypxc0wMOBlHS0Im7VhsHARGXyxND4xfMIE/xweQLieo1ht7MR
 Z1oI8U0kkO8PvEeKdw99FsY95ZOWFZhJNc64tj4qBFnAAHR1P8slMHNxLsrAa2TJntHL
 XHcw+7ny0CAFCOZJkVS8cXxncH6djjlZHAiqWXKwVcrr1ma9J4KGGo45CGWoqRqzO7Di
 aXOoJ0iBD/PX4/OTxzfiVz2uT8HZMqryC6JrxwnS5WA6yncrUjxwbXdlHrgvgiIBP3nF
 TKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=nqEmb/DHt9pyYwlRz+NZ5g+nwWgBISpQTOdkOdOSGwc=;
 b=G54MEV4//mN1djAHMBHiDJwxOtt7IotQmFse3k9OItRIQLU0CBiwLDYorPuyt+GPOb
 vg2Dxb+tzQpPJ5mQQC4SMLgpc8DE3Jicy7AWxFg0CgbC5Ttre7Kz3dUO3zqGxvn+L4bu
 WAdE4PM70dHEjwCLrFatUg+27DxQGZ9SRsgoNTbUC+hbU26mbQJZN/94EReXw3LxxIqm
 w1sA/F/Xe+9Rwaalsomsk/La+9CTB4+BLm306icbY6PUtM+1Zgsuk1WnOy9KcMlc8jd3
 DHcMk9xE+iUwhESr/UgoqpX6ladBXrZ0E8Gvv8OIyP3sF5zwB0eN20m0UUH2qnQyyqlL
 UOWg==
X-Gm-Message-State: AOAM531dnNC7IhiKz8bNZvcI05ywVmcf7unw2GGXleHz/pDT2E6lOopZ
 sgJHM5mbNwvg6ZS7ctH6LwE=
X-Google-Smtp-Source: ABdhPJwhPtY/sW5HAYWis4d+/WzAWvYw6OgwhRkpd8ZJq8Jn9smO/7PkH7s4iHPrrPwbOHe4wM12cA==
X-Received: by 2002:aa7:9986:0:b029:142:2501:35d0 with SMTP id
 k6-20020aa799860000b0290142250135d0mr22333151pfh.48.1600568115640; 
 Sat, 19 Sep 2020 19:15:15 -0700 (PDT)
Received: from localhost.localdomain ([75.167.248.230])
 by smtp.gmail.com with ESMTPSA id s22sm8282984pfd.90.2020.09.19.19.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 19:15:15 -0700 (PDT)
From: Paul Zimmerman <pauldzim@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] usb: hcd-dwc2: change assert()s to
 qemu_log_mask(LOG_GUEST_ERROR...)
Date: Sat, 19 Sep 2020 19:14:49 -0700
Message-Id: <20200920021449.830-1-pauldzim@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=pauldzim@gmail.com; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paul Zimmerman <pauldzim@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change several assert()s to qemu_log_mask(LOG_GUEST_ERROR...),
to prevent the guest from causing Qemu to assert. Also fix up
several existing qemu_log_mask()s to include the function name in
the message.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paul Zimmerman <pauldzim@gmail.com>
---
Hi Gerd,

This was prompted by
"[Bug 1892604] qemu-system-arm: ../hw/usb/hcd-dwc2.c:666:
 dwc2_glbreg_read: Assertion `addr <= GINTSTS2' failed"

Although this doesn't really fix the reported bug, since the
guest image still doesn't operate correctly, it does prevent
the guest from causing Qemu to assert, as requested by Peter.
I guess this is not too urgent.

Thanks,
Paul

 hw/usb/hcd-dwc2.c | 100 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 81 insertions(+), 19 deletions(-)

diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c
index 97688d21bf..64c23c1ed0 100644
--- a/hw/usb/hcd-dwc2.c
+++ b/hw/usb/hcd-dwc2.c
@@ -238,7 +238,12 @@ static void dwc2_handle_packet(DWC2State *s, uint32_t devadr, USBDevice *dev,
     pid = get_field(hctsiz, TSIZ_SC_MC_PID);
     pcnt = get_field(hctsiz, TSIZ_PKTCNT);
     len = get_field(hctsiz, TSIZ_XFERSIZE);
-    assert(len <= DWC2_MAX_XFER_SIZE);
+    if (len > DWC2_MAX_XFER_SIZE) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: HCTSIZ transfer size too large\n", __func__);
+        return;
+    }
+
     chan = index >> 3;
     p = &s->packet[chan];
 
@@ -663,7 +668,12 @@ static uint64_t dwc2_glbreg_read(void *ptr, hwaddr addr, int index,
     DWC2State *s = ptr;
     uint32_t val;
 
-    assert(addr <= GINTSTS2);
+    if (addr > GINTSTS2) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"HWADDR_PRIx"\n",
+                      __func__, addr);
+        return 0;
+    }
+
     val = s->glbreg[index];
 
     switch (addr) {
@@ -690,7 +700,12 @@ static void dwc2_glbreg_write(void *ptr, hwaddr addr, int index, uint64_t val,
     uint32_t old;
     int iflg = 0;
 
-    assert(addr <= GINTSTS2);
+    if (addr > GINTSTS2) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"HWADDR_PRIx"\n",
+                      __func__, addr);
+        return;
+    }
+
     mmio = &s->glbreg[index];
     old = *mmio;
 
@@ -715,27 +730,34 @@ static void dwc2_glbreg_write(void *ptr, hwaddr addr, int index, uint64_t val,
         val &= ~GRSTCTL_DMAREQ;
         if (!(old & GRSTCTL_TXFFLSH) && (val & GRSTCTL_TXFFLSH)) {
                 /* TODO - TX fifo flush */
-            qemu_log_mask(LOG_UNIMP, "Tx FIFO flush not implemented\n");
+            qemu_log_mask(LOG_UNIMP, "%s: Tx FIFO flush not implemented\n",
+                          __func__);
         }
         if (!(old & GRSTCTL_RXFFLSH) && (val & GRSTCTL_RXFFLSH)) {
                 /* TODO - RX fifo flush */
-            qemu_log_mask(LOG_UNIMP, "Rx FIFO flush not implemented\n");
+            qemu_log_mask(LOG_UNIMP, "%s: Rx FIFO flush not implemented\n",
+                          __func__);
         }
         if (!(old & GRSTCTL_IN_TKNQ_FLSH) && (val & GRSTCTL_IN_TKNQ_FLSH)) {
                 /* TODO - device IN token queue flush */
-            qemu_log_mask(LOG_UNIMP, "Token queue flush not implemented\n");
+            qemu_log_mask(LOG_UNIMP, "%s: Token queue flush not implemented\n",
+                          __func__);
         }
         if (!(old & GRSTCTL_FRMCNTRRST) && (val & GRSTCTL_FRMCNTRRST)) {
                 /* TODO - host frame counter reset */
-            qemu_log_mask(LOG_UNIMP, "Frame counter reset not implemented\n");
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: Frame counter reset not implemented\n",
+                          __func__);
         }
         if (!(old & GRSTCTL_HSFTRST) && (val & GRSTCTL_HSFTRST)) {
                 /* TODO - host soft reset */
-            qemu_log_mask(LOG_UNIMP, "Host soft reset not implemented\n");
+            qemu_log_mask(LOG_UNIMP, "%s: Host soft reset not implemented\n",
+                          __func__);
         }
         if (!(old & GRSTCTL_CSFTRST) && (val & GRSTCTL_CSFTRST)) {
                 /* TODO - core soft reset */
-            qemu_log_mask(LOG_UNIMP, "Core soft reset not implemented\n");
+            qemu_log_mask(LOG_UNIMP, "%s: Core soft reset not implemented\n",
+                          __func__);
         }
         /* don't allow clearing of self-clearing bits */
         val |= old & (GRSTCTL_TXFFLSH | GRSTCTL_RXFFLSH |
@@ -774,7 +796,12 @@ static uint64_t dwc2_fszreg_read(void *ptr, hwaddr addr, int index,
     DWC2State *s = ptr;
     uint32_t val;
 
-    assert(addr == HPTXFSIZ);
+    if (addr != HPTXFSIZ) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"HWADDR_PRIx"\n",
+                      __func__, addr);
+        return 0;
+    }
+
     val = s->fszreg[index];
 
     trace_usb_dwc2_fszreg_read(addr, val);
@@ -789,7 +816,12 @@ static void dwc2_fszreg_write(void *ptr, hwaddr addr, int index, uint64_t val,
     uint32_t *mmio;
     uint32_t old;
 
-    assert(addr == HPTXFSIZ);
+    if (addr != HPTXFSIZ) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"HWADDR_PRIx"\n",
+                      __func__, addr);
+        return;
+    }
+
     mmio = &s->fszreg[index];
     old = *mmio;
 
@@ -810,7 +842,12 @@ static uint64_t dwc2_hreg0_read(void *ptr, hwaddr addr, int index,
     DWC2State *s = ptr;
     uint32_t val;
 
-    assert(addr >= HCFG && addr <= HPRT0);
+    if (addr < HCFG || addr > HPRT0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"HWADDR_PRIx"\n",
+                      __func__, addr);
+        return 0;
+    }
+
     val = s->hreg0[index];
 
     switch (addr) {
@@ -837,7 +874,12 @@ static void dwc2_hreg0_write(void *ptr, hwaddr addr, int index, uint64_t val,
     int prst = 0;
     int iflg = 0;
 
-    assert(addr >= HCFG && addr <= HPRT0);
+    if (addr < HCFG || addr > HPRT0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"HWADDR_PRIx"\n",
+                      __func__, addr);
+        return;
+    }
+
     mmio = &s->hreg0[index];
     old = *mmio;
 
@@ -923,7 +965,12 @@ static uint64_t dwc2_hreg1_read(void *ptr, hwaddr addr, int index,
     DWC2State *s = ptr;
     uint32_t val;
 
-    assert(addr >= HCCHAR(0) && addr <= HCDMAB(DWC2_NB_CHAN - 1));
+    if (addr < HCCHAR(0) || addr > HCDMAB(DWC2_NB_CHAN - 1)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"HWADDR_PRIx"\n",
+                      __func__, addr);
+        return 0;
+    }
+
     val = s->hreg1[index];
 
     trace_usb_dwc2_hreg1_read(addr, hreg1nm[index & 7], addr >> 5, val);
@@ -941,7 +988,12 @@ static void dwc2_hreg1_write(void *ptr, hwaddr addr, int index, uint64_t val,
     int enflg = 0;
     int disflg = 0;
 
-    assert(addr >= HCCHAR(0) && addr <= HCDMAB(DWC2_NB_CHAN - 1));
+    if (addr < HCCHAR(0) || addr > HCDMAB(DWC2_NB_CHAN - 1)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"HWADDR_PRIx"\n",
+                      __func__, addr);
+        return;
+    }
+
     mmio = &s->hreg1[index];
     old = *mmio;
 
@@ -1008,7 +1060,12 @@ static uint64_t dwc2_pcgreg_read(void *ptr, hwaddr addr, int index,
     DWC2State *s = ptr;
     uint32_t val;
 
-    assert(addr >= PCGCTL && addr <= PCGCCTL1);
+    if (addr < PCGCTL || addr > PCGCCTL1) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"HWADDR_PRIx"\n",
+                      __func__, addr);
+        return 0;
+    }
+
     val = s->pcgreg[index];
 
     trace_usb_dwc2_pcgreg_read(addr, pcgregnm[index], val);
@@ -1023,7 +1080,12 @@ static void dwc2_pcgreg_write(void *ptr, hwaddr addr, int index,
     uint32_t *mmio;
     uint32_t old;
 
-    assert(addr >= PCGCTL && addr <= PCGCCTL1);
+    if (addr < PCGCTL || addr > PCGCCTL1) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"HWADDR_PRIx"\n",
+                      __func__, addr);
+        return;
+    }
+
     mmio = &s->pcgreg[index];
     old = *mmio;
 
@@ -1108,7 +1170,7 @@ static uint64_t dwc2_hreg2_read(void *ptr, hwaddr addr, unsigned size)
 {
     /* TODO - implement FIFOs to support slave mode */
     trace_usb_dwc2_hreg2_read(addr, addr >> 12, 0);
-    qemu_log_mask(LOG_UNIMP, "FIFO read not implemented\n");
+    qemu_log_mask(LOG_UNIMP, "%s: FIFO read not implemented\n", __func__);
     return 0;
 }
 
@@ -1119,7 +1181,7 @@ static void dwc2_hreg2_write(void *ptr, hwaddr addr, uint64_t val,
 
     /* TODO - implement FIFOs to support slave mode */
     trace_usb_dwc2_hreg2_write(addr, addr >> 12, orig, 0, val);
-    qemu_log_mask(LOG_UNIMP, "FIFO write not implemented\n");
+    qemu_log_mask(LOG_UNIMP, "%s: FIFO write not implemented\n", __func__);
 }
 
 static const MemoryRegionOps dwc2_mmio_hreg2_ops = {
-- 
2.17.1


