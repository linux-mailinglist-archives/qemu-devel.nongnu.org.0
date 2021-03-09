Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2364C33230E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:31:41 +0100 (CET)
Received: from localhost ([::1]:33066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZeO-000853-5q
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:31:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lJZbK-0005qt-5F
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:28:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lJZbI-0005hl-DM
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:28:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615285707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wwWdbz8RKb5lWP8DU8VfCuoWnBxuDzYEp5aDuRfimvg=;
 b=i3iOsXdNkbolTYWkUDgLyA4cO1f59WEXs7VazjjYe4VM2KMfymm4byCiNjlhUGiJKlc8l/
 9JPZ9boooQ+iWiO9CvwbQDz6kwOyk07Ao58RloLpD/tyJKv9MkM/vM+4tEk1uSu83tcDr8
 jX83azmNp0yc6onbdWoGMNeD36jn/7Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-57Q675YvO1W31hz8LDiRhw-1; Tue, 09 Mar 2021 05:28:26 -0500
X-MC-Unique: 57Q675YvO1W31hz8LDiRhw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF7ED83DD27;
 Tue,  9 Mar 2021 10:28:24 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-254.ams2.redhat.com [10.36.112.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96EDE1A262;
 Tue,  9 Mar 2021 10:28:21 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 jean-philippe@linaro.org, peterx@redhat.com, jasowang@redhat.com,
 pbonzini@redhat.com
Subject: [PATCH v3 5/7] hw/arm/smmuv3: Enforce invalidation on a power of two
 range
Date: Tue,  9 Mar 2021 11:27:40 +0100
Message-Id: <20210309102742.30442-6-eric.auger@redhat.com>
In-Reply-To: <20210309102742.30442-1-eric.auger@redhat.com>
References: <20210309102742.30442-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: vivek.gautam@arm.com, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As of today, the driver can invalidate a number of pages that is
not a power of 2. However IOTLB unmap notifications and internal
IOTLB invalidations work with masks leading to erroneous
invalidations.

In case the range is not a power of 2, split invalidations into
power of 2 invalidations.

When looking for a single page entry in the vSMMU internal IOTLB,
let's make sure that if the entry is not found using a
g_hash_table_remove() we iterate over all the entries to find a
potential range that overlaps it.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmu-common.c | 30 ++++++++++++++++++------------
 hw/arm/smmuv3.c      | 24 ++++++++++++++++++++----
 2 files changed, 38 insertions(+), 16 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index e9ca3aebb2..84d2c62c26 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -151,22 +151,28 @@ inline void
 smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
                     uint8_t tg, uint64_t num_pages, uint8_t ttl)
 {
+    /* if tg is not set we use 4KB range invalidation */
+    uint8_t granule = tg ? tg * 2 + 10 : 12;
+
     if (ttl && (num_pages == 1) && (asid >= 0)) {
         SMMUIOTLBKey key = smmu_get_iotlb_key(asid, iova, tg, ttl);
 
-        g_hash_table_remove(s->iotlb, &key);
-    } else {
-        /* if tg is not set we use 4KB range invalidation */
-        uint8_t granule = tg ? tg * 2 + 10 : 12;
-
-        SMMUIOTLBPageInvInfo info = {
-            .asid = asid, .iova = iova,
-            .mask = (num_pages * 1 << granule) - 1};
-
-        g_hash_table_foreach_remove(s->iotlb,
-                                    smmu_hash_remove_by_asid_iova,
-                                    &info);
+        if (g_hash_table_remove(s->iotlb, &key)) {
+            return;
+        }
+        /*
+         * if the entry is not found, let's see if it does not
+         * belong to a larger IOTLB entry
+         */
     }
+
+    SMMUIOTLBPageInvInfo info = {
+        .asid = asid, .iova = iova,
+        .mask = (num_pages * 1 << granule) - 1};
+
+    g_hash_table_foreach_remove(s->iotlb,
+                                smmu_hash_remove_by_asid_iova,
+                                &info);
 }
 
 inline void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index bd1f97000d..fdd6332ce5 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -861,7 +861,8 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
     uint16_t vmid = CMD_VMID(cmd);
     bool leaf = CMD_LEAF(cmd);
     uint8_t tg = CMD_TG(cmd);
-    hwaddr num_pages = 1;
+    uint64_t first_page = 0, last_page;
+    uint64_t num_pages = 1;
     int asid = -1;
 
     if (tg) {
@@ -874,9 +875,24 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
     if (type == SMMU_CMD_TLBI_NH_VA) {
         asid = CMD_ASID(cmd);
     }
-    trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
-    smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
-    smmu_iotlb_inv_iova(s, asid, addr, tg, num_pages, ttl);
+
+    /* Split invalidations into ^2 range invalidations */
+    last_page = num_pages - 1;
+    while (num_pages) {
+        uint8_t granule = tg * 2 + 10;
+        uint64_t mask, count;
+
+        mask = dma_aligned_pow2_mask(first_page, last_page, 64 - granule);
+        count = mask + 1;
+
+        trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, count, ttl, leaf);
+        smmuv3_inv_notifiers_iova(s, asid, addr, tg, count);
+        smmu_iotlb_inv_iova(s, asid, addr, tg, count, ttl);
+
+        num_pages -= count;
+        first_page += count;
+        addr += count * BIT_ULL(granule);
+    }
 }
 
 static int smmuv3_cmdq_consume(SMMUv3State *s)
-- 
2.26.2


