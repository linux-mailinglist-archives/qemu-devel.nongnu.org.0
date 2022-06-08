Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C80F543156
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 15:31:06 +0200 (CEST)
Received: from localhost ([::1]:48182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyvm4-0000vH-S9
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 09:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nyvQ2-0003q8-V1
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:08:18 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nyvPz-0004Db-GN
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:08:18 -0400
Received: from fraeml708-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LJ6py3wWJz67lbv;
 Wed,  8 Jun 2022 21:03:22 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml708-chm.china.huawei.com (10.206.15.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 8 Jun 2022 15:08:07 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2375.24; Wed, 8 Jun 2022 14:08:07 +0100
To: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>, "Ben
 Widawsky" <bwidawsk@kernel.org>
CC: Paolo Bonzini <pbonzini@redhat.com>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, <alex.bennee@linaro.org>, Marcel Apfelbaum
 <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, "Adam
 Manzanares" <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH v4] hw/cxl: Fix missing write mask for HDM decoder target list
 registers
Date: Wed, 8 Jun 2022 14:08:04 +0100
Message-ID: <20220608130804.25795-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml703-chm.china.huawei.com (10.201.108.52) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Without being able to write these registers, no interleaving is possible.
More refined checks of HDM register state on commit to follow.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Ben Widawsky <ben@bwidawsk.net>
---
v4: (Ben Widawsky review responses - thanks!)
 - Expand list of matched types for 'skip' usages (with more restrictive
   write mask) to include all CXL device types (type 3, type 1/2 and LD).
   We only emulate type 3 so far but good for the function implementation
   to be correct for the other types.
 - Added Ben's RB.
 
 hw/cxl/cxl-component-utils.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
index 7985c9bfca..3edd303a33 100644
--- a/hw/cxl/cxl-component-utils.c
+++ b/hw/cxl/cxl-component-utils.c
@@ -154,7 +154,8 @@ static void ras_init_common(uint32_t *reg_state, uint32_t *write_msk)
     reg_state[R_CXL_RAS_ERR_CAP_CTRL] = 0x00;
 }
 
-static void hdm_init_common(uint32_t *reg_state, uint32_t *write_msk)
+static void hdm_init_common(uint32_t *reg_state, uint32_t *write_msk,
+                            enum reg_type type)
 {
     int decoder_count = 1;
     int i;
@@ -174,6 +175,14 @@ static void hdm_init_common(uint32_t *reg_state, uint32_t *write_msk)
         write_msk[R_CXL_HDM_DECODER0_SIZE_LO + i * 0x20] = 0xf0000000;
         write_msk[R_CXL_HDM_DECODER0_SIZE_HI + i * 0x20] = 0xffffffff;
         write_msk[R_CXL_HDM_DECODER0_CTRL + i * 0x20] = 0x13ff;
+        if (type == CXL2_DEVICE ||
+            type == CXL2_TYPE3_DEVICE ||
+            type == CXL2_LOGICAL_DEVICE) {
+            write_msk[R_CXL_HDM_DECODER0_TARGET_LIST_LO + i * 0x20] = 0xf0000000;
+        } else {
+            write_msk[R_CXL_HDM_DECODER0_TARGET_LIST_LO + i * 0x20] = 0xffffffff;
+        }
+        write_msk[R_CXL_HDM_DECODER0_TARGET_LIST_HI + i * 0x20] = 0xffffffff;
     }
 }
 
@@ -239,7 +248,7 @@ void cxl_component_register_init_common(uint32_t *reg_state, uint32_t *write_msk
     }
 
     init_cap_reg(HDM, 5, 1);
-    hdm_init_common(reg_state, write_msk);
+    hdm_init_common(reg_state, write_msk, type);
 
     if (caps < 5) {
         return;
-- 
2.32.0


