Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0412AE877
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 06:53:35 +0100 (CET)
Received: from localhost ([::1]:60252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcj4Y-00047E-9C
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 00:53:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kciyv-00046W-8q
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 00:47:45 -0500
Received: from mga14.intel.com ([192.55.52.115]:60780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kciyr-0008P5-OW
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 00:47:44 -0500
IronPort-SDR: +fHL14NUPXypwxFSE2FWRMeLSkkq0+Sf8sZws7HVO3uSIAsQ5lw7jn6tbc70f+bl3STMxn7khw
 4mSkvSdVzuGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="169314667"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="169314667"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:31 -0800
IronPort-SDR: yzwp4RLQXo1surbl2W2NnVgIBIHQMJm7I3RalB3TSr0zD0Qh8u5NtIgMqsCWsQKlaxYXVQSsgA
 S5fC1iKTIpmw==
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="308710410"
Received: from hccoutan-mobl1.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.131.159])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:30 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 07/25] hw/cxl/device: Implement basic mailbox (8.2.8.4)
Date: Tue, 10 Nov 2020 21:47:06 -0800
Message-Id: <20201111054724.794888-8-ben.widawsky@intel.com>
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

This is the beginning of implementing mailbox support for CXL 2.0
devices.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 hw/cxl/cxl-device-utils.c   | 131 ++++++++++++++++++++++++++++++++++++
 hw/cxl/cxl-mailbox-utils.c  |  93 +++++++++++++++++++++++++
 hw/cxl/meson.build          |   1 +
 include/hw/cxl/cxl.h        |   3 +
 include/hw/cxl/cxl_device.h |  10 ++-
 5 files changed, 237 insertions(+), 1 deletion(-)
 create mode 100644 hw/cxl/cxl-mailbox-utils.c

diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
index 78144e103c..aec8b0d421 100644
--- a/hw/cxl/cxl-device-utils.c
+++ b/hw/cxl/cxl-device-utils.c
@@ -55,6 +55,123 @@ static uint64_t dev_reg_read(void *opaque, hwaddr offset, unsigned size)
     return ldn_le_p(&retval, size);
 }
 
+static uint64_t mailbox_reg_read(void *opaque, hwaddr offset, unsigned size)
+{
+    CXLDeviceState *cxl_dstate = opaque;
+
+    switch (size) {
+    case 4:
+        if (unlikely(offset & (sizeof(uint32_t) - 1))) {
+            qemu_log_mask(LOG_UNIMP, "Unaligned register read\n");
+            return 0;
+        }
+        break;
+    case 8:
+        if (unlikely(offset & (sizeof(uint64_t) - 1))) {
+            qemu_log_mask(LOG_UNIMP, "Unaligned register read\n");
+            return 0;
+        }
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%uB component register read\n", size);
+        return 0;
+    }
+
+    return ldn_le_p(cxl_dstate->mbox_reg_state + offset, size);
+}
+
+static void mailbox_mem_writel(uint32_t *reg_state, hwaddr offset,
+                               uint64_t value)
+{
+    switch (offset) {
+    case A_CXL_DEV_MAILBOX_CTRL:
+        /* fallthrough */
+    case A_CXL_DEV_MAILBOX_CAP:
+        /* RO register */
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s Unexpected 32-bit access to 0x%" PRIx64 " (WI)\n",
+                      __func__, offset);
+        break;
+    }
+
+    stl_le_p((uint8_t *)reg_state + offset, value);
+}
+
+static void mailbox_mem_writeq(uint64_t *reg_state, hwaddr offset,
+                               uint64_t value)
+{
+    switch (offset) {
+    case A_CXL_DEV_MAILBOX_CMD:
+        break;
+    case A_CXL_DEV_BG_CMD_STS:
+        /* BG not supported */
+        /* fallthrough */
+    case A_CXL_DEV_MAILBOX_STS:
+        /* Read only register, will get updated by the state machine */
+        return;
+    case A_CXL_DEV_MAILBOX_CAP:
+    case A_CXL_DEV_MAILBOX_CTRL:
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s Unexpected 64-bit access to 0x%" PRIx64 " (WI)\n",
+                      __func__, offset);
+        return;
+    }
+
+    stq_le_p((uint8_t *)reg_state + offset, value);
+}
+
+static void mailbox_reg_write(void *opaque, hwaddr offset, uint64_t value,
+                              unsigned size)
+{
+    CXLDeviceState *cxl_dstate = opaque;
+
+    /*
+     * Lock is needed to prevent concurrent writes as well as to prevent writes
+     * coming in while the firmware is processing. Without background commands
+     * or the second mailbox implemented, this serves no purpose since the
+     * memory access is synchronized at a higher level (per memory region).
+     */
+    RCU_READ_LOCK_GUARD();
+
+    switch (size) {
+    case 4:
+        if (unlikely(offset & (sizeof(uint32_t) - 1))) {
+            qemu_log_mask(LOG_UNIMP, "Unaligned register read\n");
+            return;
+        }
+        mailbox_mem_writel(cxl_dstate->mbox_reg_state32, offset, value);
+        break;
+    case 8:
+        if (unlikely(offset & (sizeof(uint64_t) - 1))) {
+            qemu_log_mask(LOG_UNIMP, "Unaligned register read\n");
+            return;
+        }
+        mailbox_mem_writeq(cxl_dstate->mbox_reg_state64, offset, value);
+        break;
+    }
+
+    if (ARRAY_FIELD_EX32(cxl_dstate->mbox_reg_state32, CXL_DEV_MAILBOX_CTRL,
+                         DOORBELL))
+        process_mailbox(cxl_dstate);
+}
+
+static const MemoryRegionOps mailbox_ops = {
+    .read = mailbox_reg_read,
+    .write = mailbox_reg_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
+};
+
 static const MemoryRegionOps dev_ops = {
     .read = dev_reg_read,
     .write = NULL,
@@ -94,12 +211,23 @@ void cxl_device_register_block_init(Object *obj, CXLDeviceState *cxl_dstate)
                           "cap-array", CXL_DEVICE_REGISTERS_OFFSET - 0);
     memory_region_init_io(&cxl_dstate->device, obj, &dev_ops, cxl_dstate,
                           "device-status", CXL_DEVICE_REGISTERS_LENGTH);
+    memory_region_init_io(&cxl_dstate->mailbox, obj, &mailbox_ops, cxl_dstate,
+                          "mailbox", CXL_MAILBOX_REGISTERS_LENGTH);
 
     memory_region_add_subregion(&cxl_dstate->device_registers, 0,
                                 &cxl_dstate->caps);
     memory_region_add_subregion(&cxl_dstate->device_registers,
                                 CXL_DEVICE_REGISTERS_OFFSET,
                                 &cxl_dstate->device);
+    memory_region_add_subregion(&cxl_dstate->device_registers,
+                                CXL_MAILBOX_REGISTERS_OFFSET, &cxl_dstate->mailbox);
+}
+
+static void mailbox_init_common(uint32_t *mbox_regs)
+{
+    /* 2048 payload size, with no interrupt or background support */
+    ARRAY_FIELD_DP32(mbox_regs, CXL_DEV_MAILBOX_CAP, PAYLOAD_SIZE,
+                     CXL_MAILBOX_PAYLOAD_SHIFT);
 }
 
 void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
@@ -113,4 +241,7 @@ void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
     ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY2, CAP_COUNT, cap_count);
 
     cxl_device_cap_init(cxl_dstate, DEVICE, 1);
+    cxl_device_cap_init(cxl_dstate, MAILBOX, 2);
+
+    mailbox_init_common(cxl_dstate->mbox_reg_state32);
 }
diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
new file mode 100644
index 0000000000..2d1b0ef9e4
--- /dev/null
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -0,0 +1,93 @@
+/*
+ * CXL Utility library for mailbox interface
+ *
+ * Copyright(C) 2020 Intel Corporation.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2. See the
+ * COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/pci/pci.h"
+#include "hw/cxl/cxl.h"
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
+void process_mailbox(CXLDeviceState *cxl_dstate)
+{
+    uint16_t ret = RET_SUCCESS;
+    uint32_t ret_len = 0;
+    uint64_t status_reg;
+
+    /*
+     * current state of mailbox interface
+     *  uint32_t mbox_cap_reg = cxl_dstate->reg_state32[R_CXL_DEV_MAILBOX_CAP];
+     *  uint32_t mbox_ctrl_reg = cxl_dstate->reg_state32[R_CXL_DEV_MAILBOX_CTRL];
+     *  uint64_t status_reg = *(uint64_t *)&cxl_dstate->reg_state[A_CXL_DEV_MAILBOX_STS];
+     */
+    uint64_t command_reg =
+        *(uint64_t *)&cxl_dstate->mbox_reg_state[A_CXL_DEV_MAILBOX_CMD];
+
+    /* Check if we have to do anything */
+    if (!ARRAY_FIELD_EX32(cxl_dstate->mbox_reg_state32, CXL_DEV_MAILBOX_CTRL, DOORBELL)) {
+        qemu_log_mask(LOG_UNIMP, "Corrupt internal state for firmware\n");
+        return;
+    }
+
+    uint8_t cmd_set = FIELD_EX64(command_reg, CXL_DEV_MAILBOX_CMD, COMMAND_SET);
+    uint8_t cmd = FIELD_EX64(command_reg, CXL_DEV_MAILBOX_CMD, COMMAND);
+    (void)cmd;
+    switch (cmd_set) {
+    default:
+        ret = RET_ENOTSUP;
+    }
+
+    /*
+     * Set the return code
+     * XXX: it's a 64b register, but we're not setting the vendor, so we can get
+     * away with this
+     */
+    status_reg = FIELD_DP64(0, CXL_DEV_MAILBOX_STS, ERRNO, ret);
+
+    /*
+     * Set the return length
+     */
+    command_reg = FIELD_DP64(command_reg, CXL_DEV_MAILBOX_CMD, COMMAND_SET, 0);
+    command_reg = FIELD_DP64(command_reg, CXL_DEV_MAILBOX_CMD, COMMAND, 0);
+    command_reg = FIELD_DP64(command_reg, CXL_DEV_MAILBOX_CMD, LENGTH, ret_len);
+
+    stq_le_p(cxl_dstate->mbox_reg_state + A_CXL_DEV_MAILBOX_CMD, command_reg);
+    stq_le_p(cxl_dstate->mbox_reg_state + A_CXL_DEV_MAILBOX_STS, status_reg);
+
+    /* Tell the host we're done */
+    ARRAY_FIELD_DP32(cxl_dstate->mbox_reg_state32, CXL_DEV_MAILBOX_CTRL,
+                     DOORBELL, 0);
+}
+
diff --git a/hw/cxl/meson.build b/hw/cxl/meson.build
index 47154d6850..0eca715d10 100644
--- a/hw/cxl/meson.build
+++ b/hw/cxl/meson.build
@@ -1,4 +1,5 @@
 softmmu_ss.add(when: 'CONFIG_CXL', if_true: files(
   'cxl-component-utils.c',
   'cxl-device-utils.c',
+  'cxl-mailbox-utils.c',
 ))
diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index 23f52c4cf9..362cda40de 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -14,5 +14,8 @@
 #include "cxl_component.h"
 #include "cxl_device.h"
 
+#define COMPONENT_REG_BAR_IDX 0
+#define DEVICE_REG_BAR_IDX 2
+
 #endif
 
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 2c674fdc9c..df00998def 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -87,6 +87,11 @@ typedef struct cxl_device_state {
         uint8_t caps_reg_state[CXL_DEVICE_CAP_REG_SIZE * 4]; /* ARRAY + 3 CAPS */
         uint32_t caps_reg_state32[0];
     };
+    union {
+        uint8_t mbox_reg_state[CXL_MAILBOX_REGISTERS_LENGTH];
+        uint32_t mbox_reg_state32[0];
+        uint64_t mbox_reg_state64[0];
+    };
 } CXLDeviceState;
 
 /* Initialize the register block for a device */
@@ -127,6 +132,8 @@ CXL_DEVICE_CAPABILITY_HEADER_REGISTER(DEVICE, CXL_DEVICE_CAP_HDR1_OFFSET)
 CXL_DEVICE_CAPABILITY_HEADER_REGISTER(MAILBOX, CXL_DEVICE_CAP_HDR1_OFFSET + \
                                                CXL_DEVICE_CAP_REG_SIZE)
 
+void process_mailbox(CXLDeviceState *cxl_dstate);
+
 #define cxl_device_cap_init(dstate, reg, cap_id)                                   \
     do {                                                                           \
         uint32_t *cap_hdrs = dstate->caps_reg_state32;                             \
@@ -155,7 +162,8 @@ REG32(CXL_DEV_MAILBOX_CTRL, 4)
     FIELD(CXL_DEV_MAILBOX_CTRL, BG_INT_EN, 2, 1)
 
 REG32(CXL_DEV_MAILBOX_CMD, 8)
-    FIELD(CXL_DEV_MAILBOX_CMD, OP, 0, 16)
+    FIELD(CXL_DEV_MAILBOX_CMD, COMMAND, 0, 8)
+    FIELD(CXL_DEV_MAILBOX_CMD, COMMAND_SET, 8, 8)
     FIELD(CXL_DEV_MAILBOX_CMD, LENGTH, 16, 20)
 
 /* XXX: actually a 64b register */
-- 
2.29.2


