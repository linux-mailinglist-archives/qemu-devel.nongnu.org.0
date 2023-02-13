Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD078694E10
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:33:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcfi-00087k-KX; Mon, 13 Feb 2023 12:31:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRcfb-00084s-IF
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:31:17 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRcfY-0005Py-DM
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:31:14 -0500
Received: by mail-ej1-x629.google.com with SMTP id jg8so33736270ejc.6
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 09:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QFEl1SbZY1EEn4SVcGwifuDKtFpy/mikqpDm15Zavs0=;
 b=Ygg1p5BbHakLXMB/Z+TL+/2YT2mTIEfSlRNdJ4uMANu7WsV4XS0Utq683zIdsUuojU
 u+2am02lNe+YzR11MxWDNqeexpxZUgaCsfKGgfbO3fnn8NmrnymBS85nPXvi0lNUJ/E5
 GRdMrd00LlklcniaHaEXquhWBVKijOcubIxfBIYfLHvnlfl/lIKXy4lUP/l9ApOijx+9
 /xD7jtK9hv8APvwmhyxMPQuwbC1WkoDu7SOg5wF7FnhNmpMGbiHRCGdltNdptcNhiFVY
 hJWD2F0uTMAXZ9OqRudAMX6LlpG8CGzvdxVG7iWh+vvl3WSkRz2RkZeUCLqXhZPTg9Fr
 82XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QFEl1SbZY1EEn4SVcGwifuDKtFpy/mikqpDm15Zavs0=;
 b=4797vWktVp5Gy7LBafJofDAJHypi+tLr9k+VzMFOnotH4rny/z7owH/Vtufs3k46Ex
 YysBaFT6AZ/cAlAAKrTMYlr12BH8TBZXvonVUzNrdOkaSUk9/EqHvtaFbj3JxiBiWqOu
 EkAoLhEqMI80dgRUiBkuTzT6UH0ftDYj9Fr+n6nPj2+a6VlfEI6yrQCUy8xOO0wMkvqN
 1WN17/h3Nz19Ua9aYQcM0+rfokbApxKnTWnNtktAlG3n+CXmN0qR5uvhRdD5thlJNXX6
 dvQ1vfVc+RcwzKOpaAklWYtNbUXcvPXxdpzAHwU0FPXkNEfVwLr0yU4zgFWcrmxG2eDW
 xPpw==
X-Gm-Message-State: AO0yUKV2qFrkfWqdC8fQhEGMbo5jTMmQfcJswtKxeiapje7i91hwjbUO
 lvqa6HsfnfIKU36G8n7gRTGZGW5jcAs=
X-Google-Smtp-Source: AK7set9qb22J/pvgk392h0/tnOOW6zkf2EswZlBsyESQsOqvOwpN6MGaI/C6DXmnDxAYENDLTAF/qg==
X-Received: by 2002:a17:906:a0d1:b0:883:be32:cd33 with SMTP id
 bh17-20020a170906a0d100b00883be32cd33mr30870294ejb.35.1676309470217; 
 Mon, 13 Feb 2023 09:31:10 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-133-198.78.55.pool.telefonica.de. [78.55.133.198])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170906684b00b008aea5e0938esm6988699ejs.183.2023.02.13.09.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 09:31:09 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 09/12] hw/i386/ich9: Remove redundant GSI_NUM_PINS
Date: Mon, 13 Feb 2023 18:30:30 +0100
Message-Id: <20230213173033.98762-10-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213173033.98762-1-shentey@gmail.com>
References: <20230213173033.98762-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
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
index ba6912b721..6f52f8fe95 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -136,7 +136,6 @@ bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms);
 
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
index f13b516f2e..28434612af 100644
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
@@ -268,7 +269,7 @@ static void pc_q35_init(MachineState *machine)
     gsi_state = pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
 
     lpc_dev = DEVICE(lpc);
-    for (i = 0; i < GSI_NUM_PINS; i++) {
+    for (i = 0; i < IOAPIC_NUM_PINS; i++) {
         qdev_connect_gpio_out_named(lpc_dev, ICH9_GPIO_GSI, i, x86ms->gsi[i]);
     }
     isa_bus = ISA_BUS(qdev_get_child_bus(lpc_dev, "isa.0"));
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 2a4baac129..e3385ca7be 100644
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


