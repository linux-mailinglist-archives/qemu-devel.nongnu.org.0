Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B235F3ABE
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 02:39:26 +0200 (CEST)
Received: from localhost ([::1]:43168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofVy0-0003if-V5
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 20:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ofVlu-0007uQ-Hq
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 20:26:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ofVls-0004uY-JL
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 20:26:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664843212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g9OVHLht1sJiIpjMrBxyf/vibyZGmXv0kUqwcs4vbDo=;
 b=hPoZefuI+ioj6pLJxr4ix+HeNhns81k/Ctp8l5JdxsPFpgVPnW6AqzwQW3xGx8nkT6ju7e
 PmNIKRJ53Itw+JM++/pKg227dAn8qK1MvvGde1gn64ctcoCpiv0Tfq6kVB8H7rLTmsV2ie
 CLIWTCwIjv9uGaZ/Hg86Zva4gb1zy5U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-30PZtRZXNFeBV-MyObZVPw-1; Mon, 03 Oct 2022 20:26:50 -0400
X-MC-Unique: 30PZtRZXNFeBV-MyObZVPw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FA3D29ABA2B;
 Tue,  4 Oct 2022 00:26:50 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-56.bne.redhat.com [10.64.54.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5A8C40C206B;
 Tue,  4 Oct 2022 00:26:46 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v4 4/6] hw/arm/virt: Introduce virt_get_high_memmap_enabled()
 helper
Date: Tue,  4 Oct 2022 08:26:25 +0800
Message-Id: <20221004002627.59172-5-gshan@redhat.com>
In-Reply-To: <20221004002627.59172-1-gshan@redhat.com>
References: <20221004002627.59172-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This introduces virt_get_high_memmap_enabled() helper, which returns
the pointer to vms->highmem_{redists, ecam, mmio}. The pointer will
be used in the subsequent patches.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b0b679d1f4..59de7b78b5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1689,14 +1689,29 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
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
 
@@ -1714,18 +1729,7 @@ static void virt_set_high_memmap(VirtMachineState *vms,
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
2.23.0


