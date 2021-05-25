Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E683390497
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:05:56 +0200 (CEST)
Received: from localhost ([::1]:54722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYd1-0004TS-Mk
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYai-0001QZ-SH
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:32 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:45619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYae-0003xV-RA
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:32 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so13020514wmh.4
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pAXwq22CIxkWMtmf3I0tFYcZ+8ZNm00388IJ83MqmIk=;
 b=afvaS6waviqGccS5IkWp7N62Pc+SoGn2xaMu2STiVHKGAM+ZrJ6BWn19j7o4pSbjM5
 rqBTj0mmi7XdQoDg8ZbHD7Y0ABvrQFi1YgasG/cl+cq5bvO5N0Xd6pWjJuzs5eQnBK8Y
 jcQjGpYESnFLFjGK8BYEbJ3oAOMabtH0czA0DSxMQUZmGO81+Zp6nwMKMA+rZNkrsvIo
 8uZkyfeCXlZA1T2AYdvAzc296WWGpGl+uDyuGW/SHz7iDGpUx0s6HMhiFNDaYNGrGma2
 xbM79bPk7EH4Eb6obe4v+DLog/fDWpjpKfOGSoy3ZRw0mbUU/AggR65AdGHEoHzzWtEk
 iGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pAXwq22CIxkWMtmf3I0tFYcZ+8ZNm00388IJ83MqmIk=;
 b=TpNv6r4bz39a4I4O2w8GdAt60Qmva9iG08x3X1AQpONK3C1f5tm2jz/7+isDe5jfm0
 w3GCJIckatjjWgyD3G4uCepoYx6/Y40zyNt5eASKVcOlOMDDy/EI5IJlcihLbMeBMqK0
 z8i3hkHjyse4BwYBQEdN4XgnB2zg4YSd3Ib7egk7GdZU4uPB4ig6GG7je9itY3T5R3xs
 b/oGu3nB9y7FINmwahXLUtAoeiL6qVZRnFOTrKLrQU5XEUL54i8RBUjS+YX6plVgQxle
 Ej+pjuCZ1G3bdOgID79iz0hkvwfsdtE4TutXzQp0f91QBcGl4+lePfsadX08Lo7L/NBJ
 YHOw==
X-Gm-Message-State: AOAM531Gfkm6fL1dueh92W8K6d44g87G3nwuoJPFcGAu5yH4qvgM7JBT
 ZgF3oFwwb4AfpH3F3DsKJkWToNSdLQySARIs
X-Google-Smtp-Source: ABdhPJy0RbhgbnSVmycrvP3CewI2FjRnaosL5GK6pVNcP/mgWgcLlJ7J5g8zCvXVdOgPE1BFagbtkw==
X-Received: by 2002:a7b:c1cf:: with SMTP id a15mr4292313wmj.44.1621955007167; 
 Tue, 25 May 2021 08:03:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.03.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:03:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 001/114] hw/arm/smmuv3: Another range invalidation fix
Date: Tue, 25 May 2021 16:01:31 +0100
Message-Id: <20210525150324.32370-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmuv3.c | 50 +++++++++++++++++++++++++------------------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 7bed2ac520b..01b60bee495 100644
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
2.20.1


