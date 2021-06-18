Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B203AD344
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:59:32 +0200 (CEST)
Received: from localhost ([::1]:47608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKeK-0003Zk-0q
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1luKXq-0008Ec-Ok
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:52:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1luKXl-0006oT-J9
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:52:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624045965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s3aHJrbQ18tWnsd1/K+8ulPCfbPNY8Z3MHjlwA/STIM=;
 b=Xj0tuj6AGQJcYgpnsbqJ/BJWzduFDkdWLiGhknAgEmg7dPmowMh1D8l5N7V/iWIUaB+xlP
 SyLJuTDBjUbAd2pWQCxETr3XIljyRCQCc27pSbJ9ORv/h4hl2Kw9Xet8+PvBSKQ6ERdHtH
 1pYvEz04LSMnBeDoCJuMcKWvGczk5CE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-vr47Slw9PjWeua30bs4aEw-1; Fri, 18 Jun 2021 15:52:41 -0400
X-MC-Unique: vr47Slw9PjWeua30bs4aEw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BEDC8018A5;
 Fri, 18 Jun 2021 19:52:40 +0000 (UTC)
Received: from localhost (unknown [10.22.9.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 524DD5D6CF;
 Fri, 18 Jun 2021 19:52:40 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 2/7] i386: Add ratelimit for bus locks acquired in guest
Date: Fri, 18 Jun 2021 15:52:32 -0400
Message-Id: <20210618195237.442548-3-ehabkost@redhat.com>
In-Reply-To: <20210618195237.442548-1-ehabkost@redhat.com>
References: <20210618195237.442548-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Chenyi Qiang <chenyi.qiang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chenyi Qiang <chenyi.qiang@intel.com>

A bus lock is acquired through either split locked access to writeback
(WB) memory or any locked access to non-WB memory. It is typically >1000
cycles slower than an atomic operation within a cache and can also
disrupts performance on other cores.

Virtual Machines can exploit bus locks to degrade the performance of
system. To address this kind of performance DOS attack coming from the
VMs, bus lock VM exit is introduced in KVM and it can report the bus
locks detected in guest. If enabled in KVM, it would exit to the
userspace to let the user enforce throttling policies once bus locks
acquired in VMs.

The availability of bus lock VM exit can be detected through the
KVM_CAP_X86_BUS_LOCK_EXIT. The returned bitmap contains the potential
policies supported by KVM. The field KVM_BUS_LOCK_DETECTION_EXIT in
bitmap is the only supported strategy at present. It indicates that KVM
will exit to userspace to handle the bus locks.

This patch adds a ratelimit on the bus locks acquired in guest as a
mitigation policy.

Introduce a new field "bus_lock_ratelimit" to record the limited speed
of bus locks in the target VM. The user can specify it through the
"bus-lock-ratelimit" as a machine property. In current implementation,
the default value of the speed is 0 per second, which means no
restrictions on the bus locks.

As for ratelimit on detected bus locks, simply set the ratelimit
interval to 1s and restrict the quota of bus lock occurence to the value
of "bus_lock_ratelimit". A potential alternative is to introduce the
time slice as a property which can help the user achieve more precise
control.

The detail of bus lock VM exit can be found in spec:
https://software.intel.com/content/www/us/en/develop/download/intel-architecture-instruction-set-extensions-programming-reference.html

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
Message-Id: <20210521043820.29678-1-chenyi.qiang@intel.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/hw/i386/x86.h |  8 ++++++++
 hw/i386/x86.c         | 24 ++++++++++++++++++++++++
 target/i386/kvm/kvm.c | 41 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+)

diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index c09b648dff2..25a1f16f012 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -74,12 +74,20 @@ struct X86MachineState {
      * will be translated to MSI messages in the address space.
      */
     AddressSpace *ioapic_as;
+
+    /*
+     * Ratelimit enforced on detected bus locks in guest.
+     * The default value of the bus_lock_ratelimit is 0 per second,
+     * which means no limitation on the guest's bus locks.
+     */
+    uint64_t bus_lock_ratelimit;
 };
 
 #define X86_MACHINE_SMM              "smm"
 #define X86_MACHINE_ACPI             "acpi"
 #define X86_MACHINE_OEM_ID           "x-oem-id"
 #define X86_MACHINE_OEM_TABLE_ID     "x-oem-table-id"
+#define X86_MACHINE_BUS_LOCK_RATELIMIT  "bus-lock-ratelimit"
 
 #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
 OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index ed796fe6bad..d30cf27e29f 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1246,6 +1246,23 @@ static void x86_machine_set_oem_table_id(Object *obj, const char *value,
     strncpy(x86ms->oem_table_id, value, 8);
 }
 
+static void x86_machine_get_bus_lock_ratelimit(Object *obj, Visitor *v,
+                                const char *name, void *opaque, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+    uint64_t bus_lock_ratelimit = x86ms->bus_lock_ratelimit;
+
+    visit_type_uint64(v, name, &bus_lock_ratelimit, errp);
+}
+
+static void x86_machine_set_bus_lock_ratelimit(Object *obj, Visitor *v,
+                               const char *name, void *opaque, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+
+    visit_type_uint64(v, name, &x86ms->bus_lock_ratelimit, errp);
+}
+
 static void x86_machine_initfn(Object *obj)
 {
     X86MachineState *x86ms = X86_MACHINE(obj);
@@ -1256,6 +1273,7 @@ static void x86_machine_initfn(Object *obj)
     x86ms->pci_irq_mask = ACPI_BUILD_PCI_IRQS;
     x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
+    x86ms->bus_lock_ratelimit = 0;
 }
 
 static void x86_machine_class_init(ObjectClass *oc, void *data)
@@ -1299,6 +1317,12 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
                                           "Override the default value of field OEM Table ID "
                                           "in ACPI table header."
                                           "The string may be up to 8 bytes in size");
+
+    object_class_property_add(oc, X86_MACHINE_BUS_LOCK_RATELIMIT, "uint64_t",
+                                x86_machine_get_bus_lock_ratelimit,
+                                x86_machine_set_bus_lock_ratelimit, NULL, NULL);
+    object_class_property_set_description(oc, X86_MACHINE_BUS_LOCK_RATELIMIT,
+            "Set the ratelimit for the bus locks acquired in VMs");
 }
 
 static const TypeInfo x86_machine_info = {
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index c676ee8b38a..ad950c3c273 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -132,6 +132,9 @@ static struct kvm_cpuid2 *cpuid_cache;
 static struct kvm_cpuid2 *hv_cpuid_cache;
 static struct kvm_msr_list *kvm_feature_msrs;
 
+#define BUS_LOCK_SLICE_TIME 1000000000ULL /* ns */
+static RateLimit bus_lock_ratelimit_ctrl;
+
 int kvm_has_pit_state2(void)
 {
     return has_pit_state2;
@@ -2312,6 +2315,28 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
 
+    if (object_dynamic_cast(OBJECT(ms), TYPE_X86_MACHINE)) {
+        X86MachineState *x86ms = X86_MACHINE(ms);
+
+        if (x86ms->bus_lock_ratelimit > 0) {
+            ret = kvm_check_extension(s, KVM_CAP_X86_BUS_LOCK_EXIT);
+            if (!(ret & KVM_BUS_LOCK_DETECTION_EXIT)) {
+                error_report("kvm: bus lock detection unsupported");
+                return -ENOTSUP;
+            }
+            ret = kvm_vm_enable_cap(s, KVM_CAP_X86_BUS_LOCK_EXIT, 0,
+                                    KVM_BUS_LOCK_DETECTION_EXIT);
+            if (ret < 0) {
+                error_report("kvm: Failed to enable bus lock detection cap: %s",
+                             strerror(-ret));
+                return ret;
+            }
+            ratelimit_init(&bus_lock_ratelimit_ctrl);
+            ratelimit_set_speed(&bus_lock_ratelimit_ctrl,
+                                x86ms->bus_lock_ratelimit, BUS_LOCK_SLICE_TIME);
+        }
+    }
+
     return 0;
 }
 
@@ -4266,6 +4291,15 @@ void kvm_arch_pre_run(CPUState *cpu, struct kvm_run *run)
     }
 }
 
+static void kvm_rate_limit_on_bus_lock(void)
+{
+    uint64_t delay_ns = ratelimit_calculate_delay(&bus_lock_ratelimit_ctrl, 1);
+
+    if (delay_ns) {
+        g_usleep(delay_ns / SCALE_US);
+    }
+}
+
 MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
@@ -4281,6 +4315,9 @@ MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
     } else {
         env->eflags &= ~IF_MASK;
     }
+    if (run->flags & KVM_RUN_X86_BUS_LOCK) {
+        kvm_rate_limit_on_bus_lock();
+    }
 
     /* We need to protect the apic state against concurrent accesses from
      * different threads in case the userspace irqchip is used. */
@@ -4639,6 +4676,10 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
         ioapic_eoi_broadcast(run->eoi.vector);
         ret = 0;
         break;
+    case KVM_EXIT_X86_BUS_LOCK:
+        /* already handled in kvm_arch_post_run */
+        ret = 0;
+        break;
     default:
         fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
         ret = -1;
-- 
2.31.1


