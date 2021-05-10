Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76709378C78
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:49:19 +0200 (CEST)
Received: from localhost ([::1]:55180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5La-00016m-I0
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lg5KT-00087U-3w
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:48:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lg5KO-0007QQ-CB
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:48:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620650882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OMI88+LkaEF7zvc/XQ6whHSr4GOiL29BWy09otZ1xIA=;
 b=K3eSvLUyZp8K9KsuE9g3AntyEtTRkNBKU74+HbLga13ymD0bkK3v52MXH1L9iMGqk0LDA1
 cDMY4YLzhLvML4gM36Hy+1HdLcSoQJrpd4eIGspGcsyiySCFAHy9q3RodZGximDZlR7HRX
 +RNxgvo9Cqw59kPTAaNYWMljt7j/DNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-B8SConBYN4WERtBRm9vENA-1; Mon, 10 May 2021 08:48:01 -0400
X-MC-Unique: B8SConBYN4WERtBRm9vENA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D153107ACC7;
 Mon, 10 May 2021 12:48:00 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-168.ams2.redhat.com [10.36.113.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26D861724D;
 Mon, 10 May 2021 12:47:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v2] hw/arm/smmuv3: Another range invalidation fix
Date: Mon, 10 May 2021 14:47:47 +0200
Message-Id: <20210510124747.780877-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: jiangkunkun@huawei.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

6d9cd115b9 ("hw/arm/smmuv3: Enforce invalidation on a power of two range")
failed to completely fix misalignment issues with range
invalidation. For instance invalidations patterns like "invalidate 32
4kB pages starting from 0xff395000 are not correctly handled" due
to the fact the previous fix only made sure the number of invalidated
pages were a power of 2 but did not properly handle the start
address was not aligned with the range. This can be noticed when
boothing a fedora 33 with protected virtio-blk-pci.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Fixes: 6d9cd115b9 ("hw/arm/smmuv3: Enforce invalidation on a power of two range")

---

This bug was found with SMMU RIL avocado-qemu acceptance tests

v1 -> v2:
- add return in !tg block
---
 hw/arm/smmuv3.c | 50 +++++++++++++++++++++++++------------------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 7bed2ac520..01b60bee49 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -857,43 +857,45 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
 
 static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
 {
-    uint8_t scale = 0, num = 0, ttl = 0;
-    dma_addr_t addr = CMD_ADDR(cmd);
+    dma_addr_t end, addr = CMD_ADDR(cmd);
     uint8_t type = CMD_TYPE(cmd);
     uint16_t vmid = CMD_VMID(cmd);
+    uint8_t scale = CMD_SCALE(cmd);
+    uint8_t num = CMD_NUM(cmd);
+    uint8_t ttl = CMD_TTL(cmd);
     bool leaf = CMD_LEAF(cmd);
     uint8_t tg = CMD_TG(cmd);
-    uint64_t first_page = 0, last_page;
-    uint64_t num_pages = 1;
+    uint64_t num_pages;
+    uint8_t granule;
     int asid = -1;
 
-    if (tg) {
-        scale = CMD_SCALE(cmd);
-        num = CMD_NUM(cmd);
-        ttl = CMD_TTL(cmd);
-        num_pages = (num + 1) * BIT_ULL(scale);
-    }
-
     if (type == SMMU_CMD_TLBI_NH_VA) {
         asid = CMD_ASID(cmd);
     }
 
+    if (!tg) {
+        trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
+        smmuv3_inv_notifiers_iova(s, asid, addr, tg, 1);
+        smmu_iotlb_inv_iova(s, asid, addr, tg, 1, ttl);
+        return;
+    }
+
+    /* RIL in use */
+
+    num_pages = (num + 1) * BIT_ULL(scale);
+    granule = tg * 2 + 10;
+
     /* Split invalidations into ^2 range invalidations */
-    last_page = num_pages - 1;
-    while (num_pages) {
-        uint8_t granule = tg * 2 + 10;
-        uint64_t mask, count;
+    end = addr + (num_pages << granule) - 1;
 
-        mask = dma_aligned_pow2_mask(first_page, last_page, 64 - granule);
-        count = mask + 1;
+    while (addr != end + 1) {
+        uint64_t mask = dma_aligned_pow2_mask(addr, end, 64);
 
-        trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, count, ttl, leaf);
-        smmuv3_inv_notifiers_iova(s, asid, addr, tg, count);
-        smmu_iotlb_inv_iova(s, asid, addr, tg, count, ttl);
-
-        num_pages -= count;
-        first_page += count;
-        addr += count * BIT_ULL(granule);
+        num_pages = (mask + 1) >> granule;
+        trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
+        smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
+        smmu_iotlb_inv_iova(s, asid, addr, tg, num_pages, ttl);
+        addr += mask + 1;
     }
 }
 
-- 
2.26.3


