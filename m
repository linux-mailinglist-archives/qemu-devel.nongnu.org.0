Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D0F3A95B3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 11:14:30 +0200 (CEST)
Received: from localhost ([::1]:56668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltRcz-00060g-MX
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 05:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1ltRbU-0004gi-Sm
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 05:12:57 -0400
Received: from mail02.asahi-net.or.jp ([202.224.55.14]:57994)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1ltRbS-00048k-Nd
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 05:12:56 -0400
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail02.asahi-net.or.jp (Postfix) with ESMTPA id 2624744A54;
 Wed, 16 Jun 2021 18:12:51 +0900 (JST)
Received: from yo-satoh-debian.localdomain
 (z215167.dynamic.ppp.asahi-net.or.jp [110.4.215.167])
 by sakura.ysato.name (Postfix) with ESMTPSA id C41391C06F8;
 Wed, 16 Jun 2021 18:12:50 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/sh4: sh7750 using renesas_sci.
Date: Wed, 16 Jun 2021 18:12:44 +0900
Message-Id: <20210616091244.33049-4-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210616091244.33049-1-ysato@users.sourceforge.jp>
References: <20210616091244.33049-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=202.224.55.14;
 envelope-from=ysato@users.sourceforge.jp; helo=mail02.asahi-net.or.jp
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_RPBL=1.31, SPF_HELO_NONE=0.001,
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
 include/hw/sh4/sh.h |  8 --------
 hw/sh4/sh7750.c     | 41 +++++++++++++++++++++++++++++++++++++++++
 hw/sh4/Kconfig      |  2 +-
 3 files changed, 42 insertions(+), 9 deletions(-)

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
index d53a436d8c..1ef8b73c65 100644
--- a/hw/sh4/sh7750.c
+++ b/hw/sh4/sh7750.c
@@ -24,6 +24,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/irq.h"
 #include "hw/sh4/sh.h"
 #include "sysemu/sysemu.h"
@@ -32,6 +33,8 @@
 #include "hw/sh4/sh_intc.h"
 #include "hw/timer/tmu012.h"
 #include "exec/exec-all.h"
+#include "hw/char/renesas_sci.h"
+#include "hw/qdev-properties.h"
 
 #define NB_DEVICES 4
 
@@ -752,6 +755,44 @@ static const MemoryRegionOps sh7750_mmct_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static void sh_serial_init(MemoryRegion *sysmem,
+                           hwaddr base, int feat,
+                           uint32_t freq, Chardev *chr,
+                           qemu_irq eri_source,
+                           qemu_irq rxi_source,
+                           qemu_irq txi_source,
+                           qemu_irq tei_source,
+                           qemu_irq bri_source)
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
+    qdev_prop_set_uint32(DEVICE(sci), "register-size", SCI_REGWIDTH_32);
+    qdev_prop_set_uint64(DEVICE(sci), "input-freq", freq);
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
diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
index ab733a3f76..d23d5f5b1c 100644
--- a/hw/sh4/Kconfig
+++ b/hw/sh4/Kconfig
@@ -20,5 +20,5 @@ config SHIX
 config SH7750
     bool
     select SH_INTC
-    select SH_SCI
+    select RENESAS_SCI
     select SH_TIMER
-- 
2.20.1


