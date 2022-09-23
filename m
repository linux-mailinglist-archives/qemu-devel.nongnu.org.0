Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC575E7FA6
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 18:24:36 +0200 (CEST)
Received: from localhost ([::1]:58782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oblTf-0006sT-Ie
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 12:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oblO3-0001Q9-Tt
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 12:18:48 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oblNx-00063R-3w
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 12:18:44 -0400
Received: from fraeml704-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MYxz725JGz67PwL;
 Sat, 24 Sep 2022 00:13:39 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml704-chm.china.huawei.com (10.206.15.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.31; Fri, 23 Sep 2022 18:18:29 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 17:18:29 +0100
To: <linux-cxl@vger.kernel.org>, <qemu-devel@nongnu.org>, "Michael S .
 Tsirkin" <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>
CC: <linuxarm@huawei.com>
Subject: [PATCH] mem/cxl-type3: Add sn option to provide serial number for PCI
 ecap
Date: Fri, 23 Sep 2022 17:18:35 +0100
Message-ID: <20220923161835.9805-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

The Device Serial Number Extended Capability PCI r6.0 sec 7.9.3
provides a standard way to provide a device serial number as
an IEEE defined 64-bit extended unique identifier EUI-64.

CXL 2.0 section 8.1.12.2 Memory Device PCIe Capabilities and
Extended Capabilities requires this to be used to uniquely
identify CXL memory devices.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---

This is the missing element to be able to use the Linux kernel
support for PMEM region creation.  Without this you can create
a region, but not remount it after reboot (as the label
is not valid).

 hw/mem/cxl_type3.c          | 14 +++++++++++++-
 include/hw/cxl/cxl_device.h |  1 +
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 3bf2869573..e0c1535b73 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -14,6 +14,12 @@
 #include "sysemu/hostmem.h"
 #include "hw/cxl/cxl.h"
 
+/*
+ * Null value of all Fs suggested by IEEE RA guidelines for use of
+ * EU, OUI and CID
+ */
+#define UI64_NULL ~(0ULL)
+
 static void build_dvsecs(CXLType3Dev *ct3d)
 {
     CXLComponentState *cxl_cstate = &ct3d->cxl_cstate;
@@ -149,7 +155,12 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     pci_config_set_class(pci_conf, PCI_CLASS_MEMORY_CXL);
 
     pcie_endpoint_cap_init(pci_dev, 0x80);
-    cxl_cstate->dvsec_offset = 0x100;
+    if (ct3d->sn != UI64_NULL) {
+        pcie_dev_ser_num_init(pci_dev, 0x100, ct3d->sn);
+        cxl_cstate->dvsec_offset = 0x100 + 0x0c;
+    } else {
+        cxl_cstate->dvsec_offset = 0x100;
+    }
 
     ct3d->cxl_cstate.pdev = pci_dev;
     build_dvsecs(ct3d);
@@ -275,6 +286,7 @@ static Property ct3_props[] = {
                      HostMemoryBackend *),
     DEFINE_PROP_LINK("lsa", CXLType3Dev, lsa, TYPE_MEMORY_BACKEND,
                      HostMemoryBackend *),
+    DEFINE_PROP_UINT64("sn", CXLType3Dev, sn, UI64_NULL),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 1e141b6621..e4d221cdb3 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -237,6 +237,7 @@ struct CXLType3Dev {
     /* Properties */
     HostMemoryBackend *hostmem;
     HostMemoryBackend *lsa;
+    uint64_t sn;
 
     /* State */
     AddressSpace hostmem_as;
-- 
2.32.0


