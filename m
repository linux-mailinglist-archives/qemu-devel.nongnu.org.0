Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D1D649CF9
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 11:52:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4gPN-0002E3-NU; Mon, 12 Dec 2022 05:51:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4gP2-0002C7-O4
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 05:51:20 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4gP0-00078G-SD
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 05:51:20 -0500
Received: by mail-wr1-x430.google.com with SMTP id u12so11610860wrr.11
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 02:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SLoakS5RpkyU28GECTDp5HsPbnwPjaUHfHRXq4VwyeM=;
 b=dyuG7G6Apj3sElVFZtFZBNKGmx4AjGiAhKVtiAD5lsKEUFpgL1oFhWl/Mwnx5JbLIu
 g7ZDqoA2SPPCXovGcOynkk5P6AysSsaiRYG90rd+RQ9JxjMpoSEEqu9J1zOUopbN1Q8n
 PVbZnIqoiQpLnBPR2EzME2UzZV06bqZj9t9Vm1zf2aMa+nNyFTNCs65lDtyd9Z+Qm3UE
 f6q7DFO3ln76JVJsy16dOTVdIh5Z45cVH3byNmT86LzFQacDsbNTPeUCc4+lEvmBW7zX
 T/ywGJOu2oebOc9wbrDIuL53CQtRoAzrQSN5jhIFIWr7MZemmtGk6UomjGrD027qToE6
 Mqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SLoakS5RpkyU28GECTDp5HsPbnwPjaUHfHRXq4VwyeM=;
 b=2W91/Qgh9zBjH0hmvoikzUpLLAwTIWuVcn8Y4KTrwZhmWMZiZGQu9ZHtMZUCKiV7G4
 KYe2O1IprqVhjzmkSJAVcC8xPWCW9o9D+5KzkiADfGEkLNHVkTkVmSBWswsC81uEk8vH
 y1dUWhWGRY16hVwC8nGYhxPrHx+iK60qbQJ4NpIQrFIWHgGTpmgK0Pa7nIhsSiWGDWlT
 vw4JtXaAMOLirTL5X9Em2Bhoy8df8MAE/7af6bpVOdTRnhP7xS47lf/vPDbFIWQ+mW7h
 w3AlvVIyKFMluzdZH8v5rcLBBe5CW9xmq83o4hhJb/uHPNebzJ+E4c/g0nkrCL525pq7
 llnQ==
X-Gm-Message-State: ANoB5plEDZ+oyxq0Hl1IyIx9Q69a4Oa6RnoP2VMaeyyGu/Zx+oEAvuZN
 ODkEHP0u4cQPJcQIqXSv4raQTFcxMxVWjJg3osU=
X-Google-Smtp-Source: AA0mqf4SpXPuNnmGmZJShk0gQExHKA2W01A665v5ZWqwKpp3bGIqs0xfHRnkptGgkrZWXDRFWPnakQ==
X-Received: by 2002:a05:6000:5c5:b0:242:63a3:2f20 with SMTP id
 bh5-20020a05600005c500b0024263a32f20mr13407311wrb.11.1670842277082; 
 Mon, 12 Dec 2022 02:51:17 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 a15-20020adfe5cf000000b002425787c5easm8417852wrn.96.2022.12.12.02.51.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Dec 2022 02:51:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0] hw/acpi: Rename tco.c -> ich9_tco.c
Date: Mon, 12 Dec 2022 11:51:15 +0100
Message-Id: <20221212105115.2113-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

tco.c contains the ICH9 implementation of its "total cost
of ownership". Rename it accordingly to emphasis this is
a part of the ICH9 model.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Based-on: <20221207231205.1106381-1-shentey@gmail.com>
          "Clean up dependencies of ACPI controllers"
---
 MAINTAINERS                           | 4 ++--
 hw/acpi/ich9.c                        | 2 +-
 hw/acpi/{tco.c => ich9_tco.c}         | 2 +-
 hw/acpi/meson.build                   | 2 +-
 include/hw/acpi/ich9.h                | 2 +-
 include/hw/acpi/{tco.h => ich9_tco.h} | 2 +-
 tests/qtest/tco-test.c                | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)
 rename hw/acpi/{tco.c => ich9_tco.c} (99%)
 rename include/hw/acpi/{tco.h => ich9_tco.h} (97%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6966490c94..35bde4a97e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1644,8 +1644,8 @@ F: hw/isa/piix3.c
 F: hw/isa/lpc_ich9.c
 F: hw/i2c/smbus_ich9.c
 F: hw/acpi/piix4.c
-F: hw/acpi/ich9.c
-F: include/hw/acpi/ich9.h
+F: hw/acpi/ich9*.c
+F: include/hw/acpi/ich9*.h
 F: include/hw/southbridge/piix.h
 F: hw/misc/sga.c
 F: hw/isa/apm.c
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index bd9bbade70..b10afa372a 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -34,7 +34,7 @@
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "hw/acpi/acpi.h"
-#include "hw/acpi/tco.h"
+#include "hw/acpi/ich9_tco.h"
 
 #include "hw/i386/ich9.h"
 #include "hw/mem/pc-dimm.h"
diff --git a/hw/acpi/tco.c b/hw/acpi/ich9_tco.c
similarity index 99%
rename from hw/acpi/tco.c
rename to hw/acpi/ich9_tco.c
index 4783721e4e..b68348707b 100644
--- a/hw/acpi/tco.c
+++ b/hw/acpi/ich9_tco.c
@@ -12,7 +12,7 @@
 #include "hw/i386/ich9.h"
 #include "migration/vmstate.h"
 
-#include "hw/acpi/tco.h"
+#include "hw/acpi/ich9_tco.h"
 #include "trace.h"
 
 enum {
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index cfae2f58f6..30054a8cdc 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -22,7 +22,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_PIIX4', if_true: files('piix4.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_true: files('pcihp.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_false: files('acpi-pci-hotplug-stub.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
-acpi_ss.add(when: 'CONFIG_ACPI_ICH9', if_true: files('ich9.c', 'tco.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_ICH9', if_true: files('ich9.c', 'ich9_tco.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_ERST', if_true: files('erst.c'))
 acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
 acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
index 7ca92843c6..d41866a229 100644
--- a/include/hw/acpi/ich9.h
+++ b/include/hw/acpi/ich9.h
@@ -27,7 +27,7 @@
 #include "hw/acpi/pcihp.h"
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/acpi_dev_interface.h"
-#include "hw/acpi/tco.h"
+#include "hw/acpi/ich9_tco.h"
 
 #define ACPI_PCIHP_ADDR_ICH9 0x0cc0
 
diff --git a/include/hw/acpi/tco.h b/include/hw/acpi/ich9_tco.h
similarity index 97%
rename from include/hw/acpi/tco.h
rename to include/hw/acpi/ich9_tco.h
index a1e0da8213..c4393caee0 100644
--- a/include/hw/acpi/tco.h
+++ b/include/hw/acpi/ich9_tco.h
@@ -1,5 +1,5 @@
 /*
- * QEMU ICH9 TCO emulation
+ * QEMU ICH9 TCO emulation (total cost of ownership)
  *
  * Copyright (c) 2015 Paulo Alcantara <pcacjr@zytor.com>
  *
diff --git a/tests/qtest/tco-test.c b/tests/qtest/tco-test.c
index 254f735370..d7b61ccfa5 100644
--- a/tests/qtest/tco-test.c
+++ b/tests/qtest/tco-test.c
@@ -16,7 +16,7 @@
 #include "hw/pci/pci_regs.h"
 #include "hw/i386/ich9.h"
 #include "hw/acpi/ich9.h"
-#include "hw/acpi/tco.h"
+#include "hw/acpi/ich9_tco.h"
 
 #define RCBA_BASE_ADDR    0xfed1c000
 #define PM_IO_BASE_ADDR   0xb000
-- 
2.38.1


