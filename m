Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC4B669E5A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:40:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMHq-0002db-F8; Fri, 13 Jan 2023 10:48:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMHo-0002cf-6D
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:48:08 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMHm-0006XF-8l
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:48:07 -0500
Received: by mail-wr1-x436.google.com with SMTP id t5so17054123wrq.1
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t5euQ36VIHDBpJngs0VMt3+ocu7xkQmgUOfoh2CL5Lw=;
 b=kuLE82fsfFXMcJZreympZCqLvGgQXBJ5bQEXdIV3dDN97tNFQ7Im15zStMav865269
 wh6W5RzDWNrDOHOey26qAVcchqdjClhMI0rwWVaOTf3f1KM66C79piWn9mXuViA1NJ5S
 Jylgadl69yeWieNCpL54P/Xu6WYALnBdbMF2KQK1FLpYN2wDsXqypbGueB0ri3NBkuZi
 tRDz1DoOhSELnYGa0wpaJdIyb1XtZ63qIfruwQfLYDgzlE3lRC+gnaB7hB8Y2KAiUnVR
 lAfhhA8sdJf6U4pEWHZ3hFdPjQHBZzi134AYcF3JK726dSK1ucLhGUUgJNzus5vcWS2v
 lShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t5euQ36VIHDBpJngs0VMt3+ocu7xkQmgUOfoh2CL5Lw=;
 b=IxbElraqdVXkKdS10Q15c9uaCqVr+olpcO/Xoj7Irq2OVhYovnBVGOUh226SemBvyj
 qSrj7usowXRiJO+Kpm6Kv5iunRpB/whlxhc9HU3JTxVZKVU2fhOUfv0WZZj9sGYHST/C
 giNVjW0a+vaJbYjA73iyBn8hsR0q4vbVLt2Lz1E8GqgYznJS0LnVC2ccRQy1nZxln0C2
 xEZxZ3iaPgNGECaa2UHW44S7JOzUVeTEDGlBd4iw2HdFLJ/TfUaSwmltRztWHf6tBjHB
 B+bswY+ZsL+Qme9cmsECeQRSS9HyjvnB5lomPvIkaPZmsjqb+yBXR4sdh9EoPkieZEE4
 rEWw==
X-Gm-Message-State: AFqh2kpTjm3x4GrWvLjyFHqU7sEg/kuto7ZM2P9qlJM1edCEvPgo4gRG
 XQnm7Ec2Ie6Q+lI88D/CNw2jNWfJ63F+NWE4
X-Google-Smtp-Source: AMrXdXsBc2Dhn4j+nZ9kEr0sXAKQxxzmh5s38sOQGtYkf8sn/RVOzG4OhefEEgUPdxPBK33XtDJ+/w==
X-Received: by 2002:a5d:670d:0:b0:2bd:c19f:8e90 with SMTP id
 o13-20020a5d670d000000b002bdc19f8e90mr7478854wru.7.1673624884389; 
 Fri, 13 Jan 2023 07:48:04 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a5d66c9000000b002bdd7ce63b2sm3823475wrw.38.2023.01.13.07.48.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:48:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 31/46] hw/isa/piix3: Decouple INTx-to-LNKx routing which is
 board-specific
Date: Fri, 13 Jan 2023 16:45:17 +0100
Message-Id: <20230113154532.49979-32-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

pci_map_irq_fn's in general seem to be board-specific. So move PIIX3's
pci_slot_get_pirq() to board code to not have PIIX3 make assuptions
about its board.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230109172347.1830-6-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc_piix.c | 15 +++++++++++++++
 hw/isa/piix3.c    | 13 -------------
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index b48047f50c..bb3b10557f 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -47,6 +47,7 @@
 #include "hw/sysbus.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/xen/xen-x86.h"
+#include "hw/xen/xen.h"
 #include "exec/memory.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/piix4.h"
@@ -73,6 +74,17 @@ static const int ide_iobase2[MAX_IDE_BUS] = { 0x3f6, 0x376 };
 static const int ide_irq[MAX_IDE_BUS] = { 14, 15 };
 #endif
 
+/*
+ * Return the global irq number corresponding to a given device irq
+ * pin. We could also use the bus number to have a more precise mapping.
+ */
+static int pc_pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
+{
+    int slot_addend;
+    slot_addend = PCI_SLOT(pci_dev->devfn) - 1;
+    return (pci_intx + slot_addend) & 3;
+}
+
 /* PC hardware initialisation */
 static void pc_init1(MachineState *machine,
                      const char *host_type, const char *pci_type)
@@ -216,6 +228,9 @@ static void pc_init1(MachineState *machine,
                               x86ms->below_4g_mem_size,
                               x86ms->above_4g_mem_size,
                               pci_memory, ram_memory);
+        pci_bus_map_irqs(pci_bus,
+                         xen_enabled() ? xen_pci_slot_get_pirq
+                                       : pc_pci_slot_get_pirq);
         pcms->bus = pci_bus;
 
         pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 666e794f77..283b971ec4 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -79,17 +79,6 @@ static void piix3_set_irq(void *opaque, int pirq, int level)
     piix3_set_irq_level(piix3, pirq, level);
 }
 
-/*
- * Return the global irq number corresponding to a given device irq
- * pin. We could also use the bus number to have a more precise mapping.
- */
-static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
-{
-    int slot_addend;
-    slot_addend = PCI_SLOT(pci_dev->devfn) - 1;
-    return (pci_intx + slot_addend) & 3;
-}
-
 static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
 {
     PIIX3State *piix3 = opaque;
@@ -385,7 +374,6 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
     }
 
     pci_bus_irqs(pci_bus, piix3_set_irq, piix3, PIIX_NUM_PIRQS);
-    pci_bus_map_irqs(pci_bus, pci_slot_get_pirq);
     pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
 }
 
@@ -421,7 +409,6 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
      * These additional routes can be discovered through ACPI.
      */
     pci_bus_irqs(pci_bus, xen_piix3_set_irq, piix3, XEN_PIIX_NUM_PIRQS);
-    pci_bus_map_irqs(pci_bus, xen_pci_slot_get_pirq);
 }
 
 static void piix3_xen_class_init(ObjectClass *klass, void *data)
-- 
2.38.1


