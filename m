Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FB6510903
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:31:59 +0200 (CEST)
Received: from localhost ([::1]:50532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQuk-0006Kt-7r
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPqB-0002Dj-TC
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:23:11 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:36735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPqA-0005Zh-3P
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:23:11 -0400
Received: by mail-pg1-x52e.google.com with SMTP id g3so16109287pgg.3
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I9okil5+kJgTqcKaRaU/YcxpruIY39QBJzH8pAf+TqE=;
 b=VFVGVo6q7wEhMHeMtx/WuHBY7iCITmkXOppRqsoIFltDLuuw2zH0EwMJVoH06ljYVd
 pcoiYMBSID+ffDKxb/NvGrj6DXj8EidcWR37Ltm0AfWQwXeBi8Jq63MuGX9JzLiPoC2e
 RGG8upRqP3M4LTbiktLM6DK82YAJl3VFXvsTgvVuzEneF04zt6KipfQdoQOSQ3AW96Aa
 q/IafA5JaMWfEK0FmX1VEBwOI3lRJ4pAeVRMt9YV7o+OhX5jdWbRDk0hUd92Mm7iiM5e
 fWRWgzOW4F0MhzDF3IO8Q3QXNUFZoIFQTd6JfkUi7cJTwj7ZRa9ElYtw2kIWJMWlHErW
 dgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I9okil5+kJgTqcKaRaU/YcxpruIY39QBJzH8pAf+TqE=;
 b=bSsl+FGZodO+OFU/ZmMpg7CloRR8RY4qaiAb8eM/sd5AZ11rC62YU6c7gpeI0ClKtf
 X/Qsk8pXhbcsO5nGJw+EQ2qXztIYwTiiY7mi0cfLhwC5P3rCjDpHcqd485tkhpQ3KSRB
 D2JnBk8yOWN9h4MBThAn2awvBfbUebrBhp+qsASIUTFMxFltjeF1ZXXGkqf2KLpxFWaO
 NafFtbsUSM1E4VYz82GwHj+nmfJkts+nuaxrP+qFS6HkRy7j6IyZRZRXodPyPTf6a9z/
 W41gIViolnAWSpHDaNM56BFFzPIy4NQyGBFTb+igLhyrti8ts9zag2jSgx2WPD9VKsED
 UsAQ==
X-Gm-Message-State: AOAM53368R6eOuByVbGHwPA41kO6gEwf67TST9Lb5JWQIz+14yk8puRQ
 S/8bPrpwtfKm9vMlbd9N88azNRxxqWwKhQ==
X-Google-Smtp-Source: ABdhPJxzrpfOtyUA8IprwCZicWOTQ2GM1Q8zqXoxlV4+Xwb56CNyxKZfWyZYV4klYr/2wI26Yw6zQg==
X-Received: by 2002:a63:8bc2:0:b0:3ab:b53:ab4e with SMTP id
 j185-20020a638bc2000000b003ab0b53ab4emr13717745pge.423.1650997388746; 
 Tue, 26 Apr 2022 11:23:08 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a636fc4000000b003983a01b896sm13585053pgc.90.2022.04.26.11.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:23:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 66/68] hw/nios2: Machine with a Vectored Interrupt Controller
Date: Tue, 26 Apr 2022 11:19:05 -0700
Message-Id: <20220426181907.103691-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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


