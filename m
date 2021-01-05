Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC072EB0C2
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:01:02 +0100 (CET)
Received: from localhost ([::1]:44018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwphX-0005F6-U8
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:00:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpau-0008M9-1R
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:54:04 -0500
Received: from mga11.intel.com ([192.55.52.93]:21251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpar-00012q-Bj
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:54:03 -0500
IronPort-SDR: zwazjJ27O9eaDNaj+jO6DW57kHO+DkqhrQAruz+RaBIfvS3U0ViBfMY7Cb/pGJQlmmHMzTvB0u
 3tsnRVkuk71Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="173629517"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="173629517"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:53:53 -0800
IronPort-SDR: 3oVm3chEoXL3fnQczInXJUssYu8MAnKDk/h9Tn/kUiWzb+YZPrelC8+RFmjFXPj+Z/6IYlbvsG
 G+IS9MT6tBdg==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="346337961"
Received: from tgeddam-mobl.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.140.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:53:53 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 08/32] hw/cxl/device: Add memory devices (8.2.8.5)
Date: Tue,  5 Jan 2021 08:52:59 -0800
Message-Id: <20210105165323.783725-9-ben.widawsky@intel.com>
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

Memory devices implement extra capabilities on top of CXL devices. This
adds support for that.

A large part of memory devices is the mailbox/command interface. All of
the mailbox handling is done in the mailbox-utils library. Longer term,
new CXL devices that are being emulated may want to handle commands
differently, and therefore would need a mechanism to opt in/out of the
specific generic handlers. As such, this is considered sufficient for
now, but may need more depth in the future.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 hw/cxl/cxl-device-utils.c   | 52 ++++++++++++++++++++++++++++++++++++-
 hw/cxl/cxl-mailbox-utils.c  | 24 +++++++++++++++++
 include/hw/cxl/cxl_device.h | 16 ++++++++++++
 3 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
index 642e3c2617..c515d45d20 100644
--- a/hw/cxl/cxl-device-utils.c
+++ b/hw/cxl/cxl-device-utils.c
@@ -132,6 +132,45 @@ static void mailbox_reg_write(void *opaque, hwaddr offset, uint64_t value,
         cxl_process_mailbox(cxl_dstate);
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
@@ -187,6 +226,9 @@ void cxl_device_register_block_init(Object *obj, CXLDeviceState *cxl_dstate)
                           "device-status", CXL_DEVICE_REGISTERS_LENGTH);
     memory_region_init_io(&cxl_dstate->mailbox, obj, &mailbox_ops, cxl_dstate,
                           "mailbox", CXL_MAILBOX_REGISTERS_LENGTH);
+    memory_region_init_io(&cxl_dstate->memory_device, obj, &mdev_ops,
+                          cxl_dstate, "memory device caps",
+                          CXL_MEMORY_DEVICE_REGISTERS_LENGTH);
 
     memory_region_add_subregion(&cxl_dstate->device_registers, 0,
                                 &cxl_dstate->caps);
@@ -196,6 +238,9 @@ void cxl_device_register_block_init(Object *obj, CXLDeviceState *cxl_dstate)
     memory_region_add_subregion(&cxl_dstate->device_registers,
                                 CXL_MAILBOX_REGISTERS_OFFSET,
                                 &cxl_dstate->mailbox);
+    memory_region_add_subregion(&cxl_dstate->device_registers,
+                                CXL_MEMORY_DEVICE_REGISTERS_OFFSET,
+                                &cxl_dstate->memory_device);
 }
 
 static void device_reg_init_common(CXLDeviceState *cxl_dstate) { }
@@ -208,10 +253,12 @@ static void mailbox_reg_init_common(CXLDeviceState *cxl_dstate)
     cxl_dstate->payload_size = CXL_MAILBOX_MAX_PAYLOAD_SIZE;
 }
 
+static void memdev_reg_init_common(CXLDeviceState *cxl_dstate) { }
+
 void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
 {
     uint32_t *cap_hdrs = cxl_dstate->caps_reg_state32;
-    const int cap_count = 2;
+    const int cap_count = 3;
 
     /* CXL Device Capabilities Array Register */
     ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_ID, 0);
@@ -224,5 +271,8 @@ void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
     cxl_device_cap_init(cxl_dstate, MAILBOX, 2);
     mailbox_reg_init_common(cxl_dstate);
 
+    cxl_device_cap_init(cxl_dstate, MEMORY_DEVICE, 0x4000);
+    memdev_reg_init_common(cxl_dstate);
+
     assert(cxl_initialize_mailbox(cxl_dstate) == 0);
 }
diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index 3a39c936de..0e94f5a95f 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -81,6 +81,30 @@ struct cxl_cmd {
                                CXLDeviceState *cxl_dstate, uint16_t *len)
 #define declare_mailbox_handler(name) define_mailbox_handler(name)
 
+#define define_mailbox_handler_zeroed(name, size)                         \
+    uint16_t __zero##name = size;                                         \
+    static ret_code cmd_##name(struct cxl_cmd *cmd,                       \
+                               CXLDeviceState *cxl_dstate, uint16_t *len) \
+    {                                                                     \
+        *len = __zero##name;                                              \
+        memset(cmd->payload, 0, *len);                                    \
+        return CXL_MBOX_SUCCESS;                                          \
+    }
+#define define_mailbox_handler_const(name, data)                          \
+    static ret_code cmd_##name(struct cxl_cmd *cmd,                       \
+                               CXLDeviceState *cxl_dstate, uint16_t *len) \
+    {                                                                     \
+        *len = sizeof(data);                                              \
+        memcpy(cmd->payload, data, *len);                                 \
+        return CXL_MBOX_SUCCESS;                                          \
+    }
+#define define_mailbox_handler_nop(name)                                  \
+    static ret_code cmd_##name(struct cxl_cmd *cmd,                       \
+                               CXLDeviceState *cxl_dstate, uint16_t *len) \
+    {                                                                     \
+        return CXL_MBOX_SUCCESS;                                          \
+    }
+
 #define CXL_CMD(s, c, in, cel_effect) \
     [s][c] = { stringify(s##_##c), cmd_##s##_##c, in, cel_effect }
 
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index bdf990cec2..dd3f4572aa 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -69,11 +69,16 @@
 #define CXL_MAILBOX_REGISTERS_LENGTH \
     (CXL_MAILBOX_REGISTERS_SIZE + CXL_MAILBOX_MAX_PAYLOAD_SIZE)
 
+#define CXL_MEMORY_DEVICE_REGISTERS_OFFSET \
+    (CXL_MAILBOX_REGISTERS_OFFSET + CXL_MAILBOX_REGISTERS_LENGTH)
+#define CXL_MEMORY_DEVICE_REGISTERS_LENGTH 0x8
+
 typedef struct cxl_device_state {
     /* Main register container */
     MemoryRegion device_registers;
 
     MemoryRegion device;
+    MemoryRegion memory_device;
     struct {
         MemoryRegion caps;
         union {
@@ -133,6 +138,9 @@ REG32(CXL_DEV_CAP_ARRAY2, 4) /* We're going to pretend it's 64b */
 CXL_DEVICE_CAPABILITY_HEADER_REGISTER(DEVICE, CXL_DEVICE_CAP_HDR1_OFFSET)
 CXL_DEVICE_CAPABILITY_HEADER_REGISTER(MAILBOX, CXL_DEVICE_CAP_HDR1_OFFSET + \
                                                CXL_DEVICE_CAP_REG_SIZE)
+CXL_DEVICE_CAPABILITY_HEADER_REGISTER(MEMORY_DEVICE,
+                                      CXL_DEVICE_CAP_HDR1_OFFSET +
+                                          CXL_DEVICE_CAP_REG_SIZE * 2)
 
 int cxl_initialize_mailbox(CXLDeviceState *cxl_dstate);
 void cxl_process_mailbox(CXLDeviceState *cxl_dstate);
@@ -185,4 +193,12 @@ REG32(CXL_DEV_BG_CMD_STS, 0x18)
 
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
2.30.0


