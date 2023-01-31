Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C74682BFA
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 12:56:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMpDK-00071F-OP; Tue, 31 Jan 2023 06:54:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpDH-0006qS-Va; Tue, 31 Jan 2023 06:54:12 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpDG-0002N0-4J; Tue, 31 Jan 2023 06:54:11 -0500
Received: by mail-ed1-x531.google.com with SMTP id x7so10899384edr.0;
 Tue, 31 Jan 2023 03:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VrUMT8KXOlwyP+wNgiIX+Cf413CiRY1aEg+ePqpscxE=;
 b=TvB8Y25Ce/3Ie20AFkSnSditc4a+Yx0wW2YKy+ahdjomO0H6DQ0XtLYbnyQ0J6Dq27
 t4Xib9hsaDZa8be45zIxy5aSvqQ2wLx/0d5aIN8Xk+/oS8qoY89THm6+1z+RmlnJZhjO
 OqrbPvvpPO16D9MSUJ97FiCQ42hm1gVTC0JnDayA4ijmKCxWUpfX8idVI6zhqIsXlMBz
 wy13573IHbQwHIRMtx7KdKl/X++kvoX5Jt2E/eD1fOcNcBI301BIlY+/SFYo1mSNXNWu
 RjkREXql8hcjHDEdV+nvmxG3DabdHmZlHYAPLd+Z8LCjd08O2ng5qVDPS8mKXx6dzHPB
 xwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VrUMT8KXOlwyP+wNgiIX+Cf413CiRY1aEg+ePqpscxE=;
 b=0BMHgN3IXy7LNlHr/13OgIG+WDP2xOmnkwOrmfz+WgMgUaLJtn+JEtJ640vRBd5CD9
 iyQ6KDW/5MMoHhXS1nXJs9ksUdF+xfxtQAkwoEJNlS9sP3W7oUC+iPGksa+FiNNNyiHP
 9GI3z84LONK+DKCTDW4O8H/viNJO4hqvvJtf0buyhN3svCUr2LnlooKVmE+o2cCXkMfF
 YPRDO2Vgsbm4bXfUbI1GnHZ0tW9jNocSTce73wqmolv9jFJwkyeGT3L/5oHZMd67Kl7z
 bglFYPoppXPyOLabljVgslbRrR4eJHhFL0Fl9nQ2BjRQH1yyoQGxYFhuBsHWXYHU5DXj
 aUHw==
X-Gm-Message-State: AO0yUKXMmzW3c9Ef/WWa9ZAEoG70qZ8+Wdd4Q6mOrhHHvHDcVzsuNAJo
 0Q5iaEXM34/M3dgkFF6KidV82F1RNJM=
X-Google-Smtp-Source: AK7set+OrWVv/Rc5aaTzF5R/Wv+rPWsHB8Enu8pOnLss/YUMuq5xAxMQo8ygOMlRE3H4fYzZz4wi1Q==
X-Received: by 2002:a05:6402:f0c:b0:4a2:4ed3:c14b with SMTP id
 i12-20020a0564020f0c00b004a24ed3c14bmr3587685eda.36.1675166048541; 
 Tue, 31 Jan 2023 03:54:08 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-013-082-236.77.13.pool.telefonica.de. [77.13.82.236])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a056402100a00b00483dd234ac6sm8178318edu.96.2023.01.31.03.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 03:54:08 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 17/20] hw/i386/ich9: Remove redundant GSI_NUM_PINS
Date: Tue, 31 Jan 2023 12:53:23 +0100
Message-Id: <20230131115326.12454-18-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131115326.12454-1-shentey@gmail.com>
References: <20230131115326.12454-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Most code uses IOAPIC_NUM_PINS. The only place where GSI_NUM_PINS defines
the size of an array is ICH9LPCState::gsi which needs to match
IOAPIC_NUM_PINS. Remove GSI_NUM_PINS for consistency.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/i386/ich9.h | 2 +-
 include/hw/i386/x86.h  | 1 -
 hw/i386/pc.c           | 6 +++---
 hw/i386/pc_q35.c       | 3 ++-
 hw/isa/lpc_ich9.c      | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index 433c8942c9..d29090a9b7 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -63,7 +63,7 @@ struct ICH9LPCState {
     MemoryRegion rcrb_mem; /* root complex register block */
     Notifier machine_ready;
 
-    qemu_irq gsi[GSI_NUM_PINS];
+    qemu_irq gsi[IOAPIC_NUM_PINS];
 };
 
 #define ICH9_MASK(bit, ms_bit, ls_bit) \
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 62fa5774f8..0becd1460e 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -134,7 +134,6 @@ bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms);
 
 /* Global System Interrupts */
 
-#define GSI_NUM_PINS IOAPIC_NUM_PINS
 #define ACPI_BUILD_PCI_IRQS ((1<<5) | (1<<9) | (1<<10) | (1<<11))
 
 typedef struct GSIState {
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8898cc9961..cbca3f5db5 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -28,7 +28,7 @@
 #include "hw/i386/pc.h"
 #include "hw/char/serial.h"
 #include "hw/char/parallel.h"
-#include "hw/i386/apic.h"
+#include "hw/i386/ioapic.h"
 #include "hw/i386/topology.h"
 #include "hw/i386/fw_cfg.h"
 #include "hw/i386/vmport.h"
@@ -406,7 +406,7 @@ GSIState *pc_gsi_create(qemu_irq **irqs, bool pci_enabled)
     if (kvm_ioapic_in_kernel()) {
         kvm_pc_setup_irq_routing(pci_enabled);
     }
-    *irqs = qemu_allocate_irqs(gsi_handler, s, GSI_NUM_PINS);
+    *irqs = qemu_allocate_irqs(gsi_handler, s, IOAPIC_NUM_PINS);
 
     return s;
 }
@@ -1295,7 +1295,7 @@ void pc_basic_device_init(struct PCMachineState *pcms,
         sysbus_realize_and_unref(SYS_BUS_DEVICE(hpet), &error_fatal);
         sysbus_mmio_map(SYS_BUS_DEVICE(hpet), 0, HPET_BASE);
 
-        for (i = 0; i < GSI_NUM_PINS; i++) {
+        for (i = 0; i < IOAPIC_NUM_PINS; i++) {
             sysbus_connect_irq(SYS_BUS_DEVICE(hpet), i, gsi[i]);
         }
         pit_isa_irq = -1;
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 2b34b88dc2..87f1ff94be 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -43,6 +43,7 @@
 #include "hw/i386/ich9.h"
 #include "hw/i386/amd_iommu.h"
 #include "hw/i386/intel_iommu.h"
+#include "hw/i386/ioapic.h"
 #include "hw/display/ramfb.h"
 #include "hw/firmware/smbios.h"
 #include "hw/ide/pci.h"
@@ -265,7 +266,7 @@ static void pc_q35_init(MachineState *machine)
     gsi_state = pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
 
     lpc_dev = DEVICE(lpc);
-    for (i = 0; i < GSI_NUM_PINS; i++) {
+    for (i = 0; i < IOAPIC_NUM_PINS; i++) {
         qdev_connect_gpio_out_named(lpc_dev, ICH9_GPIO_GSI, i, x86ms->gsi[i]);
     }
     isa_bus = ISA_BUS(qdev_get_child_bus(lpc_dev, "isa.0"));
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index b2842f2743..808c572ae4 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -717,7 +717,7 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
                                         ICH9_RST_CNT_IOPORT, &lpc->rst_cnt_mem,
                                         1);
 
-    qdev_init_gpio_out_named(dev, lpc->gsi, ICH9_GPIO_GSI, GSI_NUM_PINS);
+    qdev_init_gpio_out_named(dev, lpc->gsi, ICH9_GPIO_GSI, IOAPIC_NUM_PINS);
 
     isa_bus_irqs(isa_bus, lpc->gsi);
 
-- 
2.39.1


