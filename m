Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7877164DBC4
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 13:57:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5ngt-0006h4-8U; Thu, 15 Dec 2022 07:50:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngq-0006eK-0N
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:20 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngn-00046B-Vn
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:19 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so1663822wmh.0
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8crXX2Vz1e8DxMP/PXNKOUHg5I2gJfVv7C5htrZV0hQ=;
 b=zGTncryIwrXkfifsxg9K/ZhAeMYtV6afZ72swIF7drBAU1N+Y0YrJ2DZIdUJsvVRA7
 Qo10yS34744wMTF/vIH4QPKBkVdLB0QZjN+QIKnP5vmofjgt77c2ta12AgIEkRDOBXBN
 kbIIXBUYtDz+dN0uqpOhLEYkMhUTp10MnDXOaKV91wVc7qEvvkSBG+iDxMizkheSSVgq
 LgqQv1pprpPd0rdGM1VDOwngPaS0v92wS6h2SNkRUIVWqRdNiF7Hh+wCETfBLBGZ4/yf
 9V6nKChKmwgQk5M5vRQ4ij+X4rYuoxJyhZJ+ke7/HtFCz3KSbf36WJUhvpit2/qbcE25
 yjlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8crXX2Vz1e8DxMP/PXNKOUHg5I2gJfVv7C5htrZV0hQ=;
 b=MGJlJ7Q96LiFsp9+lKwOjkwH03OrL+hueMg5V9QHBLLbRCxKCMSwKUGgqfLtWZEVSZ
 2nqFHyzZahLBoE+yK3kJWaulInKRs3YvA+xNc01ZjzcfIft8WNy+u4PZkdwxbEe7Ahyn
 Sl8PtWFSkITQ91T3mHFNVTTF9NqA/Oa4eX+unkXsMrPhS+bexXI2i9cKDLs0VtFmq79b
 U4dzuVD6MwVgzr1wCFR/wMUuopnC3gQ69aTRELmlIr3Kd7dGf+01a4Ys1HNBnVY5A5WY
 8yzgK5Lu828GO5Ltwd+13+MH+ga7+hLIXSVusCSKYxMtY0yu11d8kno8eLei0K7XLKDx
 BDTA==
X-Gm-Message-State: ANoB5pmNGA4tZGYlMrUy5zotkXf8MLAdptX6ypWUMO0eHgabTqf+A8Ak
 gurjD85KeVHWQI/ZW+pq0FHCfJBW1Qj9zgoI
X-Google-Smtp-Source: AA0mqf7biMCkQkcumosVKEW6iHhpCg5mno93D8UjGExCeBpEDQw7K/0TIGMz6LD8eaNIkaG0nFTErg==
X-Received: by 2002:a05:600c:1c93:b0:3d0:7026:f0ad with SMTP id
 k19-20020a05600c1c9300b003d07026f0admr21677417wms.38.1671108616724; 
 Thu, 15 Dec 2022 04:50:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/29] hw/arm/virt: Improve high memory region address
 assignment
Date: Thu, 15 Dec 2022 12:49:45 +0000
Message-Id: <20221215125009.980128-6-peter.maydell@linaro.org>
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

There are three high memory regions, which are VIRT_HIGH_REDIST2,
VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
are floating on highest RAM address. However, they can be disabled
in several cases.

(1) One specific high memory region is likely to be disabled by
    code by toggling vms->highmem_{redists, ecam, mmio}.

(2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
    'virt-2.12' or ealier than it.

(3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
    on 32-bits system.

(4) One specific high memory region is disabled when it breaks the
    PA space limit.

The current implementation of virt_set_{memmap, high_memmap}() isn't
optimized because the high memory region's PA space is always reserved,
regardless of whatever the actual state in the corresponding
vms->highmem_{redists, ecam, mmio} flag. In the code, 'base' and
'vms->highest_gpa' are always increased for case (1), (2) and (3).
It's unnecessary since the assigned PA space for the disabled high
memory region won't be used afterwards.

Improve the address assignment for those three high memory region by
skipping the address assignment for one specific high memory region if
it has been disabled in case (1), (2) and (3). The memory layout may
be changed after the improvement is applied, which leads to potential
migration breakage. So 'vms->highmem_compact' is added to control if
the improvement should be applied. For now, 'vms->highmem_compact' is
set to false, meaning that we don't have memory layout change until it
becomes configurable through property 'compact-highmem' in next patch.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
Message-id: 20221029224307.138822-6-gshan@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/virt.h |  1 +
 hw/arm/virt.c         | 15 ++++++++++-----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 6ec479ca2b7..709f6237412 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -144,6 +144,7 @@ struct VirtMachineState {
     PFlashCFI01 *flash[2];
     bool secure;
     bool highmem;
+    bool highmem_compact;
     bool highmem_ecam;
     bool highmem_mmio;
     bool highmem_redists;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7689337470a..807175707e7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1722,18 +1722,23 @@ static void virt_set_high_memmap(VirtMachineState *vms,
         vms->memmap[i].size = region_size;
 
         /*
-         * Check each device to see if they fit in the PA space,
-         * moving highest_gpa as we go.
+         * Check each device to see if it fits in the PA space,
+         * moving highest_gpa as we go. For compatibility, move
+         * highest_gpa for disabled fitting devices as well, if
+         * the compact layout has been disabled.
          *
          * For each device that doesn't fit, disable it.
          */
         fits = (region_base + region_size) <= BIT_ULL(pa_bits);
-        if (fits) {
-            vms->highest_gpa = region_base + region_size - 1;
+        *region_enabled &= fits;
+        if (vms->highmem_compact && !*region_enabled) {
+            continue;
         }
 
-        *region_enabled &= fits;
         base = region_base + region_size;
+        if (fits) {
+            vms->highest_gpa = base - 1;
+        }
     }
 }
 
-- 
2.25.1


