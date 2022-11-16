Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9E162C886
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 19:57:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovNZs-0002BZ-Oa; Wed, 16 Nov 2022 13:56:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1ovNZb-000288-4b
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 13:55:48 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1ovNZX-0002nn-7O
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 13:55:44 -0500
Received: by mail-ej1-x634.google.com with SMTP id m22so46334611eji.10
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 10:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LnajS2HAtBtCuFF8nCQ1JHCjDhZ/Yqc5s6hptxZ5o5Q=;
 b=fM3smxcl0soHebTDhrJvoS+A3gzjpJLKe1KdmHb4ONE50DKVMYE2ABZXUoO33UUarw
 TwJqkggnuoiZB4QATuF41shR/wdw4U+J5IcMjHfzeQ5ofhPSR3B7U2Lyv3yRyr40ya56
 bPDN6sFRddsFMa9Ju2LdalnVJ9mjZOOyCAJzlSUCJHROk29oPlanAxS9e1NS6feazLlz
 JI20vYeTK/qp5Lr/4bzQ5ktW6Cn5df95Qv1bX3A9vHUIb103kp9SI8to+WvmM/KSsLDh
 1SPjJQS7k983cg8xmI0w3xFrZuy22otXTWqFh2d+hF0Ve2yXAVjehlfV8kWieMsFbGCf
 Chxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LnajS2HAtBtCuFF8nCQ1JHCjDhZ/Yqc5s6hptxZ5o5Q=;
 b=cjuPvKW2QfceOMuT09f2LGDJtqc7Ff7X89ZVLijS0dBpoTKRB00wncONxQ6oVi112N
 i12FjBiW7+JCg2vXY1VU2CVgfAbUx6WH+nXnvjx1X8sB5nhnDeODkDteucwDNpJOqH0E
 i5hwAV6PFLHMljAhjiBTwZkUcqqzTbxglye49KaMjY7jtf1O0Etha5VTyPQXHaC7Ldan
 UnNIAKkBCXAjNbk6p6Q/W7IPHWpFRWWJrxpp5/ohHxyjddd1lc/bR/W9d/wsWgNDPLH8
 5U5SvZOAcSJ+64fI0LEir8bm4fke8Pebz4XbHJfyLifwa/RX3b4xbGGR6D6+hCN86cLH
 aDzw==
X-Gm-Message-State: ANoB5placTrL8UVIMmg5mYtjkIts6HTJdfVEtWPL33/dBRvALbJF7iAu
 K0jRQvsa+YieHKvjVcHK8ZeIOcIiyHQ=
X-Google-Smtp-Source: AA0mqf4apN/fsvHEJx8CIQmzBzIoMrZP/d7o4YPibIEuw6/WiigsEbOMrjE8LPumuNurG6RkA906qQ==
X-Received: by 2002:a17:906:a386:b0:78d:3f96:b7aa with SMTP id
 k6-20020a170906a38600b0078d3f96b7aamr18354735ejz.74.1668624940674; 
 Wed, 16 Nov 2022 10:55:40 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-013-007-153.77.13.pool.telefonica.de. [77.13.7.153])
 by smtp.gmail.com with ESMTPSA id
 de30-20020a1709069bde00b0073d796a1043sm7135444ejc.123.2022.11.16.10.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 10:55:40 -0800 (PST)
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
Subject: [RFC PATCH 2/3] hw/isa/piix4: Decouple INTx-to-LNKx routing which is
 board-specific
Date: Wed, 16 Nov 2022 19:54:59 +0100
Message-Id: <20221116185500.84019-3-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221116185500.84019-1-shentey@gmail.com>
References: <20221116185500.84019-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
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

pci_map_irq_fn's in general seem to be board-specific, and PIIX4's
pci_slot_get_pirq() in particular seems very Malta-specific. So move the
latter to malta.c to 1/ keep the board logic in one place and 2/ avoid
PIIX4 to make assumptions about its board.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c  | 28 ++--------------------------
 hw/mips/malta.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 26 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 8fc1db6dc9..709dd901c2 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -28,6 +28,7 @@
 #include "hw/irq.h"
 #include "hw/southbridge/piix.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/pci_bus.h"
 #include "hw/ide/piix.h"
 #include "hw/isa/isa.h"
 #include "hw/intc/i8259.h"
@@ -79,31 +80,6 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
     }
 }
 
-static int pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
-{
-    int slot;
-
-    slot = PCI_SLOT(pci_dev->devfn);
-
-    switch (slot) {
-    /* PIIX4 USB */
-    case 10:
-        return 3;
-    /* AMD 79C973 Ethernet */
-    case 11:
-        return 1;
-    /* Crystal 4281 Sound */
-    case 12:
-        return 2;
-    /* PCI slot 1 to 4 */
-    case 18 ... 21:
-        return ((slot - 18) + irq_num) & 0x03;
-    /* Unknown device, don't do any translation */
-    default:
-        return irq_num;
-    }
-}
-
 static void piix4_isa_reset(DeviceState *dev)
 {
     PIIX4State *d = PIIX4_PCI_DEVICE(dev);
@@ -271,7 +247,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     }
     qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->isa[9]);
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
+    pci_bus_irqs(pci_bus, piix4_set_irq, pci_bus->map_irq, s, PIIX_NUM_PIRQS);
 }
 
 static void piix4_init(Object *obj)
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index c0a2e0ab04..8a6b66e759 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -39,6 +39,7 @@
 #include "hw/mips/bootloader.h"
 #include "hw/mips/cpudevs.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/pci_bus.h"
 #include "qemu/log.h"
 #include "hw/mips/bios.h"
 #include "hw/ide/pci.h"
@@ -1140,6 +1141,31 @@ static void malta_mips_config(MIPSCPU *cpu)
     }
 }
 
+static int pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
+{
+    int slot;
+
+    slot = PCI_SLOT(pci_dev->devfn);
+
+    switch (slot) {
+    /* PIIX4 USB */
+    case 10:
+        return 3;
+    /* AMD 79C973 Ethernet */
+    case 11:
+        return 1;
+    /* Crystal 4281 Sound */
+    case 12:
+        return 2;
+    /* PCI slot 1 to 4 */
+    case 18 ... 21:
+        return ((slot - 18) + irq_num) & 0x03;
+    /* Unknown device, don't do any translation */
+    default:
+        return irq_num;
+    }
+}
+
 static void main_cpu_reset(void *opaque)
 {
     MIPSCPU *cpu = opaque;
@@ -1411,6 +1437,9 @@ void mips_malta_init(MachineState *machine)
     /* Interrupt controller */
     qdev_connect_gpio_out_named(DEVICE(piix4), "intr", 0, i8259_irq);
 
+    pci_bus_irqs(pci_bus, pci_bus->set_irq, pci_slot_get_pirq,
+                 piix4, pci_bus->nirq);
+
     /* generate SPD EEPROM data */
     dev = DEVICE(object_resolve_path_component(OBJECT(piix4), "pm"));
     smbus = I2C_BUS(qdev_get_child_bus(dev, "i2c"));
-- 
2.38.1


