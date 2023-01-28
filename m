Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66A867F5F1
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 09:13:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLgK9-0006RU-F1; Sat, 28 Jan 2023 03:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+e8fc867402dd322853dc+7097+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pLgJP-0005tT-9m
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 03:11:47 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+e8fc867402dd322853dc+7097+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pLgJK-0007rC-1s
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 03:11:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=W83GWgHXIX1I5g6znotAG8+ENNT6zCtpZbWhH1ZkQ8w=; b=Y9ByegfjscUk6OewRSvGE1/a0A
 fpXH1qGMM29wnFHWrYmPsAzZHJuuepZdxxyJnF5bfkyd+JYvE8gTh3DXohqPBwWS4x0Fq64v1Eejq
 iyKsxbR248Ddu/cqRbc7e2yGd1uEmLH1TPd2etWRdTTQ7K+gNfVXqMwkhiunScH6G7sXEseAutLHf
 aYB7EFzxszzJcocXDqLwgVbxqvMBLTvnrG4814lobYQmwqgsPmzvviP/87i2yH1wvNByAatD7GaDt
 Yj3ske7T83GiEB9Wr8VC8sT7UnfFeD4maNRWgD2fuCZQ6qUDUmQU0SBrhcoqT8k51h69jjUzayEbc
 Hw4zEALw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pLgIS-0039wX-2p; Sat, 28 Jan 2023 08:10:56 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pLgIy-006mKc-0c; Sat, 28 Jan 2023 08:11:20 +0000
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [PATCH v9 42/58] hw/xen: Add xen_gnttab device for grant table
 emulation
Date: Sat, 28 Jan 2023 08:10:57 +0000
Message-Id: <20230128081113.1615111-43-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230128081113.1615111-1-dwmw2@infradead.org>
References: <20230128081113.1615111-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+e8fc867402dd322853dc+7097+infradead.org+dwmw2@desiato.srs.infradead.org;
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

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/meson.build   |   1 +
 hw/i386/kvm/xen_gnttab.c  | 111 ++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_gnttab.h  |  18 +++++++
 hw/i386/pc.c              |   2 +
 target/i386/kvm/xen-emu.c |   3 ++
 5 files changed, 135 insertions(+)
 create mode 100644 hw/i386/kvm/xen_gnttab.c
 create mode 100644 hw/i386/kvm/xen_gnttab.h

diff --git a/hw/i386/kvm/meson.build b/hw/i386/kvm/meson.build
index cab64df339..e02449e4d4 100644
--- a/hw/i386/kvm/meson.build
+++ b/hw/i386/kvm/meson.build
@@ -7,6 +7,7 @@ i386_kvm_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
 i386_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files(
   'xen_overlay.c',
   'xen_evtchn.c',
+  'xen_gnttab.c',
   ))
 
 i386_ss.add_all(when: 'CONFIG_KVM', if_true: i386_kvm_ss)
diff --git a/hw/i386/kvm/xen_gnttab.c b/hw/i386/kvm/xen_gnttab.c
new file mode 100644
index 0000000000..437003a933
--- /dev/null
+++ b/hw/i386/kvm/xen_gnttab.c
@@ -0,0 +1,111 @@
+/*
+ * QEMU Xen emulation: Grant table support
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
+#include "qemu/lockable.h"
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
+#include "xen_gnttab.h"
+
+#include "sysemu/kvm.h"
+#include "sysemu/kvm_xen.h"
+
+#include "standard-headers/xen/memory.h"
+#include "standard-headers/xen/grant_table.h"
+
+#define TYPE_XEN_GNTTAB "xen-gnttab"
+OBJECT_DECLARE_SIMPLE_TYPE(XenGnttabState, XEN_GNTTAB)
+
+#define XEN_PAGE_SHIFT 12
+#define XEN_PAGE_SIZE (1ULL << XEN_PAGE_SHIFT)
+
+struct XenGnttabState {
+    /*< private >*/
+    SysBusDevice busdev;
+    /*< public >*/
+
+    uint32_t nr_frames;
+    uint32_t max_frames;
+};
+
+struct XenGnttabState *xen_gnttab_singleton;
+
+static void xen_gnttab_realize(DeviceState *dev, Error **errp)
+{
+    XenGnttabState *s = XEN_GNTTAB(dev);
+
+    if (xen_mode != XEN_EMULATE) {
+        error_setg(errp, "Xen grant table support is for Xen emulation");
+        return;
+    }
+    s->nr_frames = 0;
+    s->max_frames = kvm_xen_get_gnttab_max_frames();
+}
+
+static bool xen_gnttab_is_needed(void *opaque)
+{
+    return xen_mode == XEN_EMULATE;
+}
+
+static const VMStateDescription xen_gnttab_vmstate = {
+    .name = "xen_gnttab",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = xen_gnttab_is_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(nr_frames, XenGnttabState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void xen_gnttab_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = xen_gnttab_realize;
+    dc->vmsd = &xen_gnttab_vmstate;
+}
+
+static const TypeInfo xen_gnttab_info = {
+    .name          = TYPE_XEN_GNTTAB,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XenGnttabState),
+    .class_init    = xen_gnttab_class_init,
+};
+
+void xen_gnttab_create(void)
+{
+    xen_gnttab_singleton = XEN_GNTTAB(sysbus_create_simple(TYPE_XEN_GNTTAB,
+                                                           -1, NULL));
+}
+
+static void xen_gnttab_register_types(void)
+{
+    type_register_static(&xen_gnttab_info);
+}
+
+type_init(xen_gnttab_register_types)
+
+int xen_gnttab_map_page(uint64_t idx, uint64_t gfn)
+{
+    return -ENOSYS;
+}
+
diff --git a/hw/i386/kvm/xen_gnttab.h b/hw/i386/kvm/xen_gnttab.h
new file mode 100644
index 0000000000..a7caa94c83
--- /dev/null
+++ b/hw/i386/kvm/xen_gnttab.h
@@ -0,0 +1,18 @@
+/*
+ * QEMU Xen emulation: Grant table support
+ *
+ * Copyright © 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * Authors: David Woodhouse <dwmw2@infradead.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_XEN_GNTTAB_H
+#define QEMU_XEN_GNTTAB_H
+
+void xen_gnttab_create(void);
+int xen_gnttab_map_page(uint64_t idx, uint64_t gfn);
+
+#endif /* QEMU_XEN_GNTTAB_H */
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 2d3f316d10..ae1d50e084 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -91,6 +91,7 @@
 #include "hw/virtio/virtio-mem-pci.h"
 #include "hw/i386/kvm/xen_overlay.h"
 #include "hw/i386/kvm/xen_evtchn.h"
+#include "hw/i386/kvm/xen_gnttab.h"
 #include "hw/mem/memory-device.h"
 #include "sysemu/replay.h"
 #include "target/i386/cpu.h"
@@ -1858,6 +1859,7 @@ int pc_machine_kvm_type(MachineState *machine, const char *kvm_type)
     if (xen_mode == XEN_EMULATE) {
         xen_overlay_create();
         xen_evtchn_create();
+        xen_gnttab_create();
     }
 #endif
     return 0;
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 121c037eca..fba70b8ffc 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -25,6 +25,7 @@
 #include "hw/i386/apic-msidef.h"
 #include "hw/i386/kvm/xen_overlay.h"
 #include "hw/i386/kvm/xen_evtchn.h"
+#include "hw/i386/kvm/xen_gnttab.h"
 
 #include "standard-headers/xen/version.h"
 #include "standard-headers/xen/sched.h"
@@ -560,6 +561,8 @@ static int add_to_physmap_one(uint32_t space, uint64_t idx, uint64_t gfn)
         return xen_set_shared_info(gfn);
 
     case XENMAPSPACE_grant_table:
+        return xen_gnttab_map_page(idx, gfn);
+
     case XENMAPSPACE_gmfn:
     case XENMAPSPACE_gmfn_range:
         return -ENOTSUP;
-- 
2.39.0


