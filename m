Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1476D33338B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 04:05:23 +0100 (CET)
Received: from localhost ([::1]:59054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJpA2-0006Uk-3E
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 22:05:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lJp80-0005AH-VT; Tue, 09 Mar 2021 22:03:18 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:4374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lJp7u-0002vC-Ko; Tue, 09 Mar 2021 22:03:16 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DwH0F5p0fz17Hbp;
 Wed, 10 Mar 2021 11:01:17 +0800 (CST)
Received: from DESKTOP-7FEPK9S.china.huawei.com (10.174.184.135) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Wed, 10 Mar 2021 11:02:55 +0800
From: Shenming Lu <lushenming@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v4 1/3] vfio: Move the saving of the config space to the right
 place in VFIO migration
Date: Wed, 10 Mar 2021 11:02:31 +0800
Message-ID: <20210310030233.1133-2-lushenming@huawei.com>
X-Mailer: git-send-email 2.27.0.windows.1
In-Reply-To: <20210310030233.1133-1-lushenming@huawei.com>
References: <20210310030233.1133-1-lushenming@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.135]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=lushenming@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 mst@redhat.com, Marc Zyngier <maz@kernel.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com, lushenming@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On ARM64 the VFIO SET_IRQS ioctl is dependent on the VM interrupt
setup, if the restoring of the VFIO PCI device config space is
before the VGIC, an error might occur in the kernel.

So we move the saving of the config space to the non-iterable
process, thus it will be called after the VGIC according to
their priorities.

As for the possible dependence of the device specific migration
data on it's config space, we can let the vendor driver to
include any config info it needs in its own data stream.

Signed-off-by: Shenming Lu <lushenming@huawei.com>
Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>
---
 hw/vfio/migration.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 00daa50ed8..f5bf67f642 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -575,11 +575,6 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
         return ret;
     }
 
-    ret = vfio_save_device_config_state(f, opaque);
-    if (ret) {
-        return ret;
-    }
-
     ret = vfio_update_pending(vbasedev);
     if (ret) {
         return ret;
@@ -620,6 +615,19 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
     return ret;
 }
 
+static void vfio_save_state(QEMUFile *f, void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    int ret;
+
+    ret = vfio_save_device_config_state(f, opaque);
+    if (ret) {
+        error_report("%s: Failed to save device config space",
+                     vbasedev->name);
+        qemu_file_set_error(f, ret);
+    }
+}
+
 static int vfio_load_setup(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -670,11 +678,7 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
         switch (data) {
         case VFIO_MIG_FLAG_DEV_CONFIG_STATE:
         {
-            ret = vfio_load_device_config_state(f, opaque);
-            if (ret) {
-                return ret;
-            }
-            break;
+            return vfio_load_device_config_state(f, opaque);
         }
         case VFIO_MIG_FLAG_DEV_SETUP_STATE:
         {
@@ -720,6 +724,7 @@ static SaveVMHandlers savevm_vfio_handlers = {
     .save_live_pending = vfio_save_pending,
     .save_live_iterate = vfio_save_iterate,
     .save_live_complete_precopy = vfio_save_complete_precopy,
+    .save_state = vfio_save_state,
     .load_setup = vfio_load_setup,
     .load_cleanup = vfio_load_cleanup,
     .load_state = vfio_load_state,
-- 
2.19.1


