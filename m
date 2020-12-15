Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5BA2DAF23
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:41:44 +0100 (CET)
Received: from localhost ([::1]:45190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpBWJ-0004Yw-Ns
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:41:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1kp9uA-0003pM-Us
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 07:58:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:44794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1kp9u9-0007Rb-6B
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 07:58:14 -0500
From: Huacai Chen <chenhuacai@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH V18 1/5] hw/intc: Rework Loongson LIOINTC
Date: Tue, 15 Dec 2020 20:57:12 +0800
Message-Id: <20201215125716.477023-2-chenhuacai@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201215125716.477023-1-chenhuacai@kernel.org>
References: <20201215125716.477023-1-chenhuacai@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=198.145.29.99; envelope-from=chenhuacai@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 15 Dec 2020 09:20:38 -0500
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As suggested by Philippe Mathieu-Daudé, rework Loongson's liointc:
1, Move macro definitions to loongson_liointc.h;
2, Remove magic values and use macros instead;
3, Replace dead D() code by trace events.

Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
---
 hw/intc/loongson_liointc.c         | 36 +++++++++++++-----------------
 include/hw/intc/loongson_liointc.h | 22 ++++++++++++++++++
 2 files changed, 38 insertions(+), 20 deletions(-)
 create mode 100644 include/hw/intc/loongson_liointc.h

diff --git a/hw/intc/loongson_liointc.c b/hw/intc/loongson_liointc.c
index fbbfb57ee9..e636bb1cfb 100644
--- a/hw/intc/loongson_liointc.c
+++ b/hw/intc/loongson_liointc.c
@@ -1,6 +1,7 @@
 /*
  * QEMU Loongson Local I/O interrupt controler.
  *
+ * Copyright (c) 2020 Huacai Chen <chenhc@lemote.com>
  * Copyright (c) 2020 Jiaxun Yang <jiaxun.yang@flygoat.com>
  *
  * This program is free software: you can redistribute it and/or modify
@@ -19,13 +20,11 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/sysbus.h"
 #include "qemu/module.h"
+#include "qemu/log.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
-#include "qom/object.h"
-
-#define D(x)
+#include "hw/intc/loongson_liointc.h"
 
 #define NUM_IRQS                32
 
@@ -40,13 +39,10 @@
 #define R_IEN                   0x24
 #define R_IEN_SET               0x28
 #define R_IEN_CLR               0x2c
-#define R_PERCORE_ISR(x)        (0x40 + 0x8 * x)
+#define R_ISR_SIZE              0x8
+#define R_START                 0x40
 #define R_END                   0x64
 
-#define TYPE_LOONGSON_LIOINTC "loongson.liointc"
-DECLARE_INSTANCE_CHECKER(struct loongson_liointc, LOONGSON_LIOINTC,
-                         TYPE_LOONGSON_LIOINTC)
-
 struct loongson_liointc {
     SysBusDevice parent_obj;
 
@@ -123,14 +119,13 @@ liointc_read(void *opaque, hwaddr addr, unsigned int size)
         goto out;
     }
 
-    /* Rest is 4 byte */
+    /* Rest are 4 bytes */
     if (size != 4 || (addr % 4)) {
         goto out;
     }
 
-    if (addr >= R_PERCORE_ISR(0) &&
-        addr < R_PERCORE_ISR(NUM_CORES)) {
-        int core = (addr - R_PERCORE_ISR(0)) / 8;
+    if (addr >= R_START && addr < R_END) {
+        int core = (addr - R_START) / R_ISR_SIZE;
         r = p->per_core_isr[core];
         goto out;
     }
@@ -147,7 +142,8 @@ liointc_read(void *opaque, hwaddr addr, unsigned int size)
     }
 
 out:
-    D(qemu_log("%s: size=%d addr=%lx val=%x\n", __func__, size, addr, r));
+    qemu_log_mask(CPU_LOG_INT, "%s: size=%d addr=%lx val=%x\n",
+                  __func__, size, addr, r);
     return r;
 }
 
@@ -158,7 +154,8 @@ liointc_write(void *opaque, hwaddr addr,
     struct loongson_liointc *p = opaque;
     uint32_t value = val64;
 
-    D(qemu_log("%s: size=%d, addr=%lx val=%x\n", __func__, size, addr, value));
+    qemu_log_mask(CPU_LOG_INT, "%s: size=%d, addr=%lx val=%x\n",
+                  __func__, size, addr, value);
 
     /* Mapper is 1 byte */
     if (size == 1 && addr < R_MAPPER_END) {
@@ -166,14 +163,13 @@ liointc_write(void *opaque, hwaddr addr,
         goto out;
     }
 
-    /* Rest is 4 byte */
+    /* Rest are 4 bytes */
     if (size != 4 || (addr % 4)) {
         goto out;
     }
 
-    if (addr >= R_PERCORE_ISR(0) &&
-        addr < R_PERCORE_ISR(NUM_CORES)) {
-        int core = (addr - R_PERCORE_ISR(0)) / 8;
+    if (addr >= R_START && addr < R_END) {
+        int core = (addr - R_START) / R_ISR_SIZE;
         p->per_core_isr[core] = value;
         goto out;
     }
@@ -224,7 +220,7 @@ static void loongson_liointc_init(Object *obj)
     }
 
     memory_region_init_io(&p->mmio, obj, &pic_ops, p,
-                         "loongson.liointc", R_END);
+                         TYPE_LOONGSON_LIOINTC, R_END);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &p->mmio);
 }
 
diff --git a/include/hw/intc/loongson_liointc.h b/include/hw/intc/loongson_liointc.h
new file mode 100644
index 0000000000..848e65eb35
--- /dev/null
+++ b/include/hw/intc/loongson_liointc.h
@@ -0,0 +1,22 @@
+/*
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file "COPYING" in the main directory of this archive
+ * for more details.
+ *
+ * Copyright (c) 2020 Huacai Chen <chenhc@lemote.com>
+ * Copyright (c) 2020 Jiaxun Yang <jiaxun.yang@flygoat.com>
+ *
+ */
+
+#ifndef LOONGSON_LIOINTC_H
+#define LOONGSON_LIOINTC_H
+
+#include "qemu/units.h"
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_LOONGSON_LIOINTC "loongson.liointc"
+DECLARE_INSTANCE_CHECKER(struct loongson_liointc, LOONGSON_LIOINTC,
+                         TYPE_LOONGSON_LIOINTC)
+
+#endif /* LOONGSON_LIOINTC_H */
-- 
2.27.0


