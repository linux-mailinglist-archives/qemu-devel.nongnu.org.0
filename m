Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DB35EEEB6
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 09:17:46 +0200 (CEST)
Received: from localhost ([::1]:40588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odnnl-00061M-IY
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 03:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1odnTZ-0001Wz-4h
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 02:56:54 -0400
Received: from mga17.intel.com ([192.55.52.151]:49072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1odnTW-0001Gp-3Q
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 02:56:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664434610; x=1695970610;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=/6/VqwylSrczNCuoRPX4zu1X/zz8KeLytqpXmkoMnUA=;
 b=RLeJsntsagkxHO/ZGzX1NEOwniz4l9YH5kwGi4zKomf7+iOCM8oo3iuR
 VlbNzd7csAEufc5WfD8GI/tsTZxN/i1kc3ybMJaGAFyIbfhkxfPu+LWmp
 Y5bY4uRc6SvqodH8aQF8ERdLyL0RVozl1dQq570WP83UxNEgbdd8x3esj
 fm+b2rrnWMEisi7JUKoLxzmE8pzT7ZHjI1ZrrFqqfniI2HoiXepf9HzQS
 yydda2H7FbgPUSfbJ+H+x5V+i61VMgNBsZma8il9e4yKsJkzzQpyqp1Vg
 zmu5fYc0io0XTv/af0NDDDkzj/YI7YMgqL8fXJ/KItu/x3QrckVHjlcnD A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="282178260"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; d="scan'208";a="282178260"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 23:56:47 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="711268481"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; d="scan'208";a="711268481"
Received: from chenyi-pc.sh.intel.com ([10.239.159.53])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 23:56:44 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Chenyi Qiang <chenyi.qiang@intel.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Subject: [PATCH v8 1/4] i386: kvm: extend kvm_{get,
 put}_vcpu_events to support pending triple fault
Date: Thu, 29 Sep 2022 15:03:38 +0800
Message-Id: <20220929070341.4846-2-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220929070341.4846-1-chenyi.qiang@intel.com>
References: <20220929070341.4846-1-chenyi.qiang@intel.com>
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=chenyi.qiang@intel.com; helo=mga17.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

For the direct triple faults, i.e. hardware detected and KVM morphed
to VM-Exit, KVM will never lose them. But for triple faults sythesized
by KVM, e.g. the RSM path, if KVM exits to userspace before the request
is serviced, userspace could migrate the VM and lose the triple fault.

A new flag KVM_VCPUEVENT_VALID_TRIPLE_FAULT is defined to signal that
the event.triple_fault_pending field contains a valid state if the
KVM_CAP_X86_TRIPLE_FAULT_EVENT capability is enabled.

Acked-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 target/i386/cpu.c     |  1 +
 target/i386/cpu.h     |  1 +
 target/i386/kvm/kvm.c | 20 ++++++++++++++++++++
 target/i386/machine.c | 20 ++++++++++++++++++++
 4 files changed, 42 insertions(+)

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
index 82004b65b9..d4124973ce 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1739,6 +1739,7 @@ typedef struct CPUArchState {
     uint8_t has_error_code;
     uint8_t exception_has_payload;
     uint64_t exception_payload;
+    uint8_t triple_fault_pending;
     uint32_t ins_len;
     uint32_t sipi_vector;
     bool tsc_valid;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index a1fd1f5379..3838827134 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -132,6 +132,7 @@ static int has_xcrs;
 static int has_pit_state2;
 static int has_sregs2;
 static int has_exception_payload;
+static int has_triple_fault_event;
 
 static bool has_msr_mcg_ext_ctl;
 
@@ -2483,6 +2484,16 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
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
@@ -4299,6 +4310,11 @@ static int kvm_put_vcpu_events(X86CPU *cpu, int level)
         }
     }
 
+    if (has_triple_fault_event) {
+        events.flags |= KVM_VCPUEVENT_VALID_TRIPLE_FAULT;
+        events.triple_fault.pending = env->triple_fault_pending;
+    }
+
     return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_VCPU_EVENTS, &events);
 }
 
@@ -4368,6 +4384,10 @@ static int kvm_get_vcpu_events(X86CPU *cpu)
         }
     }
 
+    if (events.flags & KVM_VCPUEVENT_VALID_TRIPLE_FAULT) {
+        env->triple_fault_pending = events.triple_fault.pending;
+    }
+
     env->sipi_vector = events.sipi_vector;
 
     return 0;
diff --git a/target/i386/machine.c b/target/i386/machine.c
index cecd476e98..310b125235 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1562,6 +1562,25 @@ static const VMStateDescription vmstate_arch_lbr = {
     }
 };
 
+static bool triple_fault_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return env->triple_fault_pending;
+}
+
+static const VMStateDescription vmstate_triple_fault = {
+    .name = "cpu/triple_fault",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = triple_fault_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(env.triple_fault_pending, X86CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_x86_cpu = {
     .name = "cpu",
     .version_id = 12,
@@ -1706,6 +1725,7 @@ const VMStateDescription vmstate_x86_cpu = {
         &vmstate_amx_xtile,
 #endif
         &vmstate_arch_lbr,
+        &vmstate_triple_fault,
         NULL
     }
 };
-- 
2.17.1


