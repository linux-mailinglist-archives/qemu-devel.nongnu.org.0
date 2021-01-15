Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 708752F867A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 21:19:41 +0100 (CET)
Received: from localhost ([::1]:37516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0VZM-0004QR-Fi
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 15:19:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0VSE-0005sD-U6
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:12:18 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0VSD-0008IQ-6i
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:12:18 -0500
Received: by mail-wr1-x434.google.com with SMTP id w5so10469332wrm.11
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 12:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u5SEU2LlCzjLfCWQO/ACZ9Nq9yD70zys6hJbaEYaJA0=;
 b=VLxgGQ3tqTzI1RfpjBdVhqOQFZrSob/M2Jc3m75dh69daPiZI8nC+Xswsle4Zy8TRj
 qNQkd5adzm0xKbBrBNu6i28+igaR9teOk9Uv8v8zl3UkbnNzC4lGTBmc9piMt5EzANkX
 xqzp0UahNt9H1MVBBOwzEDpdKdDQmTxbvUzDEqrF0hUygoupxP2PS3YQCU9j03ZFMz3X
 vN8JhONZ03OWvzrpon5iiqgj4A1jjE90M/8hyO/e9Qex4tRDmHki9lrV61oajUA/txvC
 5iGH1H3CPO1xqvfo7MGggRomEYB3c3LhtA+HEO0XT86vq5E6sWZIhjGCcImcPjB08hxl
 jEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u5SEU2LlCzjLfCWQO/ACZ9Nq9yD70zys6hJbaEYaJA0=;
 b=NPE4ZbIZ9pYsVFqZfElI+6vQsREzJzWWOLAkCIJ74WrOF/6V/4vxJsKX56+8ldLqCQ
 pG1nYRf7hQRll4v+YLgcjHjTpb5SbceNc21PTqS24Mq5i0Dr0NR8x2eobEVDhIqevW0S
 uAx5uoY9IspitvO6ByPkWStKPj8E6wmMxOcF/mN/fSEQ5qO0sfpbJjG0tUZi8EFGfIiu
 BU5dC8yp9eVwvdn2gUVuLy69IXWBRYef2KfJipanpdaCASGJVYAMhBRj6DU3jzd62ZjN
 B8f54ZRXHd+JILMRfGejIc6xz9bLsFdaIAeyy9ChZbSpoDiweYQn6FemTNW9fXu+MrOK
 quhw==
X-Gm-Message-State: AOAM530ubCd1uTYc/WsJBSt7horvu9mUwW2xBt8kn+8Ex8uUGEnxVQNv
 M7JfIPwyP4f8CY7x8idxAWxdh8RC3defYw==
X-Google-Smtp-Source: ABdhPJxZvY456k0Ic1/h7cgIZ++a3Df+K0d41MgQQRCdkwdaWkoJxoOhdjXn5M9QBLMTWDtB4inuYA==
X-Received: by 2002:adf:f78e:: with SMTP id q14mr14790400wrp.320.1610741535729; 
 Fri, 15 Jan 2021 12:12:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b3sm10353807wrn.70.2021.01.15.12.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 12:12:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/11] hw/m68k/next-cube: Move int_status and int_mask to
 NeXTPC struct
Date: Fri, 15 Jan 2021 20:12:01 +0000
Message-Id: <20210115201206.17347-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115201206.17347-1-peter.maydell@linaro.org>
References: <20210115201206.17347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All the code which accesses int_status and int_mask is now doing
so via the NeXTPC->NeXTState indirection, so we can move these
fields into the NeXTPC struct where they belong.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/m68k/next-cube.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index a9e57304e04..6b4bcfd4b9b 100644
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
@@ -103,6 +100,8 @@ struct NeXTPC {
     uint32_t scr2;
     uint8_t scsi_csr_1;
     uint8_t scsi_csr_2;
+    uint32_t int_mask;
+    uint32_t int_status;
 };
 
 /* Thanks to NeXT forums for this */
@@ -243,7 +242,7 @@ static void nextscr2_write(NeXTPC *s, uint32_t val, int size)
                     /* clear FTU */
                     if (rtc->value & 0x04) {
                         rtc->status = rtc->status & (~0x18);
-                        s->ns->int_status = s->ns->int_status & (~0x04);
+                        s->int_status = s->int_status & (~0x04);
                     }
                 }
             }
@@ -302,12 +301,12 @@ static uint32_t mmio_readl(NeXTPC *s, hwaddr addr)
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
@@ -342,12 +341,12 @@ static void mmio_writel(NeXTPC *s, hwaddr addr, uint32_t val)
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
@@ -504,9 +503,9 @@ static void scr_writeb(NeXTPC *s, hwaddr addr, uint32_t value)
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
@@ -798,14 +797,14 @@ static void next_irq(void *opaque, int number, int level)
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
@@ -834,7 +833,7 @@ static void next_irq(void *opaque, int number, int level)
             break;
         }
     } else {
-        s->ns->int_status &= ~(1 << shift);
+        s->int_status &= ~(1 << shift);
         cpu_reset_interrupt(CPU(cpu), CPU_INTERRUPT_HARD);
     }
 }
-- 
2.20.1


