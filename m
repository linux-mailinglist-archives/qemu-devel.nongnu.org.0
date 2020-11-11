Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E82952AE876
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 06:53:32 +0100 (CET)
Received: from localhost ([::1]:60028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcj4V-00041M-WE
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 00:53:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kciyw-00049c-GB
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 00:47:46 -0500
Received: from mga14.intel.com ([192.55.52.115]:60768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kciys-0008O5-TY
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 00:47:46 -0500
IronPort-SDR: WHkb75IOit6NKvWzUdy1cc69PfCzDE6a10vEwe5k228GuB1MV089Fv/6bT37d+uFaoKn7lKucl
 JwCGCOs93EWA==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="169314668"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="169314668"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:31 -0800
IronPort-SDR: lfuWlbRfTIsay516OJrP8XTvxpmWHU8iIG0JLkQ1XsKTP8h9yZ8X0Xz9ztnLEdREX0P5ihwwFc
 /LYLYrn6YjJw==
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="308710413"
Received: from hccoutan-mobl1.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.131.159])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:31 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 08/25] hw/cxl/device: Add memory devices (8.2.8.5)
Date: Tue, 10 Nov 2020 21:47:07 -0800
Message-Id: <20201111054724.794888-9-ben.widawsky@intel.com>
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

Memory devices implement extra capabilities on top of CXL devices. This
adds support for that.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 hw/cxl/cxl-device-utils.c   | 48 ++++++++++++++++++++++++++++++++++++-
 hw/cxl/cxl-mailbox-utils.c  | 48 ++++++++++++++++++++++++++++++++++++-
 include/hw/cxl/cxl_device.h | 15 ++++++++++++
 3 files changed, 109 insertions(+), 2 deletions(-)

diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
index aec8b0d421..6544a68567 100644
--- a/hw/cxl/cxl-device-utils.c
+++ b/hw/cxl/cxl-device-utils.c
@@ -158,6 +158,45 @@ static void mailbox_reg_write(void *opaque, hwaddr offset, uint64_t value,
         process_mailbox(cxl_dstate);
 }
 
+static uint64_t mdev_reg_read(void *opaque, hwaddr offset, unsigned size)
+{
+    uint64_t retval = 0;
+
+    retval = FIELD_DP64(retval, CXL_MEM_DEV_STS, MEDIA_STATUS, 1);
+    retval = FIELD_DP64(retval, CXL_MEM_DEV_STS, MBOX_READY, 1);
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
+    }
+
+    return ldn_le_p(&retval, size);
+}
+
+static const MemoryRegionOps mdev_ops = {
+    .read = mdev_reg_read,
+    .write = NULL,
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
 static const MemoryRegionOps mailbox_ops = {
     .read = mailbox_reg_read,
     .write = mailbox_reg_write,
@@ -213,6 +252,9 @@ void cxl_device_register_block_init(Object *obj, CXLDeviceState *cxl_dstate)
                           "device-status", CXL_DEVICE_REGISTERS_LENGTH);
     memory_region_init_io(&cxl_dstate->mailbox, obj, &mailbox_ops, cxl_dstate,
                           "mailbox", CXL_MAILBOX_REGISTERS_LENGTH);
+    memory_region_init_io(&cxl_dstate->memory_device, obj, &mdev_ops,
+                          cxl_dstate, "memory device caps",
+                          CXL_MEMORY_DEVICE_REGISTERS_LENGTH);
 
     memory_region_add_subregion(&cxl_dstate->device_registers, 0,
                                 &cxl_dstate->caps);
@@ -221,6 +263,9 @@ void cxl_device_register_block_init(Object *obj, CXLDeviceState *cxl_dstate)
                                 &cxl_dstate->device);
     memory_region_add_subregion(&cxl_dstate->device_registers,
                                 CXL_MAILBOX_REGISTERS_OFFSET, &cxl_dstate->mailbox);
+    memory_region_add_subregion(&cxl_dstate->device_registers,
+                                CXL_MEMORY_DEVICE_REGISTERS_OFFSET,
+                                &cxl_dstate->memory_device);
 }
 
 static void mailbox_init_common(uint32_t *mbox_regs)
@@ -233,7 +278,7 @@ static void mailbox_init_common(uint32_t *mbox_regs)
 void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
 {
     uint32_t *cap_hdrs = cxl_dstate->caps_reg_state32;
-    const int cap_count = 1;
+    const int cap_count = 3;
 
     /* CXL Device Capabilities Array Register */
     ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_ID, 0);
@@ -242,6 +287,7 @@ void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
 
     cxl_device_cap_init(cxl_dstate, DEVICE, 1);
     cxl_device_cap_init(cxl_dstate, MAILBOX, 2);
+    cxl_device_cap_init(cxl_dstate, MEMORY_DEVICE, 0x4000);
 
     mailbox_init_common(cxl_dstate->mbox_reg_state32);
 }
diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index 2d1b0ef9e4..5d2579800e 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -12,6 +12,12 @@
 #include "hw/pci/pci.h"
 #include "hw/cxl/cxl.h"
 
+enum cxl_opcode {
+    CXL_EVENTS      = 0x1,
+    CXL_IDENTIFY    = 0x40,
+        #define CXL_IDENTIFY_MEMORY_DEVICE = 0x0
+};
+
 /* 8.2.8.4.5.1 Command Return Codes */
 enum {
     RET_SUCCESS                 = 0x0,
@@ -40,6 +46,43 @@ enum {
     RET_MAX                     = 0x17
 };
 
+/* 8.2.9.5.1.1 */
+static int cmd_set_identify(CXLDeviceState *cxl_dstate, uint8_t cmd,
+                            uint32_t *ret_size)
+{
+    struct identify {
+        char fw_revision[0x10];
+        uint64_t total_capacity;
+        uint64_t volatile_capacity;
+        uint64_t persistent_capacity;
+        uint64_t partition_align;
+        uint16_t info_event_log_size;
+        uint16_t warning_event_log_size;
+        uint16_t failure_event_log_size;
+        uint16_t fatal_event_log_size;
+        uint32_t lsa_size;
+        uint8_t poison_list_max_mer[3];
+        uint16_t inject_poison_limit;
+        uint8_t poison_caps;
+        uint8_t qos_telemetry_caps;
+    } __attribute__((packed)) *id;
+    _Static_assert(sizeof(struct identify) == 0x43, "Bad identify size");
+
+    if (memory_region_size(cxl_dstate->pmem) < (256 << 20)) {
+        return RET_ENODEV;
+    }
+
+    /* PMEM only */
+    id = (struct identify *)((void *)cxl_dstate->mbox_reg_state +
+                             A_CXL_DEV_CMD_PAYLOAD);
+    snprintf(id->fw_revision, 0x10, "BWFW VERSION %02d", 0);
+    id->total_capacity = memory_region_size(cxl_dstate->pmem);
+    id->persistent_capacity = memory_region_size(cxl_dstate->pmem);
+
+    *ret_size = 0x43;
+    return RET_SUCCESS;
+}
+
 void process_mailbox(CXLDeviceState *cxl_dstate)
 {
     uint16_t ret = RET_SUCCESS;
@@ -63,8 +106,11 @@ void process_mailbox(CXLDeviceState *cxl_dstate)
 
     uint8_t cmd_set = FIELD_EX64(command_reg, CXL_DEV_MAILBOX_CMD, COMMAND_SET);
     uint8_t cmd = FIELD_EX64(command_reg, CXL_DEV_MAILBOX_CMD, COMMAND);
-    (void)cmd;
     switch (cmd_set) {
+    case CXL_IDENTIFY:
+        ret = cmd_set_identify(cxl_dstate, cmd, &ret_len);
+        /* Fill in payload here */
+        break;
     default:
         ret = RET_ENOTSUP;
     }
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index df00998def..2cb2a9af3c 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -69,6 +69,10 @@
 #define CXL_MAILBOX_REGISTERS_LENGTH \
     (CXL_MAILBOX_REGISTERS_SIZE + CXL_MAILBOX_MAX_PAYLOAD_SIZE)
 
+#define CXL_MEMORY_DEVICE_REGISTERS_OFFSET \
+    (CXL_MAILBOX_REGISTERS_OFFSET + CXL_MAILBOX_REGISTERS_LENGTH)
+#define CXL_MEMORY_DEVICE_REGISTERS_LENGTH 0x8
+
 typedef struct cxl_device_state {
     /* Boss container and caps registers */
     MemoryRegion device_registers;
@@ -76,6 +80,7 @@ typedef struct cxl_device_state {
     MemoryRegion caps;
     MemoryRegion device;
     MemoryRegion mailbox;
+    MemoryRegion memory_device;
 
     MemoryRegion *pmem;
     MemoryRegion *vmem;
@@ -131,6 +136,8 @@ REG32(CXL_DEV_CAP_ARRAY2, 4) /* We're going to pretend it's 64b */
 CXL_DEVICE_CAPABILITY_HEADER_REGISTER(DEVICE, CXL_DEVICE_CAP_HDR1_OFFSET)
 CXL_DEVICE_CAPABILITY_HEADER_REGISTER(MAILBOX, CXL_DEVICE_CAP_HDR1_OFFSET + \
                                                CXL_DEVICE_CAP_REG_SIZE)
+CXL_DEVICE_CAPABILITY_HEADER_REGISTER(MEMORY_DEVICE, CXL_DEVICE_CAP_HDR1_OFFSET + \
+                                                     CXL_DEVICE_CAP_REG_SIZE * 2)
 
 void process_mailbox(CXLDeviceState *cxl_dstate);
 
@@ -181,4 +188,12 @@ REG32(CXL_DEV_BG_CMD_STS, 0x18)
 
 REG32(CXL_DEV_CMD_PAYLOAD, 0x20)
 
+/* XXX: actually a 64b registers */
+REG32(CXL_MEM_DEV_STS, 0)
+    FIELD(CXL_MEM_DEV_STS, FATAL, 0, 1)
+    FIELD(CXL_MEM_DEV_STS, FW_HALT, 1, 1)
+    FIELD(CXL_MEM_DEV_STS, MEDIA_STATUS, 2, 2)
+    FIELD(CXL_MEM_DEV_STS, MBOX_READY, 4, 1)
+    FIELD(CXL_MEM_DEV_STS, RESET_NEEDED, 5, 3)
+
 #endif
-- 
2.29.2


