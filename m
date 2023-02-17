Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C895969B248
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 19:19:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT5K9-0001wf-Eu; Fri, 17 Feb 2023 13:19:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pT5K8-0001wE-2N
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 13:19:08 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pT5K6-0003iM-5y
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 13:19:07 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PJKhm2bFSz67NQt;
 Sat, 18 Feb 2023 02:14:32 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Fri, 17 Feb 2023 18:19:03 +0000
To: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
CC: Ben Widawsky <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, Ira Weiny <ira.weiny@intel.com>, Gregory Price
 <gourry.memverge@gmail.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Mike Maslenkin <mike.maslenkin@gmail.com>, Markus
 Armbruster <armbru@redhat.com>, Dave Jiang <dave.jiang@intel.com>,
 <alison.schofield@intel.com>
Subject: [PATCH 2/6] hw/cxl: rename mailbox return code type from ret_code to
 CXLRetCode
Date: Fri, 17 Feb 2023 18:18:08 +0000
Message-ID: <20230217181812.26995-3-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230217181812.26995-1-Jonathan.Cameron@huawei.com>
References: <20230217181812.26995-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
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

This enum typedef used to be local to one file, so having a generic
name wasn't a big problem even if it wasn't compliant with QEMU naming
conventions.  Now it is in cxl_device.h to support use outside of
cxl-mailbox-utils.c rename it.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/cxl/cxl-mailbox-utils.c  | 62 ++++++++++++++++++-------------------
 include/hw/cxl/cxl_device.h |  2 +-
 2 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index d9bd5daa0d..67aca3fd6c 100644
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
@@ -65,7 +65,7 @@ enum {
 };
 
 struct cxl_cmd;
-typedef ret_code (*opcode_handler)(struct cxl_cmd *cmd,
+typedef CXLRetCode (*opcode_handler)(struct cxl_cmd *cmd,
                                    CXLDeviceState *cxl_dstate, uint16_t *len);
 struct cxl_cmd {
     const char *name;
@@ -77,16 +77,16 @@ struct cxl_cmd {
 
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
@@ -97,9 +97,9 @@ DEFINE_MAILBOX_HANDLER_ZEROED(events_get_interrupt_policy, 4);
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
@@ -131,9 +131,9 @@ static ret_code cmd_firmware_update_get_info(struct cxl_cmd *cmd,
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
@@ -153,7 +153,7 @@ static ret_code cmd_timestamp_get(struct cxl_cmd *cmd,
 }
 
 /* 8.2.9.3.2 */
-static ret_code cmd_timestamp_set(struct cxl_cmd *cmd,
+static CXLRetCode cmd_timestamp_set(struct cxl_cmd *cmd,
                                   CXLDeviceState *cxl_dstate,
                                   uint16_t *len)
 {
@@ -173,9 +173,9 @@ static const QemuUUID cel_uuid = {
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
@@ -196,9 +196,9 @@ static ret_code cmd_logs_get_supported(struct cxl_cmd *cmd,
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
@@ -237,9 +237,9 @@ static ret_code cmd_logs_get_log(struct cxl_cmd *cmd,
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
@@ -281,9 +281,9 @@ static ret_code cmd_identify_memory_device(struct cxl_cmd *cmd,
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
@@ -311,9 +311,9 @@ static ret_code cmd_ccls_get_partition_info(struct cxl_cmd *cmd,
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
@@ -336,9 +336,9 @@ static ret_code cmd_ccls_get_lsa(struct cxl_cmd *cmd,
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
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index d01c6b29c5..b737c3699f 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -108,7 +108,7 @@ typedef enum {
     CXL_MBOX_UNSUPPORTED_MAILBOX = 0x15,
     CXL_MBOX_INVALID_PAYLOAD_LENGTH = 0x16,
     CXL_MBOX_MAX = 0x17
-} ret_code;
+} CXLRetCode;
 
 typedef struct cxl_device_state {
     MemoryRegion device_registers;
-- 
2.37.2


