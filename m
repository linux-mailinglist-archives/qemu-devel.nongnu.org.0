Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090F36480AD
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 11:12:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3a8K-0002gY-V5; Fri, 09 Dec 2022 04:57:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00235e7d7be18c3eb674+7047+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p3a7U-0002TB-Hk
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:41 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00235e7d7be18c3eb674+7047+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p3a7Q-0006qg-K5
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=oV/8182zcImY/7Qa/FeC8p0iV5FEIwdb+SCiT7V3HWk=; b=HNi0YFdmTaTIQJ8EiTX9es+uS7
 GYT6VlEl3WMjbG/m4GvtfrJXbVx/nxN1ueAPWioAtNBbuKQAngGo1UHUheommQgmBIeZgUOs31lHt
 z+S0e8PFBBmomYgp1WZeiIlyTmUF8RCd7LVhA+fPVwC75dHxv4LrLytmiRU8pV6fIxLPCAUCwp7E5
 HAbsxI/Bu3/O4F9QGZ70K0r3PAljzNji73f+ukfabQ2Pfa/9lEFZUwNJuvk9TATMSR2+V3zzURyId
 OyBBeHoaSuBixRfuUgdBqfKa9c3EqpdnadbSUhgnvAy8F700VRzoH3PYp9RKye9hZpIVuttCMT0xz
 JBCnUohQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p3a7G-007tiL-5g; Fri, 09 Dec 2022 09:56:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p3a77-002tYM-Pq; Fri, 09 Dec 2022 09:56:17 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Subject: [RFC PATCH v2 03/22] i386/xen: Add xen-version machine property and
 init KVM Xen support
Date: Fri,  9 Dec 2022 09:55:53 +0000
Message-Id: <20221209095612.689243-4-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221209095612.689243-1-dwmw2@infradead.org>
References: <20221209095612.689243-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+00235e7d7be18c3eb674+7047+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: David Woodhouse <dwmw@amazon.co.uk>

This is a machine property for two main reasons. One is that it allows
us to set it in default_machine_opts for the xenfv platform when not
running on actual Xen. The other is that theoretically we *could* do
this with TCG too; we'd just have to implement a bunch of the stuff that
KVM already does for us.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/pc.c            | 32 +++++++++++++++++++++++++++
 hw/i386/pc_piix.c       | 10 +++++++--
 include/hw/i386/pc.h    |  3 +++
 target/i386/kvm/kvm.c   | 26 ++++++++++++++++++++++
 target/i386/meson.build |  1 +
 target/i386/xen.c       | 49 +++++++++++++++++++++++++++++++++++++++++
 target/i386/xen.h       | 19 ++++++++++++++++
 7 files changed, 138 insertions(+), 2 deletions(-)
 create mode 100644 target/i386/xen.c
 create mode 100644 target/i386/xen.h

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 546b703cb4..9bada1a8ff 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1811,6 +1811,32 @@ static void pc_machine_set_max_fw_size(Object *obj, Visitor *v,
     pcms->max_fw_size = value;
 }
 
+static void pc_machine_get_xen_version(Object *obj, Visitor *v,
+                                       const char *name, void *opaque,
+                                       Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+    uint32_t value = pcms->xen_version;
+
+    visit_type_uint32(v, name, &value, errp);
+}
+
+static void pc_machine_set_xen_version(Object *obj, Visitor *v,
+                                       const char *name, void *opaque,
+                                       Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+    Error *error = NULL;
+    uint32_t value;
+
+    visit_type_uint32(v, name, &value, &error);
+    if (error) {
+        error_propagate(errp, error);
+        return;
+    }
+
+    pcms->xen_version = value;
+}
 
 static void pc_machine_initfn(Object *obj)
 {
@@ -1978,6 +2004,12 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
         NULL, NULL);
     object_class_property_set_description(oc, PC_MACHINE_SMBIOS_EP,
         "SMBIOS Entry Point type [32, 64]");
+
+    object_class_property_add(oc, "xen-version", "uint32",
+        pc_machine_get_xen_version, pc_machine_set_xen_version,
+        NULL, NULL);
+    object_class_property_set_description(oc, "xen-version",
+        "Xen version to be emulated (in XENVER_version form e.g. 0x4000a for 4.10)");
 }
 
 static const TypeInfo pc_machine_info = {
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 0ad0ed1603..13286d0739 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -876,7 +876,10 @@ static void xenfv_4_2_machine_options(MachineClass *m)
     pc_i440fx_4_2_machine_options(m);
     m->desc = "Xen Fully-virtualized PC";
     m->max_cpus = HVM_MAX_VCPUS;
-    m->default_machine_opts = "accel=xen,suppress-vmdesc=on";
+    if (xen_enabled())
+            m->default_machine_opts = "accel=xen,suppress-vmdesc=on";
+    else
+            m->default_machine_opts = "accel=kvm,xen-version=0x40002";
 }
 
 DEFINE_PC_MACHINE(xenfv_4_2, "xenfv-4.2", pc_xen_hvm_init,
@@ -888,7 +891,10 @@ static void xenfv_3_1_machine_options(MachineClass *m)
     m->desc = "Xen Fully-virtualized PC";
     m->alias = "xenfv";
     m->max_cpus = HVM_MAX_VCPUS;
-    m->default_machine_opts = "accel=xen,suppress-vmdesc=on";
+    if (xen_enabled())
+            m->default_machine_opts = "accel=xen,suppress-vmdesc=on";
+    else
+            m->default_machine_opts = "accel=kvm,xen-version=0x30001";
 }
 
 DEFINE_PC_MACHINE(xenfv, "xenfv-3.1", pc_xen_hvm_init,
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index c95333514e..9b14b18836 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -52,6 +52,9 @@ typedef struct PCMachineState {
     bool default_bus_bypass_iommu;
     uint64_t max_fw_size;
 
+    /* Xen HVM emulation */
+    uint32_t xen_version;
+
     /* ACPI Memory hotplug IO base address */
     hwaddr memhp_io_base;
 
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index a213209379..0a2069b117 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -31,6 +31,7 @@
 #include "sysemu/runstate.h"
 #include "kvm_i386.h"
 #include "sev.h"
+#include "xen.h"
 #include "hyperv.h"
 #include "hyperv-proto.h"
 
@@ -774,6 +775,17 @@ static inline bool freq_within_bounds(int freq, int target_freq)
         return false;
 }
 
+static uint32_t kvm_arch_xen_version(MachineState *ms)
+{
+    uint32_t v = object_property_get_int(OBJECT(ms), "xen-version", NULL);
+
+    /* If it was unset, return zero */
+    if (v == (uint32_t) -1)
+            return 0;
+
+    return v;
+}
+
 static int kvm_arch_set_tsc_khz(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -2459,6 +2471,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
 {
     uint64_t identity_base = 0xfffbc000;
     uint64_t shadow_mem;
+    uint32_t xen_version;
     int ret;
     struct utsname utsname;
     Error *local_err = NULL;
@@ -2513,6 +2526,19 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
 
+    xen_version = kvm_arch_xen_version(ms);
+    if (xen_version) {
+#ifdef CONFIG_XEN_EMU
+            ret = kvm_xen_init(s, xen_version);
+            if (ret < 0) {
+                    return ret;
+            }
+#else
+            error_report("kvm: Xen support not enabled in qemu");
+            return -ENOTSUP;
+#endif
+    }
+
     ret = kvm_get_supported_msrs(s);
     if (ret < 0) {
         return ret;
diff --git a/target/i386/meson.build b/target/i386/meson.build
index ae38dc9563..9f3ef246b8 100644
--- a/target/i386/meson.build
+++ b/target/i386/meson.build
@@ -7,6 +7,7 @@ i386_ss.add(files(
   'cpu-dump.c',
 ))
 i386_ss.add(when: 'CONFIG_SEV', if_true: files('host-cpu.c'))
+i386_ss.add(when: 'CONFIG_XEN_EMU', if_true: files('xen.c'))
 
 # x86 cpu type
 i386_ss.add(when: 'CONFIG_KVM', if_true: files('host-cpu.c'))
diff --git a/target/i386/xen.c b/target/i386/xen.c
new file mode 100644
index 0000000000..bc183dce4e
--- /dev/null
+++ b/target/i386/xen.c
@@ -0,0 +1,49 @@
+/*
+ * Xen HVM emulation support in KVM
+ *
+ * Copyright © 2019 Oracle and/or its affiliates. All rights reserved.
+ * Copyright © 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "kvm/kvm_i386.h"
+#include "xen.h"
+
+int kvm_xen_init(KVMState *s, uint32_t xen_version)
+{
+    const int required_caps = KVM_XEN_HVM_CONFIG_HYPERCALL_MSR |
+        KVM_XEN_HVM_CONFIG_INTERCEPT_HCALL | KVM_XEN_HVM_CONFIG_SHARED_INFO;
+    struct kvm_xen_hvm_config cfg = {
+        .msr = XEN_HYPERCALL_MSR,
+        .flags = KVM_XEN_HVM_CONFIG_INTERCEPT_HCALL,
+    };
+    int xen_caps, ret;
+
+    xen_caps = kvm_check_extension(s, KVM_CAP_XEN_HVM);
+    if (required_caps & ~xen_caps) {
+        error_report("kvm: Xen HVM guest support not present or insufficient");
+        return -ENOSYS;
+    }
+
+    if (xen_caps & KVM_XEN_HVM_CONFIG_EVTCHN_SEND) {
+        struct kvm_xen_hvm_attr ha = {
+            .type = KVM_XEN_ATTR_TYPE_XEN_VERSION,
+            .u.xen_version = xen_version,
+        };
+        (void)kvm_vm_ioctl(s, KVM_XEN_HVM_SET_ATTR, &ha);
+
+        cfg.flags |= KVM_XEN_HVM_CONFIG_EVTCHN_SEND;
+    }
+
+    ret = kvm_vm_ioctl(s, KVM_XEN_HVM_CONFIG, &cfg);
+    if (ret < 0) {
+        error_report("kvm: Failed to enable Xen HVM support: %s", strerror(-ret));
+        return ret;
+    }
+
+    return 0;
+}
diff --git a/target/i386/xen.h b/target/i386/xen.h
new file mode 100644
index 0000000000..6c4f3b7822
--- /dev/null
+++ b/target/i386/xen.h
@@ -0,0 +1,19 @@
+/*
+ * Xen HVM emulation support in KVM
+ *
+ * Copyright © 2019 Oracle and/or its affiliates. All rights reserved.
+ * Copyright © 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef QEMU_I386_XEN_H
+#define QEMU_I386_XEN_H
+
+#define XEN_HYPERCALL_MSR 0x40000000
+
+int kvm_xen_init(KVMState *s, uint32_t xen_version);
+
+#endif /* QEMU_I386_XEN_H */
-- 
2.35.3


