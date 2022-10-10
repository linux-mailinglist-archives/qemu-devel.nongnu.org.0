Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7328E5FA7D5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 00:48:54 +0200 (CEST)
Received: from localhost ([::1]:58252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi1Zt-0004Zi-8k
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 18:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1oi1IB-0005z1-EW
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 18:30:36 -0400
Received: from mga02.intel.com ([134.134.136.20]:24672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1oi1I9-0005CM-2n
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 18:30:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665441033; x=1696977033;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FYIhp/lfplx+aqHt/7Dq3xswYQzfhxppIKNEfK/6qE8=;
 b=cBAk8IYvSfbVJrByFnM2hCVot4U8zKELZDW/IwoeZrMyv8MALHAJnpQI
 30tvGuyB0Ue0labYsqRwLfcJzt0PtW+++Llp3ha7H5pxW4EggudBb6HFG
 kQEIfqBWZo+qPWUIXgnUd6I7p5Yr49KQqHdxG2DGxU0NgJmib7h5lyNBu
 OGiShVgSE5PPDlUkC2GTObwFTxuaPIGvqMW50H49raU52FYsGToNee0dF
 ATzZXg+DFESnC1GNOP79T+8q9bTc9gYucIdQv80Shh51By0JiO7xh5lZk
 beqh8p7dUff8ArXrOCJ5A1UTrSJ2oZg/vOBwOujsWwtcaUOeG91Svz/sE g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="291661253"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="291661253"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 15:30:22 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="628457026"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="628457026"
Received: from iweiny-mobl.amr.corp.intel.com (HELO localhost) ([10.212.104.4])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 15:30:22 -0700
From: ira.weiny@intel.com
To: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Ira Weiny <ira.weiny@intel.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org
Subject: [RFC PATCH 6/6] hw/cxl/mailbox: Wire up Get/Set Event Interrupt policy
Date: Mon, 10 Oct 2022 15:29:44 -0700
Message-Id: <20221010222944.3923556-7-ira.weiny@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221010222944.3923556-1-ira.weiny@intel.com>
References: <20221010222944.3923556-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=ira.weiny@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 10 Oct 2022 18:44:32 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ira Weiny <ira.weiny@intel.com>

Replace the stubbed out CXL Get/Set Event interrupt policy mailbox
commands.  Enable those commands to control interrupts for each of the
event log types.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 hw/cxl/cxl-mailbox-utils.c  | 129 ++++++++++++++++++++++++++++++------
 include/hw/cxl/cxl_events.h |  21 ++++++
 2 files changed, 129 insertions(+), 21 deletions(-)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index df345f23a30c..52e8804c24ed 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -101,25 +101,6 @@ struct cxl_cmd {
     uint8_t *payload;
 };
 
-#define DEFINE_MAILBOX_HANDLER_ZEROED(name, size)                         \
-    uint16_t __zero##name = size;                                         \
-    static ret_code cmd_##name(struct cxl_cmd *cmd,                       \
-                               CXLDeviceState *cxl_dstate, uint16_t *len) \
-    {                                                                     \
-        *len = __zero##name;                                              \
-        memset(cmd->payload, 0, *len);                                    \
-        return CXL_MBOX_SUCCESS;                                          \
-    }
-#define DEFINE_MAILBOX_HANDLER_NOP(name)                                  \
-    static ret_code cmd_##name(struct cxl_cmd *cmd,                       \
-                               CXLDeviceState *cxl_dstate, uint16_t *len) \
-    {                                                                     \
-        return CXL_MBOX_SUCCESS;                                          \
-    }
-
-DEFINE_MAILBOX_HANDLER_ZEROED(events_get_interrupt_policy, 4);
-DEFINE_MAILBOX_HANDLER_NOP(events_set_interrupt_policy);
-
 static ret_code cmd_events_get_records(struct cxl_cmd *cmd,
                                        CXLDeviceState *cxlds,
                                        uint16_t *len)
@@ -218,6 +199,110 @@ static ret_code cmd_events_clear_records(struct cxl_cmd *cmd,
     return CXL_MBOX_SUCCESS;
 }
 
+static ret_code cmd_events_get_interrupt_policy(struct cxl_cmd *cmd,
+                                                CXLDeviceState *cxl_dstate,
+                                                uint16_t *len)
+{
+    struct cxl_event_interrupt_policy *policy;
+    struct cxl_event_log *log;
+
+    policy = (struct cxl_event_interrupt_policy *)cmd->payload;
+    memset(policy, 0, sizeof(*policy));
+
+    log = find_event_log(cxl_dstate, CXL_EVENT_TYPE_INFO);
+    if (log->irq_enabled) {
+        policy->info_settings = CXL_EVENT_INT_SETTING(log->irq_vec);
+    }
+
+    log = find_event_log(cxl_dstate, CXL_EVENT_TYPE_WARN);
+    if (log->irq_enabled) {
+        policy->warn_settings = CXL_EVENT_INT_SETTING(log->irq_vec);
+    }
+
+    log = find_event_log(cxl_dstate, CXL_EVENT_TYPE_FAIL);
+    if (log->irq_enabled) {
+        policy->failure_settings = CXL_EVENT_INT_SETTING(log->irq_vec);
+    }
+
+    log = find_event_log(cxl_dstate, CXL_EVENT_TYPE_FATAL);
+    if (log->irq_enabled) {
+        policy->fatal_settings = CXL_EVENT_INT_SETTING(log->irq_vec);
+    }
+
+    log = find_event_log(cxl_dstate, CXL_EVENT_TYPE_DYNAMIC_CAP);
+    if (log->irq_enabled) {
+        /* Dynamic Capacity borrows the same vector as info */
+        policy->dyn_cap_settings = CXL_INT_MSI_MSIX;
+    }
+
+    *len = sizeof(*policy);
+    return CXL_MBOX_SUCCESS;
+}
+
+static ret_code cmd_events_set_interrupt_policy(struct cxl_cmd *cmd,
+                                                CXLDeviceState *cxl_dstate,
+                                                uint16_t *len)
+{
+    struct cxl_event_interrupt_policy *policy;
+    struct cxl_event_log *log;
+
+    policy = (struct cxl_event_interrupt_policy *)cmd->payload;
+
+    log = find_event_log(cxl_dstate, CXL_EVENT_TYPE_INFO);
+    if ((policy->info_settings & CXL_EVENT_INT_MODE_MASK) ==
+                                                    CXL_INT_MSI_MSIX) {
+        log->irq_enabled = true;
+        log->irq_vec = cxl_dstate->event_vector[CXL_EVENT_TYPE_INFO];
+    } else {
+        log->irq_enabled = false;
+        log->irq_vec = 0;
+    }
+
+    log = find_event_log(cxl_dstate, CXL_EVENT_TYPE_WARN);
+    if ((policy->warn_settings & CXL_EVENT_INT_MODE_MASK) ==
+                                                    CXL_INT_MSI_MSIX) {
+        log->irq_enabled = true;
+        log->irq_vec = cxl_dstate->event_vector[CXL_EVENT_TYPE_WARN];
+    } else {
+        log->irq_enabled = false;
+        log->irq_vec = 0;
+    }
+
+    log = find_event_log(cxl_dstate, CXL_EVENT_TYPE_FAIL);
+    if ((policy->failure_settings & CXL_EVENT_INT_MODE_MASK) ==
+                                                    CXL_INT_MSI_MSIX) {
+        log->irq_enabled = true;
+        log->irq_vec = cxl_dstate->event_vector[CXL_EVENT_TYPE_FAIL];
+    } else {
+        log->irq_enabled = false;
+        log->irq_vec = 0;
+    }
+
+    log = find_event_log(cxl_dstate, CXL_EVENT_TYPE_FATAL);
+    if ((policy->fatal_settings & CXL_EVENT_INT_MODE_MASK) ==
+                                                    CXL_INT_MSI_MSIX) {
+        log->irq_enabled = true;
+        log->irq_vec = cxl_dstate->event_vector[CXL_EVENT_TYPE_FATAL];
+    } else {
+        log->irq_enabled = false;
+        log->irq_vec = 0;
+    }
+
+    log = find_event_log(cxl_dstate, CXL_EVENT_TYPE_DYNAMIC_CAP);
+    if ((policy->dyn_cap_settings & CXL_EVENT_INT_MODE_MASK) ==
+                                                    CXL_INT_MSI_MSIX) {
+        log->irq_enabled = true;
+        /* Dynamic Capacity borrows the same vector as info */
+        log->irq_vec = cxl_dstate->event_vector[CXL_EVENT_TYPE_INFO];
+    } else {
+        log->irq_enabled = false;
+        log->irq_vec = 0;
+    }
+
+    *len = sizeof(*policy);
+    return CXL_MBOX_SUCCESS;
+}
+
 /* 8.2.9.2.1 */
 static ret_code cmd_firmware_update_get_info(struct cxl_cmd *cmd,
                                              CXLDeviceState *cxl_dstate,
@@ -490,9 +575,11 @@ static struct cxl_cmd cxl_cmd_set[256][256] = {
     [EVENTS][CLEAR_RECORDS] = { "EVENTS_CLEAR_RECORDS",
         cmd_events_clear_records, 8, IMMEDIATE_LOG_CHANGE },
     [EVENTS][GET_INTERRUPT_POLICY] = { "EVENTS_GET_INTERRUPT_POLICY",
-        cmd_events_get_interrupt_policy, 0, 0 },
+                                      cmd_events_get_interrupt_policy, 0, 0 },
     [EVENTS][SET_INTERRUPT_POLICY] = { "EVENTS_SET_INTERRUPT_POLICY",
-        cmd_events_set_interrupt_policy, 4, IMMEDIATE_CONFIG_CHANGE },
+                                      cmd_events_set_interrupt_policy,
+                                      sizeof(struct cxl_event_interrupt_policy),
+                                      IMMEDIATE_CONFIG_CHANGE },
     [FIRMWARE_UPDATE][GET_INFO] = { "FIRMWARE_UPDATE_GET_INFO",
         cmd_firmware_update_get_info, 0, 0 },
     [TIMESTAMP][GET] = { "TIMESTAMP_GET", cmd_timestamp_get, 0, 0 },
diff --git a/include/hw/cxl/cxl_events.h b/include/hw/cxl/cxl_events.h
index 255111f3dcfb..c121e504a6db 100644
--- a/include/hw/cxl/cxl_events.h
+++ b/include/hw/cxl/cxl_events.h
@@ -170,4 +170,25 @@ struct cxl_event_mem_module {
     uint8_t reserved[CXL_EVENT_MEM_MOD_RES_SIZE];
 } QEMU_PACKED;
 
+/**
+ * Event Interrupt Policy
+ *
+ * CXL rev 3.0 section 8.2.9.2.4; Table 8-52
+ */
+enum cxl_event_int_mode {
+    CXL_INT_NONE     = 0x00,
+    CXL_INT_MSI_MSIX = 0x01,
+    CXL_INT_FW       = 0x02,
+    CXL_INT_RES      = 0x03,
+};
+#define CXL_EVENT_INT_MODE_MASK 0x3
+#define CXL_EVENT_INT_SETTING(vector) ((((uint8_t)vector & 0xf) << 4) | CXL_INT_MSI_MSIX)
+struct cxl_event_interrupt_policy {
+    uint8_t info_settings;
+    uint8_t warn_settings;
+    uint8_t failure_settings;
+    uint8_t fatal_settings;
+    uint8_t dyn_cap_settings;
+} QEMU_PACKED;
+
 #endif /* CXL_EVENTS_H */
-- 
2.37.2


