Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B2466D162
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 23:07:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHXXr-00035V-4u; Mon, 16 Jan 2023 17:01:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+491b11caf3ce55304f6a+7085+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pHXV1-0006th-FU
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 16:58:39 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+491b11caf3ce55304f6a+7085+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pHXUu-0003eD-0F
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 16:58:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=ePZoRLd4U+yIioCcu+M6mhQT/AIj5+hKXuVPPvIxbf0=; b=KLAyRs8y34Jc/ryqFduVQ7ZP96
 2mWs7GLqqSOmqUvon0nQEvJtR8fAgPDPXo57CaOYCubaw68J9h57bdlKRbDoMfux43ewJzoK6ZGHK
 nUsodUHhKFdOj+Ijh93GXIpcUnGsN3he1S34A5lToe+kFG2jT4lRuRbk0d2qpYCrAYkicN9o5tkZd
 u4InUS037QlQkrjNaRZNtSWCthfuknzUv3I1tX7zKZ8bMosFicp4j6RX62H3xSgXCmkOroGJOCxve
 mfp4qMpzvid0NauW1Z3oqQtivKIUFL1LJIrhQwBIlJRWBkL2yOb9kvVCIStYw/HSbD5JqKg5lz4iM
 IE4I0jBA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pHXUP-005jRw-0A; Mon, 16 Jan 2023 21:58:04 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pHXUY-004iR0-0U; Mon, 16 Jan 2023 21:58:10 +0000
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
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [PATCH v7 50/51] hw/xen: Add xen_xenstore device for xenstore
 emulation
Date: Mon, 16 Jan 2023 21:58:04 +0000
Message-Id: <20230116215805.1123514-51-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116215805.1123514-1-dwmw2@infradead.org>
References: <20230116215805.1123514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+491b11caf3ce55304f6a+7085+infradead.org+dwmw2@desiato.srs.infradead.org;
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

Just the basic shell, with the event channel hookup. It only dumps the
buffer for now; a real ring implmentation will come in a subsequent patch.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/meson.build    |   1 +
 hw/i386/kvm/xen_evtchn.c   |   1 +
 hw/i386/kvm/xen_xenstore.c | 248 +++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_xenstore.h |  20 +++
 hw/i386/pc.c               |   2 +
 target/i386/kvm/xen-emu.c  |  12 ++
 6 files changed, 284 insertions(+)
 create mode 100644 hw/i386/kvm/xen_xenstore.c
 create mode 100644 hw/i386/kvm/xen_xenstore.h

diff --git a/hw/i386/kvm/meson.build b/hw/i386/kvm/meson.build
index 7b4675a3b0..662054dc9f 100644
--- a/hw/i386/kvm/meson.build
+++ b/hw/i386/kvm/meson.build
@@ -8,6 +8,7 @@ i386_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files(
   'xen_overlay.c',
   'xen_evtchn.c',
   'xen_gnttab.c',
+  'xen_xenstore.c',
   ))
 
 i386_ss.add_all(when: 'CONFIG_KVM', if_true: i386_kvm_ss)
diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index dc58843cf2..b23bb71abb 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -33,6 +33,7 @@
 
 #include "xen_evtchn.h"
 #include "xen_overlay.h"
+#include "xen_xenstore.h"
 
 #include "sysemu/kvm.h"
 #include "sysemu/kvm_xen.h"
diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
new file mode 100644
index 0000000000..bb3346f4e3
--- /dev/null
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -0,0 +1,248 @@
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
+
+#include "qemu/host-utils.h"
+#include "qemu/module.h"
+#include "qemu/main-loop.h"
+#include "qemu/cutils.h"
+#include "qapi/error.h"
+#include "qom/object.h"
+#include "migration/vmstate.h"
+
+#include "hw/sysbus.h"
+#include "hw/xen/xen.h"
+#include "xen_overlay.h"
+#include "xen_evtchn.h"
+#include "xen_xenstore.h"
+
+#include "sysemu/kvm.h"
+#include "sysemu/kvm_xen.h"
+
+#include "standard-headers/xen/io/xs_wire.h"
+#include "standard-headers/xen/event_channel.h"
+
+#define TYPE_XEN_XENSTORE "xen-xenstore"
+OBJECT_DECLARE_SIMPLE_TYPE(XenXenstoreState, XEN_XENSTORE)
+
+#define XEN_PAGE_SHIFT 12
+#define XEN_PAGE_SIZE (1ULL << XEN_PAGE_SHIFT)
+
+#define ENTRIES_PER_FRAME_V1 (XEN_PAGE_SIZE / sizeof(grant_entry_v1_t))
+#define ENTRIES_PER_FRAME_V2 (XEN_PAGE_SIZE / sizeof(grant_entry_v2_t))
+
+#define XENSTORE_HEADER_SIZE ((unsigned int)sizeof(struct xsd_sockmsg))
+
+struct XenXenstoreState {
+    /*< private >*/
+    SysBusDevice busdev;
+    /*< public >*/
+
+    MemoryRegion xenstore_page;
+    struct xenstore_domain_interface *xs;
+    uint8_t req_data[XENSTORE_HEADER_SIZE + XENSTORE_PAYLOAD_MAX];
+    uint8_t rsp_data[XENSTORE_HEADER_SIZE + XENSTORE_PAYLOAD_MAX];
+    uint32_t req_offset;
+    uint32_t rsp_offset;
+    bool rsp_pending;
+    bool fatal_error;
+
+    evtchn_port_t guest_port;
+    evtchn_port_t be_port;
+    struct xenevtchn_handle *eh;
+};
+
+struct XenXenstoreState *xen_xenstore_singleton;
+
+static void xen_xenstore_event(void *opaque);
+
+static void xen_xenstore_realize(DeviceState *dev, Error **errp)
+{
+    XenXenstoreState *s = XEN_XENSTORE(dev);
+
+    if (xen_mode != XEN_EMULATE) {
+        error_setg(errp, "Xen xenstore support is for Xen emulation");
+        return;
+    }
+    memory_region_init_ram(&s->xenstore_page, OBJECT(dev), "xen:xenstore_page",
+                           XEN_PAGE_SIZE, &error_abort);
+    memory_region_set_enabled(&s->xenstore_page, true);
+    s->xs = memory_region_get_ram_ptr(&s->xenstore_page);
+    memset(s->xs, 0, XEN_PAGE_SIZE);
+
+    /* We can't map it this early as KVM isn't ready */
+    xen_xenstore_singleton = s;
+
+    s->eh = xen_be_evtchn_open();
+    if (!s->eh) {
+        error_setg(errp, "Xenstore evtchn port init failed");
+        return;
+    }
+    aio_set_fd_handler(qemu_get_aio_context(), xen_be_evtchn_fd(s->eh), true,
+                       xen_xenstore_event, NULL, NULL, NULL, s);
+}
+
+static bool xen_xenstore_is_needed(void *opaque)
+{
+    return xen_mode == XEN_EMULATE;
+}
+
+static int xen_xenstore_pre_save(void *opaque)
+{
+    XenXenstoreState *s = opaque;
+
+    if (s->eh) {
+        s->guest_port = xen_be_evtchn_get_guest_port(s->eh);
+    }
+    return 0;
+}
+
+static int xen_xenstore_post_load(void *opaque, int ver)
+{
+    XenXenstoreState *s = opaque;
+
+    /*
+     * As qemu/dom0, rebind to the guest's port. The Windows drivers may
+     * unbind the XenStore evtchn and rebind to it, having obtained the
+     * "remote" port through EVTCHNOP_status. In the case that migration
+     * occurs while it's unbound, the "remote" port needs to be the same
+     * as before so that the guest can find it, but should remain unbound.
+     */
+    if (s->guest_port) {
+        int be_port = xen_be_evtchn_bind_interdomain(s->eh, xen_domid, s->guest_port);
+        if (be_port < 0) {
+            return be_port;
+        }
+        s->be_port = be_port;
+    }
+    return 0;
+}
+
+static const VMStateDescription xen_xenstore_vmstate = {
+    .name = "xen_xenstore",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = xen_xenstore_is_needed,
+    .pre_save = xen_xenstore_pre_save,
+    .post_load = xen_xenstore_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8_ARRAY(req_data, XenXenstoreState, sizeof_field(XenXenstoreState, req_data)),
+        VMSTATE_UINT8_ARRAY(rsp_data, XenXenstoreState, sizeof_field(XenXenstoreState, rsp_data)),
+        VMSTATE_UINT32(req_offset, XenXenstoreState),
+        VMSTATE_UINT32(rsp_offset, XenXenstoreState),
+        VMSTATE_BOOL(rsp_pending, XenXenstoreState),
+        VMSTATE_UINT32(guest_port, XenXenstoreState),
+        VMSTATE_BOOL(fatal_error, XenXenstoreState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void xen_xenstore_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = xen_xenstore_realize;
+    dc->vmsd = &xen_xenstore_vmstate;
+}
+
+static const TypeInfo xen_xenstore_info = {
+    .name          = TYPE_XEN_XENSTORE,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XenXenstoreState),
+    .class_init    = xen_xenstore_class_init,
+};
+
+void xen_xenstore_create(void)
+{
+    xen_xenstore_singleton = XEN_XENSTORE(sysbus_create_simple(TYPE_XEN_XENSTORE,
+                                                           -1, NULL));
+
+    /*
+     * Defer the init (xen_xenstore_reset()) until KVM is set up and the
+     * overlay page can be mapped.
+     */
+}
+
+static void xen_xenstore_register_types(void)
+{
+    type_register_static(&xen_xenstore_info);
+}
+
+type_init(xen_xenstore_register_types)
+
+uint16_t xen_xenstore_get_port(void)
+{
+    XenXenstoreState *s = xen_xenstore_singleton;
+    if (!s) {
+        return 0;
+    }
+    return s->guest_port;
+}
+
+static void xen_xenstore_event(void *opaque)
+{
+    XenXenstoreState *s = opaque;
+    evtchn_port_t port = xen_be_evtchn_pending(s->eh);
+    if (port != s->be_port) {
+        return;
+    }
+    printf("xenstore event\n");
+    /* We know this is a no-op. */
+    xen_be_evtchn_unmask(s->eh, port);
+    qemu_hexdump(stdout, "", s->xs, sizeof(*s->xs));
+    xen_be_evtchn_notify(s->eh, s->be_port);
+}
+
+static void alloc_guest_port(XenXenstoreState *s)
+{
+    struct evtchn_alloc_unbound alloc = {
+        .dom = DOMID_SELF,
+        .remote_dom = DOMID_QEMU,
+    };
+
+    if (!xen_evtchn_alloc_unbound_op(&alloc)) {
+        s->guest_port = alloc.port;
+    }
+}
+
+int xen_xenstore_reset(void)
+{
+    XenXenstoreState *s = xen_xenstore_singleton;
+    int err;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    s->req_offset = s->rsp_offset = 0;
+    s->rsp_pending = false;
+
+    if (!memory_region_is_mapped(&s->xenstore_page)) {
+        xen_overlay_map_page_locked(&s->xenstore_page,
+                                    XEN_SPECIAL_PFN(XENSTORE) << TARGET_PAGE_BITS);
+    }
+
+    alloc_guest_port(s);
+
+    /*
+     * As qemu/dom0, bind to the guest's port. For incoming migration, this
+     * will be unbound as the guest's evtchn table is overwritten. We then
+     * rebind to the correct guest port in xen_xenstore_post_load().
+     */
+    err = xen_be_evtchn_bind_interdomain(s->eh, xen_domid, s->guest_port);
+    if (err < 0) {
+        return err;
+    }
+    s->be_port = err;
+
+    return 0;
+}
diff --git a/hw/i386/kvm/xen_xenstore.h b/hw/i386/kvm/xen_xenstore.h
new file mode 100644
index 0000000000..8c3768e075
--- /dev/null
+++ b/hw/i386/kvm/xen_xenstore.h
@@ -0,0 +1,20 @@
+/*
+ * QEMU Xen emulation: Xenstore emulation
+ *
+ * Copyright © 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * Authors: David Woodhouse <dwmw2@infradead.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_XEN_XENSTORE_H
+#define QEMU_XEN_XENSTORE_H
+
+void xen_xenstore_create(void);
+int xen_xenstore_reset(void);
+
+uint16_t xen_xenstore_get_port(void);
+
+#endif /* QEMU_XEN_XENSTORE_H */
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index b9f92010f9..c5cf6581da 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -92,6 +92,7 @@
 #include "hw/i386/kvm/xen_overlay.h"
 #include "hw/i386/kvm/xen_evtchn.h"
 #include "hw/i386/kvm/xen_gnttab.h"
+#include "hw/i386/kvm/xen_xenstore.h"
 #include "hw/mem/memory-device.h"
 #include "sysemu/replay.h"
 #include "target/i386/cpu.h"
@@ -1860,6 +1861,7 @@ int pc_machine_kvm_type(MachineState *machine, const char *kvm_type)
         xen_overlay_create();
         xen_evtchn_create();
         xen_gnttab_create();
+        xen_xenstore_create();
     }
 #endif
     return 0;
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index c55d2e16a3..0cd7113681 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -26,6 +26,7 @@
 #include "hw/i386/kvm/xen_overlay.h"
 #include "hw/i386/kvm/xen_evtchn.h"
 #include "hw/i386/kvm/xen_gnttab.h"
+#include "hw/i386/kvm/xen_xenstore.h"
 
 #include "standard-headers/xen/version.h"
 #include "standard-headers/xen/sched.h"
@@ -178,6 +179,9 @@ int kvm_xen_init(KVMState *s, uint32_t hypercall_msr)
         return ret;
     }
 
+    /* The page couldn't be overlaid until KVM was initialized */
+    xen_xenstore_reset();
+
     return 0;
 }
 
@@ -768,6 +772,9 @@ static bool handle_get_param(struct kvm_xen_exit *exit, X86CPU *cpu,
     case HVM_PARAM_STORE_PFN:
         hp.value = XEN_SPECIAL_PFN(XENSTORE);
         break;
+    case HVM_PARAM_STORE_EVTCHN:
+        hp.value = xen_xenstore_get_port();
+        break;
     default:
         return false;
     }
@@ -1334,6 +1341,11 @@ static int kvm_xen_soft_reset(void)
         return err;
     }
 
+    err = xen_xenstore_reset();
+    if (err) {
+        return err;
+    }
+
     return 0;
 }
 
-- 
2.39.0


