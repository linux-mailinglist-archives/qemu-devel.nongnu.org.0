Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C14509A85
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 10:22:57 +0200 (CEST)
Received: from localhost ([::1]:38552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhS5Y-0003Mz-JJ
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 04:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1nhRLX-0005rf-PC
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 03:35:27 -0400
Received: from mga02.intel.com ([134.134.136.20]:61327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1nhRLV-0007Vh-RQ
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 03:35:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650526521; x=1682062521;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=iiCAR1Rfqc66iGGWY17iyr5Co4ZAZLinh3HQEEGKipA=;
 b=UPjbLZfgEVhZhFHHYXzO/DS/i3Z4ekUMKrNodaDwLCk26/pZhyG9FBIc
 4zAiTps4TGpANVuaTBsUoRmBmT8dBqyuoj1QvCEdfl2uSFwBJHgERZDJk
 pI2D2ZtIjw05AaYaPxxUZs5ZOlotTbkrnLjHeO/bUxod0x/KyOixzjfHF
 mIRdm3Un5aCW4ygmJg0Cc6LhlddsDELOTNSgc+OwF0rBCUNmQz2u62ExT
 VXmSGrlvh/9m1k/eLbwUxg3Szevcaf1BtkPaz+xBwLPsc7vp76lhhPQGE
 eYjIrUq81JCdHvSCPOUMerH47WxXaok9ZWTdAXg+7aWWi9djRb0n94vxG w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="251582566"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="251582566"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 00:35:20 -0700
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="530155163"
Received: from chenyi-pc.sh.intel.com ([10.239.159.73])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 00:35:17 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [PATCH v3 2/3] i386: kvm: Save&restore triple fault event
Date: Thu, 21 Apr 2022 15:40:27 +0800
Message-Id: <20220421074028.18196-3-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220421074028.18196-1-chenyi.qiang@intel.com>
References: <20220421074028.18196-1-chenyi.qiang@intel.com>
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=chenyi.qiang@intel.com; helo=mga02.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Chenyi Qiang <chenyi.qiang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the direct triple faults, i.e. hardware detected and KVM morphed
to VM-Exit, KVM will never lose them. But for triple faults sythesized
by KVM, e.g. the RSM path, if KVM exits to userspace before the request
is serviced, userspace could migrate the VM and lose the triple fault.

A new flag KVM_VCPUEVENT_VALID_TRIPLE_FAULT is defined to signal that
the event.triple_fault_pending field contains a valid state.

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 target/i386/cpu.c     | 1 +
 target/i386/cpu.h     | 1 +
 target/i386/kvm/kvm.c | 8 +++++++-
 3 files changed, 9 insertions(+), 1 deletion(-)

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
index 9cf8e03669..bd44a02f51 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -4099,7 +4099,9 @@ static int kvm_put_vcpu_events(X86CPU *cpu, int level)
     }
 
     if (level >= KVM_PUT_RESET_STATE) {
-        events.flags |= KVM_VCPUEVENT_VALID_NMI_PENDING;
+        events.flags |= KVM_VCPUEVENT_VALID_NMI_PENDING |
+                        KVM_VCPUEVENT_VALID_TRIPLE_FAULT;
+        events.triple_fault_pending = env->triple_fault_pending;
         if (env->mp_state == KVM_MP_STATE_SIPI_RECEIVED) {
             events.flags |= KVM_VCPUEVENT_VALID_SIPI_VECTOR;
         }
@@ -4174,6 +4176,10 @@ static int kvm_get_vcpu_events(X86CPU *cpu)
         }
     }
 
+    if (events.flags & KVM_VCPUEVENT_VALID_TRIPLE_FAULT) {
+        env->triple_fault_pending = events.triple_fault_pending;
+    }
+
     env->sipi_vector = events.sipi_vector;
 
     return 0;
-- 
2.17.1


