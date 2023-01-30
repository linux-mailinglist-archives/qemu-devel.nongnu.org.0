Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9962A6815A7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 16:56:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMWVv-0006nf-2Q; Mon, 30 Jan 2023 10:56:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pMWVk-0006mM-Px
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 10:56:00 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pMWVf-0003ID-8p
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 10:56:00 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4P5CNx21Dnz6H6kN;
 Mon, 30 Jan 2023 23:52:17 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Mon, 30 Jan 2023 15:55:52 +0000
To: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
CC: Ben Widawsky <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, Ira Weiny <ira.weiny@intel.com>, Gregory Price
 <gourry.memverge@gmail.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Mike Maslenkin <mike.maslenkin@gmail.com>
Subject: [PATCH v3 6/8] hw/cxl: Fix endian issues in CXL RAS capability
 defaults / masks
Date: Mon, 30 Jan 2023 15:52:49 +0000
Message-ID: <20230130155251.3430-7-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230130155251.3430-1-Jonathan.Cameron@huawei.com>
References: <20230130155251.3430-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
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

As these are about to be modified, fix the endian handle for
this set of registers rather than making it worse.

Note that CXL is currently only supported in QEMU on
x86 (arm64 patches out of tree) so we aren't going to yet hit
an problems with big endian. However it is good to avoid making
things worse for that support in the future.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 v3: New patch.

 hw/cxl/cxl-component-utils.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
index 3edd303a33..737b4764b9 100644
--- a/hw/cxl/cxl-component-utils.c
+++ b/hw/cxl/cxl-component-utils.c
@@ -141,17 +141,17 @@ static void ras_init_common(uint32_t *reg_state, uint32_t *write_msk)
      * Error status is RW1C but given bits are not yet set, it can
      * be handled as RO.
      */
-    reg_state[R_CXL_RAS_UNC_ERR_STATUS] = 0;
+    stl_le_p(reg_state + R_CXL_RAS_UNC_ERR_STATUS, 0);
     /* Bits 12-13 and 17-31 reserved in CXL 2.0 */
-    reg_state[R_CXL_RAS_UNC_ERR_MASK] = 0x1cfff;
-    write_msk[R_CXL_RAS_UNC_ERR_MASK] = 0x1cfff;
-    reg_state[R_CXL_RAS_UNC_ERR_SEVERITY] = 0x1cfff;
-    write_msk[R_CXL_RAS_UNC_ERR_SEVERITY] = 0x1cfff;
-    reg_state[R_CXL_RAS_COR_ERR_STATUS] = 0;
-    reg_state[R_CXL_RAS_COR_ERR_MASK] = 0x7f;
-    write_msk[R_CXL_RAS_COR_ERR_MASK] = 0x7f;
+    stl_le_p(reg_state + R_CXL_RAS_UNC_ERR_MASK, 0x1cfff);
+    stl_le_p(write_msk + R_CXL_RAS_UNC_ERR_MASK, 0x1cfff);
+    stl_le_p(reg_state + R_CXL_RAS_UNC_ERR_SEVERITY, 0x1cfff);
+    stl_le_p(write_msk + R_CXL_RAS_UNC_ERR_SEVERITY, 0x1cfff);
+    stl_le_p(reg_state + R_CXL_RAS_COR_ERR_STATUS, 0);
+    stl_le_p(reg_state + R_CXL_RAS_COR_ERR_MASK, 0x7f);
+    stl_le_p(write_msk + R_CXL_RAS_COR_ERR_MASK, 0x7f);
     /* CXL switches and devices must set */
-    reg_state[R_CXL_RAS_ERR_CAP_CTRL] = 0x00;
+    stl_le_p(reg_state + R_CXL_RAS_ERR_CAP_CTRL, 0x00);
 }
 
 static void hdm_init_common(uint32_t *reg_state, uint32_t *write_msk,
-- 
2.37.2


