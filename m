Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A876A6D7D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 14:54:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXMtk-0000vh-VO; Wed, 01 Mar 2023 08:53:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1cb70579e185fe7dd8a8+7129+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pXMsq-0008Ot-95
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:52:44 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1cb70579e185fe7dd8a8+7129+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pXMsn-0002nI-O3
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:52:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=97qDXSIyRCmfaG68lOQ3dY92/BlQc45+R8v+8RsGZ8k=; b=V517wYIJuPM5UTxd1VXP/UAVTJ
 SY+K6xbqT3V21eydHcf+auxsKR3aL9v5GORmKG2dSGKPyGBbNXyPvvfmQQZcJT8SEXSh/Hnx5uqDK
 3D7EAPatyHcwY5XCUU3Je/l5tX2r0HJneYgiEc76SMR7drRxv3xuKAxkNWViQMQdrVowEoIwQ+tGQ
 ZKbMlcXJ2UYddB5xCbQBOTLMwLDzASArbFCe/ex7SSXsjio7UjfoYGh7oPaGJlJjB1STZIlj1/jPU
 x8CMb28712X8FV6ELqJQ8Cbww1r/k1iHYk5pCTb8uucdfu2FJc2XxcD6gEnN3lf5FpJstQcppguKk
 79r4Wt4Q==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pXMsc-00EuVa-0d; Wed, 01 Mar 2023 13:52:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXMsc-0049UQ-0G; Wed, 01 Mar 2023 13:52:26 +0000
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
Subject: [PATCH v15 13/60] hw/xen: Add xen_overlay device for emulating shared
 xenheap pages
Date: Wed,  1 Mar 2023 13:51:36 +0000
Message-Id: <20230301135223.988336-14-dwmw2@infradead.org>
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

For the shared info page and for grant tables, Xen shares its own pages
from the "Xen heap" to the guest. The guest requests that a given page
from a certain address space (XENMAPSPACE_shared_info, etc.) be mapped
to a given GPA using the XENMEM_add_to_physmap hypercall.

To support that in qemu when *emulating* Xen, create a memory region
(migratable) and allow it to be mapped as an overlay when requested.

Xen theoretically allows the same page to be mapped multiple times
into the guest, but that's hard to track and reinstate over migration,
so we automatically *unmap* any previous mapping when creating a new
one. This approach has been used in production with.... a non-trivial
number of guests expecting true Xen, without any problems yet being
noticed.

This adds just the shared info page for now. The grant tables will be
a larger region, and will need to be overlaid one page at a time. I
think that means I need to create separate aliases for each page of
the overall grant_frames region, so that they can be mapped individually.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/meson.build   |   1 +
 hw/i386/kvm/xen_overlay.c | 210 ++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_overlay.h |  20 ++++
 include/sysemu/kvm_xen.h  |   7 ++
 4 files changed, 238 insertions(+)
 create mode 100644 hw/i386/kvm/xen_overlay.c
 create mode 100644 hw/i386/kvm/xen_overlay.h

diff --git a/hw/i386/kvm/meson.build b/hw/i386/kvm/meson.build
index 95467f1ded..6165cbf019 100644
--- a/hw/i386/kvm/meson.build
+++ b/hw/i386/kvm/meson.build
@@ -4,5 +4,6 @@ i386_kvm_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c'))
 i386_kvm_ss.add(when: 'CONFIG_I8254', if_true: files('i8254.c'))
 i386_kvm_ss.add(when: 'CONFIG_I8259', if_true: files('i8259.c'))
 i386_kvm_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
+i386_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files('xen_overlay.c'))
 
 i386_ss.add_all(when: 'CONFIG_KVM', if_true: i386_kvm_ss)
diff --git a/hw/i386/kvm/xen_overlay.c b/hw/i386/kvm/xen_overlay.c
new file mode 100644
index 0000000000..a2441e2b4e
--- /dev/null
+++ b/hw/i386/kvm/xen_overlay.c
@@ -0,0 +1,210 @@
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
+#include "xen_overlay.h"
+
+#include "sysemu/kvm.h"
+#include "sysemu/kvm_xen.h"
+#include <linux/kvm.h>
+
+#include "hw/xen/interface/memory.h"
+
+
+#define TYPE_XEN_OVERLAY "xen-overlay"
+OBJECT_DECLARE_SIMPLE_TYPE(XenOverlayState, XEN_OVERLAY)
+
+#define XEN_PAGE_SHIFT 12
+#define XEN_PAGE_SIZE (1ULL << XEN_PAGE_SHIFT)
+
+struct XenOverlayState {
+    /*< private >*/
+    SysBusDevice busdev;
+    /*< public >*/
+
+    MemoryRegion shinfo_mem;
+    void *shinfo_ptr;
+    uint64_t shinfo_gpa;
+};
+
+struct XenOverlayState *xen_overlay_singleton;
+
+static void xen_overlay_do_map_page(MemoryRegion *page, uint64_t gpa)
+{
+    /*
+     * Xen allows guests to map the same page as many times as it likes
+     * into guest physical frames. We don't, because it would be hard
+     * to track and restore them all. One mapping of each page is
+     * perfectly sufficient for all known guests... and we've tested
+     * that theory on a few now in other implementations. dwmw2.
+     */
+    if (memory_region_is_mapped(page)) {
+        if (gpa == INVALID_GPA) {
+            memory_region_del_subregion(get_system_memory(), page);
+        } else {
+            /* Just move it */
+            memory_region_set_address(page, gpa);
+        }
+    } else if (gpa != INVALID_GPA) {
+        memory_region_add_subregion_overlap(get_system_memory(), gpa, page, 0);
+    }
+}
+
+/* KVM is the only existing back end for now. Let's not overengineer it yet. */
+static int xen_overlay_set_be_shinfo(uint64_t gfn)
+{
+    struct kvm_xen_hvm_attr xa = {
+        .type = KVM_XEN_ATTR_TYPE_SHARED_INFO,
+        .u.shared_info.gfn = gfn,
+    };
+
+    return kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &xa);
+}
+
+
+static void xen_overlay_realize(DeviceState *dev, Error **errp)
+{
+    XenOverlayState *s = XEN_OVERLAY(dev);
+
+    if (xen_mode != XEN_EMULATE) {
+        error_setg(errp, "Xen overlay page support is for Xen emulation");
+        return;
+    }
+
+    memory_region_init_ram(&s->shinfo_mem, OBJECT(dev), "xen:shared_info",
+                           XEN_PAGE_SIZE, &error_abort);
+    memory_region_set_enabled(&s->shinfo_mem, true);
+
+    s->shinfo_ptr = memory_region_get_ram_ptr(&s->shinfo_mem);
+    s->shinfo_gpa = INVALID_GPA;
+    memset(s->shinfo_ptr, 0, XEN_PAGE_SIZE);
+}
+
+static int xen_overlay_post_load(void *opaque, int version_id)
+{
+    XenOverlayState *s = opaque;
+
+    if (s->shinfo_gpa != INVALID_GPA) {
+        xen_overlay_do_map_page(&s->shinfo_mem, s->shinfo_gpa);
+        xen_overlay_set_be_shinfo(s->shinfo_gpa >> XEN_PAGE_SHIFT);
+    }
+
+    return 0;
+}
+
+static bool xen_overlay_is_needed(void *opaque)
+{
+    return xen_mode == XEN_EMULATE;
+}
+
+static const VMStateDescription xen_overlay_vmstate = {
+    .name = "xen_overlay",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = xen_overlay_is_needed,
+    .post_load = xen_overlay_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(shinfo_gpa, XenOverlayState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void xen_overlay_reset(DeviceState *dev)
+{
+    kvm_xen_soft_reset();
+}
+
+static void xen_overlay_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = xen_overlay_reset;
+    dc->realize = xen_overlay_realize;
+    dc->vmsd = &xen_overlay_vmstate;
+}
+
+static const TypeInfo xen_overlay_info = {
+    .name          = TYPE_XEN_OVERLAY,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XenOverlayState),
+    .class_init    = xen_overlay_class_init,
+};
+
+void xen_overlay_create(void)
+{
+    xen_overlay_singleton = XEN_OVERLAY(sysbus_create_simple(TYPE_XEN_OVERLAY,
+                                                             -1, NULL));
+
+    /* If xen_domid wasn't explicitly set, at least make sure it isn't zero. */
+    if (xen_domid == DOMID_QEMU) {
+        xen_domid = 1;
+    };
+}
+
+static void xen_overlay_register_types(void)
+{
+    type_register_static(&xen_overlay_info);
+}
+
+type_init(xen_overlay_register_types)
+
+int xen_overlay_map_shinfo_page(uint64_t gpa)
+{
+    XenOverlayState *s = xen_overlay_singleton;
+    int ret;
+
+    if (!s) {
+        return -ENOENT;
+    }
+
+    assert(qemu_mutex_iothread_locked());
+
+    if (s->shinfo_gpa) {
+        /* If removing shinfo page, turn the kernel magic off first */
+        ret = xen_overlay_set_be_shinfo(INVALID_GFN);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    xen_overlay_do_map_page(&s->shinfo_mem, gpa);
+    if (gpa != INVALID_GPA) {
+        ret = xen_overlay_set_be_shinfo(gpa >> XEN_PAGE_SHIFT);
+        if (ret) {
+            return ret;
+        }
+    }
+    s->shinfo_gpa = gpa;
+
+    return 0;
+}
+
+void *xen_overlay_get_shinfo_ptr(void)
+{
+    XenOverlayState *s = xen_overlay_singleton;
+
+    if (!s) {
+        return NULL;
+    }
+
+    return s->shinfo_ptr;
+}
diff --git a/hw/i386/kvm/xen_overlay.h b/hw/i386/kvm/xen_overlay.h
new file mode 100644
index 0000000000..00cff05bb0
--- /dev/null
+++ b/hw/i386/kvm/xen_overlay.h
@@ -0,0 +1,20 @@
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
+#ifndef QEMU_XEN_OVERLAY_H
+#define QEMU_XEN_OVERLAY_H
+
+void xen_overlay_create(void);
+
+int xen_overlay_map_shinfo_page(uint64_t gpa);
+void *xen_overlay_get_shinfo_ptr(void);
+
+#endif /* QEMU_XEN_OVERLAY_H */
diff --git a/include/sysemu/kvm_xen.h b/include/sysemu/kvm_xen.h
index 5dffcc0542..cec21c8fab 100644
--- a/include/sysemu/kvm_xen.h
+++ b/include/sysemu/kvm_xen.h
@@ -12,6 +12,13 @@
 #ifndef QEMU_SYSEMU_KVM_XEN_H
 #define QEMU_SYSEMU_KVM_XEN_H
 
+/* The KVM API uses these to indicate "no GPA" or "no GFN" */
+#define INVALID_GPA UINT64_MAX
+#define INVALID_GFN UINT64_MAX
+
+/* QEMU plays the rôle of dom0 for "interdomain" communication. */
+#define DOMID_QEMU  0
+
 int kvm_xen_soft_reset(void);
 uint32_t kvm_xen_get_caps(void);
 
-- 
2.39.0


