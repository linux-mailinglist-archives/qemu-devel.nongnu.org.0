Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FCA563458
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 15:27:30 +0200 (CEST)
Received: from localhost ([::1]:42202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7GgD-00055f-GM
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 09:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o7GdG-0001NV-Ts
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:24:26 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o7GdC-0005Fn-BF
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:24:25 -0400
Received: from fraeml711-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LZG9Y0nnXz67rWf;
 Fri,  1 Jul 2022 21:23:29 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml711-chm.china.huawei.com (10.206.15.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 1 Jul 2022 15:24:20 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 1 Jul 2022 14:24:19 +0100
To: <linuxarm@huawei.com>, <qemu-devel@nongnu.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>
CC: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>, "Ben
 Widawsky" <bwidawsk@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 3/3] hw/cxl: Fix size of constant in interleave granularity
 function.
Date: Fri, 1 Jul 2022 14:23:00 +0100
Message-ID: <20220701132300.2264-4-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220701132300.2264-1-Jonathan.Cameron@huawei.com>
References: <20220701132300.2264-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml738-chm.china.huawei.com (10.201.108.188) To
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

Whilst the interleave granularity is always small enough that this isn't
a real problem (much less than 4GiB) let's change the constant
to ULL to fix the coverity warning.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: 829de299d1 ("hw/cxl/component: Add utils for interleave parameter encoding/decoding")
Fixes: Coverity CID 1488868
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 include/hw/cxl/cxl_component.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_component.h
index 70b5018156..94ec2f07d7 100644
--- a/include/hw/cxl/cxl_component.h
+++ b/include/hw/cxl/cxl_component.h
@@ -215,7 +215,7 @@ uint8_t cxl_interleave_granularity_enc(uint64_t gran, Error **errp);
 
 static inline hwaddr cxl_decode_ig(int ig)
 {
-    return 1 << (ig + 8);
+    return 1ULL << (ig + 8);
 }
 
 CXLComponentState *cxl_get_hb_cstate(PCIHostState *hb);
-- 
2.32.0


