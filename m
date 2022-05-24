Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4BF532BD9
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 16:00:55 +0200 (CEST)
Received: from localhost ([::1]:47216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntV5h-0005dv-8k
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 10:00:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1ntV1r-0000zr-La
 for qemu-devel@nongnu.org; Tue, 24 May 2022 09:56:55 -0400
Received: from mga05.intel.com ([192.55.52.43]:62573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1ntV1p-0003Gp-Qb
 for qemu-devel@nongnu.org; Tue, 24 May 2022 09:56:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653400613; x=1684936613;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=RrS6kepK7TXKuEYh/sgiRn166QnJLj40olbhHYklvg8=;
 b=NeiE3X+JMUE8W8rd8+1PXU0ZhWyxLNDU+hePjEKp/batjIb5FpIgLGgj
 l8MiPpYZAU0/010ODONh4CEY79OSmhxLSNlNBgdHYU9SUFRGwSU67eOsf
 /7h9olyJVVjG/CjSyjfa0+XLMV70jG3b2zuHOMLsz97pbjM9f+zyktPrX
 2LWkRJGU9R36ZqYFbMzc3pF0xHV9wLUw0BXItO+eervmKSUt9jpYHsmBZ
 CNoXPqfS82+JrdQ2GTs2eEsy4gD7CJTXNE+LG+2jqne3BVnwMzLYAw0rO
 PF/NSWg0i3dLMWm95VoMHtzw0BURTPtIJJJWZfmFn8Tfg1sqLOMegxbB4 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="359928389"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="359928389"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 06:56:52 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="717179444"
Received: from chenyi-pc.sh.intel.com ([10.239.159.73])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 06:56:50 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Chenyi Qiang <chenyi.qiang@intel.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Subject: [PATCH v4 2/3] i386: kvm: extend kvm_{get,
 put}_vcpu_events to support pending triple fault
Date: Tue, 24 May 2022 22:03:01 +0800
Message-Id: <20220524140302.23272-3-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220524140302.23272-1-chenyi.qiang@intel.com>
References: <20220524140302.23272-1-chenyi.qiang@intel.com>
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chenyi.qiang@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

For the direct triple faults, i.e. hardware detected and KVM morphed
to VM-Exit, KVM will never lose them. But for triple faults sythesized
by KVM, e.g. the RSM path, if KVM exits to userspace before the request
is serviced, userspace could migrate the VM and lose the triple fault.

A new flag KVM_VCPUEVENT_VALID_TRIPLE_FAULT is defined to signal that
the event.triple_fault_pending field contains a valid state if the
KVM_CAP_TRIPLE_FAULT_EVENT capability is enabled.

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 target/i386/cpu.c     |  1 +
 target/i386/cpu.h     |  1 +
 target/i386/kvm/kvm.c | 20 ++++++++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index cb6b5467d0..276058d52e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5998,6 +5998,7 @@ static void x86_cpu_reset(DeviceState *dev)
     env->exception_has_payload = false;
     env->exception_payload = 0;
     env->nmi_injected = false;
+    env->triple_fault_pending = false;
 #if !defined(CONFIG_USER_ONLY)
     /* We hard-wire the BSP to the first CPU. */
     apic_designate_bsp(cpu->apic_state, s->cpu_index == 0);
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 982c532353..a2a9423747 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1701,6 +1701,7 @@ typedef struct CPUArchState {
     uint8_t has_error_code;
     uint8_t exception_has_payload;
     uint64_t exception_payload;
+    bool triple_fault_pending;
     uint32_t ins_len;
     uint32_t sipi_vector;
     bool tsc_valid;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 9cf8e03669..2f2fc18b4f 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -129,6 +129,7 @@ static int has_xcrs;
 static int has_pit_state2;
 static int has_sregs2;
 static int has_exception_payload;
+static int has_triple_fault_event;
 
 static bool has_msr_mcg_ext_ctl;
 
@@ -2385,6 +2386,16 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
 
+    has_triple_fault_event = kvm_check_extension(s, KVM_CAP_TRIPLE_FAULT_EVENT);
+    if (has_triple_fault_event) {
+        ret = kvm_vm_enable_cap(s, KVM_CAP_TRIPLE_FAULT_EVENT, 0, true);
+        if (ret < 0) {
+            error_report("kvm: Failed to enable triple fault event cap: %s",
+                         strerror(-ret));
+            return ret;
+        }
+    }
+
     ret = kvm_get_supported_msrs(s);
     if (ret < 0) {
         return ret;
@@ -4105,6 +4116,11 @@ static int kvm_put_vcpu_events(X86CPU *cpu, int level)
         }
     }
 
+    if (has_triple_fault_event) {
+        events.flags |= KVM_VCPUEVENT_VALID_TRIPLE_FAULT;
+        events.triple_fault.pending = env->triple_fault_pending;
+    }
+
     return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_VCPU_EVENTS, &events);
 }
 
@@ -4174,6 +4190,10 @@ static int kvm_get_vcpu_events(X86CPU *cpu)
         }
     }
 
+    if (events.flags & KVM_VCPUEVENT_VALID_TRIPLE_FAULT) {
+        env->triple_fault_pending = events.triple_fault.pending;
+    }
+
     env->sipi_vector = events.sipi_vector;
 
     return 0;
-- 
2.17.1


