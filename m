Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E72B44DBEDD
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 07:00:50 +0100 (CET)
Received: from localhost ([::1]:38516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUjBq-0007TP-2L
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 02:00:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiON-0005tm-10
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:09:43 -0400
Received: from [2607:f8b0:4864:20::1030] (port=56259
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiO8-0002ex-Me
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:09:31 -0400
Received: by mail-pj1-x1030.google.com with SMTP id e3so3938419pjm.5
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hj1caAJ4c5FzLlx3YortGoGnXhKcBtSkJDGfqHCCy98=;
 b=uTUkKmda+jlDhYzgmm7pq+0AS5DT8aSU/wQ8MK1JlBIpdRukXG9d7dsAknlEe1j3uO
 zKeOmNBjuYkvxcsHfRQBtJIBZ6DhEtyUJwYCEljx5XBLzIYXcGtHUu65fSjyJHG8c/x/
 1aw/XrLDomO33WpelipkDHtTlpfby+TKBQDCZE3O5tiIbvvskektsnydwcz9hewdMmqm
 j9/jg0t1rxr8oBlGrzAKCxHl+MpiekmTgzxKdm/DCy5v1bmJ4YmhDYTV1hmqgKXwYo81
 vWJ/PFWFT3t+aHAKWfbEYptQZReXRg+GaMVh7O+y5u+uD92TFPgsk1OqCbjploaqgiff
 iuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hj1caAJ4c5FzLlx3YortGoGnXhKcBtSkJDGfqHCCy98=;
 b=MHhwfyHxT/8VS3n2cojeC1YeMwbcEkUUGHJs4S56YiVTuUNjRqk/lJOv/ONz2+0jqK
 k4okBEwJTWK+Ba/qXj5Ybf/R1hVcYgyg2vIiGCTEEWXzUO13APeMPOPDqtS2NAJbd3DG
 YnngVCNatRL4EXA8OfhA2FvmbRWXXFvOLCpEUV1skP5SqlK9eE+FmaP4VGFOuyXUibXC
 4wrd3LOIG72ZON+T/2n4k2qZvwg5cczalQSFuiSNiryZDJtlSVj6JbDtF8metbeHaFL5
 +VZyFeI3szB0ps1tfQdfz7m762Oq3DE51W+7CIZZ6YEVPSmR2/mP0z2BatIQqFNZyjTK
 rV7g==
X-Gm-Message-State: AOAM533ZNGBZuOMNyctYaaSmgU92+1OI3NPOjzR4cgIwsDcbk7UbeLDb
 fXRu+/ujMzRUfba/PwaXoJvea5ToCFZ3og==
X-Google-Smtp-Source: ABdhPJwWzQQPOUbU52J8wE+8MR1je8LRzkZ3z9l97St4xh46H42WBFmXcwqVYMDscVYuTTvKfxa4jg==
X-Received: by 2002:a17:90a:6508:b0:1be:d59c:1f10 with SMTP id
 i8-20020a17090a650800b001bed59c1f10mr3264074pjj.229.1647493766506; 
 Wed, 16 Mar 2022 22:09:26 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 d10-20020a63360a000000b0037947abe4bbsm4217493pga.34.2022.03.16.22.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:09:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 48/51] hw/nios2: Machine with a Vectored Interrupt
 Controller
Date: Wed, 16 Mar 2022 22:05:35 -0700
Message-Id: <20220317050538.924111-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai,
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

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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


