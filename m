Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D876430B46F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 02:09:29 +0100 (CET)
Received: from localhost ([::1]:58164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6kC8-0000Fl-Sx
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 20:09:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1l6k38-0008Dv-Qu
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 20:00:10 -0500
Received: from mga18.intel.com ([134.134.136.126]:33363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1l6k34-0001oo-KF
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 20:00:10 -0500
IronPort-SDR: HAvCrRuKXA05MjA05w9I/IJASdUZdHKsCLFtWlid+O76vP/Gk/tax5omP8NLMECRHW1jIHxE+6
 C48jWBRz7YoQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="168457081"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="168457081"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 16:59:57 -0800
IronPort-SDR: iBBfz+pcKucWJNRI1+lm3P5UU2TShZ24qGllhR0/lM7uXjMxiIaP1PnK+THCDwwviclJYzRzPO
 bSdYohOK03bQ==
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="581764060"
Received: from jambrizm-mobl1.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.133.15])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 16:59:56 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 04/31] hw/cxl/device: Implement the CAP array
 (8.2.8.1-2)
Date: Mon,  1 Feb 2021 16:59:21 -0800
Message-Id: <20210202005948.241655-5-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210202005948.241655-1-ben.widawsky@intel.com>
References: <20210202005948.241655-1-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=ben.widawsky@intel.com; helo=mga18.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ben Widawsky <ben.widawsky@intel.com>, David Hildenbrand <david@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 "John Groves \(jgroves\)" <jgroves@micron.com>,
 Chris Browy <cbrowy@avery-design.com>, Markus Armbruster <armbru@redhat.com>,
 linux-cxl@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This implements all device MMIO up to the first capability. That
includes the CXL Device Capabilities Array Register, as well as all of
the CXL Device Capability Header Registers. The latter are filled in as
they are implemented in the following patches.

Endianness and alignment are managed by softmmu memory core.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 hw/cxl/cxl-device-utils.c   | 105 ++++++++++++++++++++++++++++++++++++
 hw/cxl/meson.build          |   1 +
 include/hw/cxl/cxl_device.h |  27 +++++++++-
 3 files changed, 132 insertions(+), 1 deletion(-)
 create mode 100644 hw/cxl/cxl-device-utils.c

diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
new file mode 100644
index 0000000000..bb15ad9a0f
--- /dev/null
+++ b/hw/cxl/cxl-device-utils.c
@@ -0,0 +1,105 @@
+/*
+ * CXL Utility library for devices
+ *
+ * Copyright(C) 2020 Intel Corporation.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2. See the
+ * COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/cxl/cxl.h"
+
+/*
+ * Device registers have no restrictions per the spec, and so fall back to the
+ * default memory mapped register rules in 8.2:
+ *   Software shall use CXL.io Memory Read and Write to access memory mapped
+ *   register defined in this section. Unless otherwise specified, software
+ *   shall restrict the accesses width based on the following:
+ *   • A 32 bit register shall   be accessed as a 1 Byte, 2 Bytes or 4 Bytes
+ *     quantity.
+ *   • A 64 bit register shall be accessed as a 1 Byte, 2 Bytes, 4 Bytes or 8
+ *     Bytes
+ *   • The address shall be a multiple of the access width, e.g. when
+ *     accessing a register as a 4 Byte quantity, the address shall be
+ *     multiple of 4.
+ *   • The accesses shall map to contiguous bytes.If these rules are not
+ *     followed, the behavior is undefined
+ */
+
+static uint64_t caps_reg_read(void *opaque, hwaddr offset, unsigned size)
+{
+    CXLDeviceState *cxl_dstate = opaque;
+
+    return cxl_dstate->caps_reg_state32[offset / 4];
+}
+
+static uint64_t dev_reg_read(void *opaque, hwaddr offset, unsigned size)
+{
+    return 0;
+}
+
+static const MemoryRegionOps dev_ops = {
+    .read = dev_reg_read,
+    .write = NULL, /* status register is read only */
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+        .unaligned = false,
+    },
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+    },
+};
+
+static const MemoryRegionOps caps_ops = {
+    .read = caps_reg_read,
+    .write = NULL, /* caps registers are read only */
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+        .unaligned = false,
+    },
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+void cxl_device_register_block_init(Object *obj, CXLDeviceState *cxl_dstate)
+{
+    /* This will be a BAR, so needs to be rounded up to pow2 for PCI spec */
+    memory_region_init(&cxl_dstate->device_registers, obj, "device-registers",
+                       pow2ceil(CXL_MMIO_SIZE));
+
+    memory_region_init_io(&cxl_dstate->caps, obj, &caps_ops, cxl_dstate,
+                          "cap-array", CXL_DEVICE_REGISTERS_OFFSET - 0);
+    memory_region_init_io(&cxl_dstate->device, obj, &dev_ops, cxl_dstate,
+                          "device-status", CXL_DEVICE_REGISTERS_LENGTH);
+
+    memory_region_add_subregion(&cxl_dstate->device_registers, 0,
+                                &cxl_dstate->caps);
+    memory_region_add_subregion(&cxl_dstate->device_registers,
+                                CXL_DEVICE_REGISTERS_OFFSET,
+                                &cxl_dstate->device);
+}
+
+static void device_reg_init_common(CXLDeviceState *cxl_dstate) { }
+
+void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
+{
+    uint32_t *cap_hdrs = cxl_dstate->caps_reg_state32;
+    const int cap_count = 1;
+
+    /* CXL Device Capabilities Array Register */
+    ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_ID, 0);
+    ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_VERSION, 1);
+    ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY2, CAP_COUNT, cap_count);
+
+    cxl_device_cap_init(cxl_dstate, DEVICE, 1);
+    device_reg_init_common(cxl_dstate);
+}
diff --git a/hw/cxl/meson.build b/hw/cxl/meson.build
index 00c3876a0f..47154d6850 100644
--- a/hw/cxl/meson.build
+++ b/hw/cxl/meson.build
@@ -1,3 +1,4 @@
 softmmu_ss.add(when: 'CONFIG_CXL', if_true: files(
   'cxl-component-utils.c',
+  'cxl-device-utils.c',
 ))
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index a85f250503..f3bcf19410 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -58,6 +58,8 @@
 #define CXL_DEVICE_CAP_HDR1_OFFSET 0x10 /* Figure 138 */
 #define CXL_DEVICE_CAP_REG_SIZE 0x10 /* 8.2.8.2 */
 #define CXL_DEVICE_CAPS_MAX 4 /* 8.2.8.2.1 + 8.2.8.5 */
+#define CXL_CAPS_SIZE \
+    (CXL_DEVICE_CAP_REG_SIZE * CXL_DEVICE_CAPS_MAX + 1) /* +1 for header */
 
 #define CXL_DEVICE_REGISTERS_OFFSET 0x80 /* Read comment above */
 #define CXL_DEVICE_REGISTERS_LENGTH 0x8 /* 8.2.8.3.1 */
@@ -70,11 +72,18 @@
 #define CXL_MAILBOX_REGISTERS_LENGTH \
     (CXL_MAILBOX_REGISTERS_SIZE + CXL_MAILBOX_MAX_PAYLOAD_SIZE)
 
+#define CXL_MMIO_SIZE                                       \
+    CXL_DEVICE_CAP_REG_SIZE + CXL_DEVICE_REGISTERS_LENGTH + \
+        CXL_MAILBOX_REGISTERS_LENGTH
+
 typedef struct cxl_device_state {
     MemoryRegion device_registers;
 
     /* mmio for device capabilities array - 8.2.8.2 */
-    MemoryRegion caps;
+    struct {
+        MemoryRegion caps;
+        uint32_t caps_reg_state32[CXL_CAPS_SIZE / 4];
+    };
 
     /* mmio for the device status registers 8.2.8.3 */
     MemoryRegion device;
@@ -126,6 +135,22 @@ CXL_DEVICE_CAPABILITY_HEADER_REGISTER(DEVICE, CXL_DEVICE_CAP_HDR1_OFFSET)
 CXL_DEVICE_CAPABILITY_HEADER_REGISTER(MAILBOX, CXL_DEVICE_CAP_HDR1_OFFSET + \
                                                CXL_DEVICE_CAP_REG_SIZE)
 
+#define cxl_device_cap_init(dstate, reg, cap_id)                                   \
+    do {                                                                           \
+        uint32_t *cap_hdrs = dstate->caps_reg_state32;                             \
+        int which = R_CXL_DEV_##reg##_CAP_HDR0;                                    \
+        cap_hdrs[which] =                                                          \
+            FIELD_DP32(cap_hdrs[which], CXL_DEV_##reg##_CAP_HDR0, CAP_ID, cap_id); \
+        cap_hdrs[which] = FIELD_DP32(                                              \
+            cap_hdrs[which], CXL_DEV_##reg##_CAP_HDR0, CAP_VERSION, 1);            \
+        cap_hdrs[which + 1] =                                                      \
+            FIELD_DP32(cap_hdrs[which + 1], CXL_DEV_##reg##_CAP_HDR1,              \
+                       CAP_OFFSET, CXL_##reg##_REGISTERS_OFFSET);                  \
+        cap_hdrs[which + 2] =                                                      \
+            FIELD_DP32(cap_hdrs[which + 2], CXL_DEV_##reg##_CAP_HDR2,              \
+                       CAP_LENGTH, CXL_##reg##_REGISTERS_LENGTH);                  \
+    } while (0)
+
 REG32(CXL_DEV_MAILBOX_CAP, 0)
     FIELD(CXL_DEV_MAILBOX_CAP, PAYLOAD_SIZE, 0, 5)
     FIELD(CXL_DEV_MAILBOX_CAP, INT_CAP, 5, 1)
-- 
2.30.0


