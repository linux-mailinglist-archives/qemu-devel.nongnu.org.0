Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F21966A6D88
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 14:55:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXMu4-00023E-RG; Wed, 01 Mar 2023 08:53:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1cb70579e185fe7dd8a8+7129+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pXMt6-0000CI-DX
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:52:57 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1cb70579e185fe7dd8a8+7129+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pXMsu-0002or-7D
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:52:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=Mhvolba+AJbunVz7FKttwR8BPh/Qhcr0RMyJ4nisK6g=; b=UPlMc8r7aSo0mBbSNfW93dQbZn
 GaW1Fg+ruIv2nWJOddxw+mruPqByvr65vzHEfXrCKnzaFcGdnoqT71rmQUB2ROzGjSoq/80rPB2sI
 /OVeN+Oj47CBVazop1h9gskjVEi9sAm6vk5ab4BKwQ3fTihtn+g0w7xYHNYNPBygbekvDxwLmxaIu
 vGaonxYZI2efR486gDuQT3ahpvSmr+aE10qMTedpo6OqBXSjN9B+Jm7r2RimjRpYzds63Pd27irRO
 xBbcLuC97OrOSaTTQVjWrOfae/ogmOs6vWk1DjFEF8u5icXCsiVC+rHuZToNeYWYzr7WChQ/XH9Yi
 OZxhUbcw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pXMsd-00EuW1-2w; Wed, 01 Mar 2023 13:52:32 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXMsd-0049WW-2Z; Wed, 01 Mar 2023 13:52:27 +0000
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
Subject: [PATCH v15 43/60] hw/xen: Add xen_gnttab device for grant table
 emulation
Date: Wed,  1 Mar 2023 13:52:06 +0000
Message-Id: <20230301135223.988336-44-dwmw2@infradead.org>
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

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
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
index 325c901496..067ff525ee 100644
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
index 0000000000..ef8857e50c
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
+#include "hw/xen/interface/memory.h"
+#include "hw/xen/interface/grant_table.h"
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
index 71d3b8bec2..1cf112e542 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -92,6 +92,7 @@
 #include "hw/virtio/virtio-mem-pci.h"
 #include "hw/i386/kvm/xen_overlay.h"
 #include "hw/i386/kvm/xen_evtchn.h"
+#include "hw/i386/kvm/xen_gnttab.h"
 #include "hw/mem/memory-device.h"
 #include "sysemu/replay.h"
 #include "target/i386/cpu.h"
@@ -1860,6 +1861,7 @@ int pc_machine_kvm_type(MachineState *machine, const char *kvm_type)
     if (xen_mode == XEN_EMULATE) {
         xen_overlay_create();
         xen_evtchn_create();
+        xen_gnttab_create();
     }
 #endif
     return 0;
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 46be631726..6f9b7a5cb9 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -25,6 +25,7 @@
 #include "hw/i386/apic-msidef.h"
 #include "hw/i386/kvm/xen_overlay.h"
 #include "hw/i386/kvm/xen_evtchn.h"
+#include "hw/i386/kvm/xen_gnttab.h"
 
 #include "hw/xen/interface/version.h"
 #include "hw/xen/interface/sched.h"
@@ -563,6 +564,8 @@ static int add_to_physmap_one(uint32_t space, uint64_t idx, uint64_t gfn)
         return xen_set_shared_info(gfn);
 
     case XENMAPSPACE_grant_table:
+        return xen_gnttab_map_page(idx, gfn);
+
     case XENMAPSPACE_gmfn:
     case XENMAPSPACE_gmfn_range:
         return -ENOTSUP;
-- 
2.39.0


