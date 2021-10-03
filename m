Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA054202FA
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 18:49:45 +0200 (CEST)
Received: from localhost ([::1]:58876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX4gJ-0004vs-V6
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 12:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1mX4d5-0000oL-Ae
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 12:46:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:55670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1mX4cy-00024l-D4
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 12:46:22 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A21C61AF9;
 Sun,  3 Oct 2021 16:46:12 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=hot-poop.lan)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1mX4cs-00EUhe-E0; Sun, 03 Oct 2021 17:46:10 +0100
From: Marc Zyngier <maz@kernel.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] hw/arm/virt: Use the PA range to compute the memory map
Date: Sun,  3 Oct 2021 17:46:04 +0100
Message-Id: <20211003164605.3116450-5-maz@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211003164605.3116450-1-maz@kernel.org>
References: <20211003164605.3116450-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: qemu-devel@nongnu.org, drjones@redhat.com,
 eric.auger@redhat.com, peter.maydell@linaro.org, kvmarm@lists.cs.columbia.edu,
 kvm@vger.kernel.org, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=198.145.29.99; envelope-from=maz@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

The highmem attribute is nothing but another way to express the
PA range of a VM. To support HW that has a smaller PA range then
what QEMU assumes, pass this PA range to the virt_set_memmap()
function, allowing it to correctly exclude highmem devices
if they are outside of the PA range.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 hw/arm/virt.c | 46 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 35 insertions(+), 11 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9d2abdbd5f..a572e0c9d9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1610,10 +1610,10 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
     return arm_cpu_mp_affinity(idx, clustersz);
 }
 
-static void virt_set_memmap(VirtMachineState *vms)
+static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
 {
     MachineState *ms = MACHINE(vms);
-    hwaddr base, device_memory_base, device_memory_size;
+    hwaddr base, device_memory_base, device_memory_size, memtop;
     int i;
 
     vms->memmap = extended_memmap;
@@ -1628,9 +1628,12 @@ static void virt_set_memmap(VirtMachineState *vms)
         exit(EXIT_FAILURE);
     }
 
-    if (!vms->highmem &&
-        vms->memmap[VIRT_MEM].base + ms->maxram_size > 4 * GiB) {
-        error_report("highmem=off, but memory crosses the 4GiB limit\n");
+    if (!vms->highmem)
+	    pa_bits = 32;
+
+    if (vms->memmap[VIRT_MEM].base + ms->maxram_size > BIT_ULL(pa_bits)) {
+	    error_report("Addressing limited to %d bits, but memory exceeds it by %llu bytes\n",
+			 pa_bits, vms->memmap[VIRT_MEM].base + ms->maxram_size - BIT_ULL(pa_bits));
         exit(EXIT_FAILURE);
     }
     /*
@@ -1645,7 +1648,7 @@ static void virt_set_memmap(VirtMachineState *vms)
     device_memory_size = ms->maxram_size - ms->ram_size + ms->ram_slots * GiB;
 
     /* Base address of the high IO region */
-    base = device_memory_base + ROUND_UP(device_memory_size, GiB);
+    memtop = base = device_memory_base + ROUND_UP(device_memory_size, GiB);
     if (base < device_memory_base) {
         error_report("maxmem/slots too huge");
         exit(EXIT_FAILURE);
@@ -1662,9 +1665,17 @@ static void virt_set_memmap(VirtMachineState *vms)
         vms->memmap[i].size = size;
         base += size;
     }
-    vms->highest_gpa = (vms->highmem ?
-                        base :
-                        vms->memmap[VIRT_MEM].base + ms->maxram_size) - 1;
+
+    /*
+     * If base fits within pa_bits, all good. If it doesn't, limit it
+     * to the end of RAM, which is guaranteed to fit within pa_bits.
+     */
+    if (base <= BIT_ULL(pa_bits)) {
+        vms->highest_gpa = base -1;
+    } else {
+        vms->highest_gpa = memtop - 1;
+    }
+
     if (device_memory_size > 0) {
         ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
         ms->device_memory->base = device_memory_base;
@@ -1860,7 +1871,20 @@ static void machvirt_init(MachineState *machine)
      * to create a VM with the right number of IPA bits.
      */
     if (!vms->memmap) {
-        virt_set_memmap(vms);
+        ARMCPU *armcpu = ARM_CPU(first_cpu);
+        int pa_bits;
+
+        if (object_property_get_bool(OBJECT(first_cpu), "aarch64", NULL)) {
+            pa_bits = arm_pamax(armcpu);
+        } else if (arm_feature(&armcpu->env, ARM_FEATURE_LPAE)) {
+            /* v7 with LPAE */
+            pa_bits = 40;
+        } else {
+            /* Anything else */
+            pa_bits = 32;
+        }
+
+        virt_set_memmap(vms, pa_bits);
     }
 
     /* We can probe only here because during property set
@@ -2596,7 +2620,7 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
     max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa);
 
     /* we freeze the memory map to compute the highest gpa */
-    virt_set_memmap(vms);
+    virt_set_memmap(vms, max_vm_pa_size);
 
     requested_pa_size = 64 - clz64(vms->highest_gpa);
 
-- 
2.30.2


