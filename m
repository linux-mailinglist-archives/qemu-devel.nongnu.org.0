Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4E3633C2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 11:57:17 +0200 (CEST)
Received: from localhost ([::1]:48236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkms7-00009m-L9
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 05:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50196)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwankhede@nvidia.com>) id 1hkmoG-0005DI-9z
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 05:53:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwankhede@nvidia.com>) id 1hkmoF-0004dO-5r
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 05:53:16 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:7233)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwankhede@nvidia.com>)
 id 1hkmoE-0004d2-UM
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 05:53:15 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d2464040000>; Tue, 09 Jul 2019 02:53:08 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 09 Jul 2019 02:53:13 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 09 Jul 2019 02:53:13 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Jul
 2019 09:53:13 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Jul
 2019 09:53:12 +0000
Received: from kwankhede-dev.nvidia.com (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 9 Jul 2019 09:53:06 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Date: Tue, 9 Jul 2019 15:19:19 +0530
Message-ID: <1562665760-26158-13-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1562665760-26158-1-git-send-email-kwankhede@nvidia.com>
References: <1562665760-26158-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1562665989; bh=gFFxatm5vEcsYi2oQ1vg+wARzP2JUq9a8FiNQRij5Bw=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=LJV2WjWPAK8+Qgc6QLSb3lq3dnGL2Xzk4HHIXk6tVPtOEZoNDf+rVYUjzcwZQSV5C
 3WY1kBj+hYudUUi/Yvker7OviOzuxsyVPOZpBDYyWkOb4lsvEiCLqxMnynOMRT9hC0
 7ZCVY4cNf0EhitX7iWhJKd35NEX/z0lNFLRt7tcVe2xqYqVoye3TwoXc8mP7cmEZLT
 IsctoOX+/WMlWaOTIDv4wA/BJgrParWZTyXSW7uC494p/HpoBM9lbnCJG9/6JRv1fD
 adrclxTigJcg20uZg5QUQIU+IlpkYkSmm2SnifraXjjL2fHWPt9mIMj03drQ/XcPC/
 EL0nZ2vMt+HYg==
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 216.228.121.143
Subject: [Qemu-devel] [PATCH v7 12/13] vfio: Add vfio_listerner_log_sync to
 mark dirty pages
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
Cc: Zhengxiao.zx@Alibaba-inc.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 yan.y.zhao@intel.com, eskultet@redhat.com, ziye.yang@intel.com,
 qemu-devel@nongnu.org, cohuck@redhat.com, shuangtai.tst@alibaba-inc.com,
 dgilbert@redhat.com, zhi.a.wang@intel.com, mlevitsk@redhat.com,
 pasic@linux.ibm.com, aik@ozlabs.ru, Kirti Wankhede <kwankhede@nvidia.com>,
 eauger@redhat.com, felipe@nutanix.com, jonathan.davies@nutanix.com,
 changpeng.liu@intel.com, Ken.Xue@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vfio_listerner_log_sync gets list of dirty pages from vendor driver and mark
those pages dirty when in _SAVING state.
Return early for the RAM block section of mapped MMIO region.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Neo Jia <cjia@nvidia.com>
---
 hw/vfio/common.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index de74dae8d6a6..d5ee35c95e76 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -36,6 +36,7 @@
 #include "sysemu/kvm.h"
 #include "trace.h"
 #include "qapi/error.h"
+#include "migration/migration.h"
 
 VFIOGroupList vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
@@ -794,9 +795,43 @@ static void vfio_listener_region_del(MemoryListener *listener,
     }
 }
 
+static void vfio_listerner_log_sync(MemoryListener *listener,
+                                    MemoryRegionSection *section)
+{
+    uint64_t start_addr, size, pfn_count;
+    VFIOGroup *group;
+    VFIODevice *vbasedev;
+
+    if (memory_region_is_ram_device(section->mr)) {
+        return;
+    }
+
+    QLIST_FOREACH(group, &vfio_group_list, next) {
+        QLIST_FOREACH(vbasedev, &group->device_list, next) {
+            if (vbasedev->device_state & VFIO_DEVICE_STATE_SAVING) {
+                continue;
+            } else {
+                return;
+            }
+        }
+    }
+
+    start_addr = TARGET_PAGE_ALIGN(section->offset_within_address_space);
+    size = int128_get64(section->size);
+    pfn_count = size >> TARGET_PAGE_BITS;
+
+    QLIST_FOREACH(group, &vfio_group_list, next) {
+        QLIST_FOREACH(vbasedev, &group->device_list, next) {
+            vfio_get_dirty_page_list(vbasedev, start_addr >> TARGET_PAGE_BITS,
+                                     pfn_count, TARGET_PAGE_SIZE);
+        }
+    }
+}
+
 static const MemoryListener vfio_memory_listener = {
     .region_add = vfio_listener_region_add,
     .region_del = vfio_listener_region_del,
+    .log_sync = vfio_listerner_log_sync,
 };
 
 static void vfio_listener_release(VFIOContainer *container)
-- 
2.7.0


