Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 216A41FD553
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 21:21:31 +0200 (CEST)
Received: from localhost ([::1]:52884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jldco-0005hE-5o
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 15:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jldX9-0004ZR-0e
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 15:15:39 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jldX6-0006UT-50
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 15:15:38 -0400
Received: by mail-ej1-x62a.google.com with SMTP id l27so3763649ejc.1
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 12:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vrcw+DmTS8CfHuCBOui+zn38OLxR/H6DISwkgtmUX1s=;
 b=CLQ78UEqsrqkr7rJ39kbTeVlElwLSq8Or5oGMcjmw9THlOViD+p+cJIdFrgiSD+dhT
 6r8c9UCAdonUZzpt4Hz7fFaSO0ycXZ15BXYmPKzZgFWGtaLIvJa8UQjsXXhVVFwn8Wat
 lZHrwnfPaBzJHg3ZwraAysCne6MNxdcjVJ7KufUPjNj8d+lxynjNNxxsmUHufSLfY/qd
 u6FMS8gf1rZ3oqSClRY8AGfGHU8kFeol8ARKfiTz8OE+sBnwOR0z3owM3smcyuZN0Ram
 gB7yjFGgr9x6VBB0KPKWTJBpZFprdHFo1pj6TAaOWYnYFRpe2pokoBgUykBUGCcsTmay
 hQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vrcw+DmTS8CfHuCBOui+zn38OLxR/H6DISwkgtmUX1s=;
 b=ovy7jDSgzQR67LdLRC6l0zhQ+E2vEyQafOX7NE7TqHCUAPh9lxmSxS/RxhfKn5urMf
 WBPz6X8j7jLqpz4QOpBdvPXsEIKJD0uNE0yLHto7pdj7ldjtajA7+4J99lBSLrsei5J1
 uRQKgiafmtuzVusYyEnnl+zPn4754GdhicW0NSyVEjxXuhnSB90mMz4SwZD6MGUS4kC+
 zHPYJkQRpXoFxRcUv8vkvTX+LeT8nSCYk1hmUb8wzRI9tb5aRgsvGYxZMCrDIj0nOVfD
 9XpPKZlQZP93agqqHCsRocc0sorlUKWGN/k4mcoJfwylS7N5RA8NNgFmGn5I5St9xZdA
 XayQ==
X-Gm-Message-State: AOAM530F806L6l/0eFS94mUYbDQqMDs42MsJqDVwVh6OLx39A56RwiRD
 AFLiCMDMBddO2vkeE2tb1Is=
X-Google-Smtp-Source: ABdhPJxDL6Dw9v96UZ+ZY+KNIiemGNFW1Vr8BYZPwzRi19vL958CmmTM6EYOvsXpPXknUGBojDvWQg==
X-Received: by 2002:a17:907:4096:: with SMTP id nm6mr669835ejb.4.1592421334786; 
 Wed, 17 Jun 2020 12:15:34 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-59-160.dynamicip.rima-tde.net.
 [83.59.160.93])
 by smtp.gmail.com with ESMTPSA id y21sm324308edl.72.2020.06.17.12.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 12:15:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <rth@twiddle.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-devel@nongnu.org
Subject: [PATCH rc1 10/15] hw/rx: RX62N microcontroller (MCU)
Date: Wed, 17 Jun 2020 21:15:14 +0200
Message-Id: <20200617191519.14842-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200617191519.14842-1-f4bug@amsat.org>
References: <20200617191519.14842-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yoshinori Sato <ysato@users.sourceforge.jp>

rx62n - RX62N cpu.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[PMD: Use TYPE_RX62N_CPU, use #define for RX62N_NR_TMR/CMT/SCI,
 renamed CPU -> MCU, device -> microcontroller]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200224141923.82118-18-ysato@users.sourceforge.jp>
[PMD: Rebased on b77b5b3dc7, split of machine, use &error_abort]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/rx/rx62n.h |  75 +++++++++++++
 hw/rx/rx62n.c         | 254 ++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS           |   2 +
 hw/Kconfig            |   1 +
 hw/rx/Kconfig         |   6 +
 hw/rx/Makefile.objs   |   1 +
 6 files changed, 339 insertions(+)
 create mode 100644 include/hw/rx/rx62n.h
 create mode 100644 hw/rx/rx62n.c
 create mode 100644 hw/rx/Kconfig
 create mode 100644 hw/rx/Makefile.objs

diff --git a/include/hw/rx/rx62n.h b/include/hw/rx/rx62n.h
new file mode 100644
index 0000000000..7c6023bcd6
--- /dev/null
+++ b/include/hw/rx/rx62n.h
@@ -0,0 +1,75 @@
+/*
+ * RX62N MCU Object
+ *
+ * Datasheet: RX62N Group, RX621 Group User's Manual: Hardware
+ *            (Rev.1.40 R01UH0033EJ0140)
+ *
+ * Copyright (c) 2019 Yoshinori Sato
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_RX_RX62N_MCU_H
+#define HW_RX_RX62N_MCU_H
+
+#include "target/rx/cpu.h"
+#include "hw/intc/rx_icu.h"
+#include "hw/timer/renesas_tmr.h"
+#include "hw/timer/renesas_cmt.h"
+#include "hw/char/renesas_sci.h"
+#include "qemu/units.h"
+
+#define TYPE_RX62N_MCU "rx62n-mcu"
+#define RX62N_MCU(obj) OBJECT_CHECK(RX62NState, (obj), TYPE_RX62N_MCU)
+
+#define RX62N_NR_TMR    2
+#define RX62N_NR_CMT    2
+#define RX62N_NR_SCI    6
+
+typedef struct RX62NState {
+    /*< private >*/
+    DeviceState parent_obj;
+    /*< public >*/
+
+    RXCPU cpu;
+    RXICUState icu;
+    RTMRState tmr[RX62N_NR_TMR];
+    RCMTState cmt[RX62N_NR_CMT];
+    RSCIState sci[RX62N_NR_SCI];
+
+    MemoryRegion *sysmem;
+    bool kernel;
+
+    MemoryRegion iram;
+    MemoryRegion iomem1;
+    MemoryRegion d_flash;
+    MemoryRegion iomem2;
+    MemoryRegion iomem3;
+    MemoryRegion c_flash;
+    qemu_irq irq[NR_IRQS];
+} RX62NState;
+
+/*
+ * RX62N Internal Memory
+ * It is the value of R5F562N8.
+ * Please change the size for R5F562N7.
+ */
+#define RX62N_IRAM_SIZE (96 * KiB)
+#define RX62N_DFLASH_SIZE (32 * KiB)
+#define RX62N_CFLASH_SIZE (512 * KiB)
+
+#define RX62N_PCLK (48 * 1000 * 1000)
+
+#endif
diff --git a/hw/rx/rx62n.c b/hw/rx/rx62n.c
new file mode 100644
index 0000000000..85b7770023
--- /dev/null
+++ b/hw/rx/rx62n.c
@@ -0,0 +1,254 @@
+/*
+ * RX62N Microcontroller
+ *
+ * Datasheet: RX62N Group, RX621 Group User's Manual: Hardware
+ * (Rev.1.40 R01UH0033EJ0140)
+ *
+ * Copyright (c) 2019 Yoshinori Sato
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/hw.h"
+#include "hw/rx/rx62n.h"
+#include "hw/loader.h"
+#include "hw/sysbus.h"
+#include "hw/qdev-properties.h"
+#include "sysemu/sysemu.h"
+#include "cpu.h"
+
+/*
+ * RX62N Internal Memory
+ */
+#define RX62N_IRAM_BASE     0x00000000
+#define RX62N_DFLASH_BASE   0x00100000
+#define RX62N_CFLASH_BASE   0xfff80000
+
+/*
+ * RX62N Peripheral Address
+ * See users manual section 5
+ */
+#define RX62N_ICU_BASE  0x00087000
+#define RX62N_TMR_BASE  0x00088200
+#define RX62N_CMT_BASE  0x00088000
+#define RX62N_SCI_BASE  0x00088240
+
+/*
+ * RX62N Peripheral IRQ
+ * See users manual section 11
+ */
+#define RX62N_TMR_IRQ   174
+#define RX62N_CMT_IRQ   28
+#define RX62N_SCI_IRQ   214
+
+/*
+ * IRQ -> IPR mapping table
+ * 0x00 - 0x91: IPR no (IPR00 to IPR91)
+ * 0xff: IPR not assigned
+ * See "11.3.1 Interrupt Vector Table" in hardware manual.
+ */
+static const uint8_t ipr_table[NR_IRQS] = {
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, /* 15 */
+    0x00, 0xff, 0xff, 0xff, 0xff, 0x01, 0xff, 0x02,
+    0xff, 0xff, 0xff, 0x03, 0x04, 0x05, 0x06, 0x07, /* 31 */
+    0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
+    0x10, 0x11, 0x12, 0x13, 0x14, 0x14, 0x14, 0x14, /* 47 */
+    0x15, 0x15, 0x15, 0x15, 0xff, 0xff, 0xff, 0xff,
+    0x18, 0x18, 0x18, 0x18, 0x18, 0x1d, 0x1e, 0x1f, /* 63 */
+    0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27,
+    0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f, /* 79 */
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0x3a, 0x3b, 0x3c, 0xff, 0xff, 0xff, /* 95 */
+    0x40, 0xff, 0x44, 0x45, 0xff, 0xff, 0x48, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, /* 111 */
+    0xff, 0xff, 0x51, 0x51, 0x51, 0x51, 0x52, 0x52,
+    0x52, 0x53, 0x53, 0x54, 0x54, 0x55, 0x55, 0x56, /* 127 */
+    0x56, 0x57, 0x57, 0x57, 0x57, 0x58, 0x59, 0x59,
+    0x59, 0x59, 0x5a, 0x5b, 0x5b, 0x5b, 0x5c, 0x5c, /* 143 */
+    0x5c, 0x5c, 0x5d, 0x5d, 0x5d, 0x5e, 0x5e, 0x5f,
+    0x5f, 0x60, 0x60, 0x61, 0x61, 0x62, 0x62, 0x62, /* 159 */
+    0x62, 0x63, 0x64, 0x64, 0x64, 0x64, 0x65, 0x66,
+    0x66, 0x66, 0x67, 0x67, 0x67, 0x67, 0x68, 0x68, /* 175 */
+    0x68, 0x69, 0x69, 0x69, 0x6a, 0x6a, 0x6a, 0x6b,
+    0x6b, 0x6b, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, /* 191 */
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x70, 0x71,
+    0x72, 0x73, 0x74, 0x75, 0xff, 0xff, 0xff, 0xff, /* 207 */
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x80, 0x80,
+    0x80, 0x80, 0x81, 0x81, 0x81, 0x81, 0x82, 0x82, /* 223 */
+    0x82, 0x82, 0x83, 0x83, 0x83, 0x83, 0xff, 0xff,
+    0xff, 0xff, 0x85, 0x85, 0x85, 0x85, 0x86, 0x86, /* 239 */
+    0x86, 0x86, 0xff, 0xff, 0xff, 0xff, 0x88, 0x89,
+    0x8a, 0x8b, 0x8c, 0x8d, 0x8e, 0x8f, 0x90, 0x91, /* 255 */
+};
+
+/*
+ * Level triggerd IRQ list
+ * Not listed IRQ is Edge trigger.
+ * See "11.3.1 Interrupt Vector Table" in hardware manual.
+ */
+static const uint8_t levelirq[] = {
+     16,  21,  32,  44,  47,  48,  51,  64,  65,  66,
+     67,  68,  69,  70,  71,  72,  73,  74,  75,  76,
+     77,  78,  79,  90,  91, 170, 171, 172, 173, 214,
+    217, 218, 221, 222, 225, 226, 229, 234, 237, 238,
+    241, 246, 249, 250, 253,
+};
+
+static void register_icu(RX62NState *s)
+{
+    int i;
+    SysBusDevice *icu;
+
+    object_initialize_child(OBJECT(s), "icu", &s->icu, TYPE_RX_ICU);
+    icu = SYS_BUS_DEVICE(&s->icu);
+    qdev_prop_set_uint32(DEVICE(icu), "len-ipr-map", NR_IRQS);
+    for (i = 0; i < NR_IRQS; i++) {
+        char propname[32];
+        snprintf(propname, sizeof(propname), "ipr-map[%d]", i);
+        qdev_prop_set_uint32(DEVICE(icu), propname, ipr_table[i]);
+    }
+    qdev_prop_set_uint32(DEVICE(icu), "len-trigger-level",
+                         ARRAY_SIZE(levelirq));
+    for (i = 0; i < ARRAY_SIZE(levelirq); i++) {
+        char propname[32];
+        snprintf(propname, sizeof(propname), "trigger-level[%d]", i);
+        qdev_prop_set_uint32(DEVICE(icu), propname, levelirq[i]);
+    }
+
+    for (i = 0; i < NR_IRQS; i++) {
+        s->irq[i] = qdev_get_gpio_in(DEVICE(icu), i);
+    }
+    sysbus_realize(icu, &error_abort);
+    sysbus_connect_irq(icu, 0, qdev_get_gpio_in(DEVICE(&s->cpu), RX_CPU_IRQ));
+    sysbus_connect_irq(icu, 1, qdev_get_gpio_in(DEVICE(&s->cpu), RX_CPU_FIR));
+    sysbus_connect_irq(icu, 2, s->irq[SWI]);
+    sysbus_mmio_map(SYS_BUS_DEVICE(icu), 0, RX62N_ICU_BASE);
+}
+
+static void register_tmr(RX62NState *s, int unit)
+{
+    SysBusDevice *tmr;
+    int i, irqbase;
+
+    object_initialize_child(OBJECT(s), "tmr[*]",
+                            &s->tmr[unit], TYPE_RENESAS_TMR);
+    tmr = SYS_BUS_DEVICE(&s->tmr[unit]);
+    qdev_prop_set_uint64(DEVICE(tmr), "input-freq", RX62N_PCLK);
+    sysbus_realize(tmr, &error_abort);
+
+    irqbase = RX62N_TMR_IRQ + TMR_NR_IRQ * unit;
+    for (i = 0; i < TMR_NR_IRQ; i++) {
+        sysbus_connect_irq(tmr, i, s->irq[irqbase + i]);
+    }
+    sysbus_mmio_map(tmr, 0, RX62N_TMR_BASE + unit * 0x10);
+}
+
+static void register_cmt(RX62NState *s, int unit)
+{
+    SysBusDevice *cmt;
+    int i, irqbase;
+
+    object_initialize_child(OBJECT(s), "cmt[*]",
+                            &s->cmt[unit], TYPE_RENESAS_CMT);
+    cmt = SYS_BUS_DEVICE(&s->cmt[unit]);
+    qdev_prop_set_uint64(DEVICE(cmt), "input-freq", RX62N_PCLK);
+    sysbus_realize(cmt, &error_abort);
+
+    irqbase = RX62N_CMT_IRQ + CMT_NR_IRQ * unit;
+    for (i = 0; i < CMT_NR_IRQ; i++) {
+        sysbus_connect_irq(cmt, i, s->irq[irqbase + i]);
+    }
+    sysbus_mmio_map(cmt, 0, RX62N_CMT_BASE + unit * 0x10);
+}
+
+static void register_sci(RX62NState *s, int unit)
+{
+    SysBusDevice *sci;
+    int i, irqbase;
+
+    object_initialize_child(OBJECT(s), "sci[*]",
+                            &s->sci[unit], TYPE_RENESAS_SCI);
+    sci = SYS_BUS_DEVICE(&s->sci[unit]);
+    qdev_prop_set_chr(DEVICE(sci), "chardev", serial_hd(unit));
+    qdev_prop_set_uint64(DEVICE(sci), "input-freq", RX62N_PCLK);
+    sysbus_realize(sci, &error_abort);
+
+    irqbase = RX62N_SCI_IRQ + SCI_NR_IRQ * unit;
+    for (i = 0; i < SCI_NR_IRQ; i++) {
+        sysbus_connect_irq(sci, i, s->irq[irqbase + i]);
+    }
+    sysbus_mmio_map(sci, 0, RX62N_SCI_BASE + unit * 0x08);
+}
+
+static void rx62n_realize(DeviceState *dev, Error **errp)
+{
+    RX62NState *s = RX62N_MCU(dev);
+
+    memory_region_init_ram(&s->iram, OBJECT(dev), "iram",
+                           RX62N_IRAM_SIZE, &error_abort);
+    memory_region_add_subregion(s->sysmem, RX62N_IRAM_BASE, &s->iram);
+    memory_region_init_rom(&s->d_flash, OBJECT(dev), "flash-data",
+                           RX62N_DFLASH_SIZE, &error_abort);
+    memory_region_add_subregion(s->sysmem, RX62N_DFLASH_BASE, &s->d_flash);
+    memory_region_init_rom(&s->c_flash, OBJECT(dev), "flash-code",
+                           RX62N_CFLASH_SIZE, &error_abort);
+    memory_region_add_subregion(s->sysmem, RX62N_CFLASH_BASE, &s->c_flash);
+
+    if (!s->kernel) {
+        rom_add_file_fixed(bios_name, RX62N_CFLASH_BASE, 0);
+    }
+
+    /* Initialize CPU */
+    object_initialize_child(OBJECT(s), "cpu", &s->cpu, TYPE_RX62N_CPU);
+    qdev_realize(DEVICE(&s->cpu), NULL, &error_abort);
+
+    register_icu(s);
+    s->cpu.env.ack = qdev_get_gpio_in_named(DEVICE(&s->icu), "ack", 0);
+    register_tmr(s, 0);
+    register_tmr(s, 1);
+    register_cmt(s, 0);
+    register_cmt(s, 1);
+    register_sci(s, 0);
+}
+
+static Property rx62n_properties[] = {
+    DEFINE_PROP_LINK("main-bus", RX62NState, sysmem, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
+    DEFINE_PROP_BOOL("load-kernel", RX62NState, kernel, false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void rx62n_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = rx62n_realize;
+    device_class_set_props(dc, rx62n_properties);
+}
+
+static const TypeInfo rx62n_info = {
+    .name = TYPE_RX62N_MCU,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(RX62NState),
+    .class_init = rx62n_class_init,
+};
+
+static void rx62n_register_types(void)
+{
+    type_register_static(&rx62n_info);
+}
+
+type_init(rx62n_register_types)
diff --git a/MAINTAINERS b/MAINTAINERS
index dd829b300a..71308a485b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1979,7 +1979,9 @@ Renesas RX peripherals
 M: Yoshinori Sato <ysato@users.sourceforge.jp>
 S: Maintained
 F: hw/intc/rx_icu.c
+F: hw/rx/
 F: include/hw/intc/rx_icu.h
+F: include/hw/rx/
 
 Subsystems
 ----------
diff --git a/hw/Kconfig b/hw/Kconfig
index ecf491bf04..62f9ebdc22 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -55,6 +55,7 @@ source nios2/Kconfig
 source openrisc/Kconfig
 source ppc/Kconfig
 source riscv/Kconfig
+source rx/Kconfig
 source s390x/Kconfig
 source sh4/Kconfig
 source sparc/Kconfig
diff --git a/hw/rx/Kconfig b/hw/rx/Kconfig
new file mode 100644
index 0000000000..e7b1c59516
--- /dev/null
+++ b/hw/rx/Kconfig
@@ -0,0 +1,6 @@
+config RX62N_MCU
+    bool
+    select RX_ICU
+    select RENESAS_TMR
+    select RENESAS_CMT
+    select RENESAS_SCI
diff --git a/hw/rx/Makefile.objs b/hw/rx/Makefile.objs
new file mode 100644
index 0000000000..fe19ee7984
--- /dev/null
+++ b/hw/rx/Makefile.objs
@@ -0,0 +1 @@
+obj-$(CONFIG_RX62N_MCU) += rx62n.o
-- 
2.21.3


