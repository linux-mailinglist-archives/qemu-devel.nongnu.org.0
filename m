Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B03CC379CE2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 04:22:12 +0200 (CEST)
Received: from localhost ([::1]:48212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgI2F-0000kZ-Px
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 22:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lgHyY-0002cl-Ps; Mon, 10 May 2021 22:18:22 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lgHyU-0001yt-FK; Mon, 10 May 2021 22:18:22 -0400
Received: from dggeml711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FfM25102sz5vwQ;
 Tue, 11 May 2021 10:14:53 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggeml711-chm.china.huawei.com (10.3.17.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 11 May 2021 10:18:13 +0800
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 11 May 2021 10:18:13 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Eric Auger <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alex Williamson <alex.williamson@redhat.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [RFC PATCH v3 4/4] hw/arm/smmuv3: Post-load stage 1 configurations to
 the host
Date: Tue, 11 May 2021 10:08:16 +0800
Message-ID: <20210511020816.2905-5-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20210511020816.2905-1-jiangkunkun@huawei.com>
References: <20210511020816.2905-1-jiangkunkun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=jiangkunkun@huawei.com; helo=szxga03-in.huawei.com
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
Cc: kevin.tian@intel.com, Kunkun Jiang <jiangkunkun@huawei.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In nested mode, we call the set_pasid_table() callback on each
STE update to pass the guest stage 1 configuration to the host
and apply it at physical level.

In the case of live migration, we need to manually call the
set_pasid_table() to load the guest stage 1 configurations to
the host. If this operation fails, the migration fails.

Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 hw/arm/smmuv3.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index ca690513e6..ac1de572f3 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -929,7 +929,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
     }
 }
 
-static void smmuv3_notify_config_change(SMMUState *bs, uint32_t sid)
+static int smmuv3_notify_config_change(SMMUState *bs, uint32_t sid)
 {
 #ifdef __linux__
     IOMMUMemoryRegion *mr = smmu_iommu_mr(bs, sid);
@@ -938,9 +938,10 @@ static void smmuv3_notify_config_change(SMMUState *bs, uint32_t sid)
     IOMMUConfig iommu_config = {};
     SMMUTransCfg *cfg;
     SMMUDevice *sdev;
+    int ret;
 
     if (!mr) {
-        return;
+        return 0;
     }
 
     sdev = container_of(mr, SMMUDevice, iommu);
@@ -949,13 +950,13 @@ static void smmuv3_notify_config_change(SMMUState *bs, uint32_t sid)
     smmuv3_flush_config(sdev);
 
     if (!pci_device_is_pasid_ops_set(sdev->bus, sdev->devfn)) {
-        return;
+        return 0;
     }
 
     cfg = smmuv3_get_config(sdev, &event);
 
     if (!cfg) {
-        return;
+        return 0;
     }
 
     iommu_config.pasid_cfg.argsz = sizeof(struct iommu_pasid_table_config);
@@ -977,10 +978,13 @@ static void smmuv3_notify_config_change(SMMUState *bs, uint32_t sid)
                                       iommu_config.pasid_cfg.config,
                                       iommu_config.pasid_cfg.base_ptr);
 
-    if (pci_device_set_pasid_table(sdev->bus, sdev->devfn, &iommu_config)) {
+    ret = pci_device_set_pasid_table(sdev->bus, sdev->devfn, &iommu_config);
+    if (ret) {
         error_report("Failed to pass PASID table to host for iommu mr %s (%m)",
                      mr->parent_obj.name);
     }
+
+    return ret;
 #endif
 }
 
@@ -1545,6 +1549,24 @@ static void smmu_realize(DeviceState *d, Error **errp)
     smmu_init_irq(s, dev);
 }
 
+static int smmuv3_post_load(void *opaque, int version_id)
+{
+    SMMUv3State *s3 = opaque;
+    SMMUState *s = &(s3->smmu_state);
+    SMMUDevice *sdev;
+    int ret = 0;
+
+    QLIST_FOREACH(sdev, &s->devices_with_notifiers, next) {
+        uint32_t sid = smmu_get_sid(sdev);
+        ret = smmuv3_notify_config_change(s, sid);
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
@@ -1563,6 +1585,7 @@ static const VMStateDescription vmstate_smmuv3 = {
     .version_id = 1,
     .minimum_version_id = 1,
     .priority = MIG_PRI_IOMMU,
+    .post_load = smmuv3_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(features, SMMUv3State),
         VMSTATE_UINT8(sid_size, SMMUv3State),
-- 
2.23.0


