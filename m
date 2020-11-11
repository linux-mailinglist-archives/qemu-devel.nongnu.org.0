Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A06292AE86E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 06:51:35 +0100 (CET)
Received: from localhost ([::1]:51964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcj2c-0000fn-LP
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 00:51:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kciyt-00041F-6N
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 00:47:43 -0500
Received: from mga14.intel.com ([192.55.52.115]:60776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kciyq-0008P1-Oc
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 00:47:42 -0500
IronPort-SDR: ER3cOOPU0a/0ECIY645lEvJnUAsyZZTsx1u1apNFuPxC5n++VXvAh5CYCHGDBxUHUf5Xv4fhRC
 M0EKBHp46WIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="169314666"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="169314666"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:30 -0800
IronPort-SDR: F4ONr6umLwyzCoKegRyJEYbsTAXvkPQfCSztC1Gr8pEsiHFHzq3WG0DhsqoObsfI+W7067EsVU
 RBiOCIjBZTUQ==
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="308710406"
Received: from hccoutan-mobl1.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.131.159])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:30 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 06/25] hw/cxl/device: Add device status (8.2.8.3)
Date: Tue, 10 Nov 2020 21:47:05 -0800
Message-Id: <20201111054724.794888-7-ben.widawsky@intel.com>
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

This implements the CXL device status registers from 8.2.8.3.1 in the
CXL 2.0 specification. It is capability ID 0001h.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 hw/cxl/cxl-device-utils.c   | 45 +++++++++++++++++++++++++++++++++-
 include/hw/cxl/cxl_device.h | 49 ++++++++++++-------------------------
 2 files changed, 60 insertions(+), 34 deletions(-)

diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
index a391bb15c6..78144e103c 100644
--- a/hw/cxl/cxl-device-utils.c
+++ b/hw/cxl/cxl-device-utils.c
@@ -33,6 +33,42 @@ static uint64_t caps_reg_read(void *opaque, hwaddr offset, unsigned size)
     return ldn_le_p(cxl_dstate->caps_reg_state + offset, size);
 }
 
+static uint64_t dev_reg_read(void *opaque, hwaddr offset, unsigned size)
+{
+    uint64_t retval = 0;
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
@@ -56,18 +92,25 @@ void cxl_device_register_block_init(Object *obj, CXLDeviceState *cxl_dstate)
 
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
 }
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 491eca6e05..2c674fdc9c 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -127,6 +127,22 @@ CXL_DEVICE_CAPABILITY_HEADER_REGISTER(DEVICE, CXL_DEVICE_CAP_HDR1_OFFSET)
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
@@ -138,43 +154,10 @@ REG32(CXL_DEV_MAILBOX_CTRL, 4)
     FIELD(CXL_DEV_MAILBOX_CTRL, INT_EN, 1, 2)
     FIELD(CXL_DEV_MAILBOX_CTRL, BG_INT_EN, 2, 1)
 
-enum {
-    CXL_CMD_EVENTS              = 0x1,
-    CXL_CMD_IDENTIFY            = 0x40,
-};
-
 REG32(CXL_DEV_MAILBOX_CMD, 8)
     FIELD(CXL_DEV_MAILBOX_CMD, OP, 0, 16)
     FIELD(CXL_DEV_MAILBOX_CMD, LENGTH, 16, 20)
 
-/* 8.2.8.4.5.1 Command Return Codes */
-enum {
-    RET_SUCCESS                 = 0x0,
-    RET_BG_STARTED              = 0x1, /* Background Command Started */
-    RET_EINVAL                  = 0x2, /* Invalid Input */
-    RET_ENOTSUP                 = 0x3, /* Unsupported */
-    RET_ENODEV                  = 0x4, /* Internal Error */
-    RET_ERESTART                = 0x5, /* Retry Required */
-    RET_EBUSY                   = 0x6, /* Busy */
-    RET_MEDIA_DISABLED          = 0x7, /* Media Disabled */
-    RET_FW_EBUSY                = 0x8, /* FW Transfer in Progress */
-    RET_FW_OOO                  = 0x9, /* FW Transfer Out of Order */
-    RET_FW_AUTH                 = 0xa, /* FW Authentication Failed */
-    RET_FW_EBADSLT              = 0xb, /* Invalid Slot */
-    RET_FW_ROLLBACK             = 0xc, /* Activation Failed, FW Rolled Back */
-    RET_FW_REBOOT               = 0xd, /* Activation Failed, Cold Reset Required */
-    RET_ENOENT                  = 0xe, /* Invalid Handle */
-    RET_EFAULT                  = 0xf, /* Invalid Physical Address */
-    RET_POISON_E2BIG            = 0x10, /* Inject Poison Limit Reached */
-    RET_EIO                     = 0x11, /* Permanent Media Failure */
-    RET_ECANCELED               = 0x12, /* Aborted */
-    RET_EACCESS                 = 0x13, /* Invalid Security State */
-    RET_EPERM                   = 0x14, /* Incorrect Passphrase */
-    RET_EPROTONOSUPPORT         = 0x15, /* Unsupported Mailbox */
-    RET_EMSGSIZE                = 0x16, /* Invalid Payload Length */
-    RET_MAX                     = 0x17
-};
-
 /* XXX: actually a 64b register */
 REG32(CXL_DEV_MAILBOX_STS, 0x10)
     FIELD(CXL_DEV_MAILBOX_STS, BG_OP, 0, 1)
-- 
2.29.2


