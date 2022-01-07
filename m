Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3167487AA5
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 17:44:25 +0100 (CET)
Received: from localhost ([::1]:57332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5sLp-0000fu-1p
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 11:44:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1n5sC7-0006JE-7p
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 11:34:25 -0500
Received: from [2604:1380:4601:e00::1] (port=55102 helo=ams.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1n5sBz-0006cw-Dd
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 11:34:21 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1732EB82670;
 Fri,  7 Jan 2022 16:34:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDFE0C36AED;
 Fri,  7 Jan 2022 16:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641573240;
 bh=soaLkV2PTYcc57ba0KLYk7Cu62Qw6D2b5TmoCuhgtXs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jrYvff1ZlayQFFYeDEvBtrlHxg/D+fELM8dItT+4vGREERVKxhvBavl5w+xXiwv8L
 TUZXYTBQGi8rsVNBuyAZAYoiosF7v1v6nzh/vvgXmO8aI/3aSnHZKgKZLTNJzsrhU2
 I1wdErQHTEQTpavOUmZlY2vNDGX0iLvV2PTzWF30PEC5RKEeYuxf+d3LfxaFZhiwmt
 yVJ0RjNomtv/Id/X253een1RtvDwgdFKaGMROJAPfpd9i4A0sz+GZ7HxGnab6QIejt
 uiWz0LnNqoGSYzUX/v5+/VvaXc++lV9O1a1B/9+prCT/5g6llFrZYPSaU2WJxz5WKd
 wMXTs6XYs04DA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=hot-poop.lan)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1n5sBj-00GbiJ-0c; Fri, 07 Jan 2022 16:33:59 +0000
From: Marc Zyngier <maz@kernel.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/6] hw/arm/virt: Disable highmem devices that don't fit in
 the PA range
Date: Fri,  7 Jan 2022 16:33:23 +0000
Message-Id: <20220107163324.2491209-6-maz@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220107163324.2491209-1-maz@kernel.org>
References: <20220107163324.2491209-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: qemu-devel@nongnu.org, kvmarm@lists.cs.columbia.edu,
 kvm@vger.kernel.org, kernel-team@android.com, drjones@redhat.com,
 eric.auger@redhat.com, peter.maydell@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2604:1380:4601:e00::1
 (failed)
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=maz@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to only keep the highmem devices that actually fit in
the PA range, check their location against the range and update
highest_gpa if they fit. If they don't, mark them them as disabled.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 hw/arm/virt.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index db4b0636e1..70b4773b3e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1711,21 +1711,43 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
         base = vms->memmap[VIRT_MEM].base + LEGACY_RAMLIMIT_BYTES;
     }
 
+    /* We know for sure that at least the memory fits in the PA space */
+    vms->highest_gpa = memtop - 1;
+
     for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
         hwaddr size = extended_memmap[i].size;
+        bool fits;
 
         base = ROUND_UP(base, size);
         vms->memmap[i].base = base;
         vms->memmap[i].size = size;
+
+        /*
+         * Check each device to see if they fit in the PA space,
+         * moving highest_gpa as we go.
+         *
+         * For each device that doesn't fit, disable it.
+         */
+        fits = (base + size) <= BIT_ULL(pa_bits);
+        if (fits) {
+            vms->highest_gpa = MAX(vms->highest_gpa, base + size - 1);
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
         base += size;
     }
 
-    /*
-     * If base fits within pa_bits, all good. If it doesn't, limit it
-     * to the end of RAM, which is guaranteed to fit within pa_bits.
-     */
-    vms->highest_gpa = (base <= BIT_ULL(pa_bits) ? base : memtop) - 1;
-
     if (device_memory_size > 0) {
         ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
         ms->device_memory->base = device_memory_base;
-- 
2.30.2


