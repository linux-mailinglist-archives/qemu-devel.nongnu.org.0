Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E18699AFD
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:15:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnO-0008Pv-BU; Thu, 16 Feb 2023 12:11:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnL-0008GO-Fs
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:43 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnJ-0007tg-44
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:43 -0500
Received: by mail-wr1-x434.google.com with SMTP id h16so2503429wrz.12
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WJGiFDdYVNEAwNHmoXQCKuWGS/DxAbFTps8rYNvQTJ0=;
 b=konmaSU/eFtQbEdxjxRjndHqrEewv59ZMNeu8lRYJVFCkpuJC+QGZSqU3hXJCw9374
 AJpFN+4XR/MnjXlnDSpk1g48Mcv3hAYyPAcrIbF/Y1d7gnRPg0tmUYk1RYghxeBqPDCw
 b1nTlqWDDsZzdBnhuhYWHEP/hvUKh6IadbIqTiEn7vMUKJ0bfspPpXa8RzTaBN4T9WlK
 lX5JWmwfxc60pT2Wz0U9pSHG3fAAlizUDhQshLvd40+g82kkFFIuxfjXQLx+pSi/N3R2
 7El6ZEBZSNTL/6V1NTaZfdGG8KacFOvVi3agP+LEzQtO3mJDElSASzINwE/8PqAIQE/e
 RU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WJGiFDdYVNEAwNHmoXQCKuWGS/DxAbFTps8rYNvQTJ0=;
 b=mKEMGtu5FvGVjmdGgsZHMEj3WLXZ2S3Vx166Oe/ihk7D7q64ItGTq/1uHmfnkiW4iz
 I5ohWrj+m1fHfS8F16gUJjESckLzeOutZFr931uiZ2SJBuxYW97ppASm0IYqr4JLuRFa
 6WBNkhpSJDBR19w+2IOm7n6gEFiVS3EFKNnTvPcVo7/9DJtwsBbcUJvUWOYd3cHtdn4Y
 jBAk1mMBOn5CFQUk0IMpYmT62vuGOSEE2hjTIBDaeB2jNGbRjusOi2IiCGk7dG/Tswpl
 Iz0VUACzyAB2vnhLn/9qWisYT8Kqj2NUI3GwkUHuCO9IxxHMteVa6gBd0c1K2ZOi7kMF
 HCGA==
X-Gm-Message-State: AO0yUKXO842rv6AWgYbt+dayWgntK556V5VT3PPNV0QSYt05H+uNa0WO
 ImbtJPzs3stoSr6hArEXz12eLPzfTkYrtPNO
X-Google-Smtp-Source: AK7set9uDRQzYk831P6RkpGc0o8xsK20gAc8xLY4H+CcZueho+oOZ1WylSrO6Nx20dURIpyCUeb2uw==
X-Received: by 2002:a5d:564a:0:b0:2c5:9ab9:60f6 with SMTP id
 j10-20020a5d564a000000b002c59ab960f6mr1515706wrw.62.1676567499672; 
 Thu, 16 Feb 2023 09:11:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/30] hw/ssi: Add Nuvoton PSPI Module
Date: Thu, 16 Feb 2023 17:11:10 +0000
Message-Id: <20230216171123.2518285-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

From: Hao Wu <wuhaotsh@google.com>

Nuvoton's PSPI is a general purpose SPI module which enables
connections to SPI-based peripheral devices.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Chris Rauer <crauer@google.com>
Reviewed-by: Philippe Mathieu-Daude <philmd@linaro.org>
Message-id: 20230208235433.3989937-3-wuhaotsh@google.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS                |   6 +-
 include/hw/ssi/npcm_pspi.h |  53 +++++++++
 hw/ssi/npcm_pspi.c         | 221 +++++++++++++++++++++++++++++++++++++
 hw/ssi/meson.build         |   2 +-
 hw/ssi/trace-events        |   5 +
 5 files changed, 283 insertions(+), 4 deletions(-)
 create mode 100644 include/hw/ssi/npcm_pspi.h
 create mode 100644 hw/ssi/npcm_pspi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 94659e42c2c..21595f0aadd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -811,9 +811,9 @@ M: Tyrone Ting <kfting@nuvoton.com>
 M: Hao Wu <wuhaotsh@google.com>
 L: qemu-arm@nongnu.org
 S: Supported
-F: hw/*/npcm7xx*
-F: include/hw/*/npcm7xx*
-F: tests/qtest/npcm7xx*
+F: hw/*/npcm*
+F: include/hw/*/npcm*
+F: tests/qtest/npcm*
 F: pc-bios/npcm7xx_bootrom.bin
 F: roms/vbootrom
 F: docs/system/arm/nuvoton.rst
diff --git a/include/hw/ssi/npcm_pspi.h b/include/hw/ssi/npcm_pspi.h
new file mode 100644
index 00000000000..37cc784d962
--- /dev/null
+++ b/include/hw/ssi/npcm_pspi.h
@@ -0,0 +1,53 @@
+/*
+ * Nuvoton Peripheral SPI Module
+ *
+ * Copyright 2023 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+#ifndef NPCM_PSPI_H
+#define NPCM_PSPI_H
+
+#include "hw/ssi/ssi.h"
+#include "hw/sysbus.h"
+
+/*
+ * Number of registers in our device state structure. Don't change this without
+ * incrementing the version_id in the vmstate.
+ */
+#define NPCM_PSPI_NR_REGS 3
+
+/**
+ * NPCMPSPIState - Device state for one Flash Interface Unit.
+ * @parent: System bus device.
+ * @mmio: Memory region for register access.
+ * @spi: The SPI bus mastered by this controller.
+ * @regs: Register contents.
+ * @irq: The interrupt request queue for this module.
+ *
+ * Each PSPI has a shared bank of registers, and controls up to four chip
+ * selects. Each chip select has a dedicated memory region which may be used to
+ * read and write the flash connected to that chip select as if it were memory.
+ */
+typedef struct NPCMPSPIState {
+    SysBusDevice parent;
+
+    MemoryRegion mmio;
+
+    SSIBus *spi;
+    uint16_t regs[NPCM_PSPI_NR_REGS];
+    qemu_irq irq;
+} NPCMPSPIState;
+
+#define TYPE_NPCM_PSPI "npcm-pspi"
+OBJECT_DECLARE_SIMPLE_TYPE(NPCMPSPIState, NPCM_PSPI)
+
+#endif /* NPCM_PSPI_H */
diff --git a/hw/ssi/npcm_pspi.c b/hw/ssi/npcm_pspi.c
new file mode 100644
index 00000000000..3fb935043ab
--- /dev/null
+++ b/hw/ssi/npcm_pspi.c
@@ -0,0 +1,221 @@
+/*
+ * Nuvoton NPCM Peripheral SPI Module (PSPI)
+ *
+ * Copyright 2023 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/irq.h"
+#include "hw/registerfields.h"
+#include "hw/ssi/npcm_pspi.h"
+#include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/units.h"
+
+#include "trace.h"
+
+REG16(PSPI_DATA, 0x0)
+REG16(PSPI_CTL1, 0x2)
+    FIELD(PSPI_CTL1, SPIEN, 0,  1)
+    FIELD(PSPI_CTL1, MOD,   2,  1)
+    FIELD(PSPI_CTL1, EIR,   5,  1)
+    FIELD(PSPI_CTL1, EIW,   6,  1)
+    FIELD(PSPI_CTL1, SCM,   7,  1)
+    FIELD(PSPI_CTL1, SCIDL, 8,  1)
+    FIELD(PSPI_CTL1, SCDV,  9,  7)
+REG16(PSPI_STAT, 0x4)
+    FIELD(PSPI_STAT, BSY,  0,  1)
+    FIELD(PSPI_STAT, RBF,  1,  1)
+
+static void npcm_pspi_update_irq(NPCMPSPIState *s)
+{
+    int level = 0;
+
+    /* Only fire IRQ when the module is enabled. */
+    if (FIELD_EX16(s->regs[R_PSPI_CTL1], PSPI_CTL1, SPIEN)) {
+        /* Update interrupt as BSY is cleared. */
+        if ((!FIELD_EX16(s->regs[R_PSPI_STAT], PSPI_STAT, BSY)) &&
+            FIELD_EX16(s->regs[R_PSPI_CTL1], PSPI_CTL1, EIW)) {
+            level = 1;
+        }
+
+        /* Update interrupt as RBF is set. */
+        if (FIELD_EX16(s->regs[R_PSPI_STAT], PSPI_STAT, RBF) &&
+            FIELD_EX16(s->regs[R_PSPI_CTL1], PSPI_CTL1, EIR)) {
+            level = 1;
+        }
+    }
+    qemu_set_irq(s->irq, level);
+}
+
+static uint16_t npcm_pspi_read_data(NPCMPSPIState *s)
+{
+    uint16_t value = s->regs[R_PSPI_DATA];
+
+    /* Clear stat bits as the value are read out. */
+    s->regs[R_PSPI_STAT] = 0;
+
+    return value;
+}
+
+static void npcm_pspi_write_data(NPCMPSPIState *s, uint16_t data)
+{
+    uint16_t value = 0;
+
+    if (FIELD_EX16(s->regs[R_PSPI_CTL1], PSPI_CTL1, MOD)) {
+        value = ssi_transfer(s->spi, extract16(data, 8, 8)) << 8;
+    }
+    value |= ssi_transfer(s->spi, extract16(data, 0, 8));
+    s->regs[R_PSPI_DATA] = value;
+
+    /* Mark data as available */
+    s->regs[R_PSPI_STAT] = R_PSPI_STAT_BSY_MASK | R_PSPI_STAT_RBF_MASK;
+}
+
+/* Control register read handler. */
+static uint64_t npcm_pspi_ctrl_read(void *opaque, hwaddr addr,
+                                    unsigned int size)
+{
+    NPCMPSPIState *s = opaque;
+    uint16_t value;
+
+    switch (addr) {
+    case A_PSPI_DATA:
+        value = npcm_pspi_read_data(s);
+        break;
+
+    case A_PSPI_CTL1:
+        value = s->regs[R_PSPI_CTL1];
+        break;
+
+    case A_PSPI_STAT:
+        value = s->regs[R_PSPI_STAT];
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: write to invalid offset 0x%" PRIx64 "\n",
+                      DEVICE(s)->canonical_path, addr);
+        return 0;
+    }
+    trace_npcm_pspi_ctrl_read(DEVICE(s)->canonical_path, addr, value);
+    npcm_pspi_update_irq(s);
+
+    return value;
+}
+
+/* Control register write handler. */
+static void npcm_pspi_ctrl_write(void *opaque, hwaddr addr, uint64_t v,
+                                 unsigned int size)
+{
+    NPCMPSPIState *s = opaque;
+    uint16_t value = v;
+
+    trace_npcm_pspi_ctrl_write(DEVICE(s)->canonical_path, addr, value);
+
+    switch (addr) {
+    case A_PSPI_DATA:
+        npcm_pspi_write_data(s, value);
+        break;
+
+    case A_PSPI_CTL1:
+        s->regs[R_PSPI_CTL1] = value;
+        break;
+
+    case A_PSPI_STAT:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: write to read-only register PSPI_STAT: 0x%08"
+                      PRIx64 "\n", DEVICE(s)->canonical_path, v);
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: write to invalid offset 0x%" PRIx64 "\n",
+                      DEVICE(s)->canonical_path, addr);
+        return;
+    }
+    npcm_pspi_update_irq(s);
+}
+
+static const MemoryRegionOps npcm_pspi_ctrl_ops = {
+    .read = npcm_pspi_ctrl_read,
+    .write = npcm_pspi_ctrl_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 2,
+        .unaligned = false,
+    },
+    .impl = {
+        .min_access_size = 2,
+        .max_access_size = 2,
+        .unaligned = false,
+    },
+};
+
+static void npcm_pspi_enter_reset(Object *obj, ResetType type)
+{
+    NPCMPSPIState *s = NPCM_PSPI(obj);
+
+    trace_npcm_pspi_enter_reset(DEVICE(obj)->canonical_path, type);
+    memset(s->regs, 0, sizeof(s->regs));
+}
+
+static void npcm_pspi_realize(DeviceState *dev, Error **errp)
+{
+    NPCMPSPIState *s = NPCM_PSPI(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    Object *obj = OBJECT(dev);
+
+    s->spi = ssi_create_bus(dev, "pspi");
+    memory_region_init_io(&s->mmio, obj, &npcm_pspi_ctrl_ops, s,
+                          "mmio", 4 * KiB);
+    sysbus_init_mmio(sbd, &s->mmio);
+    sysbus_init_irq(sbd, &s->irq);
+}
+
+static const VMStateDescription vmstate_npcm_pspi = {
+    .name = "npcm-pspi",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT16_ARRAY(regs, NPCMPSPIState, NPCM_PSPI_NR_REGS),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+
+static void npcm_pspi_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "NPCM Peripheral SPI Module";
+    dc->realize = npcm_pspi_realize;
+    dc->vmsd = &vmstate_npcm_pspi;
+    rc->phases.enter = npcm_pspi_enter_reset;
+}
+
+static const TypeInfo npcm_pspi_types[] = {
+    {
+        .name = TYPE_NPCM_PSPI,
+        .parent = TYPE_SYS_BUS_DEVICE,
+        .instance_size = sizeof(NPCMPSPIState),
+        .class_init = npcm_pspi_class_init,
+    },
+};
+DEFINE_TYPES(npcm_pspi_types);
diff --git a/hw/ssi/meson.build b/hw/ssi/meson.build
index 702aa5e4dfe..904a47161a4 100644
--- a/hw/ssi/meson.build
+++ b/hw/ssi/meson.build
@@ -1,6 +1,6 @@
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_smc.c'))
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('mss-spi.c'))
-softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_fiu.c'))
+softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_fiu.c', 'npcm_pspi.c'))
 softmmu_ss.add(when: 'CONFIG_PL022', if_true: files('pl022.c'))
 softmmu_ss.add(when: 'CONFIG_SIFIVE_SPI', if_true: files('sifive_spi.c'))
 softmmu_ss.add(when: 'CONFIG_SSI', if_true: files('ssi.c'))
diff --git a/hw/ssi/trace-events b/hw/ssi/trace-events
index c707d4aabaf..2d5bd2b83d0 100644
--- a/hw/ssi/trace-events
+++ b/hw/ssi/trace-events
@@ -21,6 +21,11 @@ npcm7xx_fiu_ctrl_write(const char *id, uint64_t addr, uint32_t data) "%s offset:
 npcm7xx_fiu_flash_read(const char *id, int cs, uint64_t addr, unsigned int size, uint64_t value) "%s[%d] offset: 0x%08" PRIx64 " size: %u value: 0x%" PRIx64
 npcm7xx_fiu_flash_write(const char *id, unsigned cs, uint64_t addr, unsigned int size, uint64_t value) "%s[%d] offset: 0x%08" PRIx64 " size: %u value: 0x%" PRIx64
 
+# npcm_pspi.c
+npcm_pspi_enter_reset(const char *id, int reset_type) "%s reset type: %d"
+npcm_pspi_ctrl_read(const char *id, uint64_t addr, uint16_t data) "%s offset: 0x%03" PRIx64 " value: 0x%04" PRIx16
+npcm_pspi_ctrl_write(const char *id, uint64_t addr, uint16_t data) "%s offset: 0x%03" PRIx64 " value: 0x%04" PRIx16
+
 # ibex_spi_host.c
 
 ibex_spi_host_reset(const char *msg) "%s"
-- 
2.34.1


