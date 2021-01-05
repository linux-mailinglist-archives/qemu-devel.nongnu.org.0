Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FDA2EB0D8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:04:19 +0100 (CET)
Received: from localhost ([::1]:52996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwpko-0000w1-I9
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:04:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpar-0008GS-I4
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:54:01 -0500
Received: from mga11.intel.com ([192.55.52.93]:21248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpap-00012W-J5
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:54:01 -0500
IronPort-SDR: LJ9t86BsPZ7rv0kKae0uJ4bi4AwE+wcM7RJ6rdwaPFZFhmhdFz27c7Uzg03dc5uOKOCv4tUVpZ
 u24lhZYpgZsw==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="173629511"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="173629511"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:53:53 -0800
IronPort-SDR: DMTH/CKFYM2ywGITJmv/2lw/DhJ3HPYAFIuT7eb2h5flVNyAcJqxdGlUtKKd/Umvga5UL/YpjB
 9hacrm4bkKuA==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="346337953"
Received: from tgeddam-mobl.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.140.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:53:52 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 06/32] hw/cxl/device: Add device status (8.2.8.3)
Date: Tue,  5 Jan 2021 08:52:57 -0800
Message-Id: <20210105165323.783725-7-ben.widawsky@intel.com>
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

This implements the CXL device status registers from 8.2.8.3.1 in the
CXL 2.0 specification. It is capability ID 0001h.

v2: Use the reg alignment helper (Jonathan)
    Add stubbed device_reg_init_common() (Ben)

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 hw/cxl/cxl-device-utils.c   | 38 ++++++++++++++++++++++++++++++++++++-
 include/hw/cxl/cxl_device.h | 16 ++++++++++++++++
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
index d1b1371e66..b86e5466bd 100644
--- a/hw/cxl/cxl-device-utils.c
+++ b/hw/cxl/cxl-device-utils.c
@@ -32,6 +32,32 @@ static uint64_t caps_reg_read(void *opaque, hwaddr offset, unsigned size)
     return ldn_le_p(cxl_dstate->caps_reg_state + offset, size);
 }
 
+static uint64_t dev_reg_read(void *opaque, hwaddr offset, unsigned size)
+{
+    uint64_t retval = 0;
+
+    if (cxl_device_check_register_alignment(offset, size)) {
+        qemu_log_mask(LOG_UNIMP, "Unaligned register read\n");
+        return 0;
+    }
+
+    return ldn_le_p(&retval, size);
+}
+
+static const MemoryRegionOps dev_ops = {
+    .read = dev_reg_read,
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
 static const MemoryRegionOps caps_ops = {
     .read = caps_reg_read,
     .write = NULL,
@@ -55,18 +81,28 @@ void cxl_device_register_block_init(Object *obj, CXLDeviceState *cxl_dstate)
 
     memory_region_init_io(&cxl_dstate->caps, obj, &caps_ops, cxl_dstate,
                           "cap-array", CXL_DEVICE_REGISTERS_OFFSET - 0);
+    memory_region_init_io(&cxl_dstate->device, obj, &dev_ops, cxl_dstate,
+                          "device-status", CXL_DEVICE_REGISTERS_LENGTH);
 
     memory_region_add_subregion(&cxl_dstate->device_registers, 0,
                                 &cxl_dstate->caps);
+    memory_region_add_subregion(&cxl_dstate->device_registers,
+                                CXL_DEVICE_REGISTERS_OFFSET,
+                                &cxl_dstate->device);
 }
 
+static void device_reg_init_common(CXLDeviceState *cxl_dstate) { }
+
 void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
 {
     uint32_t *cap_hdrs = cxl_dstate->caps_reg_state32;
-    const int cap_count = 0;
+    const int cap_count = 1;
 
     /* CXL Device Capabilities Array Register */
     ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_ID, 0);
     ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_VERSION, 1);
     ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY2, CAP_COUNT, cap_count);
+
+    cxl_device_cap_init(cxl_dstate, DEVICE, 1);
+    device_reg_init_common(cxl_dstate);
 }
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 38af43c1a6..3380fc9e7a 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -122,6 +122,22 @@ CXL_DEVICE_CAPABILITY_HEADER_REGISTER(DEVICE, CXL_DEVICE_CAP_HDR1_OFFSET)
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


