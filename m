Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C0A622015
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 00:08:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osXbZ-0004s7-CH; Tue, 08 Nov 2022 18:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbN-0004oQ-3u
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:02:01 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbI-0003ez-Lk
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:01:50 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A8MtnUx007240
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : in-reply-to : references;
 s=corp-2022-7-12; bh=eSMKp2Ai0SkI6Y3wHnPaDRt+SLBGfuHcBE+Jcs44NNc=;
 b=ZolF57iTypjGf9qGSUyBOCFU25spf9jMUhtjBuc8Ux82xLiql+G1EaBYdPsoit1ZmKDa
 T/p78oNwAxcF0lHMMmlxWCSoStjZ/HUrPk65gpO4ivC5hurofbnW2D+ou/VAin6HaK4O
 3M65i5GFXcSjIBwJs16BqCVWlWKV018b4hFTP3yIQHWf1GHlpkNmMhPBby6cVYUUhcQp
 lKaR9mN8/DfvNGn2qGHV36GMz33CwKz7vKTB0UQ583c9g1b8UNPviaAPpDtJxizSeg1r
 j+1CN33sLlKYVQbt5SolINii9vCBdmj3AIY2rUY0q042RwTqkFhM3T76wfSwSnRyX1Rk gQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kqyy1845v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:47 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2A8LjK6K004437
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:45 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-143-202.vpn.oracle.com
 [10.65.143.202])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3kpcq2k0b9-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:45 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 06/24] vfio-user: Define type vfio_user_pci_dev_info
Date: Tue,  8 Nov 2022 15:13:28 -0800
Message-Id: <957361f0e497e0b95f10a3caf617fe04d9c6fb72.1667542066.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1667542066.git.john.g.johnson@oracle.com>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
In-Reply-To: <cover.1667542066.git.john.g.johnson@oracle.com>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211080151
X-Proofpoint-GUID: 5u4dLblojtXlEm_4Bswt7hL_v-bsWi8r
X-Proofpoint-ORIG-GUID: 5u4dLblojtXlEm_4Bswt7hL_v-bsWi8r
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
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
 hw/vfio/Kconfig  | 10 +++++++
 hw/vfio/common.c |  5 ++++
 hw/vfio/pci.c    | 89 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/pci.h    |  8 +++++
 4 files changed, 112 insertions(+)

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
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index c7bf0aa..c589bd9 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1774,6 +1774,11 @@ void vfio_reset_handler(void *opaque)
     QLIST_FOREACH(group, &vfio_group_list, next) {
         QLIST_FOREACH(vbasedev, &group->device_list, next) {
             if (vbasedev->dev->realized && vbasedev->needs_reset) {
+                if (vbasedev->ops->vfio_hot_reset_multi == NULL) {
+                    error_printf("%s: No hot reset handler specified\n",
+                                 vbasedev->name);
+                    continue;
+                }
                 vbasedev->ops->vfio_hot_reset_multi(vbasedev);
             }
         }
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 80b03a2..dc19869 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include CONFIG_DEVICES
 #include <linux/vfio.h>
 #include <sys/ioctl.h>
 
@@ -3421,3 +3422,91 @@ static void register_vfio_pci_dev_type(void)
 }
 
 type_init(register_vfio_pci_dev_type)
+
+
+#ifdef CONFIG_VFIO_USER_PCI
+
+/*
+ * vfio-user routines.
+ */
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
+
+#endif /* VFIO_USER_PCI */
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 7c5c8ec..27db931 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -189,6 +189,14 @@ struct VFIOKernPCIDevice {
     VFIOPCIDevice device;
 };
 
+#define TYPE_VFIO_USER_PCI "vfio-user-pci"
+OBJECT_DECLARE_SIMPLE_TYPE(VFIOUserPCIDevice, VFIO_USER_PCI)
+
+struct VFIOUserPCIDevice {
+    VFIOPCIDevice device;
+    char *sock_name;
+};
+
 /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
 static inline bool vfio_pci_is(VFIOPCIDevice *vdev, uint32_t vendor, uint32_t device)
 {
-- 
1.8.3.1


