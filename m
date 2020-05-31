Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FA61E98D3
	for <lists+qemu-devel@lfdr.de>; Sun, 31 May 2020 18:28:02 +0200 (CEST)
Received: from localhost ([::1]:54814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jfQob-00012K-S7
	for lists+qemu-devel@lfdr.de; Sun, 31 May 2020 12:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1jfQlM-0004Er-Ux
 for qemu-devel@nongnu.org; Sun, 31 May 2020 12:24:40 -0400
Received: from mail02.asahi-net.or.jp ([202.224.55.14]:58735)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1jfQlJ-0004KC-Ux
 for qemu-devel@nongnu.org; Sun, 31 May 2020 12:24:40 -0400
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail02.asahi-net.or.jp (Postfix) with ESMTPA id 9475FEB8D4;
 Mon,  1 Jun 2020 01:24:34 +0900 (JST)
Received: from yo-satoh-debian.localdomain (ZM005235.ppp.dion.ne.jp
 [222.8.5.235])
 by sakura.ysato.name (Postfix) with ESMTPSA id 421891C0DB3;
 Mon,  1 Jun 2020 01:24:34 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/10] hw/sh4: Convert renesas_sci.
Date: Mon,  1 Jun 2020 01:24:24 +0900
Message-Id: <20200531162427.57410-8-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200531162427.57410-1-ysato@users.sourceforge.jp>
References: <20200531162427.57410-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=202.224.55.14;
 envelope-from=ysato@users.sourceforge.jp; helo=mail02.asahi-net.or.jp
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/31 12:24:33
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_SOFTFAIL=0.665, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

Using new implementation SCI module.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 include/hw/sh4/sh.h | 11 -----------
 hw/sh4/sh7750.c     | 45 +++++++++++++++++++++++++++++++++++++++++----
 hw/sh4/Kconfig      |  1 +
 3 files changed, 42 insertions(+), 15 deletions(-)

diff --git a/include/hw/sh4/sh.h b/include/hw/sh4/sh.h
index 767a2df7e2..e184b4b300 100644
--- a/include/hw/sh4/sh.h
+++ b/include/hw/sh4/sh.h
@@ -38,17 +38,6 @@ void tmu012_init(struct MemoryRegion *sysmem, hwaddr base,
 		 qemu_irq ch2_irq0, qemu_irq ch2_irq1);
 
 
-/* sh_serial.c */
-#define SH_SERIAL_FEAT_SCIF (1 << 0)
-void sh_serial_init(MemoryRegion *sysmem,
-                    hwaddr base, int feat,
-                    uint32_t freq, Chardev *chr,
-		     qemu_irq eri_source,
-		     qemu_irq rxi_source,
-		     qemu_irq txi_source,
-		     qemu_irq tei_source,
-		     qemu_irq bri_source);
-
 /* sh7750.c */
 qemu_irq sh7750_irl(struct SH7750State *s);
 
diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
index d660714443..150d3029f7 100644
--- a/hw/sh4/sh7750.c
+++ b/hw/sh4/sh7750.c
@@ -24,12 +24,15 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/irq.h"
 #include "hw/sh4/sh.h"
 #include "sysemu/sysemu.h"
 #include "sh7750_regs.h"
 #include "sh7750_regnames.h"
 #include "hw/sh4/sh_intc.h"
+#include "hw/char/renesas_sci.h"
+#include "hw/qdev-properties.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
 
@@ -752,6 +755,40 @@ static const MemoryRegionOps sh7750_mmct_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static void sh_serial_init(SH7750State *s, MemoryRegion *sysmem,
+                    hwaddr base, int feat,
+                    uint32_t freq, Chardev *chr,
+                    qemu_irq eri_source,
+                    qemu_irq rxi_source,
+                    qemu_irq txi_source,
+                    qemu_irq tei_source,
+                    qemu_irq bri_source)
+{
+    DeviceState *dev;
+    SysBusDevice *sci;
+
+    dev = qdev_create(NULL, TYPE_RENESAS_SCI);
+
+    sci = SYS_BUS_DEVICE(dev);
+
+    qdev_prop_set_chr(dev, "chardev", chr);
+    qdev_prop_set_uint64(dev, "input-freq", freq);
+    qdev_prop_set_int32(dev, "feature", feat);
+    qdev_prop_set_int32(dev, "register-size", 32);
+    qdev_init_nofail(dev);
+    sysbus_mmio_map(sci, 0, base);
+    sysbus_mmio_map(sci, 1, P4ADDR(base));
+    sysbus_mmio_map(sci, 2, A7ADDR(base));
+    sysbus_connect_irq(sci, 0, eri_source);
+    sysbus_connect_irq(sci, 1, rxi_source);
+    sysbus_connect_irq(sci, 2, txi_source);
+    if (feat == SCI_FEAT_SCI) {
+        sysbus_connect_irq(sci, 3, tei_source);
+    } else {
+        sysbus_connect_irq(sci, 3, bri_source);
+    }
+}
+
 SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
 {
     SH7750State *s;
@@ -800,15 +837,15 @@ SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
 
     cpu->env.intc_handle = &s->intc;
 
-    sh_serial_init(sysmem, 0x1fe00000,
-                   0, s->periph_freq, serial_hd(0),
+    sh_serial_init(s, sysmem, 0x1fe00000,
+                   SCI_FEAT_SCI, s->periph_freq, serial_hd(0),
                    s->intc.irqs[SCI1_ERI],
                    s->intc.irqs[SCI1_RXI],
                    s->intc.irqs[SCI1_TXI],
                    s->intc.irqs[SCI1_TEI],
                    NULL);
-    sh_serial_init(sysmem, 0x1fe80000,
-                   SH_SERIAL_FEAT_SCIF,
+    sh_serial_init(s, sysmem, 0x1fe80000,
+                   SCI_FEAT_SCIF,
                    s->periph_freq, serial_hd(1),
                    s->intc.irqs[SCIF_ERI],
                    s->intc.irqs[SCIF_RXI],
diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
index 4cbce3a0ed..38509b7e65 100644
--- a/hw/sh4/Kconfig
+++ b/hw/sh4/Kconfig
@@ -22,3 +22,4 @@ config SH7750
 config SH4
     bool
     select PTIMER
+    select RENESAS_SCI
-- 
2.20.1


