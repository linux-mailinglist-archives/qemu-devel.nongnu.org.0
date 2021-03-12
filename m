Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D502338F97
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:14:58 +0100 (CET)
Received: from localhost ([::1]:52692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiZ7-0008Ew-1w
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:14:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiDB-00033V-Ee
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:17 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:54170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCw-00020q-6X
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:17 -0500
Received: by mail-wm1-x32a.google.com with SMTP id g20so3853920wmk.3
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Qnj9C1grBGebcbm12YaOL2UAKDriSYlm+VG7jn+fBOc=;
 b=zRTEuuPzXhLHeCmDG3+2alur+aljED0xP5GxU+As7MkQrdJpeC4lWodYkZbTMZEmKj
 wIuZvWOntrcB/2sTHwegxbmvjVJLQ0o2knSSEORBoAO8xhrLRduFU12IZeZlLBXrRPu6
 9EiPzmzwY3LHPQkgh+8A5CMFQBmSCPbIkGZOOBKhk2roCj6ZSbWeY2a0rCnzhiZj5oyB
 qymMHJIL/2la3qg2Ymoq6JgGr0LqwdsFE1o/BdsmqVTz0D0+BxOzlYVRjc+ZOxoZ3v+K
 7dyTB4jTgr17JaDD1qjQ85eSgHdc+uDfb+BdyehgA4+mn5ZmOSg6axrFmpys6Dwhmpug
 8iJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qnj9C1grBGebcbm12YaOL2UAKDriSYlm+VG7jn+fBOc=;
 b=P0JnP0kMsrJ1yGuoYEa+NH4EEK0ua7ny9HfHCHCLf9Oj/5NQz7MKifzxEtCRaIOCmN
 4fkfdwuAZZ0seaE9UfouhVi+yvgDpCYRsy24HRACG8VYPw/sspNja90VtOsCMIBxM15m
 abjopX+tJ/lwNjnZGXmTk0+o5Q3b7B3yqa+TIDxV2h9XDLzemuKi81uZ5gXaG9jMgpwV
 VnROrleKk8/R6+V83R/tcJ7s2LTNEFIStQZVNuvFgrtXvQ2fT45YHFxWsRwlxRMwwveA
 8NZLP6PNg9ej784buBghwinzpsTCGYRNoXyPGJTOJMCS0NBklHX30TySry7qG9pQruTu
 yg8w==
X-Gm-Message-State: AOAM530KR92od8obvr1kZ+Rn/uknii/xoPit+9tlwjxDx0DGKK/9cTFv
 61ahg8jMdjAnzAheVVdDCLnipmeq9k82GsxB
X-Google-Smtp-Source: ABdhPJzp17qCI91mcQqH5y8Q9BaRiay7my7rBwm5K8VoUu04jft1Z/MwCNdfL9mRBUvbMzFkHi/enQ==
X-Received: by 2002:a7b:c084:: with SMTP id r4mr13238934wmh.166.1615557119598; 
 Fri, 12 Mar 2021 05:51:59 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.51.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:51:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/39] hw/arm/virt: KVM: The IPA lower bound is 32
Date: Fri, 12 Mar 2021 13:51:26 +0000
Message-Id: <20210312135140.1099-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Jones <drjones@redhat.com>

The virt machine already checks KVM_CAP_ARM_VM_IPA_SIZE to get the
upper bound of the IPA size. If that bound is lower than the highest
possible GPA for the machine, then QEMU will error out. However, the
IPA is set to 40 when the highest GPA is less than or equal to 40,
even when KVM may support an IPA limit as low as 32. This means KVM
may fail the VM creation unnecessarily. Additionally, 40 is selected
with the value 0, which means use the default, and that gets around
a check in some versions of KVM, causing a difficult to debug fail.
Always use the IPA size that corresponds to the highest possible GPA,
unless it's lower than 32, in which case use 32. Also, we must still
use 0 when KVM only supports the legacy fixed 40 bit IPA.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Message-id: 20210310135218.255205-3-drjones@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/kvm_arm.h |  6 ++++--
 hw/arm/virt.c        | 23 ++++++++++++++++-------
 target/arm/kvm.c     |  4 +++-
 3 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 68ec970c4f4..34f8daa3775 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -311,10 +311,12 @@ bool kvm_arm_sve_supported(void);
 /**
  * kvm_arm_get_max_vm_ipa_size:
  * @ms: Machine state handle
+ * @fixed_ipa: True when the IPA limit is fixed at 40. This is the case
+ * for legacy KVM.
  *
  * Returns the number of bits in the IPA address space supported by KVM
  */
-int kvm_arm_get_max_vm_ipa_size(MachineState *ms);
+int kvm_arm_get_max_vm_ipa_size(MachineState *ms, bool *fixed_ipa);
 
 /**
  * kvm_arm_sync_mpstate_to_kvm:
@@ -409,7 +411,7 @@ static inline void kvm_arm_add_vcpu_properties(Object *obj)
     g_assert_not_reached();
 }
 
-static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
+static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms, bool *fixed_ipa)
 {
     g_assert_not_reached();
 }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c08bf112973..aa2bbd14e09 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2548,27 +2548,36 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
 static int virt_kvm_type(MachineState *ms, const char *type_str)
 {
     VirtMachineState *vms = VIRT_MACHINE(ms);
-    int max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms);
-    int requested_pa_size;
+    int max_vm_pa_size, requested_pa_size;
+    bool fixed_ipa;
+
+    max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa);
 
     /* we freeze the memory map to compute the highest gpa */
     virt_set_memmap(vms);
 
     requested_pa_size = 64 - clz64(vms->highest_gpa);
 
+    /*
+     * KVM requires the IPA size to be at least 32 bits.
+     */
+    if (requested_pa_size < 32) {
+        requested_pa_size = 32;
+    }
+
     if (requested_pa_size > max_vm_pa_size) {
         error_report("-m and ,maxmem option values "
                      "require an IPA range (%d bits) larger than "
                      "the one supported by the host (%d bits)",
                      requested_pa_size, max_vm_pa_size);
-       exit(1);
+        exit(1);
     }
     /*
-     * By default we return 0 which corresponds to an implicit legacy
-     * 40b IPA setting. Otherwise we return the actual requested PA
-     * logsize
+     * We return the requested PA log size, unless KVM only supports
+     * the implicit legacy 40b IPA setting, in which case the kvm_type
+     * must be 0.
      */
-    return requested_pa_size > 40 ? requested_pa_size : 0;
+    return fixed_ipa ? 0 : requested_pa_size;
 }
 
 static void virt_machine_class_init(ObjectClass *oc, void *data)
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index bebea901229..d8381ba2245 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -230,12 +230,14 @@ bool kvm_arm_pmu_supported(void)
     return kvm_check_extension(kvm_state, KVM_CAP_ARM_PMU_V3);
 }
 
-int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
+int kvm_arm_get_max_vm_ipa_size(MachineState *ms, bool *fixed_ipa)
 {
     KVMState *s = KVM_STATE(ms->accelerator);
     int ret;
 
     ret = kvm_check_extension(s, KVM_CAP_ARM_VM_IPA_SIZE);
+    *fixed_ipa = ret <= 0;
+
     return ret > 0 ? ret : 40;
 }
 
-- 
2.20.1


