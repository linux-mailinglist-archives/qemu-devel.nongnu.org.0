Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BFD67E940
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 16:17:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLQSe-0006R6-Pu; Fri, 27 Jan 2023 10:16:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSR-0006JO-SQ
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:06 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSP-0007hh-Sj
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:03 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so3723356wms.2
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 07:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ig1TzNIoOeWwabviwLp2kbnIks9AjR0QHEy5oTBBhzE=;
 b=duGreVUwmGMLyACjwtvql9tRnvLaGDyPFQRari0JfPBcB/PTcwqcE6gbMqGyCqHlNY
 4vJq2EEALX/NSCSE6xo0EqfC9PN1dHrEBGNk+V0pa4iqVFxPfCzH2c+YOWW+V+8PQuIM
 PK29YfykPJpEtgyDPFYJArTSExzod+itJosppfW3wxkVuihhEsKDerxGhaQNqb+dBSYu
 EgF1Cej416O+t+q0jq8vLOoHnX7NYgzoC3Wx9At8CrXmEpQAk8XX92uvEoGxVQromIMK
 0jWV5pGg7CdPJnWLTeNcT2QmCfEWECDyIVqmJOaT684dniER07E7JwkDERjbUqjDxUQ9
 oBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ig1TzNIoOeWwabviwLp2kbnIks9AjR0QHEy5oTBBhzE=;
 b=enPcvB7y+zzCxq57xNYqaEiwMGgqolE2S6bHqxZfOnEsSV0kDiBu+tk7hBX5bAbEFj
 or1O1FVgn2im5X9wU/EkFIwOGevvP38JqTzv3ivvoVFewZcDFR8jsHtVLDdPuE12xeiR
 7oCim/QLpkp2mT1y05RCwcr/mpo8fZdH7sO/1xX8ljHwtTHAYe+3wLzk5SVUg/A3iJao
 G7LFixMGtm7pXQu0q583BITnkhIdLB1KUOydtsCA+q3bRhHzGGWyRz0cQikmmfcZWBjz
 NBHzRuVflO4iB7QIi+3o/GLUJLkY5f4l4Yxf02BMHTdOz23BocshyX+cpibLP2gDpmcU
 vTrw==
X-Gm-Message-State: AFqh2ko+ABhuyNbnwqnblHLUVr/ZcoXxlN/lZovIzgP3zD4mKtm6154V
 UNRS7KqQWe0RYsiM3GhYcW3zbQ==
X-Google-Smtp-Source: AMrXdXt8f78UgKcTF9N9KCMRHAtfi7ZSn55Nu7H1ij/q8FwoMTkWwVD+HUjBumnBhVzI82MPKgWDQw==
X-Received: by 2002:a05:600c:3110:b0:3dc:e66:4cb9 with SMTP id
 g16-20020a05600c311000b003dc0e664cb9mr16051820wmo.13.1674832559281; 
 Fri, 27 Jan 2023 07:15:59 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 07:15:58 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org, richard.henderson@linaro.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 04/16] hw/arm/virt: Add support for Arm RME
Date: Fri, 27 Jan 2023 15:07:17 +0000
Message-Id: <20230127150727.612594-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When confidential-guest-support is enabled for the virt machine, call
the RME init function, and add the RME flag to the VM type.

* The Realm differentiates non-secure from realm memory using the upper
  GPA bit. Reserve that bit when creating the memory map, to make sure
  that device MMIO located in high memory can still fit.

* pvtime is disabled for the moment. Since the hypervisor has to write
  into the shared pvtime page before scheduling a vcpu, it seems
  incompatible with confidential guests.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 48 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b871350856..df613e634a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -210,6 +210,11 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("max"),
 };
 
+static bool virt_machine_is_confidential(VirtMachineState *vms)
+{
+    return MACHINE(vms)->cgs;
+}
+
 static bool cpu_type_valid(const char *cpu)
 {
     int i;
@@ -247,6 +252,14 @@ static void create_fdt(VirtMachineState *vms)
         exit(1);
     }
 
+    /*
+     * Since the devicetree is included in the initial measurement, it must
+     * not contain random data.
+     */
+    if (virt_machine_is_confidential(vms)) {
+        vms->dtb_randomness = false;
+    }
+
     ms->fdt = fdt;
 
     /* Header */
@@ -1924,6 +1937,15 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
     steal_time = object_property_get_bool(OBJECT(first_cpu),
                                           "kvm-steal-time", NULL);
 
+    if (virt_machine_is_confidential(vms)) {
+        /*
+         * The host cannot write into a confidential guest's memory until the
+         * guest shares it. Since the host writes the pvtime region before the
+         * guest gets a chance to set it up, disable pvtime.
+         */
+        steal_time = false;
+    }
+
     if (kvm_enabled()) {
         hwaddr pvtime_reg_base = vms->memmap[VIRT_PVTIME].base;
         hwaddr pvtime_reg_size = vms->memmap[VIRT_PVTIME].size;
@@ -2053,10 +2075,11 @@ static void machvirt_init(MachineState *machine)
      * if the guest has EL2 then we will use SMC as the conduit,
      * and otherwise we will use HVC (for backwards compatibility and
      * because if we're using KVM then we must use HVC).
+     * Realm guests must also use SMC.
      */
     if (vms->secure && firmware_loaded) {
         vms->psci_conduit = QEMU_PSCI_CONDUIT_DISABLED;
-    } else if (vms->virt) {
+    } else if (vms->virt || virt_machine_is_confidential(vms)) {
         vms->psci_conduit = QEMU_PSCI_CONDUIT_SMC;
     } else {
         vms->psci_conduit = QEMU_PSCI_CONDUIT_HVC;
@@ -2102,6 +2125,8 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
+    kvm_arm_rme_init(machine->cgs, &error_fatal);
+
     create_fdt(vms);
 
     assert(possible_cpus->len == max_cpus);
@@ -2854,15 +2879,26 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
 static int virt_kvm_type(MachineState *ms, const char *type_str)
 {
     VirtMachineState *vms = VIRT_MACHINE(ms);
+    int rme_vm_type = kvm_arm_rme_vm_type(ms);
     int max_vm_pa_size, requested_pa_size;
+    int rme_reserve_bit = 0;
     bool fixed_ipa;
 
-    max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa);
+    if (rme_vm_type) {
+        /*
+         * With RME, the upper GPA bit differentiates Realm from NS memory.
+         * Reserve the upper bit to guarantee that highmem devices will fit.
+         */
+        rme_reserve_bit = 1;
+    }
+
+    max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa) -
+                     rme_reserve_bit;
 
     /* we freeze the memory map to compute the highest gpa */
     virt_set_memmap(vms, max_vm_pa_size);
 
-    requested_pa_size = 64 - clz64(vms->highest_gpa);
+    requested_pa_size = 64 - clz64(vms->highest_gpa) + rme_reserve_bit;
 
     /*
      * KVM requires the IPA size to be at least 32 bits.
@@ -2883,7 +2919,11 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
      * the implicit legacy 40b IPA setting, in which case the kvm_type
      * must be 0.
      */
-    return fixed_ipa ? 0 : requested_pa_size;
+    if (fixed_ipa) {
+        return 0;
+    }
+
+    return requested_pa_size | rme_vm_type;
 }
 
 static void virt_machine_class_init(ObjectClass *oc, void *data)
-- 
2.39.0


