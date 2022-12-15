Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8311F64DC07
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 14:13:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5ngp-0006cT-Pm; Thu, 15 Dec 2022 07:50:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngm-0006bR-I7
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:16 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngk-00045d-My
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:16 -0500
Received: by mail-wm1-x32c.google.com with SMTP id ay40so13692699wmb.2
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ju1JwZIZJKkp9vxG0wSz+KQOFubdrSKxVCNw3F2ffWI=;
 b=PhlrbVKPT/nhEmw0NdU9d6pGH4LXOM+6xrBipphNrZ77/wAOXT1BTNK+qkOTNTa5Lp
 Y51aq5x4UdQ0UFvMdKp9OWazp7LFPXtId3L+tQSTW5SgwDV+rrWI+tWD98pYshqO+j/B
 jQBI5MA5LI4E46CUHsYgBRtH9NyU+qIGgJSMGv7YwqZjB8XzaKdOuiMU0QRP3FNt2VLX
 H/bz22HopGyLcJUoLFoCx8DkjQf3DUhAjuRRRSEuCO7qbl2pNxh8X6BvEt8YmYJkZ4Fc
 U+bjx46w8q6lIounv3YY8lX4Sci3bEAOS3yYjtA1TyKxs+QNkIEjjktWZPvseRVwVpII
 pEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ju1JwZIZJKkp9vxG0wSz+KQOFubdrSKxVCNw3F2ffWI=;
 b=TCGG4CthtSWORtryFXUlmAwkQ3w1Tz81iGWq/3Wpkh8CXWF8n/50+132z/++HajRMr
 iPUCl4CcqBcQBnNUy+qNXNuZgsJAs/GBj1cOSAI6IRR3GqpnnloOoweErJ8F1ELdHoay
 J/p9kWjz6rx9/I4D2/opK/2jRfzopaGxT7NHBzXqZKwD9Zr1LtnyGbaTE1IRHmImomlx
 SrO1AcYlZ2EMLa9Kco3rZb1Ospq34oAHOFi2raOINTtAReHIlpjpMpNnZYdpMEC2a1xX
 Qgg1/ETgpPW1F4FMNjgRnmobjF3GkgHmUXvfJ8U1V+995KFZ4anFMFwFqPX7+hBM8y4P
 GrlA==
X-Gm-Message-State: ANoB5pleh9r58ol1Nj+PqISw7i5RyTPp/Y7KRNGli/UDM9LMCffAAqVI
 QGX77YYA2o7CDBwcF77lka94Cr1WJqfF9HkK
X-Google-Smtp-Source: AA0mqf5HVcb+Tvc5s1aCrBiAUQ5GILNYkWjNiD6PT0g6JL3vPDj1S5HLJioKby7hixIsBwJhH34jZA==
X-Received: by 2002:a05:600c:348a:b0:3cf:69f4:bfd4 with SMTP id
 a10-20020a05600c348a00b003cf69f4bfd4mr22077956wmq.7.1671108613328; 
 Thu, 15 Dec 2022 04:50:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/29] hw/arm/virt: Introduce virt_set_high_memmap() helper
Date: Thu, 15 Dec 2022 12:49:41 +0000
Message-Id: <20221215125009.980128-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215125009.980128-1-peter.maydell@linaro.org>
References: <20221215125009.980128-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

This introduces virt_set_high_memmap() helper. The logic of high
memory region address assignment is moved to the helper. The intention
is to make the subsequent optimization for high memory region address
assignment easier.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
Message-id: 20221029224307.138822-2-gshan@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 74 ++++++++++++++++++++++++++++-----------------------
 1 file changed, 41 insertions(+), 33 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b8713508561..ca300281939 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1690,6 +1690,46 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
     return arm_cpu_mp_affinity(idx, clustersz);
 }
 
+static void virt_set_high_memmap(VirtMachineState *vms,
+                                 hwaddr base, int pa_bits)
+{
+    int i;
+
+    for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
+        hwaddr size = extended_memmap[i].size;
+        bool fits;
+
+        base = ROUND_UP(base, size);
+        vms->memmap[i].base = base;
+        vms->memmap[i].size = size;
+
+        /*
+         * Check each device to see if they fit in the PA space,
+         * moving highest_gpa as we go.
+         *
+         * For each device that doesn't fit, disable it.
+         */
+        fits = (base + size) <= BIT_ULL(pa_bits);
+        if (fits) {
+            vms->highest_gpa = base + size - 1;
+        }
+
+        switch (i) {
+        case VIRT_HIGH_GIC_REDIST2:
+            vms->highmem_redists &= fits;
+            break;
+        case VIRT_HIGH_PCIE_ECAM:
+            vms->highmem_ecam &= fits;
+            break;
+        case VIRT_HIGH_PCIE_MMIO:
+            vms->highmem_mmio &= fits;
+            break;
+        }
+
+        base += size;
+    }
+}
+
 static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
 {
     MachineState *ms = MACHINE(vms);
@@ -1745,39 +1785,7 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
     /* We know for sure that at least the memory fits in the PA space */
     vms->highest_gpa = memtop - 1;
 
-    for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
-        hwaddr size = extended_memmap[i].size;
-        bool fits;
-
-        base = ROUND_UP(base, size);
-        vms->memmap[i].base = base;
-        vms->memmap[i].size = size;
-
-        /*
-         * Check each device to see if they fit in the PA space,
-         * moving highest_gpa as we go.
-         *
-         * For each device that doesn't fit, disable it.
-         */
-        fits = (base + size) <= BIT_ULL(pa_bits);
-        if (fits) {
-            vms->highest_gpa = base + size - 1;
-        }
-
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
-        base += size;
-    }
+    virt_set_high_memmap(vms, base, pa_bits);
 
     if (device_memory_size > 0) {
         ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
-- 
2.25.1


