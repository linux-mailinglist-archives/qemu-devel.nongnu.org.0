Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6B12E1A77
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 10:17:37 +0100 (CET)
Received: from localhost ([::1]:55428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ks0H2-0003Cd-NO
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 04:17:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1ks0A5-0003jg-L0
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 04:10:26 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1ks09r-0002aT-LL
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 04:10:23 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D16pF6XGVzM7yb;
 Wed, 23 Dec 2020 17:09:09 +0800 (CST)
Received: from localhost (10.174.184.155) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.498.0; Wed, 23 Dec 2020
 17:09:54 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 5/8] acpi/gpex: Append pxb devs in ascending order
Date: Wed, 23 Dec 2020 17:08:33 +0800
Message-ID: <20201223090836.9075-6-cenjiahui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223090836.9075-1-cenjiahui@huawei.com>
References: <20201223090836.9075-1-cenjiahui@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=cenjiahui@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: xieyingtai@huawei.com, Jiahui Cen <cenjiahui@huawei.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>, Paolo
 Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The overlap check of IO resource window would fail when Linux kernel
registers an IO resource [b, c) earlier than another resource [a, b).
Though this incorrect check could be fixed by [1], it would be better to
append pxb devs into DSDT table in ascending order.

[1]: https://lore.kernel.org/lkml/20201218062335.5320-1-cenjiahui@huawei.com/

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 hw/pci-host/gpex-acpi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index 4bf1e94309..95a7a0f12b 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -141,7 +141,7 @@ static void acpi_dsdt_add_pci_osc(Aml *dev)
 void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
 {
     int nr_pcie_buses = cfg->ecam.size / PCIE_MMCFG_SIZE_MIN;
-    Aml *method, *crs, *dev, *rbuf;
+    Aml *method, *crs, *dev, *rbuf, *pxb_devs[nr_pcie_buses];
     PCIBus *bus = cfg->bus;
     CrsRangeSet crs_range_set;
     CrsRangeEntry *entry;
@@ -149,6 +149,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
 
     /* start to construct the tables for pxb */
     crs_range_set_init(&crs_range_set);
+    memset(pxb_devs, 0, sizeof(pxb_devs));
     if (bus) {
         QLIST_FOREACH(bus, &bus->child, sibling) {
             uint8_t bus_num = pci_bus_num(bus);
@@ -190,7 +191,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
 
             acpi_dsdt_add_pci_osc(dev);
 
-            aml_append(scope, dev);
+            pxb_devs[bus_num] = dev;
         }
     }
 
@@ -278,5 +279,11 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
     aml_append(dev, dev_res0);
     aml_append(scope, dev);
 
+    for (i = 0; i < ARRAY_SIZE(pxb_devs); i++) {
+        if (pxb_devs[i]) {
+            aml_append(scope, pxb_devs[i]);
+        }
+    }
+
     crs_range_set_free(&crs_range_set);
 }
-- 
2.29.2


