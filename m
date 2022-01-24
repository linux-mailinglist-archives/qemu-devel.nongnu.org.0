Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53304987C7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 19:06:29 +0100 (CET)
Received: from localhost ([::1]:33540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC3jY-0006m0-Tv
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 13:06:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nC3Bk-0007Kz-EY
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:31:34 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nC3Bd-0001X8-Pq
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:31:27 -0500
Received: from fraeml708-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JjH4c73MMz67mXw;
 Tue, 25 Jan 2022 01:28:00 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml708-chm.china.huawei.com (10.206.15.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 24 Jan 2022 18:31:23 +0100
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 24 Jan 2022 17:31:23 +0000
To: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, <linuxarm@huawei.com>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: [PATCH v4 28/42] hw/cxl/component: Add utils for interleave parameter
 encoding/decoding
Date: Mon, 24 Jan 2022 17:16:51 +0000
Message-ID: <20220124171705.10432-29-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml740-chm.china.huawei.com (10.201.108.190) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

From: Jonathan Cameron <jonathan.cameron@huawei.com>

Both registers and the CFMWS entries in CDAT use simple encodings
for the number of interleave ways and the interleave granularity.
Introduce simple conversion functions to/from the unencoded
number / size.  So far the iw decode has not been needed so is
it not implemented.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/cxl/cxl-component-utils.c   | 34 ++++++++++++++++++++++++++++++++++
 include/hw/cxl/cxl_component.h |  8 ++++++++
 2 files changed, 42 insertions(+)

diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
index 5007b29ebb..be2c5599d6 100644
--- a/hw/cxl/cxl-component-utils.c
+++ b/hw/cxl/cxl-component-utils.c
@@ -9,6 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qapi/error.h"
 #include "hw/pci/pci.h"
 #include "hw/cxl/cxl.h"
 
@@ -210,3 +211,36 @@ void cxl_component_create_dvsec(CXLComponentState *cxl, uint16_t length,
     range_init_nofail(&cxl->dvsecs[type], cxl->dvsec_offset, length);
     cxl->dvsec_offset += length;
 }
+
+uint8_t cxl_interleave_ways_enc(int iw, Error **errp)
+{
+    switch (iw) {
+    case 1: return 0x0;
+    case 2: return 0x1;
+    case 4: return 0x2;
+    case 8: return 0x3;
+    case 16: return 0x4;
+    case 3: return 0x8;
+    case 6: return 0x9;
+    case 12: return 0xa;
+    default:
+        error_setg(errp, "Interleave ways: %d not supported", iw);
+        return 0;
+    }
+}
+
+uint8_t cxl_interleave_granularity_enc(uint64_t gran, Error **errp)
+{
+    switch (gran) {
+    case 256: return 0;
+    case 512: return 1;
+    case 1024: return 2;
+    case 2048: return 3;
+    case 4096: return 4;
+    case 8192: return 5;
+    case 16384: return 6;
+    default:
+        error_setg(errp, "Interleave granularity: %lu invalid", gran);
+        return 0;
+    }
+}
diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_component.h
index 30e576351d..d30c3f4716 100644
--- a/include/hw/cxl/cxl_component.h
+++ b/include/hw/cxl/cxl_component.h
@@ -193,4 +193,12 @@ void cxl_component_register_init_common(uint32_t *reg_state,
 void cxl_component_create_dvsec(CXLComponentState *cxl_cstate, uint16_t length,
                                 uint16_t type, uint8_t rev, uint8_t *body);
 
+uint8_t cxl_interleave_ways_enc(int iw, Error **errp);
+uint8_t cxl_interleave_granularity_enc(uint64_t gran, Error **errp);
+
+static inline hwaddr cxl_decode_ig(int ig)
+{
+    return 1 << (ig + 8);
+}
+
 #endif
-- 
2.32.0


