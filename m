Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB6868C4E7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 18:33:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP5Mz-0004QO-J1; Mon, 06 Feb 2023 12:33:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pP5Ms-0004Mu-Q3
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 12:33:28 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pP5Mp-00063R-GX
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 12:33:25 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4P9YCg2tTtz6J65x;
 Tue,  7 Feb 2023 01:29:19 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Mon, 6 Feb 2023 17:33:16 +0000
To: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
CC: Ben Widawsky <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, Ira Weiny <ira.weiny@intel.com>, Gregory Price
 <gourry.memverge@gmail.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: [PATCH v4 10/10] hw/cxl/mailbox: Use new UUID network order define
 for cel_uuid
Date: Mon, 6 Feb 2023 17:28:16 +0000
Message-ID: <20230206172816.8201-11-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230206172816.8201-1-Jonathan.Cameron@huawei.com>
References: <20230206172816.8201-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
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

The cel_uuid was programatically generated previously because there was
no static initializer for network order UUIDs.

Use the new network order initializer for cel_uuid.  Adjust
cxl_initialize_mailbox() because it can't fail now.

Update specification reference.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Gregory Price <gregory.price@memverge.com>
Tested-by: Gregory Price <gregory.price@memverge.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

---
v2:
Make it const (Philippe)
---
 hw/cxl/cxl-device-utils.c   |  2 +-
 hw/cxl/cxl-mailbox-utils.c  | 13 ++++++-------
 include/hw/cxl/cxl_device.h |  2 +-
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
index 83ce7a8270..4c5e88aaf5 100644
--- a/hw/cxl/cxl-device-utils.c
+++ b/hw/cxl/cxl-device-utils.c
@@ -267,5 +267,5 @@ void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
     cxl_device_cap_init(cxl_dstate, MEMORY_DEVICE, 0x4000);
     memdev_reg_init_common(cxl_dstate);
 
-    assert(cxl_initialize_mailbox(cxl_dstate) == 0);
+    cxl_initialize_mailbox(cxl_dstate);
 }
diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index 3f67b665f5..206e04a4b8 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -193,7 +193,11 @@ static ret_code cmd_timestamp_set(struct cxl_cmd *cmd,
     return CXL_MBOX_SUCCESS;
 }
 
-static QemuUUID cel_uuid;
+/* CXL 3.0 8.2.9.5.2.1 Command Effects Log (CEL) */
+static const QemuUUID cel_uuid = {
+    .data = UUID(0x0da9c0b5, 0xbf41, 0x4b78, 0x8f, 0x79,
+                 0x96, 0xb1, 0x62, 0x3b, 0x3f, 0x17)
+};
 
 /* 8.2.9.4.1 */
 static ret_code cmd_logs_get_supported(struct cxl_cmd *cmd,
@@ -458,11 +462,8 @@ void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
                      DOORBELL, 0);
 }
 
-int cxl_initialize_mailbox(CXLDeviceState *cxl_dstate)
+void cxl_initialize_mailbox(CXLDeviceState *cxl_dstate)
 {
-    /* CXL 2.0: Table 169 Get Supported Logs Log Entry */
-    const char *cel_uuidstr = "0da9c0b5-bf41-4b78-8f79-96b1623b3f17";
-
     for (int set = 0; set < 256; set++) {
         for (int cmd = 0; cmd < 256; cmd++) {
             if (cxl_cmd_set[set][cmd].handler) {
@@ -476,6 +477,4 @@ int cxl_initialize_mailbox(CXLDeviceState *cxl_dstate)
             }
         }
     }
-
-    return qemu_uuid_parse(cel_uuidstr, &cel_uuid);
 }
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 250adf18b2..7e5ad65c1d 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -170,7 +170,7 @@ CXL_DEVICE_CAPABILITY_HEADER_REGISTER(MEMORY_DEVICE,
                                       CXL_DEVICE_CAP_HDR1_OFFSET +
                                           CXL_DEVICE_CAP_REG_SIZE * 2)
 
-int cxl_initialize_mailbox(CXLDeviceState *cxl_dstate);
+void cxl_initialize_mailbox(CXLDeviceState *cxl_dstate);
 void cxl_process_mailbox(CXLDeviceState *cxl_dstate);
 
 #define cxl_device_cap_init(dstate, reg, cap_id)                           \
-- 
2.37.2


