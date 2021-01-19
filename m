Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C71942FB45C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 09:41:34 +0100 (CET)
Received: from localhost ([::1]:38480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1mZx-000506-P8
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 03:41:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l1mVX-0008Ic-UB
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:37:00 -0500
Received: from mail-wr1-f49.google.com ([209.85.221.49]:41978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l1mVW-0003Tu-7G
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:36:59 -0500
Received: by mail-wr1-f49.google.com with SMTP id a12so18806649wrv.8
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 00:36:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f2G0ytv9WcsWXoZLiyBGCtsUjm9fyhsF0T8dbHJkcok=;
 b=RXRGJngghecGOsYqlaQyd3314WdD5lrio2zuGeAmikrZCTiBb6d7wHaWg84A92J0TM
 njihVaOd+ZFAk42SkD+P/eH8pcF4alltY/hPlVZsTdfebeCe6wJSV4U38onYJ1g4Z3JJ
 uk6t1PB8uY3qKcJbVaAsNX1LoW7UCZrzGKaXozhEdPW8CFPp+fVBOOkhM1fgmgVrFoDJ
 FzaofttYY2QVjmZXJtcXvdh7xzRqHMM56pTG+pIbTeq8Ja+hl3hq7OjtD224l/7kpYuI
 cpi4VrdYhcQqDDMkUOcHeoFrwSYqxasoX+nURCYINuTnZISwiC/3mVR/4OFnMEneAoX+
 eiSA==
X-Gm-Message-State: AOAM533uak0+2P/L9013S64HwteguLusw5pT+t45XKj7WcPjixj5ygG9
 MnZW/sbzXDh61N4yuobctCJHgrGpvhw=
X-Google-Smtp-Source: ABdhPJxGKMAu/tFHAjV9xqcJefdUM9EuAEd4MnirLha9HSVzYmcSFi0ha9RgBIPxD4hCbbJ4y76BoQ==
X-Received: by 2002:a5d:5181:: with SMTP id k1mr3092583wrv.226.1611045416745; 
 Tue, 19 Jan 2021 00:36:56 -0800 (PST)
Received: from localhost.localdomain (pd9e83aed.dip0.t-ipconnect.de.
 [217.232.58.237])
 by smtp.gmail.com with ESMTPSA id z14sm540833wrm.5.2021.01.19.00.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 00:36:56 -0800 (PST)
From: Thomas Huth <huth@tuxfamily.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 06/11] hw/m68k/next-cube: Move int_status and int_mask to
 NeXTPC struct
Date: Tue, 19 Jan 2021 09:36:12 +0100
Message-Id: <20210119083617.6337-7-huth@tuxfamily.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119083617.6337-1-huth@tuxfamily.org>
References: <20210119083617.6337-1-huth@tuxfamily.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.221.49; envelope-from=th.huth@gmail.com;
 helo=mail-wr1-f49.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

All the code which accesses int_status and int_mask is now doing
so via the NeXTPC->NeXTState indirection, so we can move these
fields into the NeXTPC struct where they belong.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210115201206.17347-7-peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 hw/m68k/next-cube.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index 83e219a79a..9b9b051231 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -73,9 +73,6 @@ typedef struct NextRtc {
 struct NeXTState {
     MachineState parent;
 
-    uint32_t int_mask;
-    uint32_t int_status;
-
     next_dma dma[10];
     qemu_irq *scsi_irq;
     qemu_irq scsi_dma;
@@ -104,6 +101,8 @@ struct NeXTPC {
     uint32_t scr2;
     uint8_t scsi_csr_1;
     uint8_t scsi_csr_2;
+    uint32_t int_mask;
+    uint32_t int_status;
 };
 
 /* Thanks to NeXT forums for this */
@@ -244,7 +243,7 @@ static void nextscr2_write(NeXTPC *s, uint32_t val, int size)
                     /* clear FTU */
                     if (rtc->value & 0x04) {
                         rtc->status = rtc->status & (~0x18);
-                        s->ns->int_status = s->ns->int_status & (~0x04);
+                        s->int_status = s->int_status & (~0x04);
                     }
                 }
             }
@@ -303,12 +302,12 @@ static uint32_t mmio_readl(NeXTPC *s, hwaddr addr)
 {
     switch (addr) {
     case 0x7000:
-        /* DPRINTF("Read INT status: %x\n", s->ns->int_status); */
-        return s->ns->int_status;
+        /* DPRINTF("Read INT status: %x\n", s->int_status); */
+        return s->int_status;
 
     case 0x7800:
-        DPRINTF("MMIO Read INT mask: %x\n", s->ns->int_mask);
-        return s->ns->int_mask;
+        DPRINTF("MMIO Read INT mask: %x\n", s->int_mask);
+        return s->int_mask;
 
     case 0xc000:
         return s->scr1;
@@ -343,12 +342,12 @@ static void mmio_writel(NeXTPC *s, hwaddr addr, uint32_t val)
 {
     switch (addr) {
     case 0x7000:
-        DPRINTF("INT Status old: %x new: %x\n", s->ns->int_status, val);
-        s->ns->int_status = val;
+        DPRINTF("INT Status old: %x new: %x\n", s->int_status, val);
+        s->int_status = val;
         break;
     case 0x7800:
-        DPRINTF("INT Mask old: %x new: %x\n", s->ns->int_mask, val);
-        s->ns->int_mask  = val;
+        DPRINTF("INT Mask old: %x new: %x\n", s->int_mask, val);
+        s->int_mask  = val;
         break;
     case 0xc000:
         DPRINTF("SCR1 Write: %x\n", val);
@@ -505,9 +504,9 @@ static void scr_writeb(NeXTPC *s, hwaddr addr, uint32_t value)
             DPRINTF("SCSICSR CPUDMA\n");
             /* qemu_irq_raise(s->scsi_dma); */
 
-            s->ns->int_status |= 0x4000000;
+            s->int_status |= 0x4000000;
         } else {
-            s->ns->int_status &= ~(0x4000000);
+            s->int_status &= ~(0x4000000);
         }
         if (value & SCSICSR_INTMASK) {
             DPRINTF("SCSICSR INTMASK\n");
@@ -799,14 +798,14 @@ static void next_irq(void *opaque, int number, int level)
      * this HAS to be wrong, the interrupt handlers in mach and together
      * int_status and int_mask and return if there is a hit
      */
-    if (s->ns->int_mask & (1 << shift)) {
+    if (s->int_mask & (1 << shift)) {
         DPRINTF("%x interrupt masked @ %x\n", 1 << shift, cpu->env.pc);
         /* return; */
     }
 
     /* second switch triggers the correct interrupt */
     if (level) {
-        s->ns->int_status |= 1 << shift;
+        s->int_status |= 1 << shift;
 
         switch (number) {
         /* level 3 - floppy, kbd/mouse, power, ether rx/tx, scsi, clock */
@@ -835,7 +834,7 @@ static void next_irq(void *opaque, int number, int level)
             break;
         }
     } else {
-        s->ns->int_status &= ~(1 << shift);
+        s->int_status &= ~(1 << shift);
         cpu_reset_interrupt(CPU(cpu), CPU_INTERRUPT_HARD);
     }
 }
-- 
2.29.2


