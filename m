Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D063EAF886
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 11:09:06 +0200 (CEST)
Received: from localhost ([::1]:48346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7ycb-0006ux-9J
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 05:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57888)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwU-00007g-Nu
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 04:25:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwT-0006v2-88
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 04:25:34 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35277)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xwT-0006uf-20
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 04:25:33 -0400
Received: by mail-wr1-f66.google.com with SMTP id g7so23515214wrx.2
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 01:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=wm3J7TIcCEv0aaWl0QCs1gHRrzNPzlgI8JciW4yKbt4=;
 b=tnQMhWZCIMIfj31urRBy2BPaFVVYdYVK1cUfPcUV8Bqx4I/0iay0dZxxCTyiaNp3f+
 ku3oG679cQeM29BYIdMFJVJA6FWjlma3+tH7FwLbQ2L/o1QBaBbVIC90PbOWuv6loqQv
 zVEnjYHEGBtQtMnGL4Z6j4bwM5VcLytGO1qplIN0HYoWxRJJV5oLXEq/K/qd2nAsEQWg
 bB4CxepMvs1cWp26KHlQZ/4QWoAEZPCJ59MV9n5xsKBKnt6hvh8G4pcK7uHLSMyldbqk
 xO2j7pFvq/xr+a+5JcMs6iAAlq2IYMIjbrQ3+4mjT+ISaMaqUvDw84e2sMtqtiPlAFv1
 vtFA==
X-Gm-Message-State: APjAAAVCLXcdMm02FLyRxJWGcj+O2s9i0coGowvyKICsXSYubqBZjsFj
 zOhRHVND7hsKg0Sy+sR9xMOgAg==
X-Google-Smtp-Source: APXvYqwI8BVknwkHNP3Mz/GDkdZ4bo4NWqZ6f9/klo36PGcb0HKCpaKEV/cZj77tnrrLmWs12jTO7A==
X-Received: by 2002:a05:6000:1632:: with SMTP id
 v18mr32138845wrb.61.1568190331759; 
 Wed, 11 Sep 2019 01:25:31 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id n14sm51695780wra.75.2019.09.11.01.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:25:31 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:05:07 -0700
Message-Id: <20190910190513.21160-42-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: [Qemu-devel] [PULL 41/47] riscv: sifive_u: Instantiate OTP memory
 with a serial number
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
Cc: Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

This adds an OTP memory with a given serial number to the sifive_u
machine. With such support, the upstream U-Boot for sifive_fu540
boots out of the box on the sifive_u machine.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c         | 9 +++++++++
 include/hw/riscv/sifive_u.h | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 5ca3793d35..4803e47ae4 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -10,6 +10,7 @@
  * 1) CLINT (Core Level Interruptor)
  * 2) PLIC (Platform Level Interrupt Controller)
  * 3) PRCI (Power, Reset, Clock, Interrupt)
+ * 4) OTP (One-Time Programmable) memory with stored serial number
  *
  * This board currently generates devicetree dynamically that indicates at least
  * two harts and up to five harts.
@@ -64,10 +65,12 @@ static const struct MemmapEntry {
     [SIFIVE_U_PRCI] =     { 0x10000000,     0x1000 },
     [SIFIVE_U_UART0] =    { 0x10010000,     0x1000 },
     [SIFIVE_U_UART1] =    { 0x10011000,     0x1000 },
+    [SIFIVE_U_OTP] =      { 0x10070000,     0x1000 },
     [SIFIVE_U_DRAM] =     { 0x80000000,        0x0 },
     [SIFIVE_U_GEM] =      { 0x100900FC,     0x2000 },
 };
 
+#define OTP_SERIAL          1
 #define GEM_REVISION        0x10070109
 
 static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
@@ -422,6 +425,9 @@ static void riscv_sifive_u_soc_init(Object *obj)
 
     sysbus_init_child_obj(obj, "prci", &s->prci, sizeof(s->prci),
                           TYPE_SIFIVE_U_PRCI);
+    sysbus_init_child_obj(obj, "otp", &s->otp, sizeof(s->otp),
+                          TYPE_SIFIVE_U_OTP);
+    qdev_prop_set_uint32(DEVICE(&s->otp), "serial", OTP_SERIAL);
     sysbus_init_child_obj(obj, "gem", &s->gem, sizeof(s->gem),
                           TYPE_CADENCE_GEM);
 }
@@ -498,6 +504,9 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
     object_property_set_bool(OBJECT(&s->prci), true, "realized", &err);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->prci), 0, memmap[SIFIVE_U_PRCI].base);
 
+    object_property_set_bool(OBJECT(&s->otp), true, "realized", &err);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->otp), 0, memmap[SIFIVE_U_OTP].base);
+
     for (i = 0; i < SIFIVE_U_PLIC_NUM_SOURCES; i++) {
         plic_gpios[i] = qdev_get_gpio_in(DEVICE(s->plic), i);
     }
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 7dfd1cb22e..4d4733cb6a 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -23,6 +23,7 @@
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/sifive_cpu.h"
 #include "hw/riscv/sifive_u_prci.h"
+#include "hw/riscv/sifive_u_otp.h"
 
 #define TYPE_RISCV_U_SOC "riscv.sifive.u.soc"
 #define RISCV_U_SOC(obj) \
@@ -39,6 +40,7 @@ typedef struct SiFiveUSoCState {
     RISCVHartArrayState u_cpus;
     DeviceState *plic;
     SiFiveUPRCIState prci;
+    SiFiveUOTPState otp;
     CadenceGEMState gem;
 } SiFiveUSoCState;
 
@@ -60,6 +62,7 @@ enum {
     SIFIVE_U_PRCI,
     SIFIVE_U_UART0,
     SIFIVE_U_UART1,
+    SIFIVE_U_OTP,
     SIFIVE_U_DRAM,
     SIFIVE_U_GEM
 };
-- 
2.21.0


