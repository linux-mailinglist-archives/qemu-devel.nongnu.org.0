Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC8D50BF1C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:59:06 +0200 (CEST)
Received: from localhost ([::1]:55924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxYg-0000Rb-2N
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:59:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwbH-0000sY-NV
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:43 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:41512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwbG-00085G-0P
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:43 -0400
Received: by mail-il1-x130.google.com with SMTP id h4so5419119ilq.8
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I9okil5+kJgTqcKaRaU/YcxpruIY39QBJzH8pAf+TqE=;
 b=yl7adnp9aaYeT5lJ3G/j182sy20JEbOx7Xy5ZbhcIqPW76rhcAz3panQxGCC7fx1yN
 KREs5GtdRTRh0/AUHV18PbrIR+wQiWAld7Oj1bnTE+2IdIOoU09lUNsq0/Iclw1Lk69I
 ZeB17KxLlpinkQRK4Riv/hLNdTQLir84WbZgOVX741ZkYAvpfLZmDiS93qqc9ogdXG4/
 V0pxMp4vMSm1SfnLEDZBEznbq5EyBCrnQpcClHTDNOiqA+IbOqN3V4Js0Rszmq/WZu9e
 s6XhGlLjs6niRDlFm0h1SfBtkazDNz4Hb5CFw5+3DEkrQXazJlT8uyRpCVRPdKsGtkJf
 KxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I9okil5+kJgTqcKaRaU/YcxpruIY39QBJzH8pAf+TqE=;
 b=YdYHc6RiWSbXF708Fdgwosw0pQhyqzNtoymUwSsCXCG6n+IH5Hx89KSg9o7vtBYOwd
 +ffVNnZIABAQQbc4gaIrIa/IS21w4snQxm91uOhl0IJb/jRjRXmI7xIN+aVptBT4aNce
 yf+8Eo/XBt87n1IGKIeR/nMoi2/SvpyPm7PIewBFbiUvTrCLoO3NIVNTf2mW9eWhDqph
 sO9xqa85uqWul9hK/2hgcYhmVgfAXh8fh/ZtGTrAVlajZ9kh9lzeqk6b8YR0+eHvVWcX
 WPz9BQJq9zG4lM/t0j0B2MetTSldWnJVoT4Wu61rN+Cat8PQ/64GcgKOtwQe1h83Gkup
 TIKw==
X-Gm-Message-State: AOAM530pSOREdPdyQv+Y5ov8u8MW9IwSI1UOuLyjIrVZjvrtfzm/kkc7
 BiiT5xNEyWPv3VXakA70QtCyblqdHpBEv9cC
X-Google-Smtp-Source: ABdhPJzI4HHam3qGMa7psIljQD/HAb75r0uVC5LZp3DN3FLnUHB5hOVSww/n7yMmSEp8V0lcxiB7RA==
X-Received: by 2002:a92:cb4f:0:b0:2cb:fde0:b5c2 with SMTP id
 f15-20020a92cb4f000000b002cbfde0b5c2mr2251821ilq.274.1650646660152; 
 Fri, 22 Apr 2022 09:57:40 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a6b8b17000000b00649a2634725sm816380iod.17.2022.04.22.09.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:57:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 66/68] hw/nios2: Machine with a Vectored Interrupt
 Controller
Date: Fri, 22 Apr 2022 09:52:36 -0700
Message-Id: <20220422165238.1971496-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Amir Gonnen <amir.gonnen@neuroblade.ai>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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

[rth: Put a property on the 10m50-ghrd machine, rather than
      create a new machine class.]

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
Message-Id: <20220303153906.2024748-6-amir.gonnen@neuroblade.ai>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-63-richard.henderson@linaro.org>
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
2.34.1


