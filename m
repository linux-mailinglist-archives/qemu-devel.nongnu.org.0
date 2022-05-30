Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179BD537A35
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 13:54:38 +0200 (CEST)
Received: from localhost ([::1]:35978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvdym-0007w6-PW
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 07:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvdZD-0000Lm-3C
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:28:11 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:43616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvdZ9-0001M9-9L
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:28:10 -0400
Received: by mail-pf1-x42f.google.com with SMTP id y189so10318669pfy.10
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 04:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Brn3LJTyKBvbiwsipzY18kk75AySoM4ugZRgTNJLjIo=;
 b=pV/oXIBXxPoHovhL4/zfdDP/zJWl7bSw26MMjFCavv/8Ka9mmNAzEbFRIuxaOaiWmx
 bBu9nXt2ms4R7LeMCUB8e/RG968e5wf0AVcqHkIz8X38g5apghwFo31LABz9HlwgwLtI
 68DOKSFynCdj5rJJj7uBaNabLsE1NxKxdZBbKPy2+cYHIIVbTzeI1Nu8wWMXjMuNIZFn
 KpdoVWVtWQv7PV3e6xkf9jWCboC6AaH6Oqa/e7R5Fl+MEATKGIPHMWqn71sd7ScNT0kk
 WetbegYE/462V06gDD29XSWPDZCX4Ek5H0tmWEkuSgPN3QDyxZRJZb16B92FlOckCNum
 Kgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Brn3LJTyKBvbiwsipzY18kk75AySoM4ugZRgTNJLjIo=;
 b=6vb0XbCVLIu0WHqiAhnjNzai88M9y3+UIonBEyzatzl5QE/qkX/FLWc5gBIHde4+Ms
 uPT8uXib2EjilKoo03IaCdqINdSqMrpv15eCXOT8KdmOoU5v0ik3P0qczaG1+Jqn+2lw
 qlaTDqpfcF7/Ev7Mdk4H8HoY3YdekpMv30Bm2c57b1SXEB+Z2SbUccgri50LAu1Q330I
 jlpCXgpifIkAXN6OQfmkIrPfXdnLUnAAmb0bJYLz86a2tU3Dmmx63ykiF3bO4HquAib5
 XxV1fndTKviGJgeK+UVIUOco5t3mFEEWzLXsbytEXgYFZH4m2LnbQYsRqr4pHgDW1/Cz
 yr0Q==
X-Gm-Message-State: AOAM533n2UUhSELCmH7SCrLWVSHS7YhQ7MaClS3HcRRNWhCW7hDfGbNN
 JikQO2+9Wgd+0/PwL67yBLE=
X-Google-Smtp-Source: ABdhPJwS/HRYryH7QiJlEBXQaFupn9xlCEcckktHttwFE6drqTHPJmGYZsucCmW3LAc3XW6g2ZyS8w==
X-Received: by 2002:a65:4c0c:0:b0:3c1:5bb1:6701 with SMTP id
 u12-20020a654c0c000000b003c15bb16701mr48306913pgq.136.1653910086061; 
 Mon, 30 May 2022 04:28:06 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 kx10-20020a17090b228a00b001cd4989fed4sm6699626pjb.32.2022.05.30.04.28.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 04:28:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 04/11] hw/acpi/piix4: move PIIX4PMState into separate
 piix4.h header
Date: Mon, 30 May 2022 13:27:11 +0200
Message-Id: <20220530112718.26582-5-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
References: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42f.google.com
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

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

This allows the QOM types in hw/acpi/piix4.c to be used elsewhere by simply including
hw/acpi/piix4.h.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220528091934.15520-5-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/acpi/piix4.c               | 43 +-------------------
 hw/i386/acpi-build.c          |  1 +
 include/hw/acpi/piix4.h       | 75 +++++++++++++++++++++++++++++++++++
 include/hw/southbridge/piix.h |  2 -
 4 files changed, 78 insertions(+), 43 deletions(-)
 create mode 100644 include/hw/acpi/piix4.h

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 316e41e1d0..c2177c5093 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -28,6 +28,8 @@
 #include "hw/pci/pci.h"
 #include "hw/qdev-properties.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/pcihp.h"
+#include "hw/acpi/piix4.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/xen.h"
@@ -56,47 +58,6 @@ struct pci_status {
     uint32_t down;
 };
 
-struct PIIX4PMState {
-    /*< private >*/
-    PCIDevice parent_obj;
-    /*< public >*/
-
-    MemoryRegion io;
-    uint32_t io_base;
-
-    MemoryRegion io_gpe;
-    ACPIREGS ar;
-
-    APMState apm;
-
-    PMSMBus smb;
-    uint32_t smb_io_base;
-
-    qemu_irq irq;
-    qemu_irq smi_irq;
-    bool smm_enabled;
-    bool smm_compat;
-    Notifier machine_ready;
-    Notifier powerdown_notifier;
-
-    AcpiPciHpState acpi_pci_hotplug;
-    bool use_acpi_hotplug_bridge;
-    bool use_acpi_root_pci_hotplug;
-    bool not_migrate_acpi_index;
-
-    uint8_t disable_s3;
-    uint8_t disable_s4;
-    uint8_t s4_val;
-
-    bool cpu_hotplug_legacy;
-    AcpiCpuHotplug gpe_cpu;
-    CPUHotplugState cpuhp_state;
-
-    MemHotplugState acpi_memory_hotplug;
-};
-
-OBJECT_DECLARE_SIMPLE_TYPE(PIIX4PMState, PIIX4_PM)
-
 static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
                                            PCIBus *bus, PIIX4PMState *s);
 
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index c125939ed6..89ac326d7f 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -46,6 +46,7 @@
 #include "hw/acpi/tpm.h"
 #include "hw/acpi/vmgenid.h"
 #include "hw/acpi/erst.h"
+#include "hw/acpi/piix4.h"
 #include "sysemu/tpm_backend.h"
 #include "hw/rtc/mc146818rtc_regs.h"
 #include "migration/vmstate.h"
diff --git a/include/hw/acpi/piix4.h b/include/hw/acpi/piix4.h
new file mode 100644
index 0000000000..32686a75c5
--- /dev/null
+++ b/include/hw/acpi/piix4.h
@@ -0,0 +1,75 @@
+/*
+ * ACPI implementation
+ *
+ * Copyright (c) 2006 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License version 2.1 as published by the Free Software Foundation.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>
+ *
+ * Contributions after 2012-01-13 are licensed under the terms of the
+ * GNU GPL, version 2 or (at your option) any later version.
+ */
+
+#ifndef HW_ACPI_PIIX4_H
+#define HW_ACPI_PIIX4_H
+
+#include "hw/pci/pci.h"
+#include "hw/acpi/acpi.h"
+#include "hw/acpi/cpu_hotplug.h"
+#include "hw/acpi/memory_hotplug.h"
+#include "hw/acpi/pcihp.h"
+#include "hw/i2c/pm_smbus.h"
+#include "hw/isa/apm.h"
+
+#define TYPE_PIIX4_PM "PIIX4_PM"
+OBJECT_DECLARE_SIMPLE_TYPE(PIIX4PMState, PIIX4_PM)
+
+struct PIIX4PMState {
+    /*< private >*/
+    PCIDevice parent_obj;
+    /*< public >*/
+
+    MemoryRegion io;
+    uint32_t io_base;
+
+    MemoryRegion io_gpe;
+    ACPIREGS ar;
+
+    APMState apm;
+
+    PMSMBus smb;
+    uint32_t smb_io_base;
+
+    qemu_irq irq;
+    qemu_irq smi_irq;
+    bool smm_enabled;
+    bool smm_compat;
+    Notifier machine_ready;
+    Notifier powerdown_notifier;
+
+    AcpiPciHpState acpi_pci_hotplug;
+    bool use_acpi_hotplug_bridge;
+    bool use_acpi_root_pci_hotplug;
+    bool not_migrate_acpi_index;
+
+    uint8_t disable_s3;
+    uint8_t disable_s4;
+    uint8_t s4_val;
+
+    bool cpu_hotplug_legacy;
+    AcpiCpuHotplug gpe_cpu;
+    CPUHotplugState cpuhp_state;
+
+    MemHotplugState acpi_memory_hotplug;
+};
+
+#endif
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index ff8d96ae8c..04cbc3fe30 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -15,8 +15,6 @@
 #include "hw/pci/pci.h"
 #include "qom/object.h"
 
-#define TYPE_PIIX4_PM "PIIX4_PM"
-
 I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
                       qemu_irq sci_irq, qemu_irq smi_irq,
                       bool smm_enabled, DeviceState **piix4_pm);
-- 
2.36.1


