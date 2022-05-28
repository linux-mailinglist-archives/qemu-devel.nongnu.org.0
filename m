Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCFC536BF0
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 11:31:31 +0200 (CEST)
Received: from localhost ([::1]:36452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nusnC-0006Ts-Pb
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 05:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nuscG-000608-GB
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:20:20 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nuscE-0003zQ-OA
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:20:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ncunciepriq6siCtPoRfCVwzn4DOxQrjhW0Lp+N64CI=; b=xYSnMGJJzeBAh2EKITJr7b8TS/
 CgNwGFEoAeWmSQXtRJhKnW9p5lASs52M7xSU4+7PAmMzOctNe6LIRh30jWJCat5kIBCt7H8zffand
 bgPjJFkPAz0qRoonuYhuG56ViCXa7JMA57QTovtzP/oTBbUXZ5YimdRPcYRnHzagU23gtpUdFu3OC
 QxW8Hy6Fcj/SKMfdlFR3xRdVmo5gXEmmiWQEWt1wf1b7YrCzWL3NGcsAUxcVnmS+s+rL/a1ENgZQ3
 SKCQN0nalbYtGk8LLdQeMvU8sCFR+CbJuJVJBN1Y2k5o0DIsmBLWdTH8V5BL12tlOYwWZEhRBsllX
 7foZz0f1a8AVru9LihCBtcYX0azqc9ClDS0FAq6sf/c2Hr/yRcGIezsLkcfu1NfQvSmzHBvttZZGB
 P2kEeOjKhuxqI/HeaLXAOsApKyAYDnGWQ5met+Yb0q/uUjzK31j4b5nqnRVwGzKqJNDy+bDYkTgpw
 fwDptnsl7X8IWT6GLpjo4dvQvugm3Oi/3k2D5FO1fP4iQskZcp8l6F/QU8UObcmPgEdupfxyBl8Gu
 ok7Eiv2u78qwR1qa99G82RzLyfqQHj7TSagclZQ/uWRRKM+POLMNI0gOd/rL3VYgf2iD0YQjyTQzW
 lz4oyS8Ayi34mq50T9oC4R0C7U6WdRsQYnuwypoQU=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nusaz-0003JL-JG; Sat, 28 May 2022 10:18:57 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: shentey@gmail.com, mst@redhat.com, marcel.apfelbaum@gmail.com,
 imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, hpoussin@reactos.org, qemu-devel@nongnu.org
Date: Sat, 28 May 2022 10:19:26 +0100
Message-Id: <20220528091934.15520-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
References: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 04/12] hw/acpi/piix4: move PIIX4PMState into separate piix4.h
 header
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This allows the QOM types in hw/acpi/piix4.c to be used elsewhere by simply including
hw/acpi/piix4.h.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/acpi/piix4.c               | 43 +-------------------
 hw/i386/acpi-build.c          |  1 +
 include/hw/acpi/piix4.h       | 75 +++++++++++++++++++++++++++++++++++
 include/hw/southbridge/piix.h |  2 -
 4 files changed, 78 insertions(+), 43 deletions(-)
 create mode 100644 include/hw/acpi/piix4.h

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 2735ff375e..7ee65b1bff 100644
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
index f63f83e5c6..c5b842b45d 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -15,8 +15,6 @@
 #include "hw/pci/pci.h"
 #include "qom/object.h"
 
-#define TYPE_PIIX4_PM "PIIX4_PM"
-
 I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
                       qemu_irq sci_irq, qemu_irq smi_irq,
                       int smm_enabled, DeviceState **piix4_pm);
-- 
2.20.1


