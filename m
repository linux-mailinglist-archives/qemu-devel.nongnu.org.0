Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ACC35B41A
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Apr 2021 14:22:54 +0200 (CEST)
Received: from localhost ([::1]:45486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVZ77-0000si-5A
	for lists+qemu-devel@lfdr.de; Sun, 11 Apr 2021 08:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYvE-0000KV-Jo
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:10:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYvA-0002b8-1X
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:10:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618143030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RoWGYxKuuT5NKR3GSydHx6TuoNbLziGbQyLrmzhviEU=;
 b=DTefuDN2XI0IwpfT2P6bMWxKROM496wuL/GW4lMT3i9AqZzJRS9YTZlEI+EFlzj97XRppz
 Yfc6Civ/+JpeFothJdSQlz9sxqChPT76sEaA3Ua0g9M/QCzBTATlF4hfh8a8TeIaBFOpcB
 iXiRFUXW8CC46MDxFmThNNuNhvzic6Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-5SB8fzsiMK6fcTP_2xtaFw-1; Sun, 11 Apr 2021 08:10:29 -0400
X-MC-Unique: 5SB8fzsiMK6fcTP_2xtaFw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6F265B38C;
 Sun, 11 Apr 2021 12:10:26 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-22.ams2.redhat.com [10.36.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BED311037E88;
 Sun, 11 Apr 2021 12:10:20 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v9 05/29] hw/arm/smmuv3: Improve stage1 ASID invalidation
Date: Sun, 11 Apr 2021 14:08:48 +0200
Message-Id: <20210411120912.15770-6-eric.auger@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124;
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

At the moment ASID invalidation command (CMD_TLBI_NH_ASID) is
propagated as a domain invalidation (the whole notifier range
is invalidated independently on any ASID information).

The new granularity field now allows to be more precise and
restrict the invalidation to a peculiar ASID. Set the corresponding
fields and flag.

We still keep the iova and addr_mask settings for consumers that
do not support the new fields, like VHOST.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v8 -> v9:
- restore the iova and addr_massk settings for consumers that do
  not support the new fields like VHOST
---
 hw/arm/smmuv3.c     | 44 ++++++++++++++++++++++++++++++++++++++++++--
 hw/arm/trace-events |  1 +
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index d037d6df5b..a4436868ba 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -835,6 +835,31 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
     memory_region_notify_iommu_one(n, &event);
 }
 
+/**
+ * smmuv3_notify_asid - call the notifier @n for a given asid
+ *
+ * @mr: IOMMU mr region handle
+ * @n: notifier to be called
+ * @asid: address space ID or negative value if we don't care
+ */
+static void smmuv3_notify_asid(IOMMUMemoryRegion *mr,
+                               IOMMUNotifier *n, int asid)
+{
+    IOMMUTLBEvent event = {};
+
+    event.type = IOMMU_NOTIFIER_UNMAP;
+    event.entry.target_as = &address_space_memory;
+    event.entry.perm = IOMMU_NONE;
+    event.entry.granularity = IOMMU_INV_GRAN_PASID;
+    event.entry.flags = IOMMU_INV_FLAGS_ARCHID;
+    event.entry.arch_id = asid;
+    event.entry.iova = n->start;
+    event.entry.addr_mask = n->end - n->start;
+
+    memory_region_notify_iommu_one(n, &event);
+}
+
+
 /* invalidate an asid/iova range tuple in all mr's */
 static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
                                       uint8_t tg, uint64_t num_pages)
@@ -910,6 +935,22 @@ smmuv3_invalidate_ste(gpointer key, gpointer value, gpointer user_data)
     return true;
 }
 
+static void smmuv3_s1_asid_inval(SMMUState *s, uint16_t asid)
+{
+    SMMUDevice *sdev;
+
+    trace_smmuv3_s1_asid_inval(asid);
+    QLIST_FOREACH(sdev, &s->devices_with_notifiers, next) {
+        IOMMUMemoryRegion *mr = &sdev->iommu;
+        IOMMUNotifier *n;
+
+        IOMMU_NOTIFIER_FOREACH(n, mr) {
+            smmuv3_notify_asid(mr, n, asid);
+        }
+    }
+    smmu_iotlb_inv_asid(s, asid);
+}
+
 static int smmuv3_cmdq_consume(SMMUv3State *s)
 {
     SMMUState *bs = ARM_SMMU(s);
@@ -1020,8 +1061,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
             uint16_t asid = CMD_ASID(&cmd);
 
             trace_smmuv3_cmdq_tlbi_nh_asid(asid);
-            smmu_inv_notifiers_all(&s->smmu_state);
-            smmu_iotlb_inv_asid(bs, asid);
+            smmuv3_s1_asid_inval(bs, asid);
             break;
         }
         case SMMU_CMD_TLBI_NH_ALL:
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index b79a91af5f..8e530ba79d 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -46,6 +46,7 @@ smmuv3_cmdq_cfgi_cd(uint32_t sid) "sid=0x%x"
 smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache HIT for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
 smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache MISS for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
 smmuv3_s1_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d"
+smmuv3_s1_asid_inval(int asid) "asid=%d"
 smmuv3_cmdq_tlbi_nh(void) ""
 smmuv3_cmdq_tlbi_nh_asid(uint16_t asid) "asid=%d"
 smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
-- 
2.26.3


