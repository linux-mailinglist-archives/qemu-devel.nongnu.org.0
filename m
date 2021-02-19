Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F351F31F6B3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 10:46:50 +0100 (CET)
Received: from localhost ([::1]:59078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD2N7-0002ce-UU
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 04:46:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lD2KP-0000v6-Sk; Fri, 19 Feb 2021 04:44:02 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:3045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lD2K8-0006Yc-UU; Fri, 19 Feb 2021 04:44:01 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Dhmnf0H0DzjNqR;
 Fri, 19 Feb 2021 17:42:14 +0800 (CST)
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Fri, 19 Feb 2021 17:43:21 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Eric Auger <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alex Williamson <alex.williamson@redhat.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [RFC PATCH 3/3] hw/arm/smmuv3: Post-load stage 1 configurations to
 the host
Date: Fri, 19 Feb 2021 17:42:30 +0800
Message-ID: <20210219094230.231-4-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20210219094230.231-1-jiangkunkun@huawei.com>
References: <20210219094230.231-1-jiangkunkun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=jiangkunkun@huawei.com; helo=szxga06-in.huawei.com
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In nested mode, we call the set_pasid_table() callback on each STE
update to pass the guest stage 1 configuration to the host and
apply it at physical level.

In the case of live migration, we need to manual call the
set_pasid_table() to load the guest stage 1 configurations to the
host. If this operation is fail, the migration is fail.

Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 hw/arm/smmuv3.c     | 60 +++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/trace-events |  1 +
 2 files changed, 61 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 6c6ed84e78..94ca15375c 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1473,6 +1473,65 @@ static void smmu_realize(DeviceState *d, Error **errp)
     smmu_init_irq(s, dev);
 }
 
+static int smmuv3_manual_set_pci_device_pasid_table(SMMUDevice *sdev)
+{
+#ifdef __linux__
+    IOMMUMemoryRegion *mr = &(sdev->iommu);
+    int sid = smmu_get_sid(sdev);
+    SMMUEventInfo event = {.type = SMMU_EVT_NONE, .sid = sid,
+                           .inval_ste_allowed = true};
+    IOMMUConfig iommu_config = {};
+    SMMUTransCfg *cfg;
+    int ret = -1;
+
+    cfg = smmuv3_get_config(sdev, &event);
+    if (!cfg) {
+        return ret;
+    }
+
+    iommu_config.pasid_cfg.argsz = sizeof(struct iommu_pasid_table_config);
+    iommu_config.pasid_cfg.version = PASID_TABLE_CFG_VERSION_1;
+    iommu_config.pasid_cfg.format = IOMMU_PASID_FORMAT_SMMUV3;
+    iommu_config.pasid_cfg.base_ptr = cfg->s1ctxptr;
+    iommu_config.pasid_cfg.pasid_bits = 0;
+    iommu_config.pasid_cfg.vendor_data.smmuv3.version = PASID_TABLE_SMMUV3_CFG_VERSION_1;
+
+    if (cfg->disabled || cfg->bypassed) {
+        iommu_config.pasid_cfg.config = IOMMU_PASID_CONFIG_BYPASS;
+    } else if (cfg->aborted) {
+        iommu_config.pasid_cfg.config = IOMMU_PASID_CONFIG_ABORT;
+    } else {
+        iommu_config.pasid_cfg.config = IOMMU_PASID_CONFIG_TRANSLATE;
+    }
+
+    ret = pci_device_set_pasid_table(sdev->bus, sdev->devfn, &iommu_config);
+    if (ret) {
+        error_report("Failed to pass PASID table to host for iommu mr %s (%m)",
+                     mr->parent_obj.name);
+    }
+
+    return ret;
+#endif
+}
+
+static int smmuv3_post_load(void *opaque, int version_id)
+{
+    SMMUv3State *s3 = opaque;
+    SMMUState *s = &(s3->smmu_state);
+    SMMUDevice *sdev;
+    int ret = 0;
+
+    QLIST_FOREACH(sdev, &s->devices_with_notifiers, next) {
+        trace_smmuv3_post_load_sdev(sdev->devfn, sdev->iommu.parent_obj.name);
+        ret = smmuv3_manual_set_pci_device_pasid_table(sdev);
+        if (ret) {
+            break;
+        }
+    }
+
+    return ret;
+}
+
 static const VMStateDescription vmstate_smmuv3_queue = {
     .name = "smmuv3_queue",
     .version_id = 1,
@@ -1491,6 +1550,7 @@ static const VMStateDescription vmstate_smmuv3 = {
     .version_id = 1,
     .minimum_version_id = 1,
     .priority = MIG_PRI_IOMMU,
+    .post_load = smmuv3_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(features, SMMUv3State),
         VMSTATE_UINT8(sid_size, SMMUv3State),
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 35e562ab74..caa864dd72 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -53,4 +53,5 @@ smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s
 smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
 smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
 smmuv3_notify_config_change(const char *name, uint8_t config, uint64_t s1ctxptr) "iommu mr=%s config=%d s1ctxptr=0x%"PRIx64
+smmuv3_post_load_sdev(int devfn, const char *name) "sdev devfn=%d iommu mr=%s"PRIx64
 
-- 
2.23.0


