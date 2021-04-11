Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC7635B44C
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Apr 2021 14:38:48 +0200 (CEST)
Received: from localhost ([::1]:57216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVZMV-0000h3-8e
	for lists+qemu-devel@lfdr.de; Sun, 11 Apr 2021 08:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYzD-0003dS-5U
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:14:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYyw-0004EH-Lq
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:14:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618143265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c1lC2N5qYUFS9onSXcWFEDQCeOdGmtYQEEeqJjMIgro=;
 b=HRb73IzIrBTgfBvORRbSCcEe6x/n+jQQjUIbBA4/t0kMLdf8vyipw/A3U0gMxaEpdMsWht
 cpGvw9D/9j7kg07Unvjs/QH8/4vy+urqljV2XF/oq5Zg3YkO4l6CVGC7ZBYKAK535gNYAw
 R+63xV0k40KpeR8TZRnpSaqtV6cx8gU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-UCK3eHolOpSSLzIJPamQLg-1; Sun, 11 Apr 2021 08:14:24 -0400
X-MC-Unique: UCK3eHolOpSSLzIJPamQLg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CA3810054F6;
 Sun, 11 Apr 2021 12:14:22 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-22.ams2.redhat.com [10.36.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4476A10023B2;
 Sun, 11 Apr 2021 12:14:14 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v9 26/29] hw/arm/smmuv3: Implement fault injection
Date: Sun, 11 Apr 2021 14:09:09 +0200
Message-Id: <20210411120912.15770-27-eric.auger@redhat.com>
In-Reply-To: <20210411120912.15770-1-eric.auger@redhat.com>
References: <20210411120912.15770-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com, chenxiang66@hisilicon.com,
 jiangkunkun@huawei.com, shameerali.kolothum.thodi@huawei.com,
 nicoleotsuka@gmail.com, vivek.gautam@arm.com, vdumpa@nvidia.com,
 yi.l.liu@intel.com, peterx@redhat.com, zhangfei.gao@gmail.com,
 yuzenghui@huawei.com, zhukeqian1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We convert iommu_fault structs received from the kernel
into the data struct used by the emulation code and record
the evnts into the virtual event queue.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v3 -> v4:
- fix compil issue on mingw

Exhaustive mapping remains to be done
---
 hw/arm/smmuv3.c | 71 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index aefc55a607..53b71c895c 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1652,6 +1652,76 @@ static int smmuv3_get_attr(IOMMUMemoryRegion *iommu,
     return -EINVAL;
 }
 
+struct iommu_fault;
+
+static inline int
+smmuv3_inject_faults(IOMMUMemoryRegion *iommu_mr, int count,
+                     struct iommu_fault *buf)
+{
+#ifdef __linux__
+    SMMUDevice *sdev = container_of(iommu_mr, SMMUDevice, iommu);
+    SMMUv3State *s3 = sdev->smmu;
+    uint32_t sid = smmu_get_sid(sdev);
+    int i;
+
+    for (i = 0; i < count; i++) {
+        SMMUEventInfo info = {};
+        struct iommu_fault_unrecoverable *record;
+
+        if (buf[i].type != IOMMU_FAULT_DMA_UNRECOV) {
+            continue;
+        }
+
+        info.sid = sid;
+        record = &buf[i].event;
+
+        switch (record->reason) {
+        case IOMMU_FAULT_REASON_PASID_INVALID:
+            info.type = SMMU_EVT_C_BAD_SUBSTREAMID;
+            /* TODO further fill info.u.c_bad_substream */
+            break;
+        case IOMMU_FAULT_REASON_PASID_FETCH:
+            info.type = SMMU_EVT_F_CD_FETCH;
+            break;
+        case IOMMU_FAULT_REASON_BAD_PASID_ENTRY:
+            info.type = SMMU_EVT_C_BAD_CD;
+            /* TODO further fill info.u.c_bad_cd */
+            break;
+        case IOMMU_FAULT_REASON_WALK_EABT:
+            info.type = SMMU_EVT_F_WALK_EABT;
+            info.u.f_walk_eabt.addr = record->addr;
+            info.u.f_walk_eabt.addr2 = record->fetch_addr;
+            break;
+        case IOMMU_FAULT_REASON_PTE_FETCH:
+            info.type = SMMU_EVT_F_TRANSLATION;
+            info.u.f_translation.addr = record->addr;
+            break;
+        case IOMMU_FAULT_REASON_OOR_ADDRESS:
+            info.type = SMMU_EVT_F_ADDR_SIZE;
+            info.u.f_addr_size.addr = record->addr;
+            break;
+        case IOMMU_FAULT_REASON_ACCESS:
+            info.type = SMMU_EVT_F_ACCESS;
+            info.u.f_access.addr = record->addr;
+            break;
+        case IOMMU_FAULT_REASON_PERMISSION:
+            info.type = SMMU_EVT_F_PERMISSION;
+            info.u.f_permission.addr = record->addr;
+            break;
+        default:
+            warn_report("%s Unexpected fault reason received from host: %d",
+                        __func__, record->reason);
+            continue;
+        }
+
+        smmuv3_record_event(s3, &info);
+    }
+    return 0;
+#else
+    return -1;
+#endif
+}
+
 static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
                                                   void *data)
 {
@@ -1660,6 +1730,7 @@ static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
     imrc->translate = smmuv3_translate;
     imrc->notify_flag_changed = smmuv3_notify_flag_changed;
     imrc->get_attr = smmuv3_get_attr;
+    imrc->inject_faults = smmuv3_inject_faults;
 }
 
 static const TypeInfo smmuv3_type_info = {
-- 
2.26.3


