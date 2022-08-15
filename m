Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7075929DB
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 08:51:35 +0200 (CEST)
Received: from localhost ([::1]:45376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNTwj-0003g6-6O
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 02:51:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oNTce-0000u1-BW
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 02:30:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oNTcb-0000Y9-8j
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 02:30:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660545042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CyHYMsEVB3lzAtT6LR6ywQx4IJdNEwgjMYYAM4Z1Cxg=;
 b=hpAzMS/fA+x5J5x3jgyIomNrQWSAhfLYZxS/AxpVVB1iJXcenPY5Ir1zQZWG9lmZ/dskcs
 5quF3uo2tHmDMZwvSQ5bDVWEXWDG1bVt4O/xGDLoAfT+vwKCfqSlSalXc+4bc8TByB6r36
 9wznxfd3ToCpO51i6Xo0MudP4p0Rwsg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-y6miWDE-P-u-SL4PGU4Law-1; Mon, 15 Aug 2022 02:30:36 -0400
X-MC-Unique: y6miWDE-P-u-SL4PGU4Law-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E94A11C0515A;
 Mon, 15 Aug 2022 06:30:35 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-77.bne.redhat.com [10.64.54.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45BE62026D64;
 Mon, 15 Aug 2022 06:30:31 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v2 4/4] virt/hw/virt: Add virt_set_high_memmap() helper
Date: Mon, 15 Aug 2022 14:29:58 +0800
Message-Id: <20220815062958.100366-5-gshan@redhat.com>
In-Reply-To: <20220815062958.100366-1-gshan@redhat.com>
References: <20220815062958.100366-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The logic to assign high memory region's address in virt_set_memmap()
is independent. Lets move the logic to virt_set_high_memmap() helper.
"each device" is replaced by "each region" in the comments.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 92 ++++++++++++++++++++++++++++-----------------------
 1 file changed, 50 insertions(+), 42 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e38b6919c9..4dde08a924 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1688,6 +1688,55 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
     return arm_cpu_mp_affinity(idx, clustersz);
 }
 
+static void virt_set_high_memmap(VirtMachineState *vms,
+                                 hwaddr base, int pa_bits)
+{
+    hwaddr region_base, region_size;
+    bool *region_enabled, fits;
+    int i;
+
+    for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
+        region_base = ROUND_UP(base, extended_memmap[i].size);
+        region_size = extended_memmap[i].size;
+
+        switch (i) {
+        case VIRT_HIGH_GIC_REDIST2:
+            region_enabled = &vms->highmem_redists;
+            break;
+        case VIRT_HIGH_PCIE_ECAM:
+            region_enabled = &vms->highmem_ecam;
+            break;
+        case VIRT_HIGH_PCIE_MMIO:
+            region_enabled = &vms->highmem_mmio;
+            break;
+        default:
+            region_enabled = NULL;
+        }
+
+        /* Skip unknwon or disabled regions */
+        if (!region_enabled || !*region_enabled) {
+            continue;
+        }
+
+        /*
+         * Check each region to see if they fit in the PA space,
+         * moving highest_gpa as we go.
+         *
+         * For each device that doesn't fit, disable it.
+         */
+        fits = (region_base + region_size) <= BIT_ULL(pa_bits);
+        if (fits) {
+            vms->memmap[i].base = region_base;
+            vms->memmap[i].size = region_size;
+
+            base = region_base + region_size;
+            vms->highest_gpa = region_base + region_size - 1;
+        } else {
+            *region_enabled = false;
+        }
+    }
+}
+
 static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
 {
     MachineState *ms = MACHINE(vms);
@@ -1742,48 +1791,7 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
 
     /* We know for sure that at least the memory fits in the PA space */
     vms->highest_gpa = memtop - 1;
-
-    for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
-        hwaddr region_base = ROUND_UP(base, extended_memmap[i].size);
-        hwaddr region_size = extended_memmap[i].size;
-        bool *region_enabled, fits;
-
-        switch (i) {
-        case VIRT_HIGH_GIC_REDIST2:
-            region_enabled = &vms->highmem_redists;
-            break;
-        case VIRT_HIGH_PCIE_ECAM:
-            region_enabled = &vms->highmem_ecam;
-            break;
-        case VIRT_HIGH_PCIE_MMIO:
-            region_enabled = &vms->highmem_mmio;
-            break;
-        default:
-            region_enabled = NULL;
-        }
-
-        /* Skip unknwon or disabled regions */
-        if (!region_enabled || !*region_enabled) {
-            continue;
-        }
-
-        /*
-         * Check each device to see if they fit in the PA space,
-         * moving highest_gpa as we go.
-         *
-         * For each device that doesn't fit, disable it.
-         */
-        fits = (region_base + region_size) <= BIT_ULL(pa_bits);
-        if (fits) {
-            vms->memmap[i].base = region_base;
-            vms->memmap[i].size = region_size;
-
-            base = region_base + region_size;
-            vms->highest_gpa = region_base + region_size - 1;
-        } else {
-            *region_enabled = false;
-        }
-    }
+    virt_set_high_memmap(vms, base, pa_bits);
 
     if (device_memory_size > 0) {
         ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
-- 
2.23.0


