Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620FC653B45
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 05:27:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8D8r-0007qD-Qh; Wed, 21 Dec 2022 23:25:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1p8D8j-0007oH-Ab
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 23:25:06 -0500
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1p8D8h-00015K-9X
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 23:25:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671683103; x=1703219103;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=JQbNYS9g3BUlUil65num8zsltfxj8rTJzgpHrifcVG4=;
 b=gaduflrfuyd0x9B30NVg2112q5qOJXE+7NIWCmVdps1WsocgjAUmaJKM
 QPEJNIid2oDSwMGPqh31qx1jKDq/n/Kc/LtXSrPibBy2x0ji3MGi/Hgvz
 5yp627cQTIiJht+gRcQvAotf0FIF7gIz6IEvALOKz0loM7aaM23PqL6Cq
 nfo1y8+jTvVsA7pu1+5npTLXPfva9alDOBCBfv4Hv1wlZmmqNu/o2R9B+
 FxzHMKG1UG8920Ev+ZJQ+uwF9oFAxKkF7HYp12sPNPgpV2EimYWUIF4el
 WzCXaHB1i+J5CTjPwIlLQE6RCMQqs6IgcXSJNKh4rOgg6dokH8hhmn9sZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="321957606"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; d="scan'208";a="321957606"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 20:24:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="601733199"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; d="scan'208";a="601733199"
Received: from iweiny-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.20.211])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 20:24:57 -0800
From: Ira Weiny <ira.weiny@intel.com>
Date: Wed, 21 Dec 2022 20:24:34 -0800
Subject: [PATCH v2 4/8] hw/cxl/events: Add event status register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221221-ira-cxl-events-2022-11-17-v2-4-2ce2ecc06219@intel.com>
References: <20221221-ira-cxl-events-2022-11-17-v2-0-2ce2ecc06219@intel.com>
In-Reply-To: <20221221-ira-cxl-events-2022-11-17-v2-0-2ce2ecc06219@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>
X-Mailer: b4 0.11.0-dev-141d4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1671683093; l=8331;
 i=ira.weiny@intel.com; s=20221211; h=from:subject:message-id;
 bh=JQbNYS9g3BUlUil65num8zsltfxj8rTJzgpHrifcVG4=;
 b=+hHixGtes5MMCUbZNe07rsPMoFwG/vdah48eKi5inBtaHumT1zZ6NfRo6iWobpA/1v6gKl4wjv+M
 oZ8ODPiiB1abajL7169Jp2dTCRVhU/BunmIpDy2siwLlEs8XJ392
X-Developer-Key: i=ira.weiny@intel.com; a=ed25519;
 pk=noldbkG+Wp1qXRrrkfY1QJpDf7QsOEthbOT7vm0PqsE=
Received-SPF: pass client-ip=134.134.136.65; envelope-from=ira.weiny@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The device status register block was defined.  However, there were no
individual registers nor any data wired up.

Define the event status register [CXL 3.0; 8.2.8.3.1] as part of the
device status register block.  Wire up the register and initialize the
event status for each log.

To support CXL 3.0 the version of the device status register block needs
to be 2.  Change the macro to allow for setting the version.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
Changes from RFC:
	New patch to cover this register which was not being used
	before.
---
 hw/cxl/cxl-device-utils.c   | 50 +++++++++++++++++++++++++++++++++++++--------
 include/hw/cxl/cxl_device.h | 23 ++++++++++++++++++---
 include/hw/cxl/cxl_events.h | 28 +++++++++++++++++++++++++
 3 files changed, 90 insertions(+), 11 deletions(-)

diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
index 34697064714e..7f29d40be04a 100644
--- a/hw/cxl/cxl-device-utils.c
+++ b/hw/cxl/cxl-device-utils.c
@@ -41,7 +41,20 @@ static uint64_t caps_reg_read(void *opaque, hwaddr offset, unsigned size)
 
 static uint64_t dev_reg_read(void *opaque, hwaddr offset, unsigned size)
 {
-    return 0;
+    CXLDeviceState *cxl_dstate = opaque;
+
+    switch (size) {
+    case 1:
+        return cxl_dstate->dev_reg_state[offset];
+    case 2:
+        return cxl_dstate->dev_reg_state16[offset / size];
+    case 4:
+        return cxl_dstate->dev_reg_state32[offset / size];
+    case 8:
+        return cxl_dstate->dev_reg_state64[offset / size];
+    default:
+        g_assert_not_reached();
+    }
 }
 
 static uint64_t mailbox_reg_read(void *opaque, hwaddr offset, unsigned size)
@@ -236,7 +249,28 @@ void cxl_device_register_block_init(Object *obj, CXLDeviceState *cxl_dstate)
                                 &cxl_dstate->memory_device);
 }
 
-static void device_reg_init_common(CXLDeviceState *cxl_dstate) { }
+void cxl_event_set_status(CXLDeviceState *cxl_dstate,
+                          enum cxl_event_log_type log_type,
+                          bool available)
+{
+    if (available) {
+        cxl_dstate->event_status |= (1 << log_type);
+    } else {
+        cxl_dstate->event_status &= ~(1 << log_type);
+    }
+
+    ARRAY_FIELD_DP64(cxl_dstate->dev_reg_state64, CXL_DEV_EVENT_STATUS,
+                     EVENT_STATUS, cxl_dstate->event_status);
+}
+
+static void device_reg_init_common(CXLDeviceState *cxl_dstate)
+{
+    enum cxl_event_log_type log;
+
+    for (log = 0; log < CXL_EVENT_TYPE_MAX; log++) {
+        cxl_event_set_status(cxl_dstate, log, false);
+    }
+}
 
 static void mailbox_reg_init_common(CXLDeviceState *cxl_dstate)
 {
@@ -258,13 +292,13 @@ void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
     ARRAY_FIELD_DP64(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_VERSION, 1);
     ARRAY_FIELD_DP64(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_COUNT, cap_count);
 
-    cxl_device_cap_init(cxl_dstate, DEVICE_STATUS, 1);
+    cxl_device_cap_init(cxl_dstate, DEVICE_STATUS, 1, 2);
     device_reg_init_common(cxl_dstate);
 
-    cxl_device_cap_init(cxl_dstate, MAILBOX, 2);
+    cxl_device_cap_init(cxl_dstate, MAILBOX, 2, 1);
     mailbox_reg_init_common(cxl_dstate);
 
-    cxl_device_cap_init(cxl_dstate, MEMORY_DEVICE, 0x4000);
+    cxl_device_cap_init(cxl_dstate, MEMORY_DEVICE, 0x4000, 1);
     memdev_reg_init_common(cxl_dstate);
 
     cxl_initialize_mailbox(cxl_dstate, false);
@@ -280,13 +314,13 @@ void cxl_device_register_init_swcci(CXLDeviceState *cxl_dstate)
     ARRAY_FIELD_DP64(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_VERSION, 1);
     ARRAY_FIELD_DP64(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_COUNT, cap_count);
 
-    cxl_device_cap_init(cxl_dstate, DEVICE_STATUS, 1);
+    cxl_device_cap_init(cxl_dstate, DEVICE_STATUS, 1, 2);
     device_reg_init_common(cxl_dstate);
 
-    cxl_device_cap_init(cxl_dstate, MAILBOX, 2);
+    cxl_device_cap_init(cxl_dstate, MAILBOX, 2, 1);
     mailbox_reg_init_common(cxl_dstate);
 
-    cxl_device_cap_init(cxl_dstate, MEMORY_DEVICE, 0x4000);
+    cxl_device_cap_init(cxl_dstate, MEMORY_DEVICE, 0x4000, 1);
     memdev_reg_init_common(cxl_dstate);
 
     cxl_initialize_mailbox(cxl_dstate, true);
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 3be2e37b3e4c..7180fc225e29 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -147,7 +147,16 @@ typedef struct cxl_device_state {
 
     MemoryRegion cpmu_registers[CXL_NUM_CPMU_INSTANCES];
     /* mmio for device capabilities array - 8.2.8.2 */
-    MemoryRegion device;
+    struct {
+        MemoryRegion device;
+        union {
+            uint8_t dev_reg_state[CXL_DEVICE_STATUS_REGISTERS_LENGTH];
+            uint16_t dev_reg_state16[CXL_DEVICE_STATUS_REGISTERS_LENGTH / 2];
+            uint32_t dev_reg_state32[CXL_DEVICE_STATUS_REGISTERS_LENGTH / 4];
+            uint64_t dev_reg_state64[CXL_DEVICE_STATUS_REGISTERS_LENGTH / 8];
+        };
+        uint64_t event_status;
+    };
     MemoryRegion memory_device;
     struct {
         MemoryRegion caps;
@@ -197,6 +206,10 @@ void cxl_device_register_block_init(Object *obj, CXLDeviceState *dev);
 void cxl_device_register_init_common(CXLDeviceState *dev);
 void cxl_device_register_init_swcci(CXLDeviceState *dev);
 
+void cxl_event_set_status(CXLDeviceState *cxl_dstate,
+                          enum cxl_event_log_type log_type,
+                          bool available);
+
 /*
  * CXL 2.0 - 8.2.8.1 including errata F4
  * Documented as a 128 bit register, but 64 bit accesses and the second
@@ -241,7 +254,7 @@ CXL_DEVICE_CAPABILITY_HEADER_REGISTER(MEMORY_DEVICE,
 void cxl_initialize_mailbox(CXLDeviceState *cxl_dstate, bool switch_cci);
 void cxl_process_mailbox(CXLDeviceState *cxl_dstate);
 
-#define cxl_device_cap_init(dstate, reg, cap_id)                           \
+#define cxl_device_cap_init(dstate, reg, cap_id, ver)                      \
     do {                                                                   \
         uint32_t *cap_hdrs = dstate->caps_reg_state32;                     \
         int which = R_CXL_DEV_##reg##_CAP_HDR0;                            \
@@ -249,7 +262,7 @@ void cxl_process_mailbox(CXLDeviceState *cxl_dstate);
             FIELD_DP32(cap_hdrs[which], CXL_DEV_##reg##_CAP_HDR0,          \
                        CAP_ID, cap_id);                                    \
         cap_hdrs[which] = FIELD_DP32(                                      \
-            cap_hdrs[which], CXL_DEV_##reg##_CAP_HDR0, CAP_VERSION, 1);    \
+            cap_hdrs[which], CXL_DEV_##reg##_CAP_HDR0, CAP_VERSION, ver);  \
         cap_hdrs[which + 1] =                                              \
             FIELD_DP32(cap_hdrs[which + 1], CXL_DEV_##reg##_CAP_HDR1,      \
                        CAP_OFFSET, CXL_##reg##_REGISTERS_OFFSET);          \
@@ -258,6 +271,10 @@ void cxl_process_mailbox(CXLDeviceState *cxl_dstate);
                        CAP_LENGTH, CXL_##reg##_REGISTERS_LENGTH);          \
     } while (0)
 
+/* CXL 3.0 8.2.8.3.1 Event Status Register */
+REG64(CXL_DEV_EVENT_STATUS, 0)
+    FIELD(CXL_DEV_EVENT_STATUS, EVENT_STATUS, 0, 32)
+
 /* CXL 2.0 8.2.8.4.3 Mailbox Capabilities Register */
 REG32(CXL_DEV_MAILBOX_CAP, 0)
     FIELD(CXL_DEV_MAILBOX_CAP, PAYLOAD_SIZE, 0, 5)
diff --git a/include/hw/cxl/cxl_events.h b/include/hw/cxl/cxl_events.h
new file mode 100644
index 000000000000..7e0647ffb0e3
--- /dev/null
+++ b/include/hw/cxl/cxl_events.h
@@ -0,0 +1,28 @@
+/*
+ * QEMU CXL Events
+ *
+ * Copyright (c) 2022 Intel
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2. See the
+ * COPYING file in the top-level directory.
+ */
+
+#ifndef CXL_EVENTS_H
+#define CXL_EVENTS_H
+
+/*
+ * CXL rev 3.0 section 8.2.9.2.2; Table 8-49
+ *
+ * Define these as the bit position for the event status register for ease of
+ * setting the status.
+ */
+enum cxl_event_log_type {
+    CXL_EVENT_TYPE_INFO          = 0,
+    CXL_EVENT_TYPE_WARN          = 1,
+    CXL_EVENT_TYPE_FAIL          = 2,
+    CXL_EVENT_TYPE_FATAL         = 3,
+    CXL_EVENT_TYPE_DYNAMIC_CAP   = 4,
+    CXL_EVENT_TYPE_MAX
+};
+
+#endif /* CXL_EVENTS_H */

-- 
2.38.1

