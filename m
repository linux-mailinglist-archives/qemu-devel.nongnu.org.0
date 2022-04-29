Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 827E3514F0F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:18:21 +0200 (CEST)
Received: from localhost ([::1]:55784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSNs-0007PH-Vt
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nkS0y-0006wL-Cd
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:54:36 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nkS0w-0001mG-Mm
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:54:36 -0400
Received: from fraeml735-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Kqb6N4B80z67J5F;
 Fri, 29 Apr 2022 22:51:40 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml735-chm.china.huawei.com (10.206.15.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 29 Apr 2022 16:54:32 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 29 Apr 2022 15:54:31 +0100
To: <linuxarm@huawei.com>, <qemu-devel@nongnu.org>, <alex.bennee@linaro.org>, 
 Marcel Apfelbaum <marcel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Adam Manzanares
 <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>, <f4bug@amsat.org>, Peter Xu
 <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Saransh Gupta1 <saransh@ibm.com>, Shreyas Shah
 <shreyas.shah@elastics.cloud>, Chris Browy <cbrowy@avery-design.com>,
 "Samarth Saxena" <samarths@cadence.com>, Dan Williams
 <dan.j.williams@intel.com>, <k.jensen@samsung.com>, <dave@stgolabs.net>,
 Alison Schofield <alison.schofield@intel.com>
Subject: [PATCH v10 26/45] hw/cxl/component: Add utils for interleave
 parameter encoding/decoding
Date: Fri, 29 Apr 2022 15:40:51 +0100
Message-ID: <20220429144110.25167-27-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220429144110.25167-1-Jonathan.Cameron@huawei.com>
References: <20220429144110.25167-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml727-chm.china.huawei.com (10.201.108.78) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Jonathan Cameron <jonathan.cameron@huawei.com>

Both registers and the CFMWS entries in CDAT use simple encodings
for the number of interleave ways and the interleave granularity.
Introduce simple conversion functions to/from the unencoded
number / size.  So far the iw decode has not been needed so is
it not implemented.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/cxl/cxl-component-utils.c   | 34 ++++++++++++++++++++++++++++++++++
 include/hw/cxl/cxl_component.h |  8 ++++++++
 2 files changed, 42 insertions(+)

diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
index afc97b17c2..69cb07171c 100644
--- a/hw/cxl/cxl-component-utils.c
+++ b/hw/cxl/cxl-component-utils.c
@@ -9,6 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qapi/error.h"
 #include "hw/pci/pci.h"
 #include "hw/cxl/cxl.h"
 
@@ -329,3 +330,36 @@ void cxl_component_create_dvsec(CXLComponentState *cxl,
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
+        error_setg(errp, "Interleave granularity: %" PRIu64 " invalid", gran);
+        return 0;
+    }
+}
diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_component.h
index 7d8f395cbe..4f69688c47 100644
--- a/include/hw/cxl/cxl_component.h
+++ b/include/hw/cxl/cxl_component.h
@@ -210,4 +210,12 @@ static inline int cxl_decoder_count_enc(int count)
     return 0;
 }
 
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


