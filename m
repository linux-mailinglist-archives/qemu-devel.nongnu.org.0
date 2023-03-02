Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1616A6A7FCF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 11:18:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXg0T-00028O-0V; Thu, 02 Mar 2023 05:17:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pXg0P-00022s-3s
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:17:45 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pXg0L-0000lZ-QV
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:17:44 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PS6Rk1xWqz6JB8Y;
 Thu,  2 Mar 2023 18:15:14 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 10:17:39 +0000
To: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, Fan Ni
 <fan.ni@samsung.com>
CC: <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>, Ira Weiny
 <ira.weiny@intel.com>, Alison Schofield <alison.schofield@intel.com>, Michael
 Roth <michael.roth@amd.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Dave Jiang <dave.jiang@intel.com>, Markus Armbruster
 <armbru@redhat.com>
Subject: [PATCH v3 1/6] hw/cxl: rename mailbox return code type from ret_code
 to CXLRetCode
Date: Thu, 2 Mar 2023 10:17:05 +0000
Message-ID: <20230302101710.1652-2-Jonathan.Cameron@huawei.com>
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

Given the increasing usage of this mailbox return code type, now
is a good time to switch to QEMU style naming.

Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Fan Ni <fan.ni@samsung.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

---
v8: Picked up tag from Fan Ni
---
 hw/cxl/cxl-mailbox-utils.c | 64 +++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index ed663cc04a..7b2aef0d67 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -23,7 +23,7 @@
  *     FOO    = 0x7f,
  *          #define BAR 0
  *  2. Implement the handler
- *    static ret_code cmd_foo_bar(struct cxl_cmd *cmd,
+ *    static CXLRetCode cmd_foo_bar(struct cxl_cmd *cmd,
  *                                  CXLDeviceState *cxl_dstate, uint16_t *len)
  *  3. Add the command to the cxl_cmd_set[][]
  *    [FOO][BAR] = { "FOO_BAR", cmd_foo_bar, x, y },
@@ -90,10 +90,10 @@ typedef enum {
     CXL_MBOX_UNSUPPORTED_MAILBOX = 0x15,
     CXL_MBOX_INVALID_PAYLOAD_LENGTH = 0x16,
     CXL_MBOX_MAX = 0x17
-} ret_code;
+} CXLRetCode;
 
 struct cxl_cmd;
-typedef ret_code (*opcode_handler)(struct cxl_cmd *cmd,
+typedef CXLRetCode (*opcode_handler)(struct cxl_cmd *cmd,
                                    CXLDeviceState *cxl_dstate, uint16_t *len);
 struct cxl_cmd {
     const char *name;
@@ -105,16 +105,16 @@ struct cxl_cmd {
 
 #define DEFINE_MAILBOX_HANDLER_ZEROED(name, size)                         \
     uint16_t __zero##name = size;                                         \
-    static ret_code cmd_##name(struct cxl_cmd *cmd,                       \
-                               CXLDeviceState *cxl_dstate, uint16_t *len) \
+    static CXLRetCode cmd_##name(struct cxl_cmd *cmd,                       \
+                                 CXLDeviceState *cxl_dstate, uint16_t *len) \
     {                                                                     \
         *len = __zero##name;                                              \
         memset(cmd->payload, 0, *len);                                    \
         return CXL_MBOX_SUCCESS;                                          \
     }
 #define DEFINE_MAILBOX_HANDLER_NOP(name)                                  \
-    static ret_code cmd_##name(struct cxl_cmd *cmd,                       \
-                               CXLDeviceState *cxl_dstate, uint16_t *len) \
+    static CXLRetCode cmd_##name(struct cxl_cmd *cmd,                       \
+                                 CXLDeviceState *cxl_dstate, uint16_t *len) \
     {                                                                     \
         return CXL_MBOX_SUCCESS;                                          \
     }
@@ -125,9 +125,9 @@ DEFINE_MAILBOX_HANDLER_ZEROED(events_get_interrupt_policy, 4);
 DEFINE_MAILBOX_HANDLER_NOP(events_set_interrupt_policy);
 
 /* 8.2.9.2.1 */
-static ret_code cmd_firmware_update_get_info(struct cxl_cmd *cmd,
-                                             CXLDeviceState *cxl_dstate,
-                                             uint16_t *len)
+static CXLRetCode cmd_firmware_update_get_info(struct cxl_cmd *cmd,
+                                               CXLDeviceState *cxl_dstate,
+                                               uint16_t *len)
 {
     struct {
         uint8_t slots_supported;
@@ -159,9 +159,9 @@ static ret_code cmd_firmware_update_get_info(struct cxl_cmd *cmd,
 }
 
 /* 8.2.9.3.1 */
-static ret_code cmd_timestamp_get(struct cxl_cmd *cmd,
-                                  CXLDeviceState *cxl_dstate,
-                                  uint16_t *len)
+static CXLRetCode cmd_timestamp_get(struct cxl_cmd *cmd,
+                                    CXLDeviceState *cxl_dstate,
+                                    uint16_t *len)
 {
     uint64_t time, delta;
     uint64_t final_time = 0;
@@ -181,7 +181,7 @@ static ret_code cmd_timestamp_get(struct cxl_cmd *cmd,
 }
 
 /* 8.2.9.3.2 */
-static ret_code cmd_timestamp_set(struct cxl_cmd *cmd,
+static CXLRetCode cmd_timestamp_set(struct cxl_cmd *cmd,
                                   CXLDeviceState *cxl_dstate,
                                   uint16_t *len)
 {
@@ -201,9 +201,9 @@ static const QemuUUID cel_uuid = {
 };
 
 /* 8.2.9.4.1 */
-static ret_code cmd_logs_get_supported(struct cxl_cmd *cmd,
-                                       CXLDeviceState *cxl_dstate,
-                                       uint16_t *len)
+static CXLRetCode cmd_logs_get_supported(struct cxl_cmd *cmd,
+                                         CXLDeviceState *cxl_dstate,
+                                         uint16_t *len)
 {
     struct {
         uint16_t entries;
@@ -224,9 +224,9 @@ static ret_code cmd_logs_get_supported(struct cxl_cmd *cmd,
 }
 
 /* 8.2.9.4.2 */
-static ret_code cmd_logs_get_log(struct cxl_cmd *cmd,
-                                 CXLDeviceState *cxl_dstate,
-                                 uint16_t *len)
+static CXLRetCode cmd_logs_get_log(struct cxl_cmd *cmd,
+                                   CXLDeviceState *cxl_dstate,
+                                   uint16_t *len)
 {
     struct {
         QemuUUID uuid;
@@ -265,9 +265,9 @@ static ret_code cmd_logs_get_log(struct cxl_cmd *cmd,
 }
 
 /* 8.2.9.5.1.1 */
-static ret_code cmd_identify_memory_device(struct cxl_cmd *cmd,
-                                           CXLDeviceState *cxl_dstate,
-                                           uint16_t *len)
+static CXLRetCode cmd_identify_memory_device(struct cxl_cmd *cmd,
+                                             CXLDeviceState *cxl_dstate,
+                                             uint16_t *len)
 {
     struct {
         char fw_revision[0x10];
@@ -309,9 +309,9 @@ static ret_code cmd_identify_memory_device(struct cxl_cmd *cmd,
     return CXL_MBOX_SUCCESS;
 }
 
-static ret_code cmd_ccls_get_partition_info(struct cxl_cmd *cmd,
-                                           CXLDeviceState *cxl_dstate,
-                                           uint16_t *len)
+static CXLRetCode cmd_ccls_get_partition_info(struct cxl_cmd *cmd,
+                                              CXLDeviceState *cxl_dstate,
+                                              uint16_t *len)
 {
     struct {
         uint64_t active_vmem;
@@ -339,9 +339,9 @@ static ret_code cmd_ccls_get_partition_info(struct cxl_cmd *cmd,
     return CXL_MBOX_SUCCESS;
 }
 
-static ret_code cmd_ccls_get_lsa(struct cxl_cmd *cmd,
-                                 CXLDeviceState *cxl_dstate,
-                                 uint16_t *len)
+static CXLRetCode cmd_ccls_get_lsa(struct cxl_cmd *cmd,
+                                   CXLDeviceState *cxl_dstate,
+                                   uint16_t *len)
 {
     struct {
         uint32_t offset;
@@ -364,9 +364,9 @@ static ret_code cmd_ccls_get_lsa(struct cxl_cmd *cmd,
     return CXL_MBOX_SUCCESS;
 }
 
-static ret_code cmd_ccls_set_lsa(struct cxl_cmd *cmd,
-                                 CXLDeviceState *cxl_dstate,
-                                 uint16_t *len)
+static CXLRetCode cmd_ccls_set_lsa(struct cxl_cmd *cmd,
+                                   CXLDeviceState *cxl_dstate,
+                                   uint16_t *len)
 {
     struct set_lsa_pl {
         uint32_t offset;
-- 
2.37.2


