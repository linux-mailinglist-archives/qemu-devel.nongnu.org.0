Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEF756FF87
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 12:53:55 +0200 (CEST)
Received: from localhost ([::1]:58488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAr34-0000Nj-Vz
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 06:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1oAqx8-0007JW-GH; Mon, 11 Jul 2022 06:47:48 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1oAqx6-0000dA-Vr; Mon, 11 Jul 2022 06:47:46 -0400
Received: from fraeml734-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LhL8C1QV0z687Rd;
 Mon, 11 Jul 2022 18:43:23 +0800 (CST)
Received: from lhreml751-chm.china.huawei.com (10.201.108.201) by
 fraeml734-chm.china.huawei.com (10.206.15.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 11 Jul 2022 12:47:42 +0200
Received: from O84201547D.china.huawei.com (10.122.247.218) by
 lhreml751-chm.china.huawei.com (10.201.108.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 11 Jul 2022 11:47:42 +0100
To: <jonathan.cameron@huawei.com>, <qemu-devel@nongnu.org>
CC: <yangyicong@huawei.com>, <chenxiang66@hisilicon.com>,
 <linuxarm@huawei.com>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <imammedo@redhat.com>, <wangyanan55@huawei.com>,
 <marcel.apfelbaum@gmail.com>, <eduardo@habkost.net>, <Brice.Goglin@inria.fr>, 
 <mst@redhat.com>
Subject: [PATCH 6/8] hw/arm/virt: Enable HMAT on arm virt machine
Date: Mon, 11 Jul 2022 11:44:34 +0100
Message-ID: <20220711104436.8363-7-hesham.almatary@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711104436.8363-1-hesham.almatary@huawei.com>
References: <20220711104436.8363-1-hesham.almatary@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.218]
X-ClientProxiedBy: lhreml732-chm.china.huawei.com (10.201.108.83) To
 lhreml751-chm.china.huawei.com (10.201.108.201)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=hesham.almatary@huawei.com; helo=frasgout.his.huawei.com
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
Reply-to:  Hesham Almatary <hesham.almatary@huawei.com>
From:  Hesham Almatary via <qemu-devel@nongnu.org>

From: Xiang Chen <chenxiang66@hisilicon.com>

Since the patchset ("Build ACPI Heterogeneous Memory Attribute Table (HMAT)"),
HMAT is supported, but only x86 is enabled. Enable HMAT on arm virt machine.

Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
---
 hw/arm/Kconfig           | 1 +
 hw/arm/virt-acpi-build.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 15fa79afd3..17fcde8e1c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -30,6 +30,7 @@ config ARM_VIRT
     select ACPI_VIOT
     select VIRTIO_MEM_SUPPORTED
     select ACPI_CXL
+    select ACPI_HMAT
 
 config CHEETAH
     bool
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 449fab0080..f19b55e486 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -42,6 +42,7 @@
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/generic_event_device.h"
 #include "hw/acpi/tpm.h"
+#include "hw/acpi/hmat.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
@@ -990,6 +991,12 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
             build_slit(tables_blob, tables->linker, ms, vms->oem_id,
                        vms->oem_table_id);
         }
+
+        if (ms->numa_state->hmat_enabled) {
+            acpi_add_table(table_offsets, tables_blob);
+            build_hmat(tables_blob, tables->linker, ms->numa_state,
+                       vms->oem_id, vms->oem_table_id);
+        }
     }
 
     if (ms->nvdimms_state->is_enabled) {
-- 
2.25.1


