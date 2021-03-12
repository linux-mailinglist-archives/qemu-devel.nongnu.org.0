Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DE1338F4E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:01:00 +0100 (CET)
Received: from localhost ([::1]:39208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiLb-0005OD-MD
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:00:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCu-0002mH-0F
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:01 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:36765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCi-0001wz-QM
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:51:59 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 r15-20020a05600c35cfb029010e639ca09eso15846452wmq.1
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9WiOxlEe27PuiZnDLFJMbb0OXvclNP6jk4ylN3+zl1Y=;
 b=ogeRsHTCJxuL6KaBNkGQ0sXpGMTgr74Zhqsus2ssRKPwZm8j1ybHRpOAJNpeV1kEoD
 1aK53D6iuBFssMgEEWXG0QLk1Q2Rjjh7KPdCeE20f/5qMruv8Ou+aU+Vn/m+ywESyImA
 hQPQbaqd3fkJi8PuhpslXdzbVOdaagvynDv+yoVS2J5uJQygh22omu9MJK/ySKWbkomz
 l2XAByROQyGW/moqbWmdKNjDqz8lLD6HgoIG+/R6LrWUp0w0JaEaTbTOpo/HviEPd0dn
 zBCxEYhGJD7Raz2xdwwMccZKSxHkF0yJJHGEVR7C3C9vUeIcLErR0SeMUX8+oULDQEB6
 XxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9WiOxlEe27PuiZnDLFJMbb0OXvclNP6jk4ylN3+zl1Y=;
 b=FRd0HsMAGWX30b7x7jpDGP3tF0ClnskjDX8dw0hAJ21RP30YtYit31o6oPqxWeDtAF
 vLdYysYZhhGgrIZdXfsFZLck3y3E2zpQQGJfDT4DoW5Nxy2oJryw1pqP7HhSaZ0ocUqE
 MgJccNayxTrmnsm1mLpNfvKNkTAwlArhgnO0tnIxC+8vDZd0TrK3nlaJ/D7UMjkChG5k
 H/KHg3NQGB7KMJhWuSeQjra2EPxdQy7EFxDc5oHK/hrNeGkJan4ts4EXpRSbwpDX6MXy
 /kbn+mOYjw4FzV48T4xRqjzUtrM14gMhzyAa3yyJpqP4vGlOTuCc2yUJBNYpskr6UTZo
 EcUw==
X-Gm-Message-State: AOAM530W/FOztJrVPreBenN0ceH3VCL/a4IPgqfclLSk5ZlKG5VaxQOl
 tJ8X0LH8qtr2nJEcZ8iGH8WeOn66gF9D6UqD
X-Google-Smtp-Source: ABdhPJwZBcCDojm3SVLZ/i925XJV9R13KFNVbgV8CgNNrnkAN8OruZGFSW5hs8VbwUs41nCB3hWJIQ==
X-Received: by 2002:a1c:28c1:: with SMTP id
 o184mr12711909wmo.183.1615557106355; 
 Fri, 12 Mar 2021 05:51:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.51.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:51:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/39] virtio-iommu: Handle non power of 2 range invalidations
Date: Fri, 12 Mar 2021 13:51:06 +0000
Message-Id: <20210312135140.1099-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Unmap notifiers work with an address mask assuming an
invalidation range of a power of 2. Nothing mandates this
in the VIRTIO-IOMMU spec.

So in case the range is not a power of 2, split it into
several invalidations.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-id: 20210309102742.30442-4-eric.auger@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/virtio/virtio-iommu.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index c2883a2f6c8..1b23e8e18c7 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -155,6 +155,7 @@ static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr virt_start,
                                       hwaddr virt_end)
 {
     IOMMUTLBEvent event;
+    uint64_t delta = virt_end - virt_start;
 
     if (!(mr->iommu_notify_flags & IOMMU_NOTIFIER_UNMAP)) {
         return;
@@ -164,12 +165,24 @@ static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr virt_start,
 
     event.type = IOMMU_NOTIFIER_UNMAP;
     event.entry.target_as = &address_space_memory;
-    event.entry.addr_mask = virt_end - virt_start;
-    event.entry.iova = virt_start;
     event.entry.perm = IOMMU_NONE;
     event.entry.translated_addr = 0;
+    event.entry.addr_mask = delta;
+    event.entry.iova = virt_start;
 
-    memory_region_notify_iommu(mr, 0, event);
+    if (delta == UINT64_MAX) {
+        memory_region_notify_iommu(mr, 0, event);
+    }
+
+
+    while (virt_start != virt_end + 1) {
+        uint64_t mask = dma_aligned_pow2_mask(virt_start, virt_end, 64);
+
+        event.entry.addr_mask = mask;
+        event.entry.iova = virt_start;
+        memory_region_notify_iommu(mr, 0, event);
+        virt_start += mask + 1;
+    }
 }
 
 static gboolean virtio_iommu_notify_unmap_cb(gpointer key, gpointer value,
-- 
2.20.1


