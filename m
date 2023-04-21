Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAB26EAEC9
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:10:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pptKI-0004Vz-Lx; Fri, 21 Apr 2023 12:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pptKE-0004TH-LS
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:09:32 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pptKB-0006Nk-Vy
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:09:29 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q2zt16Z0zz6J6hF;
 Sat, 22 Apr 2023 00:06:33 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 17:09:25 +0100
To: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>
CC: Fan Ni <fan.ni@samsung.com>, <linuxarm@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Gregory Price
 <gourry.memverge@gmail.com>, Mike Maslenkin <mike.maslenkin@gmail.com>, Dave
 Jiang <dave.jiang@intel.com>, <linux-cxl@vger.kernel.org>
Subject: [PATCH v5 2/3] hw/mem: Use memory_region_size() in cxl_type3
Date: Fri, 21 Apr 2023 17:08:26 +0100
Message-ID: <20230421160827.2227-3-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230421160827.2227-1-Jonathan.Cameron@huawei.com>
References: <20230421160827.2227-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Accessors prefered over direct use of int128_get64() as they
clamp out of range values.  None are expected here but
cleaner to always use the accessor than mix and match.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

---
v5: New patch to tidy up existing instance before adding more of
    them.
  - Use memory_region_size() to access the size of memory regions.
    We may eventually need to allow for larger addresses but it
    is unlikely to be a problem any time soon.
---
 hw/mem/cxl_type3.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 1bd5963a3f..2db756851c 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -52,7 +52,7 @@ static int ct3_build_cdat_entries_for_mr(CDATSubHeader **cdat_table,
         .DSMADhandle = dsmad_handle,
         .flags = CDAT_DSMAS_FLAG_NV,
         .DPA_base = 0,
-        .DPA_length = int128_get64(mr->size),
+        .DPA_length = memory_region_size(mr),
     };
 
     /* For now, no memory side cache, plausiblish numbers */
@@ -133,7 +133,7 @@ static int ct3_build_cdat_entries_for_mr(CDATSubHeader **cdat_table,
         /* Reserved - the non volatile from DSMAS matters */
         .EFI_memory_type_attr = 2,
         .DPA_offset = 0,
-        .DPA_length = int128_get64(mr->size),
+        .DPA_length = memory_region_size(mr),
     };
 
     /* Header always at start of structure */
@@ -698,7 +698,7 @@ MemTxResult cxl_type3_read(PCIDevice *d, hwaddr host_addr, uint64_t *data,
         return MEMTX_ERROR;
     }
 
-    if (dpa_offset > int128_get64(mr->size)) {
+    if (dpa_offset > memory_region_size(mr)) {
         return MEMTX_ERROR;
     }
 
@@ -721,7 +721,7 @@ MemTxResult cxl_type3_write(PCIDevice *d, hwaddr host_addr, uint64_t data,
         return MEMTX_OK;
     }
 
-    if (dpa_offset > int128_get64(mr->size)) {
+    if (dpa_offset > memory_region_size(mr)) {
         return MEMTX_OK;
     }
     return address_space_write(&ct3d->hostmem_as, dpa_offset, attrs,
-- 
2.37.2


