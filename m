Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED43664DBA0
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 13:51:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5ngq-0006eH-WC; Thu, 15 Dec 2022 07:50:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngo-0006cd-Bx
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:18 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngm-00045o-LA
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:18 -0500
Received: by mail-wm1-x335.google.com with SMTP id v7so13710943wmn.0
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aZPssVEhQbiKPfXn/XHsh9hjfGaH9CjO9zQb7G+virQ=;
 b=e3HvTfEgXc1qIp4Gz76WoqWTT07wIqurHXxWWM8+loJZu3sYq0naV/x5hMxHlddggw
 1BufbUCX4uccwoVDdARh4s+J86Xd6Zz/gdn3xGM416gTb75m34pFnGOLFyWBFZryPkN3
 Bgult2YtmDm0ZmkFn6k1Lg43nPpK7zh+uFCbxqUZT9B9ZCa2SPL0fK3mT8IBSyXzZ7uP
 N6uFnjOMEJyzlYMoJMxKv1H34Ztc8rArUsDbOWt9Xbs2AW8IwAON2XyGZGPVkTaWuXkM
 wTN8vMCPQjv7JxHx+EQQ9QXhfC9NSUXfh26CQh6hkBqZGIebIcX5B3h7um/PRH/3+P0P
 aLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aZPssVEhQbiKPfXn/XHsh9hjfGaH9CjO9zQb7G+virQ=;
 b=te2mofJlbX95bst5GBmKzvp5rjG02I+hR4n4G3Wcgw7KtfM2ozCLP30YCvCwHk1YKk
 Naftfsu4T/ZR+IzCkiOJf5L3+y+8DkjUvJl/hXhJdf1nqX8ZMGWX+HkC+K3cPyav1VLH
 WI0vhopPW6jh3uei5N46iSguUfSXcaUHnoeMeFmjGkmo5aU37Ozpax2einjlp0whqPp6
 dQrPKEnfK/Vrefzbg/A5XCZj3c9SZ6Y2MTPYw12QZifRjishHiz89AJ3BqvulqmfjuFd
 EZajWb/SXo03KedzDg7c0Bs0pllDEEHE03nLOlqE0LlTjE4uu8y2KuCubBqwYaqbUxVS
 v4oA==
X-Gm-Message-State: ANoB5pnfAR29N6Vtx0lFvYxVcW58q2w5cLAS8UhPzsK8PiOrklEjBmLP
 5IayOy2C/sLtC7o2DLD1QGXA/3wo3JpJqQiI
X-Google-Smtp-Source: AA0mqf7biR91n+wVd7Lulx3qLzALwEzwQSU/IJhCRIhkMeBHqJ3KCuCFAYy44Xgw5Pu/656Bo9vUTw==
X-Received: by 2002:a05:600c:3ac7:b0:3d0:7fee:8a70 with SMTP id
 d7-20020a05600c3ac700b003d07fee8a70mr22079782wms.19.1671108614949; 
 Thu, 15 Dec 2022 04:50:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/29] hw/arm/virt: Introduce variable region_base in
 virt_set_high_memmap()
Date: Thu, 15 Dec 2022 12:49:43 +0000
Message-Id: <20221215125009.980128-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215125009.980128-1-peter.maydell@linaro.org>
References: <20221215125009.980128-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Gavin Shan <gshan@redhat.com>

This introduces variable 'region_base' for the base address of the
specific high memory region. It's the preparatory work to optimize
high memory region address assignment.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
Message-id: 20221029224307.138822-4-gshan@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 2659f4db15c..3bb1bf079ff 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1693,15 +1693,15 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
 static void virt_set_high_memmap(VirtMachineState *vms,
                                  hwaddr base, int pa_bits)
 {
-    hwaddr region_size;
+    hwaddr region_base, region_size;
     bool fits;
     int i;
 
     for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
+        region_base = ROUND_UP(base, extended_memmap[i].size);
         region_size = extended_memmap[i].size;
 
-        base = ROUND_UP(base, region_size);
-        vms->memmap[i].base = base;
+        vms->memmap[i].base = region_base;
         vms->memmap[i].size = region_size;
 
         /*
@@ -1710,9 +1710,9 @@ static void virt_set_high_memmap(VirtMachineState *vms,
          *
          * For each device that doesn't fit, disable it.
          */
-        fits = (base + region_size) <= BIT_ULL(pa_bits);
+        fits = (region_base + region_size) <= BIT_ULL(pa_bits);
         if (fits) {
-            vms->highest_gpa = base + region_size - 1;
+            vms->highest_gpa = region_base + region_size - 1;
         }
 
         switch (i) {
@@ -1727,7 +1727,7 @@ static void virt_set_high_memmap(VirtMachineState *vms,
             break;
         }
 
-        base += region_size;
+        base = region_base + region_size;
     }
 }
 
-- 
2.25.1


