Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E134D692A1E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 23:29:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQbrx-0002IX-Ob; Fri, 10 Feb 2023 17:27:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pQbru-0002Gv-KR
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 17:27:46 -0500
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pQbrs-0007kU-6N
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 17:27:46 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C8D55B825FD;
 Fri, 10 Feb 2023 22:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B1AC4339C;
 Fri, 10 Feb 2023 22:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676068062;
 bh=9jAC8F5xA/azSePIdP3et7YP+18kRnpPJUTbURgYLnk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kUR5WB9owdv7nvjYM2KtC6DVrI/gAMFqLt37701J86/iFYGGrCaT610HURUXKPGeF
 RXe69OpF/MVTRyV9N3qjDsdMkdo6U9SxtWTJcziOAZYc7CTEloMw5ODEcAM5nnss9J
 QBR2XfRMINpEd6U33y08WBMi+UyOFTgI3OhOTI2moigRbjKmCJP8txt7FEnTEBHxsH
 MilLs9xVsdwTl87SsG3NBjHeEcTmAfT/F0ALMjgLr1m/IkLQBv8CsqmyE1GY0+EteR
 76lH44+cAFC688uoyZMQMO2uozl+b4oKExMUcB6es1mYxicmbX/MbKXftNgzotPh/b
 cWJ6ynn7KWVhA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org, peter.maydell@linaro.org,
 Vikram Garhwal <vikram.garhwal@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PULL 09/10] hw/arm: introduce xenpvh machine
Date: Fri, 10 Feb 2023 14:27:28 -0800
Message-Id: <20230210222729.957168-9-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2302101420510.4661@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2302101420510.4661@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75; envelope-from=sstabellini@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

From: Vikram Garhwal <vikram.garhwal@amd.com>

Add a new machine xenpvh which creates a IOREQ server to register/connect with
Xen Hypervisor.

Optional: When CONFIG_TPM is enabled, it also creates a tpm-tis-device, adds a
TPM emulator and connects to swtpm running on host machine via chardev socket
and support TPM functionalities for a guest domain.

Extra command line for aarch64 xenpvh QEMU to connect to swtpm:
    -chardev socket,id=chrtpm,path=/tmp/myvtpm2/swtpm-sock \
    -tpmdev emulator,id=tpm0,chardev=chrtpm \
    -machine tpm-base-addr=0x0c000000 \

swtpm implements a TPM software emulator(TPM 1.2 & TPM 2) built on libtpms and
provides access to TPM functionality over socket, chardev and CUSE interface.
Github repo: https://github.com/stefanberger/swtpm
Example for starting swtpm on host machine:
    mkdir /tmp/vtpm2
    swtpm socket --tpmstate dir=/tmp/vtpm2 \
    --ctrl type=unixio,path=/tmp/vtpm2/swtpm-sock &

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 docs/system/arm/xenpvh.rst    |  34 +++++++
 docs/system/target-arm.rst    |   1 +
 hw/arm/meson.build            |   2 +
 hw/arm/xen_arm.c              | 182 ++++++++++++++++++++++++++++++++++
 include/hw/arm/xen_arch_hvm.h |   9 ++
 include/hw/xen/arch_hvm.h     |   2 +
 6 files changed, 230 insertions(+)
 create mode 100644 docs/system/arm/xenpvh.rst
 create mode 100644 hw/arm/xen_arm.c
 create mode 100644 include/hw/arm/xen_arch_hvm.h

diff --git a/docs/system/arm/xenpvh.rst b/docs/system/arm/xenpvh.rst
new file mode 100644
index 0000000000..e1655c7ab8
--- /dev/null
+++ b/docs/system/arm/xenpvh.rst
@@ -0,0 +1,34 @@
+XENPVH (``xenpvh``)
+=========================================
+This machine creates a IOREQ server to register/connect with Xen Hypervisor.
+
+When TPM is enabled, this machine also creates a tpm-tis-device at a user input
+tpm base address, adds a TPM emulator and connects to a swtpm application
+running on host machine via chardev socket. This enables xenpvh to support TPM
+functionalities for a guest domain.
+
+More information about TPM use and installing swtpm linux application can be
+found at: docs/specs/tpm.rst.
+
+Example for starting swtpm on host machine:
+.. code-block:: console
+
+    mkdir /tmp/vtpm2
+    swtpm socket --tpmstate dir=/tmp/vtpm2 \
+    --ctrl type=unixio,path=/tmp/vtpm2/swtpm-sock &
+
+Sample QEMU xenpvh commands for running and connecting with Xen:
+.. code-block:: console
+
+    qemu-system-aarch64 -xen-domid 1 \
+    -chardev socket,id=libxl-cmd,path=qmp-libxl-1,server=on,wait=off \
+    -mon chardev=libxl-cmd,mode=control \
+    -chardev socket,id=libxenstat-cmd,path=qmp-libxenstat-1,server=on,wait=off \
+    -mon chardev=libxenstat-cmd,mode=control \
+    -xen-attach -name guest0 -vnc none -display none -nographic \
+    -machine xenpvh -m 1301 \
+    -chardev socket,id=chrtpm,path=tmp/vtpm2/swtpm-sock \
+    -tpmdev emulator,id=tpm0,chardev=chrtpm -machine tpm-base-addr=0x0C000000
+
+In above QEMU command, last two lines are for connecting xenpvh QEMU to swtpm
+via chardev socket.
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index 91ebc26c6d..af8d7c77d6 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -106,6 +106,7 @@ undocumented; you can get a complete list by running
    arm/stm32
    arm/virt
    arm/xlnx-versal-virt
+   arm/xenpvh
 
 Emulated CPU architecture support
 =================================
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index b545ba0e4f..1b2a01a005 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -62,6 +62,8 @@ arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.
 arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
 arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
+arm_ss.add(when: 'CONFIG_XEN', if_true: files('xen_arm.c'))
+arm_ss.add_all(xen_ss)
 
 softmmu_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
 softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
new file mode 100644
index 0000000000..eaca65af37
--- /dev/null
+++ b/hw/arm/xen_arm.c
@@ -0,0 +1,182 @@
+/*
+ * QEMU ARM Xen PVH Machine
+ *
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "qapi/qapi-commands-migration.h"
+#include "qapi/visitor.h"
+#include "hw/boards.h"
+#include "hw/sysbus.h"
+#include "sysemu/block-backend.h"
+#include "sysemu/tpm_backend.h"
+#include "sysemu/sysemu.h"
+#include "hw/xen/xen-legacy-backend.h"
+#include "hw/xen/xen-hvm-common.h"
+#include "sysemu/tpm.h"
+#include "hw/xen/arch_hvm.h"
+
+#define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
+OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
+
+static MemoryListener xen_memory_listener = {
+    .region_add = xen_region_add,
+    .region_del = xen_region_del,
+    .log_start = NULL,
+    .log_stop = NULL,
+    .log_sync = NULL,
+    .log_global_start = NULL,
+    .log_global_stop = NULL,
+    .priority = 10,
+};
+
+struct XenArmState {
+    /*< private >*/
+    MachineState parent;
+
+    XenIOState *state;
+
+    struct {
+        uint64_t tpm_base_addr;
+    } cfg;
+};
+
+void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
+{
+    hw_error("Invalid ioreq type 0x%x\n", req->type);
+
+    return;
+}
+
+void arch_xen_set_memory(XenIOState *state, MemoryRegionSection *section,
+                         bool add)
+{
+}
+
+void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
+{
+}
+
+void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
+{
+}
+
+#ifdef CONFIG_TPM
+static void xen_enable_tpm(XenArmState *xam)
+{
+    Error *errp = NULL;
+    DeviceState *dev;
+    SysBusDevice *busdev;
+
+    TPMBackend *be = qemu_find_tpm_be("tpm0");
+    if (be == NULL) {
+        DPRINTF("Couldn't fine the backend for tpm0\n");
+        return;
+    }
+    dev = qdev_new(TYPE_TPM_TIS_SYSBUS);
+    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp);
+    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);
+    busdev = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(busdev, &error_fatal);
+    sysbus_mmio_map(busdev, 0, xam->cfg.tpm_base_addr);
+
+    DPRINTF("Connected tpmdev at address 0x%lx\n", xam->cfg.tpm_base_addr);
+}
+#endif
+
+static void xen_arm_init(MachineState *machine)
+{
+    XenArmState *xam = XEN_ARM(machine);
+
+    xam->state =  g_new0(XenIOState, 1);
+
+    xen_register_ioreq(xam->state, machine->smp.cpus, xen_memory_listener);
+
+#ifdef CONFIG_TPM
+    if (xam->cfg.tpm_base_addr) {
+        xen_enable_tpm(xam);
+    } else {
+        DPRINTF("tpm-base-addr is not provided. TPM will not be enabled\n");
+    }
+#endif
+}
+
+#ifdef CONFIG_TPM
+static void xen_arm_get_tpm_base_addr(Object *obj, Visitor *v,
+                                      const char *name, void *opaque,
+                                      Error **errp)
+{
+    XenArmState *xam = XEN_ARM(obj);
+    uint64_t value = xam->cfg.tpm_base_addr;
+
+    visit_type_uint64(v, name, &value, errp);
+}
+
+static void xen_arm_set_tpm_base_addr(Object *obj, Visitor *v,
+                                      const char *name, void *opaque,
+                                      Error **errp)
+{
+    XenArmState *xam = XEN_ARM(obj);
+    uint64_t value;
+
+    if (!visit_type_uint64(v, name, &value, errp)) {
+        return;
+    }
+
+    xam->cfg.tpm_base_addr = value;
+}
+#endif
+
+static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
+{
+
+    MachineClass *mc = MACHINE_CLASS(oc);
+    mc->desc = "Xen Para-virtualized PC";
+    mc->init = xen_arm_init;
+    mc->max_cpus = 1;
+    mc->default_machine_opts = "accel=xen";
+
+#ifdef CONFIG_TPM
+    object_class_property_add(oc, "tpm-base-addr", "uint64_t",
+                              xen_arm_get_tpm_base_addr,
+                              xen_arm_set_tpm_base_addr,
+                              NULL, NULL);
+    object_class_property_set_description(oc, "tpm-base-addr",
+                                          "Set Base address for TPM device.");
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
+#endif
+}
+
+static const TypeInfo xen_arm_machine_type = {
+    .name = TYPE_XEN_ARM,
+    .parent = TYPE_MACHINE,
+    .class_init = xen_arm_machine_class_init,
+    .instance_size = sizeof(XenArmState),
+};
+
+static void xen_arm_machine_register_types(void)
+{
+    type_register_static(&xen_arm_machine_type);
+}
+
+type_init(xen_arm_machine_register_types)
diff --git a/include/hw/arm/xen_arch_hvm.h b/include/hw/arm/xen_arch_hvm.h
new file mode 100644
index 0000000000..8fd645e723
--- /dev/null
+++ b/include/hw/arm/xen_arch_hvm.h
@@ -0,0 +1,9 @@
+#ifndef HW_XEN_ARCH_ARM_HVM_H
+#define HW_XEN_ARCH_ARM_HVM_H
+
+#include <xen/hvm/ioreq.h>
+void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
+void arch_xen_set_memory(XenIOState *state,
+                         MemoryRegionSection *section,
+                         bool add);
+#endif
diff --git a/include/hw/xen/arch_hvm.h b/include/hw/xen/arch_hvm.h
index 26674648d8..c7c515220d 100644
--- a/include/hw/xen/arch_hvm.h
+++ b/include/hw/xen/arch_hvm.h
@@ -1,3 +1,5 @@
 #if defined(TARGET_I386) || defined(TARGET_X86_64)
 #include "hw/i386/xen_arch_hvm.h"
+#elif defined(TARGET_ARM) || defined(TARGET_ARM_64)
+#include "hw/arm/xen_arch_hvm.h"
 #endif
-- 
2.25.1


