Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6393926E0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 07:26:53 +0200 (CEST)
Received: from localhost ([::1]:47640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm8Xk-0008Px-9o
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 01:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1lm8Si-0008P3-83
 for qemu-devel@nongnu.org; Thu, 27 May 2021 01:21:40 -0400
Received: from mail03.asahi-net.or.jp ([202.224.55.15]:32938)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1lm8Sc-00066C-97
 for qemu-devel@nongnu.org; Thu, 27 May 2021 01:21:39 -0400
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail03.asahi-net.or.jp (Postfix) with ESMTPA id 41FEC385BB;
 Thu, 27 May 2021 14:21:32 +0900 (JST)
Received: from yo-satoh-debian.localdomain
 (y245018.dynamic.ppp.asahi-net.or.jp [118.243.245.18])
 by sakura.ysato.name (Postfix) with ESMTPSA id D82651C0077;
 Thu, 27 May 2021 14:21:31 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/11] hw/rx: rx62n use new hw modules.
Date: Thu, 27 May 2021 14:21:19 +0900
Message-Id: <20210527052122.97103-9-ysato@users.sourceforge.jp>
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
 include/hw/rx/rx62n.h | 10 +++++-----
 hw/rx/rx62n.c         | 18 ++++++++++++------
 hw/rx/Kconfig         |  4 ++--
 3 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/include/hw/rx/rx62n.h b/include/hw/rx/rx62n.h
index 44f5fcc74d..942ed0639f 100644
--- a/include/hw/rx/rx62n.h
+++ b/include/hw/rx/rx62n.h
@@ -26,8 +26,8 @@
 
 #include "target/rx/cpu.h"
 #include "hw/intc/rx_icu.h"
-#include "hw/timer/renesas_tmr.h"
-#include "hw/timer/renesas_cmt.h"
+#include "hw/timer/renesas_tmr8.h"
+#include "hw/timer/renesas_timer.h"
 #include "hw/char/renesas_sci.h"
 #include "hw/rx/rx62n-cpg.h"
 #include "qemu/units.h"
@@ -56,9 +56,9 @@ struct RX62NState {
 
     RXCPU cpu;
     RXICUState icu;
-    RTMRState tmr[RX62N_NR_TMR];
-    RCMTState cmt[RX62N_NR_CMT];
-    RSCIState sci[RX62N_NR_SCI];
+    RenesasTMR8State tmr[RX62N_NR_TMR];
+    RenesasCMTState cmt[RX62N_NR_CMT];
+    RenesasSCIState sci[RX62N_NR_SCI];
     RX62NCPGState cpg;
 
     MemoryRegion *sysmem;
diff --git a/hw/rx/rx62n.c b/hw/rx/rx62n.c
index cfd41930bf..58eff0b4a3 100644
--- a/hw/rx/rx62n.c
+++ b/hw/rx/rx62n.c
@@ -164,7 +164,7 @@ static void register_tmr(RX62NState *s, int unit)
     char ckname[16];
 
     object_initialize_child(OBJECT(s), "tmr[*]",
-                            &s->tmr[unit], TYPE_RENESAS_TMR);
+                            &s->tmr[unit], TYPE_RENESAS_TMR8);
     tmr = SYS_BUS_DEVICE(&s->tmr[unit]);
 
     irqbase = RX62N_TMR_IRQ + TMR_NR_IRQ * unit;
@@ -174,10 +174,10 @@ static void register_tmr(RX62NState *s, int unit)
     sysbus_mmio_map(tmr, 0, RX62N_TMR_BASE + unit * 0x10);
 
     qdev_prop_set_uint32(DEVICE(tmr), "unit", unit);
-    sysbus_realize(tmr, &error_abort);
     snprintf(ckname, sizeof(ckname), "pck_tmr8-%d", unit);
     qdev_connect_clock_in(DEVICE(tmr), "pck",
                           qdev_get_clock_out(DEVICE(&s->cpg), ckname));
+    sysbus_realize(tmr, &error_abort);
 }
 
 static void register_cmt(RX62NState *s, int unit)
@@ -190,6 +190,9 @@ static void register_cmt(RX62NState *s, int unit)
                             &s->cmt[unit], TYPE_RENESAS_CMT);
     cmt = SYS_BUS_DEVICE(&s->cmt[unit]);
     qdev_prop_set_uint32(DEVICE(cmt), "unit", unit);
+    snprintf(ckname, sizeof(ckname), "pck_cmt-%d", unit);
+    qdev_connect_clock_in(DEVICE(cmt), "pck",
+                          qdev_get_clock_out(DEVICE(&s->cpg), ckname));
 
     irqbase = RX62N_CMT_IRQ + CMT_NR_IRQ * unit;
     for (i = 0; i < CMT_NR_IRQ; i++) {
@@ -197,20 +200,23 @@ static void register_cmt(RX62NState *s, int unit)
     }
     sysbus_mmio_map(cmt, 0, RX62N_CMT_BASE + unit * 0x10);
     sysbus_realize(cmt, &error_abort);
-    snprintf(ckname, sizeof(ckname), "pck_cmt-%d", unit);
-    qdev_connect_clock_in(DEVICE(cmt), "pck",
-                          qdev_get_clock_out(DEVICE(&s->cpg), ckname));
 }
 
 static void register_sci(RX62NState *s, int unit)
 {
     SysBusDevice *sci;
     int i, irqbase;
+    char ckname[16];
 
     object_initialize_child(OBJECT(s), "sci[*]",
-                            &s->sci[unit], TYPE_RENESAS_SCI);
+                            &s->sci[unit], TYPE_RENESAS_SCIA);
     sci = SYS_BUS_DEVICE(&s->sci[unit]);
     qdev_prop_set_chr(DEVICE(sci), "chardev", serial_hd(unit));
+    qdev_prop_set_uint32(DEVICE(sci), "unit", unit);
+    qdev_prop_set_uint32(DEVICE(sci), "register-size", SCI_REGSIZE_8);
+    snprintf(ckname, sizeof(ckname), "pck_sci-%d", unit);
+    qdev_connect_clock_in(DEVICE(sci), "pck",
+                          qdev_get_clock_out(DEVICE(&s->cpg), ckname));
     sysbus_realize(sci, &error_abort);
 
     irqbase = RX62N_SCI_IRQ + SCI_NR_IRQ * unit;
diff --git a/hw/rx/Kconfig b/hw/rx/Kconfig
index 2b297c5a6a..9cd1082623 100644
--- a/hw/rx/Kconfig
+++ b/hw/rx/Kconfig
@@ -1,8 +1,8 @@
 config RX62N_MCU
     bool
     select RX_ICU
-    select RENESAS_TMR
-    select RENESAS_CMT
+    select RENESAS_TMR8
+    select RENESAS_TIMER
     select RENESAS_SCI
 
 config RX_GDBSIM
-- 
2.20.1


