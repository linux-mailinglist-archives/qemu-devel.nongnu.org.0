Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 551593F7585
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:03:48 +0200 (CEST)
Received: from localhost ([::1]:39130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsZH-0007yy-D6
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chunming_li1234@163.com>)
 id 1mIoDK-0003sp-Ez; Wed, 25 Aug 2021 04:24:50 -0400
Received: from m12-13.163.com ([220.181.12.13]:48195)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chunming_li1234@163.com>)
 id 1mIoDG-00042D-7A; Wed, 25 Aug 2021 04:24:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=yXb10IBw2Dmsva37a/
 iIfP6RK98iu25Wb6MGYY97IB8=; b=Vu40xGlRcyfX6dUcuzurelRjrY8SMrYhXX
 havQSj4v4a4xFpARn7QD0GACH0ss94aAn+gJywQUACEUuwzrFD5ffOK5CInns5a3
 XB+9C4xF1wCVkFK1eqmZ5CcgGt/bigGTBAAi224N3QTMAAyVAqzkE37YyxuGA9Sf
 fHq6qM+EY=
Received: from localhost.localdomain (unknown [180.169.130.89])
 by smtp9 (Coremail) with SMTP id DcCowABnCwWL+iVhtO7SAQ--.38418S4;
 Wed, 25 Aug 2021 16:08:50 +0800 (CST)
From: chunming <chunming_li1234@163.com>
To: eric.auger@redhat.com,
	peter.maydell@linaro.org
Subject: [PATCH v5 1/4] hw/arm/smmuv3: Support non PCI/PCIe device connect
 with SMMU v3
Date: Wed, 25 Aug 2021 16:08:39 +0800
Message-Id: <1629878922-173270-2-git-send-email-chunming_li1234@163.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629878922-173270-1-git-send-email-chunming_li1234@163.com>
References: <1629878922-173270-1-git-send-email-chunming_li1234@163.com>
X-CM-TRANSID: DcCowABnCwWL+iVhtO7SAQ--.38418S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr13ZF13CF48KrW5Zr4rGrg_yoWrCFWxpa
 s5AFn8Kr4UG3WfC3saqr1a9F15Xw1kGF18Kr1xGr93AF4UtryrJr4DK3WYgrykGrWvva13
 uayxWa18ur17X3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bVKsbUUUUU=
X-Originating-IP: [180.169.130.89]
X-CM-SenderInfo: xfkx0zplqjszjlrsjki6rwjhhfrp/1tbiMBL5dlWByxaU2QAAsp
Received-SPF: pass client-ip=220.181.12.13;
 envelope-from=chunming_li1234@163.com; helo=m12-13.163.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 25 Aug 2021 09:00:24 -0400
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
Cc: renwei.liu@verisilicon.com, qemu-arm@nongnu.org,
 jianxian.wen@verisilicon.com, qemu-devel@nongnu.org,
 chunming <chunming.li@verisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: chunming <chunming.li@verisilicon.com>

  . Add sid-map property to store non PCI/PCIe devices SID
  . Create IOMMU memory regions for non PCI/PCIe devices based on their SID
  . Update SID getting strategy for PCI/PCIe and non PCI/PCIe devices

Signed-off-by: chunming <chunming.li@verisilicon.com>
---
 hw/arm/smmuv3.c              | 46 ++++++++++++++++++++++++++++++++++++
 include/hw/arm/smmu-common.h |  7 +++++-
 include/hw/arm/smmuv3.h      |  2 ++
 3 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 01b60bee49..11d7fe8423 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -32,6 +32,7 @@
 #include "hw/arm/smmuv3.h"
 #include "smmuv3-internal.h"
 #include "smmu-internal.h"
+#include "hw/qdev-properties.h"
 
 /**
  * smmuv3_trigger_irq - pulse @irq if enabled and update
@@ -1430,6 +1431,19 @@ static void smmu_reset(DeviceState *dev)
     smmuv3_init_regs(s);
 }
 
+static SMMUDevice *smmu_find_peri_sdev(SMMUState *s, uint16_t sid)
+{
+    SMMUDevice *sdev;
+
+    QLIST_FOREACH(sdev, &s->peri_sdev_list, next) {
+        if (smmu_get_sid(sdev) == sid) {
+            return sdev;
+        }
+    }
+
+    return NULL;
+}
+
 static void smmu_realize(DeviceState *d, Error **errp)
 {
     SMMUState *sys = ARM_SMMU(d);
@@ -1437,6 +1451,9 @@ static void smmu_realize(DeviceState *d, Error **errp)
     SMMUv3Class *c = ARM_SMMUV3_GET_CLASS(s);
     SysBusDevice *dev = SYS_BUS_DEVICE(d);
     Error *local_err = NULL;
+    SMMUDevice *sdev;
+    char *name = NULL;
+    uint16_t sid = 0;
 
     c->parent_realize(d, &local_err);
     if (local_err) {
@@ -1454,6 +1471,28 @@ static void smmu_realize(DeviceState *d, Error **errp)
     sysbus_init_mmio(dev, &sys->iomem);
 
     smmu_init_irq(s, dev);
+
+    /* Create IOMMU memory region for peripheral devices based on their SID */
+    for (int i = 0; i < s->num_sid; i++) {
+        sid = s->sid_map[i];
+        sdev = smmu_find_peri_sdev(sys, sid);
+        if (sdev) {
+            continue;
+        }
+
+        sdev = g_new0(SMMUDevice, 1);
+        sdev->smmu = sys;
+        sdev->bus = NULL;
+        sdev->devfn = sid;
+
+        name = g_strdup_printf("%s-peri-%d", sys->mrtypename, sid);
+        memory_region_init_iommu(&sdev->iommu, sizeof(sdev->iommu),
+                                 sys->mrtypename,
+                                 OBJECT(sys), name, 1ULL << SMMU_MAX_VA_BITS);
+
+        QLIST_INSERT_HEAD(&sys->peri_sdev_list, sdev, next);
+        g_free(name);
+    }
 }
 
 static const VMStateDescription vmstate_smmuv3_queue = {
@@ -1506,6 +1545,12 @@ static void smmuv3_instance_init(Object *obj)
     /* Nothing much to do here as of now */
 }
 
+static Property smmuv3_properties[] = {
+    DEFINE_PROP_ARRAY("sid-map", SMMUv3State, num_sid, sid_map,
+                      qdev_prop_uint16, uint16_t),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void smmuv3_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -1515,6 +1560,7 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
     device_class_set_parent_reset(dc, smmu_reset, &c->parent_reset);
     c->parent_realize = dc->realize;
     dc->realize = smmu_realize;
+    device_class_set_props(dc, smmuv3_properties);
 }
 
 static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 706be3c6d0..95cd12a4b5 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -117,6 +117,7 @@ struct SMMUState {
     QLIST_HEAD(, SMMUDevice) devices_with_notifiers;
     uint8_t bus_num;
     PCIBus *primary_bus;
+    QLIST_HEAD(, SMMUDevice) peri_sdev_list;
 };
 
 struct SMMUBaseClass {
@@ -138,7 +139,11 @@ SMMUPciBus *smmu_find_smmu_pcibus(SMMUState *s, uint8_t bus_num);
 /* Return the stream ID of an SMMU device */
 static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
 {
-    return PCI_BUILD_BDF(pci_bus_num(sdev->bus), sdev->devfn);
+    if (sdev->bus == NULL) {
+        return sdev->devfn;
+    } else {
+        return PCI_BUILD_BDF(pci_bus_num(sdev->bus), sdev->devfn);
+    }
 }
 
 /**
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index c641e60735..32ba84990d 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -39,6 +39,8 @@ struct SMMUv3State {
     uint32_t features;
     uint8_t sid_size;
     uint8_t sid_split;
+    uint32_t num_sid;
+    uint16_t *sid_map;
 
     uint32_t idr[6];
     uint32_t iidr;
-- 
2.30.2



