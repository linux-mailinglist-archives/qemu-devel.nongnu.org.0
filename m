Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD282EB0C9
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:01:30 +0100 (CET)
Received: from localhost ([::1]:44472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwpi5-0005QL-Iv
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:01:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpaq-0008Ek-Tq
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:54:00 -0500
Received: from mga11.intel.com ([192.55.52.93]:21251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpap-00012q-0x
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:54:00 -0500
IronPort-SDR: cHw9ilA4/IRPZAVqWOqrAM9qwhm7qrZRNVwFyl68QS3yGfjmfrrPRfo3J2kk/ozcKsmNlVIOk1
 RKaYZaaFCQkQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="173629506"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="173629506"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:53:52 -0800
IronPort-SDR: 1E6wytqtjdsc3cLE6NmQBKBcj00p7P8yhYzNu3ugoesSp6bfHJH+Cp0lgBwkR/XrCHPDLiieEV
 pkZuNM0GJZdg==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="346337946"
Received: from tgeddam-mobl.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.140.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:53:51 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 05/32] hw/cxl/device: Implement the CAP array
 (8.2.8.1-2)
Date: Tue,  5 Jan 2021 08:52:56 -0800
Message-Id: <20210105165323.783725-6-ben.widawsky@intel.com>
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

This implements all device MMIO up to the first capability .That
includes the CXL Device Capabilities Array Register, as well as all of
the CXL Device Capability Header Registers. The latter are filled in as
they are implemented in the following patches.

v2: Break out register alignment checks (Jonathan)

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 hw/cxl/cxl-device-utils.c | 72 +++++++++++++++++++++++++++++++++++++++
 hw/cxl/meson.build        |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 hw/cxl/cxl-device-utils.c

diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
new file mode 100644
index 0000000000..d1b1371e66
--- /dev/null
+++ b/hw/cxl/cxl-device-utils.c
@@ -0,0 +1,72 @@
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
+static int cxl_device_check_register_alignment(hwaddr offset, unsigned size)
+{
+    if (unlikely(offset & (size - 1))) {
+        return 1;
+    }
+
+    return 0;
+}
+
+static uint64_t caps_reg_read(void *opaque, hwaddr offset, unsigned size)
+{
+    CXLDeviceState *cxl_dstate = opaque;
+
+    if (cxl_device_check_register_alignment(offset, size)) {
+        qemu_log_mask(LOG_UNIMP, "Unaligned register read\n");
+        return 0;
+    }
+
+    return ldn_le_p(cxl_dstate->caps_reg_state + offset, size);
+}
+
+static const MemoryRegionOps caps_ops = {
+    .read = caps_reg_read,
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
+void cxl_device_register_block_init(Object *obj, CXLDeviceState *cxl_dstate)
+{
+    /* This will be a BAR, so needs to be rounded up to pow2 for PCI spec */
+    memory_region_init(
+        &cxl_dstate->device_registers, obj, "device-registers",
+        pow2ceil(CXL_MAILBOX_REGISTERS_LENGTH + CXL_MAILBOX_REGISTERS_OFFSET));
+
+    memory_region_init_io(&cxl_dstate->caps, obj, &caps_ops, cxl_dstate,
+                          "cap-array", CXL_DEVICE_REGISTERS_OFFSET - 0);
+
+    memory_region_add_subregion(&cxl_dstate->device_registers, 0,
+                                &cxl_dstate->caps);
+}
+
+void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
+{
+    uint32_t *cap_hdrs = cxl_dstate->caps_reg_state32;
+    const int cap_count = 0;
+
+    /* CXL Device Capabilities Array Register */
+    ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_ID, 0);
+    ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_VERSION, 1);
+    ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY2, CAP_COUNT, cap_count);
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
-- 
2.30.0


