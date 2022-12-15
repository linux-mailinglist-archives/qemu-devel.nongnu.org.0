Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB63064DBF3
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 14:09:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5ngs-0006gp-U0; Thu, 15 Dec 2022 07:50:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngp-0006dK-5Z
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:19 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngn-00045v-3x
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:18 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so1624646wmb.2
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HwbRvl+35CTPIyxpkdvHciwwdNBHg4iIhCv/TONaLwM=;
 b=jzQUC7Giq0QmU4apJzKiqXNSM1DzjTyi/wUgHpCQ9zbm12r8MEJSUtkBfLarRaxF8n
 5pgFnAkSpm37NyLsFvp5UpECi+mYfUYOy/98hqbKRupoNfHrgSom2je5Xavoy2pIR35G
 EYQphkdSDJaHS0vjGpYsBx/kas35tTfTtRCnwXF75frZQdk7CAZhH8MXmxpdJ4EkbQ/x
 2d8V2IsEZ0+jxJEDUwMVthyhTTKz5kxtdRUF+3+mDEt/ypYsIfZeCpjawBCmI8ndISdp
 MQNHij12ufGfXlVPR1xBAvgRvOHRg0CtNOrd9ibfoCyDDJFMlvBvNreT9haNjtBVfGPr
 yRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HwbRvl+35CTPIyxpkdvHciwwdNBHg4iIhCv/TONaLwM=;
 b=UJs/LIRIdQFO9gRrnfxrbVT7uihdc/thzW0nRpK0K4HIUYx8LyC3IEiagdZEVd/k6f
 /vL4D1iGRiDZjcF1snilZpu7Ilw7wIIBKHOmoSOzNH+D7snF8RObiIW9Ovb0G30TL31R
 7R/dWxDPRKZCZtFWPz7+Ej8ayjOmbqQBrnSmW7Ij60MAsYTbPXzNtsUD8boKvQNtCn/z
 3/0IbIgzQxWZN5Cc4HqAEl7zNKnlLFtrLCEH4mV9kK9vj6sE8l9tnjZt0aM3ZRp8HYwH
 TOzRmfICoa9a9PlZd42OzGI0cx1jB+Jus9Mp7SFBU8r+229z8uc1XfvHvM6xJK1GrLTp
 b2pg==
X-Gm-Message-State: ANoB5pmta7KyhOWf4wjEcYzgNOWlX3UegkssZR+WHZLdsmekOoLz0v5g
 VLR2FXgA92CG9yP2tPBGtA3aXK9gp2atC3G8
X-Google-Smtp-Source: AA0mqf7o9pRJORGjNL6HsUgh+gZXJGZYhfYMWfUDAo5EqLyBOwfZFxjaYUXaAzjEBE+NTi/sqlz04w==
X-Received: by 2002:a05:600c:4f93:b0:3cf:6e85:eda7 with SMTP id
 n19-20020a05600c4f9300b003cf6e85eda7mr22601868wmq.14.1671108615872; 
 Thu, 15 Dec 2022 04:50:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/29] hw/arm/virt: Introduce virt_get_high_memmap_enabled()
 helper
Date: Thu, 15 Dec 2022 12:49:44 +0000
Message-Id: <20221215125009.980128-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215125009.980128-1-peter.maydell@linaro.org>
References: <20221215125009.980128-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

This introduces virt_get_high_memmap_enabled() helper, which returns
the pointer to vms->highmem_{redists, ecam, mmio}. The pointer will
be used in the subsequent patches.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
Message-id: 20221029224307.138822-5-gshan@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3bb1bf079ff..7689337470a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1690,14 +1690,31 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
     return arm_cpu_mp_affinity(idx, clustersz);
 }
 
+static inline bool *virt_get_high_memmap_enabled(VirtMachineState *vms,
+                                                 int index)
+{
+    bool *enabled_array[] = {
+        &vms->highmem_redists,
+        &vms->highmem_ecam,
+        &vms->highmem_mmio,
+    };
+
+    assert(ARRAY_SIZE(extended_memmap) - VIRT_LOWMEMMAP_LAST ==
+           ARRAY_SIZE(enabled_array));
+    assert(index - VIRT_LOWMEMMAP_LAST < ARRAY_SIZE(enabled_array));
+
+    return enabled_array[index - VIRT_LOWMEMMAP_LAST];
+}
+
 static void virt_set_high_memmap(VirtMachineState *vms,
                                  hwaddr base, int pa_bits)
 {
     hwaddr region_base, region_size;
-    bool fits;
+    bool *region_enabled, fits;
     int i;
 
     for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
+        region_enabled = virt_get_high_memmap_enabled(vms, i);
         region_base = ROUND_UP(base, extended_memmap[i].size);
         region_size = extended_memmap[i].size;
 
@@ -1715,18 +1732,7 @@ static void virt_set_high_memmap(VirtMachineState *vms,
             vms->highest_gpa = region_base + region_size - 1;
         }
 
-        switch (i) {
-        case VIRT_HIGH_GIC_REDIST2:
-            vms->highmem_redists &= fits;
-            break;
-        case VIRT_HIGH_PCIE_ECAM:
-            vms->highmem_ecam &= fits;
-            break;
-        case VIRT_HIGH_PCIE_MMIO:
-            vms->highmem_mmio &= fits;
-            break;
-        }
-
+        *region_enabled &= fits;
         base = region_base + region_size;
     }
 }
-- 
2.25.1


