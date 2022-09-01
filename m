Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89C55A9D1E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:31:21 +0200 (CEST)
Received: from localhost ([::1]:45452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTn69-0007Rv-4f
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1n-0001bZ-Pu
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:26:53 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:34582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1m-0001Sk-19
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:26:51 -0400
Received: by mail-ej1-x629.google.com with SMTP id y3so35859311ejc.1
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=PUf0smrU1Uq6DvRuukc2bu0xLP9NOz9TADXgYciMGNM=;
 b=ievEE0soa7hr/JK30VaW+VgUpdzh4ptpoScvf60ix+ImhmpkczszBnUSFZyBjfQRcK
 IJhdomJ5kTVBo2idEPIy9tJcPa6eH3qrDU/YM5KMgJFgY57ttNOyJuGllWAgcuJsCdJx
 d/AqSx+rSOMJXsD+7HO6jX4adMDGM8xLJm9Bnf1aEbOVXzRr/pWmEL5LJEBf35K2vH+Z
 kpYXxfhRRwjUgr0LWiBcqJEzaccrlwMqFrEPTNCju7iZizyFZT3UmhpDvzExOy+YoBow
 8rwZR8jprPqQAG5OcF9aJaxixOUam9tZLVcN4G8AoaOi6axIgUYy+TV7/OIq3YH3esls
 52vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=PUf0smrU1Uq6DvRuukc2bu0xLP9NOz9TADXgYciMGNM=;
 b=Gv8GijyB/PMmZqojEhuQvwyd6DUJAtcXEoVYKLQgbdKzFXd19qrfEwGaQ2TEHI5xe4
 62hka06eOm1Rauz0YuQ8L3NCrJe6vja/I/jIeWBsPTpt8b9XxtrxhzpEn+3jgbevgObQ
 8Vh9TYi/Ml/YcSaYj4dCf7XkkBpe1Jtbaja62fRdaFPcz3FcoCF+0xtAyG1pzhZYU/fp
 jEBcZjClntDBp3VdL7znvr8RwjNDkUXaaqRDTMkKsWeutjQj4LPMISXDdzkgY4vEMkSU
 3BVf1x2Qv0HVcVfGBklGclQSYnOLmE9D/TXSFF24xrux45WcPd8YppFGclpYoua3yX/5
 a6Dw==
X-Gm-Message-State: ACgBeo0nCvbo61LVye2CLepEhFnAsfLl1v92oTfph3/HEp2VF+n5b6kJ
 o6rHGcwdJ2+mkosSe2tqXVV8Bmbujzc=
X-Google-Smtp-Source: AA6agR64ueiEbgZDkDUoGD1ci+9btR9E4r71Tl1n+fJcUBKBv/ZBcMUdQmx7SUBl413k2mcdjokAUQ==
X-Received: by 2002:a17:907:6d05:b0:73d:8092:91ea with SMTP id
 sa5-20020a1709076d0500b0073d809291eamr23950221ejc.280.1662049608282; 
 Thu, 01 Sep 2022 09:26:48 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:26:48 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 01/42] hw/i386/pc: Create DMA controllers in south bridges
Date: Thu,  1 Sep 2022 18:25:32 +0200
Message-Id: <20220901162613.6939-2-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just like in the real hardware (and in PIIX4), create the DMA
controllers in the south bridges.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc.c      | 3 ---
 hw/i386/pc_piix.c | 2 ++
 hw/isa/Kconfig    | 2 ++
 hw/isa/lpc_ich9.c | 3 +++
 hw/isa/piix3.c    | 9 +++++++--
 5 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 566accf7e6..174b6c2ace 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -47,7 +47,6 @@
 #include "multiboot.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/intc/i8259.h"
-#include "hw/dma/i8257.h"
 #include "hw/timer/i8254.h"
 #include "hw/input/i8042.h"
 #include "hw/irq.h"
@@ -1319,8 +1318,6 @@ void pc_basic_device_init(struct PCMachineState *pcms,
         pcspk_init(pcms->pcspk, isa_bus, pit);
     }
 
-    i8257_dma_init(isa_bus, 0);
-
     /* Super I/O */
     pc_superio_init(isa_bus, create_fdctrl, pcms->i8042_enabled,
                     pcms->vmport != ON_OFF_AUTO_ON);
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 8043a250ad..fc70a1abc2 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -26,6 +26,7 @@
 #include CONFIG_DEVICES
 
 #include "qemu/units.h"
+#include "hw/dma/i8257.h"
 #include "hw/loader.h"
 #include "hw/i386/x86.h"
 #include "hw/i386/pc.h"
@@ -225,6 +226,7 @@ static void pc_init1(MachineState *machine,
         pci_bus = NULL;
         isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
                               &error_abort);
+        i8257_dma_init(isa_bus, 0);
         pcms->hpet_enabled = false;
     }
     isa_bus_irqs(isa_bus, x86ms->gsi);
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index d42143a991..c65d2d2666 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -33,6 +33,7 @@ config PC87312
 
 config PIIX3
     bool
+    select I8257
     select ISA_BUS
 
 config PIIX4
@@ -67,6 +68,7 @@ config LPC_ICH9
     bool
     # For historical reasons, SuperIO devices are created in the board
     # for ICH9.
+    select I8257
     select ISA_BUS
     select ACPI_SMBUS
     select ACPI_X86_ICH
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 4553b5925b..8694e58b21 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -34,6 +34,7 @@
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "qemu/range.h"
+#include "hw/dma/i8257.h"
 #include "hw/isa/isa.h"
 #include "migration/vmstate.h"
 #include "hw/irq.h"
@@ -722,6 +723,8 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
     qdev_init_gpio_out_named(dev, lpc->gsi, ICH9_GPIO_GSI, GSI_NUM_PINS);
 
     isa_bus_irqs(isa_bus, lpc->gsi);
+
+    i8257_dma_init(isa_bus, 0);
 }
 
 static bool ich9_rst_cnt_needed(void *opaque)
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 48f9ab1096..44a9998752 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu/range.h"
 #include "qapi/error.h"
+#include "hw/dma/i8257.h"
 #include "hw/southbridge/piix.h"
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
@@ -295,9 +296,11 @@ static const MemoryRegionOps rcr_ops = {
 static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 {
     PIIX3State *d = PIIX3_PCI_DEVICE(dev);
+    ISABus *isa_bus;
 
-    if (!isa_bus_new(DEVICE(d), get_system_memory(),
-                     pci_address_space_io(dev), errp)) {
+    isa_bus = isa_bus_new(DEVICE(d), get_system_memory(),
+                          pci_address_space_io(dev), errp);
+    if (!isa_bus) {
         return;
     }
 
@@ -307,6 +310,8 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
                                         PIIX_RCR_IOPORT, &d->rcr_mem, 1);
 
     qemu_register_reset(piix3_reset, d);
+
+    i8257_dma_init(isa_bus, 0);
 }
 
 static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
-- 
2.37.3


