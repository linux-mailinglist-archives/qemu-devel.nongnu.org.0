Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF434D114C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:49:47 +0100 (CET)
Received: from localhost ([::1]:59334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUbK-0006hv-5K
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:49:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9Y-00060M-G1
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:21:04 -0500
Received: from [2607:f8b0:4864:20::1034] (port=33337
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9W-0006Xv-PD
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:21:04 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 v1-20020a17090a088100b001bf25f97c6eso1572406pjc.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gqQ9d0fGzI9y1pXacs8lImslbXY8EcC24UqzWPnojhY=;
 b=A6tpGikr8tiiVL1uqZHdbY3JyMCaAYlWpjNjh2uLodUbnbT1fO4eTqPLsqiQe1gwOg
 vKUFiLFDA5j7QsR8NLKlHxcr8jwLFLtDGIJv9o8SkQGXDre9XAt3eYhiJADcdN2ynaU0
 YvaATCs/y9FH5IjpQ+KISnVBK/lZgJ68J2q3lIh4UIK33aTzaG+a+Q/YbU64XszLu2cm
 kb7owkPVJcJmC4g5sMKULZD8IKbmwVg51g6ayGnF24PgcLWbMFki+GO/zG0vmsczpOpk
 o0v5Ep81N7WXTkvgoBkmydpv0xosnNhbGvPYejRPtpTq1OnBmhgktz3a0Xk08BXv329+
 QUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gqQ9d0fGzI9y1pXacs8lImslbXY8EcC24UqzWPnojhY=;
 b=7K0qfAuNQFCXbH6iIdhFVlAwwUq5D6IJXjIb/LvFQJs8RQnrrzMMQufS+17Mc8Pg7S
 i1lyrJjB3+xUzAkFZBBA0OxSiEKsjSKfr38LWi2FVuBr9XhyCIWvFRD17FpNqvChx0g0
 77xPCc7J4glPgjE/y/jpcgKoBXoDEThiRgrJ2FEWALuSrPLLQeSj/8bBdqIkY9cYyx8c
 QFfT6nsjEQqIKQmR/rGmnexCa8uNL5G8CnoC+glFizkqLpJRQKMxZBH0oTZ6q84ZGsAH
 p4iUtelEKyMRixVKA7tNKRurclPhWSevQgEn2Lc1eZ9hXq9laBbenAC6w+Tp/vPuC9qr
 fcCQ==
X-Gm-Message-State: AOAM531MFRlKFB+PguUXXdHCguDAzMFW2NBziRyYvzlIkmDfUochYTXI
 vIK2tBo0tdM/2wJFX4BBwcftRqtq0sqjng==
X-Google-Smtp-Source: ABdhPJyPMWsKAAAQx3WiHQ/MMCfFVLhKCNeKn2zeOmPP6Z+RnYSld3lnbFMnwVTNcLF4JHZNKmwTdA==
X-Received: by 2002:a17:90b:38c9:b0:1bf:871b:1a4d with SMTP id
 nn9-20020a17090b38c900b001bf871b1a4dmr3028086pjb.18.1646724061555; 
 Mon, 07 Mar 2022 23:21:01 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:21:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 33/33] hw/nios2: Machine with a Vectored Interrupt
 Controller
Date: Mon,  7 Mar 2022 21:20:05 -1000
Message-Id: <20220308072005.307955-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Amir Gonnen <amir.gonnen@neuroblade.ai>

Demonstrate how to use nios2 VIC on a machine.
Introduce a new machine property to attach a VIC.

When VIC is present, let the CPU know that it should use the
External Interrupt Interface instead of the Internal Interrupt Interface.
The devices on the machine are attached to the VIC and not directly to cpu.
To allow VIC update EIC fields, we set the "cpu" property of the VIC
with a reference to the nios2 cpu.

Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
Message-Id: <20220303153906.2024748-6-amir.gonnen@neuroblade.ai>
[rth: Put a property on the 10m50-ghrd machine, rather than
      create a new machine class.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/nios2/10m50_devboard.c | 61 +++++++++++++++++++++++++++++++++------
 hw/nios2/Kconfig          |  1 +
 2 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
index f4931b8a67..bdbc6539c9 100644
--- a/hw/nios2/10m50_devboard.c
+++ b/hw/nios2/10m50_devboard.c
@@ -43,6 +43,8 @@ struct Nios2MachineState {
     MemoryRegion phys_tcm_alias;
     MemoryRegion phys_ram;
     MemoryRegion phys_ram_alias;
+
+    bool vic;
 };
 
 #define TYPE_NIOS2_MACHINE  MACHINE_TYPE_NAME("10m50-ghrd")
@@ -81,10 +83,40 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, 0xc0000000 + ram_base,
                                 &nms->phys_ram_alias);
 
-    /* Create CPU -- FIXME */
-    cpu = NIOS2_CPU(cpu_create(TYPE_NIOS2_CPU));
-    for (i = 0; i < 32; i++) {
-        irq[i] = qdev_get_gpio_in_named(DEVICE(cpu), "IRQ", i);
+    /* Create CPU.  We need to set eic_present between init and realize. */
+    cpu = NIOS2_CPU(object_new(TYPE_NIOS2_CPU));
+
+    /* Enable the External Interrupt Controller within the CPU. */
+    cpu->eic_present = nms->vic;
+
+    /* Configure new exception vectors. */
+    cpu->reset_addr = 0xd4000000;
+    cpu->exception_addr = 0xc8000120;
+    cpu->fast_tlb_miss_addr = 0xc0000100;
+
+    qdev_realize(DEVICE(cpu), NULL, &error_fatal);
+    object_unref(CPU(cpu));
+
+    if (nms->vic) {
+        DeviceState *dev = qdev_new("nios2-vic");
+        MemoryRegion *dev_mr;
+        qemu_irq cpu_irq;
+
+        object_property_set_link(OBJECT(dev), "cpu", OBJECT(cpu), &error_fatal);
+        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+        cpu_irq = qdev_get_gpio_in_named(DEVICE(cpu), "EIC", 0);
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, cpu_irq);
+        for (int i = 0; i < 32; i++) {
+            irq[i] = qdev_get_gpio_in(dev, i);
+        }
+
+        dev_mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
+        memory_region_add_subregion(address_space_mem, 0x18002000, dev_mr);
+    } else {
+        for (i = 0; i < 32; i++) {
+            irq[i] = qdev_get_gpio_in_named(DEVICE(cpu), "IRQ", i);
+        }
     }
 
     /* Register: Altera 16550 UART */
@@ -105,15 +137,22 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xe0000880);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq[5]);
 
-    /* Configure new exception vectors and reset CPU for it to take effect. */
-    cpu->reset_addr = 0xd4000000;
-    cpu->exception_addr = 0xc8000120;
-    cpu->fast_tlb_miss_addr = 0xc0000100;
-
     nios2_load_kernel(cpu, ram_base, ram_size, nms->parent_obj.initrd_filename,
                       BINARY_DEVICE_TREE_FILE, NULL);
 }
 
+static bool get_vic(Object *obj, Error **errp)
+{
+    Nios2MachineState *nms = NIOS2_MACHINE(obj);
+    return nms->vic;
+}
+
+static void set_vic(Object *obj, bool value, Error **errp)
+{
+    Nios2MachineState *nms = NIOS2_MACHINE(obj);
+    nms->vic = value;
+}
+
 static void nios2_10m50_ghrd_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -121,6 +160,10 @@ static void nios2_10m50_ghrd_class_init(ObjectClass *oc, void *data)
     mc->desc = "Altera 10M50 GHRD Nios II design";
     mc->init = nios2_10m50_ghrd_init;
     mc->is_default = true;
+
+    object_class_property_add_bool(oc, "vic", get_vic, set_vic);
+    object_class_property_set_description(oc, "vic",
+        "Set on/off to enable/disable the Vectored Interrupt Controller");
 }
 
 static const TypeInfo nios2_10m50_ghrd_type_info = {
diff --git a/hw/nios2/Kconfig b/hw/nios2/Kconfig
index b10ea640da..4748ae27b6 100644
--- a/hw/nios2/Kconfig
+++ b/hw/nios2/Kconfig
@@ -3,6 +3,7 @@ config NIOS2_10M50
     select NIOS2
     select SERIAL
     select ALTERA_TIMER
+    select NIOS2_VIC
 
 config NIOS2_GENERIC_NOMMU
     bool
-- 
2.25.1


