Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 680265E74E4
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 09:34:03 +0200 (CEST)
Received: from localhost ([::1]:44690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obdCE-0001DM-Dg
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 03:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1obd5C-0004Nf-Az
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 03:26:48 -0400
Received: from mga02.intel.com ([134.134.136.20]:10884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1obd5A-0000Im-6V
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 03:26:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663918004; x=1695454004;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=oEgUJNBfIo70UxSyxdVVvTcjz5zSLYBTt/Z3hcPx8OQ=;
 b=LsJgEK/YdP9+6SKJu+YtdoFP4ZsKT9Y8ToYD7LQikoX/A70EDUChxq+7
 QSJjlJ7hi5RlfQb65qQA8nM1dqwTGFa8sK+gTUYwSNQBW71K6T0XVZcj/
 i9kreqK7tpbXUtB/ygOdqqWMudEkDBUxLqRnhv5Ehm9hCupaUqYWtL9WF
 ewwXYGAFlOUtNTMZgm6Mil0/pPOr7PrZpOCq79l2ihwCbTgnOO73mrQo3
 e2C5pMYCZP4bOMuSaUyI3USG02PpJ5RXIDfY+wZYBB/dH0o/5GD7tX621
 swNSzqTaQQMY5mwWOWN3G+llRyvsgfOlyc2DBmNZ1DJ6eivf7cJEBYoGP A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="287646933"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="287646933"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 00:26:42 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="620121678"
Received: from chenyi-pc.sh.intel.com ([10.239.159.53])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 00:26:40 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Chenyi Qiang <chenyi.qiang@intel.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Subject: [PATCH v7 2/2] i386: Add notify VM exit support
Date: Fri, 23 Sep 2022 15:33:33 +0800
Message-Id: <20220923073333.23381-3-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220923073333.23381-1-chenyi.qiang@intel.com>
References: <20220923073333.23381-1-chenyi.qiang@intel.com>
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=chenyi.qiang@intel.com; helo=mga02.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Note that notify_window is only valid when notify_vmexit is on. The valid
range of notify_window is non-negative. It is even safe to set it to zero
since there's an internal hardware threshold to be added to ensure no false
positive.

A new KVM exit reason KVM_EXIT_NOTIFY is defined for notify VM exit. If
it happens with VM_INVALID_CONTEXT, hypervisor exits to user space to
inform the fatal case. Then user space can inject a SHUTDOWN event to
the target vcpu. This is implemented by injecting a sythesized triple
fault event.

Acked-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 hw/i386/x86.c         | 45 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/i386/x86.h |  5 +++++
 qemu-options.hx       | 10 +++++++++-
 target/i386/kvm/kvm.c | 34 ++++++++++++++++++++++++++++++++
 4 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 050eedc0c8..1eccbd3deb 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1379,6 +1379,37 @@ static void machine_set_sgx_epc(Object *obj, Visitor *v, const char *name,
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
@@ -1392,6 +1423,8 @@ static void x86_machine_initfn(Object *obj)
     x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
     x86ms->bus_lock_ratelimit = 0;
     x86ms->above_4g_mem_start = 4 * GiB;
+    x86ms->notify_vmexit = false;
+    x86ms->notify_window = 0;
 }
 
 static void x86_machine_class_init(ObjectClass *oc, void *data)
@@ -1461,6 +1494,18 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
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
index 62fa5774f8..5707329fa7 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -85,6 +85,9 @@ struct X86MachineState {
      * which means no limitation on the guest's bus locks.
      */
     uint64_t bus_lock_ratelimit;
+
+    bool notify_vmexit;
+    uint32_t notify_window;
 };
 
 #define X86_MACHINE_SMM              "smm"
@@ -94,6 +97,8 @@ struct X86MachineState {
 #define X86_MACHINE_OEM_ID           "x-oem-id"
 #define X86_MACHINE_OEM_TABLE_ID     "x-oem-table-id"
 #define X86_MACHINE_BUS_LOCK_RATELIMIT  "bus-lock-ratelimit"
+#define X86_MACHINE_NOTIFY_VMEXIT     "notify-vmexit"
+#define X86_MACHINE_NOTIFY_WINDOW     "notify-window"
 
 #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
 OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
diff --git a/qemu-options.hx b/qemu-options.hx
index d8b5ce5b43..1fa0fd8f1a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -37,7 +37,8 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
     "                memory-encryption=@var{} memory encryption object to use (default=none)\n"
     "                hmat=on|off controls ACPI HMAT support (default=off)\n"
     "                memory-backend='backend-id' specifies explicitly provided backend for main RAM (default=none)\n"
-    "                cxl-fmw.0.targets.0=firsttarget,cxl-fmw.0.targets.1=secondtarget,cxl-fmw.0.size=size[,cxl-fmw.0.interleave-granularity=granularity]\n",
+    "                cxl-fmw.0.targets.0=firsttarget,cxl-fmw.0.targets.1=secondtarget,cxl-fmw.0.size=size[,cxl-fmw.0.interleave-granularity=granularity]\n"
+    "                notify_vmexit=on|off,notify_window=n controls notify VM exit support (default=off) and specifies the notify window size (default=0)\n",
     QEMU_ARCH_ALL)
 SRST
 ``-machine [type=]name[,prop=value[,...]]``
@@ -157,6 +158,13 @@ SRST
         ::
 
             -machine cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=128G,cxl-fmw.0.interleave-granularity=512k
+
+    ``notify_vmexit=on|off,notify_window=n``
+        Enables or disables Notify VM exit support on x86 host and specify
+        the corresponding notify window to trigger the VM exit if enabled.
+        This feature can mitigate the CPU stuck issue due to event windows
+        don't open up for a specified of time (notify window).
+        The default is off.
 ERST
 
 DEF("M", HAS_ARG, QEMU_OPTION_M,
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 3838827134..dd2d33f994 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2597,6 +2597,21 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
             ratelimit_set_speed(&bus_lock_ratelimit_ctrl,
                                 x86ms->bus_lock_ratelimit, BUS_LOCK_SLICE_TIME);
         }
+
+        if (x86ms->notify_vmexit &&
+            kvm_check_extension(s, KVM_CAP_X86_NOTIFY_VMEXIT)) {
+            uint64_t notify_window_flags =
+                ((uint64_t)x86ms->notify_window << 32) |
+                KVM_X86_NOTIFY_VMEXIT_ENABLED |
+                KVM_X86_NOTIFY_VMEXIT_USER;
+            ret = kvm_vm_enable_cap(s, KVM_CAP_X86_NOTIFY_VMEXIT, 0,
+                                    notify_window_flags);
+            if (ret < 0) {
+                error_report("kvm: Failed to enable notify vmexit cap: %s",
+                             strerror(-ret));
+                return ret;
+            }
+        }
     }
 
     return 0;
@@ -5141,6 +5156,8 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
     X86CPU *cpu = X86_CPU(cs);
     uint64_t code;
     int ret;
+    struct kvm_vcpu_events events = {};
+    bool ctx_invalid;
 
     switch (run->exit_reason) {
     case KVM_EXIT_HLT:
@@ -5196,6 +5213,23 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
         /* already handled in kvm_arch_post_run */
         ret = 0;
         break;
+    case KVM_EXIT_NOTIFY:
+        ctx_invalid = !!(run->notify.flags & KVM_NOTIFY_CONTEXT_INVALID);
+        ret = 0;
+        warn_report_once("KVM: encounter a notify exit with %svalid context in"
+                         " guest. It means there can be possible misbehaves in"
+                         " guest, please have a look.",
+                         ctx_invalid ? "in" : "");
+        if (ctx_invalid) {
+            if (has_triple_fault_event) {
+                events.flags |= KVM_VCPUEVENT_VALID_TRIPLE_FAULT;
+                events.triple_fault.pending = true;
+                ret = kvm_vcpu_ioctl(cs, KVM_SET_VCPU_EVENTS, &events);
+            } else {
+                ret = -1;
+            }
+        }
+        break;
     default:
         fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
         ret = -1;
-- 
2.17.1


