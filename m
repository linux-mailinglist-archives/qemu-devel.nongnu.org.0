Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B4E1DBD9F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 21:08:35 +0200 (CEST)
Received: from localhost ([::1]:48004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbU4w-0008RZ-4i
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 15:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jbTx1-0002C1-Ij
 for qemu-devel@nongnu.org; Wed, 20 May 2020 15:00:23 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:14907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jbTx0-00055n-DT
 for qemu-devel@nongnu.org; Wed, 20 May 2020 15:00:23 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ec57df50000>; Wed, 20 May 2020 11:59:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 20 May 2020 12:00:21 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 20 May 2020 12:00:21 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 May
 2020 19:00:20 +0000
Received: from kwankhede-dev.nvidia.com (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 20 May 2020 19:00:12 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Subject: [PATCH QEMU v23 17/18] vfio: Make vfio-pci device migration capable
Date: Wed, 20 May 2020 23:54:47 +0530
Message-ID: <1589999088-31477-18-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1589999088-31477-1-git-send-email-kwankhede@nvidia.com>
References: <1589999088-31477-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1590001142; bh=YTicSrLSiYRRBKWzw0ZdS89P78kyDAoreqH04/zy9u0=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=Zzuyvc5wPUw44jANK0yO9oaJVivOeAGKh15XLgHzYtNeFGUVDNfNZ9iEcyhBwr510
 SUxB0JEVVgWdtzAIdWJi/TPkkGbxizVqzHZmXAN7WapBS9jGZLfBMKU9Bk+0XqYuIQ
 rauheAUSQ2+NLxVxw6HdtAiixbVvNHQ4Kf+0A5umThFT+jixC3+BH+EslYZv5ufPPx
 U+PkWnbu1+bQptpwwUwVQW2qNA1nBVwDMxl/bSRg8x+6MmeRs2VQRBUkm1SUEyEXAe
 ANb2ySH6chxqfJlFRmnWDJNuBl64LKuV76a3bMC6i08zFJnmDnN0a1qhrxfYntK0vb
 GKQCASmFck/bA==
Received-SPF: pass client-ip=216.228.121.64; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate25.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 14:41:20
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: cohuck@redhat.com, aik@ozlabs.ru, Zhengxiao.zx@Alibaba-inc.com,
 shuangtai.tst@alibaba-inc.com, qemu-devel@nongnu.org, peterx@redhat.com,
 Kirti Wankhede <kwankhede@nvidia.com>, eauger@redhat.com, yi.l.liu@intel.com,
 quintela@redhat.com, ziye.yang@intel.com, armbru@redhat.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, felipe@nutanix.com,
 zhi.a.wang@intel.com, kevin.tian@intel.com, yan.y.zhao@intel.com,
 dgilbert@redhat.com, changpeng.liu@intel.com, eskultet@redhat.com,
 Ken.Xue@amd.com, jonathan.davies@nutanix.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If device is not failover primary device call vfio_migration_probe()
and vfio_migration_finalize() functions for vfio-pci device to enable
migration for vfio PCI device which support migration.
Removed vfio_pci_vmstate structure.
Removed migration blocker from VFIO PCI device specific structure and use
migration blocker from generic structure of  VFIO device.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Neo Jia <cjia@nvidia.com>
---
 hw/vfio/pci.c | 32 +++++++++++---------------------
 hw/vfio/pci.h |  1 -
 2 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 94535f0e27cd..573b28753bfd 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2916,22 +2916,11 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         return;
     }
 
-    if (!pdev->failover_pair_id) {
-        error_setg(&vdev->migration_blocker,
-                "VFIO device doesn't support migration");
-        ret = migrate_add_blocker(vdev->migration_blocker, &err);
-        if (ret) {
-            error_propagate(errp, err);
-            error_free(vdev->migration_blocker);
-            vdev->migration_blocker = NULL;
-            return;
-        }
-    }
-
     vdev->vbasedev.name = g_path_get_basename(vdev->vbasedev.sysfsdev);
     vdev->vbasedev.ops = &vfio_pci_ops;
     vdev->vbasedev.type = VFIO_DEVICE_TYPE_PCI;
     vdev->vbasedev.dev = DEVICE(vdev);
+    vdev->vbasedev.device_state = 0;
 
     tmp = g_strdup_printf("%s/iommu_group", vdev->vbasedev.sysfsdev);
     len = readlink(tmp, group_path, sizeof(group_path));
@@ -3195,6 +3184,14 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         }
     }
 
+    if (!pdev->failover_pair_id) {
+        ret = vfio_migration_probe(&vdev->vbasedev, errp);
+        if (ret) {
+            error_report("%s: Failed to setup for migration",
+                         vdev->vbasedev.name);
+        }
+    }
+
     vfio_register_err_notifier(vdev);
     vfio_register_req_notifier(vdev);
     vfio_setup_resetfn_quirk(vdev);
@@ -3209,11 +3206,6 @@ out_teardown:
     vfio_bars_exit(vdev);
 error:
     error_prepend(errp, VFIO_MSG_PREFIX, vdev->vbasedev.name);
-    if (vdev->migration_blocker) {
-        migrate_del_blocker(vdev->migration_blocker);
-        error_free(vdev->migration_blocker);
-        vdev->migration_blocker = NULL;
-    }
 }
 
 static void vfio_instance_finalize(Object *obj)
@@ -3225,10 +3217,7 @@ static void vfio_instance_finalize(Object *obj)
     vfio_bars_finalize(vdev);
     g_free(vdev->emulated_config_bits);
     g_free(vdev->rom);
-    if (vdev->migration_blocker) {
-        migrate_del_blocker(vdev->migration_blocker);
-        error_free(vdev->migration_blocker);
-    }
+
     /*
      * XXX Leaking igd_opregion is not an oversight, we can't remove the
      * fw_cfg entry therefore leaking this allocation seems like the safest
@@ -3256,6 +3245,7 @@ static void vfio_exitfn(PCIDevice *pdev)
     }
     vfio_teardown_msi(vdev);
     vfio_bars_exit(vdev);
+    vfio_migration_finalize(&vdev->vbasedev);
 }
 
 static void vfio_pci_reset(DeviceState *dev)
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 0da7a20a7ec2..b148c937ef72 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -168,7 +168,6 @@ typedef struct VFIOPCIDevice {
     bool no_vfio_ioeventfd;
     bool enable_ramfb;
     VFIODisplay *dpy;
-    Error *migration_blocker;
     Notifier irqchip_change_notifier;
 } VFIOPCIDevice;
 
-- 
2.7.0


