Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFE430B463
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 02:05:54 +0100 (CET)
Received: from localhost ([::1]:49688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6k8f-0004zP-Re
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 20:05:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1l6k36-00089d-SP
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 20:00:08 -0500
Received: from mga18.intel.com ([134.134.136.126]:33366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1l6k34-0001pl-EM
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 20:00:08 -0500
IronPort-SDR: mRpCREb/Wyq4TgtKP1Cbr2UNdqeGNhcTEAeA+mhuagE5/8H9c6vTVTrq2NS7LUZ6KIoiIsYTeu
 ChW5v4E28mBA==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="168457079"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="168457079"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 16:59:56 -0800
IronPort-SDR: eprYjPG4hF3fBy0jm6V08RghzcD8Ab0d9RBbbTjE9spCO/4Na4rflnb/CvosCM+qwA4Tubs6Ag
 sy4AIGh0FHDw==
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="581764052"
Received: from jambrizm-mobl1.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.133.15])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 16:59:55 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 03/31] hw/cxl/device: Introduce a CXL device (8.2.8)
Date: Mon,  1 Feb 2021 16:59:20 -0800
Message-Id: <20210202005948.241655-4-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210202005948.241655-1-ben.widawsky@intel.com>
References: <20210202005948.241655-1-ben.widawsky@intel.com>
MIME-Version: 1.0
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

A CXL device is a type of CXL component. Conceptually, a CXL device
would be a leaf node in a CXL topology. From an emulation perspective,
CXL devices are the most complex and so the actual implementation is
reserved for discrete commits.

This new device type is specifically catered towards the eventual
implementation of a Type3 CXL.mem device, 8.2.8.5 in the CXL 2.0
specification.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 include/hw/cxl/cxl.h        |   1 +
 include/hw/cxl/cxl_device.h | 155 ++++++++++++++++++++++++++++++++++++
 2 files changed, 156 insertions(+)
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
index 0000000000..a85f250503
--- /dev/null
+++ b/include/hw/cxl/cxl_device.h
@@ -0,0 +1,155 @@
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
+#define CXL_DEVICE_CAPS_MAX 4 /* 8.2.8.2.1 + 8.2.8.5 */
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
+    MemoryRegion device_registers;
+
+    /* mmio for device capabilities array - 8.2.8.2 */
+    MemoryRegion caps;
+
+    /* mmio for the device status registers 8.2.8.3 */
+    MemoryRegion device;
+
+    /* mmio for the mailbox registers 8.2.8.4 */
+    MemoryRegion mailbox;
+
+    /* memory region for persistent memory, HDM */
+    MemoryRegion *pmem;
+
+    /* memory region for volatile  memory, HDM */
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
+ * Helper macro to initialize capability headers for CXL devices.
+ *
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


