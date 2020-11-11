Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE782AE86D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 06:51:32 +0100 (CET)
Received: from localhost ([::1]:51808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcj2Z-0000bS-Vc
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 00:51:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kciyq-0003tY-Ek
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 00:47:40 -0500
Received: from mga14.intel.com ([192.55.52.115]:60776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kciyn-0008P1-RR
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 00:47:40 -0500
IronPort-SDR: bp2hKD2abl9My4xb8anKaEk0wmHw5LDyIWxeuWj9KXAZRnCbZFZcVVpCbS/SgqTm5edsapm+z2
 oKg27t42B3bw==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="169314663"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="169314663"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:29 -0800
IronPort-SDR: /fQgr68ksmoggiZt5haV8cIQEYo8nZuYuMjaDUtE0LBvzqaMpdo9e1jrNdifIn7J84QJ5htjYy
 NuX86fkhZ0zQ==
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="308710397"
Received: from hccoutan-mobl1.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.131.159])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:29 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 04/25] hw/cxl/device: Introduce a CXL device (8.2.8)
Date: Tue, 10 Nov 2020 21:47:03 -0800
Message-Id: <20201111054724.794888-5-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111054724.794888-1-ben.widawsky@intel.com>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=ben.widawsky@intel.com; helo=mga14.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 00:47:28
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
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
Cc: Vishal Verma <vishal.l.verma@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Ben Widawsky <ben.widawsky@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A CXL device is a type of CXL component. Conceptually, a CXL device
would be a leaf node in a CXL topology. From an emulation perspective,
CXL devices are the most complex and so the actual implementation is
reserved for discrete commits.

This new device type is specifically catered towards the eventually
implementation of a Type3 CXL.mem device, 8.2.8.5 in the CXL 2.0
specification.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 include/hw/cxl/cxl.h        |   1 +
 include/hw/cxl/cxl_device.h | 193 ++++++++++++++++++++++++++++++++++++
 2 files changed, 194 insertions(+)
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
index 0000000000..491eca6e05
--- /dev/null
+++ b/include/hw/cxl/cxl_device.h
@@ -0,0 +1,193 @@
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
+    MemoryRegion caps;
+    MemoryRegion device;
+    MemoryRegion mailbox;
+
+    MemoryRegion *pmem;
+    MemoryRegion *vmem;
+
+    bool active;
+    uint16_t command;
+    uint16_t payload_size;
+    union {
+        uint8_t caps_reg_state[CXL_DEVICE_CAP_REG_SIZE * 4]; /* ARRAY + 3 CAPS */
+        uint32_t caps_reg_state32[0];
+    };
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
+ *
+ * XXX: This is supposedly fixed for the release version of the spec. If this
+ * comment is still here, I've failed.
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
+    FIELD(CXL_DEV_MAILBOX_CTRL, INT_EN, 1, 2)
+    FIELD(CXL_DEV_MAILBOX_CTRL, BG_INT_EN, 2, 1)
+
+enum {
+    CXL_CMD_EVENTS              = 0x1,
+    CXL_CMD_IDENTIFY            = 0x40,
+};
+
+REG32(CXL_DEV_MAILBOX_CMD, 8)
+    FIELD(CXL_DEV_MAILBOX_CMD, OP, 0, 16)
+    FIELD(CXL_DEV_MAILBOX_CMD, LENGTH, 16, 20)
+
+/* 8.2.8.4.5.1 Command Return Codes */
+enum {
+    RET_SUCCESS                 = 0x0,
+    RET_BG_STARTED              = 0x1, /* Background Command Started */
+    RET_EINVAL                  = 0x2, /* Invalid Input */
+    RET_ENOTSUP                 = 0x3, /* Unsupported */
+    RET_ENODEV                  = 0x4, /* Internal Error */
+    RET_ERESTART                = 0x5, /* Retry Required */
+    RET_EBUSY                   = 0x6, /* Busy */
+    RET_MEDIA_DISABLED          = 0x7, /* Media Disabled */
+    RET_FW_EBUSY                = 0x8, /* FW Transfer in Progress */
+    RET_FW_OOO                  = 0x9, /* FW Transfer Out of Order */
+    RET_FW_AUTH                 = 0xa, /* FW Authentication Failed */
+    RET_FW_EBADSLT              = 0xb, /* Invalid Slot */
+    RET_FW_ROLLBACK             = 0xc, /* Activation Failed, FW Rolled Back */
+    RET_FW_REBOOT               = 0xd, /* Activation Failed, Cold Reset Required */
+    RET_ENOENT                  = 0xe, /* Invalid Handle */
+    RET_EFAULT                  = 0xf, /* Invalid Physical Address */
+    RET_POISON_E2BIG            = 0x10, /* Inject Poison Limit Reached */
+    RET_EIO                     = 0x11, /* Permanent Media Failure */
+    RET_ECANCELED               = 0x12, /* Aborted */
+    RET_EACCESS                 = 0x13, /* Invalid Security State */
+    RET_EPERM                   = 0x14, /* Incorrect Passphrase */
+    RET_EPROTONOSUPPORT         = 0x15, /* Unsupported Mailbox */
+    RET_EMSGSIZE                = 0x16, /* Invalid Payload Length */
+    RET_MAX                     = 0x17
+};
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
2.29.2


