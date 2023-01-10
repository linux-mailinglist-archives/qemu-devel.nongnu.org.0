Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EA26640A1
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 13:37:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFDdE-0007FT-T6; Tue, 10 Jan 2023 07:21:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+6ce08bad6b360d6d5e23+7079+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pFDcj-00076X-8m
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 07:21:01 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+6ce08bad6b360d6d5e23+7079+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pFDcf-0000RS-3A
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 07:21:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=depuP2UFZVz6LKpmad+mpUkHRYhUfsg5newIxCrarqo=; b=V2sGJu7QE3bhjcdzxaL/OKM1ce
 aw4GBI3ZOO0BSJvcDeW7lqeF6U9/y8usXeo9bu23puU0bvgBb8pFfTW9NRuoq3J+0WSiztWrlaCWF
 G8uVaEjy8C2fhsymdaMM1CP1WOrjcIUG9He7PQyjFZozwC57mwwfx9pnrR4HffJhbaLD+ezLvVpVM
 BT+l8EgIi0QdPpsP+VEOwMUW4/H4wZH8CbyJr50BPe5YaqVpxVLQpKRTewF+RTmxmv2btlwT255Y/
 w+m2nzESHzgoSI4p/If3kEFIQNIykJpI4/9/syP7D+/gOH+0dZf4vFBCsBFpLklHBiOsqy0RvZtmC
 GGsFlsYg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pFDcM-0037tj-1s; Tue, 10 Jan 2023 12:20:44 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pFDcT-006Yem-0D; Tue, 10 Jan 2023 12:20:45 +0000
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
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
Subject: [PATCH v6 26/51] hw/xen: Add xen_evtchn device for event channel
 emulation
Date: Tue, 10 Jan 2023 12:20:17 +0000
Message-Id: <20230110122042.1562155-27-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230110122042.1562155-1-dwmw2@infradead.org>
References: <20230110122042.1562155-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+6ce08bad6b360d6d5e23+7079+infradead.org+dwmw2@desiato.srs.infradead.org;
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

Include basic support for setting HVM_PARAM_CALLBACK_IRQ to the global
vector method HVM_PARAM_CALLBACK_TYPE_VECTOR, which is handled in-kernel
by raising the vector whenever the vCPU's vcpu_info->evtchn_upcall_pending
flag is set.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/meson.build   |   5 +-
 hw/i386/kvm/xen_evtchn.c  | 148 ++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |  18 +++++
 hw/i386/pc.c              |   2 +
 target/i386/kvm/xen-emu.c |  10 +++
 5 files changed, 182 insertions(+), 1 deletion(-)
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
index 0000000000..018f4ef4da
--- /dev/null
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -0,0 +1,148 @@
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
+#include "sysemu/kvm_xen.h"
+#include <linux/kvm.h>
+
+#include "standard-headers/xen/memory.h"
+#include "standard-headers/xen/hvm/params.h"
+
+#define TYPE_XEN_EVTCHN "xen-evtchn"
+OBJECT_DECLARE_SIMPLE_TYPE(XenEvtchnState, XEN_EVTCHN)
+
+struct XenEvtchnState {
+    /*< private >*/
+    SysBusDevice busdev;
+    /*< public >*/
+
+    uint64_t callback_param;
+    bool evtchn_in_kernel;
+
+    QemuMutex port_lock;
+};
+
+struct XenEvtchnState *xen_evtchn_singleton;
+
+/* Top bits of callback_param are the type (HVM_PARAM_CALLBACK_TYPE_xxx) */
+#define CALLBACK_VIA_TYPE_SHIFT 56
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
+    XenEvtchnState *s = XEN_EVTCHN(sysbus_create_simple(TYPE_XEN_EVTCHN,
+                                                        -1, NULL));
+    xen_evtchn_singleton = s;
+
+    qemu_mutex_init(&s->port_lock);
+}
+
+static void xen_evtchn_register_types(void)
+{
+    type_register_static(&xen_evtchn_info);
+}
+
+type_init(xen_evtchn_register_types)
+
+int xen_evtchn_set_callback_param(uint64_t param)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    bool in_kernel = false;
+    int ret;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    switch (param >> CALLBACK_VIA_TYPE_SHIFT) {
+    case HVM_PARAM_CALLBACK_TYPE_VECTOR: {
+        struct kvm_xen_hvm_attr xa = {
+            .type = KVM_XEN_ATTR_TYPE_UPCALL_VECTOR,
+            .u.vector = (uint8_t)param,
+        };
+
+        ret = kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &xa);
+        if (!ret && kvm_xen_has_cap(EVTCHN_SEND)) {
+            in_kernel = true;
+        }
+        break;
+    }
+    default:
+        ret = -ENOSYS;
+        break;
+    }
+
+    if (!ret) {
+        s->callback_param = param;
+        s->evtchn_in_kernel = in_kernel;
+    }
+
+    qemu_mutex_unlock(&s->port_lock);
+
+    return ret;
+}
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
new file mode 100644
index 0000000000..c9b7f9d11f
--- /dev/null
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -0,0 +1,18 @@
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
+#ifndef QEMU_XEN_EVTCHN_H
+#define QEMU_XEN_EVTCHN_H
+
+void xen_evtchn_create(void);
+int xen_evtchn_set_callback_param(uint64_t param);
+
+#endif /* QEMU_XEN_EVTCHN_H */
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 0ddae2f6ad..8f668a5138 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -90,6 +90,7 @@
 #include "hw/virtio/virtio-pmem-pci.h"
 #include "hw/virtio/virtio-mem-pci.h"
 #include "hw/i386/kvm/xen_overlay.h"
+#include "hw/i386/kvm/xen_evtchn.h"
 #include "hw/mem/memory-device.h"
 #include "sysemu/replay.h"
 #include "target/i386/cpu.h"
@@ -1850,6 +1851,7 @@ int pc_machine_kvm_type(MachineState *machine, const char *kvm_type)
 #ifdef CONFIG_XEN_EMU
     if (xen_mode == XEN_EMULATE) {
         xen_overlay_create();
+        xen_evtchn_create();
     }
 #endif
     return 0;
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index a27facb90f..42e65573de 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -21,6 +21,7 @@
 #include "sysemu/runstate.h"
 
 #include "hw/i386/kvm/xen_overlay.h"
+#include "hw/i386/kvm/xen_evtchn.h"
 
 #include "standard-headers/xen/version.h"
 #include "standard-headers/xen/sched.h"
@@ -507,6 +508,10 @@ static bool handle_set_param(struct kvm_xen_exit *exit, X86CPU *cpu,
     }
 
     switch (hp.index) {
+    case HVM_PARAM_CALLBACK_IRQ:
+        err = xen_evtchn_set_callback_param(hp.value);
+        xen_set_long_mode(exit->u.hcall.longmode);
+        break;
     default:
         return false;
     }
@@ -709,6 +714,11 @@ static int kvm_xen_soft_reset(void)
     CPUState *cpu;
     int err;
 
+    err = xen_evtchn_set_callback_param(0);
+    if (err) {
+        return err;
+    }
+
     CPU_FOREACH(cpu) {
         async_run_on_cpu(cpu, do_vcpu_soft_reset, RUN_ON_CPU_NULL);
     }
-- 
2.35.3


