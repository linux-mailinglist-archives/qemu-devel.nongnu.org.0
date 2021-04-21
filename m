Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FCD3666BA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 10:07:41 +0200 (CEST)
Received: from localhost ([::1]:41476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ7tc-00031y-IS
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 04:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lZ7rc-0001Bu-4j; Wed, 21 Apr 2021 04:05:36 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:5039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lZ7rZ-00023x-Tp; Wed, 21 Apr 2021 04:05:35 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FQCjW5fmTzlYqR;
 Wed, 21 Apr 2021 16:03:27 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Wed, 21 Apr 2021
 16:05:15 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH RFC v3 4/8] hw/i386: Add a pc machine option to bypass iommu
 for primary bus
Date: Wed, 21 Apr 2021 08:04:59 +0000
Message-ID: <1618992303-19556-5-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1618992303-19556-1-git-send-email-wangxingang5@huawei.com>
References: <1618992303-19556-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=wangxingang5@huawei.com; helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: xieyingtai@huawei.com, cenjiahui@huawei.com, wangxingang5@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

Add a bypass_iommu pc machine option to bypass iommu translation
for the primary root bus.
The option can be used as manner:
qemu-system-x86_64 -machine q35,bypass_iommu=true

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 hw/i386/pc.c         | 18 ++++++++++++++++++
 hw/pci-host/q35.c    |  1 +
 include/hw/i386/pc.h |  1 +
 3 files changed, 20 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8a84b25a03..2266a0520f 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1529,6 +1529,20 @@ static void pc_machine_set_hpet(Object *obj, bool value, Error **errp)
     pcms->hpet_enabled = value;
 }
 
+static bool pc_machine_get_bypass_iommu(Object *obj, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    return pcms->bypass_iommu;
+}
+
+static void pc_machine_set_bypass_iommu(Object *obj, bool value, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    pcms->bypass_iommu = value;
+}
+
 static void pc_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
                                             const char *name, void *opaque,
                                             Error **errp)
@@ -1628,6 +1642,7 @@ static void pc_machine_initfn(Object *obj)
 #ifdef CONFIG_HPET
     pcms->hpet_enabled = true;
 #endif
+    pcms->bypass_iommu = false;
 
     pc_system_flash_create(pcms);
     pcms->pcspk = isa_new(TYPE_PC_SPEAKER);
@@ -1752,6 +1767,9 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_add_bool(oc, "hpet",
         pc_machine_get_hpet, pc_machine_set_hpet);
 
+    object_class_property_add_bool(oc, "bypass_iommu",
+        pc_machine_get_bypass_iommu, pc_machine_set_bypass_iommu);
+
     object_class_property_add(oc, PC_MACHINE_MAX_FW_SIZE, "size",
         pc_machine_get_max_fw_size, pc_machine_set_max_fw_size,
         NULL, NULL);
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 2eb729dff5..ade05a5539 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -64,6 +64,7 @@ static void q35_host_realize(DeviceState *dev, Error **errp)
                                 s->mch.address_space_io,
                                 0, TYPE_PCIE_BUS);
     PC_MACHINE(qdev_get_machine())->bus = pci->bus;
+    pci->bypass_iommu = PC_MACHINE(qdev_get_machine())->bypass_iommu;
     qdev_realize(DEVICE(&s->mch), BUS(pci->bus), &error_fatal);
 }
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index dcf060b791..83ee8f2a01 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -45,6 +45,7 @@ typedef struct PCMachineState {
     bool sata_enabled;
     bool pit_enabled;
     bool hpet_enabled;
+    bool bypass_iommu;
     uint64_t max_fw_size;
 
     /* NUMA information: */
-- 
2.19.1


