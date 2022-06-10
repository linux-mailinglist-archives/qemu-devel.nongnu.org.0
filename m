Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52FA546133
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 11:14:00 +0200 (CEST)
Received: from localhost ([::1]:56642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzaiN-0002B7-JY
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 05:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXx-0001u0-6x
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXv-0006OX-3c
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fF4zkj+lt60cISdNh0bi8uQF74kqrPF+05zKWN2Kk8U=;
 b=Oga1lSpwQ0rQNqdhI4trNrXal9xbCS6h0Z+Be7KeodFS81XkNJo9rV7fD98CyqlrmuR+Fn
 8A5WRQOutJRb93HgB+Yax4sXFEzxUL/TD0NRql/qeW1If033CVAk347AJFCgoqPuNr+bPg
 edEFhbNShKvDEs0Sslx6qCNm+BC3OAM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-INGOVF8zPWa0cSwb7XYp4A-1; Fri, 10 Jun 2022 03:59:05 -0400
X-MC-Unique: INGOVF8zPWa0cSwb7XYp4A-1
Received: by mail-wm1-f69.google.com with SMTP id
 l4-20020a05600c1d0400b0039c60535405so3369687wms.6
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fF4zkj+lt60cISdNh0bi8uQF74kqrPF+05zKWN2Kk8U=;
 b=m9EJq/Zo9Fjfm/bSG02xEx7JGhmdjGyFL91H/Sq79ZGEZ4KEQP+MKzVKZCcqh1d9Qn
 m5/odfDRZdTnt0xRnN7EVh0fIO/6mCgjN1mCqDpPefKpcFLKqJ3Svb7Tl1rhzF5S5fzz
 HvjJFjPSpgChFolh3uzY6TIcwXfje5BOJrLrHwsKSYkwDj3qERIuJADxl3523YOx8wZe
 rzEaU4DrNVWuYohI7s5y6HLkvHg3lF0RgG+prFlfOe1jSRyUkxlLs0dYwgmUx/vdeMjA
 bj+ok1URxnjZUF3QsrnK0hnFqI5gmxUolRPPOp7sFtzPoJc/9loY8diPpbD1psoV0rCA
 NXIA==
X-Gm-Message-State: AOAM532uokK6HACxmYW7chBKDM1CEkIDnxfR27J6ACOK7i67sZ4H9ITW
 b9bwLDlkMGoZUArrfKHR2sazFLs78DNaStKaYoWPrBwWTPXXU4zogjO66e9+2tavmBWxWjPh5+8
 oL7/GnZQG0/b6qjSagjgdMo3PXVFHK2Z1Fmc+tNTPxDW77SeRRNj1Y5RjrzwP
X-Received: by 2002:a05:6000:1e0b:b0:219:d06:de6c with SMTP id
 bj11-20020a0560001e0b00b002190d06de6cmr11041888wrb.529.1654847943548; 
 Fri, 10 Jun 2022 00:59:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyng4DGI3RSI9zO00yG8xOaNPQzWrDvVxWXh16Y/OHwcT14F79M0GerlDbeDFFCltKRewymhA==
X-Received: by 2002:a05:6000:1e0b:b0:219:d06:de6c with SMTP id
 bj11-20020a0560001e0b00b002190d06de6cmr11041858wrb.529.1654847943196; 
 Fri, 10 Jun 2022 00:59:03 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c205000b0039c5b9e9142sm1953946wmg.17.2022.06.10.00.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:59:02 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:59:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <ben@bwidawsk.net>, Ben Widawsky <ben.widawsky@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 40/54] pci/pci_expander_bridge: For CXL HB delay the HB
 register memory region setup.
Message-ID: <20220610075631.367501-41-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

As the CXLState will no long be accessible via MachineState
at time of PXB_CXL realization, come back later from the machine specific
code to fill in the missing memory region setup. Only at this stage
is it possible to check if cxl=on, so that check is moved to this
later point.

Note that for multiple host bridges, the allocation order of the
register spaces is changed. This will be reflected in ACPI CEDT.

Stubs are added to handle case of CONFIG_PXB=n for machines that
call these functions.

The bus walking logic is common to all machines so add a utility
function + stub to cxl-host*.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Ben Widawsky <ben@bwidawsk.net>
Message-Id: <20220608145440.26106-6-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl_host.h                   |  1 +
 include/hw/pci-bridge/pci_expander_bridge.h | 12 ++++++++
 hw/cxl/cxl-host-stubs.c                     |  1 +
 hw/cxl/cxl-host.c                           | 20 +++++++++++++
 hw/i386/pc.c                                |  3 ++
 hw/pci-bridge/pci_expander_bridge.c         | 32 +++++++++++++--------
 hw/pci-bridge/pci_expander_bridge_stubs.c   | 14 +++++++++
 hw/pci-bridge/meson.build                   |  5 +++-
 8 files changed, 75 insertions(+), 13 deletions(-)
 create mode 100644 include/hw/pci-bridge/pci_expander_bridge.h
 create mode 100644 hw/pci-bridge/pci_expander_bridge_stubs.c

diff --git a/include/hw/cxl/cxl_host.h b/include/hw/cxl/cxl_host.h
index 4d642a81fa..a1b662ce40 100644
--- a/include/hw/cxl/cxl_host.h
+++ b/include/hw/cxl/cxl_host.h
@@ -16,6 +16,7 @@
 
 void cxl_machine_init(Object *obj, CXLState *state);
 void cxl_fmws_link_targets(CXLState *stat, Error **errp);
+void cxl_hook_up_pxb_registers(PCIBus *bus, CXLState *state, Error **errp);
 
 extern const MemoryRegionOps cfmws_ops;
 
diff --git a/include/hw/pci-bridge/pci_expander_bridge.h b/include/hw/pci-bridge/pci_expander_bridge.h
new file mode 100644
index 0000000000..0b3856d615
--- /dev/null
+++ b/include/hw/pci-bridge/pci_expander_bridge.h
@@ -0,0 +1,12 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef PCI_EXPANDER_BRIDGE_H
+#define PCI_EXPANDER_BRIDGE_H
+
+#include "hw/cxl/cxl.h"
+
+void pxb_cxl_hook_up_registers(CXLState *state, PCIBus *bus, Error **errp);
+
+#endif /* PCI_EXPANDER_BRIDGE_H */
diff --git a/hw/cxl/cxl-host-stubs.c b/hw/cxl/cxl-host-stubs.c
index e0d5ec8ad5..cae4afcdde 100644
--- a/hw/cxl/cxl-host-stubs.c
+++ b/hw/cxl/cxl-host-stubs.c
@@ -10,5 +10,6 @@
 
 void cxl_fmws_link_targets(CXLState *stat, Error **errp) {};
 void cxl_machine_init(Object *obj, CXLState *state) {};
+void cxl_hook_up_pxb_registers(PCIBus *bus, CXLState *state, Error **errp) {};
 
 const MemoryRegionOps cfmws_ops;
diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
index 8e7738a65b..efa14908d8 100644
--- a/hw/cxl/cxl-host.c
+++ b/hw/cxl/cxl-host.c
@@ -20,6 +20,7 @@
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_host.h"
 #include "hw/pci/pcie_port.h"
+#include "hw/pci-bridge/pci_expander_bridge.h"
 
 static void cxl_fixed_memory_window_config(CXLState *cxl_state,
                                            CXLFixedMemoryWindowOptions *object,
@@ -280,3 +281,22 @@ void cxl_machine_init(Object *obj, CXLState *state)
     object_property_set_description(obj, "cxl-fmw",
                                     "CXL Fixed Memory Windows (array)");
 }
+
+void cxl_hook_up_pxb_registers(PCIBus *bus, CXLState *state, Error **errp)
+{
+    /* Walk the pci busses looking for pxb busses to hook up */
+    if (bus) {
+        QLIST_FOREACH(bus, &bus->child, sibling) {
+            if (!pci_bus_is_root(bus)) {
+                continue;
+            }
+            if (pci_bus_is_cxl(bus)) {
+                if (!state->is_enabled) {
+                    error_setg(errp, "CXL host bridges present, but cxl=off");
+                    return;
+                }
+                pxb_cxl_hook_up_registers(state, bus, errp);
+            }
+        }
+    }
+}
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 6cecd74d58..9f48d02739 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -37,6 +37,7 @@
 #include "hw/ide.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
+#include "hw/pci-bridge/pci_expander_bridge.h"
 #include "hw/nvram/fw_cfg.h"
 #include "hw/timer/hpet.h"
 #include "hw/firmware/smbios.h"
@@ -735,6 +736,8 @@ void pc_machine_done(Notifier *notifier, void *data)
     MachineState *ms = MACHINE(pcms);
 
     if (ms->cxl_devices_state) {
+        cxl_hook_up_pxb_registers(pcms->bus, ms->cxl_devices_state,
+                                  &error_fatal);
         cxl_fmws_link_targets(ms->cxl_devices_state, &error_fatal);
     }
 
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 02032360f5..c9e817aa58 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -17,6 +17,7 @@
 #include "hw/pci/pci_host.h"
 #include "hw/qdev-properties.h"
 #include "hw/pci/pci_bridge.h"
+#include "hw/pci-bridge/pci_expander_bridge.h"
 #include "hw/cxl/cxl.h"
 #include "qemu/range.h"
 #include "qemu/error-report.h"
@@ -186,25 +187,38 @@ static const TypeInfo pxb_host_info = {
 
 static void pxb_cxl_realize(DeviceState *dev, Error **errp)
 {
-    MachineState *ms = MACHINE(qdev_get_machine());
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     CXLHost *cxl = PXB_CXL_HOST(dev);
     CXLComponentState *cxl_cstate = &cxl->cxl_cstate;
     struct MemoryRegion *mr = &cxl_cstate->crb.component_registers;
-    hwaddr offset;
 
     cxl_component_register_block_init(OBJECT(dev), cxl_cstate,
                                       TYPE_PXB_CXL_HOST);
     sysbus_init_mmio(sbd, mr);
+}
 
-    offset = memory_region_size(mr) * ms->cxl_devices_state->next_mr_idx;
-    if (offset > memory_region_size(&ms->cxl_devices_state->host_mr)) {
+/*
+ * Host bridge realization has no means of knowning state associated
+ * with a particular machine. As such, it is nececssary to delay
+ * final setup of the host bridge register space until later in the
+ * machine bring up.
+ */
+void pxb_cxl_hook_up_registers(CXLState *cxl_state, PCIBus *bus, Error **errp)
+{
+    PXBDev *pxb =  PXB_CXL_DEV(pci_bridge_get_device(bus));
+    CXLHost *cxl = pxb->cxl.cxl_host_bridge;
+    CXLComponentState *cxl_cstate = &cxl->cxl_cstate;
+    struct MemoryRegion *mr = &cxl_cstate->crb.component_registers;
+    hwaddr offset;
+
+    offset = memory_region_size(mr) * cxl_state->next_mr_idx;
+    if (offset > memory_region_size(&cxl_state->host_mr)) {
         error_setg(errp, "Insufficient space for pxb cxl host register space");
         return;
     }
 
-    memory_region_add_subregion(&ms->cxl_devices_state->host_mr, offset, mr);
-    ms->cxl_devices_state->next_mr_idx++;
+    memory_region_add_subregion(&cxl_state->host_mr, offset, mr);
+    cxl_state->next_mr_idx++;
 }
 
 static void pxb_cxl_host_class_init(ObjectClass *class, void *data)
@@ -461,17 +475,11 @@ static const TypeInfo pxb_pcie_dev_info = {
 
 static void pxb_cxl_dev_realize(PCIDevice *dev, Error **errp)
 {
-    MachineState *ms = MACHINE(qdev_get_machine());
-
     /* A CXL PXB's parent bus is still PCIe */
     if (!pci_bus_is_express(pci_get_bus(dev))) {
         error_setg(errp, "pxb-cxl devices cannot reside on a PCI bus");
         return;
     }
-    if (!ms->cxl_devices_state || !ms->cxl_devices_state->is_enabled) {
-        error_setg(errp, "Machine does not have cxl=on");
-        return;
-    }
 
     pxb_dev_realize_common(dev, CXL, errp);
     pxb_dev_reset(DEVICE(dev));
diff --git a/hw/pci-bridge/pci_expander_bridge_stubs.c b/hw/pci-bridge/pci_expander_bridge_stubs.c
new file mode 100644
index 0000000000..b35180311f
--- /dev/null
+++ b/hw/pci-bridge/pci_expander_bridge_stubs.c
@@ -0,0 +1,14 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Stubs for calls made from machines to handle the case where CONFIG_PXB
+ * is not enabled.
+ */
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/pci-bridge/pci_expander_bridge.h"
+#include "hw/cxl/cxl.h"
+
+void pxb_cxl_hook_up_registers(CXLState *state, PCIBus *bus, Error **errp) {};
diff --git a/hw/pci-bridge/meson.build b/hw/pci-bridge/meson.build
index b6d26a03d5..fdbe2e07c5 100644
--- a/hw/pci-bridge/meson.build
+++ b/hw/pci-bridge/meson.build
@@ -3,7 +3,8 @@ pci_ss.add(files('pci_bridge_dev.c'))
 pci_ss.add(when: 'CONFIG_I82801B11', if_true: files('i82801b11.c'))
 pci_ss.add(when: 'CONFIG_IOH3420', if_true: files('ioh3420.c'))
 pci_ss.add(when: 'CONFIG_PCIE_PORT', if_true: files('pcie_root_port.c', 'gen_pcie_root_port.c', 'pcie_pci_bridge.c'))
-pci_ss.add(when: 'CONFIG_PXB', if_true: files('pci_expander_bridge.c'))
+pci_ss.add(when: 'CONFIG_PXB', if_true: files('pci_expander_bridge.c'),
+                               if_false: files('pci_expander_bridge_stubs.c'))
 pci_ss.add(when: 'CONFIG_XIO3130', if_true: files('xio3130_upstream.c', 'xio3130_downstream.c'))
 pci_ss.add(when: 'CONFIG_CXL', if_true: files('cxl_root_port.c'))
 
@@ -13,3 +14,5 @@ pci_ss.add(when: 'CONFIG_DEC_PCI', if_true: files('dec.c'))
 pci_ss.add(when: 'CONFIG_SIMBA', if_true: files('simba.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_PCI', if_true: pci_ss)
+
+softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('pci_expander_bridge_stubs.c'))
-- 
MST


