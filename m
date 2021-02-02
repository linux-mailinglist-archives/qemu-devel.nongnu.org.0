Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8638B30B47E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 02:13:49 +0100 (CET)
Received: from localhost ([::1]:38290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6kGK-0003xR-IH
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 20:13:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1l6k3E-0008Mg-60
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 20:00:16 -0500
Received: from mga18.intel.com ([134.134.136.126]:33362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1l6k3C-0001oN-0F
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 20:00:15 -0500
IronPort-SDR: DoHBPaFLNdFawKLy5Vpcwcu1irqBjGUPLKsjjuIljY7yAYO3WGpJ5wp9WSsISRG9bMhZfjfp59
 ntAVOEdMFsIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="168457092"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="168457092"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 17:00:02 -0800
IronPort-SDR: qEoc3mPJFZfoUqhR8riA1IgozfKwdzK9V1Fz4p+Z11ykbe5cQDFRgg9gQmO9NbhYBLU5srT2YA
 fnfMdN9Rk0tw==
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="581764114"
Received: from jambrizm-mobl1.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.133.15])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 17:00:01 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 09/31] hw/cxl/device: Add log commands (8.2.9.4) + CEL
Date: Mon,  1 Feb 2021 16:59:26 -0800
Message-Id: <20210202005948.241655-10-ben.widawsky@intel.com>
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

CXL specification provides for the ability to obtain logs from the
device. Logs are either spec defined, like the "Command Effects Log"
(CEL), or vendor specific. UUIDs are defined for all log types.

The CEL is a mechanism to provide information to the host about which
commands are supported. It is useful both to determine which spec'd
optional commands are supported, as well as provide a list of vendor
specified commands that might be used. The CEL is already created as
part of mailbox initialization, but here it is now exported to hosts
that use these log commands.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 hw/cxl/cxl-mailbox-utils.c | 67 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index 3d36614c0c..3f0ae8b9e5 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -46,6 +46,9 @@ enum {
     TIMESTAMP   = 0x03,
         #define GET           0x0
         #define SET           0x1
+    LOGS        = 0x04,
+        #define GET_SUPPORTED 0x0
+        #define GET_LOG       0x1
 };
 
 /* 8.2.8.4.5.1 Command Return Codes */
@@ -122,6 +125,8 @@ define_mailbox_handler_zeroed(EVENTS_GET_INTERRUPT_POLICY, 4);
 define_mailbox_handler_nop(EVENTS_SET_INTERRUPT_POLICY);
 declare_mailbox_handler(TIMESTAMP_GET);
 declare_mailbox_handler(TIMESTAMP_SET);
+declare_mailbox_handler(LOGS_GET_SUPPORTED);
+declare_mailbox_handler(LOGS_GET_LOG);
 
 #define IMMEDIATE_CONFIG_CHANGE (1 << 1)
 #define IMMEDIATE_POLICY_CHANGE (1 << 3)
@@ -137,6 +142,8 @@ static struct cxl_cmd cxl_cmd_set[256][256] = {
     CXL_CMD(EVENTS, SET_INTERRUPT_POLICY, 4, IMMEDIATE_CONFIG_CHANGE),
     CXL_CMD(TIMESTAMP, GET, 0, 0),
     CXL_CMD(TIMESTAMP, SET, 8, IMMEDIATE_POLICY_CHANGE),
+    CXL_CMD(LOGS, GET_SUPPORTED, 0, 0),
+    CXL_CMD(LOGS, GET_LOG, 0x18, 0),
 };
 
 #undef CXL_CMD
@@ -188,6 +195,66 @@ define_mailbox_handler(TIMESTAMP_SET)
 
 QemuUUID cel_uuid;
 
+/* 8.2.9.4.1 */
+define_mailbox_handler(LOGS_GET_SUPPORTED)
+{
+    struct {
+        uint16_t entries;
+        uint8_t rsvd[6];
+        struct {
+            QemuUUID uuid;
+            uint32_t size;
+        } log_entries[1];
+    } __attribute__((packed)) *supported_logs = (void *)cmd->payload;
+    _Static_assert(sizeof(*supported_logs) == 0x1c, "Bad supported log size");
+
+    supported_logs->entries = 1;
+    supported_logs->log_entries[0].uuid = cel_uuid;
+    supported_logs->log_entries[0].size = 4 * cxl_dstate->cel_size;
+
+    *len = sizeof(*supported_logs);
+    return CXL_MBOX_SUCCESS;
+}
+
+/* 8.2.9.4.2 */
+define_mailbox_handler(LOGS_GET_LOG)
+{
+    struct {
+        QemuUUID uuid;
+        uint32_t offset;
+        uint32_t length;
+    } __attribute__((packed, __aligned__(16))) *get_log = (void *)cmd->payload;
+
+    /*
+     * 8.2.9.4.2
+     *   The device shall return Invalid Parameter if the Offset or Length
+     *   fields attempt to access beyond the size of the log as reported by Get
+     *   Supported Logs.
+     *
+     * XXX: Spec is wrong, "Invalid Parameter" isn't a thing.
+     * XXX: Spec doesn't address incorrect UUID incorrectness.
+     *
+     * The CEL buffer is large enough to fit all commands in the emulation, so
+     * the only possible failure would be if the mailbox itself isn't big
+     * enough.
+     */
+    if (get_log->offset + get_log->length > cxl_dstate->payload_size) {
+        return CXL_MBOX_INVALID_INPUT;
+    }
+
+    if (!qemu_uuid_is_equal(&get_log->uuid, &cel_uuid)) {
+        return CXL_MBOX_UNSUPPORTED;
+    }
+
+    /* Store off everything to local variables so we can wipe out the payload */
+    *len = get_log->length;
+
+    memmove(cmd->payload, cxl_dstate->cel_log + get_log->offset,
+           get_log->length);
+
+    return CXL_MBOX_SUCCESS;
+}
+
 void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
 {
     uint16_t ret = CXL_MBOX_SUCCESS;
-- 
2.30.0


