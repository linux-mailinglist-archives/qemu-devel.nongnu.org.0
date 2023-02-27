Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B958C6A4725
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 17:38:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWgVU-0002Ly-GU; Mon, 27 Feb 2023 11:37:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1pWgVN-0001kg-BK; Mon, 27 Feb 2023 11:37:37 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1pWgVL-000600-Mb; Mon, 27 Feb 2023 11:37:37 -0500
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31RFwwUw030574; Mon, 27 Feb 2023 16:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=c0UG+nEBmzg7tdv9ex8dMP9Qxk+vYCaG2dOlM/WmGfA=;
 b=tA5m6cL/iNSdHvKQspOnVy669Vyyo4eFC18jGqYmdg9Q0b61V5LJzbhg0piA1/57nRSd
 aB84NbPDWZ+SlkZiE8/p8m1bcIQ7utuDLtjPcQJn9SQzEta/ujk/R2iCWcn1WqIc13c5
 j5/emXg1Uhnqfh+p/L2HUe9bI7kDfC+5N1zKj5UwgbLZoWxCMHcN9eBQc5virYDd36kb
 QtnfTnxFbG0zbJCBQuzMsZjbKqI53hmqVD/D3vCDcTm3z8VcKGwXrY7mgeyvpGjDmtGS
 2tj8lopH40XlXX3b8YIUMhkbtw5F3Fj3ql3rFWYk3oI4BfRxAkFw2MkK/9eCce+xwVf2 yg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nyba244dj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Feb 2023 16:37:31 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31RFwRiF015880; Mon, 27 Feb 2023 16:37:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8s5sxyr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Feb 2023 16:37:30 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31RGbMkI006629;
 Mon, 27 Feb 2023 16:37:29 GMT
Received: from mlluis-mac.uk.oracle.com (dhcp-10-175-167-110.vpn.oracle.com
 [10.175.167.110])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3ny8s5sxr5-3; Mon, 27 Feb 2023 16:37:29 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Haibo Xu <haibo.xu@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Marc Zyngier <maz@kernel.org>
Cc: Miguel Luis <miguel.luis@oracle.com>
Subject: [RFC PATCH 2/5] hw/intc/gicv3: add support for setting KVM vGIC
 maintenance IRQ
Date: Mon, 27 Feb 2023 15:37:15 -0100
Message-Id: <20230227163718.62003-3-miguel.luis@oracle.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227163718.62003-1-miguel.luis@oracle.com>
References: <20230227163718.62003-1-miguel.luis@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_13,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302270129
X-Proofpoint-GUID: NSXk4gj8142VNKu4Aw_ymwhIK0c6P9Lr
X-Proofpoint-ORIG-GUID: NSXk4gj8142VNKu4Aw_ymwhIK0c6P9Lr
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=miguel.luis@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Haibo Xu <haibo.xu@linaro.org>

Use the VGIC maintenance IRQ if VHE is requested. As per the ARM GIC
Architecture Specification for GICv3 and GICv4 Arm strongly recommends that
maintenance interrupts are configured to use INTID 25 matching the
Server Base System Architecture (SBSA) recomendation.

Ref: https://lore.kernel.org/qemu-devel/49a4944e2f148c56938380b981afe154b7a8b7ee.1617281290.git.haibo.xu@linaro.org/

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
[Miguel Luis: avoid direct usage of helpers (_check_attr(); _access())]
Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
---
 hw/arm/virt.c                      |  5 +++++
 hw/intc/arm_gicv3_common.c         |  1 +
 hw/intc/arm_gicv3_kvm.c            | 25 +++++++++++++++++++++++++
 include/hw/intc/arm_gicv3_common.h |  1 +
 4 files changed, 32 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b871350856..377181e009 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -759,6 +759,11 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
             qdev_prop_set_uint32(vms->gic, "redist-region-count[1]",
                 MIN(smp_cpus - redist0_count, redist1_capacity));
         }
+
+        if (kvm_irqchip_in_kernel()) {
+            qdev_prop_set_bit(vms->gic, "has-virtualization-extensions",
+                              vms->virt);
+        }
     } else {
         if (!kvm_irqchip_in_kernel()) {
             qdev_prop_set_bit(vms->gic, "has-virtualization-extensions",
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 351843db4a..e2a6ff1b49 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -563,6 +563,7 @@ static Property arm_gicv3_common_properties[] = {
     DEFINE_PROP_UINT32("revision", GICv3State, revision, 3),
     DEFINE_PROP_BOOL("has-lpi", GICv3State, lpi_enable, 0),
     DEFINE_PROP_BOOL("has-security-extensions", GICv3State, security_extn, 0),
+    DEFINE_PROP_BOOL("has-virtualization-extensions", GICv3State, virt_extn, 0),
     /*
      * Compatibility property: force 8 bits of physical priority, even
      * if the CPU being emulated should have fewer.
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 3ca643ecba..ce924753bb 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -22,6 +22,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/intc/arm_gicv3_common.h"
+#include "hw/arm/virt.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "sysemu/kvm.h"
@@ -803,6 +804,30 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+
+    if (s->virt_extn) {
+        /*
+         * Arm strongly recommends that maintenance interrupts are configured
+         * to use INTID 25. For more information, see Server Base System
+         * Architecture (SBSA)
+         */
+        uint32_t maint_irq = PPI(ARCH_GIC_MAINT_IRQ);
+
+        struct kvm_device_attr kdevattr = {
+            .group = KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ,
+            .addr = (uint64_t)&maint_irq
+        };
+
+        if (!kvm_device_ioctl(s->dev_fd, KVM_GET_DEVICE_ATTR, &kdevattr)) {
+            error_setg(errp, "VGICv3 setting maintenance IRQ are not "
+                            "supported by this host kernel");
+            return;
+        }
+
+        kvm_device_ioctl(s->dev_fd, KVM_SET_DEVICE_ATTR, &kdevattr);
+    }
+
+
     gicv3_init_irqs_and_mmio(s, kvm_arm_gicv3_set_irq, NULL);
 
     for (i = 0; i < s->num_cpu; i++) {
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index ab5182a28a..91e1c1a45a 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -248,6 +248,7 @@ struct GICv3State {
     uint32_t revision;
     bool lpi_enable;
     bool security_extn;
+    bool virt_extn;
     bool force_8bit_prio;
     bool irq_reset_nonsecure;
     bool gicd_no_migration_shift_bug;
-- 
2.39.2


