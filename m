Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B295E56B1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 01:19:56 +0200 (CEST)
Received: from localhost ([::1]:41942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob90V-0006CN-Qa
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 19:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ob8v4-000065-KX
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 19:14:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ob8v3-0001sr-25
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 19:14:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663802056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sv6gjcFNmp354tzRnNVqsmaz0Eb5IUn+dcydFYKMH/o=;
 b=OiUR7kNIdlOMOoKtkfmbL/YW3lhP10/qUz4x8BkYjZjklLjtDd6ajTBYjNn143dTkYKW1B
 nVcY6k84s9WY2ubD+4gOIGwzj5YnH9zq24SHgKl5rUFow+cM/wD7PrToLc+rNcAAgmWxS1
 t9Kg6XFQk4ug23Yaw3BGSCChCm+XFo4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-t76h502BNOOuknaDTC2yZg-1; Wed, 21 Sep 2022 19:14:13 -0400
X-MC-Unique: t76h502BNOOuknaDTC2yZg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD9DE3C0D197;
 Wed, 21 Sep 2022 23:14:12 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-126.bne.redhat.com [10.64.54.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 392982166B26;
 Wed, 21 Sep 2022 23:14:08 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v3 4/5] hw/arm/virt: Improve high memory region address
 assignment
Date: Thu, 22 Sep 2022 07:13:48 +0800
Message-Id: <20220921231349.274049-5-gshan@redhat.com>
In-Reply-To: <20220921231349.274049-1-gshan@redhat.com>
References: <20220921231349.274049-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
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

There are three high memory regions, which are VIRT_HIGH_REDIST2,
VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
are floating on highest RAM address. However, they can be disabled
in several cases.

(1) One specific high memory region is disabled by developer by
    toggling vms->highmem_{redists, ecam, mmio}.

(2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
    'virt-2.12' or ealier than it.

(3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
    on 32-bits system.

(4) One specific high memory region is disabled when it breaks the
    PA space limit.

The current implementation of virt_set_memmap() isn't comprehensive
because the space for one specific high memory region is always
reserved from the PA space for case (1), (2) and (3). In the code,
'base' and 'vms->highest_gpa' are always increased for those three
cases. It's unnecessary since the assigned space of the disabled
high memory region won't be used afterwards.

This improves the address assignment for those three high memory
region by skipping the address assignment for one specific high
memory region if it has been disabled in case (1), (2) and (3).

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 44 ++++++++++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b0b679d1f4..b702f8f2b5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1693,15 +1693,31 @@ static void virt_set_high_memmap(VirtMachineState *vms,
                                  hwaddr base, int pa_bits)
 {
     hwaddr region_base, region_size;
-    bool fits;
+    bool *region_enabled, fits;
     int i;
 
     for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
         region_base = ROUND_UP(base, extended_memmap[i].size);
         region_size = extended_memmap[i].size;
 
-        vms->memmap[i].base = region_base;
-        vms->memmap[i].size = region_size;
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
+        /* Skip unknown region */
+        if (!region_enabled) {
+            continue;
+        }
 
         /*
          * Check each device to see if they fit in the PA space,
@@ -1710,23 +1726,15 @@ static void virt_set_high_memmap(VirtMachineState *vms,
          * For each device that doesn't fit, disable it.
          */
         fits = (region_base + region_size) <= BIT_ULL(pa_bits);
-        if (fits) {
-            vms->highest_gpa = region_base + region_size - 1;
-        }
+        if (*region_enabled && fits) {
+            vms->memmap[i].base = region_base;
+            vms->memmap[i].size = region_size;
 
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
+            vms->highest_gpa = region_base + region_size - 1;
+            base = region_base + region_size;
+        } else {
+            *region_enabled = false;
         }
-
-        base = region_base + region_size;
     }
 }
 
-- 
2.23.0


