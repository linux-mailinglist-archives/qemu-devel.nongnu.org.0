Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D322EB0D1
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:01:50 +0100 (CET)
Received: from localhost ([::1]:44932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwpiO-0005cC-4E
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:01:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpaq-0008DG-9P
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:54:00 -0500
Received: from mga11.intel.com ([192.55.52.93]:21242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpam-00012E-O8
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:54:00 -0500
IronPort-SDR: TZefJloQwHnL+ZDjOOloMnivDf+CBXQYts1RyPPsvE7w3b8hqJtd3reNUcjlUfgpdG44+QaeqU
 inIF3Y3d4P3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="173629503"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="173629503"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:53:51 -0800
IronPort-SDR: naWRLgOymj+8354Es/4EIAM3veVe6oGFGpZY8fUE3Y63tAQzqNe+0vacp9h22Lj46DufBtoiln
 fA/XRVQbVDmw==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="346337942"
Received: from tgeddam-mobl.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.140.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:53:51 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 04/32] hw/cxl/device: Introduce a CXL device (8.2.8)
Date: Tue,  5 Jan 2021 08:52:55 -0800
Message-Id: <20210105165323.783725-5-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210105165323.783725-1-ben.widawsky@intel.com>
References: <20210105165323.783725-1-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=ben.widawsky@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: Thomas Huth <thuth@redhat.com>, Ben Widawsky <ben.widawsky@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 Chris Browy <cbrowy@avery-design.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Prashant V Agarwal <agpr123@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A CXL device is a type of CXL component. Conceptually, a CXL device
would be a leaf node in a CXL topology. From an emulation perspective,
CXL devices are the most complex and so the actual implementation is
reserved for discrete commits.

This new device type is specifically catered towards the eventually
implementation of a Type3 CXL.mem device, 8.2.8.5 in the CXL 2.0
specification.

v2: Remove error codes not yet used (Jonathan)
    Fix interrupt enable bit width (Jonathan)
    Add comment for weird register size (Jonathan)
    Remove commands/registers not yet used (Ben)

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 include/hw/cxl/cxl.h        |   1 +
 include/hw/cxl/cxl_device.h | 151 ++++++++++++++++++++++++++++++++++++
 2 files changed, 152 insertions(+)
 create mode 100644 include/hw/cxl/cxl_device.h

diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index 55f6cc30a5..23f52c4cf9 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -12,6 +12,7 @@
 
 #include "cxl_pci.h"
 #include "cxl_component.h"
+#include "cxl_device.h"
 
 #endif
 
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
new file mode 100644
index 0000000000..38af43c1a6
--- /dev/null
+++ b/include/hw/cxl/cxl_device.h
@@ -0,0 +1,151 @@
+/*
+ * QEMU CXL Devices
+ *
+ * Copyright (c) 2020 Intel
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2. See the
+ * COPYING file in the top-level directory.
+ */
+
+#ifndef CXL_DEVICE_H
+#define CXL_DEVICE_H
+
+#include "hw/register.h"
+
+/*
+ * The following is how a CXL device's MMIO space is laid out. The only
+ * requirement from the spec is that the capabilities array and the capability
+ * headers start at offset 0 and are contiguously packed. The headers themselves
+ * provide offsets to the register fields. For this emulation, registers will
+ * start at offset 0x80 (m == 0x80). No secondary mailbox is implemented which
+ * means that n = m + sizeof(mailbox registers) + sizeof(device registers).
+ *
+ * This is roughly described in 8.2.8 Figure 138 of the CXL 2.0 spec.
+ *
+ * n + PAYLOAD_SIZE_MAX  +---------------------------------+
+ *                       |                                 |
+ *                  ^    |                                 |
+ *                  |    |                                 |
+ *                  |    |                                 |
+ *                  |    |                                 |
+ *                  |    |         Command Payload         |
+ *                  |    |                                 |
+ *                  |    |                                 |
+ *                  |    |                                 |
+ *                  |    |                                 |
+ *                  |    |                                 |
+ *                  n    +---------------------------------+
+ *                  ^    |                                 |
+ *                  |    |    Device Capability Registers  |
+ *                  |    |    x, mailbox, y                |
+ *                  |    |                                 |
+ *                  m    +---------------------------------+
+ *                  ^    |     Device Capability Header y  |
+ *                  |    +---------------------------------+
+ *                  |    | Device Capability Header Mailbox|
+ *                  |    +------------- --------------------
+ *                  |    |     Device Capability Header x  |
+ *                  |    +---------------------------------+
+ *                  |    |                                 |
+ *                  |    |                                 |
+ *                  |    |      Device Cap Array[0..n]     |
+ *                  |    |                                 |
+ *                  |    |                                 |
+ *                  |    |                                 |
+ *                  0    +---------------------------------+
+ */
+
+#define CXL_DEVICE_CAP_HDR1_OFFSET 0x10 /* Figure 138 */
+#define CXL_DEVICE_CAP_REG_SIZE 0x10 /* 8.2.8.2 */
+
+#define CXL_DEVICE_REGISTERS_OFFSET 0x80 /* Read comment above */
+#define CXL_DEVICE_REGISTERS_LENGTH 0x8 /* 8.2.8.3.1 */
+
+#define CXL_MAILBOX_REGISTERS_OFFSET \
+    (CXL_DEVICE_REGISTERS_OFFSET + CXL_DEVICE_REGISTERS_LENGTH)
+#define CXL_MAILBOX_REGISTERS_SIZE 0x20
+#define CXL_MAILBOX_PAYLOAD_SHIFT 11
+#define CXL_MAILBOX_MAX_PAYLOAD_SIZE (1 << CXL_MAILBOX_PAYLOAD_SHIFT)
+#define CXL_MAILBOX_REGISTERS_LENGTH \
+    (CXL_MAILBOX_REGISTERS_SIZE + CXL_MAILBOX_MAX_PAYLOAD_SIZE)
+
+typedef struct cxl_device_state {
+    /* Boss container and caps registers */
+    MemoryRegion device_registers;
+
+    struct {
+        MemoryRegion caps;
+        union {
+            uint8_t caps_reg_state[CXL_DEVICE_CAP_REG_SIZE * 4]; /* ARRAY + 3 CAPS */
+            uint32_t caps_reg_state32[CXL_DEVICE_CAP_REG_SIZE >> 2];
+        };
+    };
+    MemoryRegion device;
+    MemoryRegion mailbox;
+
+    MemoryRegion *pmem;
+    MemoryRegion *vmem;
+} CXLDeviceState;
+
+/* Initialize the register block for a device */
+void cxl_device_register_block_init(Object *obj, CXLDeviceState *dev);
+
+/* Set up default values for the register block */
+void cxl_device_register_init_common(CXLDeviceState *dev);
+
+/* CXL 2.0 - 8.2.8.1 */
+REG32(CXL_DEV_CAP_ARRAY, 0) /* 48b!?!?! */
+    FIELD(CXL_DEV_CAP_ARRAY, CAP_ID, 0, 16)
+    FIELD(CXL_DEV_CAP_ARRAY, CAP_VERSION, 16, 8)
+REG32(CXL_DEV_CAP_ARRAY2, 4) /* We're going to pretend it's 64b */
+    FIELD(CXL_DEV_CAP_ARRAY2, CAP_COUNT, 0, 16)
+
+/*
+ * In the 8.2.8.2, this is listed as a 128b register, but in 8.2.8, it says:
+ * > No registers defined in Section 8.2.8 are larger than 64-bits wide so that
+ * > is the maximum access size allowed for these registers. If this rule is not
+ * > followed, the behavior is undefined
+ *
+ * Here we've chosen to make it 4 dwords. The spec allows any pow2 multiple
+ * access to be used for a register (2 qwords, 8 words, 128 bytes).
+ */
+#define CXL_DEVICE_CAPABILITY_HEADER_REGISTER(n, offset)                            \
+    REG32(CXL_DEV_##n##_CAP_HDR0, offset)                 \
+        FIELD(CXL_DEV_##n##_CAP_HDR0, CAP_ID, 0, 16)      \
+        FIELD(CXL_DEV_##n##_CAP_HDR0, CAP_VERSION, 16, 8) \
+    REG32(CXL_DEV_##n##_CAP_HDR1, offset + 4)             \
+        FIELD(CXL_DEV_##n##_CAP_HDR1, CAP_OFFSET, 0, 32)  \
+    REG32(CXL_DEV_##n##_CAP_HDR2, offset + 8)             \
+        FIELD(CXL_DEV_##n##_CAP_HDR2, CAP_LENGTH, 0, 32)
+
+CXL_DEVICE_CAPABILITY_HEADER_REGISTER(DEVICE, CXL_DEVICE_CAP_HDR1_OFFSET)
+CXL_DEVICE_CAPABILITY_HEADER_REGISTER(MAILBOX, CXL_DEVICE_CAP_HDR1_OFFSET + \
+                                               CXL_DEVICE_CAP_REG_SIZE)
+
+REG32(CXL_DEV_MAILBOX_CAP, 0)
+    FIELD(CXL_DEV_MAILBOX_CAP, PAYLOAD_SIZE, 0, 5)
+    FIELD(CXL_DEV_MAILBOX_CAP, INT_CAP, 5, 1)
+    FIELD(CXL_DEV_MAILBOX_CAP, BG_INT_CAP, 6, 1)
+    FIELD(CXL_DEV_MAILBOX_CAP, MSI_N, 7, 4)
+
+REG32(CXL_DEV_MAILBOX_CTRL, 4)
+    FIELD(CXL_DEV_MAILBOX_CTRL, DOORBELL, 0, 1)
+    FIELD(CXL_DEV_MAILBOX_CTRL, INT_EN, 1, 1)
+    FIELD(CXL_DEV_MAILBOX_CTRL, BG_INT_EN, 2, 1)
+
+/* XXX: actually a 64b register */
+REG32(CXL_DEV_MAILBOX_STS, 0x10)
+    FIELD(CXL_DEV_MAILBOX_STS, BG_OP, 0, 1)
+    FIELD(CXL_DEV_MAILBOX_STS, ERRNO, 32, 16)
+    FIELD(CXL_DEV_MAILBOX_STS, VENDOR_ERRNO, 48, 16)
+
+/* XXX: actually a 64b register */
+REG32(CXL_DEV_BG_CMD_STS, 0x18)
+    FIELD(CXL_DEV_BG_CMD_STS, BG, 0, 16)
+    FIELD(CXL_DEV_BG_CMD_STS, DONE, 16, 7)
+    FIELD(CXL_DEV_BG_CMD_STS, ERRNO, 32, 16)
+    FIELD(CXL_DEV_BG_CMD_STS, VENDOR_ERRNO, 48, 16)
+
+REG32(CXL_DEV_CMD_PAYLOAD, 0x20)
+
+#endif
-- 
2.30.0


