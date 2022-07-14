Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B362B5749F2
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 12:03:03 +0200 (CEST)
Received: from localhost ([::1]:49704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBvgU-0008A0-RU
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 06:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oBvZy-0000dA-L3
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:56:20 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oBvZv-0007GZ-Ea
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:56:16 -0400
Received: by mail-wr1-x434.google.com with SMTP id b26so1851012wrc.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IMsLdFXUKjg8gxiV1zeXCe1cmS1XMbmFruwv7Ng6CnQ=;
 b=n6IGINREfAHJ2kfCt/utFbdoQBR5G4TQrxqLmB1B8IwrhYPIsDxPr0uBhJYuoYI/SL
 LkzFUFupjQzeJ/56wul6t7AH4f/jWiSG2WzIwjAEQe27Kea4Bmu5QTuWOEfsMsXbv2z5
 40utX/b+TOBgG7VKZTJMmiflxyj1KvBLsPtWUk4C4jjYFtVY3M5SJ/anlstysr6ms7Po
 c0UUrxDmDE0W+dsMmSG/l9sxFguqYvn93PEm2tTHqQ5syfnJiMHOdFjKWC4JZmLSR8FY
 fFghCgZPGrHGIlOYSQJ7A5WQ5Y5Zawiy4Lo6BfKPl06bawi1w+YXZCUtM9M4W7isX3R6
 Kofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IMsLdFXUKjg8gxiV1zeXCe1cmS1XMbmFruwv7Ng6CnQ=;
 b=MvaJ9iUxF7eRlP6M7KzjrLAKkCc2tEPBHxrbmNVeAoQgSRK+Ep2/Bl0KT2cFZBL99m
 x7yXqs0FPMKFwyahLwQ4ZRlhdua6LaWXiI+HY4KD/unfe9zwpkOBTk+vLQ6AdwVRf7Ih
 2pt7pwLL5XTONm5OGd1OK9+G142J/ENKTsWepHbSap79x9/MtgzbWqnufZsD8vqaPeBL
 AxhH1gzfNzeSuEmg4diq0TOSH8ldZ0pZF7njq/FHid3hhkwXqMlXa7DwrXQwrIYL4RDk
 JvEWQH+tibMrCxLDDvvHHM3YEUjzXoIrjZJzL0aSUf/W9vu6Q4TSF9+frnX3ZfcuyGpS
 3ZAg==
X-Gm-Message-State: AJIora9LWSLRpuXJJdn3dnrS3ub3pUI3s4ipE/Bh2myQCIDCpzpMZ8ec
 ny73KkRl1ccXcDN+VtoNkpKgkg==
X-Google-Smtp-Source: AGRyM1vo5lBoGrJ6ZBkw0iNq4ih8m5HbjFhac32d2kwUFkbDykC1YhJ0SOFEsnSkx0vbS3CjGTEHFg==
X-Received: by 2002:a5d:47a1:0:b0:21d:a50e:b2d7 with SMTP id
 1-20020a5d47a1000000b0021da50eb2d7mr7823422wrb.58.1657792572372; 
 Thu, 14 Jul 2022 02:56:12 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 o42-20020a05600c512a00b0039c457cea21sm1386453wms.34.2022.07.14.02.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:56:11 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Cc: mst@redhat.com, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Tina Zhang <tina.zhang@intel.com>
Subject: [PATCH] hw/virtio/virtio-iommu: Enforce power-of-two notify for both
 MAP and UNMAP
Date: Thu, 14 Jul 2022 10:54:19 +0100
Message-Id: <20220714095418.261387-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Currently we only enforce power-of-two mappings (required by the QEMU
notifier) for UNMAP requests. A MAP request not aligned on a
power-of-two may be successfully handled by VFIO, and then the
corresponding UNMAP notify will fail because it will attempt to split
that mapping. Ensure MAP and UNMAP notifications are consistent.

Fixes: dde3f08b5cab ("virtio-iommu: Handle non power of 2 range invalidations")
Reported-by: Tina Zhang <tina.zhang@intel.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/virtio/virtio-iommu.c | 44 +++++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 281152d338..f3ecbc71af 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -197,6 +197,29 @@ static gint interval_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
     }
 }
 
+static void virtio_iommu_notify_map_unmap(IOMMUMemoryRegion *mr,
+                                          IOMMUTLBEvent *event,
+                                          hwaddr virt_start, hwaddr virt_end)
+{
+    uint64_t delta = virt_end - virt_start;
+
+    event->entry.iova = virt_start;
+    event->entry.addr_mask = delta;
+
+    if (delta == UINT64_MAX) {
+        memory_region_notify_iommu(mr, 0, *event);
+    }
+
+    while (virt_start != virt_end + 1) {
+        uint64_t mask = dma_aligned_pow2_mask(virt_start, virt_end, 64);
+
+        event->entry.addr_mask = mask;
+        event->entry.iova = virt_start;
+        memory_region_notify_iommu(mr, 0, *event);
+        virt_start += mask + 1;
+    }
+}
+
 static void virtio_iommu_notify_map(IOMMUMemoryRegion *mr, hwaddr virt_start,
                                     hwaddr virt_end, hwaddr paddr,
                                     uint32_t flags)
@@ -215,19 +238,16 @@ static void virtio_iommu_notify_map(IOMMUMemoryRegion *mr, hwaddr virt_start,
 
     event.type = IOMMU_NOTIFIER_MAP;
     event.entry.target_as = &address_space_memory;
-    event.entry.addr_mask = virt_end - virt_start;
-    event.entry.iova = virt_start;
     event.entry.perm = perm;
     event.entry.translated_addr = paddr;
 
-    memory_region_notify_iommu(mr, 0, event);
+    virtio_iommu_notify_map_unmap(mr, &event, virt_start, virt_end);
 }
 
 static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr virt_start,
                                       hwaddr virt_end)
 {
     IOMMUTLBEvent event;
-    uint64_t delta = virt_end - virt_start;
 
     if (!(mr->iommu_notify_flags & IOMMU_NOTIFIER_UNMAP)) {
         return;
@@ -239,22 +259,8 @@ static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr virt_start,
     event.entry.target_as = &address_space_memory;
     event.entry.perm = IOMMU_NONE;
     event.entry.translated_addr = 0;
-    event.entry.addr_mask = delta;
-    event.entry.iova = virt_start;
-
-    if (delta == UINT64_MAX) {
-        memory_region_notify_iommu(mr, 0, event);
-    }
 
-
-    while (virt_start != virt_end + 1) {
-        uint64_t mask = dma_aligned_pow2_mask(virt_start, virt_end, 64);
-
-        event.entry.addr_mask = mask;
-        event.entry.iova = virt_start;
-        memory_region_notify_iommu(mr, 0, event);
-        virt_start += mask + 1;
-    }
+    virtio_iommu_notify_map_unmap(mr, &event, virt_start, virt_end);
 }
 
 static gboolean virtio_iommu_notify_unmap_cb(gpointer key, gpointer value,
-- 
2.36.1


