Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 070C74B9435
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 23:54:34 +0100 (CET)
Received: from localhost ([::1]:45878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKTBx-00022p-2Q
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 17:54:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKT3n-0007ms-Ie
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 17:46:07 -0500
Received: from [2a00:1450:4864:20::52d] (port=43647
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKT3l-0003SW-Q3
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 17:46:07 -0500
Received: by mail-ed1-x52d.google.com with SMTP id m3so461565eda.10
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 14:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WbIstrcYIVfKLpqcOPyh6SwNWQ33Mhi39mdw+dA+Tjs=;
 b=HwjKQVhQNcJY1eMOFVITUVcjcA0qMO+JE3PFPzzbSJ5YreeAoO1Fzo81dwuoO0Rb4E
 PlDN/Zj9tTOAJuqYamOECWeP8RjdYkBfwdPTSHZyARbPIObHOZNHQzv4Y8zZDyS7GI50
 MJbeYxy6/07GLah8E1kX8MGpF3bmSX+kfsuggYCeKjZ4Boxsj6fjfLXR+2wAX8NT0Nlf
 ttsMRGfua2pBjTeQSZhX8BoRqJ0Rn9DzuiIVgghCe747cX3BcZAOkIccBFKGa5Pu4ins
 TV7B7kL/U/yzaA2brwKtwXMYVUPkFDdOZAcKSuoe4m+34VCfMfrNr2Rl4vnxDSoXllK9
 bZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WbIstrcYIVfKLpqcOPyh6SwNWQ33Mhi39mdw+dA+Tjs=;
 b=0oNVY4kpDuDWw9pw18caDAm7LOoOu4jR6hjkrQPJGGmA3CGXTsZEW7b9pbacG30S3p
 pbfhx+lFPG5mJF5uiABsJXEe8XwCARYp/OxOapYquXgH8IZ/dgulrRFB/txcjHYeRWD0
 sIG18oQPhtKmXRviwrx3L4medXskKfvcVkTEnkt4Ra7OmgHSM+JXyISmqqbWLe+rnbbr
 fYA6TPJ22fjAXAN8iNAxGCh0Fo6qTXSnbYAuJrCjEahFbFK91Hin5LYZpNUSffirZi+s
 bdgEJrbO7bw3ptHHwQGhk7LjM2Y/NTbCEJ9HR81Eh4wOw7vW8g9KEfFj8I9p6OcIExCl
 jrkQ==
X-Gm-Message-State: AOAM533Pu2/UJm0Tl2GwDskvmwu2A2HKl2AnvAIFJu5WtEepSC/biWrW
 uW9jMtCGqRz299ggFUULly4gyvEFv9Q=
X-Google-Smtp-Source: ABdhPJwlq2KDi2XP0XHAeSWqrhPl0BnRz7slaoH5jWYbixBhclj1qj2qujShZLOQYG2QXefuyY0KZA==
X-Received: by 2002:a05:6402:198:b0:410:83e3:21d7 with SMTP id
 r24-20020a056402019800b0041083e321d7mr5413988edv.159.1645051564464; 
 Wed, 16 Feb 2022 14:46:04 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-078-054-075-152.78.54.pool.telefonica.de. [78.54.75.152])
 by smtp.gmail.com with ESMTPSA id t26sm1475820edv.50.2022.02.16.14.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 14:46:04 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/7] hw/mips/gt64xxx_pci: Resolve gt64120_register()
Date: Wed, 16 Feb 2022 23:45:19 +0100
Message-Id: <20220216224519.157233-8-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220216224519.157233-1-shentey@gmail.com>
References: <20220216224519.157233-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that gt64120_register() lost its pic parameter, there is an
opportunity to remove it. gt64120_register() is old style by wrapping
qdev API, and the new style is to use qdev directly. So take the
opportunity and modernize the code.

Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/mips/gt64xxx_pci.c  | 21 ++++-----------------
 hw/mips/malta.c        | 13 ++++++++-----
 include/hw/mips/mips.h |  3 ---
 3 files changed, 12 insertions(+), 25 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index eb205d6d70..e0ff1b5566 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -26,7 +26,6 @@
 #include "qapi/error.h"
 #include "qemu/units.h"
 #include "qemu/log.h"
-#include "hw/mips/mips.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
 #include "migration/vmstate.h"
@@ -1151,30 +1150,18 @@ static void gt64120_reset(DeviceState *dev)
 static void gt64120_realize(DeviceState *dev, Error **errp)
 {
     GT64120State *s = GT64120_PCI_HOST_BRIDGE(dev);
+    PCIHostState *phb = PCI_HOST_BRIDGE(dev);
 
     memory_region_init_io(&s->ISD_mem, OBJECT(dev), &isd_mem_ops, s,
                           "gt64120-isd", 0x1000);
-}
-
-PCIBus *gt64120_register(void)
-{
-    GT64120State *d;
-    PCIHostState *phb;
-    DeviceState *dev;
-
-    dev = qdev_new(TYPE_GT64120_PCI_HOST_BRIDGE);
-    d = GT64120_PCI_HOST_BRIDGE(dev);
-    phb = PCI_HOST_BRIDGE(dev);
-    memory_region_init(&d->pci0_mem, OBJECT(dev), "pci0-mem", 4 * GiB);
-    address_space_init(&d->pci0_mem_as, &d->pci0_mem, "pci0-mem");
+    memory_region_init(&s->pci0_mem, OBJECT(dev), "pci0-mem", 4 * GiB);
+    address_space_init(&s->pci0_mem_as, &s->pci0_mem, "pci0-mem");
     phb->bus = pci_root_bus_new(dev, "pci",
-                                &d->pci0_mem,
+                                &s->pci0_mem,
                                 get_system_io(),
                                 PCI_DEVFN(18, 0), TYPE_PCI_BUS);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     pci_create_simple(phb->bus, PCI_DEVFN(0, 0), "gt64120_pci");
-    return phb->bus;
 }
 
 static void gt64120_pci_realize(PCIDevice *d, Error **errp)
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 13254dbc89..16fdaed3db 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -38,6 +38,7 @@
 #include "hw/mips/mips.h"
 #include "hw/mips/cpudevs.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/pci_host.h"
 #include "qemu/log.h"
 #include "hw/mips/bios.h"
 #include "hw/ide.h"
@@ -1230,7 +1231,7 @@ void mips_malta_init(MachineState *machine)
     const size_t smbus_eeprom_size = 8 * 256;
     uint8_t *smbus_eeprom_buf = g_malloc0(smbus_eeprom_size);
     uint64_t kernel_entry, bootloader_run_addr;
-    PCIBus *pci_bus;
+    PCIHostState *phb;
     ISABus *isa_bus;
     qemu_irq cbus_irq, i8259_irq;
     I2CBus *smbus;
@@ -1390,7 +1391,9 @@ void mips_malta_init(MachineState *machine)
     stl_p(memory_region_get_ram_ptr(bios_copy) + 0x10, 0x00000420);
 
     /* Northbridge */
-    pci_bus = gt64120_register();
+    dev = qdev_new("gt64120");
+    phb = PCI_HOST_BRIDGE(dev);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     /*
      * The whole address space decoded by the GT-64120A doesn't generate
      * exception when accessing invalid memory. Create an empty slot to
@@ -1399,7 +1402,7 @@ void mips_malta_init(MachineState *machine)
     empty_slot_init("GT64120", 0, 0x20000000);
 
     /* Southbridge */
-    dev = piix4_create(pci_bus, &isa_bus, &smbus);
+    dev = piix4_create(phb->bus, &isa_bus, &smbus);
 
     /* Interrupt controller */
     qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
@@ -1414,10 +1417,10 @@ void mips_malta_init(MachineState *machine)
     isa_create_simple(isa_bus, TYPE_FDC37M81X_SUPERIO);
 
     /* Network card */
-    network_init(pci_bus);
+    network_init(phb->bus);
 
     /* Optional PCI video card */
-    pci_vga_init(pci_bus);
+    pci_vga_init(phb->bus);
 }
 
 static void mips_malta_instance_init(Object *obj)
diff --git a/include/hw/mips/mips.h b/include/hw/mips/mips.h
index ff88942e63..101799f7d3 100644
--- a/include/hw/mips/mips.h
+++ b/include/hw/mips/mips.h
@@ -9,9 +9,6 @@
 
 #include "exec/memory.h"
 
-/* gt64xxx.c */
-PCIBus *gt64120_register(void);
-
 /* bonito.c */
 PCIBus *bonito_init(qemu_irq *pic);
 
-- 
2.35.1


