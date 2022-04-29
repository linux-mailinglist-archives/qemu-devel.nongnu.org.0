Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F09514E30
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 16:49:34 +0200 (CEST)
Received: from localhost ([::1]:36664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkRw6-0003oZ-1C
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 10:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nkRsY-0007Zn-Ab
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:45:56 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nkRsT-0000Yw-Ad
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:45:50 -0400
Received: from fraeml713-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KqZtp0cyPz67Q6Z;
 Fri, 29 Apr 2022 22:41:38 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml713-chm.china.huawei.com (10.206.15.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 29 Apr 2022 16:45:47 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 29 Apr 2022 15:45:45 +0100
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
Subject: [PATCH v10 09/45] hw/cxl/device: Timestamp implementation (8.2.9.3)
Date: Fri, 29 Apr 2022 15:40:34 +0100
Message-ID: <20220429144110.25167-10-Jonathan.Cameron@huawei.com>
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

Errata F4 to CXL 2.0 clarified the meaning of the timer as the
sum of the value set with the timestamp set command and the number
of nano seconds since it was last set.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/cxl/cxl-mailbox-utils.c  | 42 +++++++++++++++++++++++++++++++++++++
 include/hw/cxl/cxl_device.h |  6 ++++++
 2 files changed, 48 insertions(+)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index fb1f53f48e..4584aa31f7 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -44,6 +44,9 @@ enum {
         #define CLEAR_RECORDS   0x1
         #define GET_INTERRUPT_POLICY   0x2
         #define SET_INTERRUPT_POLICY   0x3
+    TIMESTAMP   = 0x03,
+        #define GET           0x0
+        #define SET           0x1
 };
 
 /* 8.2.8.4.5.1 Command Return Codes */
@@ -106,9 +109,46 @@ DEFINE_MAILBOX_HANDLER_NOP(events_clear_records);
 DEFINE_MAILBOX_HANDLER_ZEROED(events_get_interrupt_policy, 4);
 DEFINE_MAILBOX_HANDLER_NOP(events_set_interrupt_policy);
 
+/* 8.2.9.3.1 */
+static ret_code cmd_timestamp_get(struct cxl_cmd *cmd,
+                                  CXLDeviceState *cxl_dstate,
+                                  uint16_t *len)
+{
+    uint64_t time, delta;
+    uint64_t final_time = 0;
+
+    if (cxl_dstate->timestamp.set) {
+        /* First find the delta from the last time the host set the time. */
+        time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        delta = time - cxl_dstate->timestamp.last_set;
+        final_time = cxl_dstate->timestamp.host_set + delta;
+    }
+
+    /* Then adjust the actual time */
+    stq_le_p(cmd->payload, final_time);
+    *len = 8;
+
+    return CXL_MBOX_SUCCESS;
+}
+
+/* 8.2.9.3.2 */
+static ret_code cmd_timestamp_set(struct cxl_cmd *cmd,
+                                  CXLDeviceState *cxl_dstate,
+                                  uint16_t *len)
+{
+    cxl_dstate->timestamp.set = true;
+    cxl_dstate->timestamp.last_set = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+
+    cxl_dstate->timestamp.host_set = le64_to_cpu(*(uint64_t *)cmd->payload);
+
+    *len = 0;
+    return CXL_MBOX_SUCCESS;
+}
+
 static QemuUUID cel_uuid;
 
 #define IMMEDIATE_CONFIG_CHANGE (1 << 1)
+#define IMMEDIATE_POLICY_CHANGE (1 << 3)
 #define IMMEDIATE_LOG_CHANGE (1 << 4)
 
 static struct cxl_cmd cxl_cmd_set[256][256] = {
@@ -120,6 +160,8 @@ static struct cxl_cmd cxl_cmd_set[256][256] = {
         cmd_events_get_interrupt_policy, 0, 0 },
     [EVENTS][SET_INTERRUPT_POLICY] = { "EVENTS_SET_INTERRUPT_POLICY",
         cmd_events_set_interrupt_policy, 4, IMMEDIATE_CONFIG_CHANGE },
+    [TIMESTAMP][GET] = { "TIMESTAMP_GET", cmd_timestamp_get, 0, 0 },
+    [TIMESTAMP][SET] = { "TIMESTAMP_SET", cmd_timestamp_set, 8, IMMEDIATE_POLICY_CHANGE },
 };
 
 void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 954205653e..797a22ddb4 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -111,6 +111,12 @@ typedef struct cxl_device_state {
         size_t cel_size;
     };
 
+    struct {
+        bool set;
+        uint64_t last_set;
+        uint64_t host_set;
+    } timestamp;
+
     /* memory region for persistent memory, HDM */
     uint64_t pmem_size;
 } CXLDeviceState;
-- 
2.32.0


