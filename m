Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70E4622013
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 00:08:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osXbv-0005BU-Bc; Tue, 08 Nov 2022 18:02:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbs-000591-Uy
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:02:24 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbY-0003fY-H2
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:02:23 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A8MtnV1007240
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : in-reply-to : references;
 s=corp-2022-7-12; bh=R4AKOft6bpKhFbNuMSqoDUeQG9A9TOsZwMvbPHIN1Pk=;
 b=1V8KLW3W6vfajvKENGJ3W5XQFlkmofPXowoC8GO66L2zNu7Ros3S3v7pyvJrd6fhNr3V
 d92PEnJpybGP08yFd8hEPzefNQicSdfldZ1g/+dp0YlJU61fkiEQieOBYM9K+hX6yxa/
 L+qnh3k+H5S1utQjhnRLvk1og5Inbg7DkRuMB8cZBg269Owks8/TbcsHY3q8TjtMztRa
 fi/Lmj6LNfozCfgADDy/t8cAT++tZ9B3VpRA/4KkRxrGF3PEtAj+KiGJCddK/IkRjwtO
 RWp3MxQRqWY7cPR9RCdBzrJdb5w8MXG1Y+Lo+72OCmPn7c1NukvBLTfm/LNpQzlmKIyI gg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kqyy18460-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:49 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2A8LjK6R004437
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:48 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-143-202.vpn.oracle.com
 [10.65.143.202])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3kpcq2k0b9-14
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:48 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 13/24] vfio-user: pci_user_realize PCI setup
Date: Tue,  8 Nov 2022 15:13:35 -0800
Message-Id: <9b5702602c3bc0c79df893b269276c74b057026b.1667542066.git.john.g.johnson@oracle.com>
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
X-Proofpoint-GUID: TRT9aiH5qQiYTYfybGnEF-HjZxy6RQ5y
X-Proofpoint-ORIG-GUID: TRT9aiH5qQiYTYfybGnEF-HjZxy6RQ5y
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

PCI BARs read from remote device
PCI config reads/writes sent to remote server

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.c | 277 ++++++++++++++++++++++++++++++++++++----------------------
 1 file changed, 174 insertions(+), 103 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 027f9d5..7abe44e 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2874,6 +2874,133 @@ static void vfio_unregister_req_notifier(VFIOPCIDevice *vdev)
     vdev->req_enabled = false;
 }
 
+static void vfio_pci_config_setup(VFIOPCIDevice *vdev, Error **errp)
+{
+    PCIDevice *pdev = &vdev->pdev;
+    VFIODevice *vbasedev = &vdev->vbasedev;
+    Error *err = NULL;
+
+    /* vfio emulates a lot for us, but some bits need extra love */
+    vdev->emulated_config_bits = g_malloc0(vdev->config_size);
+
+    /* QEMU can choose to expose the ROM or not */
+    memset(vdev->emulated_config_bits + PCI_ROM_ADDRESS, 0xff, 4);
+    /* QEMU can also add or extend BARs */
+    memset(vdev->emulated_config_bits + PCI_BASE_ADDRESS_0, 0xff, 6 * 4);
+
+    /*
+     * The PCI spec reserves vendor ID 0xffff as an invalid value.  The
+     * device ID is managed by the vendor and need only be a 16-bit value.
+     * Allow any 16-bit value for subsystem so they can be hidden or changed.
+     */
+    if (vdev->vendor_id != PCI_ANY_ID) {
+        if (vdev->vendor_id >= 0xffff) {
+            error_setg(errp, "invalid PCI vendor ID provided");
+            return;
+        }
+        vfio_add_emulated_word(vdev, PCI_VENDOR_ID, vdev->vendor_id, ~0);
+        trace_vfio_pci_emulated_vendor_id(vdev->vbasedev.name, vdev->vendor_id);
+    } else {
+        vdev->vendor_id = pci_get_word(pdev->config + PCI_VENDOR_ID);
+    }
+
+    if (vdev->device_id != PCI_ANY_ID) {
+        if (vdev->device_id > 0xffff) {
+            error_setg(errp, "invalid PCI device ID provided");
+            return;
+        }
+        vfio_add_emulated_word(vdev, PCI_DEVICE_ID, vdev->device_id, ~0);
+        trace_vfio_pci_emulated_device_id(vbasedev->name, vdev->device_id);
+    } else {
+        vdev->device_id = pci_get_word(pdev->config + PCI_DEVICE_ID);
+    }
+
+    if (vdev->sub_vendor_id != PCI_ANY_ID) {
+        if (vdev->sub_vendor_id > 0xffff) {
+            error_setg(errp, "invalid PCI subsystem vendor ID provided");
+            return;
+        }
+        vfio_add_emulated_word(vdev, PCI_SUBSYSTEM_VENDOR_ID,
+                               vdev->sub_vendor_id, ~0);
+        trace_vfio_pci_emulated_sub_vendor_id(vbasedev->name,
+                                              vdev->sub_vendor_id);
+    }
+
+    if (vdev->sub_device_id != PCI_ANY_ID) {
+        if (vdev->sub_device_id > 0xffff) {
+            error_setg(errp, "invalid PCI subsystem device ID provided");
+            return;
+        }
+        vfio_add_emulated_word(vdev, PCI_SUBSYSTEM_ID, vdev->sub_device_id, ~0);
+        trace_vfio_pci_emulated_sub_device_id(vbasedev->name,
+                                              vdev->sub_device_id);
+    }
+
+    /* QEMU can change multi-function devices to single function, or reverse */
+    vdev->emulated_config_bits[PCI_HEADER_TYPE] =
+                                              PCI_HEADER_TYPE_MULTI_FUNCTION;
+
+    /* Restore or clear multifunction, this is always controlled by QEMU */
+    if (vdev->pdev.cap_present & QEMU_PCI_CAP_MULTIFUNCTION) {
+        vdev->pdev.config[PCI_HEADER_TYPE] |= PCI_HEADER_TYPE_MULTI_FUNCTION;
+    } else {
+        vdev->pdev.config[PCI_HEADER_TYPE] &= ~PCI_HEADER_TYPE_MULTI_FUNCTION;
+    }
+
+    /*
+     * Clear host resource mapping info.  If we choose not to register a
+     * BAR, such as might be the case with the option ROM, we can get
+     * confusing, unwritable, residual addresses from the host here.
+     */
+    memset(&vdev->pdev.config[PCI_BASE_ADDRESS_0], 0, 24);
+    memset(&vdev->pdev.config[PCI_ROM_ADDRESS], 0, 4);
+
+    vfio_pci_size_rom(vdev);
+
+    vfio_bars_prepare(vdev);
+
+    vfio_msix_early_setup(vdev, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    vfio_bars_register(vdev);
+}
+
+static int vfio_interrupt_setup(VFIOPCIDevice *vdev, Error **errp)
+{
+    PCIDevice *pdev = &vdev->pdev;
+    int ret;
+
+    /* QEMU emulates all of MSI & MSIX */
+    if (pdev->cap_present & QEMU_PCI_CAP_MSIX) {
+        memset(vdev->emulated_config_bits + pdev->msix_cap, 0xff,
+               MSIX_CAP_LENGTH);
+    }
+
+    if (pdev->cap_present & QEMU_PCI_CAP_MSI) {
+        memset(vdev->emulated_config_bits + pdev->msi_cap, 0xff,
+               vdev->msi_cap_size);
+    }
+
+    if (vfio_pci_read_config(&vdev->pdev, PCI_INTERRUPT_PIN, 1)) {
+        vdev->intx.mmap_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
+                                                  vfio_intx_mmap_enable, vdev);
+        pci_device_set_intx_routing_notifier(&vdev->pdev,
+                                             vfio_intx_routing_notifier);
+        vdev->irqchip_change_notifier.notify = vfio_irqchip_change;
+        kvm_irqchip_add_change_notifier(&vdev->irqchip_change_notifier);
+        ret = vfio_intx_enable(vdev, errp);
+        if (ret) {
+            pci_device_set_intx_routing_notifier(&vdev->pdev, NULL);
+            kvm_irqchip_remove_change_notifier(&vdev->irqchip_change_notifier);
+            return ret;
+        }
+    }
+    return 0;
+}
+
 static void vfio_realize(PCIDevice *pdev, Error **errp)
 {
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
@@ -2990,92 +3117,16 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         goto error;
     }
 
-    /* vfio emulates a lot for us, but some bits need extra love */
-    vdev->emulated_config_bits = g_malloc0(vdev->config_size);
-
-    /* QEMU can choose to expose the ROM or not */
-    memset(vdev->emulated_config_bits + PCI_ROM_ADDRESS, 0xff, 4);
-    /* QEMU can also add or extend BARs */
-    memset(vdev->emulated_config_bits + PCI_BASE_ADDRESS_0, 0xff, 6 * 4);
-
-    /*
-     * The PCI spec reserves vendor ID 0xffff as an invalid value.  The
-     * device ID is managed by the vendor and need only be a 16-bit value.
-     * Allow any 16-bit value for subsystem so they can be hidden or changed.
-     */
-    if (vdev->vendor_id != PCI_ANY_ID) {
-        if (vdev->vendor_id >= 0xffff) {
-            error_setg(errp, "invalid PCI vendor ID provided");
-            goto error;
-        }
-        vfio_add_emulated_word(vdev, PCI_VENDOR_ID, vdev->vendor_id, ~0);
-        trace_vfio_pci_emulated_vendor_id(vbasedev->name, vdev->vendor_id);
-    } else {
-        vdev->vendor_id = pci_get_word(pdev->config + PCI_VENDOR_ID);
-    }
-
-    if (vdev->device_id != PCI_ANY_ID) {
-        if (vdev->device_id > 0xffff) {
-            error_setg(errp, "invalid PCI device ID provided");
-            goto error;
-        }
-        vfio_add_emulated_word(vdev, PCI_DEVICE_ID, vdev->device_id, ~0);
-        trace_vfio_pci_emulated_device_id(vbasedev->name, vdev->device_id);
-    } else {
-        vdev->device_id = pci_get_word(pdev->config + PCI_DEVICE_ID);
-    }
-
-    if (vdev->sub_vendor_id != PCI_ANY_ID) {
-        if (vdev->sub_vendor_id > 0xffff) {
-            error_setg(errp, "invalid PCI subsystem vendor ID provided");
-            goto error;
-        }
-        vfio_add_emulated_word(vdev, PCI_SUBSYSTEM_VENDOR_ID,
-                               vdev->sub_vendor_id, ~0);
-        trace_vfio_pci_emulated_sub_vendor_id(vbasedev->name,
-                                              vdev->sub_vendor_id);
-    }
-
-    if (vdev->sub_device_id != PCI_ANY_ID) {
-        if (vdev->sub_device_id > 0xffff) {
-            error_setg(errp, "invalid PCI subsystem device ID provided");
-            goto error;
-        }
-        vfio_add_emulated_word(vdev, PCI_SUBSYSTEM_ID, vdev->sub_device_id, ~0);
-        trace_vfio_pci_emulated_sub_device_id(vbasedev->name,
-                                              vdev->sub_device_id);
-    }
-
-    /* QEMU can change multi-function devices to single function, or reverse */
-    vdev->emulated_config_bits[PCI_HEADER_TYPE] =
-                                              PCI_HEADER_TYPE_MULTI_FUNCTION;
-
-    /* Restore or clear multifunction, this is always controlled by QEMU */
-    if (vdev->pdev.cap_present & QEMU_PCI_CAP_MULTIFUNCTION) {
-        vdev->pdev.config[PCI_HEADER_TYPE] |= PCI_HEADER_TYPE_MULTI_FUNCTION;
-    } else {
-        vdev->pdev.config[PCI_HEADER_TYPE] &= ~PCI_HEADER_TYPE_MULTI_FUNCTION;
-    }
-
-    /*
-     * Clear host resource mapping info.  If we choose not to register a
-     * BAR, such as might be the case with the option ROM, we can get
-     * confusing, unwritable, residual addresses from the host here.
-     */
-    memset(&vdev->pdev.config[PCI_BASE_ADDRESS_0], 0, 24);
-    memset(&vdev->pdev.config[PCI_ROM_ADDRESS], 0, 4);
-
-    vfio_pci_size_rom(vdev);
-
-    vfio_bars_prepare(vdev);
-
-    vfio_msix_early_setup(vdev, &err);
+    vfio_pci_config_setup(vdev, &err);
     if (err) {
-        error_propagate(errp, err);
         goto error;
     }
 
-    vfio_bars_register(vdev);
+    /*
+     * vfio_pci_config_setup will have registered the device's BARs
+     * and setup any MSIX BARs, so errors after it succeeds must
+     * use out_teardown
+     */
 
     ret = vfio_add_capabilities(vdev, errp);
     if (ret) {
@@ -3116,29 +3167,15 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         }
     }
 
-    /* QEMU emulates all of MSI & MSIX */
-    if (pdev->cap_present & QEMU_PCI_CAP_MSIX) {
-        memset(vdev->emulated_config_bits + pdev->msix_cap, 0xff,
-               MSIX_CAP_LENGTH);
-    }
-
-    if (pdev->cap_present & QEMU_PCI_CAP_MSI) {
-        memset(vdev->emulated_config_bits + pdev->msi_cap, 0xff,
-               vdev->msi_cap_size);
+    ret = vfio_interrupt_setup(vdev, errp);
+    if (ret) {
+        goto out_teardown;
     }
 
-    if (vfio_pci_read_config(&vdev->pdev, PCI_INTERRUPT_PIN, 1)) {
-        vdev->intx.mmap_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
-                                                  vfio_intx_mmap_enable, vdev);
-        pci_device_set_intx_routing_notifier(&vdev->pdev,
-                                             vfio_intx_routing_notifier);
-        vdev->irqchip_change_notifier.notify = vfio_irqchip_change;
-        kvm_irqchip_add_change_notifier(&vdev->irqchip_change_notifier);
-        ret = vfio_intx_enable(vdev, errp);
-        if (ret) {
-            goto out_deregister;
-        }
-    }
+    /*
+     * vfio_interrupt_setup will have setup INTx's KVM routing
+     * so errors after it succeeds must use out_deregister
+     */
 
     if (vdev->display != ON_OFF_AUTO_OFF) {
         ret = vfio_display_probe(vdev, errp);
@@ -3525,8 +3562,42 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         goto error;
     }
 
+    /* Get a copy of config space */
+    ret = VDEV_REGION_READ(vbasedev, VFIO_PCI_CONFIG_REGION_INDEX, 0,
+                           MIN(pci_config_size(pdev), vdev->config_size),
+                           pdev->config);
+    if (ret < (int)MIN(pci_config_size(&vdev->pdev), vdev->config_size)) {
+        error_setg_errno(errp, -ret, "failed to read device config space");
+        goto error;
+    }
+
+    vfio_pci_config_setup(vdev, &err);
+    if (err) {
+        error_propagate(errp, err);
+        goto error;
+    }
+
+    /*
+     * vfio_pci_config_setup will have registered the device's BARs
+     * and setup any MSIX BARs, so errors after it succeeds must
+     * use out_teardown
+     */
+
+    ret = vfio_add_capabilities(vdev, errp);
+    if (ret) {
+        goto out_teardown;
+    }
+
+    ret = vfio_interrupt_setup(vdev, errp);
+    if (ret) {
+        goto out_teardown;
+    }
+
     return;
 
+out_teardown:
+    vfio_teardown_msi(vdev);
+    vfio_bars_exit(vdev);
 error:
     error_prepend(errp, VFIO_MSG_PREFIX, vdev->vbasedev.name);
 }
-- 
1.8.3.1


