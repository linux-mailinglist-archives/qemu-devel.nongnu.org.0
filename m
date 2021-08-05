Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 457793E14F0
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 14:42:06 +0200 (CEST)
Received: from localhost ([::1]:47870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBchI-0006bJ-Rv
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 08:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mBcf0-00044n-6Z; Thu, 05 Aug 2021 08:39:42 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mBcew-00060j-Ab; Thu, 05 Aug 2021 08:39:41 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GgSps3Xk6zYlSL;
 Thu,  5 Aug 2021 20:39:17 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 5 Aug 2021 20:39:24 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 5 Aug 2021 20:39:24 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>
Subject: [PATCH v5 1/5] hw/arm/virt: Only describe cpu topology to guest since
 virt 6.2
Date: Thu, 5 Aug 2021 20:39:17 +0800
Message-ID: <20210805123921.62540-2-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210805123921.62540-1-wangyanan55@huawei.com>
References: <20210805123921.62540-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On existing older machine types, without cpu topology described
in ACPI or DT, the guest will populate one by default. With the
topology described, it will read the information and set up its
topology as instructed, but that may not be the same as what was
getting used by default. It's possible that a user application
has a dependency on the default topology and if the default one
gets changed it will probably behave differently. So we should
only describe cpu topology information to the guest on 6.2 and
later machine types.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt.c         | 3 +++
 include/hw/arm/virt.h | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ae029680da..82f2eba6bd 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2795,9 +2795,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 2)
 
 static void virt_machine_6_1_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_6_2_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
     mc->smp_props.prefer_sockets = true;
+    vmc->no_cpu_topology = true;
 }
 DEFINE_VIRT_MACHINE(6, 1)
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 9661c46699..6ab21ea90e 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -124,11 +124,13 @@ struct VirtMachineClass {
     bool claim_edge_triggered_timers;
     bool smbios_old_sys_ver;
     bool no_highmem_ecam;
-    bool no_ged;   /* Machines < 4.2 has no support for ACPI GED device */
+    bool no_ged;   /* Machines < 4.2 have no support for ACPI GED device */
     bool kvm_no_adjvtime;
     bool no_kvm_steal_time;
     bool acpi_expose_flash;
     bool no_secure_gpio;
+    /* Machines < 6.2 have no support for describing cpu topology to guest */
+    bool no_cpu_topology;
 };
 
 struct VirtMachineState {
-- 
2.19.1


