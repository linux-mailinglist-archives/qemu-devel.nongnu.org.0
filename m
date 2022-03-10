Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF204D4685
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:12:45 +0100 (CET)
Received: from localhost ([::1]:42266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHeu-0005mL-51
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:12:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSH0v-0002Yg-HN
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:31:25 -0500
Received: from [2607:f8b0:4864:20::1033] (port=36514
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSH0t-0008UG-Mf
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:31:25 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 kx6-20020a17090b228600b001bf859159bfso7973681pjb.1
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FgJtqezNi81L0SadvxdIqrQdrL90cWo0N9YQo1orZhs=;
 b=sPPRs6mT0fiwfzhP1UotP2B8QCP+1RNBxDq7vT/kSmnE/z1/wZr6aaXCYAPIVntblY
 dRzcQWbsOoNnQdD0VYNJi9SjHEAqh3QlokDl8+VSzoQeHPxDAl3/90TkYIRAR9HMLLlO
 4rrsOv60/aBUOfCVgsc15wXKXZdDOJ3nujuWD086txbVn3fLUZer34Pe8HhCd4EQTUyA
 Ui76LUGAVxZh072vjneC6WTQPYqkayn131KuhpzdPnyAQgAzebsVBE1oZpwsbYAAyxDy
 uJkQO5qSztDT+oVQB541jGRz3hRn3i3zV2q2fBce90FCNPP7RfRJ2GzorCOiShfSJgUy
 wSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FgJtqezNi81L0SadvxdIqrQdrL90cWo0N9YQo1orZhs=;
 b=j0cb2Pw0LlIdI0Ov1R4gUUcbmt7pc/j8rOPgUqii4hDeffb7RVAf5eMa4MdoSOJ8cM
 KZ5DhLX7r+f8FBpyo+b5HoFH3YGG7cvgZLQKDj7rncphj+h4UUNtHVcQwqVmgzB+Fuf+
 wQdh25kVYgo41Z16dZb4JRkN9KbvHZLvsvuPEZikCdbhsftbn3AbibmOq581OE4gFjoZ
 Sywv5V6bOL3MzBiU7mTXIQaIx7/boJJhyDL2BP3BmcBIlaKUoLqzqhlB6bpiGaAsm8Wm
 jqq0jl0gkg9RuhBlCkTuhhYYNdENOW2p0i/V852+7pVjW5kA9LKByAfgMzJvuDvA7eFJ
 s3Ug==
X-Gm-Message-State: AOAM533gKCmMnucx7UBsIFr6/RWEfo2llX8pwrl4eMcYSaYySM1j4mGt
 wgw/7A9fHVZ3gipHG+lvsojKSGg5CE9kug==
X-Google-Smtp-Source: ABdhPJydG6Ie5FNiaMBjQCsWAwJoOkp9Y/OX6yd/jdpsx9KJ5Nb3VXSCLomHWyVF0z/7+QHWALWAnA==
X-Received: by 2002:a17:902:c1d4:b0:151:b56c:41ef with SMTP id
 c20-20020a170902c1d400b00151b56c41efmr4404907plc.77.1646911882431; 
 Thu, 10 Mar 2022 03:31:22 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020a056a001a8e00b004f75cf1ab6csm6011246pfv.206.2022.03.10.03.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:31:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 48/48] hw/nios2: Machine with a Vectored Interrupt
 Controller
Date: Thu, 10 Mar 2022 03:27:25 -0800
Message-Id: <20220310112725.570053-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
index dda4ab2bf5..91383fb097 100644
--- a/hw/nios2/10m50_devboard.c
+++ b/hw/nios2/10m50_devboard.c
@@ -27,6 +27,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/char/serial.h"
+#include "hw/intc/nios2_vic.h"
 #include "hw/qdev-properties.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
@@ -43,6 +44,8 @@ struct Nios2MachineState {
     MemoryRegion phys_tcm_alias;
     MemoryRegion phys_ram;
     MemoryRegion phys_ram_alias;
+
+    bool vic;
 };
 
 #define TYPE_NIOS2_MACHINE  MACHINE_TYPE_NAME("10m50-ghrd")
@@ -81,10 +84,39 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
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
+    qdev_realize_and_unref(DEVICE(cpu), NULL, &error_fatal);
+
+    if (nms->vic) {
+        DeviceState *dev = qdev_new(TYPE_NIOS2_VIC);
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
     nios2_load_kernel(cpu, ram_base, ram_size, machine->initrd_filename,
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


