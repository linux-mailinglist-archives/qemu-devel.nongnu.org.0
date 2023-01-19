Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09C26738E8
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 13:45:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIUHt-0003jy-Mt; Thu, 19 Jan 2023 07:45:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pIUHr-0003jg-AD; Thu, 19 Jan 2023 07:44:59 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pIUHo-0000SO-4v; Thu, 19 Jan 2023 07:44:58 -0500
Received: by mail-pj1-x102c.google.com with SMTP id d8so2259588pjc.3;
 Thu, 19 Jan 2023 04:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=5ZcQ6o/VXuTfmDKLaIEBlP/Eg71D2Dq7sdEqRXtKuQM=;
 b=NCUtN/mDyonnXd0rRw0Qi/o1grjzegvxJT6EudQh4md1N2rha0Fi1rDGyW6BrJawvj
 QJBCiXdiheNKlDqZA0zMv+D/RvNqR38fFErTAlmwAVDo9C9/YC0e/DYyKkw89V+WQX7Z
 SbJNA6a3kiSUokUAy5EROPUR6zH01oBj+x1z01cv36USruRgGLufagt+KZAZVDaGv4g0
 0WWrC9PJKUNao2HZhfFRhzvkzR6piK8UyuzDYRbrbgEfJAsh8zwRaFd7o3jJlHCOpl2Z
 QOoYrfVEdKlo2fR3ETc/ZG9QKdNRj9yjx+6R/+cF4Y53F/KtDXeQo6Apa3kRC8PQZFWr
 +mwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ZcQ6o/VXuTfmDKLaIEBlP/Eg71D2Dq7sdEqRXtKuQM=;
 b=FQ1gdcBAQDlDekvnQlIDkdOkQP4cnkOZGbKp2wOfOlYo9Z1GXrI3uN5+Cq5/w3xEjT
 KjC6i2QYahxBRJzqk7KsHC1dSaVsxS5yRVncpvlitleoymaiwQROpz66EmPkR9uifrdk
 KndqU7keKow0qa7eXyD6i2yvL7p2lN1E05Ekp7amRl5ImScBdj2k1hcZVvKsAy6NU50G
 /gIrEBGuiItRyvRw/YlZKEuYCLFihyCUDNuX6WP5tuBXarnngdLTyJo5yjNZqAlbgE2F
 tql/AYzxwi8hHQH/TxXxnQRKQo1SHuTqTqoaoTSDQ64uizasxcx45hMFpfJZuBwTfNGL
 VVZA==
X-Gm-Message-State: AFqh2kokBPN1SWmrleCkT9bvIlfRAnpDEAe9g0staGAo3m6z4T1UuCOZ
 numPjpfAi8+jcQvJcduAYgY=
X-Google-Smtp-Source: AMrXdXucQkBIl27SHoxJ8/EgJ9ofQ79PJk39Hj5nKAr1rOJkm53fK92NdM1FkcdBXwlPM+Gm21UYkQ==
X-Received: by 2002:a05:6a20:ba4:b0:b6:478b:e98a with SMTP id
 i36-20020a056a200ba400b000b6478be98amr30831863pzh.47.1674132293221; 
 Thu, 19 Jan 2023 04:44:53 -0800 (PST)
Received: from voyager.lan ([45.124.203.15]) by smtp.gmail.com with ESMTPSA id
 x15-20020aa7956f000000b0058bacd6c4e8sm8559305pfq.207.2023.01.19.04.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 04:44:52 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH] hw/misc: Add basic Aspeed GFX model
Date: Thu, 19 Jan 2023 23:14:40 +1030
Message-Id: <20230119124440.50243-1-joel@jms.id.au>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Enough model to capture the pinmux writes to enable correct operation of
the parts of pinmux that depend on GFX registers.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/arm/aspeed_soc.h  |   3 +
 include/hw/misc/aspeed_gfx.h |  31 +++++++++
 hw/arm/aspeed_ast2600.c      |  11 ++++
 hw/arm/aspeed_soc.c          |  12 ++++
 hw/misc/aspeed_gfx.c         | 121 +++++++++++++++++++++++++++++++++++
 hw/misc/meson.build          |   1 +
 hw/misc/trace-events         |   4 ++
 7 files changed, 183 insertions(+)
 create mode 100644 include/hw/misc/aspeed_gfx.h
 create mode 100644 hw/misc/aspeed_gfx.c

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 8389200b2d01..7084e0efeb97 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -26,6 +26,7 @@
 #include "hw/ssi/aspeed_smc.h"
 #include "hw/misc/aspeed_hace.h"
 #include "hw/misc/aspeed_sbc.h"
+#include "hw/misc/aspeed_gfx.h"
 #include "hw/watchdog/wdt_aspeed.h"
 #include "hw/net/ftgmac100.h"
 #include "target/arm/cpu.h"
@@ -81,6 +82,7 @@ struct AspeedSoCState {
     AspeedSDHCIState emmc;
     AspeedLPCState lpc;
     AspeedPECIState peci;
+    AspeedGFXState gfx;
     SerialMM uart[ASPEED_UARTS_NUM];
     Clock *sysclk;
     UnimplementedDeviceState iomem;
@@ -171,6 +173,7 @@ enum {
     ASPEED_DEV_EMMC,
     ASPEED_DEV_KCS,
     ASPEED_DEV_HACE,
+    ASPEED_DEV_GFX,
     ASPEED_DEV_DPMCU,
     ASPEED_DEV_DP,
     ASPEED_DEV_I3C,
diff --git a/include/hw/misc/aspeed_gfx.h b/include/hw/misc/aspeed_gfx.h
new file mode 100644
index 000000000000..b0736a53f577
--- /dev/null
+++ b/include/hw/misc/aspeed_gfx.h
@@ -0,0 +1,31 @@
+/*
+ * ASPEED GFX Controller
+ *
+ * Copyright (C) 2023 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef ASPEED_GFX_H
+#define ASPEED_GFX_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_ASPEED_GFX "aspeed.gfx"
+#define ASPEED_GFX(obj) OBJECT_CHECK(AspeedGFXState, (obj), TYPE_ASPEED_GFX)
+
+#define ASPEED_GFX_NR_REGS (0xFC >> 2)
+
+typedef struct AspeedGFXState {
+    /* <private> */
+    SysBusDevice parent;
+
+    /*< public >*/
+    MemoryRegion iomem;
+    qemu_irq irq;
+
+    uint32_t regs[ASPEED_GFX_NR_REGS];
+} AspeedGFXState;
+
+#endif /* _ASPEED_GFX_H_ */
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index cd75465c2bdd..10e4a13655cc 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -43,6 +43,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
     [ASPEED_DEV_HACE]      = 0x1E6D0000,
     [ASPEED_DEV_SDMC]      = 0x1E6E0000,
     [ASPEED_DEV_SCU]       = 0x1E6E2000,
+    [ASPEED_DEV_GFX]       = 0x1E6E6000,
     [ASPEED_DEV_XDMA]      = 0x1E6E7000,
     [ASPEED_DEV_ADC]       = 0x1E6E9000,
     [ASPEED_DEV_DP]        = 0x1E6EB000,
@@ -255,6 +256,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
 
     object_initialize_child(obj, "sbc", &s->sbc, TYPE_ASPEED_SBC);
 
+    object_initialize_child(obj, "gfx", &s->gfx, TYPE_ASPEED_GFX);
+
     object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
     object_initialize_child(obj, "video", &s->video, TYPE_UNIMPLEMENTED_DEVICE);
     object_initialize_child(obj, "dpmcu", &s->dpmcu, TYPE_UNIMPLEMENTED_DEVICE);
@@ -607,6 +610,14 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         return;
     }
     aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sbc), 0, sc->memmap[ASPEED_DEV_SBC]);
+
+    /* GFX */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->gfx), errp)) {
+        return;
+    }
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gfx), 0, sc->memmap[ASPEED_DEV_GFX]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->gfx), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_GFX));
 }
 
 static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index b05b9dd41602..053149f9ccdf 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -33,6 +33,7 @@ static const hwaddr aspeed_soc_ast2400_memmap[] = {
     [ASPEED_DEV_SDMC]   = 0x1E6E0000,
     [ASPEED_DEV_SCU]    = 0x1E6E2000,
     [ASPEED_DEV_HACE]   = 0x1E6E3000,
+    [ASPEED_DEV_GFX]    = 0x1E6E6000,
     [ASPEED_DEV_XDMA]   = 0x1E6E7000,
     [ASPEED_DEV_VIDEO]  = 0x1E700000,
     [ASPEED_DEV_ADC]    = 0x1E6E9000,
@@ -69,6 +70,7 @@ static const hwaddr aspeed_soc_ast2500_memmap[] = {
     [ASPEED_DEV_SDMC]   = 0x1E6E0000,
     [ASPEED_DEV_SCU]    = 0x1E6E2000,
     [ASPEED_DEV_HACE]   = 0x1E6E3000,
+    [ASPEED_DEV_GFX]    = 0x1E6E6000,
     [ASPEED_DEV_XDMA]   = 0x1E6E7000,
     [ASPEED_DEV_ADC]    = 0x1E6E9000,
     [ASPEED_DEV_VIDEO]  = 0x1E700000,
@@ -233,6 +235,8 @@ static void aspeed_soc_init(Object *obj)
     snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
     object_initialize_child(obj, "hace", &s->hace, typename);
 
+    object_initialize_child(obj, "gfx", &s->gfx, TYPE_ASPEED_GFX);
+
     object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
     object_initialize_child(obj, "video", &s->video, TYPE_UNIMPLEMENTED_DEVICE);
 }
@@ -482,6 +486,14 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
                     sc->memmap[ASPEED_DEV_HACE]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
+
+    /* GFX */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->gfx), errp)) {
+        return;
+    }
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gfx), 0, sc->memmap[ASPEED_DEV_GFX]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->gfx), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_GFX));
 }
 static Property aspeed_soc_properties[] = {
     DEFINE_PROP_LINK("memory", AspeedSoCState, memory, TYPE_MEMORY_REGION,
diff --git a/hw/misc/aspeed_gfx.c b/hw/misc/aspeed_gfx.c
new file mode 100644
index 000000000000..42d2167b4a59
--- /dev/null
+++ b/hw/misc/aspeed_gfx.c
@@ -0,0 +1,121 @@
+/*
+ * ASPEED GFX Controller
+ *
+ * Copyright (C) 2023 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/error-report.h"
+#include "hw/misc/aspeed_gfx.h"
+#include "qapi/error.h"
+#include "migration/vmstate.h"
+
+#include "trace.h"
+
+static uint64_t aspeed_gfx_read(void *opaque, hwaddr addr,
+                                     unsigned int size)
+{
+    AspeedGFXState *s = ASPEED_GFX(opaque);
+    uint64_t val = 0;
+
+    addr >>= 2;
+
+    if (addr >= ASPEED_GFX_NR_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, addr << 2);
+    } else {
+        val = s->regs[addr];
+    }
+
+    trace_aspeed_gfx_read(addr << 2, val);
+
+    return val;
+}
+
+static void aspeed_gfx_write(void *opaque, hwaddr addr, uint64_t data,
+                              unsigned int size)
+{
+    AspeedGFXState *s = ASPEED_GFX(opaque);
+
+    trace_aspeed_gfx_write(addr, data);
+
+    addr >>= 2;
+
+    if (addr >= ASPEED_GFX_NR_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, addr << 2);
+        return;
+    }
+
+    s->regs[addr] = data;
+}
+
+static const MemoryRegionOps aspeed_gfx_ops = {
+    .read = aspeed_gfx_read,
+    .write = aspeed_gfx_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 4,
+    },
+};
+
+static void aspeed_gfx_reset(DeviceState *dev)
+{
+    struct AspeedGFXState *s = ASPEED_GFX(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+}
+
+static void aspeed_gfx_realize(DeviceState *dev, Error **errp)
+{
+    AspeedGFXState *s = ASPEED_GFX(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    sysbus_init_irq(sbd, &s->irq);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_gfx_ops, s,
+            TYPE_ASPEED_GFX, 0x1000);
+
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static const VMStateDescription vmstate_aspeed_gfx = {
+    .name = TYPE_ASPEED_GFX,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, AspeedGFXState, ASPEED_GFX_NR_REGS),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void aspeed_gfx_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = aspeed_gfx_realize;
+    dc->reset = aspeed_gfx_reset;
+    dc->desc = "Aspeed GFX Controller";
+    dc->vmsd = &vmstate_aspeed_gfx;
+}
+
+static const TypeInfo aspeed_gfx_info = {
+    .name = TYPE_ASPEED_GFX,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AspeedGFXState),
+    .class_init = aspeed_gfx_class_init,
+};
+
+static void aspeed_gfx_register_types(void)
+{
+    type_register_static(&aspeed_gfx_info);
+}
+
+type_init(aspeed_gfx_register_types);
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 448e14b531a3..2a1f6b756fce 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -115,6 +115,7 @@ softmmu_ss.add(when: 'CONFIG_PVPANIC_ISA', if_true: files('pvpanic-isa.c'))
 softmmu_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true: files('pvpanic-pci.c'))
 softmmu_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
+  'aspeed_gfx.c',
   'aspeed_hace.c',
   'aspeed_i3c.c',
   'aspeed_lpc.c',
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index c47876a90262..07fccdbcc5f2 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -211,6 +211,10 @@ aspeed_i3c_write(uint64_t offset, uint64_t data) "I3C write: offset 0x%" PRIx64
 aspeed_i3c_device_read(uint32_t deviceid, uint64_t offset, uint64_t data) "I3C Dev[%u] read: offset 0x%" PRIx64 " data 0x%" PRIx64
 aspeed_i3c_device_write(uint32_t deviceid, uint64_t offset, uint64_t data) "I3C Dev[%u] write: offset 0x%" PRIx64 " data 0x%" PRIx64
 
+# aspeed_gfx.c
+aspeed_gfx_read(uint64_t offset, uint64_t data) "read: offset 0x%" PRIx64 " data 0x%" PRIx64
+aspeed_gfx_write(uint64_t offset, uint64_t data) "write: offset 0x%" PRIx64 " data 0x%" PRIx64
+
 # aspeed_sdmc.c
 aspeed_sdmc_write(uint64_t reg, uint64_t data) "reg @0x%" PRIx64 " data: 0x%" PRIx64
 aspeed_sdmc_read(uint64_t reg, uint64_t data) "reg @0x%" PRIx64 " data: 0x%" PRIx64
-- 
2.39.0


