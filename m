Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EFE495369
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 18:38:43 +0100 (CET)
Received: from localhost ([::1]:35844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAbOU-0007pb-MX
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 12:38:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgb-0004HN-S9
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:06 -0500
Received: from [2a00:1450:4864:20::32a] (port=45843
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgZ-0003IQ-41
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:05 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso13331498wms.4
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=URQ0NAHaPq1Yz7ZGbvQA0BCq/o5l4HiMj2wtL9Q0DyI=;
 b=gNk0S5+FLgAmfSLXZxjdQEPetJcyhpZugZQ7OugfiLhq3S45EbQYlEoV9RDj4Pvt9e
 IT7M+dh3057ntXy3AEUz7X+FltJjUYWoprcO8NTFw5AUcT2eJJ6sC19iXMr4WM0uk3L0
 h+sUumAP9ArR8X7yVET9raEVeD1r0H+xhSbv3ft5zASbmQPa14z2M/Y+SXwMwStClDir
 LwrRtT8r0KAafqgyaagrqHif3HXHPMZaFOpsjAQjNFKN1mSPSLDdqeU6Wi04O5ASX+mu
 pFAn6qhLvHojAhESeO4NUyIO2hv1YAU163YyC7tZE4qmQQNLSqPXE6RcYqYdFHTcDELP
 4Exg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=URQ0NAHaPq1Yz7ZGbvQA0BCq/o5l4HiMj2wtL9Q0DyI=;
 b=bf5zK1dCLwtnvOwWS6KaYikize0xmSWnH0Vkmd1hQma7G/woNqvhsBSGMimzbY2iFc
 d/3rXlliZJEkymX76Jcx5UAL7S/iDacKP4Rg39OMYmhnrTo7+9lYhESTC9m5RxrlGoaK
 JU77PdPFclcc3wI95uNDK0St0c5+vyoJypU1C4jW8vy/2Uwgg2zg6fc0OduJtUYV7rNn
 CW/N3CZQh+cD6FZlm7prxqlkLRjSA4G4Q+gediD9M7k9YGznCukgmuKg7qM+dL7pl9q8
 NHROltPdYa3nUj35IQQN1358qLruJfV4njURySxOSydJgzsyo16AbjIxkFi0eYJDNvPq
 LvwQ==
X-Gm-Message-State: AOAM530cC/Rb/OsQRb3D00VtFjVAyAgYtxK+/ZfEo6tUNGp7hgV7sZkv
 ij89GmM+26TgMiOl/znNt5DV+66lTBxUnQ==
X-Google-Smtp-Source: ABdhPJxRXSKOjt+X1GMm/PQv++J68EH/aTlnW7QaQCGxucs4Bl99Zy9g/lC9MAIs/5AU/eGKaIV9QQ==
X-Received: by 2002:a05:6000:1688:: with SMTP id
 y8mr15680972wrd.390.1642682220460; 
 Thu, 20 Jan 2022 04:37:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.36.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:37:00 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/38] hw/misc/aspeed_i3c.c: Introduce a dummy AST2600 I3C
 model.
Date: Thu, 20 Jan 2022 12:36:15 +0000
Message-Id: <20220120123630.267975-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Troy Lee <troy_lee@aspeedtech.com>

Aspeed 2600 SDK enables I3C support by default.  The I3C driver will try
to reset the device controller and set it up through device address table
register.  This dummy model responds to these registers with default values
as listed in the ast2600v10 datasheet chapter 54.2.

This avoids a guest machine kernel panic due to referencing an
invalid kernel address if the device address table register isn't
set correctly.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Reviewed-by: Graeme Gregory <quic_ggregory@quicinc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Graeme Gregory <quic_ggregory@quicinc.com>
Message-id: 20220111084546.4145785-2-troy_lee@aspeedtech.com
[PMM: tidied commit message]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/aspeed_i3c.h |  48 +++++
 hw/misc/aspeed_i3c.c         | 381 +++++++++++++++++++++++++++++++++++
 hw/misc/meson.build          |   1 +
 hw/misc/trace-events         |   6 +
 4 files changed, 436 insertions(+)
 create mode 100644 include/hw/misc/aspeed_i3c.h
 create mode 100644 hw/misc/aspeed_i3c.c

diff --git a/include/hw/misc/aspeed_i3c.h b/include/hw/misc/aspeed_i3c.h
new file mode 100644
index 00000000000..39679dfa1ae
--- /dev/null
+++ b/include/hw/misc/aspeed_i3c.h
@@ -0,0 +1,48 @@
+/*
+ * ASPEED I3C Controller
+ *
+ * Copyright (C) 2021 ASPEED Technology Inc.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef ASPEED_I3C_H
+#define ASPEED_I3C_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_ASPEED_I3C "aspeed.i3c"
+#define TYPE_ASPEED_I3C_DEVICE "aspeed.i3c.device"
+OBJECT_DECLARE_TYPE(AspeedI3CState, AspeedI3CClass, ASPEED_I3C)
+
+#define ASPEED_I3C_NR_REGS (0x70 >> 2)
+#define ASPEED_I3C_DEVICE_NR_REGS (0x300 >> 2)
+#define ASPEED_I3C_NR_DEVICES 6
+
+OBJECT_DECLARE_SIMPLE_TYPE(AspeedI3CDevice, ASPEED_I3C_DEVICE)
+typedef struct AspeedI3CDevice {
+    /* <private> */
+    SysBusDevice parent;
+
+    /* <public> */
+    MemoryRegion mr;
+    qemu_irq irq;
+
+    uint8_t id;
+    uint32_t regs[ASPEED_I3C_DEVICE_NR_REGS];
+} AspeedI3CDevice;
+
+typedef struct AspeedI3CState {
+    /* <private> */
+    SysBusDevice parent;
+
+    /* <public> */
+    MemoryRegion iomem;
+    MemoryRegion iomem_container;
+    qemu_irq irq;
+
+    uint32_t regs[ASPEED_I3C_NR_REGS];
+    AspeedI3CDevice devices[ASPEED_I3C_NR_DEVICES];
+} AspeedI3CState;
+#endif /* ASPEED_I3C_H */
diff --git a/hw/misc/aspeed_i3c.c b/hw/misc/aspeed_i3c.c
new file mode 100644
index 00000000000..43771d768ad
--- /dev/null
+++ b/hw/misc/aspeed_i3c.c
@@ -0,0 +1,381 @@
+/*
+ * ASPEED I3C Controller
+ *
+ * Copyright (C) 2021 ASPEED Technology Inc.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/error-report.h"
+#include "hw/misc/aspeed_i3c.h"
+#include "hw/registerfields.h"
+#include "hw/qdev-properties.h"
+#include "qapi/error.h"
+#include "migration/vmstate.h"
+#include "trace.h"
+
+/* I3C Controller Registers */
+REG32(I3C1_REG0, 0x10)
+REG32(I3C1_REG1, 0x14)
+    FIELD(I3C1_REG1, I2C_MODE,  0,  1)
+    FIELD(I3C1_REG1, SA_EN,     15, 1)
+REG32(I3C2_REG0, 0x20)
+REG32(I3C2_REG1, 0x24)
+    FIELD(I3C2_REG1, I2C_MODE,  0,  1)
+    FIELD(I3C2_REG1, SA_EN,     15, 1)
+REG32(I3C3_REG0, 0x30)
+REG32(I3C3_REG1, 0x34)
+    FIELD(I3C3_REG1, I2C_MODE,  0,  1)
+    FIELD(I3C3_REG1, SA_EN,     15, 1)
+REG32(I3C4_REG0, 0x40)
+REG32(I3C4_REG1, 0x44)
+    FIELD(I3C4_REG1, I2C_MODE,  0,  1)
+    FIELD(I3C4_REG1, SA_EN,     15, 1)
+REG32(I3C5_REG0, 0x50)
+REG32(I3C5_REG1, 0x54)
+    FIELD(I3C5_REG1, I2C_MODE,  0,  1)
+    FIELD(I3C5_REG1, SA_EN,     15, 1)
+REG32(I3C6_REG0, 0x60)
+REG32(I3C6_REG1, 0x64)
+    FIELD(I3C6_REG1, I2C_MODE,  0,  1)
+    FIELD(I3C6_REG1, SA_EN,     15, 1)
+
+/* I3C Device Registers */
+REG32(DEVICE_CTRL,                  0x00)
+REG32(DEVICE_ADDR,                  0x04)
+REG32(HW_CAPABILITY,                0x08)
+REG32(COMMAND_QUEUE_PORT,           0x0c)
+REG32(RESPONSE_QUEUE_PORT,          0x10)
+REG32(RX_TX_DATA_PORT,              0x14)
+REG32(IBI_QUEUE_STATUS,             0x18)
+REG32(IBI_QUEUE_DATA,               0x18)
+REG32(QUEUE_THLD_CTRL,              0x1c)
+REG32(DATA_BUFFER_THLD_CTRL,        0x20)
+REG32(IBI_QUEUE_CTRL,               0x24)
+REG32(IBI_MR_REQ_REJECT,            0x2c)
+REG32(IBI_SIR_REQ_REJECT,           0x30)
+REG32(RESET_CTRL,                   0x34)
+REG32(SLV_EVENT_CTRL,               0x38)
+REG32(INTR_STATUS,                  0x3c)
+REG32(INTR_STATUS_EN,               0x40)
+REG32(INTR_SIGNAL_EN,               0x44)
+REG32(INTR_FORCE,                   0x48)
+REG32(QUEUE_STATUS_LEVEL,           0x4c)
+REG32(DATA_BUFFER_STATUS_LEVEL,     0x50)
+REG32(PRESENT_STATE,                0x54)
+REG32(CCC_DEVICE_STATUS,            0x58)
+REG32(DEVICE_ADDR_TABLE_POINTER,    0x5c)
+    FIELD(DEVICE_ADDR_TABLE_POINTER, DEPTH, 16, 16)
+    FIELD(DEVICE_ADDR_TABLE_POINTER, ADDR,  0,  16)
+REG32(DEV_CHAR_TABLE_POINTER,       0x60)
+REG32(VENDOR_SPECIFIC_REG_POINTER,  0x6c)
+REG32(SLV_MIPI_PID_VALUE,           0x70)
+REG32(SLV_PID_VALUE,                0x74)
+REG32(SLV_CHAR_CTRL,                0x78)
+REG32(SLV_MAX_LEN,                  0x7c)
+REG32(MAX_READ_TURNAROUND,          0x80)
+REG32(MAX_DATA_SPEED,               0x84)
+REG32(SLV_DEBUG_STATUS,             0x88)
+REG32(SLV_INTR_REQ,                 0x8c)
+REG32(DEVICE_CTRL_EXTENDED,         0xb0)
+REG32(SCL_I3C_OD_TIMING,            0xb4)
+REG32(SCL_I3C_PP_TIMING,            0xb8)
+REG32(SCL_I2C_FM_TIMING,            0xbc)
+REG32(SCL_I2C_FMP_TIMING,           0xc0)
+REG32(SCL_EXT_LCNT_TIMING,          0xc8)
+REG32(SCL_EXT_TERMN_LCNT_TIMING,    0xcc)
+REG32(BUS_FREE_TIMING,              0xd4)
+REG32(BUS_IDLE_TIMING,              0xd8)
+REG32(I3C_VER_ID,                   0xe0)
+REG32(I3C_VER_TYPE,                 0xe4)
+REG32(EXTENDED_CAPABILITY,          0xe8)
+REG32(SLAVE_CONFIG,                 0xec)
+
+static const uint32_t ast2600_i3c_device_resets[ASPEED_I3C_DEVICE_NR_REGS] = {
+    [R_HW_CAPABILITY]               = 0x000e00bf,
+    [R_QUEUE_THLD_CTRL]             = 0x01000101,
+    [R_I3C_VER_ID]                  = 0x3130302a,
+    [R_I3C_VER_TYPE]                = 0x6c633033,
+    [R_DEVICE_ADDR_TABLE_POINTER]   = 0x00080280,
+    [R_DEV_CHAR_TABLE_POINTER]      = 0x00020200,
+    [A_VENDOR_SPECIFIC_REG_POINTER] = 0x000000b0,
+    [R_SLV_MAX_LEN]                 = 0x00ff00ff,
+};
+
+static uint64_t aspeed_i3c_device_read(void *opaque, hwaddr offset,
+                                       unsigned size)
+{
+    AspeedI3CDevice *s = ASPEED_I3C_DEVICE(opaque);
+    uint32_t addr = offset >> 2;
+    uint64_t value;
+
+    switch (addr) {
+    case R_COMMAND_QUEUE_PORT:
+        value = 0;
+        break;
+    default:
+        value = s->regs[addr];
+        break;
+    }
+
+    trace_aspeed_i3c_device_read(s->id, offset, value);
+
+    return value;
+}
+
+static void aspeed_i3c_device_write(void *opaque, hwaddr offset,
+                                    uint64_t value, unsigned size)
+{
+    AspeedI3CDevice *s = ASPEED_I3C_DEVICE(opaque);
+    uint32_t addr = offset >> 2;
+
+    trace_aspeed_i3c_device_write(s->id, offset, value);
+
+    switch (addr) {
+    case R_HW_CAPABILITY:
+    case R_RESPONSE_QUEUE_PORT:
+    case R_IBI_QUEUE_DATA:
+    case R_QUEUE_STATUS_LEVEL:
+    case R_PRESENT_STATE:
+    case R_CCC_DEVICE_STATUS:
+    case R_DEVICE_ADDR_TABLE_POINTER:
+    case R_VENDOR_SPECIFIC_REG_POINTER:
+    case R_SLV_CHAR_CTRL:
+    case R_SLV_MAX_LEN:
+    case R_MAX_READ_TURNAROUND:
+    case R_I3C_VER_ID:
+    case R_I3C_VER_TYPE:
+    case R_EXTENDED_CAPABILITY:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: write to readonly register[%02lx] = %08lx\n",
+                      __func__, offset, value);
+        break;
+    case R_RX_TX_DATA_PORT:
+        break;
+    case R_RESET_CTRL:
+        break;
+    default:
+        s->regs[addr] = value;
+        break;
+    }
+}
+
+static const VMStateDescription aspeed_i3c_device_vmstate = {
+    .name = TYPE_ASPEED_I3C,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]){
+        VMSTATE_UINT32_ARRAY(regs, AspeedI3CDevice, ASPEED_I3C_DEVICE_NR_REGS),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static const MemoryRegionOps aspeed_i3c_device_ops = {
+    .read = aspeed_i3c_device_read,
+    .write = aspeed_i3c_device_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static void aspeed_i3c_device_reset(DeviceState *dev)
+{
+    AspeedI3CDevice *s = ASPEED_I3C_DEVICE(dev);
+
+    memcpy(s->regs, ast2600_i3c_device_resets, sizeof(s->regs));
+}
+
+static void aspeed_i3c_device_realize(DeviceState *dev, Error **errp)
+{
+    AspeedI3CDevice *s = ASPEED_I3C_DEVICE(dev);
+    g_autofree char *name = g_strdup_printf(TYPE_ASPEED_I3C_DEVICE ".%d",
+                                            s->id);
+
+    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
+
+    memory_region_init_io(&s->mr, OBJECT(s), &aspeed_i3c_device_ops,
+                          s, name, ASPEED_I3C_DEVICE_NR_REGS << 2);
+}
+
+static uint64_t aspeed_i3c_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    AspeedI3CState *s = ASPEED_I3C(opaque);
+    uint64_t val = 0;
+
+    val = s->regs[addr >> 2];
+
+    trace_aspeed_i3c_read(addr, val);
+
+    return val;
+}
+
+static void aspeed_i3c_write(void *opaque,
+                             hwaddr addr,
+                             uint64_t data,
+                             unsigned int size)
+{
+    AspeedI3CState *s = ASPEED_I3C(opaque);
+
+    trace_aspeed_i3c_write(addr, data);
+
+    addr >>= 2;
+
+    /* I3C controller register */
+    switch (addr) {
+    case R_I3C1_REG1:
+    case R_I3C2_REG1:
+    case R_I3C3_REG1:
+    case R_I3C4_REG1:
+    case R_I3C5_REG1:
+    case R_I3C6_REG1:
+        if (data & R_I3C1_REG1_I2C_MODE_MASK) {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: Not support I2C mode [%08lx]=%08lx",
+                          __func__, addr << 2, data);
+            break;
+        }
+        if (data & R_I3C1_REG1_SA_EN_MASK) {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: Not support slave mode [%08lx]=%08lx",
+                          __func__, addr << 2, data);
+            break;
+        }
+        s->regs[addr] = data;
+        break;
+    default:
+        s->regs[addr] = data;
+        break;
+    }
+}
+
+static const MemoryRegionOps aspeed_i3c_ops = {
+    .read = aspeed_i3c_read,
+    .write = aspeed_i3c_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 4,
+    }
+};
+
+static void aspeed_i3c_reset(DeviceState *dev)
+{
+    AspeedI3CState *s = ASPEED_I3C(dev);
+    memset(s->regs, 0, sizeof(s->regs));
+}
+
+static void aspeed_i3c_instance_init(Object *obj)
+{
+    AspeedI3CState *s = ASPEED_I3C(obj);
+    int i;
+
+    for (i = 0; i < ASPEED_I3C_NR_DEVICES; ++i) {
+        object_initialize_child(obj, "device[*]", &s->devices[i],
+                TYPE_ASPEED_I3C_DEVICE);
+    }
+}
+
+static void aspeed_i3c_realize(DeviceState *dev, Error **errp)
+{
+    int i;
+    AspeedI3CState *s = ASPEED_I3C(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    memory_region_init(&s->iomem_container, OBJECT(s),
+            TYPE_ASPEED_I3C ".container", 0x8000);
+
+    sysbus_init_mmio(sbd, &s->iomem_container);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_i3c_ops, s,
+            TYPE_ASPEED_I3C ".regs", ASPEED_I3C_NR_REGS << 2);
+
+    memory_region_add_subregion(&s->iomem_container, 0x0, &s->iomem);
+
+    for (i = 0; i < ASPEED_I3C_NR_DEVICES; ++i) {
+        Object *dev = OBJECT(&s->devices[i]);
+
+        if (!object_property_set_uint(dev, "device-id", i, errp)) {
+            return;
+        }
+
+        if (!sysbus_realize(SYS_BUS_DEVICE(dev), errp)) {
+            return;
+        }
+
+        /*
+         * Register Address of I3CX Device =
+         *     (Base Address of Global Register) + (Offset of I3CX) + Offset
+         * X = 0, 1, 2, 3, 4, 5
+         * Offset of I3C0 = 0x2000
+         * Offset of I3C1 = 0x3000
+         * Offset of I3C2 = 0x4000
+         * Offset of I3C3 = 0x5000
+         * Offset of I3C4 = 0x6000
+         * Offset of I3C5 = 0x7000
+         */
+        memory_region_add_subregion(&s->iomem_container,
+                0x2000 + i * 0x1000, &s->devices[i].mr);
+    }
+
+}
+
+static Property aspeed_i3c_device_properties[] = {
+    DEFINE_PROP_UINT8("device-id", AspeedI3CDevice, id, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void aspeed_i3c_device_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "Aspeed I3C Device";
+    dc->realize = aspeed_i3c_device_realize;
+    dc->reset = aspeed_i3c_device_reset;
+    device_class_set_props(dc, aspeed_i3c_device_properties);
+}
+
+static const TypeInfo aspeed_i3c_device_info = {
+    .name = TYPE_ASPEED_I3C_DEVICE,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AspeedI3CDevice),
+    .class_init = aspeed_i3c_device_class_init,
+};
+
+static const VMStateDescription vmstate_aspeed_i3c = {
+    .name = TYPE_ASPEED_I3C,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, AspeedI3CState, ASPEED_I3C_NR_REGS),
+        VMSTATE_STRUCT_ARRAY(devices, AspeedI3CState, ASPEED_I3C_NR_DEVICES, 1,
+                             aspeed_i3c_device_vmstate, AspeedI3CDevice),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void aspeed_i3c_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = aspeed_i3c_realize;
+    dc->reset = aspeed_i3c_reset;
+    dc->desc = "Aspeed I3C Controller";
+    dc->vmsd = &vmstate_aspeed_i3c;
+}
+
+static const TypeInfo aspeed_i3c_info = {
+    .name = TYPE_ASPEED_I3C,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_init = aspeed_i3c_instance_init,
+    .instance_size = sizeof(AspeedI3CState),
+    .class_init = aspeed_i3c_class_init,
+};
+
+static void aspeed_i3c_register_types(void)
+{
+    type_register_static(&aspeed_i3c_device_info);
+    type_register_static(&aspeed_i3c_info);
+}
+
+type_init(aspeed_i3c_register_types);
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 3f41a3a5b27..d1a11691087 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -105,6 +105,7 @@ softmmu_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true: files('pvpanic-pci.c'))
 softmmu_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_hace.c',
+  'aspeed_i3c.c',
   'aspeed_lpc.c',
   'aspeed_scu.c',
   'aspeed_sdmc.c',
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 2da96d167a7..1c373dd0a4c 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -199,6 +199,12 @@ armsse_mhu_write(uint64_t offset, uint64_t data, unsigned size) "SSE-200 MHU wri
 # aspeed_xdma.c
 aspeed_xdma_write(uint64_t offset, uint64_t data) "XDMA write: offset 0x%" PRIx64 " data 0x%" PRIx64
 
+# aspeed_i3c.c
+aspeed_i3c_read(uint64_t offset, uint64_t data) "I3C read: offset 0x%" PRIx64 " data 0x%" PRIx64
+aspeed_i3c_write(uint64_t offset, uint64_t data) "I3C write: offset 0x%" PRIx64 " data 0x%" PRIx64
+aspeed_i3c_device_read(uint32_t deviceid, uint64_t offset, uint64_t data) "I3C Dev[%u] read: offset 0x%" PRIx64 " data 0x%" PRIx64
+aspeed_i3c_device_write(uint32_t deviceid, uint64_t offset, uint64_t data) "I3C Dev[%u] write: offset 0x%" PRIx64 " data 0x%" PRIx64
+
 # bcm2835_property.c
 bcm2835_mbox_property(uint32_t tag, uint32_t bufsize, size_t resplen) "mbox property tag:0x%08x in_sz:%u out_sz:%zu"
 
-- 
2.25.1


