Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FD9687580
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 06:49:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNSPC-00087f-Uz; Thu, 02 Feb 2023 00:45:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSPB-00087O-N1
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:45:05 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSP9-0006yM-K2
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:45:05 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3124i0QR023941; Thu, 2 Feb 2023 05:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references : mime-version : content-type : content-transfer-encoding;
 s=corp-2022-7-12; bh=TNWwnIlZeZSXe1fgH8hwnwdIngJ5K1drlS8NEG5K90E=;
 b=tVcE2iNrkyLOEfXGZQvmDM72pm1km8T1i6wW0yClqBxuP+2FhdMNSYegVfiblVX+gJSz
 pgVQnK3HFY3UQODM+87bjVUB65AgLjknVVcgr4D+h6TI2LWeNrvNQCQ4MyzKnko+Bgf+
 d9tceNlltVF9QxdsHH0bSVf8KKXgzbbpeXabZ2HcU7q7yIT7pRkoDNo7+0UYfI+VhzUU
 Vb7PGvcbw0oq/mtMnYvBPC/S/5Y9OxoxoFt2s7oVC5XBeTIrYuN/diXRRhBbzcraEbh0
 ZJtinbf5ZPSZWR36/izZlZxpt+N3cRVErakmGQNHd1PBtkS/kJKgAfgmVVN36WrW1njt bw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfkd1tfd0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 05:45:01 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31254PpZ013015; Thu, 2 Feb 2023 05:44:59 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-133-23.vpn.oracle.com
 [10.65.133.23])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nct5f5gb1-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 02 Feb 2023 05:44:59 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org
Subject: [PATCH v2 06/23] vfio-user: Define type vfio_user_pci_dev_info
Date: Wed,  1 Feb 2023 21:55:42 -0800
Message-Id: <08e29735fca137ca972234727aebd73638fedb41.1675228037.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1675228037.git.john.g.johnson@oracle.com>
References: <cover.1675228037.git.john.g.johnson@oracle.com>
In-Reply-To: <cover.1675228037.git.john.g.johnson@oracle.com>
References: <cover.1675228037.git.john.g.johnson@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_15,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302020053
X-Proofpoint-GUID: N9CHbK7IYNVPyUeffmZ2VI-VP5gXBYLR
X-Proofpoint-ORIG-GUID: N9CHbK7IYNVPyUeffmZ2VI-VP5gXBYLR
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

New class for vfio-user with its class and instance
constructors and destructors, and its pci ops.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.h       |   7 +++
 hw/vfio/pci.c       |  12 +++---
 hw/vfio/user-pci.c  | 121 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS         |   3 ++
 hw/vfio/Kconfig     |  10 +++++
 hw/vfio/meson.build |   1 +
 6 files changed, 148 insertions(+), 6 deletions(-)
 create mode 100644 hw/vfio/user-pci.c

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 7fb656c..50a1d07 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -208,6 +208,13 @@ uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len);
 void vfio_pci_write_config(PCIDevice *pdev,
                            uint32_t addr, uint32_t val, int len);
 
+void vfio_intx_eoi(VFIODevice *vbasedev);
+Object *vfio_pci_get_object(VFIODevice *vbasedev);
+void vfio_pci_save_config(VFIODevice *vbasedev, QEMUFile *f);
+int vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f);
+void vfio_put_device(VFIOPCIDevice *vdev);
+void vfio_instance_init(Object *obj);
+
 uint64_t vfio_vga_read(void *opaque, hwaddr addr, unsigned size);
 void vfio_vga_write(void *opaque, hwaddr addr, uint64_t data, unsigned size);
 
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index c3c2e76..a8bc0ea 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -107,7 +107,7 @@ static void vfio_intx_interrupt(void *opaque)
     }
 }
 
-static void vfio_intx_eoi(VFIODevice *vbasedev)
+void vfio_intx_eoi(VFIODevice *vbasedev)
 {
     VFIOPCIDevice *vdev = container_of(vbasedev, VFIOPCIDevice, vbasedev);
 
@@ -2492,7 +2492,7 @@ static void vfio_pci_compute_needs_reset(VFIODevice *vbasedev)
     }
 }
 
-static Object *vfio_pci_get_object(VFIODevice *vbasedev)
+Object *vfio_pci_get_object(VFIODevice *vbasedev)
 {
     VFIOPCIDevice *vdev = container_of(vbasedev, VFIOPCIDevice, vbasedev);
 
@@ -2517,14 +2517,14 @@ const VMStateDescription vmstate_vfio_pci_config = {
     }
 };
 
-static void vfio_pci_save_config(VFIODevice *vbasedev, QEMUFile *f)
+void vfio_pci_save_config(VFIODevice *vbasedev, QEMUFile *f)
 {
     VFIOPCIDevice *vdev = container_of(vbasedev, VFIOPCIDevice, vbasedev);
 
     vmstate_save_state(f, &vmstate_vfio_pci_config, vdev, NULL);
 }
 
-static int vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f)
+int vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f)
 {
     VFIOPCIDevice *vdev = container_of(vbasedev, VFIOPCIDevice, vbasedev);
     PCIDevice *pdev = &vdev->pdev;
@@ -2719,7 +2719,7 @@ static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
     }
 }
 
-static void vfio_put_device(VFIOPCIDevice *vdev)
+void vfio_put_device(VFIOPCIDevice *vdev)
 {
     g_free(vdev->vbasedev.name);
     g_free(vdev->msix);
@@ -3271,7 +3271,7 @@ post_reset:
     vfio_pci_post_reset(vdev);
 }
 
-static void vfio_instance_init(Object *obj)
+void vfio_instance_init(Object *obj)
 {
     PCIDevice *pci_dev = PCI_DEVICE(obj);
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
diff --git a/hw/vfio/user-pci.c b/hw/vfio/user-pci.c
new file mode 100644
index 0000000..fc47a3e
--- /dev/null
+++ b/hw/vfio/user-pci.c
@@ -0,0 +1,121 @@
+/*
+ * vfio PCI device over a UNIX socket.
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include <linux/vfio.h>
+#include <sys/ioctl.h>
+
+#include "hw/hw.h"
+#include "hw/pci/msi.h"
+#include "hw/pci/msix.h"
+#include "hw/pci/pci_bridge.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
+#include "migration/vmstate.h"
+#include "qapi/qmp/qdict.h"
+#include "qemu/error-report.h"
+#include "qemu/main-loop.h"
+#include "qemu/module.h"
+#include "qemu/range.h"
+#include "qemu/units.h"
+#include "sysemu/kvm.h"
+#include "sysemu/runstate.h"
+#include "pci.h"
+#include "trace.h"
+#include "qapi/error.h"
+#include "migration/blocker.h"
+#include "migration/qemu-file.h"
+
+#define TYPE_VFIO_USER_PCI "vfio-user-pci"
+OBJECT_DECLARE_SIMPLE_TYPE(VFIOUserPCIDevice, VFIO_USER_PCI)
+
+struct VFIOUserPCIDevice {
+    VFIOPCIDevice device;
+    char *sock_name;
+};
+
+/*
+ * Emulated devices don't use host hot reset
+ */
+static void vfio_user_compute_needs_reset(VFIODevice *vbasedev)
+{
+    vbasedev->needs_reset = false;
+}
+
+static VFIODeviceOps vfio_user_pci_ops = {
+    .vfio_compute_needs_reset = vfio_user_compute_needs_reset,
+    .vfio_eoi = vfio_intx_eoi,
+    .vfio_get_object = vfio_pci_get_object,
+    .vfio_save_config = vfio_pci_save_config,
+    .vfio_load_config = vfio_pci_load_config,
+};
+
+static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
+{
+    ERRP_GUARD();
+    VFIOUserPCIDevice *udev = VFIO_USER_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
+    VFIODevice *vbasedev = &vdev->vbasedev;
+
+    /*
+     * TODO: make option parser understand SocketAddress
+     * and use that instead of having scalar options
+     * for each socket type.
+     */
+    if (!udev->sock_name) {
+        error_setg(errp, "No socket specified");
+        error_append_hint(errp, "Use -device vfio-user-pci,socket=<name>\n");
+        return;
+    }
+
+    vbasedev->name = g_strdup_printf("VFIO user <%s>", udev->sock_name);
+    vbasedev->ops = &vfio_user_pci_ops;
+    vbasedev->type = VFIO_DEVICE_TYPE_PCI;
+    vbasedev->dev = DEVICE(vdev);
+
+}
+
+static void vfio_user_instance_finalize(Object *obj)
+{
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
+
+    vfio_put_device(vdev);
+}
+
+static Property vfio_user_pci_dev_properties[] = {
+    DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vfio_user_pci_dev_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *pdc = PCI_DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, vfio_user_pci_dev_properties);
+    dc->desc = "VFIO over socket PCI device assignment";
+    pdc->realize = vfio_user_pci_realize;
+}
+
+static const TypeInfo vfio_user_pci_dev_info = {
+    .name = TYPE_VFIO_USER_PCI,
+    .parent = TYPE_VFIO_PCI_BASE,
+    .instance_size = sizeof(VFIOUserPCIDevice),
+    .class_init = vfio_user_pci_dev_class_init,
+    .instance_init = vfio_instance_init,
+    .instance_finalize = vfio_user_instance_finalize,
+};
+
+static void register_vfio_user_dev_type(void)
+{
+    type_register_static(&vfio_user_pci_dev_info);
+}
+
+type_init(register_vfio_user_dev_type)
diff --git a/MAINTAINERS b/MAINTAINERS
index 999340d..28fce0e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1987,8 +1987,11 @@ L: qemu-s390x@nongnu.org
 vfio-user
 M: John G Johnson <john.g.johnson@oracle.com>
 M: Thanos Makatos <thanos.makatos@nutanix.com>
+M: Elena Ufimtseva <elena.ufimtseva@oracle.com>
+M: Jagannathan Raman <jag.raman@oracle.com>
 S: Supported
 F: docs/devel/vfio-user.rst
+F: hw/vfio/user*
 
 vhost
 M: Michael S. Tsirkin <mst@redhat.com>
diff --git a/hw/vfio/Kconfig b/hw/vfio/Kconfig
index 7cdba05..301894e 100644
--- a/hw/vfio/Kconfig
+++ b/hw/vfio/Kconfig
@@ -2,6 +2,10 @@ config VFIO
     bool
     depends on LINUX
 
+config VFIO_USER
+    bool
+    depends on VFIO
+
 config VFIO_PCI
     bool
     default y
@@ -9,6 +13,12 @@ config VFIO_PCI
     select EDID
     depends on LINUX && PCI
 
+config VFIO_USER_PCI
+    bool
+    default y
+    select VFIO_USER
+    depends on VFIO_PCI
+
 config VFIO_CCW
     bool
     default y
diff --git a/hw/vfio/meson.build b/hw/vfio/meson.build
index da9af29..731c3c6 100644
--- a/hw/vfio/meson.build
+++ b/hw/vfio/meson.build
@@ -9,6 +9,7 @@ vfio_ss.add(when: 'CONFIG_VFIO_PCI', if_true: files(
   'pci-quirks.c',
   'pci.c',
 ))
+vfio_ss.add(when: 'CONFIG_VFIO_USER_PCI', if_true: files('user-pci.c'))
 vfio_ss.add(when: 'CONFIG_VFIO_CCW', if_true: files('ccw.c'))
 vfio_ss.add(when: 'CONFIG_VFIO_PLATFORM', if_true: files('platform.c'))
 vfio_ss.add(when: 'CONFIG_VFIO_XGMAC', if_true: files('calxeda-xgmac.c'))
-- 
1.9.4


