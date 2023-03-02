Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7055A6A8237
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:31:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi5Q-0007dI-Ts; Thu, 02 Mar 2023 07:31:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5G-0007RX-QL
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5C-0002r3-FD
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:30:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=++1pLvBw4Z+TxgJOwf2n4ZE0GuCO8mbGuPAPoip6pg0=;
 b=TH23vtailQaojhLpqVksa+gZ64tRK9A0/PaAd0M+r+eE7NywvrzCI0F238uw8Wnk87sN2I
 bzdWz+AURWaw/PqtCp7S1AM4e98IhlU2T3484imq2Z/ht4G1PmZ5vBLje0Oan+DZJep61S
 dhjxIB/2k2e3R66/Phu48nZ+bZ+HHUs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-L1292KOtO5GqjiuQdkzXvw-1; Thu, 02 Mar 2023 07:30:48 -0500
X-MC-Unique: L1292KOtO5GqjiuQdkzXvw-1
Received: by mail-wm1-f70.google.com with SMTP id
 az12-20020a05600c600c00b003e8910ec2fdso5691624wmb.6
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:30:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=++1pLvBw4Z+TxgJOwf2n4ZE0GuCO8mbGuPAPoip6pg0=;
 b=opzqW7Gn+6d/1vbjVNBg913oYItP+/7/99PUxMoiDbgyXbGBjDf4J/FV7TumzoU0YR
 qMw3dXLfqYYuZw/Nq0tBeOXaXME1DeV9VpS+MmziAwTRJNimSR81LcPRnQCyZGJs6Uzd
 hdoIq64T5m6GZKbnn4aW2LgVzr9v+58MHgf7vty1RK0FBRlzKUnkY8ZO+EMDfztLFks0
 MxeOgrGdBh+7+l6qj067azh/PdTP22AB7TFRnleM72xUXQhFtA+4xuoHPFuBS6PMBRRU
 GLvXDrsDdz6g3clLzzo1hpvqqpjDaNQxFNbI9vQO60mcgdk2+W3UwkWbugpuDRsBjMPV
 Yvcw==
X-Gm-Message-State: AO0yUKVVIsgwtfbxWdUnR/T9djXXHJtekgzIttPUH8xEjWhQbMMmo9Hm
 FRr8NmlnZpTPQpy6k6qE8ffRpgtuRBkfpc0PqEXZNM+MiG1TcIzBugNFfZ4vLYLWzUYdSPXPDYi
 LvJ3Poqmk9LQQEVrtt2pE7XelyzYl7AULOrMvMkIDpC/g7fOPzDy0f5NsAD8MeAjqdeVTSz39u+
 Q=
X-Received: by 2002:a5d:4e4d:0:b0:2c7:c9e:2c41 with SMTP id
 r13-20020a5d4e4d000000b002c70c9e2c41mr7275495wrt.57.1677760246466; 
 Thu, 02 Mar 2023 04:30:46 -0800 (PST)
X-Google-Smtp-Source: AK7set/m2J8Vpo+tZ96B/7xm5rH+8EXgWwi/taszKs+rxFuZr3WQSqSZFI1tXrUhYou/dm9vr5c2tw==
X-Received: by 2002:a5d:4e4d:0:b0:2c7:c9e:2c41 with SMTP id
 r13-20020a5d4e4d000000b002c70c9e2c41mr7275476wrt.57.1677760246114; 
 Thu, 02 Mar 2023 04:30:46 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a5d49c3000000b002c5804b6afasm15497858wrs.67.2023.03.02.04.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:30:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 04/62] i386/kvm: Add xen-version KVM accelerator property and
 init KVM Xen support
Date: Thu,  2 Mar 2023 13:29:31 +0100
Message-Id: <20230302123029.153265-5-pbonzini@redhat.com>
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
index 86f752383313..511d3eb9a0da 100644
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
index 60b520a13e84..7f945bc7633e 100644
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
index 000000000000..296533f2d558
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
index d18bd2f3e889..da7342630c03 100644
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
index 736df8b72e3f..322272091bce 100644
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
index 000000000000..b556d903aa94
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
index 000000000000..4f31bd96cbb7
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
2.39.1


