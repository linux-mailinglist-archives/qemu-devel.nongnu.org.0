Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A1336715E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 19:32:33 +0200 (CEST)
Received: from localhost ([::1]:60356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZGiF-00018C-CU
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 13:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lZGfL-0008NC-To
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 13:29:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lZGfJ-0000bZ-5f
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 13:29:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619026168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LmH3UiCnOzEvX29/GWJbJW16iziKOjnKP8unqL+2MPM=;
 b=LmxBO+gJJYgz4zcmCxUEXtICNmJgE0et/9BOKRI7QNfmZ6QeL/2n5VboCk6qaafuY0LvAh
 WDaJw+OWqSc0ZexvGSymjXr81fuCYPIHnbX2ImZx70979GKWo4cjtjKDDAtKr5N+EsR5Vz
 Pi3uMpN7hS1tvGk6axZpvSFK76oQtM4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-DJ_GhvWvMGeWXT3HI07fZg-1; Wed, 21 Apr 2021 13:29:25 -0400
X-MC-Unique: DJ_GhvWvMGeWXT3HI07fZg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF9A31898296;
 Wed, 21 Apr 2021 17:29:23 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-115-49.ams2.redhat.com [10.36.115.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7786B6085A;
 Wed, 21 Apr 2021 17:29:15 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH] hw/arm/smmuv3: Another range invalidation fix
Date: Wed, 21 Apr 2021 19:29:10 +0200
Message-Id: <20210421172910.11832-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
---
 hw/arm/smmuv3.c | 49 +++++++++++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 8705612535..16f285a566 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -856,43 +856,44 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
 
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


