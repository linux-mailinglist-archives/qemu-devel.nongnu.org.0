Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C94659673B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 04:07:54 +0200 (CEST)
Received: from localhost ([::1]:45980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO8TI-0005MY-NP
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 22:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1oO8OR-0008OH-5I
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 22:02:51 -0400
Received: from mga09.intel.com ([134.134.136.24]:11455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1oO8OO-0004a3-Ev
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 22:02:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660701768; x=1692237768;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=ySpCmIlYp8A6RnGyFtr4XqQK4NQKURkz3FEfaIbxlBU=;
 b=mKHxRHThEsSLbE5mWg8740PxVdMWkZtCKiAZKU5FBLOkegbHSlITNFmb
 8dwkBlGrN775fkPcA4aYRvTCJBU1ZUsDHApNO60UCFvvkvxHP7nVaeUb5
 fgUIuUY1nQOApBCBo68hiveb2iMKbvX+f9Z7Tf80nqh58IP8wEbYvVRqK
 twgJX1H89DrSavPdSDPr6OvZprsFWtCPx0WjVhwUm1byfb1Ggo7o2xAYg
 spMf4Lvn1TVSa81CoW8iMVNQYonq7xqP92aO3SOIob6fNfSB1umJdPh/i
 FTXwT7HTixo2zdK3Tbn4iNtQTh29BuAFEv1vVym4HIkcdj3W4KIr1NQxr w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="293173541"
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; d="scan'208";a="293173541"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 19:02:45 -0700
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; d="scan'208";a="675456983"
Received: from chenyi-pc.sh.intel.com ([10.239.159.73])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 19:02:43 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Chenyi Qiang <chenyi.qiang@intel.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Subject: [PATCH v5 2/3] i386: kvm: extend kvm_{get,
 put}_vcpu_events to support pending triple fault
Date: Wed, 17 Aug 2022 10:08:44 +0800
Message-Id: <20220817020845.21855-3-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220817020845.21855-1-chenyi.qiang@intel.com>
References: <20220817020845.21855-1-chenyi.qiang@intel.com>
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=chenyi.qiang@intel.com; helo=mga09.intel.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the direct triple faults, i.e. hardware detected and KVM morphed
to VM-Exit, KVM will never lose them. But for triple faults sythesized
by KVM, e.g. the RSM path, if KVM exits to userspace before the request
is serviced, userspace could migrate the VM and lose the triple fault.

A new flag KVM_VCPUEVENT_VALID_TRIPLE_FAULT is defined to signal that
the event.triple_fault_pending field contains a valid state if the
KVM_CAP_X86_TRIPLE_FAULT_EVENT capability is enabled.

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 target/i386/cpu.c     |  1 +
 target/i386/cpu.h     |  1 +
 target/i386/kvm/kvm.c | 20 ++++++++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 1db1278a59..6e107466b3 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6017,6 +6017,7 @@ static void x86_cpu_reset(DeviceState *dev)
     env->exception_has_payload = false;
     env->exception_payload = 0;
     env->nmi_injected = false;
+    env->triple_fault_pending = false;
 #if !defined(CONFIG_USER_ONLY)
     /* We hard-wire the BSP to the first CPU. */
     apic_designate_bsp(cpu->apic_state, s->cpu_index == 0);
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 82004b65b9..b97d182e28 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1739,6 +1739,7 @@ typedef struct CPUArchState {
     uint8_t has_error_code;
     uint8_t exception_has_payload;
     uint64_t exception_payload;
+    bool triple_fault_pending;
     uint32_t ins_len;
     uint32_t sipi_vector;
     bool tsc_valid;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index f148a6d52f..cb88ba4a00 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -132,6 +132,7 @@ static int has_xcrs;
 static int has_pit_state2;
 static int has_sregs2;
 static int has_exception_payload;
+static int has_triple_fault_event;
 
 static bool has_msr_mcg_ext_ctl;
 
@@ -2466,6 +2467,16 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
 
+    has_triple_fault_event = kvm_check_extension(s, KVM_CAP_X86_TRIPLE_FAULT_EVENT);
+    if (has_triple_fault_event) {
+        ret = kvm_vm_enable_cap(s, KVM_CAP_X86_TRIPLE_FAULT_EVENT, 0, true);
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
@@ -4282,6 +4293,11 @@ static int kvm_put_vcpu_events(X86CPU *cpu, int level)
         }
     }
 
+    if (has_triple_fault_event) {
+        events.flags |= KVM_VCPUEVENT_VALID_TRIPLE_FAULT;
+        events.triple_fault.pending = env->triple_fault_pending;
+    }
+
     return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_VCPU_EVENTS, &events);
 }
 
@@ -4351,6 +4367,10 @@ static int kvm_get_vcpu_events(X86CPU *cpu)
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


