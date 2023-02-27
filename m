Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFC36A441A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:18:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe8p-00058R-7H; Mon, 27 Feb 2023 09:06:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe8X-0004gJ-MP
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:05:56 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe8P-0008T5-Vb
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:05:47 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so3398120wmq.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1WPmuQessnWr1d6uTNbLIUqufs1MGnEg49yYFi7nMzE=;
 b=nGRrJwzoigQBq+njwid6/eYsUb5vLcI75TCTSFAps67IH/71RYIOgTVU3k+bDMLhTc
 BdX6wy514X/Hgr4v5gDz9wmhYKjykTPwIX25ZpMBaqb6Uy6+pCqeDSHeAyU0oY1wenba
 +ZoRRrDhYlMe9KlaoY3b1qLwm6CmZ3GM9oMG9Mn9OXgzRwD3NS/DjG+XCDLZCLY2loye
 ORKUnvF3vmaY2CmeTpR+/6Nn7z8aXyEg8WEeJocEKqokLf+5ampgM7cPgruSHjOJ+IaM
 CWc+JG1AZ6C1ApPugYqcgTcRD3WMyzvDnoD1/5Du32CMP9npoir0bzB37PfXEudJPu9d
 81sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1WPmuQessnWr1d6uTNbLIUqufs1MGnEg49yYFi7nMzE=;
 b=zygZYcfTmDnhv3lUjgcaa+A3/bCesagHzPtOuI9XqaO1P7gYIEQS3NpUcmnO4gm7cU
 68AVCw6Tv1LwHoaH8jOh0UA1V+2S8dQ+HIeVUacC6q55Bgc5BYE+JfE2nU28vIlJyLK3
 fVkM7oDwIxhs8Q/aHXF2Og/KDxDZD8GrMbnhxq4RKlb3JNp+r/op3scwXbFapEC5g89J
 8tP85bgHSRrVKN2IXrthAS6dAK6XNGnS7fMOwwy+ZSQG0xhNxyZ5AKAkYiz9dHeM9+lL
 041opP+lj0Js+KBS/u19g8bMkP8bVu59A+eKmPIyW/98RuclZslU/WeiZq3yB8aNa9Ft
 79Mg==
X-Gm-Message-State: AO0yUKW1n7iSnZy6UQikr9UsEauKBBKI33mjKRHf3XKI5JBZ4WIcV4Ts
 m7gPXCGUGWrOZTYXJN8AqBYMvxZs9y1CawJ6
X-Google-Smtp-Source: AK7set/OZVIkKQVZUURFHkPwv+8vQ1ZmVHhObEq4cbKpfKCy/gTmFUBpC4PXkKjXGq7mUz1H1M1apw==
X-Received: by 2002:a05:600c:3b85:b0:3ea:e7f7:65e2 with SMTP id
 n5-20020a05600c3b8500b003eae7f765e2mr10132293wms.26.1677506744182; 
 Mon, 27 Feb 2023 06:05:44 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a05600c351200b003eb192787bfsm9505821wmq.25.2023.02.27.06.05.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:05:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 048/126] hw/i386/ich9: Remove redundant GSI_NUM_PINS
Date: Mon, 27 Feb 2023 15:00:55 +0100
Message-Id: <20230227140213.35084-39-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Bernhard Beschow <shentey@gmail.com>

Most code uses IOAPIC_NUM_PINS. The only place where GSI_NUM_PINS defines
the size of an array is ICH9LPCState::gsi which needs to match
IOAPIC_NUM_PINS. Remove GSI_NUM_PINS for consistency.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230213173033.98762-10-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc.c           | 6 +++---
 hw/i386/pc_q35.c       | 3 ++-
 hw/isa/lpc_ich9.c      | 2 +-
 include/hw/i386/ich9.h | 2 +-
 include/hw/i386/x86.h  | 1 -
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index a7a2ededf9..d257545018 100644
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
@@ -405,7 +405,7 @@ GSIState *pc_gsi_create(qemu_irq **irqs, bool pci_enabled)
     if (kvm_ioapic_in_kernel()) {
         kvm_pc_setup_irq_routing(pci_enabled);
     }
-    *irqs = qemu_allocate_irqs(gsi_handler, s, GSI_NUM_PINS);
+    *irqs = qemu_allocate_irqs(gsi_handler, s, IOAPIC_NUM_PINS);
 
     return s;
 }
@@ -1296,7 +1296,7 @@ void pc_basic_device_init(struct PCMachineState *pcms,
         sysbus_realize_and_unref(SYS_BUS_DEVICE(hpet), &error_fatal);
         sysbus_mmio_map(SYS_BUS_DEVICE(hpet), 0, HPET_BASE);
 
-        for (i = 0; i < GSI_NUM_PINS; i++) {
+        for (i = 0; i < IOAPIC_NUM_PINS; i++) {
             sysbus_connect_irq(SYS_BUS_DEVICE(hpet), i, gsi[i]);
         }
         pit_isa_irq = -1;
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 4508e8ac10..d35316878d 100644
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
@@ -267,7 +268,7 @@ static void pc_q35_init(MachineState *machine)
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
index 5d3047a1d1..a09388b657 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -131,7 +131,6 @@ bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms);
 
 /* Global System Interrupts */
 
-#define GSI_NUM_PINS IOAPIC_NUM_PINS
 #define ACPI_BUILD_PCI_IRQS ((1<<5) | (1<<9) | (1<<10) | (1<<11))
 
 typedef struct GSIState {
-- 
2.38.1


