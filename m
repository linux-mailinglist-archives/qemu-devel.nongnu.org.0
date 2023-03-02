Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA076A7FD2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 11:18:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXg13-0002sH-Ds; Thu, 02 Mar 2023 05:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pXg0s-0002me-3m
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:18:14 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pXg0q-0000pp-Gn
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:18:13 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PS6Vt0Qmpz6J72j;
 Thu,  2 Mar 2023 18:17:58 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 10:18:09 +0000
To: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, Fan Ni
 <fan.ni@samsung.com>
CC: <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>, Ira Weiny
 <ira.weiny@intel.com>, Alison Schofield <alison.schofield@intel.com>, Michael
 Roth <michael.roth@amd.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Dave Jiang <dave.jiang@intel.com>, Markus Armbruster
 <armbru@redhat.com>
Subject: [PATCH v3 2/6] hw/cxl: Introduce cxl_device_get_timestamp() utility
 function
Date: Thu, 2 Mar 2023 10:17:06 +0000
Message-ID: <20230302101710.1652-3-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302101710.1652-1-Jonathan.Cameron@huawei.com>
References: <20230302101710.1652-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ira Weiny <ira.weiny@intel.com>

There are new users of this functionality coming shortly so factor
it out from the GET_TIMESTAMP mailbox command handling.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Fan Ni <fan.ni@samsung.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

---
v8:
Picked up tag from Fan Ni
---
 hw/cxl/cxl-device-utils.c   | 15 +++++++++++++++
 hw/cxl/cxl-mailbox-utils.c  | 11 +----------
 include/hw/cxl/cxl_device.h |  2 ++
 3 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
index 4c5e88aaf5..86e1cea8ce 100644
--- a/hw/cxl/cxl-device-utils.c
+++ b/hw/cxl/cxl-device-utils.c
@@ -269,3 +269,18 @@ void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
 
     cxl_initialize_mailbox(cxl_dstate);
 }
+
+uint64_t cxl_device_get_timestamp(CXLDeviceState *cxl_dstate)
+{
+    uint64_t time, delta;
+    uint64_t final_time = 0;
+
+    if (cxl_dstate->timestamp.set) {
+        /* Find the delta from the last time the host set the time. */
+        time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        delta = time - cxl_dstate->timestamp.last_set;
+        final_time = cxl_dstate->timestamp.host_set + delta;
+    }
+
+    return final_time;
+}
diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index 7b2aef0d67..702e16ca20 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -163,17 +163,8 @@ static CXLRetCode cmd_timestamp_get(struct cxl_cmd *cmd,
                                     CXLDeviceState *cxl_dstate,
                                     uint16_t *len)
 {
-    uint64_t time, delta;
-    uint64_t final_time = 0;
-
-    if (cxl_dstate->timestamp.set) {
-        /* First find the delta from the last time the host set the time. */
-        time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-        delta = time - cxl_dstate->timestamp.last_set;
-        final_time = cxl_dstate->timestamp.host_set + delta;
-    }
+    uint64_t final_time = cxl_device_get_timestamp(cxl_dstate);
 
-    /* Then adjust the actual time */
     stq_le_p(cmd->payload, final_time);
     *len = 8;
 
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index edb9791bab..02befda0f6 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -287,4 +287,6 @@ MemTxResult cxl_type3_read(PCIDevice *d, hwaddr host_addr, uint64_t *data,
 MemTxResult cxl_type3_write(PCIDevice *d, hwaddr host_addr, uint64_t data,
                             unsigned size, MemTxAttrs attrs);
 
+uint64_t cxl_device_get_timestamp(CXLDeviceState *cxlds);
+
 #endif
-- 
2.37.2


