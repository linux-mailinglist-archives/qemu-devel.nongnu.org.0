Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A9F514E26
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 16:48:44 +0200 (CEST)
Received: from localhost ([::1]:34666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkRvH-0002Sb-Ga
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 10:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nkRt0-00089O-BF
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:46:22 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nkRsy-0000bI-CQ
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:46:22 -0400
Received: from fraeml715-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KqZvN6QQMz67Xf1;
 Fri, 29 Apr 2022 22:42:08 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml715-chm.china.huawei.com (10.206.15.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 29 Apr 2022 16:46:18 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 29 Apr 2022 15:46:17 +0100
To: <linuxarm@huawei.com>, <qemu-devel@nongnu.org>, <alex.bennee@linaro.org>, 
 Marcel Apfelbaum <marcel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Adam Manzanares
 <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>, <f4bug@amsat.org>, Peter Xu
 <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Saransh Gupta1 <saransh@ibm.com>, Shreyas Shah
 <shreyas.shah@elastics.cloud>, Chris Browy <cbrowy@avery-design.com>,
 "Samarth Saxena" <samarths@cadence.com>, Dan Williams
 <dan.j.williams@intel.com>, <k.jensen@samsung.com>, <dave@stgolabs.net>,
 Alison Schofield <alison.schofield@intel.com>
Subject: [PATCH v10 10/45] hw/cxl/device: Add log commands (8.2.9.4) + CEL
Date: Fri, 29 Apr 2022 15:40:35 +0100
Message-ID: <20220429144110.25167-11-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220429144110.25167-1-Jonathan.Cameron@huawei.com>
References: <20220429144110.25167-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml727-chm.china.huawei.com (10.201.108.78) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

From: Ben Widawsky <ben.widawsky@intel.com>

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
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/cxl/cxl-mailbox-utils.c | 69 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index 4584aa31f7..db473135c7 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -47,6 +47,9 @@ enum {
     TIMESTAMP   = 0x03,
         #define GET           0x0
         #define SET           0x1
+    LOGS        = 0x04,
+        #define GET_SUPPORTED 0x0
+        #define GET_LOG       0x1
 };
 
 /* 8.2.8.4.5.1 Command Return Codes */
@@ -147,6 +150,70 @@ static ret_code cmd_timestamp_set(struct cxl_cmd *cmd,
 
 static QemuUUID cel_uuid;
 
+/* 8.2.9.4.1 */
+static ret_code cmd_logs_get_supported(struct cxl_cmd *cmd,
+                                       CXLDeviceState *cxl_dstate,
+                                       uint16_t *len)
+{
+    struct {
+        uint16_t entries;
+        uint8_t rsvd[6];
+        struct {
+            QemuUUID uuid;
+            uint32_t size;
+        } log_entries[1];
+    } QEMU_PACKED *supported_logs = (void *)cmd->payload;
+    QEMU_BUILD_BUG_ON(sizeof(*supported_logs) != 0x1c);
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
+static ret_code cmd_logs_get_log(struct cxl_cmd *cmd,
+                                 CXLDeviceState *cxl_dstate,
+                                 uint16_t *len)
+{
+    struct {
+        QemuUUID uuid;
+        uint32_t offset;
+        uint32_t length;
+    } QEMU_PACKED QEMU_ALIGNED(16) *get_log = (void *)cmd->payload;
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
 #define IMMEDIATE_CONFIG_CHANGE (1 << 1)
 #define IMMEDIATE_POLICY_CHANGE (1 << 3)
 #define IMMEDIATE_LOG_CHANGE (1 << 4)
@@ -162,6 +229,8 @@ static struct cxl_cmd cxl_cmd_set[256][256] = {
         cmd_events_set_interrupt_policy, 4, IMMEDIATE_CONFIG_CHANGE },
     [TIMESTAMP][GET] = { "TIMESTAMP_GET", cmd_timestamp_get, 0, 0 },
     [TIMESTAMP][SET] = { "TIMESTAMP_SET", cmd_timestamp_set, 8, IMMEDIATE_POLICY_CHANGE },
+    [LOGS][GET_SUPPORTED] = { "LOGS_GET_SUPPORTED", cmd_logs_get_supported, 0, 0 },
+    [LOGS][GET_LOG] = { "LOGS_GET_LOG", cmd_logs_get_log, 0x18, 0 },
 };
 
 void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
-- 
2.32.0


