Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1173BE0D6
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 04:23:18 +0200 (CEST)
Received: from localhost ([::1]:36054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0xDZ-0008Hk-8R
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 22:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0x97-00008Z-4N
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 22:18:41 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:44976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0x8k-0001Nc-RN
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 22:18:40 -0400
Received: by mail-qk1-x732.google.com with SMTP id a4so459195qkn.11
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 19:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=izhKYkwaGkhXWGFhfe7UMPIkReXVVCU6/NP34e1opLo=;
 b=H5u9oAPxadhWSSt/BEfnjuFFpz9wVGqp+XhBsslt0QDZnbT0DgY9Qxaxh+3cRcx12C
 oFT0zbZxPmBcdeyni3rakaErXk4me7dMA15uOw5kOolytUW87sGfDtAap9kKpVeC4ncb
 +7r+mkx8GeIzqozJ7B262SE8nATeuHhyhUyZrk38piwhy/ck5pbIULS5V3koiymuUBpb
 6s1ONgjveGKlnMp6oQWQxqeutQAVzwJUeg/OAtzWknGTg+ey1Mjz/RejaygtiV18VZ9j
 /XEZVVbsNsydi9O4MEH/Ues+iELbY3a/KBLfNLinx4USeefSIEx1YxKE7/bzIMK9CSiR
 Bryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=izhKYkwaGkhXWGFhfe7UMPIkReXVVCU6/NP34e1opLo=;
 b=Kg+2dg0AIKsQyePIey+NQ5HQ275AFZ+Gm3fcfXx/icPN4GWZjjziJV7PWIT6HSmi2p
 ePAVbC0udqSZwKhxMeAExhjQA3vgNXRq4re+O/CMlj0gMtLa8Owz2P40offFvIZTz4pU
 7m3OIU4bLoRySaEGfvjjS5ztF+wC7+hVC+muYUPYfz9UMG0uFsr1XukOcHlZL5O9kf7u
 RAni5aRMUb+nppLK/SkYJyPsaiz2ismtTOAj9J67np5iHI/ZYr5AUW0dGRG77/IqSfiA
 0IdIIxgGwbGUTiDIBVpYo60wskucuP/HYb7KhIsRxet7nfRJRxIeef67hyRwk48icLQy
 MvBQ==
X-Gm-Message-State: AOAM533iixXxnKteCoHHzzuUaedF9u5TnoLLSsVTztIQrhQUCg/r5IPf
 9+E8SALSQEPWq8Q739qlFqmeqg==
X-Google-Smtp-Source: ABdhPJxNiCEaUbC3RtXm7JG+l+qs6ToCSXVXgaaMGRMd+ZSdonSYi8QjLwgPNN7NXHMcr21+9qViSQ==
X-Received: by 2002:ae9:e807:: with SMTP id a7mr9784586qkg.78.1625624297721;
 Tue, 06 Jul 2021 19:18:17 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id z6sm7768613qke.24.2021.07.06.19.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 19:18:17 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v6 01/10] hw/intc: GICv3 ITS initial framework
Date: Tue,  6 Jul 2021 22:18:06 -0400
Message-Id: <20210707021815.45938-2-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210707021815.45938-1-shashi.mallela@linaro.org>
References: <20210707021815.45938-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x732.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added register definitions relevant to ITS,implemented overall
ITS device framework with stubs for ITS control and translater
regions read/write,extended ITS common to handle mmio init between
existing kvm device and newer qemu device.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c                | 245 +++++++++++++++++++++++++
 hw/intc/arm_gicv3_its_common.c         |   7 +-
 hw/intc/arm_gicv3_its_kvm.c            |   2 +-
 hw/intc/gicv3_internal.h               |  97 +++++++++-
 hw/intc/meson.build                    |   1 +
 include/hw/intc/arm_gicv3_its_common.h |   9 +-
 6 files changed, 347 insertions(+), 14 deletions(-)
 create mode 100644 hw/intc/arm_gicv3_its.c

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
new file mode 100644
index 0000000000..2286b3f757
--- /dev/null
+++ b/hw/intc/arm_gicv3_its.c
@@ -0,0 +1,245 @@
+/*
+ * ITS emulation for a GICv3-based system
+ *
+ * Copyright Linaro.org 2021
+ *
+ * Authors:
+ *  Shashi Mallela <shashi.mallela@linaro.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at your
+ * option) any later version.  See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/qdev-properties.h"
+#include "hw/intc/arm_gicv3_its_common.h"
+#include "gicv3_internal.h"
+#include "qom/object.h"
+#include "qapi/error.h"
+
+typedef struct GICv3ITSClass GICv3ITSClass;
+/* This is reusing the GICv3ITSState typedef from ARM_GICV3_ITS_COMMON */
+DECLARE_OBJ_CHECKERS(GICv3ITSState, GICv3ITSClass,
+                     ARM_GICV3_ITS, TYPE_ARM_GICV3_ITS)
+
+struct GICv3ITSClass {
+    GICv3ITSCommonClass parent_class;
+    void (*parent_reset)(DeviceState *dev);
+};
+
+static MemTxResult gicv3_its_translation_write(void *opaque, hwaddr offset,
+                                               uint64_t data, unsigned size,
+                                               MemTxAttrs attrs)
+{
+    MemTxResult result = MEMTX_OK;
+
+    return result;
+}
+
+static MemTxResult its_writel(GICv3ITSState *s, hwaddr offset,
+                              uint64_t value, MemTxAttrs attrs)
+{
+    MemTxResult result = MEMTX_OK;
+
+    return result;
+}
+
+static MemTxResult its_readl(GICv3ITSState *s, hwaddr offset,
+                             uint64_t *data, MemTxAttrs attrs)
+{
+    MemTxResult result = MEMTX_OK;
+
+    return result;
+}
+
+static MemTxResult its_writell(GICv3ITSState *s, hwaddr offset,
+                               uint64_t value, MemTxAttrs attrs)
+{
+    MemTxResult result = MEMTX_OK;
+
+    return result;
+}
+
+static MemTxResult its_readll(GICv3ITSState *s, hwaddr offset,
+                              uint64_t *data, MemTxAttrs attrs)
+{
+    MemTxResult result = MEMTX_OK;
+
+    return result;
+}
+
+static MemTxResult gicv3_its_read(void *opaque, hwaddr offset, uint64_t *data,
+                                  unsigned size, MemTxAttrs attrs)
+{
+    GICv3ITSState *s = (GICv3ITSState *)opaque;
+    MemTxResult result;
+
+    switch (size) {
+    case 4:
+        result = its_readl(s, offset, data, attrs);
+        break;
+    case 8:
+        result = its_readll(s, offset, data, attrs);
+        break;
+    default:
+        result = MEMTX_ERROR;
+        break;
+    }
+
+    if (result == MEMTX_ERROR) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid guest read at offset " TARGET_FMT_plx
+                      "size %u\n", __func__, offset, size);
+        /*
+         * The spec requires that reserved registers are RAZ/WI;
+         * so use MEMTX_ERROR returns from leaf functions as a way to
+         * trigger the guest-error logging but don't return it to
+         * the caller, or we'll cause a spurious guest data abort.
+         */
+        result = MEMTX_OK;
+        *data = 0;
+    }
+    return result;
+}
+
+static MemTxResult gicv3_its_write(void *opaque, hwaddr offset, uint64_t data,
+                                   unsigned size, MemTxAttrs attrs)
+{
+    GICv3ITSState *s = (GICv3ITSState *)opaque;
+    MemTxResult result;
+
+    switch (size) {
+    case 4:
+        result = its_writel(s, offset, data, attrs);
+        break;
+    case 8:
+        result = its_writell(s, offset, data, attrs);
+        break;
+    default:
+        result = MEMTX_ERROR;
+        break;
+    }
+
+    if (result == MEMTX_ERROR) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid guest write at offset " TARGET_FMT_plx
+                      "size %u\n", __func__, offset, size);
+        /*
+         * The spec requires that reserved registers are RAZ/WI;
+         * so use MEMTX_ERROR returns from leaf functions as a way to
+         * trigger the guest-error logging but don't return it to
+         * the caller, or we'll cause a spurious guest data abort.
+         */
+        result = MEMTX_OK;
+    }
+    return result;
+}
+
+static const MemoryRegionOps gicv3_its_control_ops = {
+    .read_with_attrs = gicv3_its_read,
+    .write_with_attrs = gicv3_its_write,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 8,
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 8,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static const MemoryRegionOps gicv3_its_translation_ops = {
+    .write_with_attrs = gicv3_its_translation_write,
+    .valid.min_access_size = 2,
+    .valid.max_access_size = 4,
+    .impl.min_access_size = 2,
+    .impl.max_access_size = 4,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
+{
+    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
+    int i;
+
+    for (i = 0; i < s->gicv3->num_cpu; i++) {
+        if (!(s->gicv3->cpu[i].gicr_typer & GICR_TYPER_PLPIS)) {
+            error_setg(errp, "Physical LPI not supported by CPU %d", i);
+            return;
+        }
+    }
+
+    gicv3_its_init_mmio(s, &gicv3_its_control_ops, &gicv3_its_translation_ops);
+
+    /* set the ITS default features supported */
+    s->typer = FIELD_DP64(s->typer, GITS_TYPER, PHYSICAL,
+                          GITS_TYPE_PHYSICAL);
+    s->typer = FIELD_DP64(s->typer, GITS_TYPER, ITT_ENTRY_SIZE,
+                          ITS_ITT_ENTRY_SIZE - 1);
+    s->typer = FIELD_DP64(s->typer, GITS_TYPER, IDBITS, ITS_IDBITS);
+    s->typer = FIELD_DP64(s->typer, GITS_TYPER, DEVBITS, ITS_DEVBITS);
+    s->typer = FIELD_DP64(s->typer, GITS_TYPER, CIL, 1);
+    s->typer = FIELD_DP64(s->typer, GITS_TYPER, CIDBITS, ITS_CIDBITS);
+}
+
+static void gicv3_its_reset(DeviceState *dev)
+{
+    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
+    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
+
+    c->parent_reset(dev);
+
+    /* Quiescent bit reset to 1 */
+    s->ctlr = FIELD_DP32(s->ctlr, GITS_CTLR, QUIESCENT, 1);
+
+    /*
+     * setting GITS_BASER0.Type = 0b001 (Device)
+     *         GITS_BASER1.Type = 0b100 (Collection Table)
+     *         GITS_BASER<n>.Type,where n = 3 to 7 are 0b00 (Unimplemented)
+     *         GITS_BASER<0,1>.Page_Size = 64KB
+     * and default translation table entry size to 16 bytes
+     */
+    s->baser[0] = FIELD_DP64(s->baser[0], GITS_BASER, TYPE,
+                             GITS_BASER_TYPE_DEVICE);
+    s->baser[0] = FIELD_DP64(s->baser[0], GITS_BASER, PAGESIZE,
+                             GITS_BASER_PAGESIZE_64K);
+    s->baser[0] = FIELD_DP64(s->baser[0], GITS_BASER, ENTRYSIZE,
+                             GITS_DTE_SIZE - 1);
+
+    s->baser[1] = FIELD_DP64(s->baser[1], GITS_BASER, TYPE,
+                             GITS_BASER_TYPE_COLLECTION);
+    s->baser[1] = FIELD_DP64(s->baser[1], GITS_BASER, PAGESIZE,
+                             GITS_BASER_PAGESIZE_64K);
+    s->baser[1] = FIELD_DP64(s->baser[1], GITS_BASER, ENTRYSIZE,
+                             GITS_CTE_SIZE - 1);
+}
+
+static Property gicv3_its_props[] = {
+    DEFINE_PROP_LINK("parent-gicv3", GICv3ITSState, gicv3, "arm-gicv3",
+                     GICv3State *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void gicv3_its_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    GICv3ITSClass *ic = ARM_GICV3_ITS_CLASS(klass);
+
+    dc->realize = gicv3_arm_its_realize;
+    device_class_set_props(dc, gicv3_its_props);
+    device_class_set_parent_reset(dc, gicv3_its_reset, &ic->parent_reset);
+}
+
+static const TypeInfo gicv3_its_info = {
+    .name = TYPE_ARM_GICV3_ITS,
+    .parent = TYPE_ARM_GICV3_ITS_COMMON,
+    .instance_size = sizeof(GICv3ITSState),
+    .class_init = gicv3_its_class_init,
+    .class_size = sizeof(GICv3ITSClass),
+};
+
+static void gicv3_its_register_types(void)
+{
+    type_register_static(&gicv3_its_info);
+}
+
+type_init(gicv3_its_register_types)
diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
index 66c4c6a188..7d7f3882e7 100644
--- a/hw/intc/arm_gicv3_its_common.c
+++ b/hw/intc/arm_gicv3_its_common.c
@@ -50,6 +50,8 @@ static int gicv3_its_post_load(void *opaque, int version_id)
 
 static const VMStateDescription vmstate_its = {
     .name = "arm_gicv3_its",
+    .version_id = 1,
+    .minimum_version_id = 1,
     .pre_save = gicv3_its_pre_save,
     .post_load = gicv3_its_post_load,
     .priority = MIG_PRI_GICV3_ITS,
@@ -99,14 +101,15 @@ static const MemoryRegionOps gicv3_its_trans_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops)
+void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops,
+                         const MemoryRegionOps *tops)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(s);
 
     memory_region_init_io(&s->iomem_its_cntrl, OBJECT(s), ops, s,
                           "control", ITS_CONTROL_SIZE);
     memory_region_init_io(&s->iomem_its_translation, OBJECT(s),
-                          &gicv3_its_trans_ops, s,
+                          tops ? tops : &gicv3_its_trans_ops, s,
                           "translation", ITS_TRANS_SIZE);
 
     /* Our two regions are always adjacent, therefore we now combine them
diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index b554d2ede0..0b4cbed28b 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -106,7 +106,7 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
     kvm_arm_register_device(&s->iomem_its_cntrl, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
                             KVM_VGIC_ITS_ADDR_TYPE, s->dev_fd, 0);
 
-    gicv3_its_init_mmio(s, NULL);
+    gicv3_its_init_mmio(s, NULL, NULL);
 
     if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
         GITS_CTLR)) {
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 05303a55c8..6c0ff0061c 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -24,6 +24,7 @@
 #ifndef QEMU_ARM_GICV3_INTERNAL_H
 #define QEMU_ARM_GICV3_INTERNAL_H
 
+#include "hw/registerfields.h"
 #include "hw/intc/arm_gicv3_common.h"
 
 /* Distributor registers, as offsets from the distributor base address */
@@ -67,6 +68,9 @@
 #define GICD_CTLR_E1NWF             (1U << 7)
 #define GICD_CTLR_RWP               (1U << 31)
 
+/* 16 bits EventId */
+#define GICD_TYPER_IDBITS            0xf
+
 /*
  * Redistributor frame offsets from RD_base
  */
@@ -122,17 +126,17 @@
 #define GICR_WAKER_ProcessorSleep    (1U << 1)
 #define GICR_WAKER_ChildrenAsleep    (1U << 2)
 
-#define GICR_PROPBASER_OUTER_CACHEABILITY_MASK (7ULL << 56)
-#define GICR_PROPBASER_ADDR_MASK               (0xfffffffffULL << 12)
-#define GICR_PROPBASER_SHAREABILITY_MASK       (3U << 10)
-#define GICR_PROPBASER_CACHEABILITY_MASK       (7U << 7)
-#define GICR_PROPBASER_IDBITS_MASK             (0x1f)
+FIELD(GICR_PROPBASER, IDBITS, 0, 5)
+FIELD(GICR_PROPBASER, INNERCACHE, 7, 3)
+FIELD(GICR_PROPBASER, SHAREABILITY, 10, 2)
+FIELD(GICR_PROPBASER, PHYADDR, 12, 40)
+FIELD(GICR_PROPBASER, OUTERCACHE, 56, 3)
 
-#define GICR_PENDBASER_PTZ                     (1ULL << 62)
-#define GICR_PENDBASER_OUTER_CACHEABILITY_MASK (7ULL << 56)
-#define GICR_PENDBASER_ADDR_MASK               (0xffffffffULL << 16)
-#define GICR_PENDBASER_SHAREABILITY_MASK       (3U << 10)
-#define GICR_PENDBASER_CACHEABILITY_MASK       (7U << 7)
+FIELD(GICR_PENDBASER, INNERCACHE, 7, 3)
+FIELD(GICR_PENDBASER, SHAREABILITY, 10, 2)
+FIELD(GICR_PENDBASER, PHYADDR, 16, 36)
+FIELD(GICR_PENDBASER, OUTERCACHE, 56, 3)
+FIELD(GICR_PENDBASER, PTZ, 62, 1)
 
 #define ICC_CTLR_EL1_CBPR           (1U << 0)
 #define ICC_CTLR_EL1_EOIMODE        (1U << 1)
@@ -239,6 +243,79 @@
 #define ICH_VTR_EL2_PREBITS_SHIFT 26
 #define ICH_VTR_EL2_PRIBITS_SHIFT 29
 
+/* ITS Registers */
+
+FIELD(GITS_BASER, SIZE, 0, 8)
+FIELD(GITS_BASER, PAGESIZE, 8, 2)
+FIELD(GITS_BASER, SHAREABILITY, 10, 2)
+FIELD(GITS_BASER, PHYADDR, 12, 36)
+FIELD(GITS_BASER, PHYADDRL_64K, 16, 32)
+FIELD(GITS_BASER, PHYADDRH_64K, 12, 4)
+FIELD(GITS_BASER, ENTRYSIZE, 48, 5)
+FIELD(GITS_BASER, OUTERCACHE, 53, 3)
+FIELD(GITS_BASER, TYPE, 56, 3)
+FIELD(GITS_BASER, INNERCACHE, 59, 3)
+FIELD(GITS_BASER, INDIRECT, 62, 1)
+FIELD(GITS_BASER, VALID, 63, 1)
+
+FIELD(GITS_CTLR, QUIESCENT, 31, 1)
+
+FIELD(GITS_TYPER, PHYSICAL, 0, 1)
+FIELD(GITS_TYPER, ITT_ENTRY_SIZE, 4, 4)
+FIELD(GITS_TYPER, IDBITS, 8, 5)
+FIELD(GITS_TYPER, DEVBITS, 13, 5)
+FIELD(GITS_TYPER, SEIS, 18, 1)
+FIELD(GITS_TYPER, PTA, 19, 1)
+FIELD(GITS_TYPER, CIDBITS, 32, 4)
+FIELD(GITS_TYPER, CIL, 36, 1)
+
+#define GITS_BASER_PAGESIZE_4K                0
+#define GITS_BASER_PAGESIZE_16K               1
+#define GITS_BASER_PAGESIZE_64K               2
+
+#define GITS_BASER_TYPE_DEVICE               1ULL
+#define GITS_BASER_TYPE_COLLECTION           4ULL
+
+/**
+ * Default features advertised by this version of ITS
+ */
+/* Physical LPIs supported */
+#define GITS_TYPE_PHYSICAL           (1U << 0)
+
+/*
+ * 12 bytes Interrupt translation Table Entry size
+ * ITE Lower 8 Bytes
+ * Valid = 1 bit,InterruptType = 1 bit,
+ * Size of LPI number space[considering max 24 bits]
+ * (GICv3 = 1023, GICv4 = pINTID doorbell value),
+ * Size of LPI number space[considering max 24 bits],
+ * ITE Higher 4 Bytes
+ * ICID = 16 bits,
+ * vPEID = 16 bits
+ */
+#define ITS_ITT_ENTRY_SIZE            0xC
+
+/* 16 bits EventId */
+#define ITS_IDBITS                   GICD_TYPER_IDBITS
+
+/* 16 bits DeviceId */
+#define ITS_DEVBITS                   0xF
+
+/* 16 bits CollectionId */
+#define ITS_CIDBITS                  0xF
+
+/*
+ * 8 bytes Device Table Entry size
+ * Valid = 1 bit,ITTAddr = 44 bits,Size = 5 bits
+ */
+#define GITS_DTE_SIZE                 (0x8ULL)
+
+/*
+ * 8 bytes Collection Table Entry size
+ * Valid = 1 bit,RDBase = 36 bits(considering max RDBASE)
+ */
+#define GITS_CTE_SIZE                 (0x8ULL)
+
 /* Special interrupt IDs */
 #define INTID_SECURE 1020
 #define INTID_NONSECURE 1021
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 6e52a166e3..4dcfea6aa8 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -8,6 +8,7 @@ softmmu_ss.add(when: 'CONFIG_ARM_GIC', if_true: files(
   'arm_gicv3_dist.c',
   'arm_gicv3_its_common.c',
   'arm_gicv3_redist.c',
+  'arm_gicv3_its.c',
 ))
 softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_pic.c'))
 softmmu_ss.add(when: 'CONFIG_HEATHROW_PIC', if_true: files('heathrow_pic.c'))
diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
index 5a0952b404..65d1191db1 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -25,17 +25,22 @@
 #include "hw/intc/arm_gicv3_common.h"
 #include "qom/object.h"
 
+#define TYPE_ARM_GICV3_ITS "arm-gicv3-its"
+
 #define ITS_CONTROL_SIZE 0x10000
 #define ITS_TRANS_SIZE   0x10000
 #define ITS_SIZE         (ITS_CONTROL_SIZE + ITS_TRANS_SIZE)
 
 #define GITS_CTLR        0x0
 #define GITS_IIDR        0x4
+#define GITS_TYPER       0x8
 #define GITS_CBASER      0x80
 #define GITS_CWRITER     0x88
 #define GITS_CREADR      0x90
 #define GITS_BASER       0x100
 
+#define GITS_TRANSLATER  0x0040
+
 struct GICv3ITSState {
     SysBusDevice parent_obj;
 
@@ -52,6 +57,7 @@ struct GICv3ITSState {
     /* Registers */
     uint32_t ctlr;
     uint32_t iidr;
+    uint64_t typer;
     uint64_t cbaser;
     uint64_t cwriter;
     uint64_t creadr;
@@ -62,7 +68,8 @@ struct GICv3ITSState {
 
 typedef struct GICv3ITSState GICv3ITSState;
 
-void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops);
+void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops,
+                   const MemoryRegionOps *tops);
 
 #define TYPE_ARM_GICV3_ITS_COMMON "arm-gicv3-its-common"
 typedef struct GICv3ITSCommonClass GICv3ITSCommonClass;
-- 
2.27.0


