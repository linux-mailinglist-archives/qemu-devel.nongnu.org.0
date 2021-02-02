Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD3B30B47D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 02:13:49 +0100 (CET)
Received: from localhost ([::1]:38254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6kGK-0003wO-DI
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 20:13:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1l6k3F-0008NT-3o
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 20:00:18 -0500
Received: from mga18.intel.com ([134.134.136.126]:33363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1l6k3B-0001oo-MT
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 20:00:16 -0500
IronPort-SDR: 2YdEkFIfKCLg+iL+KIju0JXLcIWoeLWkKLTW9lh6K8YeYvP/29KblAeOguoCoCM+LYCvlf089S
 MG7lL4HVXSUQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="168457090"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="168457090"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 17:00:01 -0800
IronPort-SDR: fYUZo2NQT8l1vaRAfsED29X/QgKuTjllbLSRVh17fDsH3Ir0DQyZHgGu1r8ZfjYNWk/Y2G2h7X
 VBLOllaF3p1A==
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="581764084"
Received: from jambrizm-mobl1.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.133.15])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 17:00:00 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 08/31] hw/cxl/device: Timestamp implementation (8.2.9.3)
Date: Mon,  1 Feb 2021 16:59:25 -0800
Message-Id: <20210202005948.241655-9-ben.widawsky@intel.com>
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

Per spec, timestamp appears to be a free-running counter from a value
set by the host via the Set Timestamp command (0301h). There are
references to the epoch, which seem like a red herring. Therefore, the
implementation implements the timestamp as freerunning counter from the
last value that was issued by the Set Timestamp command.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 hw/cxl/cxl-mailbox-utils.c  | 53 +++++++++++++++++++++++++++++++++++++
 include/hw/cxl/cxl_device.h |  6 +++++
 2 files changed, 59 insertions(+)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index 7c939a1851..3d36614c0c 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -43,6 +43,9 @@ enum {
         #define CLEAR_RECORDS   0x1
         #define GET_INTERRUPT_POLICY   0x2
         #define SET_INTERRUPT_POLICY   0x3
+    TIMESTAMP   = 0x03,
+        #define GET           0x0
+        #define SET           0x1
 };
 
 /* 8.2.8.4.5.1 Command Return Codes */
@@ -117,8 +120,11 @@ define_mailbox_handler_zeroed(EVENTS_GET_RECORDS, 0x20);
 define_mailbox_handler_nop(EVENTS_CLEAR_RECORDS);
 define_mailbox_handler_zeroed(EVENTS_GET_INTERRUPT_POLICY, 4);
 define_mailbox_handler_nop(EVENTS_SET_INTERRUPT_POLICY);
+declare_mailbox_handler(TIMESTAMP_GET);
+declare_mailbox_handler(TIMESTAMP_SET);
 
 #define IMMEDIATE_CONFIG_CHANGE (1 << 1)
+#define IMMEDIATE_POLICY_CHANGE (1 << 3)
 #define IMMEDIATE_LOG_CHANGE (1 << 4)
 
 #define CXL_CMD(s, c, in, cel_effect) \
@@ -129,10 +135,57 @@ static struct cxl_cmd cxl_cmd_set[256][256] = {
     CXL_CMD(EVENTS, CLEAR_RECORDS, ~0, IMMEDIATE_LOG_CHANGE),
     CXL_CMD(EVENTS, GET_INTERRUPT_POLICY, 0, 0),
     CXL_CMD(EVENTS, SET_INTERRUPT_POLICY, 4, IMMEDIATE_CONFIG_CHANGE),
+    CXL_CMD(TIMESTAMP, GET, 0, 0),
+    CXL_CMD(TIMESTAMP, SET, 8, IMMEDIATE_POLICY_CHANGE),
 };
 
 #undef CXL_CMD
 
+/*
+ * 8.2.9.3.1
+ */
+define_mailbox_handler(TIMESTAMP_GET)
+{
+    struct timespec ts;
+    uint64_t delta;
+
+    if (!cxl_dstate->timestamp.set) {
+        *(uint64_t *)cmd->payload = 0;
+        goto done;
+    }
+
+    /* First find the delta from the last time the host set the time. */
+    clock_gettime(CLOCK_REALTIME, &ts);
+    delta = (ts.tv_sec * NANOSECONDS_PER_SECOND + ts.tv_nsec) -
+            cxl_dstate->timestamp.last_set;
+
+    /* Then adjust the actual time */
+    stq_le_p(cmd->payload, cxl_dstate->timestamp.host_set + delta);
+
+done:
+    *len = 8;
+    return CXL_MBOX_SUCCESS;
+}
+
+/*
+ * 8.2.9.3.2
+ */
+define_mailbox_handler(TIMESTAMP_SET)
+{
+    struct timespec ts;
+
+    clock_gettime(CLOCK_REALTIME, &ts);
+
+    cxl_dstate->timestamp.set = true;
+    cxl_dstate->timestamp.last_set =
+        ts.tv_sec * NANOSECONDS_PER_SECOND + ts.tv_nsec;
+
+    cxl_dstate->timestamp.host_set = le64_to_cpu(*(uint64_t *)cmd->payload);
+
+    *len = 0;
+    return CXL_MBOX_SUCCESS;
+}
+
 QemuUUID cel_uuid;
 
 void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 0cc5354ba4..ca5328a581 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -107,6 +107,12 @@ typedef struct cxl_device_state {
         size_t cel_size;
     };
 
+    struct {
+        bool set;
+        uint64_t last_set;
+        uint64_t host_set;
+    } timestamp;
+
     /* memory region for persistent memory, HDM */
     MemoryRegion *pmem;
 
-- 
2.30.0


