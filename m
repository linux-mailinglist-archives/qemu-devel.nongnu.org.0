Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C86F3587672
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 06:49:42 +0200 (CEST)
Received: from localhost ([::1]:34978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIjqf-0004pF-TE
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 00:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oIjo8-0008C7-Nd
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 00:47:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oIjo5-0004WI-Fq
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 00:47:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659415621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fyr89UPFJ2icMpRdGHU+/6Vbe4UOerIOwE1Jhy475s0=;
 b=b6zIq90Z+Zm0x2DSRTOipHfy/WWrd5f46tBrtZbyl/wnR0rb8XHacnHa0upv++fSq3oGrP
 OthF+BzsPJPDM8ZtocnsyR93osdNcNGexevA79zuhInqO9JogBRNjG0ib4uqLJ+hV/3MBc
 J+88R0aUz9gjlwO0oPy0TBTe/w+ezy8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-AC9dNuXeO-idZDuM0QqtuQ-1; Tue, 02 Aug 2022 00:45:42 -0400
X-MC-Unique: AC9dNuXeO-idZDuM0QqtuQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 338DA802D2C;
 Tue,  2 Aug 2022 04:45:42 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-18.bne.redhat.com [10.64.54.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 125D7492C3B;
 Tue,  2 Aug 2022 04:45:38 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, eric.auger@redhat.com, cohuck@redhat.com,
 zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH 1/2] hw/arm/virt: Improve address assignment for highmem IO
 regions
Date: Tue,  2 Aug 2022 14:45:28 +0800
Message-Id: <20220802064529.547361-2-gshan@redhat.com>
In-Reply-To: <20220802064529.547361-1-gshan@redhat.com>
References: <20220802064529.547361-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

There are 3 highmem IO regions as below. They can be disabled in
two situations: (a) The specific region is disabled by user. (b)
The specific region doesn't fit in the PA space. However, the base
address and highest_gpa are still updated no matter if the region
is enabled or disabled. It's incorrectly incurring waste in the PA
space.

Improve address assignment for highmem IO regions to avoid the waste
in the PA space by putting the logic into virt_memmap_fits().

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 54 +++++++++++++++++++++++++++++----------------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9633f822f3..bc0cd218f9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1688,6 +1688,34 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
     return arm_cpu_mp_affinity(idx, clustersz);
 }
 
+static void virt_memmap_fits(VirtMachineState *vms, int index,
+                             bool *enabled, hwaddr *base, int pa_bits)
+{
+    hwaddr size = extended_memmap[index].size;
+
+    /* The region will be disabled if its size isn't given */
+    if (!*enabled || !size) {
+        *enabled = false;
+        vms->memmap[index].base = 0;
+        vms->memmap[index].size = 0;
+        return;
+    }
+
+    /*
+     * Check if the memory region fits in the PA space. The memory map
+     * and highest_gpa are updated if it fits. Otherwise, it's disabled.
+     */
+    *enabled = (ROUND_UP(*base, size) + size <= BIT_ULL(pa_bits));
+    if (*enabled) {
+        *base = ROUND_UP(*base, size);
+        vms->memmap[index].base = *base;
+        vms->memmap[index].size = size;
+        vms->highest_gpa = *base + size - 1;
+
+	*base = *base + size;
+    }
+}
+
 static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
 {
     MachineState *ms = MACHINE(vms);
@@ -1744,37 +1772,17 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
     vms->highest_gpa = memtop - 1;
 
     for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
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
         switch (i) {
         case VIRT_HIGH_GIC_REDIST2:
-            vms->highmem_redists &= fits;
+            virt_memmap_fits(vms, i, &vms->highmem_redists, &base, pa_bits);
             break;
         case VIRT_HIGH_PCIE_ECAM:
-            vms->highmem_ecam &= fits;
+            virt_memmap_fits(vms, i, &vms->highmem_ecam, &base, pa_bits);
             break;
         case VIRT_HIGH_PCIE_MMIO:
-            vms->highmem_mmio &= fits;
+            virt_memmap_fits(vms, i, &vms->highmem_mmio, &base, pa_bits);
             break;
         }
-
-        base += size;
     }
 
     if (device_memory_size > 0) {
-- 
2.23.0


