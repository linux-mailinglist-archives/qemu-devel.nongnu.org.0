Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D79230D7E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 17:17:10 +0200 (CEST)
Received: from localhost ([::1]:35546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0RLp-0002f4-By
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 11:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1k0RDn-0004zS-0b
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 11:08:51 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43767
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1k0RDk-0007av-US
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 11:08:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595948927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WuZ2FwmRJiypa21uDwerc5RiK2LDWiVltIu8BgP89UA=;
 b=ECVJ+DVASaTuxfTZkryKl7cZA+NB2GymZiEFDaXE0gMV88doHyJs08bhHxVzbi1TogDTxU
 scGfE/5+UQ7fk/jbmLBvM7NNHNovgqZARIFlD33nXM6NPIuNYs6Qdjp1RlkBs1POEL1Tfs
 9atgeMvG9w+TTfFSwrB4RaDXwILNTNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-vntd1-5DPIqkoLKsCRiT2Q-1; Tue, 28 Jul 2020 11:08:46 -0400
X-MC-Unique: vntd1-5DPIqkoLKsCRiT2Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 687511030C22;
 Tue, 28 Jul 2020 15:08:44 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-203.ams2.redhat.com [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AFA169328;
 Tue, 28 Jul 2020 15:08:29 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com
Subject: [PATCH for-5.2 v4 02/11] hw/arm/smmu-common: Add IOTLB helpers
Date: Tue, 28 Jul 2020 17:08:06 +0200
Message-Id: <20200728150815.11446-3-eric.auger@redhat.com>
In-Reply-To: <20200728150815.11446-1-eric.auger@redhat.com>
References: <20200728150815.11446-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 10:31:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: jean-philippe@linaro.org, robh@kernel.org, robin.murphy@arm.com,
 mst@redhat.com, zhangfei.gao@foxmail.com, shameerali.kolothum.thodi@huawei.com,
 will@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add two helpers: one to lookup for a given IOTLB entry and
one to insert a new entry. We also move the tracing there.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/smmu-common.h |  2 ++
 hw/arm/smmu-common.c         | 36 ++++++++++++++++++++++++++++++++++++
 hw/arm/smmuv3.c              | 26 ++------------------------
 hw/arm/trace-events          |  5 +++--
 4 files changed, 43 insertions(+), 26 deletions(-)

diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index ca4a4b1ad1..1dceec5cb1 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -153,6 +153,8 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
 
 #define SMMU_IOTLB_MAX_SIZE 256
 
+IOMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg, hwaddr iova);
+void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, IOMMUTLBEntry *entry);
 void smmu_iotlb_inv_all(SMMUState *s);
 void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
 void smmu_iotlb_inv_iova(SMMUState *s, uint16_t asid, dma_addr_t iova);
diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index a3f9e47398..f3aa581f80 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -32,6 +32,42 @@
 
 /* IOTLB Management */
 
+IOMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
+                                 hwaddr iova)
+{
+    SMMUIOTLBKey key = {.asid = cfg->asid, .iova = iova};
+    IOMMUTLBEntry *entry = g_hash_table_lookup(bs->iotlb, &key);
+
+    if (entry) {
+        cfg->iotlb_hits++;
+        trace_smmu_iotlb_lookup_hit(cfg->asid, iova,
+                                    cfg->iotlb_hits, cfg->iotlb_misses,
+                                    100 * cfg->iotlb_hits /
+                                    (cfg->iotlb_hits + cfg->iotlb_misses));
+    } else {
+        cfg->iotlb_misses++;
+        trace_smmu_iotlb_lookup_miss(cfg->asid, iova,
+                                     cfg->iotlb_hits, cfg->iotlb_misses,
+                                     100 * cfg->iotlb_hits /
+                                     (cfg->iotlb_hits + cfg->iotlb_misses));
+    }
+    return entry;
+}
+
+void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, IOMMUTLBEntry *entry)
+{
+    SMMUIOTLBKey *key = g_new0(SMMUIOTLBKey, 1);
+
+    if (g_hash_table_size(bs->iotlb) >= SMMU_IOTLB_MAX_SIZE) {
+        smmu_iotlb_inv_all(bs);
+    }
+
+    key->asid = cfg->asid;
+    key->iova = entry->iova;
+    trace_smmu_iotlb_insert(cfg->asid, entry->iova);
+    g_hash_table_insert(bs->iotlb, key, entry);
+}
+
 inline void smmu_iotlb_inv_all(SMMUState *s)
 {
     trace_smmu_iotlb_inv_all();
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 57a79df55b..cd2a2e7e14 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -636,7 +636,6 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         .addr_mask = ~(hwaddr)0,
         .perm = IOMMU_NONE,
     };
-    SMMUIOTLBKey key, *new_key;
 
     qemu_mutex_lock(&s->mutex);
 
@@ -675,16 +674,8 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     page_mask = (1ULL << (tt->granule_sz)) - 1;
     aligned_addr = addr & ~page_mask;
 
-    key.asid = cfg->asid;
-    key.iova = aligned_addr;
-
-    cached_entry = g_hash_table_lookup(bs->iotlb, &key);
+    cached_entry = smmu_iotlb_lookup(bs, cfg, aligned_addr);
     if (cached_entry) {
-        cfg->iotlb_hits++;
-        trace_smmu_iotlb_cache_hit(cfg->asid, aligned_addr,
-                                   cfg->iotlb_hits, cfg->iotlb_misses,
-                                   100 * cfg->iotlb_hits /
-                                   (cfg->iotlb_hits + cfg->iotlb_misses));
         if ((flag & IOMMU_WO) && !(cached_entry->perm & IOMMU_WO)) {
             status = SMMU_TRANS_ERROR;
             if (event.record_trans_faults) {
@@ -698,16 +689,6 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         goto epilogue;
     }
 
-    cfg->iotlb_misses++;
-    trace_smmu_iotlb_cache_miss(cfg->asid, addr & ~page_mask,
-                                cfg->iotlb_hits, cfg->iotlb_misses,
-                                100 * cfg->iotlb_hits /
-                                (cfg->iotlb_hits + cfg->iotlb_misses));
-
-    if (g_hash_table_size(bs->iotlb) >= SMMU_IOTLB_MAX_SIZE) {
-        smmu_iotlb_inv_all(bs);
-    }
-
     cached_entry = g_new0(IOMMUTLBEntry, 1);
 
     if (smmu_ptw(cfg, aligned_addr, flag, cached_entry, &ptw_info)) {
@@ -753,10 +734,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         }
         status = SMMU_TRANS_ERROR;
     } else {
-        new_key = g_new0(SMMUIOTLBKey, 1);
-        new_key->asid = cfg->asid;
-        new_key->iova = aligned_addr;
-        g_hash_table_insert(bs->iotlb, new_key, cached_entry);
+        smmu_iotlb_insert(bs, cfg, cached_entry);
         status = SMMU_TRANS_SUCCESS;
     }
 
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 0acedcedc6..b808a1bfc1 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -14,6 +14,9 @@ smmu_iotlb_inv_all(void) "IOTLB invalidate all"
 smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate asid=%d"
 smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
 smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
+smmu_iotlb_lookup_hit(uint16_t asid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
+smmu_iotlb_lookup_miss(uint16_t asid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache MISS asid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
+smmu_iotlb_insert(uint16_t asid, uint64_t addr) "IOTLB ++ asid=%d addr=0x%"PRIx64
 
 # smmuv3.c
 smmuv3_read_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x(%d)"
@@ -46,8 +49,6 @@ smmuv3_cmdq_tlbi_nh_va(int vmid, int asid, uint64_t addr, bool leaf) "vmid =%d a
 smmuv3_cmdq_tlbi_nh_vaa(int vmid, uint64_t addr) "vmid =%d addr=0x%"PRIx64
 smmuv3_cmdq_tlbi_nh(void) ""
 smmuv3_cmdq_tlbi_nh_asid(uint16_t asid) "asid=%d"
-smmu_iotlb_cache_hit(uint16_t asid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
-smmu_iotlb_cache_miss(uint16_t asid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache MISS asid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
 smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid %d"
 smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
 smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
-- 
2.21.3


