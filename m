Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D56D1694E1C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:33:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcfj-00088X-Pe; Mon, 13 Feb 2023 12:31:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRcfe-000865-Rp
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:31:18 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRcfc-0005Qk-LK
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:31:18 -0500
Received: by mail-ej1-x62e.google.com with SMTP id n10so6786834ejc.4
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 09:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TU1PpxK9OSQXC2RqSlQQjQ/LkwGSLSRxhnmXFwkVco8=;
 b=dYhITBocUZCJEtN5btT02wrN/IhE5b6/2cjkRrevuzZL3Khqenw/4drMJll3oWejLN
 ZV69K78MQfKK1DhMt+rHwEHzOqem6QubKAVhM6sxXSEAIAhnrdkRDSUPY/P3JrPAnePB
 aGwxAgwrNpOtKgf9P2YulkjqnZWg1R1u4M3YeweyZQck81cJeHDmfyTYtBLLDrZjqVBp
 k1FxmLIJZv9He7FXOIitn3rURLXdnhtseT2eFdhH/V19tcnnLoqSpFhcfczVYK4r6Btx
 VKTyguC0Ru4mpLsMyL1g5c6pPtEzTa0kWiNI/Dohj341U4KR7i06BH5uuFf29ekIuGHk
 oTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TU1PpxK9OSQXC2RqSlQQjQ/LkwGSLSRxhnmXFwkVco8=;
 b=AsCJRCpstQtzmr0nWOf32Jgts3qACZHTCjnTsauBb7v+Y8s46c2r1dbX8CCb+OAswz
 dvHel/5gcYi/wnV+Q+WyMNqCMhx+Wuj79xuxmdhrEf+onCnXWVzAHOWAh6GyXD9YNh2n
 KLT1YhvAEbzfYmad9Tq3OsoQNZ+Fuz5OKRz0LObyAzgwoDSk1lPXHyvWmVU7xRDDcW5z
 xteHM2rAa78R5BtHp5ovXdZOzpf1E0twBfPgXd04knFGYva49WqHVORIViBht6bsvLXF
 qgVk+SZabMEdmfTX8ESLgIjKHqr6+llifPdjGz5CrTjdlcgLQQsXWhzdHHLXN5MFKglL
 rRjw==
X-Gm-Message-State: AO0yUKX4zxwJiosV6CtU50WQVkyFFlclD8tjGjiNR70ZJAHP8BcfkOLe
 Zeb46P+pqSYbu2yK1dEreeGzl5uttv0=
X-Google-Smtp-Source: AK7set9gzOOKCZAZFTGYLU4Dp9AzC/2LY2NM+cxuL8F2wX+31ZHGDCyQEFQphsYvz+j4lJmFqQ7W5Q==
X-Received: by 2002:a17:906:3ecf:b0:879:9c05:f5e8 with SMTP id
 d15-20020a1709063ecf00b008799c05f5e8mr24195951ejj.62.1676309474576; 
 Mon, 13 Feb 2023 09:31:14 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-133-198.78.55.pool.telefonica.de. [78.55.133.198])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170906684b00b008aea5e0938esm6988699ejs.183.2023.02.13.09.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 09:31:14 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 12/12] hw: Move ich9.h to southbridge/
Date: Mon, 13 Feb 2023 18:30:33 +0100
Message-Id: <20230213173033.98762-13-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213173033.98762-1-shentey@gmail.com>
References: <20230213173033.98762-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
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

ICH9 is a south bridge which doesn't necessarily depend on x86, so move
it into the southbridge folder, analoguous to PIIX.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 MAINTAINERS                             | 1 +
 include/hw/{i386 => southbridge}/ich9.h | 6 +++---
 hw/acpi/ich9.c                          | 2 +-
 hw/acpi/ich9_tco.c                      | 2 +-
 hw/i2c/smbus_ich9.c                     | 2 +-
 hw/i386/acpi-build.c                    | 2 +-
 hw/i386/pc_q35.c                        | 2 +-
 hw/isa/lpc_ich9.c                       | 2 +-
 hw/pci-bridge/i82801b11.c               | 2 +-
 tests/qtest/tco-test.c                  | 2 +-
 10 files changed, 12 insertions(+), 11 deletions(-)
 rename include/hw/{i386 => southbridge}/ich9.h (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20460ce254..eb9ee6178a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1675,6 +1675,7 @@ F: hw/i2c/smbus_ich9.c
 F: hw/acpi/piix4.c
 F: hw/acpi/ich9*.c
 F: include/hw/acpi/ich9*.h
+F: include/hw/southbridge/ich9.h
 F: include/hw/southbridge/piix.h
 F: hw/misc/sga.c
 F: hw/isa/apm.c
diff --git a/include/hw/i386/ich9.h b/include/hw/southbridge/ich9.h
similarity index 99%
rename from include/hw/i386/ich9.h
rename to include/hw/southbridge/ich9.h
index 3125863049..7004eecbf9 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/southbridge/ich9.h
@@ -1,5 +1,5 @@
-#ifndef HW_ICH9_H
-#define HW_ICH9_H
+#ifndef HW_SOUTHBRIDGE_ICH9_H
+#define HW_SOUTHBRIDGE_ICH9_H
 
 #include "hw/isa/apm.h"
 #include "hw/acpi/ich9.h"
@@ -242,4 +242,4 @@ struct ICH9LPCState {
 #define ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT          1
 #define ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT       2
 
-#endif /* HW_ICH9_H */
+#endif /* HW_SOUTHBRIDGE_ICH9_H */
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 54bb3d83b3..d23bfcaa6b 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -36,7 +36,7 @@
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/ich9_tco.h"
 
-#include "hw/i386/ich9.h"
+#include "hw/southbridge/ich9.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
 
diff --git a/hw/acpi/ich9_tco.c b/hw/acpi/ich9_tco.c
index fbf97f81f4..1540f4fd46 100644
--- a/hw/acpi/ich9_tco.c
+++ b/hw/acpi/ich9_tco.c
@@ -9,7 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "sysemu/watchdog.h"
-#include "hw/i386/ich9.h"
+#include "hw/southbridge/ich9.h"
 #include "migration/vmstate.h"
 
 #include "hw/acpi/ich9_tco.h"
diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
index f0dd3cb147..18d40e93c1 100644
--- a/hw/i2c/smbus_ich9.c
+++ b/hw/i2c/smbus_ich9.c
@@ -27,7 +27,7 @@
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 
-#include "hw/i386/ich9.h"
+#include "hw/southbridge/ich9.h"
 #include "qom/object.h"
 #include "hw/acpi/acpi_aml_interface.h"
 
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 1bb73c3e9a..d27921fd8f 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -55,10 +55,10 @@
 #include "hw/hyperv/vmbus-bridge.h"
 
 /* Supported chipsets: */
+#include "hw/southbridge/ich9.h"
 #include "hw/southbridge/piix.h"
 #include "hw/acpi/pcihp.h"
 #include "hw/i386/fw_cfg.h"
-#include "hw/i386/ich9.h"
 #include "hw/i386/pc.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/pci-host/i440fx.h"
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index da2fa11b6f..93b34027a3 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -40,7 +40,6 @@
 #include "hw/qdev-properties.h"
 #include "hw/i386/x86.h"
 #include "hw/i386/pc.h"
-#include "hw/i386/ich9.h"
 #include "hw/i386/amd_iommu.h"
 #include "hw/i386/intel_iommu.h"
 #include "hw/display/ramfb.h"
@@ -48,6 +47,7 @@
 #include "hw/ide/pci.h"
 #include "hw/ide/ahci.h"
 #include "hw/intc/ioapic.h"
+#include "hw/southbridge/ich9.h"
 #include "hw/usb.h"
 #include "hw/usb/hcd-uhci.h"
 #include "qapi/error.h"
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index ce946760bb..96fd500502 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -40,7 +40,7 @@
 #include "hw/irq.h"
 #include "hw/isa/apm.h"
 #include "hw/pci/pci.h"
-#include "hw/i386/ich9.h"
+#include "hw/southbridge/ich9.h"
 #include "hw/i386/pc.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/ich9.h"
diff --git a/hw/pci-bridge/i82801b11.c b/hw/pci-bridge/i82801b11.c
index f3b4a14611..0e83cd11b2 100644
--- a/hw/pci-bridge/i82801b11.c
+++ b/hw/pci-bridge/i82801b11.c
@@ -45,7 +45,7 @@
 #include "hw/pci/pci_bridge.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
-#include "hw/i386/ich9.h"
+#include "hw/southbridge/ich9.h"
 
 /*****************************************************************************/
 /* ICH9 DMI-to-PCI bridge */
diff --git a/tests/qtest/tco-test.c b/tests/qtest/tco-test.c
index d865e95dfc..0547d41173 100644
--- a/tests/qtest/tco-test.c
+++ b/tests/qtest/tco-test.c
@@ -14,7 +14,7 @@
 #include "libqos/pci-pc.h"
 #include "qapi/qmp/qdict.h"
 #include "hw/pci/pci_regs.h"
-#include "hw/i386/ich9.h"
+#include "hw/southbridge/ich9.h"
 #include "hw/acpi/ich9.h"
 #include "hw/acpi/ich9_tco.h"
 
-- 
2.39.1


