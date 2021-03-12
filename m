Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B011338F3A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 14:57:26 +0100 (CET)
Received: from localhost ([::1]:56796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiI9-00010S-Fi
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 08:57:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCu-0002mI-0C
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:01 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCj-0001xJ-1A
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:51:58 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 r15-20020a05600c35cfb029010e639ca09eso15846494wmq.1
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=443QEfj6jEmfyLIFQetcrjrhIC5gqr/aPUJdxkFWA3s=;
 b=Rdp96Cww3BbunDZ3SdnxvKKtCp3CHCgmUA+BuMtGtTJVgYO6ELTstzTrRQMsnibrG4
 hiU6iyuZYMfrWoC6+BQklZqSWetOfu1+Ihv1JkDMcb9vEM627/eRV9WSdGP3RI0vHIoB
 9KMjO7pemQo3QVP2eRJPrseDrJJobZq237K1xN0yNcNfhPcX4rhSffk92KrEWeQ35fUu
 +EeAl+Z/vH7WtA+zAqC9FwcPvYSPeJZ+b+nQVeIMDyAcCo22o/OIWKZQHZj/N/MjsNTM
 W2VRnGosu5yCuAl8ziR7spLJCJw1dw78b8Y81kfViS8kyiLveOgMFZ0EgcOEpN+ydaU2
 TUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=443QEfj6jEmfyLIFQetcrjrhIC5gqr/aPUJdxkFWA3s=;
 b=BKhxGARv5ShOvB5ymaBejLd5OJ3TRZF5fNbOYIeP4XjtGBmDnUyHozOdo0XZ3gISM0
 JD8daKUnIcEWze7bszVoGSogAEZzSEqbDNP9n9lR50f7s/Wwm+3uPE5v++x3eMqoU0ZU
 Upt+pozbOnaz2unTI58ekGvxW796rufxS2QjG7Om79tNngwKy4K21yjQl8Q8U++X2Pwj
 57zn2Yqc8NQYocY8OAsaFic2OfDTYa6ZfitVcns8EBmifT5ViT4cO2eQ/2HfUt5WHQl4
 eTVeykAKptG26IQ4JINxx1zyi4tjYHwXZCxKQ41y23NBqJoeTZhZoWQW86Laz+/1kd3L
 o9yg==
X-Gm-Message-State: AOAM532BNTRumqLVGyOK61iftegOfgdGxBicpJ5NUHqrbhvFci4O8MVZ
 uFw8uJJrUuvR2N+mDmU4+zLboSm5EXATh94i
X-Google-Smtp-Source: ABdhPJzpw2xUi8TpZfQDNfuePbf/uZEsQA+8iXkARPrP9O9oZKiMXv6QcBh3q/6s+6IO+wCAysBTVg==
X-Received: by 2002:a1c:c244:: with SMTP id s65mr13149734wmf.96.1615557107641; 
 Fri, 12 Mar 2021 05:51:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.51.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:51:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/39] hw/arm/smmuv3: Enforce invalidation on a power of two
 range
Date: Fri, 12 Mar 2021 13:51:08 +0000
Message-Id: <20210312135140.1099-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Message-id: 20210309102742.30442-6-eric.auger@redhat.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmu-common.c | 30 ++++++++++++++++++------------
 hw/arm/smmuv3.c      | 24 ++++++++++++++++++++----
 2 files changed, 38 insertions(+), 16 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index e9ca3aebb26..84d2c62c26f 100644
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
index bd1f97000d9..fdd6332ce54 100644
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
2.20.1


