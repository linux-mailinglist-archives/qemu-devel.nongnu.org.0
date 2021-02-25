Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E791324EB2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 12:00:25 +0100 (CET)
Received: from localhost ([::1]:46288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFENc-0006Yi-85
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 06:00:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEHP-00067r-65
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:54:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEHN-00056f-HA
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:53:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614250436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LEn9B4QLLi/7yyjz5plqg5yi7Rz2EBIqdBXi3xeEZUk=;
 b=KlqKOyyZRdIXe9mwX0vK8YgHDcBXFscQ4d5WzZVwrdUX+xT2jXvnNu9CjgtlXL1k2bdmLI
 zhBorO3UEzBnYhU8VPO07Nu4AFA0bPZKnRrTlWdDaVvtg2XRtintqDTQNo1rX1NrBPGEBx
 FlfOTwDhIoFlk9S94TWOMACJcjQYE8I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-jNRgUUrnNq28KQNpaTe1zQ-1; Thu, 25 Feb 2021 05:53:54 -0500
X-MC-Unique: jNRgUUrnNq28KQNpaTe1zQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8B32107ACE4;
 Thu, 25 Feb 2021 10:53:51 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C1935D9D7;
 Thu, 25 Feb 2021 10:53:46 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v8 05/28] hw/arm/smmuv3: Properly propagate S1 asid invalidation
Date: Thu, 25 Feb 2021 11:52:10 +0100
Message-Id: <20210225105233.650545-6-eric.auger@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

At the moment ASID invalidation command (CMD_TLBI_NH_ASID) is
propagated as a domain invalidation, ie. all ASIDs get invalidated,
failing to restrict the invalidation to the accurate asid.

Fix that by populating the new fields laterly introduced in the
IOTLEntry struct, namely setting the granularity to PASID and setting
the arch_id to the invalidated asid.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c     | 42 ++++++++++++++++++++++++++++++++++++++++--
 hw/arm/trace-events |  1 +
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index d037d6df5b..8dffb1bcc3 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -835,6 +835,29 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
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
+
+    memory_region_notify_iommu_one(n, &event);
+}
+
+
 /* invalidate an asid/iova range tuple in all mr's */
 static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
                                       uint8_t tg, uint64_t num_pages)
@@ -910,6 +933,22 @@ smmuv3_invalidate_ste(gpointer key, gpointer value, gpointer user_data)
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
@@ -1020,8 +1059,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
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
2.26.2


