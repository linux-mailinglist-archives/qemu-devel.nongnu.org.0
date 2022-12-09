Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A51176480A8
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 11:10:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3a87-0002e0-5R; Fri, 09 Dec 2022 04:57:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00235e7d7be18c3eb674+7047+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p3a7P-0002Sk-CD
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:38 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00235e7d7be18c3eb674+7047+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p3a7J-0006pB-Vf
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=flWrjWYzkxwTO68CO6HkjZCMObvdp6ZDVLsoLqwfMLY=; b=uqyQ9RA8kZZWUbh1WZpjtKtklJ
 irHM44WZCV3chllazwA40/4RnyM2kzDnbUCpRWKzEo5hbmwiW45sTVndom2zsujsuKNwJDWap2n4/
 NvMoHk8gwoE4AFIxMj63VYpTFWZCwDxyQpkSt2u/VHSJ6f52BRagNmmh32wTQjmXrfUzgb1IV78yj
 mI4ifYX/3wS7FzpLkRxYSjtKKOpnhCCaPGgHx3StbzQxymVEKBT3c0IfbrFtQF3VNGsUIFKuvzvce
 9+zyWMVJdkCh+Oz9sXCiNy90UGUW9fNGgVDzCyWEg+6PDXyrERKxaG25RqaXA7XDZWlbG7vOBALZe
 ZD3bZLqw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p3a7G-007tiZ-Lc; Fri, 09 Dec 2022 09:56:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p3a78-002tZd-90; Fri, 09 Dec 2022 09:56:18 +0000
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
Subject: [RFC PATCH v2 20/22] i386/xen: HVMOP_set_param /
 HVM_PARAM_CALLBACK_IRQ
Date: Fri,  9 Dec 2022 09:56:10 +0000
Message-Id: <20221209095612.689243-21-dwmw2@infradead.org>
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

From: Ankur Arora <ankur.a.arora@oracle.com>

The HVM_PARAM_CALLBACK_IRQ parameter controls the system-wide event
channel upcall method.  The vector support is handled by KVM internally,
when the evtchn_upcall_pending field in the vcpu_info is set.

The GSI and PCI_INTX delivery methods are not supported. yet; those
need to simulate a level-triggered event on the I/OAPIC.

Add a 'xen_evtchn' device to host the migration state, as we'll shortly
be adding a full event channel table there too.

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[dwmw2: Rework for upstream kernel changes, split from per-VCPU vector]
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/meson.build  |   5 +-
 hw/i386/kvm/xen_evtchn.c | 117 +++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h |  13 +++++
 hw/i386/pc_piix.c        |   2 +
 target/i386/xen.c        |  44 +++++++++++++--
 5 files changed, 174 insertions(+), 7 deletions(-)
 create mode 100644 hw/i386/kvm/xen_evtchn.c
 create mode 100644 hw/i386/kvm/xen_evtchn.h

diff --git a/hw/i386/kvm/meson.build b/hw/i386/kvm/meson.build
index 6165cbf019..cab64df339 100644
--- a/hw/i386/kvm/meson.build
+++ b/hw/i386/kvm/meson.build
@@ -4,6 +4,9 @@ i386_kvm_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c'))
 i386_kvm_ss.add(when: 'CONFIG_I8254', if_true: files('i8254.c'))
 i386_kvm_ss.add(when: 'CONFIG_I8259', if_true: files('i8259.c'))
 i386_kvm_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
-i386_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files('xen_overlay.c'))
+i386_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files(
+  'xen_overlay.c',
+  'xen_evtchn.c',
+  ))
 
 i386_ss.add_all(when: 'CONFIG_KVM', if_true: i386_kvm_ss)
diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
new file mode 100644
index 0000000000..1ca0c034e7
--- /dev/null
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -0,0 +1,117 @@
+/*
+ * QEMU Xen emulation: Shared/overlay pages support
+ *
+ * Copyright © 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * Authors: David Woodhouse <dwmw2@infradead.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/host-utils.h"
+#include "qemu/module.h"
+#include "qemu/main-loop.h"
+#include "qapi/error.h"
+#include "qom/object.h"
+#include "exec/target_page.h"
+#include "exec/address-spaces.h"
+#include "migration/vmstate.h"
+
+#include "hw/sysbus.h"
+#include "hw/xen/xen.h"
+#include "xen_evtchn.h"
+
+#include "sysemu/kvm.h"
+#include <linux/kvm.h>
+
+#include "standard-headers/xen/memory.h"
+#include "standard-headers/xen/hvm/params.h"
+
+#define TYPE_XEN_EVTCHN "xenevtchn"
+OBJECT_DECLARE_SIMPLE_TYPE(XenEvtchnState, XEN_EVTCHN)
+
+struct XenEvtchnState {
+    /*< private >*/
+    SysBusDevice busdev;
+    /*< public >*/
+
+    uint64_t callback_param;
+};
+
+struct XenEvtchnState *xen_evtchn_singleton;
+
+static int xen_evtchn_post_load(void *opaque, int version_id)
+{
+    XenEvtchnState *s = opaque;
+
+    if (s->callback_param) {
+        xen_evtchn_set_callback_param(s->callback_param);
+    }
+
+    return 0;
+}
+
+static bool xen_evtchn_is_needed(void *opaque)
+{
+    return xen_mode == XEN_EMULATE;
+}
+
+static const VMStateDescription xen_evtchn_vmstate = {
+    .name = "xen_evtchn",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = xen_evtchn_is_needed,
+    .post_load = xen_evtchn_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(callback_param, XenEvtchnState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void xen_evtchn_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &xen_evtchn_vmstate;
+}
+
+static const TypeInfo xen_evtchn_info = {
+    .name          = TYPE_XEN_EVTCHN,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XenEvtchnState),
+    .class_init    = xen_evtchn_class_init,
+};
+
+void xen_evtchn_create(void)
+{
+    xen_evtchn_singleton = XEN_EVTCHN(sysbus_create_simple(TYPE_XEN_EVTCHN, -1, NULL));
+}
+
+static void xen_evtchn_register_types(void)
+{
+    type_register_static(&xen_evtchn_info);
+}
+
+type_init(xen_evtchn_register_types)
+
+
+#define CALLBACK_VIA_TYPE_SHIFT       56
+
+int xen_evtchn_set_callback_param(uint64_t param)
+{
+    int ret = -ENOSYS;
+
+    if (param >> CALLBACK_VIA_TYPE_SHIFT == HVM_PARAM_CALLBACK_TYPE_VECTOR) {
+        struct kvm_xen_hvm_attr xa = {
+            .type = KVM_XEN_ATTR_TYPE_UPCALL_VECTOR,
+            .u.vector = (uint8_t)param,
+        };
+
+        ret = kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &xa);
+        if (!ret && xen_evtchn_singleton)
+            xen_evtchn_singleton->callback_param = param;
+    }
+    return ret;
+}
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
new file mode 100644
index 0000000000..11c6ed22a0
--- /dev/null
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -0,0 +1,13 @@
+/*
+ * QEMU Xen emulation: Event channel support
+ *
+ * Copyright © 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * Authors: David Woodhouse <dwmw2@infradead.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+void xen_evtchn_create(void);
+int xen_evtchn_set_callback_param(uint64_t param);
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index c3c61eedde..18540084a0 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -60,6 +60,7 @@
 #endif
 #ifdef CONFIG_XEN_EMU
 #include "hw/i386/kvm/xen_overlay.h"
+#include "hw/i386/kvm/xen_evtchn.h"
 #endif
 #include "migration/global_state.h"
 #include "migration/misc.h"
@@ -417,6 +418,7 @@ static void pc_xen_hvm_init(MachineState *machine)
 #ifdef CONFIG_XEN_EMU
     if (xen_mode == XEN_EMULATE) {
             xen_overlay_create();
+            xen_evtchn_create();
     }
 #endif
 }
diff --git a/target/i386/xen.c b/target/i386/xen.c
index 2583c00a6b..1af336d9e5 100644
--- a/target/i386/xen.c
+++ b/target/i386/xen.c
@@ -16,6 +16,8 @@
 #include "xen.h"
 #include "trace.h"
 #include "hw/i386/kvm/xen_overlay.h"
+#include "hw/i386/kvm/xen_evtchn.h"
+
 #include "standard-headers/xen/version.h"
 #include "standard-headers/xen/memory.h"
 #include "standard-headers/xen/hvm/hvm_op.h"
@@ -287,24 +289,53 @@ static bool kvm_xen_hcall_memory_op(struct kvm_xen_exit *exit,
     return true;
 }
 
+static int handle_set_param(struct kvm_xen_exit *exit, X86CPU *cpu,
+                            uint64_t arg)
+{
+    CPUState *cs = CPU(cpu);
+    struct xen_hvm_param hp;
+    int err = 0;
+
+    if (kvm_copy_from_gva(cs, arg, &hp, sizeof(hp))) {
+        err = -EFAULT;
+        goto out;
+    }
+
+    if (hp.domid != DOMID_SELF) {
+        err = -EINVAL;
+        goto out;
+    }
+
+    switch (hp.index) {
+    case HVM_PARAM_CALLBACK_IRQ:
+        err = xen_evtchn_set_callback_param(hp.value);
+        break;
+    default:
+        return false;
+    }
+
+out:
+    exit->u.hcall.result = err;
+    return true;
+}
+
 static int kvm_xen_hcall_evtchn_upcall_vector(struct kvm_xen_exit *exit,
                                               X86CPU *cpu, uint64_t arg)
 {
-    struct xen_hvm_evtchn_upcall_vector *up;
+    struct xen_hvm_evtchn_upcall_vector up;
     CPUState *target_cs;
     int vector;
 
-    up = gva_to_hva(CPU(cpu), arg);
-    if (!up) {
+    if (kvm_copy_from_gva(CPU(cpu), arg, &up, sizeof(up))) {
         return -EFAULT;
     }
 
-    vector = up->vector;
+    vector = up.vector;
     if (vector < 0x10) {
         return -EINVAL;
     }
 
-    target_cs = qemu_get_cpu(up->vcpu);
+    target_cs = qemu_get_cpu(up.vcpu);
     if (!target_cs) {
         return -EINVAL;
     }
@@ -325,7 +356,8 @@ static bool kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     case HVMOP_pagetable_dying:
             ret = -ENOSYS;
             break;
-
+    case HVMOP_set_param:
+            return handle_set_param(exit, cpu, arg);
     default:
             return false;
     }
-- 
2.35.3


