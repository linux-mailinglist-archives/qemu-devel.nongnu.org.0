Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D5550997C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 09:53:00 +0200 (CEST)
Received: from localhost ([::1]:52494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhRcZ-0007KI-P1
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 03:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1nhRLa-0005rl-6n
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 03:35:27 -0400
Received: from mga02.intel.com ([134.134.136.20]:61327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1nhRLX-0007Vh-Qz
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 03:35:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650526523; x=1682062523;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=qS+hlINTeiepYlBeX2Vr+HSMQ/0589/gEPfau+PqV9I=;
 b=bnOoMuXWFGqqO2JzSJn5EQt2eGJuBbldN5U8sgr3Dgh1eto4KdO5ZqI2
 rER5dnga3dxHUTR/UElk3M511ENYncpk/Khn9h1Mzj2zQjsvXFXMXvMl3
 L7x410Lw7/sPgWVkqvIq4uuMtmFlEPUbiMPzIMTEejLpLgK+NErlq6ooq
 +FG/uK8NnK+j1M70GPUcpTalQZtMcnjBU1ef8k2SrjPDQ1BemkVq70rai
 aJiAPGYnstJ35/7XHdFda8744CGv2W10lgSqGmXA+a5+lsJoT9Evagxvy
 9kxEQ7YojzJ4BqQhDvHoz84UWrXjw5D8mqXPZ+deyJU/UDkTEB3rf5tME Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="251582571"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="251582571"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 00:35:23 -0700
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="530155190"
Received: from chenyi-pc.sh.intel.com ([10.239.159.73])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 00:35:20 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [PATCH v3 3/3] i386: Add notify VM exit support
Date: Thu, 21 Apr 2022 15:40:28 +0800
Message-Id: <20220421074028.18196-4-chenyi.qiang@intel.com>
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

There are cases that malicious virtual machine can cause CPU stuck (due
to event windows don't open up), e.g., infinite loop in microcode when
nested #AC (CVE-2015-5307). No event window means no event (NMI, SMI and
IRQ) can be delivered. It leads the CPU to be unavailable to host or
other VMs. Notify VM exit is introduced to mitigate such kind of
attacks, which will generate a VM exit if no event window occurs in VM
non-root mode for a specified amount of time (notify window).

A new KVM capability KVM_CAP_X86_NOTIFY_VMEXIT is exposed to user space
so that the user can query the capability and set the expected notify
window when creating VMs. The format of the argument when enabling this
capability is as follows:
  Bit 63:32 - notify window specified in qemu command
  Bit 31:0  - some flags (e.g. KVM_X86_NOTIFY_VMEXIT_ENABLED is set to
              enable the feature.)

Because there are some concerns, e.g. a notify VM exit may happen with
VM_CONTEXT_INVALID set in exit qualification (no cases are anticipated
that would set this bit), which means VM context is corrupted. To avoid
the false positive and a well-behaved guest gets killed, make this
feature disabled by default. Users can enable the feature by a new
machine property:
    qemu -machine notify_vmexit=on,notify_window=0 ...

A new KVM exit reason KVM_EXIT_NOTIFY is defined for notify VM exit. If
it happens with VM_INVALID_CONTEXT, hypervisor exits to user space to
inform the fatal case. Then user space can inject a SHUTDOWN event to
the target vcpu. This is implemented by injecting a sythesized triple
fault event.

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 hw/i386/x86.c         | 45 +++++++++++++++++++++++++++++++
 include/hw/i386/x86.h |  5 ++++
 target/i386/kvm/kvm.c | 62 +++++++++++++++++++++++++++++--------------
 3 files changed, 92 insertions(+), 20 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 4cf107baea..a82f959cb9 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1296,6 +1296,37 @@ static void machine_set_sgx_epc(Object *obj, Visitor *v, const char *name,
     qapi_free_SgxEPCList(list);
 }
 
+static bool x86_machine_get_notify_vmexit(Object *obj, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+
+    return x86ms->notify_vmexit;
+}
+
+static void x86_machine_set_notify_vmexit(Object *obj, bool value, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+
+    x86ms->notify_vmexit = value;
+}
+
+static void x86_machine_get_notify_window(Object *obj, Visitor *v,
+                                const char *name, void *opaque, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+    uint32_t notify_window = x86ms->notify_window;
+
+    visit_type_uint32(v, name, &notify_window, errp);
+}
+
+static void x86_machine_set_notify_window(Object *obj, Visitor *v,
+                               const char *name, void *opaque, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+
+    visit_type_uint32(v, name, &x86ms->notify_window, errp);
+}
+
 static void x86_machine_initfn(Object *obj)
 {
     X86MachineState *x86ms = X86_MACHINE(obj);
@@ -1306,6 +1337,8 @@ static void x86_machine_initfn(Object *obj)
     x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
     x86ms->bus_lock_ratelimit = 0;
+    x86ms->notify_vmexit = false;
+    x86ms->notify_window = 0;
 }
 
 static void x86_machine_class_init(ObjectClass *oc, void *data)
@@ -1361,6 +1394,18 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
         NULL, NULL);
     object_class_property_set_description(oc, "sgx-epc",
         "SGX EPC device");
+
+    object_class_property_add(oc, X86_MACHINE_NOTIFY_WINDOW, "uint32_t",
+                              x86_machine_get_notify_window,
+                              x86_machine_set_notify_window, NULL, NULL);
+    object_class_property_set_description(oc, X86_MACHINE_NOTIFY_WINDOW,
+            "Set the notify window required by notify VM exit");
+
+    object_class_property_add_bool(oc, X86_MACHINE_NOTIFY_VMEXIT,
+                                   x86_machine_get_notify_vmexit,
+                                   x86_machine_set_notify_vmexit);
+    object_class_property_set_description(oc, X86_MACHINE_NOTIFY_VMEXIT,
+            "Enable notify VM exit");
 }
 
 static const TypeInfo x86_machine_info = {
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 916cc325ee..571ee8b667 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -80,6 +80,9 @@ struct X86MachineState {
      * which means no limitation on the guest's bus locks.
      */
     uint64_t bus_lock_ratelimit;
+
+    bool notify_vmexit;
+    uint32_t notify_window;
 };
 
 #define X86_MACHINE_SMM              "smm"
@@ -87,6 +90,8 @@ struct X86MachineState {
 #define X86_MACHINE_OEM_ID           "x-oem-id"
 #define X86_MACHINE_OEM_TABLE_ID     "x-oem-table-id"
 #define X86_MACHINE_BUS_LOCK_RATELIMIT  "bus-lock-ratelimit"
+#define X86_MACHINE_NOTIFY_VMEXIT     "notify-vmexit"
+#define X86_MACHINE_NOTIFY_WINDOW     "notify-window"
 
 #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
 OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index bd44a02f51..01dbdef8b2 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2344,6 +2344,10 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     int ret;
     struct utsname utsname;
     Error *local_err = NULL;
+    X86MachineState *x86ms;
+
+    assert(object_dynamic_cast(OBJECT(ms), TYPE_X86_MACHINE));
+    x86ms = X86_MACHINE(ms);
 
     /*
      * Initialize SEV context, if required
@@ -2439,8 +2443,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     }
 
     if (kvm_check_extension(s, KVM_CAP_X86_SMM) &&
-        object_dynamic_cast(OBJECT(ms), TYPE_X86_MACHINE) &&
-        x86_machine_is_smm_enabled(X86_MACHINE(ms))) {
+        x86_machine_is_smm_enabled(x86ms)) {
         smram_machine_done.notify = register_smram_listener;
         qemu_add_machine_init_done_notifier(&smram_machine_done);
     }
@@ -2468,25 +2471,34 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
 
-    if (object_dynamic_cast(OBJECT(ms), TYPE_X86_MACHINE)) {
-        X86MachineState *x86ms = X86_MACHINE(ms);
+    if (x86ms->bus_lock_ratelimit > 0) {
+        ret = kvm_check_extension(s, KVM_CAP_X86_BUS_LOCK_EXIT);
+        if (!(ret & KVM_BUS_LOCK_DETECTION_EXIT)) {
+            error_report("kvm: bus lock detection unsupported");
+            return -ENOTSUP;
+        }
+        ret = kvm_vm_enable_cap(s, KVM_CAP_X86_BUS_LOCK_EXIT, 0,
+                                KVM_BUS_LOCK_DETECTION_EXIT);
+        if (ret < 0) {
+            error_report("kvm: Failed to enable bus lock detection cap: %s",
+                         strerror(-ret));
+            return ret;
+        }
+        ratelimit_init(&bus_lock_ratelimit_ctrl);
+        ratelimit_set_speed(&bus_lock_ratelimit_ctrl,
+                            x86ms->bus_lock_ratelimit, BUS_LOCK_SLICE_TIME);
+    }
 
-        if (x86ms->bus_lock_ratelimit > 0) {
-            ret = kvm_check_extension(s, KVM_CAP_X86_BUS_LOCK_EXIT);
-            if (!(ret & KVM_BUS_LOCK_DETECTION_EXIT)) {
-                error_report("kvm: bus lock detection unsupported");
-                return -ENOTSUP;
-            }
-            ret = kvm_vm_enable_cap(s, KVM_CAP_X86_BUS_LOCK_EXIT, 0,
-                                    KVM_BUS_LOCK_DETECTION_EXIT);
-            if (ret < 0) {
-                error_report("kvm: Failed to enable bus lock detection cap: %s",
-                             strerror(-ret));
-                return ret;
-            }
-            ratelimit_init(&bus_lock_ratelimit_ctrl);
-            ratelimit_set_speed(&bus_lock_ratelimit_ctrl,
-                                x86ms->bus_lock_ratelimit, BUS_LOCK_SLICE_TIME);
+    if (x86ms->notify_vmexit && kvm_check_extension(s, KVM_CAP_X86_NOTIFY_VMEXIT)) {
+        uint64_t notify_window_flags = ((uint64_t)x86ms->notify_window << 32) |
+                                        KVM_X86_NOTIFY_VMEXIT_ENABLED |
+                                        KVM_X86_NOTIFY_VMEXIT_USER;
+        ret = kvm_vm_enable_cap(s, KVM_CAP_X86_NOTIFY_VMEXIT, 0,
+                                notify_window_flags);
+        if (ret < 0) {
+            error_report("kvm: Failed to enable notify vmexit cap: %s",
+                         strerror(-ret));
+            return ret;
         }
     }
 
@@ -4926,6 +4938,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
     X86CPU *cpu = X86_CPU(cs);
     uint64_t code;
     int ret;
+    struct kvm_vcpu_events events = {};
 
     switch (run->exit_reason) {
     case KVM_EXIT_HLT:
@@ -4981,6 +4994,15 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
         /* already handled in kvm_arch_post_run */
         ret = 0;
         break;
+    case KVM_EXIT_NOTIFY:
+        ret = 0;
+        if (run->notify.flags & KVM_NOTIFY_CONTEXT_INVALID) {
+            warn_report("KVM: invalid context due to notify vmexit");
+            events.flags |= KVM_VCPUEVENT_VALID_TRIPLE_FAULT;
+            events.triple_fault_pending = true;
+            ret = kvm_vcpu_ioctl(cs, KVM_SET_VCPU_EVENTS, &events);
+        }
+        break;
     default:
         fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
         ret = -1;
-- 
2.17.1


