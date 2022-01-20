Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E2F49540E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 19:21:04 +0100 (CET)
Received: from localhost ([::1]:36332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAc3T-0005qv-I1
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 13:21:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgW-0004Fx-3Y
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:00 -0500
Received: from [2a00:1450:4864:20::330] (port=33655
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgT-0003HG-4k
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:59 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 o7-20020a05600c510700b00347e10f66d1so6894577wms.0
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5PKQSeqoRJsuK90AwfWS8hGUDi/rqbMy6xzXLyNLsJE=;
 b=IytMBOni8YuA9U6Y2Y/T9/yvHAL+DrVfLQsUwo0F/OjIbILTabrOotQT9s9zy5RTt0
 GeQWn26Bpuc5eD8uWYgnKHVw0ibvpLi6r93hfrSMvqIdchu3mhHSBJAViWwxoLrb+pvc
 c+U4taz5nICoscLY/tVLfcHgJn+N3yIc3lVX/6itXGM863B521AZ01i3Zqh2sTylvMwf
 jlaV4o0JvEbJHerOksrk2v5vm7wHTdCfPmoxigXjWb7fJYxx36Vutx0rZUewki9vg64q
 BdPUiHPkZczXNijVAtfa0S2i9zWV0CizaG+RNXnFsfjtrJWLMW+q0xhw9r113JybwvT9
 ScNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5PKQSeqoRJsuK90AwfWS8hGUDi/rqbMy6xzXLyNLsJE=;
 b=gVDthPkzrR1b8HPNuh2hnC9tAZ3XI4fYaH/Hb0Nur2AuPE8A8Uv+Z3wENr1CVxvKXa
 tK5LmmyBUJ590nqyNaJGB2weHf3AKwAFrFDSPAoxO3VObmmKt+zY/75ab6yVsICSRqQU
 u+W/C/8P0o0C7dq/+hy3CZFDME4M69y8Qcc8217VCnr23RQz5/EE+jpIjDo0/XYSrpu1
 YTf9U0gCYmdIe3WGiuNiJWxnN6HqOCdLR9xQKxhbTGipeqIcYkHDAxeOqCgTClHryYyk
 KSWCfkZTWDyE0Dvs+CA8qJLRP3t8z/br0hLpF9toVZRfBCk6VxLR/rGQw3nsu7xWLSI7
 8mxA==
X-Gm-Message-State: AOAM530YNDS5C+Jd/jMC3JMtm0s3SFaT71oKTYNl+juNc15q7q4BWubL
 RmskaQLyfjxqV/VN9bqX8GulHTPZrGgcWw==
X-Google-Smtp-Source: ABdhPJw/Lg+nNJDCrlT3WTUEhO/Hya1jilLJHyjJeONdUI+mcuMarJSaboQRbl9aKSKRPgBYPg9CUw==
X-Received: by 2002:a5d:4944:: with SMTP id r4mr5957662wrs.550.1642682215509; 
 Thu, 20 Jan 2022 04:36:55 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.36.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:36:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/38] hw/arm/virt: Use the PA range to compute the memory map
Date: Thu, 20 Jan 2022 12:36:11 +0000
Message-Id: <20220120123630.267975-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Marc Zyngier <maz@kernel.org>

The highmem attribute is nothing but another way to express the
PA range of a VM. To support HW that has a smaller PA range then
what QEMU assumes, pass this PA range to the virt_set_memmap()
function, allowing it to correctly exclude highmem devices
if they are outside of the PA range.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20220114140741.1358263-5-maz@kernel.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 64 +++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 12 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3b839ba78ba..8627f5ab953 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1667,7 +1667,7 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
     return arm_cpu_mp_affinity(idx, clustersz);
 }
 
-static void virt_set_memmap(VirtMachineState *vms)
+static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
 {
     MachineState *ms = MACHINE(vms);
     hwaddr base, device_memory_base, device_memory_size, memtop;
@@ -1685,6 +1685,14 @@ static void virt_set_memmap(VirtMachineState *vms)
         exit(EXIT_FAILURE);
     }
 
+    /*
+     * !highmem is exactly the same as limiting the PA space to 32bit,
+     * irrespective of the underlying capabilities of the HW.
+     */
+    if (!vms->highmem) {
+        pa_bits = 32;
+    }
+
     /*
      * We compute the base of the high IO region depending on the
      * amount of initial and device memory. The device memory start/size
@@ -1698,8 +1706,9 @@ static void virt_set_memmap(VirtMachineState *vms)
 
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
@@ -1718,7 +1727,13 @@ static void virt_set_memmap(VirtMachineState *vms)
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
@@ -1909,12 +1924,43 @@ static void machvirt_init(MachineState *machine)
     unsigned int smp_cpus = machine->smp.cpus;
     unsigned int max_cpus = machine->smp.max_cpus;
 
+    if (!cpu_type_valid(machine->cpu_type)) {
+        error_report("mach-virt: CPU type %s not supported", machine->cpu_type);
+        exit(1);
+    }
+
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
@@ -1922,11 +1968,6 @@ static void machvirt_init(MachineState *machine)
      */
     finalize_gic_version(vms);
 
-    if (!cpu_type_valid(machine->cpu_type)) {
-        error_report("mach-virt: CPU type %s not supported", machine->cpu_type);
-        exit(1);
-    }
-
     if (vms->secure) {
         /*
          * The Secure view of the world is the same as the NonSecure,
@@ -1996,7 +2037,6 @@ static void machvirt_init(MachineState *machine)
 
     create_fdt(vms);
 
-    possible_cpus = mc->possible_cpu_arch_ids(machine);
     assert(possible_cpus->len == max_cpus);
     for (n = 0; n < possible_cpus->len; n++) {
         Object *cpuobj;
@@ -2735,7 +2775,7 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
     max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa);
 
     /* we freeze the memory map to compute the highest gpa */
-    virt_set_memmap(vms);
+    virt_set_memmap(vms, max_vm_pa_size);
 
     requested_pa_size = 64 - clz64(vms->highest_gpa);
 
-- 
2.25.1


