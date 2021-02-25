Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DA7324F0C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 12:21:47 +0100 (CET)
Received: from localhost ([::1]:39558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFEiI-0004s1-Ez
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 06:21:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFELB-00043p-Fr
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:57:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEL9-0006qW-Ox
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:57:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614250671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bWEN9W3CSh/fuwVHUFsScmrUiqJMJE6m9Ra8jyjW+gw=;
 b=GnkPeg6v66lqANgSExVqiBNHUFW2Ho1mp9p810iSstK/V3OyjayVb5VjkXj6/trkZ8n6ds
 VRoU6FoNl/ClJTo2u0EgvizMYyD32pu89fd9QGZA2uBGO9nrYe/vd+svKiWZ+KwjyzrN5u
 rzNDZb1syoqXMNJO2zTSJg5pTxoQDoE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-DiHAwfLwMxe4YW1zpsxH2g-1; Thu, 25 Feb 2021 05:57:47 -0500
X-MC-Unique: DiHAwfLwMxe4YW1zpsxH2g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FD09804036;
 Thu, 25 Feb 2021 10:57:45 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F2085D9D7;
 Thu, 25 Feb 2021 10:57:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v8 25/28] hw/arm/smmuv3: Implement fault injection
Date: Thu, 25 Feb 2021 11:52:30 +0100
Message-Id: <20210225105233.650545-26-eric.auger@redhat.com>
In-Reply-To: <20210225105233.650545-1-eric.auger@redhat.com>
References: <20210225105233.650545-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 jiangkunkun@huawei.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, yuzenghui@huawei.com,
 zhangfei.gao@linaro.org, will@kernel.org
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
index 03cc299710..a61c1129d9 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1650,6 +1650,76 @@ static int smmuv3_get_attr(IOMMUMemoryRegion *iommu,
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
@@ -1658,6 +1728,7 @@ static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
     imrc->translate = smmuv3_translate;
     imrc->notify_flag_changed = smmuv3_notify_flag_changed;
     imrc->get_attr = smmuv3_get_attr;
+    imrc->inject_faults = smmuv3_inject_faults;
 }
 
 static const TypeInfo smmuv3_type_info = {
-- 
2.26.2


