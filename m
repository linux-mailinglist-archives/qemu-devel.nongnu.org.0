Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44008667076
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 12:06:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFunr-000478-Cp; Thu, 12 Jan 2023 05:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pFuno-00043m-BQ
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:27:20 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pFunl-0000xf-9k
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:27:19 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Nt12426F1z6HJWf;
 Thu, 12 Jan 2023 18:27:08 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Thu, 12 Jan 2023 10:27:14 +0000
To: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
CC: Ben Widawsky <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, Ira Weiny <ira.weiny@intel.com>, Gregory Price
 <gourry.memverge@gmail.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: [PATCH v2 1/8] hw/mem/cxl_type3: Improve error handling in realize()
Date: Thu, 12 Jan 2023 10:26:37 +0000
Message-ID: <20230112102644.27830-2-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230112102644.27830-1-Jonathan.Cameron@huawei.com>
References: <20230112102644.27830-1-Jonathan.Cameron@huawei.com>
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

msix_init_exclusive_bar() can fail, so if it does cleanup the address space.

Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/mem/cxl_type3.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index dae4fd89ca..252822bd82 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -401,7 +401,7 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     MemoryRegion *mr = &regs->component_registers;
     uint8_t *pci_conf = pci_dev->config;
     unsigned short msix_num = 1;
-    int i;
+    int i, rc;
 
     if (!cxl_setup_memory(ct3d, errp)) {
         return;
@@ -438,7 +438,10 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
                      &ct3d->cxl_dstate.device_registers);
 
     /* MSI(-X) Initailization */
-    msix_init_exclusive_bar(pci_dev, msix_num, 4, NULL);
+    rc = msix_init_exclusive_bar(pci_dev, msix_num, 4, NULL);
+    if (rc) {
+        goto err_address_space_free;
+    }
     for (i = 0; i < msix_num; i++) {
         msix_vector_use(pci_dev, i);
     }
@@ -450,6 +453,11 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     cxl_cstate->cdat.free_cdat_table = ct3_free_cdat_table;
     cxl_cstate->cdat.private = ct3d;
     cxl_doe_cdat_init(cxl_cstate, errp);
+    return;
+
+err_address_space_free:
+    address_space_destroy(&ct3d->hostmem_as);
+    return;
 }
 
 static void ct3_exit(PCIDevice *pci_dev)
-- 
2.37.2


