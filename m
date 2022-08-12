Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D5C590A3D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 04:22:46 +0200 (CEST)
Received: from localhost ([::1]:48196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMKJw-00055Z-RM
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 22:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1oMKIP-0003YS-Az; Thu, 11 Aug 2022 22:21:09 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:4518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1oMKIM-0002PB-P9; Thu, 11 Aug 2022 22:21:09 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4M3nPl5pfxzkWKN;
 Fri, 12 Aug 2022 10:17:31 +0800 (CST)
Received: from kwepemm600007.china.huawei.com (7.193.23.208) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 12 Aug 2022 10:20:45 +0800
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 12 Aug 2022 10:20:44 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <peter.maydell@linaro.org>, <shannon.zhaosl@gmail.com>,
 <wanghaibin.wang@huawei.com>, Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] hw/arm/virt-acpi-build: Present the GICR structure properly
 for GICv4
Date: Fri, 12 Aug 2022 10:20:18 +0800
Message-ID: <20220812022018.1069-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=yuzenghui@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Reply-to:  Zenghui Yu <yuzenghui@huawei.com>
From:  Zenghui Yu via <qemu-devel@nongnu.org>

With the introduction of the new TCG GICv4, build_madt() is badly broken
as we do not present any GIC Redistributor structure in MADT for GICv4
guests, so that they have no idea about where the Redistributor
register frames are. This fixes a Linux guest crash at boot time with
ACPI enabled and '-machine gic-version=4'.

While at it, let's convert the remaining hard coded gic_version into
enumeration VIRT_GIC_VERSION_2 for consistency.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
 hw/arm/virt-acpi-build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 449fab0080..9b3aee01bf 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -732,7 +732,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         uint32_t pmu_interrupt = arm_feature(&armcpu->env, ARM_FEATURE_PMU) ?
                                              PPI(VIRTUAL_PMU_IRQ) : 0;
 
-        if (vms->gic_version == 2) {
+        if (vms->gic_version == VIRT_GIC_VERSION_2) {
             physical_base_address = memmap[VIRT_GIC_CPU].base;
             gicv = memmap[VIRT_GIC_VCPU].base;
             gich = memmap[VIRT_GIC_HYP].base;
@@ -762,7 +762,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         build_append_int_noprefix(table_data, armcpu->mp_affinity, 8);
     }
 
-    if (vms->gic_version == 3) {
+    if (vms->gic_version != VIRT_GIC_VERSION_2) {
         build_append_gicr(table_data, memmap[VIRT_GIC_REDIST].base,
                                       memmap[VIRT_GIC_REDIST].size);
         if (virt_gicv3_redist_region_count(vms) == 2) {
-- 
2.33.0


