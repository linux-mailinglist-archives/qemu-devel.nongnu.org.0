Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BBF687588
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 06:50:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNSPK-00089k-6B; Thu, 02 Feb 2023 00:45:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSPG-000893-Sj
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:45:11 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSPE-0007A6-It
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:45:10 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3124iTMW029513; Thu, 2 Feb 2023 05:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2022-7-12;
 bh=DcxAm8RLWeiMlaB1WxT4I+RpGMqP/Kazg75iqPuevVw=;
 b=wtWPIYhBpQ5+fkk6f3SL2dRsec/paa+Gs/3mDoSIxg7jQnBllaPVvfJv2l7vaHD32r9g
 CCyt1YT3CPGXP7LdYXS/4efuHNPDetZv4yHaIjGgYr8nsTDtj0vmZv+vHoW9aBwl2Cup
 Sr4SFPhpcUr7fh31HN8a2aHKOf0FsInDfiDP57+pV063hJW6w6YSwJBvIEMY/b2fE9kc
 Zut9nUCtPbkcBUaXjv964OZQ/DCm2jfcn60tmsPQwWRK6m8LE30mBUI4rZZq8uP3fvpe
 F63I15iE9k4TaY0QV3fRPmx08wayTCJmYQlkPBsmMD9BN1tDQ/p7o4y5fsJCmD/r9GTN hw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfmbg2bhf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 05:45:07 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31254Ppk013015; Thu, 2 Feb 2023 05:45:06 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-133-23.vpn.oracle.com
 [10.65.133.23])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nct5f5gb1-14
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 02 Feb 2023 05:45:06 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org
Subject: [PATCH v2 13/23] vfio-user: pci_user_realize PCI setup
Date: Wed,  1 Feb 2023 21:55:49 -0800
Message-Id: <863fc4e015e11ddf38e0c9272499a56498e6b65f.1675228037.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1675228037.git.john.g.johnson@oracle.com>
References: <cover.1675228037.git.john.g.johnson@oracle.com>
In-Reply-To: <cover.1675228037.git.john.g.johnson@oracle.com>
References: <cover.1675228037.git.john.g.johnson@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_15,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302020053
X-Proofpoint-ORIG-GUID: 6HVlZ6C-a2htPLmH9CQJWV9gx7uySB-L
X-Proofpoint-GUID: 6HVlZ6C-a2htPLmH9CQJWV9gx7uySB-L
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

PCI BARs read from remote device
PCI config reads/writes sent to remote server

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.h      |   9 ++
 hw/vfio/pci.c      | 257 ++++++++++++++++++++++++++++++-----------------------
 hw/vfio/user-pci.c |  47 ++++++++++
 3 files changed, 203 insertions(+), 110 deletions(-)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 50a1d07..4f70664 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -212,7 +212,16 @@ void vfio_intx_eoi(VFIODevice *vbasedev);
 Object *vfio_pci_get_object(VFIODevice *vbasedev);
 void vfio_pci_save_config(VFIODevice *vbasedev, QEMUFile *f);
 int vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f);
+void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp);
+void vfio_teardown_msi(VFIOPCIDevice *vdev);
+void vfio_bars_exit(VFIOPCIDevice *vdev);
+void vfio_bars_finalize(VFIOPCIDevice *vdev);
+int vfio_add_capabilities(VFIOPCIDevice *vdev, Error **errp);
 void vfio_put_device(VFIOPCIDevice *vdev);
+void vfio_register_err_notifier(VFIOPCIDevice *vdev);
+void vfio_register_req_notifier(VFIOPCIDevice *vdev);
+void vfio_pci_config_setup(VFIOPCIDevice *vdev, Error **errp);
+int vfio_interrupt_setup(VFIOPCIDevice *vdev, Error **errp);
 void vfio_instance_init(Object *obj);
 
 uint64_t vfio_vga_read(void *opaque, hwaddr addr, unsigned size);
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index be714b7..b8b5c34 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1651,7 +1651,7 @@ static int vfio_msix_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
     return 0;
 }
 
-static void vfio_teardown_msi(VFIOPCIDevice *vdev)
+void vfio_teardown_msi(VFIOPCIDevice *vdev)
 {
     msi_uninit(&vdev->pdev);
 
@@ -1751,7 +1751,7 @@ static void vfio_bars_register(VFIOPCIDevice *vdev)
     }
 }
 
-static void vfio_bars_exit(VFIOPCIDevice *vdev)
+void vfio_bars_exit(VFIOPCIDevice *vdev)
 {
     int i;
 
@@ -1771,7 +1771,7 @@ static void vfio_bars_exit(VFIOPCIDevice *vdev)
     }
 }
 
-static void vfio_bars_finalize(VFIOPCIDevice *vdev)
+void vfio_bars_finalize(VFIOPCIDevice *vdev)
 {
     int i;
 
@@ -2185,7 +2185,7 @@ static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
     return;
 }
 
-static int vfio_add_capabilities(VFIOPCIDevice *vdev, Error **errp)
+int vfio_add_capabilities(VFIOPCIDevice *vdev, Error **errp)
 {
     PCIDevice *pdev = &vdev->pdev;
     int ret;
@@ -2641,7 +2641,7 @@ int vfio_populate_vga(VFIOPCIDevice *vdev, Error **errp)
     return 0;
 }
 
-static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
+void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
 {
     VFIODevice *vbasedev = &vdev->vbasedev;
     struct vfio_region_info *reg_info;
@@ -2758,7 +2758,7 @@ static void vfio_err_notifier_handler(void *opaque)
  * and continue after disabling error recovery support for the
  * device.
  */
-static void vfio_register_err_notifier(VFIOPCIDevice *vdev)
+void vfio_register_err_notifier(VFIOPCIDevice *vdev)
 {
     Error *err = NULL;
     int32_t fd;
@@ -2817,7 +2817,7 @@ static void vfio_req_notifier_handler(void *opaque)
     }
 }
 
-static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
+void vfio_register_req_notifier(VFIOPCIDevice *vdev)
 {
     struct vfio_irq_info irq_info = { .argsz = sizeof(irq_info),
                                       .index = VFIO_PCI_REQ_IRQ_INDEX };
@@ -2872,6 +2872,133 @@ static void vfio_unregister_req_notifier(VFIOPCIDevice *vdev)
     vdev->req_enabled = false;
 }
 
+void vfio_pci_config_setup(VFIOPCIDevice *vdev, Error **errp)
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
+int vfio_interrupt_setup(VFIOPCIDevice *vdev, Error **errp)
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
@@ -2989,92 +3116,16 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
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
@@ -3115,29 +3166,15 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
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
diff --git a/hw/vfio/user-pci.c b/hw/vfio/user-pci.c
index 900ab5f..55ffe7f 100644
--- a/hw/vfio/user-pci.c
+++ b/hw/vfio/user-pci.c
@@ -128,8 +128,51 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         goto error;
     }
 
+    vfio_populate_device(vdev, &err);
+    if (err) {
+        error_propagate(errp, err);
+        goto error;
+    }
+
+    /* Get a copy of config space */
+    ret = vbasedev->io->region_read(vbasedev, VFIO_PCI_CONFIG_REGION_INDEX, 0,
+                               MIN(pci_config_size(pdev), vdev->config_size),
+                               pdev->config);
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
+    vfio_register_err_notifier(vdev);
+    vfio_register_req_notifier(vdev);
+
     return;
 
+out_teardown:
+    vfio_teardown_msi(vdev);
+    vfio_bars_exit(vdev);
 error:
     error_prepend(errp, VFIO_MSG_PREFIX, vdev->vbasedev.name);
 }
@@ -139,6 +182,10 @@ static void vfio_user_instance_finalize(Object *obj)
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
     VFIODevice *vbasedev = &vdev->vbasedev;
 
+    vfio_bars_finalize(vdev);
+    g_free(vdev->emulated_config_bits);
+    g_free(vdev->rom);
+
     vfio_put_device(vdev);
 
     if (vbasedev->proxy != NULL) {
-- 
1.9.4


