Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FD262C884
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 19:57:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovNZp-00029A-DL; Wed, 16 Nov 2022 13:56:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1ovNZY-00027v-Uo
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 13:55:48 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1ovNZV-0002nh-ER
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 13:55:43 -0500
Received: by mail-ej1-x633.google.com with SMTP id kt23so46389693ejc.7
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 10:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eJ+AvO1YFDSaeaJt9VdWDzBH4lBrPoDLbIi1ngo1iDI=;
 b=CnkB7FZ36qcbBLYwP+Q0/kdM+F18AA4ySE6O10p8yr2ujM+vTzdeWC1fvb1FOcT0Wh
 nM5stlVuCxO4HZvGd3VqBrQM6guiLwC2gExYPyDc2h/2M9FNQ7I1vnADx3TsHVFAQOlA
 2qW3mq7PGXMsLt8FrUPqvLWEcWBqEDaBkeIYrHUz7SiSKMcpm+BOH/RIb6Y5uCbLa7He
 gzlp68Ja2V1vxr+cAxvnUf91wOi0znotPkrhaaoK5iM4LcbzKSkzN/2/xMGavwresC+G
 dHcqdF5N2JQPwBJ1iraawGEyLisXhBCZrXf7wb+ILpYiYKLTdRDHGp1AAXcPFlOmq9KP
 5f3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eJ+AvO1YFDSaeaJt9VdWDzBH4lBrPoDLbIi1ngo1iDI=;
 b=OmGqupylQF9oNWPMIi17l5Plfq1YQnme4GHdrq95DEgQ9N6MKUe2TIL8XWPHpbJvS4
 Nbdw6V8VJ47c9pPeOMlzKqoExaMHwdwMLTVvXK7SRq05jEep2Yu940jFYoO7DFdLdSh2
 vi5cDPmjYgQBNxqSSplF9ukApbuva9oIprJKWaGm8+70Ih5zEBKkPuUw+PmYoqoe80HQ
 mkj61NuVmYtCP4yIg61/ZoCHBngjr2qE7Qyp6ZoXfW6HiLpptVvZ3sSekb+RBRMOUonz
 VPtpuSxX1iNDNCNNA2L7XgrFIJzv6vJ4o3z/9KSg+yyaDSH3G1/Ek9n3TKTAkdva3XWV
 w9kw==
X-Gm-Message-State: ANoB5pkHb/8egMwwXwMVZ3wmD7Aco9fKRphgnbITsnQrD81mctx5xeo/
 omLIPFO5nsla4eQbGpYhDmLe8asjU34=
X-Google-Smtp-Source: AA0mqf6h51S/Q9q5dwi8K5If3FQdh3MMgSC2lJ4Vd1VlHGZcBWxguw2QckPYiIERofHN8POuzw0c7Q==
X-Received: by 2002:a17:906:c56:b0:7ad:88f8:68fb with SMTP id
 t22-20020a1709060c5600b007ad88f868fbmr19124001ejf.277.1668624939503; 
 Wed, 16 Nov 2022 10:55:39 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-013-007-153.77.13.pool.telefonica.de. [77.13.7.153])
 by smtp.gmail.com with ESMTPSA id
 de30-20020a1709069bde00b0073d796a1043sm7135444ejc.123.2022.11.16.10.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 10:55:39 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
Subject: [RFC PATCH 1/3] hw/isa/piix3: Decouple INTx-to-LNKx routing which is
 board-specific
Date: Wed, 16 Nov 2022 19:54:58 +0100
Message-Id: <20221116185500.84019-2-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221116185500.84019-1-shentey@gmail.com>
References: <20221116185500.84019-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
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

pci_map_irq_fn's in general seem to be board-specific. So move PIIX3's
pci_slot_get_pirq() to board code to not have PIIX3 make assuptions
about its board.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c | 17 +++++++++++++++++
 hw/isa/piix3.c    | 16 +++-------------
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 0ad0ed1603..07aa38081a 100644
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
+static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
+{
+    int slot_addend;
+    slot_addend = PCI_SLOT(pci_dev->devfn) - 1;
+    return (pci_intx + slot_addend) & 3;
+}
+
 /* PC hardware initialisation */
 static void pc_init1(MachineState *machine,
                      const char *host_type, const char *pci_type)
@@ -223,6 +235,11 @@ static void pc_init1(MachineState *machine,
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
+
+        pci_bus_irqs(pci_bus, pci_bus->set_irq,
+                     xen_enabled() ? xen_pci_slot_get_pirq
+                                   : pci_slot_get_pirq,
+                     pci_dev, pci_bus->nirq);
     } else {
         pci_bus = NULL;
         isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index f9b4af5c05..83a6e3be72 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -29,6 +29,7 @@
 #include "hw/southbridge/piix.h"
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
+#include "hw/pci/pci_bus.h"
 #include "hw/xen/xen.h"
 #include "sysemu/runstate.h"
 #include "migration/vmstate.h"
@@ -79,17 +80,6 @@ static void piix3_set_irq(void *opaque, int pirq, int level)
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
@@ -388,7 +378,7 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    pci_bus_irqs(pci_bus, piix3_set_irq, pci_slot_get_pirq,
+    pci_bus_irqs(pci_bus, piix3_set_irq, pci_bus->map_irq,
                  piix3, PIIX_NUM_PIRQS);
     pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
 }
@@ -424,7 +414,7 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
      * connected to the IOAPIC directly.
      * These additional routes can be discovered through ACPI.
      */
-    pci_bus_irqs(pci_bus, xen_piix3_set_irq, xen_pci_slot_get_pirq,
+    pci_bus_irqs(pci_bus, xen_piix3_set_irq, pci_bus->map_irq,
                  piix3, XEN_PIIX_NUM_PIRQS);
 }
 
-- 
2.38.1


