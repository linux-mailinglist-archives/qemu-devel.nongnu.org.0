Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6290636BA32
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 21:43:44 +0200 (CEST)
Received: from localhost ([::1]:36090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb78x-0000yv-Fl
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 15:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb71U-0000XU-7P
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 15:36:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb71S-0000IX-2V
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 15:35:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619465757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/NBJrN/GlacMceBg1qLAcbh146RyM7XsMz2+vmFelAU=;
 b=Hn6lw3yZ2VDipnzJqkHtVM6elxp+bggt0J2m4Uc7dJkTzxEDCk8wvJFAhz0YrDFZVzDFLV
 MDAKq81B3sc7Nat0sTZMhQ0f8Krc7YrZb+/4f6hCZJA0EndvWKSA+nMh+N6a2LUNAzU6ep
 fX7ZTcwGzGSvPccPVk6JIwXxGny9XNY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-FnBlvnKhMIihqkStJSnj6Q-1; Mon, 26 Apr 2021 15:35:53 -0400
X-MC-Unique: FnBlvnKhMIihqkStJSnj6Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 60-20020adf85420000b0290109440de5e9so3793920wrh.10
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 12:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/NBJrN/GlacMceBg1qLAcbh146RyM7XsMz2+vmFelAU=;
 b=I2xQUifiNaMf4PhlQIFRslyPlwY6+njNZQbUU/ugsyl9ePVVXcBAoe37y+DaMJ1NyV
 ywLBmNSuV0QAhgGQwG7Qvos/bSv6ki28P73xNKj/A7it+3sQSSCGS19emOIX7CFqSn6+
 bg43ug0FVhccKRj9kqD4KntC8/JsePuhwQTIb9C5LIgQhDO5Q8aRqph59iO9J4h/Zrjw
 wa9rX6RekGgx7USzEsqcTfN2vkc+F9vCYp3UY2A+h1MGzZsv24PdgdpYkN48RqOSk4o4
 hujl9DrcIk5uMqgkXto4yuYrZktzW4KGxHETJ4YtpOyyGwL7UQ5pO7rcBlyuqDBE4nDU
 thLA==
X-Gm-Message-State: AOAM531CDX5nWoLRdr/cVt5L0swG004qgzWjJUce/JuR+OuGAa/khNfj
 JW9aaU72kJ2qV4d7diRjS79zj/W0aOCbme+ILbUc6Xlk+dHLeI1QjxjSpmNtupPblRkHGUa19F6
 Y7QrtzecnIfBTYu/G3LmNGBztNltXRUUh/i+3ICZC2ITEvXX7OvvRDtlmz79gymzF
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr5882933wrn.180.1619465751977; 
 Mon, 26 Apr 2021 12:35:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyumkVOaHD3aoGHNGy6imfLuSzZSB+RGcJEgtKiYDmsVoADFCUmJ8o9mNaeKN1+mXVVQ6HPvw==
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr5882895wrn.180.1619465751734; 
 Mon, 26 Apr 2021 12:35:51 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id z66sm464116wmc.4.2021.04.26.12.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 12:35:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] hw/{arm,hppa,riscv}: Add fw_cfg arch-specific stub
Date: Mon, 26 Apr 2021 21:35:19 +0200
Message-Id: <20210426193520.4115528-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210426193520.4115528-1-philmd@redhat.com>
References: <20210426193520.4115528-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Helge Deller <deller@gmx.de>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ARM, HPPA and RISC-V architectures don't declare any fw_cfg
specific key. To simplify the buildsys machinery and allow building
QEMU without the fw_cfg device (in the next commit), first add a
per-architecture empty stub defining the fw_cfg_arch_key_name().

Update the MAINTAINERS section to cover the various target-specific
fw_cfg.c files.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/fw_cfg.c      | 19 +++++++++++++++++++
 hw/hppa/fw_cfg.c     | 19 +++++++++++++++++++
 hw/riscv/fw_cfg.c    | 19 +++++++++++++++++++
 MAINTAINERS          |  2 +-
 hw/arm/meson.build   |  1 +
 hw/hppa/meson.build  |  1 +
 hw/riscv/meson.build |  1 +
 7 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/fw_cfg.c
 create mode 100644 hw/hppa/fw_cfg.c
 create mode 100644 hw/riscv/fw_cfg.c

diff --git a/hw/arm/fw_cfg.c b/hw/arm/fw_cfg.c
new file mode 100644
index 00000000000..de2bca9c76c
--- /dev/null
+++ b/hw/arm/fw_cfg.c
@@ -0,0 +1,19 @@
+/*
+ * QEMU fw_cfg helpers (ARM specific)
+ *
+ * Copyright (c) 2021 Red Hat, Inc.
+ *
+ * Author:
+ *   Philippe Mathieu-Daudé <philmd@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/mips/fw_cfg.h"
+#include "hw/nvram/fw_cfg.h"
+
+const char *fw_cfg_arch_key_name(uint16_t key)
+{
+    return NULL;
+}
diff --git a/hw/hppa/fw_cfg.c b/hw/hppa/fw_cfg.c
new file mode 100644
index 00000000000..322b03068c7
--- /dev/null
+++ b/hw/hppa/fw_cfg.c
@@ -0,0 +1,19 @@
+/*
+ * QEMU fw_cfg helpers (HPPA specific)
+ *
+ * Copyright (c) 2021 Red Hat, Inc.
+ *
+ * Author:
+ *   Philippe Mathieu-Daudé <philmd@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/mips/fw_cfg.h"
+#include "hw/nvram/fw_cfg.h"
+
+const char *fw_cfg_arch_key_name(uint16_t key)
+{
+    return NULL;
+}
diff --git a/hw/riscv/fw_cfg.c b/hw/riscv/fw_cfg.c
new file mode 100644
index 00000000000..8e3d2a8bdea
--- /dev/null
+++ b/hw/riscv/fw_cfg.c
@@ -0,0 +1,19 @@
+/*
+ * QEMU fw_cfg helpers (RISC-V specific)
+ *
+ * Copyright (c) 2021 Red Hat, Inc.
+ *
+ * Author:
+ *   Philippe Mathieu-Daudé <philmd@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/mips/fw_cfg.h"
+#include "hw/nvram/fw_cfg.h"
+
+const char *fw_cfg_arch_key_name(uint16_t key)
+{
+    return NULL;
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 36055f14c59..ab8f030d4c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2162,7 +2162,7 @@ R: Laszlo Ersek <lersek@redhat.com>
 R: Gerd Hoffmann <kraxel@redhat.com>
 S: Supported
 F: docs/specs/fw_cfg.txt
-F: hw/nvram/fw_cfg*.c
+F: hw/*/fw_cfg*.c
 F: stubs/fw_cfg.c
 F: include/hw/nvram/fw_cfg.h
 F: include/standard-headers/linux/qemu_fw_cfg.h
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index be39117b9b6..fd278de916f 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -1,6 +1,7 @@
 arm_ss = ss.source_set()
 arm_ss.add(files('boot.c'), fdt)
 arm_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('sysbus-fdt.c'))
+arm_ss.add(when: 'CONFIG_FW_CFG', if_true: files('fw_cfg.c'))
 arm_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
 arm_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
 arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
diff --git a/hw/hppa/meson.build b/hw/hppa/meson.build
index 1deae83aee8..10494cc24b7 100644
--- a/hw/hppa/meson.build
+++ b/hw/hppa/meson.build
@@ -1,4 +1,5 @@
 hppa_ss = ss.source_set()
 hppa_ss.add(when: 'CONFIG_DINO', if_true: files('pci.c', 'machine.c', 'dino.c', 'lasi.c'))
+hppa_ss.add(when: 'CONFIG_FW_CFG', if_true: files('fw_cfg.c'))
 
 hw_arch += {'hppa': hppa_ss}
diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index 275c0f7eb7c..ab4d3adb924 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -8,5 +8,6 @@
 riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c'))
 riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c'))
 riscv_ss.add(when: 'CONFIG_MICROCHIP_PFSOC', if_true: files('microchip_pfsoc.c'))
+riscv_ss.add(when: 'CONFIG_FW_CFG', if_true: files('fw_cfg.c'))
 
 hw_arch += {'riscv': riscv_ss}
-- 
2.26.3


