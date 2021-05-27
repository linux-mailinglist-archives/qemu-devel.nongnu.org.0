Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4243926DF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 07:26:51 +0200 (CEST)
Received: from localhost ([::1]:47420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm8Xi-0008Ec-FI
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 01:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1lm8Sg-0008Kr-3S
 for qemu-devel@nongnu.org; Thu, 27 May 2021 01:21:38 -0400
Received: from mail03.asahi-net.or.jp ([202.224.55.15]:32950)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1lm8Sc-000675-2Z
 for qemu-devel@nongnu.org; Thu, 27 May 2021 01:21:37 -0400
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail03.asahi-net.or.jp (Postfix) with ESMTPA id DADF23860B;
 Thu, 27 May 2021 14:21:32 +0900 (JST)
Received: from yo-satoh-debian.localdomain
 (y245018.dynamic.ppp.asahi-net.or.jp [118.243.245.18])
 by sakura.ysato.name (Postfix) with ESMTPSA id 86DCD1C0077;
 Thu, 27 May 2021 14:21:32 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/11] hw/sh4: sh7750 use new hw modules.
Date: Thu, 27 May 2021 14:21:21 +0900
Message-Id: <20210527052122.97103-11-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210527052122.97103-1-ysato@users.sourceforge.jp>
References: <20210527052122.97103-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=202.224.55.15;
 envelope-from=ysato@users.sourceforge.jp; helo=mail03.asahi-net.or.jp
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 include/hw/sh4/sh.h |  8 -----
 hw/sh4/sh7750.c     | 87 +++++++++++++++++++++++++++++++++++++++------
 hw/sh4/Kconfig      |  4 +--
 3 files changed, 79 insertions(+), 20 deletions(-)

diff --git a/include/hw/sh4/sh.h b/include/hw/sh4/sh.h
index becb596979..74e1ba59a8 100644
--- a/include/hw/sh4/sh.h
+++ b/include/hw/sh4/sh.h
@@ -55,14 +55,6 @@ int sh7750_register_io_device(struct SH7750State *s,
 
 /* sh_serial.c */
 #define SH_SERIAL_FEAT_SCIF (1 << 0)
-void sh_serial_init(MemoryRegion *sysmem,
-                    hwaddr base, int feat,
-                    uint32_t freq, Chardev *chr,
-		     qemu_irq eri_source,
-		     qemu_irq rxi_source,
-		     qemu_irq txi_source,
-		     qemu_irq tei_source,
-		     qemu_irq bri_source);
 
 /* sh7750.c */
 qemu_irq sh7750_irl(struct SH7750State *s);
diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
index 2f6c382aa6..b2f6ebe936 100644
--- a/hw/sh4/sh7750.c
+++ b/hw/sh4/sh7750.c
@@ -31,9 +31,10 @@
 #include "sh7750_regs.h"
 #include "sh7750_regnames.h"
 #include "hw/sh4/sh_intc.h"
-#include "hw/timer/tmu012.h"
+#include "hw/timer/renesas_timer.h"
 #include "exec/exec-all.h"
 #include "hw/sh4/sh7751-cpg.h"
+#include "hw/char/renesas_sci.h"
 #include "hw/qdev-properties.h"
 
 #define NB_DEVICES 4
@@ -774,6 +775,74 @@ static SH7751CPGBaseState *sh_cpg_init(MemoryRegion *sysmem,
     return cpg;
 }
 
+static void tmu012_init(MemoryRegion *sysmem, hwaddr base,
+                        int unit,
+                        qemu_irq ch0_irq, qemu_irq ch1_irq,
+                        qemu_irq ch2_irq0, qemu_irq ch2_irq1,
+                        SH7751CPGBaseState *cpg)
+{
+    RenesasTMUState *tmu;
+    char ckname[16];
+
+    tmu = RENESAS_TMU(qdev_new(TYPE_RENESAS_TMU));
+    qdev_prop_set_uint32(DEVICE(tmu), "unit", unit);
+    snprintf(ckname, sizeof(ckname), "pck_tmu-%d", unit);
+    qdev_connect_clock_in(DEVICE(tmu), "pck",
+                          qdev_get_clock_out(DEVICE(cpg), "pck_tmu-0"));
+
+    sysbus_realize(SYS_BUS_DEVICE(tmu), &error_abort);
+    sysbus_connect_irq(SYS_BUS_DEVICE(tmu), 0, ch0_irq);
+    sysbus_connect_irq(SYS_BUS_DEVICE(tmu), 1, ch1_irq);
+    if (unit == 0) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(tmu), 2, ch2_irq0);
+    }
+    /* ch2_irq1 is not used. */
+
+    sysbus_mmio_map(SYS_BUS_DEVICE(tmu), 0, base);
+    sysbus_mmio_map(SYS_BUS_DEVICE(tmu), 1, P4ADDR(base));
+    sysbus_mmio_map(SYS_BUS_DEVICE(tmu), 2, A7ADDR(base));
+}
+
+static void sh_serial_init(MemoryRegion *sysmem,
+                           hwaddr base, int feat,
+                           uint32_t freq, Chardev *chr,
+                           qemu_irq eri_source,
+                           qemu_irq rxi_source,
+                           qemu_irq txi_source,
+                           qemu_irq tei_source,
+                           qemu_irq bri_source,
+                           SH7751CPGBaseState *cpg)
+{
+    RenesasSCIBaseState *sci;
+    char ckname[16];
+
+    switch(feat) {
+    case 0: /* SCI */
+        sci = RENESAS_SCI_BASE(qdev_new(TYPE_RENESAS_SCI));
+        snprintf(ckname, sizeof(ckname), "pck_sci");
+        break;
+    case SH_SERIAL_FEAT_SCIF:
+        sci = RENESAS_SCI_BASE(qdev_new(TYPE_RENESAS_SCIF));
+        snprintf(ckname, sizeof(ckname), "pck_scif");
+        break;
+    }
+    qdev_prop_set_chr(DEVICE(sci), "chardev", chr);
+    qdev_prop_set_uint32(DEVICE(sci), "register-size", SCI_REGSIZE_32);
+    qdev_connect_clock_in(DEVICE(sci), "pck",
+                          qdev_get_clock_out(DEVICE(cpg), ckname));
+    sysbus_connect_irq(SYS_BUS_DEVICE(sci), 0, eri_source);
+    sysbus_connect_irq(SYS_BUS_DEVICE(sci), 1, rxi_source);
+    sysbus_connect_irq(SYS_BUS_DEVICE(sci), 2, txi_source);
+    if (tei_source)
+        sysbus_connect_irq(SYS_BUS_DEVICE(sci), 3, tei_source);
+    if (bri_source)
+        sysbus_connect_irq(SYS_BUS_DEVICE(sci), 3, bri_source);
+    sysbus_realize(SYS_BUS_DEVICE(sci), &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(sci), 0, base);
+    sysbus_mmio_map(SYS_BUS_DEVICE(sci), 1, P4ADDR(base));
+    sysbus_mmio_map(SYS_BUS_DEVICE(sci), 2, A7ADDR(base));
+}
+
 SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
 {
     SH7750State *s;
@@ -830,7 +899,7 @@ SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
                    s->intc.irqs[SCI1_RXI],
                    s->intc.irqs[SCI1_TXI],
                    s->intc.irqs[SCI1_TEI],
-                   NULL);
+                   NULL, cpg);
     sh_serial_init(sysmem, 0x1fe80000,
                    SH_SERIAL_FEAT_SCIF,
                    s->periph_freq, serial_hd(1),
@@ -838,17 +907,14 @@ SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
                    s->intc.irqs[SCIF_RXI],
                    s->intc.irqs[SCIF_TXI],
                    NULL,
-                   s->intc.irqs[SCIF_BRI]);
+                   s->intc.irqs[SCIF_BRI], cpg);
 
-    tmu012_init(sysmem, 0x1fd80000,
-		TMU012_FEAT_TOCR | TMU012_FEAT_3CHAN | TMU012_FEAT_EXTCLK,
-		s->periph_freq,
+    tmu012_init(sysmem, 0x1fd80000, 0,
 		s->intc.irqs[TMU0],
 		s->intc.irqs[TMU1],
 		s->intc.irqs[TMU2_TUNI],
-		s->intc.irqs[TMU2_TICPI]);
+		s->intc.irqs[TMU2_TICPI], cpg);
 
-    sysbus_realize(SYS_BUS_DEVICE(cpg), &error_abort);
     if (cpu->env.id & (SH_CPU_SH7750 | SH_CPU_SH7750S | SH_CPU_SH7751)) {
         sh_intc_register_sources(&s->intc,
 				 _INTC_ARRAY(vectors_dma4),
@@ -865,10 +931,10 @@ SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
         sh_intc_register_sources(&s->intc,
 				 _INTC_ARRAY(vectors_tmu34),
 				 NULL, 0);
-        tmu012_init(sysmem, 0x1e100000, 0, s->periph_freq,
+        tmu012_init(sysmem, 0x1e100000, 1,
 		    s->intc.irqs[TMU3],
 		    s->intc.irqs[TMU4],
-		    NULL, NULL);
+		    NULL, NULL, cpg);
     }
 
     if (cpu->env.id & (SH_CPU_SH7751_ALL)) {
@@ -886,6 +952,7 @@ SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
     sh_intc_register_sources(&s->intc,
 				_INTC_ARRAY(vectors_irl),
 				_INTC_ARRAY(groups_irl));
+    sysbus_realize(SYS_BUS_DEVICE(cpg), &error_abort);
     return s;
 }
 
diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
index ab733a3f76..b2da634d22 100644
--- a/hw/sh4/Kconfig
+++ b/hw/sh4/Kconfig
@@ -20,5 +20,5 @@ config SHIX
 config SH7750
     bool
     select SH_INTC
-    select SH_SCI
-    select SH_TIMER
+    select RENESAS_TIMER
+    select RENESAS_SCI
-- 
2.20.1


