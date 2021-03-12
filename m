Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC03338F3B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 14:57:50 +0100 (CET)
Received: from localhost ([::1]:58990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiIX-0001vj-AH
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 08:57:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCs-0002m4-6H
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:51:58 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:51153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCh-0001wG-5Q
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:51:56 -0500
Received: by mail-wm1-x334.google.com with SMTP id g25so3844950wmh.0
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=fPW9RoqtTxE8ntzbwBVvMzNW1wC9yaE3YnvAlU4shMg=;
 b=k5+sYSzS1osCnWgQ4S7RiPr8D5diqEmDBmZGQfV97jKtq0vRewjRoaCbk5vqK5mBld
 iZlXdx61h6jGWOxuRUi20OzfqortgPkGBd6+HePfslZ65kMLoDCVI6KErdn7rh5/DNoW
 YRRJ3ZyKV9LCkkhcwv8Tc00zWU5InSR/n69lGmZY0Vvj5yEPenq3cMzfFW9R6tXg5HOE
 HpWN5Bxssa7TJqrDUylcVBj7kXQxcRW8hQgQbieeOB4C5u44Tr1ltEcBbh8UjbuQubR2
 Smg2BBilI1dNrfyP1V9YItk+rUtqbiScW7Ht1kTSeHxTZTtadp+9AAbz7vJAFgPhuurl
 Qx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fPW9RoqtTxE8ntzbwBVvMzNW1wC9yaE3YnvAlU4shMg=;
 b=gY4MFSFMEH/INEApbc22tWCsQlJtqHJDueTGSiMlnKG0RjuZ0yslqtb4j8gpegDLpM
 rhR+l8MKLDf2Y1ZqGAi0/y7sos3IwlFknaA4zOXeNzZLo6If+qGkqnuLM7TEAboi8n2V
 DxxytUGykgY1HkJabxBtlsbNnONCK17vu/bePIujr+XB3xsOpqk5P74q2cZjaHRGTxZo
 BcoWjhYtNiW2ZXZBFVfdJNiCnskA1YX/P03x4ZzOtCeEmmjF3Dr2o57r+STPyRn2gu43
 lrpnqQ8eAYw6uft8IOKqq94li9dtUwxRxicaxZ+BYe0ZWLTYTwDLoO5qXfCPotmEFjuf
 ewEA==
X-Gm-Message-State: AOAM5336+Q/8SSE/4RVKcZPhFq21BoEpS0KhE8PxdPGc+K/hRzNF98Xo
 jm2l1+rkY38F0PTohHJA8tIjIydxMCD/MaPj
X-Google-Smtp-Source: ABdhPJxlyBx++iZ5GSlfT4ER+P3Xt8Ird9qxIU+xstTwuOhbSPu4JSTNjDEOGPRm5z9Mun95uXWrSg==
X-Received: by 2002:a7b:c3cd:: with SMTP id t13mr13082786wmj.109.1615557105763; 
 Fri, 12 Mar 2021 05:51:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.51.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:51:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/39] dma: Introduce dma_aligned_pow2_mask()
Date: Fri, 12 Mar 2021 13:51:05 +0000
Message-Id: <20210312135140.1099-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

Currently get_naturally_aligned_size() is used by the intel iommu
to compute the maximum invalidation range based on @size which is
a power of 2 while being aligned with the @start address and less
than the maximum range defined by @gaw.

This helper is also useful for other iommu devices (virtio-iommu,
SMMUv3) to make sure IOMMU UNMAP notifiers only are called with
power of 2 range sizes.

Let's move this latter into dma-helpers.c and rename it into
dma_aligned_pow2_mask(). Also rewrite the helper so that it
accomodates UINT64_MAX values for the size mask and max mask.
It now returns a mask instead of a size. Change the caller.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-id: 20210309102742.30442-3-eric.auger@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/sysemu/dma.h  | 12 ++++++++++++
 hw/i386/intel_iommu.c | 30 +++++++-----------------------
 softmmu/dma-helpers.c | 26 ++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 23 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index a052f7bca3f..3201e7901db 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -296,4 +296,16 @@ uint64_t dma_buf_write(uint8_t *ptr, int32_t len, QEMUSGList *sg);
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
                     QEMUSGList *sg, enum BlockAcctType type);
 
+/**
+ * dma_aligned_pow2_mask: Return the address bit mask of the largest
+ * power of 2 size less or equal than @end - @start + 1, aligned with @start,
+ * and bounded by 1 << @max_addr_bits bits.
+ *
+ * @start: range start address
+ * @end: range end address (greater than @start)
+ * @max_addr_bits: max address bits (<= 64)
+ */
+uint64_t dma_aligned_pow2_mask(uint64_t start, uint64_t end,
+                               int max_addr_bits);
+
 #endif
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 3206f379f8b..6be8f329185 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -35,6 +35,7 @@
 #include "hw/i386/x86-iommu.h"
 #include "hw/pci-host/q35.h"
 #include "sysemu/kvm.h"
+#include "sysemu/dma.h"
 #include "sysemu/sysemu.h"
 #include "hw/i386/apic_internal.h"
 #include "kvm/kvm_i386.h"
@@ -3455,24 +3456,6 @@ VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus, int devfn)
     return vtd_dev_as;
 }
 
-static uint64_t get_naturally_aligned_size(uint64_t start,
-                                           uint64_t size, int gaw)
-{
-    uint64_t max_mask = 1ULL << gaw;
-    uint64_t alignment = start ? start & -start : max_mask;
-
-    alignment = MIN(alignment, max_mask);
-    size = MIN(size, max_mask);
-
-    if (alignment <= size) {
-        /* Increase the alignment of start */
-        return alignment;
-    } else {
-        /* Find the largest page mask from size */
-        return 1ULL << (63 - clz64(size));
-    }
-}
-
 /* Unmap the whole range in the notifier's scope. */
 static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
 {
@@ -3501,13 +3484,14 @@ static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
 
     while (remain >= VTD_PAGE_SIZE) {
         IOMMUTLBEvent event;
-        uint64_t mask = get_naturally_aligned_size(start, remain, s->aw_bits);
+        uint64_t mask = dma_aligned_pow2_mask(start, end, s->aw_bits);
+        uint64_t size = mask + 1;
 
-        assert(mask);
+        assert(size);
 
         event.type = IOMMU_NOTIFIER_UNMAP;
         event.entry.iova = start;
-        event.entry.addr_mask = mask - 1;
+        event.entry.addr_mask = mask;
         event.entry.target_as = &address_space_memory;
         event.entry.perm = IOMMU_NONE;
         /* This field is meaningless for unmap */
@@ -3515,8 +3499,8 @@ static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
 
         memory_region_notify_iommu_one(n, &event);
 
-        start += mask;
-        remain -= mask;
+        start += size;
+        remain -= size;
     }
 
     assert(!remain);
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 29001b54595..7d766a5e89a 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -330,3 +330,29 @@ void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
 {
     block_acct_start(blk_get_stats(blk), cookie, sg->size, type);
 }
+
+uint64_t dma_aligned_pow2_mask(uint64_t start, uint64_t end, int max_addr_bits)
+{
+    uint64_t max_mask = UINT64_MAX, addr_mask = end - start;
+    uint64_t alignment_mask, size_mask;
+
+    if (max_addr_bits != 64) {
+        max_mask = (1ULL << max_addr_bits) - 1;
+    }
+
+    alignment_mask = start ? (start & -start) - 1 : max_mask;
+    alignment_mask = MIN(alignment_mask, max_mask);
+    size_mask = MIN(addr_mask, max_mask);
+
+    if (alignment_mask <= size_mask) {
+        /* Increase the alignment of start */
+        return alignment_mask;
+    } else {
+        /* Find the largest page mask from size */
+        if (addr_mask == UINT64_MAX) {
+            return UINT64_MAX;
+        }
+        return (1ULL << (63 - clz64(addr_mask + 1))) - 1;
+    }
+}
+
-- 
2.20.1


