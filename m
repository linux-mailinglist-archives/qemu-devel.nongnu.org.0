Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C56F56A82EC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:57:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi6f-0001xi-Tb; Thu, 02 Mar 2023 07:32:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6I-0001MB-Gr
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6G-0003DE-LH
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/f4n0heKtlgxIGlurgOyqNgr90o1E7VyUCI3AaHXJrE=;
 b=BsY2VAEGqKfizpzBr/Uhlkr5iKww7X6xw1yytpride4SNU7ufsQPSoj8Yy23UM0rsiZC2V
 /T3v6zDJRYTzMWxiFoM8cwlToTPpIRy3aGW3kfjetlL6mFie3eeP8UuNG1XS1hFvJcbXxU
 wf9ZrIBtVsWOPNjGNrZqt9WFDpJz/bE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-193-eLtvNPgPPv-352Q-eX1J4A-1; Thu, 02 Mar 2023 07:31:55 -0500
X-MC-Unique: eLtvNPgPPv-352Q-eX1J4A-1
Received: by mail-wm1-f71.google.com with SMTP id
 bi21-20020a05600c3d9500b003e836e354e0so1014454wmb.5
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:31:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/f4n0heKtlgxIGlurgOyqNgr90o1E7VyUCI3AaHXJrE=;
 b=Vp89H9+fY23jWTv5CZQPGlU/jFMCZOC2j5cvrJuPvGxexZVQW4jg0seLVynb8pvJ9s
 +QJNUkLMOJA/9N5Wphifciv6/b8SP4eQHIsu6+x+XQX64pctVejcNk/+CshzkWY9+a2a
 KMlPv4jAkK4QC2MSQIRe28hGC8BpSoR2yfIpXzw2i38ukpqWmPg/y15s6WwgNYp3NdQi
 DwufbXAYSLCSWDb+KhhH1+/wLrDVInspo+a0xHLTjNPcS2x2Jy594OBwWCmxgBl3vSyM
 Uome68FKKYxtK5tiIRgw3PIoH89SAL6cuQ3xYsq0Nni9Uyg1L+fDByN2UkfJ+3qo+0X/
 a5Tw==
X-Gm-Message-State: AO0yUKUTHD1eOx06E5cTnIy0zrmXfdJNv0hfomLGh2uVBgMHhoJezuXH
 mqV8lB/3gOxEnTjt89XWxPAmRtEC/edRXEV1WOevpq4JsiJAUP9+pS0JzADUxAkgpLXPwHlgIWm
 deyplGJBNaI6O9jKqI1lkhbTzxxEQ7HamWsht4ZEurF/bSuov2KT9YNw+Xxh4aAriXyy3Kfgsb/
 8=
X-Received: by 2002:a5d:5101:0:b0:2cc:4dac:fe39 with SMTP id
 s1-20020a5d5101000000b002cc4dacfe39mr6800579wrt.12.1677760313456; 
 Thu, 02 Mar 2023 04:31:53 -0800 (PST)
X-Google-Smtp-Source: AK7set/UaCB894oFYlcQd4hiw0POOFhKfHOVotoQXHzf3ucXU5vJt70Z6U+pHlzKhZJIX1E0kutJUQ==
X-Received: by 2002:a5d:5101:0:b0:2cc:4dac:fe39 with SMTP id
 s1-20020a5d5101000000b002cc4dacfe39mr6800555wrt.12.1677760313127; 
 Thu, 02 Mar 2023 04:31:53 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 y14-20020adfee0e000000b002c71b4d476asm15401945wrn.106.2023.03.02.04.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:31:52 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 27/62] hw/xen: Add xen_evtchn device for event channel emulation
Date: Thu,  2 Mar 2023 13:29:54 +0100
Message-Id: <20230302123029.153265-28-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: David Woodhouse <dwmw@amazon.co.uk>

Include basic support for setting HVM_PARAM_CALLBACK_IRQ to the global
vector method HVM_PARAM_CALLBACK_TYPE_VECTOR, which is handled in-kernel
by raising the vector whenever the vCPU's vcpu_info->evtchn_upcall_pending
flag is set.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/meson.build   |   5 +-
 hw/i386/kvm/xen_evtchn.c  | 155 ++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |  18 +++++
 hw/i386/pc.c              |   2 +
 target/i386/kvm/xen-emu.c |  15 ++++
 5 files changed, 194 insertions(+), 1 deletion(-)
 create mode 100644 hw/i386/kvm/xen_evtchn.c
 create mode 100644 hw/i386/kvm/xen_evtchn.h

diff --git a/hw/i386/kvm/meson.build b/hw/i386/kvm/meson.build
index 6165cbf019d6..cab64df33982 100644
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
index 000000000000..9d6f4076ad44
--- /dev/null
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -0,0 +1,155 @@
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
+#include "hw/xen/interface/memory.h"
+#include "hw/xen/interface/hvm/params.h"
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
+    struct kvm_xen_hvm_attr xa = {
+        .type = KVM_XEN_ATTR_TYPE_UPCALL_VECTOR,
+        .u.vector = 0,
+    };
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
+        xa.u.vector = (uint8_t)param,
+
+        ret = kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &xa);
+        if (!ret && kvm_xen_has_cap(EVTCHN_SEND)) {
+            in_kernel = true;
+        }
+        break;
+    }
+    default:
+        /* Xen doesn't return error even if you set something bogus */
+        ret = 0;
+        break;
+    }
+
+    if (!ret) {
+        /* If vector delivery was turned *off* then tell the kernel */
+        if ((s->callback_param >> CALLBACK_VIA_TYPE_SHIFT) ==
+            HVM_PARAM_CALLBACK_TYPE_VECTOR && !xa.u.vector) {
+            kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &xa);
+        }
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
index 000000000000..c9b7f9d11f10
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
index a316a01b1594..f38e3f1be84a 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -91,6 +91,7 @@
 #include "hw/virtio/virtio-pmem-pci.h"
 #include "hw/virtio/virtio-mem-pci.h"
 #include "hw/i386/kvm/xen_overlay.h"
+#include "hw/i386/kvm/xen_evtchn.h"
 #include "hw/mem/memory-device.h"
 #include "sysemu/replay.h"
 #include "target/i386/cpu.h"
@@ -1852,6 +1853,7 @@ int pc_machine_kvm_type(MachineState *machine, const char *kvm_type)
 #ifdef CONFIG_XEN_EMU
     if (xen_mode == XEN_EMULATE) {
         xen_overlay_create();
+        xen_evtchn_create();
     }
 #endif
     return 0;
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index ce858ac63ce1..435c51f625a1 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -22,6 +22,7 @@
 #include "sysemu/runstate.h"
 
 #include "hw/i386/kvm/xen_overlay.h"
+#include "hw/i386/kvm/xen_evtchn.h"
 
 #include "hw/xen/interface/version.h"
 #include "hw/xen/interface/sched.h"
@@ -510,6 +511,10 @@ static bool handle_set_param(struct kvm_xen_exit *exit, X86CPU *cpu,
     }
 
     switch (hp.index) {
+    case HVM_PARAM_CALLBACK_IRQ:
+        err = xen_evtchn_set_callback_param(hp.value);
+        xen_set_long_mode(exit->u.hcall.longmode);
+        break;
     default:
         return false;
     }
@@ -719,6 +724,16 @@ int kvm_xen_soft_reset(void)
 
     trace_kvm_xen_soft_reset();
 
+    /*
+     * Zero is the reset/startup state for HVM_PARAM_CALLBACK_IRQ. Strictly,
+     * it maps to HVM_PARAM_CALLBACK_TYPE_GSI with GSI#0, but Xen refuses to
+     * to deliver to the timer interrupt and treats that as 'disabled'.
+     */
+    err = xen_evtchn_set_callback_param(0);
+    if (err) {
+        return err;
+    }
+
     CPU_FOREACH(cpu) {
         async_run_on_cpu(cpu, do_vcpu_soft_reset, RUN_ON_CPU_NULL);
     }
-- 
2.39.1


