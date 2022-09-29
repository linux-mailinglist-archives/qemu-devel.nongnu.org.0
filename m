Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E255EEF89
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 09:46:59 +0200 (CEST)
Received: from localhost ([::1]:60950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odoG2-0001xt-2q
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 03:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1odnkJ-0004Cv-Uu
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:14:13 -0400
Received: from mga04.intel.com ([192.55.52.120]:1937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1odnkH-0003qj-HH
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:14:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664435649; x=1695971649;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=PvmDqbquWzupiy4aH26wEXQ5Z+AGyeFV5o+EPKcrQdA=;
 b=Ex+2XBOmJ5GryLzvNg8EZpwgCi5wxO4sPCv2oWfCpj8s+49fqfHBWF/b
 G4L8w8hcosI39KVrBtMUI6nItmCxXEmdBnMPdtn+/4T/y085UHAniyA+v
 Xqv4lj+qO3F+Cnq+iXqiAvQGm1xxJtBy73t+8lU8m/ax/Yf3WKUbQ1Vwa
 jLve8rkPy9yB1rNLHOlEvQpteZHhyeShKkzMhgKb6by3WNqiPSaaROVG2
 yvfYvgajRhlJbVBiM/2426XVnWTz+PptCHSTrMYPk65jpgmB3uFj6tu9O
 8xz3m6MzbHrShO1sxjOK4TEa3HPSuq75/yHtiASdYKMT0dw1j2n/mYBkO w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="300534137"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; d="scan'208";a="300534137"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 00:14:08 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="655440752"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; d="scan'208";a="655440752"
Received: from chenyi-pc.sh.intel.com ([10.239.159.53])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 00:14:05 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Chenyi Qiang <chenyi.qiang@intel.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Subject: [RESEND PATCH v8 4/4] i386: add notify VM exit support
Date: Thu, 29 Sep 2022 15:20:14 +0800
Message-Id: <20220929072014.20705-5-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220929072014.20705-1-chenyi.qiang@intel.com>
References: <20220929072014.20705-1-chenyi.qiang@intel.com>
Received-SPF: pass client-ip=192.55.52.120;
 envelope-from=chenyi.qiang@intel.com; helo=mga04.intel.com
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

Users can configure the feature by a new (x86 only) accel property:
    qemu -accel kvm,notify-vmexit=run|internal-error|disable,notify-window=n

The default option of notify-vmexit is run, which will enable the
capability and do nothing if the exit happens. The internal-error option
raises a KVM internal error if it happens. The disable option does not
enable the capability. The default value of notify-window is 0. It is valid
only when notify-vmexit is not disabled. The valid range of notify-window
is non-negative. It is even safe to set it to zero since there's an
internal hardware threshold to be added to ensure no false positive.

Because a notify VM exit may happen with VM_CONTEXT_INVALID set in exit
qualification (no cases are anticipated that would set this bit), which
means VM context is corrupted. It would be reflected in the flags of
KVM_EXIT_NOTIFY exit. If KVM_NOTIFY_CONTEXT_INVALID bit is set, raise a KVM
internal error unconditionally.

Acked-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 accel/kvm/kvm-all.c   |  2 +
 qapi/run-state.json   | 17 ++++++++
 qemu-options.hx       | 11 +++++
 target/i386/kvm/kvm.c | 98 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 128 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 3624ed8447..41ba9de3b8 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3636,6 +3636,8 @@ static void kvm_accel_instance_init(Object *obj)
     s->kernel_irqchip_split = ON_OFF_AUTO_AUTO;
     /* KVM dirty ring is by default off */
     s->kvm_dirty_ring_size = 0;
+    s->notify_vmexit = NOTIFY_VMEXIT_OPTION_RUN;
+    s->notify_window = 0;
 }
 
 static void kvm_accel_class_init(ObjectClass *oc, void *data)
diff --git a/qapi/run-state.json b/qapi/run-state.json
index 9273ea6516..49989d30e6 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -643,3 +643,20 @@
 { 'struct': 'MemoryFailureFlags',
   'data': { 'action-required': 'bool',
             'recursive': 'bool'} }
+
+##
+# @NotifyVmexitOption:
+#
+# An enumeration of the options specified when enabling notify VM exit
+#
+# @run: enable the feature, do nothing and continue if the notify VM exit happens.
+#
+# @internal-error: enable the feature, raise a internal error if the notify
+#                  VM exit happens.
+#
+# @disable: disable the feature.
+#
+# Since: 7.2
+##
+{ 'enum': 'NotifyVmexitOption',
+  'data': [ 'run', 'internal-error', 'disable' ] }
\ No newline at end of file
diff --git a/qemu-options.hx b/qemu-options.hx
index 913c71e38f..8f85004a7d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -191,6 +191,7 @@ DEF("accel", HAS_ARG, QEMU_OPTION_accel,
     "                split-wx=on|off (enable TCG split w^x mapping)\n"
     "                tb-size=n (TCG translation block cache size)\n"
     "                dirty-ring-size=n (KVM dirty ring GFN count, default 0)\n"
+    "                notify-vmexit=run|internal-error|disable,notify-window=n (enable notify VM exit and set notify window, x86 only)\n"
     "                thread=single|multi (enable multi-threaded TCG)\n", QEMU_ARCH_ALL)
 SRST
 ``-accel name[,prop=value[,...]]``
@@ -242,6 +243,16 @@ SRST
         is disabled (dirty-ring-size=0).  When enabled, KVM will instead
         record dirty pages in a bitmap.
 
+    ``notify-vmexit=run|internal-error|disable,notify-window=n``
+        Enables or disables notify VM exit support on x86 host and specify
+        the corresponding notify window to trigger the VM exit if enabled.
+        ``run`` option enables the feature. It does nothing and continue
+        if the exit happens. ``internal-error`` option enables the feature.
+        It raises a internal error. ``disable`` option doesn't enable the feature.
+        This feature can mitigate the CPU stuck issue due to event windows don't
+        open up for a specified of time (i.e. notify-window).
+        Default: notify-vmexit=run,notify-window=0.
+
 ERST
 
 DEF("smp", HAS_ARG, QEMU_OPTION_smp,
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index eab09833f9..9a4378b304 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -15,6 +15,7 @@
 #include "qemu/osdep.h"
 #include "qapi/qapi-events-run-state.h"
 #include "qapi/error.h"
+#include "qapi/visitor.h"
 #include <sys/ioctl.h>
 #include <sys/utsname.h>
 #include <sys/syscall.h>
@@ -2599,6 +2600,21 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
 
+    if (s->notify_vmexit != NOTIFY_VMEXIT_OPTION_DISABLE &&
+        kvm_check_extension(s, KVM_CAP_X86_NOTIFY_VMEXIT)) {
+            uint64_t notify_window_flags =
+                ((uint64_t)s->notify_window << 32) |
+                KVM_X86_NOTIFY_VMEXIT_ENABLED |
+                KVM_X86_NOTIFY_VMEXIT_USER;
+            ret = kvm_vm_enable_cap(s, KVM_CAP_X86_NOTIFY_VMEXIT, 0,
+                                    notify_window_flags);
+            if (ret < 0) {
+                error_report("kvm: Failed to enable notify vmexit cap: %s",
+                             strerror(-ret));
+                return ret;
+            }
+    }
+
     return 0;
 }
 
@@ -5141,6 +5157,9 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
     X86CPU *cpu = X86_CPU(cs);
     uint64_t code;
     int ret;
+    bool ctx_invalid;
+    char str[256];
+    KVMState *state;
 
     switch (run->exit_reason) {
     case KVM_EXIT_HLT:
@@ -5196,6 +5215,21 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
         /* already handled in kvm_arch_post_run */
         ret = 0;
         break;
+    case KVM_EXIT_NOTIFY:
+        ctx_invalid = !!(run->notify.flags & KVM_NOTIFY_CONTEXT_INVALID);
+        state = KVM_STATE(current_accel());
+        sprintf(str, "Encounter a notify exit with %svalid context in"
+                     " guest. There can be possible misbehaves in guest."
+                     " Please have a look.", ctx_invalid ? "in" : "");
+        if (ctx_invalid ||
+            state->notify_vmexit == NOTIFY_VMEXIT_OPTION_INTERNAL_ERROR) {
+            warn_report("KVM internal error: %s", str);
+            ret = -1;
+        } else {
+            warn_report_once("KVM: %s", str);
+            ret = 0;
+        }
+        break;
     default:
         fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
         ret = -1;
@@ -5473,6 +5507,70 @@ void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask)
     }
 }
 
+static int kvm_arch_get_notify_vmexit(Object *obj, Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+    return s->notify_vmexit;
+}
+
+static void kvm_arch_set_notify_vmexit(Object *obj, int value, Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+
+    if (s->fd != -1) {
+        error_setg(errp, "Cannot set properties after the accelerator has been initialized");
+        return;
+    }
+
+    s->notify_vmexit = value;
+}
+
+static void kvm_arch_get_notify_window(Object *obj, Visitor *v,
+                                       const char *name, void *opaque,
+                                       Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+    uint32_t value = s->notify_window;
+
+    visit_type_uint32(v, name, &value, errp);
+}
+
+static void kvm_arch_set_notify_window(Object *obj, Visitor *v,
+                                       const char *name, void *opaque,
+                                       Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+    Error *error = NULL;
+    uint32_t value;
+
+    if (s->fd != -1) {
+        error_setg(errp, "Cannot set properties after the accelerator has been initialized");
+        return;
+    }
+
+    visit_type_uint32(v, name, &value, &error);
+    if (error) {
+        error_propagate(errp, error);
+        return;
+    }
+
+    s->notify_window = value;
+}
+
 void kvm_arch_accel_class_init(ObjectClass *oc)
 {
+    object_class_property_add_enum(oc, "notify-vmexit", "NotifyVMexitOption",
+                                   &NotifyVmexitOption_lookup,
+                                   kvm_arch_get_notify_vmexit,
+                                   kvm_arch_set_notify_vmexit);
+    object_class_property_set_description(oc, "notify-vmexit",
+                                          "Enable notify VM exit");
+
+    object_class_property_add(oc, "notify-window", "uint32",
+                              kvm_arch_get_notify_window,
+                              kvm_arch_set_notify_window,
+                              NULL, NULL);
+    object_class_property_set_description(oc, "notify-window",
+                                          "Clock cycles without an event window "
+                                          "after which a notification VM exit occurs");
 }
-- 
2.17.1


