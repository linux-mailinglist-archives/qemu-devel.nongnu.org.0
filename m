Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20F96A7D4F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 10:07:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXetu-00017m-DM; Thu, 02 Mar 2023 04:06:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9a0490e5ac528e462c30+7130+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pXetr-00015i-0d; Thu, 02 Mar 2023 04:06:55 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9a0490e5ac528e462c30+7130+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pXeto-00011U-QF; Thu, 02 Mar 2023 04:06:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=85UQU13rtSZx7F6q6rNc6heIG13RbVExc2nMO/uPcPk=; b=MgA6soNocfCz2GsmCciplScQiZ
 Lz3qH4K3PD9WkntPilZLsJz69K9vC6YKNKI3WkV9z/SJy8eQWJyuJqo49lqJKWn6h3Zd0j7EtqchP
 /2964WtF++uLw2Z+zD/zA8+UmIbx0sHaKKn2xb8B5ed6diNaQ+7UkCp/diw1FYMHdZlb9KPgS7nTW
 AKgwfHizJRvbyjbyLTR3GpLkj0U/Q49NkC0mMrEkfvbMhHhGRibuN/Ww7KR/YPFyZH/KgUR6AXDfh
 wYxw/rwgu1xGteUbqymyohE9zs1p6Zz+JTZ5ZifApaFKMziX+U3kK5sWXfFIvaWm13JVr5HHcudfN
 AkRLFtSg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pXetP-00FEON-0A; Thu, 02 Mar 2023 09:06:29 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXetO-004YND-31; Thu, 02 Mar 2023 09:06:26 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
 "Michael S . Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 ReneEngel80@emailn.de
Subject: [PATCH] hw/intc/i8259: Implement legacy LTIM Edge/Level Bank Select
Date: Thu,  2 Mar 2023 09:06:26 +0000
Message-Id: <20230302090626.1085437-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <81f53c106bf9584828402ab92e94ac4331c58c7a.camel@infradead.org>
References: <81f53c106bf9584828402ab92e94ac4331c58c7a.camel@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+9a0490e5ac528e462c30+7130+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Back in the mists of time, before IBM PS/2 came along with MCA and added
per-pin level control in the ELCR register, the i8259 had a chip-wide
level-mode control in bit 3 of ICW1.

Even in the PIIX3 datasheet from 1996 this is documented as 'This bit is
disabled', but apparently MorphOS is using it in the version of the
i8259 which is in the Pegasos2 board as part of the vt82c686 chipset.

It's easy enough to implement, and I think it's harmless enough to do so
unconditionally.

Signed-off-by: David Woodhouse <dwmw2@infradead.org>
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
2.39.0


