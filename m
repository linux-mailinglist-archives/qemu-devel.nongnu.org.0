Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C1351E070
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 22:56:06 +0200 (CEST)
Received: from localhost ([::1]:36692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn4zd-0006sM-LI
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 16:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nn4t3-0004dC-Ao
 for qemu-devel@nongnu.org; Fri, 06 May 2022 16:49:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nn4t1-0005vn-8h
 for qemu-devel@nongnu.org; Fri, 06 May 2022 16:49:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651870154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zS1lsXsoLJY5e0iorj0DJL7ygNnl8UUIdx8c49eSXcY=;
 b=guV8rtfErAzFySFlBoiVF1DsKnaQxgk6dXYwCgei9a4FgKu8LPqDNDB0ySaXf/uZwvSwGR
 Csq9bCFXaSB1A9dc2/FgQhC+5NI7TfPPt0ADxPYN43bk81c1upoFAVrkcsNqwt0n+/LYj+
 cQPr1NifUWHrskiv3HbWNhiQcei4jmI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-LhRp8q8fM2K2nGBY5LmMrw-1; Fri, 06 May 2022 16:49:13 -0400
X-MC-Unique: LhRp8q8fM2K2nGBY5LmMrw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43AB1398CA6A;
 Fri,  6 May 2022 20:49:13 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E079D14E0B70;
 Fri,  6 May 2022 20:49:12 +0000 (UTC)
Subject: [PULL 10/11] vfio/pci: Use vbasedev local variable in vfio_realize()
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, Yi Liu <yi.l.liu@intel.com>
Date: Fri, 06 May 2022 14:49:12 -0600
Message-ID: <165187014792.4166595.9539353046382635608.stgit@omen>
In-Reply-To: <165186988363.4166595.3147442303200167674.stgit@omen>
References: <165186988363.4166595.3147442303200167674.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Eric Auger <eric.auger@redhat.com>

Using a VFIODevice handle local variable to improve the code readability.

no functional change intended

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
Link: https://lore.kernel.org/r/20220502094223.36384-3-yi.l.liu@intel.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/pci.c |   49 +++++++++++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index cb912bd3f4b2..939dcc3d4a9e 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2846,6 +2846,7 @@ static void vfio_unregister_req_notifier(VFIOPCIDevice *vdev)
 static void vfio_realize(PCIDevice *pdev, Error **errp)
 {
     VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIODevice *vbasedev = &vdev->vbasedev;
     VFIODevice *vbasedev_iter;
     VFIOGroup *group;
     char *tmp, *subsys, group_path[PATH_MAX], *group_name;
@@ -2856,7 +2857,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     int i, ret;
     bool is_mdev;
 
-    if (!vdev->vbasedev.sysfsdev) {
+    if (!vbasedev->sysfsdev) {
         if (!(~vdev->host.domain || ~vdev->host.bus ||
               ~vdev->host.slot || ~vdev->host.function)) {
             error_setg(errp, "No provided host device");
@@ -2864,24 +2865,24 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
                               "or -device vfio-pci,sysfsdev=PATH_TO_DEVICE\n");
             return;
         }
-        vdev->vbasedev.sysfsdev =
+        vbasedev->sysfsdev =
             g_strdup_printf("/sys/bus/pci/devices/%04x:%02x:%02x.%01x",
                             vdev->host.domain, vdev->host.bus,
                             vdev->host.slot, vdev->host.function);
     }
 
-    if (stat(vdev->vbasedev.sysfsdev, &st) < 0) {
+    if (stat(vbasedev->sysfsdev, &st) < 0) {
         error_setg_errno(errp, errno, "no such host device");
-        error_prepend(errp, VFIO_MSG_PREFIX, vdev->vbasedev.sysfsdev);
+        error_prepend(errp, VFIO_MSG_PREFIX, vbasedev->sysfsdev);
         return;
     }
 
-    vdev->vbasedev.name = g_path_get_basename(vdev->vbasedev.sysfsdev);
-    vdev->vbasedev.ops = &vfio_pci_ops;
-    vdev->vbasedev.type = VFIO_DEVICE_TYPE_PCI;
-    vdev->vbasedev.dev = DEVICE(vdev);
+    vbasedev->name = g_path_get_basename(vbasedev->sysfsdev);
+    vbasedev->ops = &vfio_pci_ops;
+    vbasedev->type = VFIO_DEVICE_TYPE_PCI;
+    vbasedev->dev = DEVICE(vdev);
 
-    tmp = g_strdup_printf("%s/iommu_group", vdev->vbasedev.sysfsdev);
+    tmp = g_strdup_printf("%s/iommu_group", vbasedev->sysfsdev);
     len = readlink(tmp, group_path, sizeof(group_path));
     g_free(tmp);
 
@@ -2899,7 +2900,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         goto error;
     }
 
-    trace_vfio_realize(vdev->vbasedev.name, groupid);
+    trace_vfio_realize(vbasedev->name, groupid);
 
     group = vfio_get_group(groupid, pci_device_iommu_address_space(pdev), errp);
     if (!group) {
@@ -2907,7 +2908,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     }
 
     QLIST_FOREACH(vbasedev_iter, &group->device_list, next) {
-        if (strcmp(vbasedev_iter->name, vdev->vbasedev.name) == 0) {
+        if (strcmp(vbasedev_iter->name, vbasedev->name) == 0) {
             error_setg(errp, "device is already attached");
             vfio_put_group(group);
             goto error;
@@ -2920,22 +2921,22 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
      * stays in sync with the active working set of the guest driver.  Prevent
      * the x-balloon-allowed option unless this is minimally an mdev device.
      */
-    tmp = g_strdup_printf("%s/subsystem", vdev->vbasedev.sysfsdev);
+    tmp = g_strdup_printf("%s/subsystem", vbasedev->sysfsdev);
     subsys = realpath(tmp, NULL);
     g_free(tmp);
     is_mdev = subsys && (strcmp(subsys, "/sys/bus/mdev") == 0);
     free(subsys);
 
-    trace_vfio_mdev(vdev->vbasedev.name, is_mdev);
+    trace_vfio_mdev(vbasedev->name, is_mdev);
 
-    if (vdev->vbasedev.ram_block_discard_allowed && !is_mdev) {
+    if (vbasedev->ram_block_discard_allowed && !is_mdev) {
         error_setg(errp, "x-balloon-allowed only potentially compatible "
                    "with mdev devices");
         vfio_put_group(group);
         goto error;
     }
 
-    ret = vfio_get_device(group, vdev->vbasedev.name, &vdev->vbasedev, errp);
+    ret = vfio_get_device(group, vbasedev->name, vbasedev, errp);
     if (ret) {
         vfio_put_group(group);
         goto error;
@@ -2948,7 +2949,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     }
 
     /* Get a copy of config space */
-    ret = pread(vdev->vbasedev.fd, vdev->pdev.config,
+    ret = pread(vbasedev->fd, vdev->pdev.config,
                 MIN(pci_config_size(&vdev->pdev), vdev->config_size),
                 vdev->config_offset);
     if (ret < (int)MIN(pci_config_size(&vdev->pdev), vdev->config_size)) {
@@ -2976,7 +2977,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
             goto error;
         }
         vfio_add_emulated_word(vdev, PCI_VENDOR_ID, vdev->vendor_id, ~0);
-        trace_vfio_pci_emulated_vendor_id(vdev->vbasedev.name, vdev->vendor_id);
+        trace_vfio_pci_emulated_vendor_id(vbasedev->name, vdev->vendor_id);
     } else {
         vdev->vendor_id = pci_get_word(pdev->config + PCI_VENDOR_ID);
     }
@@ -2987,7 +2988,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
             goto error;
         }
         vfio_add_emulated_word(vdev, PCI_DEVICE_ID, vdev->device_id, ~0);
-        trace_vfio_pci_emulated_device_id(vdev->vbasedev.name, vdev->device_id);
+        trace_vfio_pci_emulated_device_id(vbasedev->name, vdev->device_id);
     } else {
         vdev->device_id = pci_get_word(pdev->config + PCI_DEVICE_ID);
     }
@@ -2999,7 +3000,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         }
         vfio_add_emulated_word(vdev, PCI_SUBSYSTEM_VENDOR_ID,
                                vdev->sub_vendor_id, ~0);
-        trace_vfio_pci_emulated_sub_vendor_id(vdev->vbasedev.name,
+        trace_vfio_pci_emulated_sub_vendor_id(vbasedev->name,
                                               vdev->sub_vendor_id);
     }
 
@@ -3009,7 +3010,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
             goto error;
         }
         vfio_add_emulated_word(vdev, PCI_SUBSYSTEM_ID, vdev->sub_device_id, ~0);
-        trace_vfio_pci_emulated_sub_device_id(vdev->vbasedev.name,
+        trace_vfio_pci_emulated_sub_device_id(vbasedev->name,
                                               vdev->sub_device_id);
     }
 
@@ -3068,7 +3069,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
             goto out_teardown;
         }
 
-        ret = vfio_get_dev_region_info(&vdev->vbasedev,
+        ret = vfio_get_dev_region_info(vbasedev,
                         VFIO_REGION_TYPE_PCI_VENDOR_TYPE | PCI_VENDOR_ID_INTEL,
                         VFIO_REGION_SUBTYPE_INTEL_IGD_OPREGION, &opregion);
         if (ret) {
@@ -3144,9 +3145,9 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     }
 
     if (!pdev->failover_pair_id) {
-        ret = vfio_migration_probe(&vdev->vbasedev, errp);
+        ret = vfio_migration_probe(vbasedev, errp);
         if (ret) {
-            error_report("%s: Migration disabled", vdev->vbasedev.name);
+            error_report("%s: Migration disabled", vbasedev->name);
         }
     }
 
@@ -3163,7 +3164,7 @@ out_teardown:
     vfio_teardown_msi(vdev);
     vfio_bars_exit(vdev);
 error:
-    error_prepend(errp, VFIO_MSG_PREFIX, vdev->vbasedev.name);
+    error_prepend(errp, VFIO_MSG_PREFIX, vbasedev->name);
 }
 
 static void vfio_instance_finalize(Object *obj)



