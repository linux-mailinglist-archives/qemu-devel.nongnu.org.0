Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4D25FD91E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 14:19:55 +0200 (CEST)
Received: from localhost ([::1]:56478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oixBq-0000MF-OU
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 08:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oiwti-00064U-4d
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:01:10 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oiwtg-0006kg-Ip
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:01:09 -0400
Received: from fraeml710-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Mp7Pb3j2Dz6880d;
 Thu, 13 Oct 2022 20:00:19 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml710-chm.china.huawei.com (10.206.15.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 14:01:07 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 13:01:06 +0100
To: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, Ben Widawsky
 <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>, Huai-Cheng Kuo
 <hchkuo@avery-design.com.tw>, Chris Browy <cbrowy@avery-design.com>, "Gregory
 Price" <gregory.price@memverge.com>, <ira.weiny@intel.com>
CC: <linuxarm@huawei.com>
Subject: [PATCH v8 2/5] hw/mem/cxl-type3: Add MSIX support
Date: Thu, 13 Oct 2022 13:00:06 +0100
Message-ID: <20221013120009.15541-3-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221013120009.15541-1-Jonathan.Cameron@huawei.com>
References: <20221013120009.15541-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
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

This will be used by several upcoming patch sets so break it out
such that it doesn't matter which one lands first.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/mem/cxl_type3.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index a71bf1afeb..568c9d62f5 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -13,6 +13,7 @@
 #include "qemu/rcu.h"
 #include "sysemu/hostmem.h"
 #include "hw/cxl/cxl.h"
+#include "hw/pci/msix.h"
 
 /*
  * Null value of all Fs suggested by IEEE RA guidelines for use of
@@ -146,6 +147,8 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     ComponentRegisters *regs = &cxl_cstate->crb;
     MemoryRegion *mr = &regs->component_registers;
     uint8_t *pci_conf = pci_dev->config;
+    unsigned short msix_num = 1;
+    int i;
 
     if (!cxl_setup_memory(ct3d, errp)) {
         return;
@@ -180,6 +183,12 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
                      PCI_BASE_ADDRESS_SPACE_MEMORY |
                          PCI_BASE_ADDRESS_MEM_TYPE_64,
                      &ct3d->cxl_dstate.device_registers);
+
+    /* MSI(-X) Initailization */
+    msix_init_exclusive_bar(pci_dev, msix_num, 4, NULL);
+    for (i = 0; i < msix_num; i++) {
+        msix_vector_use(pci_dev, i);
+    }
 }
 
 static void ct3_exit(PCIDevice *pci_dev)
-- 
2.37.2


