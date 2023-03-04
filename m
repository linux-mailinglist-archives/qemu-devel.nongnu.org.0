Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C217E6AAA89
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 15:49:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYTBY-0004UM-RP; Sat, 04 Mar 2023 09:48:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pYTBW-0004SF-Fx; Sat, 04 Mar 2023 09:48:30 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pYTBU-00025K-FF; Sat, 04 Mar 2023 09:48:30 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1D9927466FF;
 Sat,  4 Mar 2023 15:48:20 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id DD08374645F; Sat,  4 Mar 2023 15:48:19 +0100 (CET)
Message-Id: <528bdd7bc8ae3513ef50bc41303b74fbca279cdf.1677940224.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1677940224.git.balaton@eik.bme.hu>
References: <cover.1677940224.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v6 2/7] hw/intc/i8259: Implement legacy LTIM Edge/Level Bank
 Select
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 ReneEngel80@emailn.de, David Woodhouse <dwmw2@infradead.org>,
 Michael S. Tsirkin <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Date: Sat,  4 Mar 2023 15:48:19 +0100 (CET)
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

From: David Woodhouse <dwmw2@infradead.org>

Back in the mists of time, before EISA came along and required per-pin
level control in the ELCR register, the i8259 had a single chip-wide
level-mode control in bit 3 of ICW1.

Even in the PIIX3 datasheet from 1996 this is documented as 'This bit is
disabled', but apparently MorphOS is using it in the version of the
i8259 which is in the Pegasos2 board as part of the VT8231 chipset.

It's easy enough to implement, and I think it's harmless enough to do so
unconditionally.

Signed-off-by: David Woodhouse <dwmw2@infradead.org>
[balaton: updated commit message as asked by author]
Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/intc/i8259.c                 | 10 ++++------
 hw/intc/i8259_common.c          | 24 +++++++++++++++++++++++-
 include/hw/isa/i8259_internal.h |  1 +
 3 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index 17910f3bcb..bbae2d87f4 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -133,7 +133,7 @@ static void pic_set_irq(void *opaque, int irq, int level)
     }
 #endif
 
-    if (s->elcr & mask) {
+    if (s->ltim || (s->elcr & mask)) {
         /* level triggered */
         if (level) {
             s->irr |= mask;
@@ -167,7 +167,7 @@ static void pic_intack(PICCommonState *s, int irq)
         s->isr |= (1 << irq);
     }
     /* We don't clear a level sensitive interrupt here */
-    if (!(s->elcr & (1 << irq))) {
+    if (!s->ltim && !(s->elcr & (1 << irq))) {
         s->irr &= ~(1 << irq);
     }
     pic_update_irq(s);
@@ -224,6 +224,7 @@ static void pic_reset(DeviceState *dev)
     PICCommonState *s = PIC_COMMON(dev);
 
     s->elcr = 0;
+    s->ltim = 0;
     pic_init_reset(s);
 }
 
@@ -243,10 +244,7 @@ static void pic_ioport_write(void *opaque, hwaddr addr64,
             s->init_state = 1;
             s->init4 = val & 1;
             s->single_mode = val & 2;
-            if (val & 0x08) {
-                qemu_log_mask(LOG_UNIMP,
-                              "i8259: level sensitive irq not supported\n");
-            }
+            s->ltim = val & 8;
         } else if (val & 0x08) {
             if (val & 0x04) {
                 s->poll = 1;
diff --git a/hw/intc/i8259_common.c b/hw/intc/i8259_common.c
index af2e4a2241..c931dc2d07 100644
--- a/hw/intc/i8259_common.c
+++ b/hw/intc/i8259_common.c
@@ -51,7 +51,7 @@ void pic_reset_common(PICCommonState *s)
     s->special_fully_nested_mode = 0;
     s->init4 = 0;
     s->single_mode = 0;
-    /* Note: ELCR is not reset */
+    /* Note: ELCR and LTIM are not reset */
 }
 
 static int pic_dispatch_pre_save(void *opaque)
@@ -144,6 +144,24 @@ static void pic_print_info(InterruptStatsProvider *obj, Monitor *mon)
                    s->special_fully_nested_mode);
 }
 
+static bool ltim_state_needed(void *opaque)
+{
+    PICCommonState *s = PIC_COMMON(opaque);
+
+    return !!s->ltim;
+}
+
+static const VMStateDescription vmstate_pic_ltim = {
+    .name = "i8259/ltim",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = ltim_state_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(ltim, PICCommonState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_pic_common = {
     .name = "i8259",
     .version_id = 1,
@@ -168,6 +186,10 @@ static const VMStateDescription vmstate_pic_common = {
         VMSTATE_UINT8(single_mode, PICCommonState),
         VMSTATE_UINT8(elcr, PICCommonState),
         VMSTATE_END_OF_LIST()
+    },
+    .subsections = (const VMStateDescription*[]) {
+        &vmstate_pic_ltim,
+        NULL
     }
 };
 
diff --git a/include/hw/isa/i8259_internal.h b/include/hw/isa/i8259_internal.h
index 155b098452..f9dcc4163e 100644
--- a/include/hw/isa/i8259_internal.h
+++ b/include/hw/isa/i8259_internal.h
@@ -61,6 +61,7 @@ struct PICCommonState {
     uint8_t single_mode; /* true if slave pic is not initialized */
     uint8_t elcr; /* PIIX edge/trigger selection*/
     uint8_t elcr_mask;
+    uint8_t ltim; /* Edge/Level Bank Select (pre-PIIX, chip-wide) */
     qemu_irq int_out[1];
     uint32_t master; /* reflects /SP input pin */
     uint32_t iobase;
-- 
2.30.8


