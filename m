Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F87487A88
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 17:38:55 +0100 (CET)
Received: from localhost ([::1]:44982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5sGU-0000jr-Bi
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 11:38:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1n5sBz-0006Ia-LJ
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 11:34:20 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:55512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1n5sBn-0006cj-L2
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 11:34:12 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4E2DF61F13;
 Fri,  7 Jan 2022 16:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B745CC36AF2;
 Fri,  7 Jan 2022 16:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641573240;
 bh=HWE9/B+wF4b607CUdPFIfJT6IFMZsln6c3BwaclkZ5I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ttSpDQEAHLh0A2FISQerOllZPsWP1i08wZFml1iEJqVm92n4Mqut5d5IlHeo6cpv8
 TnXvltcvMcONgCqooq5KaLo3qRcWo9YVCWmW1RMfNn6eqmzGu95ubkpaWbuD82eiAh
 EzD18tZctYpXdfc9/nfB68zHoYrDje3GmnKzMMI8b3k1waczi2EcQJVzHji3PqXyml
 U/zzJnGF8AqzFwzOTbiplcAhmcgyKrlPQ5H1baRyCmHu5yL3loCuiVrHvMmAyDzDDX
 3rd3U9XBWC7kDTBqZOFjY3+9sHwyxjRb6U6+ayJlo0c4+pZnm0xqx0Q/9gQDZZEaxf
 2+vb1xIdNEYDA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=hot-poop.lan)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1n5sBi-00GbiJ-R5; Fri, 07 Jan 2022 16:33:58 +0000
From: Marc Zyngier <maz@kernel.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/6] hw/arm/virt: Use the PA range to compute the memory map
Date: Fri,  7 Jan 2022 16:33:22 +0000
Message-Id: <20220107163324.2491209-5-maz@kernel.org>
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
Received-SPF: pass client-ip=139.178.84.217; envelope-from=maz@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The highmem attribute is nothing but another way to express the
PA range of a VM. To support HW that has a smaller PA range then
what QEMU assumes, pass this PA range to the virt_set_memmap()
function, allowing it to correctly exclude highmem devices
if they are outside of the PA range.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 hw/arm/virt.c | 53 ++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 57c55e8a37..db4b0636e1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1660,7 +1660,7 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
     return arm_cpu_mp_affinity(idx, clustersz);
 }
 
-static void virt_set_memmap(VirtMachineState *vms)
+static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
 {
     MachineState *ms = MACHINE(vms);
     hwaddr base, device_memory_base, device_memory_size, memtop;
@@ -1678,6 +1678,13 @@ static void virt_set_memmap(VirtMachineState *vms)
         exit(EXIT_FAILURE);
     }
 
+    /*
+     * !highmem is exactly the same as limiting the PA space to 32bit,
+     * irrespective of the underlying capabilities of the HW.
+     */
+    if (!vms->highmem)
+	    pa_bits = 32;
+
     /*
      * We compute the base of the high IO region depending on the
      * amount of initial and device memory. The device memory start/size
@@ -1691,8 +1698,9 @@ static void virt_set_memmap(VirtMachineState *vms)
 
     /* Base address of the high IO region */
     memtop = base = device_memory_base + ROUND_UP(device_memory_size, GiB);
-    if (!vms->highmem && memtop > 4 * GiB) {
-        error_report("highmem=off, but memory crosses the 4GiB limit\n");
+    if (memtop > BIT_ULL(pa_bits)) {
+	    error_report("Addressing limited to %d bits, but memory exceeds it by %llu bytes\n",
+			 pa_bits, memtop - BIT_ULL(pa_bits));
         exit(EXIT_FAILURE);
     }
     if (base < device_memory_base) {
@@ -1711,7 +1719,13 @@ static void virt_set_memmap(VirtMachineState *vms)
         vms->memmap[i].size = size;
         base += size;
     }
-    vms->highest_gpa = (vms->highmem ? base : memtop) - 1;
+
+    /*
+     * If base fits within pa_bits, all good. If it doesn't, limit it
+     * to the end of RAM, which is guaranteed to fit within pa_bits.
+     */
+    vms->highest_gpa = (base <= BIT_ULL(pa_bits) ? base : memtop) - 1;
+
     if (device_memory_size > 0) {
         ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
         ms->device_memory->base = device_memory_base;
@@ -1902,12 +1916,38 @@ static void machvirt_init(MachineState *machine)
     unsigned int smp_cpus = machine->smp.cpus;
     unsigned int max_cpus = machine->smp.max_cpus;
 
+    possible_cpus = mc->possible_cpu_arch_ids(machine);
+
     /*
      * In accelerated mode, the memory map is computed earlier in kvm_type()
      * to create a VM with the right number of IPA bits.
      */
     if (!vms->memmap) {
-        virt_set_memmap(vms);
+        Object *cpuobj;
+        ARMCPU *armcpu;
+        int pa_bits;
+
+        /*
+         * Instanciate a temporary CPU object to find out about what
+         * we are about to deal with. Once this is done, get rid of
+         * the object.
+         */
+        cpuobj = object_new(possible_cpus->cpus[0].type);
+        armcpu = ARM_CPU(cpuobj);
+
+        if (object_property_get_bool(cpuobj, "aarch64", NULL)) {
+            pa_bits = arm_pamax(armcpu);
+        } else if (arm_feature(&armcpu->env, ARM_FEATURE_LPAE)) {
+            /* v7 with LPAE */
+            pa_bits = 40;
+        } else {
+            /* Anything else */
+            pa_bits = 32;
+        }
+
+        object_unref(cpuobj);
+
+        virt_set_memmap(vms, pa_bits);
     }
 
     /* We can probe only here because during property set
@@ -1989,7 +2029,6 @@ static void machvirt_init(MachineState *machine)
 
     create_fdt(vms);
 
-    possible_cpus = mc->possible_cpu_arch_ids(machine);
     assert(possible_cpus->len == max_cpus);
     for (n = 0; n < possible_cpus->len; n++) {
         Object *cpuobj;
@@ -2646,7 +2685,7 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
     max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa);
 
     /* we freeze the memory map to compute the highest gpa */
-    virt_set_memmap(vms);
+    virt_set_memmap(vms, max_vm_pa_size);
 
     requested_pa_size = 64 - clz64(vms->highest_gpa);
 
-- 
2.30.2


