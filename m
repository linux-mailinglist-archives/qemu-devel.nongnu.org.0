Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7C83B1A58
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 14:40:05 +0200 (CEST)
Received: from localhost ([::1]:47122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw2Am-0006MY-Go
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 08:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1lw25M-0008DC-QQ
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:34:28 -0400
Received: from mail07.asahi-net.or.jp ([202.224.55.47]:40178)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1lw25K-0000s2-IO
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:34:28 -0400
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail07.asahi-net.or.jp (Postfix) with ESMTPA id 03EF2C1C93;
 Wed, 23 Jun 2021 21:34:23 +0900 (JST)
Received: from yo-satoh-debian.localdomain
 (z215167.dynamic.ppp.asahi-net.or.jp [110.4.215.167])
 by sakura.ysato.name (Postfix) with ESMTPSA id A8FB21C06A2;
 Wed, 23 Jun 2021 21:34:22 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/sh4: sh7750 switch renesas_timer.
Date: Wed, 23 Jun 2021 21:34:16 +0900
Message-Id: <20210623123416.60038-4-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210623123416.60038-1-ysato@users.sourceforge.jp>
References: <20210623123416.60038-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=202.224.55.47;
 envelope-from=ysato@users.sourceforge.jp; helo=mail07.asahi-net.or.jp
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
 hw/sh4/sh7750.c | 32 +++++++++++++++++++++++++++++---
 hw/sh4/Kconfig  |  2 +-
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
index d53a436d8c..bbebac8083 100644
--- a/hw/sh4/sh7750.c
+++ b/hw/sh4/sh7750.c
@@ -30,8 +30,10 @@
 #include "sh7750_regs.h"
 #include "sh7750_regnames.h"
 #include "hw/sh4/sh_intc.h"
-#include "hw/timer/tmu012.h"
+#include "hw/timer/renesas_timer.h"
 #include "exec/exec-all.h"
+#include "qapi/error.h"
+#include "hw/qdev-properties.h"
 
 #define NB_DEVICES 4
 
@@ -752,6 +754,30 @@ static const MemoryRegionOps sh7750_mmct_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static void tmu012_init(MemoryRegion *sysmem, hwaddr base,
+                        int unit, uint64_t freq,
+                        qemu_irq ch0_irq, qemu_irq ch1_irq,
+                        qemu_irq ch2_irq0, qemu_irq ch2_irq1)
+{
+    RenesasTMUState *tmu;
+
+    tmu = RENESAS_TMU(qdev_new(TYPE_RENESAS_TMU));
+    qdev_prop_set_uint32(DEVICE(tmu), "unit", unit);
+    qdev_prop_set_uint64(DEVICE(tmu), "input-freq", freq);
+
+    sysbus_realize(SYS_BUS_DEVICE(tmu), &error_abort);
+    sysbus_connect_irq(SYS_BUS_DEVICE(tmu), 0, ch0_irq);
+    sysbus_connect_irq(SYS_BUS_DEVICE(tmu), 1, ch1_irq);
+    if (unit == 0) {
+        /* ch2_irq1 is not used. */
+        sysbus_connect_irq(SYS_BUS_DEVICE(tmu), 2, ch2_irq0);
+    }
+
+    sysbus_mmio_map(SYS_BUS_DEVICE(tmu), 0, base);
+    sysbus_mmio_map(SYS_BUS_DEVICE(tmu), 1, P4ADDR(base));
+    sysbus_mmio_map(SYS_BUS_DEVICE(tmu), 2, A7ADDR(base));
+}
+
 SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
 {
     SH7750State *s;
@@ -817,7 +843,7 @@ SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
                    s->intc.irqs[SCIF_BRI]);
 
     tmu012_init(sysmem, 0x1fd80000,
-		TMU012_FEAT_TOCR | TMU012_FEAT_3CHAN | TMU012_FEAT_EXTCLK,
+                0,
 		s->periph_freq,
 		s->intc.irqs[TMU0],
 		s->intc.irqs[TMU1],
@@ -840,7 +866,7 @@ SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
         sh_intc_register_sources(&s->intc,
 				 _INTC_ARRAY(vectors_tmu34),
 				 NULL, 0);
-        tmu012_init(sysmem, 0x1e100000, 0, s->periph_freq,
+        tmu012_init(sysmem, 0x1e100000, 1, s->periph_freq,
 		    s->intc.irqs[TMU3],
 		    s->intc.irqs[TMU4],
 		    NULL, NULL);
diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
index ab733a3f76..ee51b5e6ae 100644
--- a/hw/sh4/Kconfig
+++ b/hw/sh4/Kconfig
@@ -21,4 +21,4 @@ config SH7750
     bool
     select SH_INTC
     select SH_SCI
-    select SH_TIMER
+    select RENESAS_TIMER
-- 
2.20.1


