Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C002B4F90
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:34:38 +0100 (CET)
Received: from localhost ([::1]:52406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejKn-0005Kz-Qr
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:34:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej4r-0002r1-6p
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:18:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej4n-0001sn-GR
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:18:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605550683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SkmS36iyhjaSvMPSa5O2Dm9RIVVsPwBaDVxOKqvO3pw=;
 b=eygCm+2XzZdWzWDrrIkxuQ8ycoh3KhHheQNiuA04OCCsn4Fjfie49gVPgrbgrjuWiSTr/k
 q9RIzY/y+ScJVUvh78IQeJyGEmi16tjQ41BswMtr8W5LHE5WBwT1f6/NJJsx+S7BfFq+Im
 NhuCAKlrejNIHYqclRre2axYMLu9stE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-TLXNqDLnP0yyE8L22w6v4w-1; Mon, 16 Nov 2020 13:18:00 -0500
X-MC-Unique: TLXNqDLnP0yyE8L22w6v4w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A67668030B4;
 Mon, 16 Nov 2020 18:17:58 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-230.ams2.redhat.com [10.36.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93CFA5C1CF;
 Mon, 16 Nov 2020 18:17:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v7 23/26] hw/arm/smmuv3: Implement fault injection
Date: Mon, 16 Nov 2020 19:13:46 +0100
Message-Id: <20201116181349.11908-24-eric.auger@redhat.com>
In-Reply-To: <20201116181349.11908-1-eric.auger@redhat.com>
References: <20201116181349.11908-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 jean-philippe@linaro.org, tn@semihalf.com,
 shameerali.kolothum.thodi@huawei.com, nicoleotsuka@gmail.com,
 vivek.gautam@arm.com, yi.l.liu@intel.com, peterx@redhat.com,
 zhangfei.gao@gmail.com, yuzenghui@huawei.com
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
index 2b36bb4e4f..5488c9e925 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1572,6 +1572,76 @@ static int smmuv3_get_attr(IOMMUMemoryRegion *iommu,
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
@@ -1580,6 +1650,7 @@ static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
     imrc->translate = smmuv3_translate;
     imrc->notify_flag_changed = smmuv3_notify_flag_changed;
     imrc->get_attr = smmuv3_get_attr;
+    imrc->inject_faults = smmuv3_inject_faults;
 }
 
 static const TypeInfo smmuv3_type_info = {
-- 
2.21.3


