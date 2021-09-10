Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4E7406DB3
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 16:42:43 +0200 (CEST)
Received: from localhost ([::1]:59922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOhjm-0004rx-Dy
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 10:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mOhh8-00023c-0b
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:39:58 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:41475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mOhh4-0002rM-VO
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:39:57 -0400
Received: by mail-qt1-x833.google.com with SMTP id u21so1587732qtw.8
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 07:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ySaRPKCabwGZ0xzWheArrkEmcH15rMQ/W2tjVfoSaf8=;
 b=sDo/0d5zEC7nulCXf/KWqERYUSpKzgKRXX93WIPzYsdEl5nSuKe1ZLZocl+mQbQpeN
 xZhqoZMohZTuuY7snkl+cuPBXaOhJngA2nZBfAGq7nQu6Ci3tR6XkcDUJ+QAGr/cffuc
 WXVM6CgZzmjZqLfIB+UfoE2DWZy/ENZVFPoe/pkRR23P3ulN8BpV/VCcNUFXL+cETvae
 xJc7GrnvzKq9bhaU2KciR9Gy8FTIOS/wO5vbBuvk/t9ppolI6k3bmGqAPWO9z8oPrX+6
 FxN9lkmqKepk3Et5P/Ciu4yvnmhYhEu14qvFF+WxYoxMnKLkdvLF+hmYKu3eHE7UuaQO
 TFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ySaRPKCabwGZ0xzWheArrkEmcH15rMQ/W2tjVfoSaf8=;
 b=f/78t4hotU9GWtb4SDsMvEjo5TVwrmQVPtgPx5g7LhbJBfjjS7mKtvUKDsaOynMxO6
 JNNmZbc8d1uwOXF6Uovd4bZmbC24nk+zgGM0Ah/GgZSiw48vvX9aB14tNxy9EvGSd+AG
 nsny3lovghnjpwcRuFAUYq0pqACP/jJRwZSYNjSmCRqNpXfUeDsdY1W/apkn5IdnX9U3
 uHTNZxavlWXMPmDNalYZgtW5ISdT8Y0Qh+pFMmcM2GaJltIQYr7PPpv06y/pZgZSxklR
 rDbLEKVAFc4tG3R2r+9xhdPFEw5D5pkO58ooEGnLrNeAyoq7XZrZc3Q1IMI2wlgrScG3
 JEDg==
X-Gm-Message-State: AOAM532qX1HPCNFAjfY7od4u0QSNr4NZd/jfasUziwzUyhRTE1fJ8t/3
 o6MepC/0oCklcYn1ikaxa9ULFw==
X-Google-Smtp-Source: ABdhPJwCICq9kSrb+YcEHdY9FatP3irykk9kqdB9AeBxMGSbXx7suHHHTyISGd8E47i2Troenl4RuQ==
X-Received: by 2002:a05:622a:10c:: with SMTP id
 u12mr8292522qtw.303.1631284793918; 
 Fri, 10 Sep 2021 07:39:53 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id a9sm3827042qkk.82.2021.09.10.07.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 07:39:53 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v9 1/9] hw/intc: GICv3 ITS initial framework
Date: Fri, 10 Sep 2021 10:39:43 -0400
Message-Id: <20210910143951.92242-2-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210910143951.92242-1-shashi.mallela@linaro.org>
References: <20210910143951.92242-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x833.google.com
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 narmstrong@baylibre.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added register definitions relevant to ITS,implemented overall
ITS device framework with stubs for ITS control and translater
regions read/write,extended ITS common to handle mmio init between
existing kvm device and newer qemu device.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Neil Armstrong <narmstrong@baylibre.com>
---
 hw/intc/arm_gicv3_its.c                | 241 +++++++++++++++++++++++++
 hw/intc/arm_gicv3_its_common.c         |   7 +-
 hw/intc/arm_gicv3_its_kvm.c            |   2 +-
 hw/intc/gicv3_internal.h               |  96 +++++++++-
 hw/intc/meson.build                    |   1 +
 include/hw/intc/arm_gicv3_its_common.h |   9 +-
 6 files changed, 342 insertions(+), 14 deletions(-)
 create mode 100644 hw/intc/arm_gicv3_its.c

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
new file mode 100644
index 0000000000..83ece7c4c1
--- /dev/null
+++ b/hw/intc/arm_gicv3_its.c
@@ -0,0 +1,241 @@
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
+    return MEMTX_OK;
+}
+
+static bool its_writel(GICv3ITSState *s, hwaddr offset,
+                              uint64_t value, MemTxAttrs attrs)
+{
+    bool result = true;
+
+    return result;
+}
+
+static bool its_readl(GICv3ITSState *s, hwaddr offset,
+                             uint64_t *data, MemTxAttrs attrs)
+{
+    bool result = true;
+
+    return result;
+}
+
+static bool its_writell(GICv3ITSState *s, hwaddr offset,
+                               uint64_t value, MemTxAttrs attrs)
+{
+    bool result = true;
+
+    return result;
+}
+
+static bool its_readll(GICv3ITSState *s, hwaddr offset,
+                              uint64_t *data, MemTxAttrs attrs)
+{
+    bool result = true;
+
+    return result;
+}
+
+static MemTxResult gicv3_its_read(void *opaque, hwaddr offset, uint64_t *data,
+                                  unsigned size, MemTxAttrs attrs)
+{
+    GICv3ITSState *s = (GICv3ITSState *)opaque;
+    bool result;
+
+    switch (size) {
+    case 4:
+        result = its_readl(s, offset, data, attrs);
+        break;
+    case 8:
+        result = its_readll(s, offset, data, attrs);
+        break;
+    default:
+        result = false;
+        break;
+    }
+
+    if (!result) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid guest read at offset " TARGET_FMT_plx
+                      "size %u\n", __func__, offset, size);
+        /*
+         * The spec requires that reserved registers are RAZ/WI;
+         * so use false returns from leaf functions as a way to
+         * trigger the guest-error logging but don't return it to
+         * the caller, or we'll cause a spurious guest data abort.
+         */
+        *data = 0;
+    }
+    return MEMTX_OK;
+}
+
+static MemTxResult gicv3_its_write(void *opaque, hwaddr offset, uint64_t data,
+                                   unsigned size, MemTxAttrs attrs)
+{
+    GICv3ITSState *s = (GICv3ITSState *)opaque;
+    bool result;
+
+    switch (size) {
+    case 4:
+        result = its_writel(s, offset, data, attrs);
+        break;
+    case 8:
+        result = its_writell(s, offset, data, attrs);
+        break;
+    default:
+        result = false;
+        break;
+    }
+
+    if (!result) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid guest write at offset " TARGET_FMT_plx
+                      "size %u\n", __func__, offset, size);
+        /*
+         * The spec requires that reserved registers are RAZ/WI;
+         * so use false returns from leaf functions as a way to
+         * trigger the guest-error logging but don't return it to
+         * the caller, or we'll cause a spurious guest data abort.
+         */
+    }
+    return MEMTX_OK;
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
index 05303a55c8..b99bf9db46 100644
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
@@ -239,6 +243,78 @@
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
+ * as per Table 5.3 in GICv3 spec
+ * ITE Lower 8 Bytes
+ *   Bits:    | 49 ... 26 | 25 ... 2 |   1     |   0    |
+ *   Values:  |    1023   |  IntNum  | IntType |  Valid |
+ * ITE Higher 4 Bytes
+ *   Bits:    | 31 ... 16 | 15 ...0 |
+ *   Values:  |  vPEID    |  ICID   |
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


