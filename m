Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E04EB6099AD
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 07:15:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omoXu-0008Bo-SG; Sun, 23 Oct 2022 23:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1omoXs-00089z-Sw
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 23:54:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1omoXr-0000fr-Fk
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 23:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666583674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J1StH2dMBzUeyRMEsgfoJeHQ/K4Oy05VZ1BcH9DQeqI=;
 b=HX3rHPLinRpfIgtLme71nWLVgekgn6RL1qJCoDTjOfvr9ieu66rejds8StJeVU8HPz0Mce
 vCF1MwirjScrP/rGKzRutrX8iGjGhwpLhXUvIFp9QqW7KWaXCwxWEKGxw9B/IzmFBtRZUg
 Yrhxr5j6qWsUCoXN2bHDnHKIyorAvzU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163--TV7x0WtNni4YESCe9IrvQ-1; Sun, 23 Oct 2022 23:54:31 -0400
X-MC-Unique: -TV7x0WtNni4YESCe9IrvQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D542B299E750;
 Mon, 24 Oct 2022 03:54:30 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-29.bne.redhat.com [10.64.54.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F0F440C6F75;
 Mon, 24 Oct 2022 03:54:27 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v6 1/7] hw/arm/virt: Introduce virt_set_high_memmap() helper
Date: Mon, 24 Oct 2022 11:54:10 +0800
Message-Id: <20221024035416.34068-2-gshan@redhat.com>
In-Reply-To: <20221024035416.34068-1-gshan@redhat.com>
References: <20221024035416.34068-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This introduces virt_set_high_memmap() helper. The logic of high
memory region address assignment is moved to the helper. The intention
is to make the subsequent optimization for high memory region address
assignment easier.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
---
 hw/arm/virt.c | 74 ++++++++++++++++++++++++++++-----------------------
 1 file changed, 41 insertions(+), 33 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index cda9defe8f..7572c44bda 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1689,6 +1689,46 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
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
@@ -1744,39 +1784,7 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
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
2.23.0


