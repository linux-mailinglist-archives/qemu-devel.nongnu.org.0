Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8712B6A6D7A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 14:54:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXMto-0000xd-1o; Wed, 01 Mar 2023 08:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1cb70579e185fe7dd8a8+7129+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pXMst-0008PO-Ge
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:52:44 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1cb70579e185fe7dd8a8+7129+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pXMsn-0002nP-PU
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:52:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=MDCUU7fSHggQgXZS8avBHweuCi2p06tKCPvswNAq8hI=; b=RJFWJT1fPnI3LaEUpTZODG3dgt
 9TLezg9CrIZDYyohlYMmubNxF55iVE+o1KHi4Y4ghbuTMHOdL/3jTEi2/47jYUjFvNxsu4Px0Ur78
 Rr768TJc3CRjnoxr6bf/q0PFHL7eLhRNHEmhX+R3FmLG8k/f+i1kxczhJIdTiIbQd/vsbFT2dCL32
 BYU/QVCfpz0JN48EgP7Y98ZLOy0Xwt3l6dhKikUVFM0ACr4CxZIK9Ht5a/y/TULJ/BcCBaXByS7rE
 7/P/RzMTmzSmHh7IhEF2cZh47OmgrUdetL+e6RD8T2tVF+3u9ZrA0pwh867ml1CkFhOZDEjWM6d79
 Dg8VXCcg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pXMsb-00EuVV-2B; Wed, 01 Mar 2023 13:52:30 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXMsb-0049Tp-1n; Wed, 01 Mar 2023 13:52:25 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com
Subject: [PATCH v15 04/60] i386/kvm: Add xen-version KVM accelerator property
 and init KVM Xen support
Date: Wed,  1 Mar 2023 13:51:27 +0000
Message-Id: <20230301135223.988336-5-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230301135223.988336-1-dwmw2@infradead.org>
References: <20230301135223.988336-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+1cb70579e185fe7dd8a8+7129+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
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

This just initializes the basic Xen support in KVM for now. Only permitted
on TYPE_PC_MACHINE because that's where the sysbus devices for Xen heap
overlay, event channel, grant tables and other stuff will exist. There's
no point having the basic hypercall support if nothing else works.

Provide sysemu/kvm_xen.h and a kvm_xen_get_caps() which will be used
later by support devices.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 accel/kvm/kvm-all.c         |  1 +
 include/sysemu/kvm_int.h    |  2 ++
 include/sysemu/kvm_xen.h    | 20 +++++++++++++
 target/i386/kvm/kvm.c       | 59 +++++++++++++++++++++++++++++++++++++
 target/i386/kvm/meson.build |  2 ++
 target/i386/kvm/xen-emu.c   | 58 ++++++++++++++++++++++++++++++++++++
 target/i386/kvm/xen-emu.h   | 19 ++++++++++++
 7 files changed, 161 insertions(+)
 create mode 100644 include/sysemu/kvm_xen.h
 create mode 100644 target/i386/kvm/xen-emu.c
 create mode 100644 target/i386/kvm/xen-emu.h

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 86f7523833..511d3eb9a0 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3703,6 +3703,7 @@ static void kvm_accel_instance_init(Object *obj)
     s->kvm_dirty_ring_size = 0;
     s->notify_vmexit = NOTIFY_VMEXIT_OPTION_RUN;
     s->notify_window = 0;
+    s->xen_version = 0;
 }
 
 /**
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index 60b520a13e..7f945bc763 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -118,6 +118,8 @@ struct KVMState
     struct KVMDirtyRingReaper reaper;
     NotifyVmexitOption notify_vmexit;
     uint32_t notify_window;
+    uint32_t xen_version;
+    uint32_t xen_caps;
 };
 
 void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
diff --git a/include/sysemu/kvm_xen.h b/include/sysemu/kvm_xen.h
new file mode 100644
index 0000000000..296533f2d5
--- /dev/null
+++ b/include/sysemu/kvm_xen.h
@@ -0,0 +1,20 @@
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
+#ifndef QEMU_SYSEMU_KVM_XEN_H
+#define QEMU_SYSEMU_KVM_XEN_H
+
+uint32_t kvm_xen_get_caps(void);
+
+#define kvm_xen_has_cap(cap) (!!(kvm_xen_get_caps() &           \
+                                 KVM_XEN_HVM_CONFIG_ ## cap))
+
+#endif /* QEMU_SYSEMU_KVM_XEN_H */
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index d18bd2f3e8..da7342630c 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -31,6 +31,7 @@
 #include "sysemu/runstate.h"
 #include "kvm_i386.h"
 #include "sev.h"
+#include "xen-emu.h"
 #include "hyperv.h"
 #include "hyperv-proto.h"
 
@@ -42,6 +43,7 @@
 #include "qemu/error-report.h"
 #include "qemu/memalign.h"
 #include "hw/i386/x86.h"
+#include "hw/i386/pc.h"
 #include "hw/i386/apic.h"
 #include "hw/i386/apic_internal.h"
 #include "hw/i386/apic-msidef.h"
@@ -49,6 +51,8 @@
 #include "hw/i386/x86-iommu.h"
 #include "hw/i386/e820_memory_layout.h"
 
+#include "hw/xen/xen.h"
+
 #include "hw/pci/pci.h"
 #include "hw/pci/msi.h"
 #include "hw/pci/msix.h"
@@ -2529,6 +2533,22 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
 
+    if (s->xen_version) {
+#ifdef CONFIG_XEN_EMU
+        if (!object_dynamic_cast(OBJECT(ms), TYPE_PC_MACHINE)) {
+            error_report("kvm: Xen support only available in PC machine");
+            return -ENOTSUP;
+        }
+        ret = kvm_xen_init(s);
+        if (ret < 0) {
+            return ret;
+        }
+#else
+        error_report("kvm: Xen support not enabled in qemu");
+        return -ENOTSUP;
+#endif
+    }
+
     ret = kvm_get_supported_msrs(s);
     if (ret < 0) {
         return ret;
@@ -5719,6 +5739,36 @@ static void kvm_arch_set_notify_window(Object *obj, Visitor *v,
     s->notify_window = value;
 }
 
+static void kvm_arch_get_xen_version(Object *obj, Visitor *v,
+                                     const char *name, void *opaque,
+                                     Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+    uint32_t value = s->xen_version;
+
+    visit_type_uint32(v, name, &value, errp);
+}
+
+static void kvm_arch_set_xen_version(Object *obj, Visitor *v,
+                                     const char *name, void *opaque,
+                                     Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+    Error *error = NULL;
+    uint32_t value;
+
+    visit_type_uint32(v, name, &value, &error);
+    if (error) {
+        error_propagate(errp, error);
+        return;
+    }
+
+    s->xen_version = value;
+    if (value && xen_mode == XEN_DISABLED) {
+        xen_mode = XEN_EMULATE;
+    }
+}
+
 void kvm_arch_accel_class_init(ObjectClass *oc)
 {
     object_class_property_add_enum(oc, "notify-vmexit", "NotifyVMexitOption",
@@ -5735,6 +5785,15 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
     object_class_property_set_description(oc, "notify-window",
                                           "Clock cycles without an event window "
                                           "after which a notification VM exit occurs");
+
+    object_class_property_add(oc, "xen-version", "uint32",
+                              kvm_arch_get_xen_version,
+                              kvm_arch_set_xen_version,
+                              NULL, NULL);
+    object_class_property_set_description(oc, "xen-version",
+                                          "Xen version to be emulated "
+                                          "(in XENVER_version form "
+                                          "e.g. 0x4000a for 4.10)");
 }
 
 void kvm_set_max_apic_id(uint32_t max_apic_id)
diff --git a/target/i386/kvm/meson.build b/target/i386/kvm/meson.build
index 736df8b72e..322272091b 100644
--- a/target/i386/kvm/meson.build
+++ b/target/i386/kvm/meson.build
@@ -7,6 +7,8 @@ i386_softmmu_kvm_ss.add(files(
   'kvm-cpu.c',
 ))
 
+i386_softmmu_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files('xen-emu.c'))
+
 i386_softmmu_kvm_ss.add(when: 'CONFIG_SEV', if_false: files('sev-stub.c'))
 
 i386_softmmu_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'), if_false: files('hyperv-stub.c'))
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
new file mode 100644
index 0000000000..b556d903aa
--- /dev/null
+++ b/target/i386/kvm/xen-emu.c
@@ -0,0 +1,58 @@
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
+#include "sysemu/kvm_int.h"
+#include "sysemu/kvm_xen.h"
+#include "kvm/kvm_i386.h"
+#include "xen-emu.h"
+
+int kvm_xen_init(KVMState *s)
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
+            .u.xen_version = s->xen_version,
+        };
+        (void)kvm_vm_ioctl(s, KVM_XEN_HVM_SET_ATTR, &ha);
+
+        cfg.flags |= KVM_XEN_HVM_CONFIG_EVTCHN_SEND;
+    }
+
+    ret = kvm_vm_ioctl(s, KVM_XEN_HVM_CONFIG, &cfg);
+    if (ret < 0) {
+        error_report("kvm: Failed to enable Xen HVM support: %s",
+                     strerror(-ret));
+        return ret;
+    }
+
+    s->xen_caps = xen_caps;
+    return 0;
+}
+
+uint32_t kvm_xen_get_caps(void)
+{
+    return kvm_state->xen_caps;
+}
diff --git a/target/i386/kvm/xen-emu.h b/target/i386/kvm/xen-emu.h
new file mode 100644
index 0000000000..4f31bd96cb
--- /dev/null
+++ b/target/i386/kvm/xen-emu.h
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
+#ifndef QEMU_I386_KVM_XEN_EMU_H
+#define QEMU_I386_KVM_XEN_EMU_H
+
+#define XEN_HYPERCALL_MSR 0x40000000
+
+int kvm_xen_init(KVMState *s);
+
+#endif /* QEMU_I386_KVM_XEN_EMU_H */
-- 
2.39.0


