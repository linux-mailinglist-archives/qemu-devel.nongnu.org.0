Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A44662F48
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 06:18:18 +0200 (CEST)
Received: from localhost ([::1]:46614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkha5-0004oS-Pl
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 00:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35873)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwankhede@nvidia.com>) id 1hkhUg-0007hj-Al
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 00:12:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwankhede@nvidia.com>) id 1hkhUf-0005Gy-0N
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 00:12:42 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:12646)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwankhede@nvidia.com>)
 id 1hkhUe-0005GI-PA
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 00:12:40 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d2414350008>; Mon, 08 Jul 2019 21:12:37 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 08 Jul 2019 21:12:38 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 08 Jul 2019 21:12:38 -0700
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Jul
 2019 02:02:00 +0000
Received: from kwankhede-dev.nvidia.com (10.124.1.5) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 9 Jul 2019 02:01:54 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Date: Tue, 9 Jul 2019 07:29:03 +0530
Message-ID: <1562637554-22439-3-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1562637554-22439-1-git-send-email-kwankhede@nvidia.com>
References: <1562637554-22439-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1562645557; bh=nylc0cVMKEEnjbH8m1Te0YQIduVRuoNb4byY+ts2y18=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=FuveIi4qLe2J4APsOccS8LYFd4FNkIWlQgykRnt0MilMXL61qhIPVhdlUADZb7k7Z
 DnZzMLDrFh+/Mgzmvugs3wwClYph7ybEl9wbTC4+YteSv2ClbXen8aumlKkmgQLATr
 JZdLH2W/puwHoST46AdehY51/kLGoXVDECfT/OBqwvKT9dpqKCYfETEUV+fZBBuNs3
 7008HD6laWS0EKkSzfZUfqgGTGxA13a5hQqDCQOJ/JILenLVNrne50Im7Xzd5OzBQA
 JXuocGHDu0fAwaCWusrGwOgwu31Ob022zeQJsbZ/GDqUE3vxzLbRfLF/4BhapAmh61
 HAoffRnfPFyfg==
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 216.228.121.65
Subject: [Qemu-devel] [PATCH v6 02/13] vfio: Add function to unmap VFIO
 region
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

This function is used in follwing patch in this series.
Migration region is mmaped when migration starts and will be unmapped when
migration is complete.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Neo Jia <cjia@nvidia.com>
---
 hw/vfio/common.c              | 20 ++++++++++++++++++++
 hw/vfio/trace-events          |  1 +
 include/hw/vfio/vfio-common.h |  1 +
 3 files changed, 22 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index a859298fdad9..de74dae8d6a6 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -964,6 +964,26 @@ int vfio_region_mmap(VFIORegion *region)
     return 0;
 }
 
+void vfio_region_unmap(VFIORegion *region)
+{
+    int i;
+
+    if (!region->mem) {
+        return;
+    }
+
+    for (i = 0; i < region->nr_mmaps; i++) {
+        trace_vfio_region_unmap(memory_region_name(&region->mmaps[i].mem),
+                                region->mmaps[i].offset,
+                                region->mmaps[i].offset +
+                                region->mmaps[i].size - 1);
+        memory_region_del_subregion(region->mem, &region->mmaps[i].mem);
+        munmap(region->mmaps[i].mmap, region->mmaps[i].size);
+        object_unparent(OBJECT(&region->mmaps[i].mem));
+        region->mmaps[i].mmap = NULL;
+    }
+}
+
 void vfio_region_exit(VFIORegion *region)
 {
     int i;
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index b1ef55a33ffd..8cdc27946cb8 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -111,6 +111,7 @@ vfio_region_mmap(const char *name, unsigned long offset, unsigned long end) "Reg
 vfio_region_exit(const char *name, int index) "Device %s, region %d"
 vfio_region_finalize(const char *name, int index) "Device %s, region %d"
 vfio_region_mmaps_set_enabled(const char *name, bool enabled) "Region %s mmaps enabled: %d"
+vfio_region_unmap(const char *name, unsigned long offset, unsigned long end) "Region %s unmap [0x%lx - 0x%lx]"
 vfio_region_sparse_mmap_header(const char *name, int index, int nr_areas) "Device %s region %d: %d sparse mmap entries"
 vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned long end) "sparse entry %d [0x%lx - 0x%lx]"
 vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype) "%s index %d, %08x/%0x8"
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 9107bd41c030..93493891ba40 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -171,6 +171,7 @@ int vfio_region_setup(Object *obj, VFIODevice *vbasedev, VFIORegion *region,
                       int index, const char *name);
 int vfio_region_mmap(VFIORegion *region);
 void vfio_region_mmaps_set_enabled(VFIORegion *region, bool enabled);
+void vfio_region_unmap(VFIORegion *region);
 void vfio_region_exit(VFIORegion *region);
 void vfio_region_finalize(VFIORegion *region);
 void vfio_reset_handler(void *opaque);
-- 
2.7.0


