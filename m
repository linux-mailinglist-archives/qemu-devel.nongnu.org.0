Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6DD6C4F70
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 16:30:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf0PM-0003hy-J1; Wed, 22 Mar 2023 11:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pf0PK-0003g3-2Q
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:29:46 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pf0PH-000455-JQ
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:29:45 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PhPjr4dWpz6pGl9;
 Wed, 22 Mar 2023 18:25:04 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 10:28:26 +0000
To: Michael Tsirkin <mst@redhat.com>, <qemu-devel@nongnu.org>
CC: <linuxarm@huawei.com>, Fan Ni <fan.ni@samsung.com>, Dave Jiang
 <dave.jiang@intel.com>, <linux-cxl@vger.kernel.org>
Subject: [RESEND PATCH 2/2] hw/cxl: Fix incorrect reset of commit and
 associated clearing of committed.
Date: Wed, 22 Mar 2023 10:27:31 +0000
Message-ID: <20230322102731.4219-3-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230322102731.4219-1-Jonathan.Cameron@huawei.com>
References: <20230322102731.4219-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
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

The hardware clearing the commit bit is not spec compliant.
Clearing of committed bit when commit is cleared is not specifically
stated in the CXL spec, but is the expected (and simplest) permitted
behaviour so use that for QEMU emulation.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/cxl/cxl-component-utils.c |  6 +++++-
 hw/mem/cxl_type3.c           | 21 ++++++++++++++++++++-
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
index a3e6cf75cf..378f1082ce 100644
--- a/hw/cxl/cxl-component-utils.c
+++ b/hw/cxl/cxl-component-utils.c
@@ -38,19 +38,23 @@ static void dumb_hdm_handler(CXLComponentState *cxl_cstate, hwaddr offset,
     ComponentRegisters *cregs = &cxl_cstate->crb;
     uint32_t *cache_mem = cregs->cache_mem_registers;
     bool should_commit = false;
+    bool should_uncommit = false;
 
     switch (offset) {
     case A_CXL_HDM_DECODER0_CTRL:
         should_commit = FIELD_EX32(value, CXL_HDM_DECODER0_CTRL, COMMIT);
+        should_uncommit = !should_commit;
         break;
     default:
         break;
     }
 
     if (should_commit) {
-        value = FIELD_DP32(value, CXL_HDM_DECODER0_CTRL, COMMIT, 0);
         value = FIELD_DP32(value, CXL_HDM_DECODER0_CTRL, ERR, 0);
         value = FIELD_DP32(value, CXL_HDM_DECODER0_CTRL, COMMITTED, 1);
+    } else if (should_uncommit) {
+        value = FIELD_DP32(value, CXL_HDM_DECODER0_CTRL, ERR, 0);
+        value = FIELD_DP32(value, CXL_HDM_DECODER0_CTRL, COMMITTED, 0);
     }
     stl_le_p((uint8_t *)cache_mem + offset, value);
 }
diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 846089ccda..9598d584ac 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -320,13 +320,28 @@ static void hdm_decoder_commit(CXLType3Dev *ct3d, int which)
 
     ctrl = ldl_le_p(cache_mem + R_CXL_HDM_DECODER0_CTRL);
     /* TODO: Sanity checks that the decoder is possible */
-    ctrl = FIELD_DP32(ctrl, CXL_HDM_DECODER0_CTRL, COMMIT, 0);
     ctrl = FIELD_DP32(ctrl, CXL_HDM_DECODER0_CTRL, ERR, 0);
     ctrl = FIELD_DP32(ctrl, CXL_HDM_DECODER0_CTRL, COMMITTED, 1);
 
     stl_le_p(cache_mem + R_CXL_HDM_DECODER0_CTRL, ctrl);
 }
 
+static void hdm_decoder_uncommit(CXLType3Dev *ct3d, int which)
+{
+    ComponentRegisters *cregs = &ct3d->cxl_cstate.crb;
+    uint32_t *cache_mem = cregs->cache_mem_registers;
+    uint32_t ctrl;
+
+    assert(which == 0);
+
+    ctrl = ldl_le_p(cache_mem + R_CXL_HDM_DECODER0_CTRL);
+
+    ctrl = FIELD_DP32(ctrl, CXL_HDM_DECODER0_CTRL, ERR, 0);
+    ctrl = FIELD_DP32(ctrl, CXL_HDM_DECODER0_CTRL, COMMITTED, 0);
+
+    stl_le_p(cache_mem + R_CXL_HDM_DECODER0_CTRL, ctrl);
+}
+
 static int ct3d_qmp_uncor_err_to_cxl(CxlUncorErrorType qmp_err)
 {
     switch (qmp_err) {
@@ -395,6 +410,7 @@ static void ct3d_reg_write(void *opaque, hwaddr offset, uint64_t value,
     CXLType3Dev *ct3d = container_of(cxl_cstate, CXLType3Dev, cxl_cstate);
     uint32_t *cache_mem = cregs->cache_mem_registers;
     bool should_commit = false;
+    bool should_uncommit = false;
     int which_hdm = -1;
 
     assert(size == 4);
@@ -403,6 +419,7 @@ static void ct3d_reg_write(void *opaque, hwaddr offset, uint64_t value,
     switch (offset) {
     case A_CXL_HDM_DECODER0_CTRL:
         should_commit = FIELD_EX32(value, CXL_HDM_DECODER0_CTRL, COMMIT);
+        should_uncommit = !should_commit;
         which_hdm = 0;
         break;
     case A_CXL_RAS_UNC_ERR_STATUS:
@@ -489,6 +506,8 @@ static void ct3d_reg_write(void *opaque, hwaddr offset, uint64_t value,
     stl_le_p((uint8_t *)cache_mem + offset, value);
     if (should_commit) {
         hdm_decoder_commit(ct3d, which_hdm);
+    } else if (should_uncommit) {
+        hdm_decoder_uncommit(ct3d, which_hdm);
     }
 }
 
-- 
2.37.2


