Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5966458C871
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:38:11 +0200 (CEST)
Received: from localhost ([::1]:51892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL21K-0001rK-Et
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oL1lf-0002r5-1z
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 08:22:00 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oL1lc-0004CZ-Oa
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 08:21:58 -0400
Received: from fraeml744-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4M1Zvs3YTCz67NKZ;
 Mon,  8 Aug 2022 20:17:29 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml744-chm.china.huawei.com (10.206.15.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 8 Aug 2022 14:21:54 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 8 Aug 2022 13:21:54 +0100
To: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Igor Mammedov <imammedo@redhat.com>
CC: <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>, "Shameerali Kolothum
 Thodi" <shameerali.kolothum.thodi@huawei.com>, Ben Widawsky
 <bwidawsk@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 2/2] hw/cxl: Fix wrong query of target ports
Date: Mon, 8 Aug 2022 13:20:51 +0100
Message-ID: <20220808122051.14822-3-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220808122051.14822-1-Jonathan.Cameron@huawei.com>
References: <20220808122051.14822-1-Jonathan.Cameron@huawei.com>
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

Two issues were present in this code:
1) Check on which register to look in was inverted.
2) Both branches use the _LO register.

Whilst here moved to extract32() rather than hand rolling
the field extraction as simpler and hopefully less error prone.

Fixes Coverity CID: 1488873

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/cxl/cxl-host.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
index faa68ef038..1adf61231a 100644
--- a/hw/cxl/cxl-host.c
+++ b/hw/cxl/cxl-host.c
@@ -104,7 +104,6 @@ static bool cxl_hdm_find_target(uint32_t *cache_mem, hwaddr addr,
     uint32_t ctrl;
     uint32_t ig_enc;
     uint32_t iw_enc;
-    uint32_t target_reg;
     uint32_t target_idx;
 
     ctrl = cache_mem[R_CXL_HDM_DECODER0_CTRL];
@@ -116,14 +115,13 @@ static bool cxl_hdm_find_target(uint32_t *cache_mem, hwaddr addr,
     iw_enc = FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, IW);
     target_idx = (addr / cxl_decode_ig(ig_enc)) % (1 << iw_enc);
 
-    if (target_idx > 4) {
-        target_reg = cache_mem[R_CXL_HDM_DECODER0_TARGET_LIST_LO];
-        target_reg >>= target_idx * 8;
+    if (target_idx < 4) {
+        *target = extract32(cache_mem[R_CXL_HDM_DECODER0_TARGET_LIST_LO],
+                            target_idx * 8, 8);
     } else {
-        target_reg = cache_mem[R_CXL_HDM_DECODER0_TARGET_LIST_LO];
-        target_reg >>= (target_idx - 4) * 8;
+        *target = extract32(cache_mem[R_CXL_HDM_DECODER0_TARGET_LIST_HI],
+                            (target_idx - 4) * 8, 8);
     }
-    *target = target_reg & 0xff;
 
     return true;
 }
-- 
2.32.0


