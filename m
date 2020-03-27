Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59708194EEF
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 03:29:28 +0100 (CET)
Received: from localhost ([::1]:36258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHekR-0003OU-7T
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 22:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53599)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yan.y.zhao@intel.com>) id 1jHejb-0002zT-Cz
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 22:28:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yan.y.zhao@intel.com>) id 1jHejZ-0003b0-7M
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 22:28:34 -0400
Received: from mga09.intel.com ([134.134.136.24]:3746)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
 id 1jHejY-0003Uf-VN
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 22:28:33 -0400
IronPort-SDR: IOedDJpSRYLd9osv3xPNnGyzmfiaPUF/6l8qJ5Oq32XmpDS7AJWjrfJS66YXp4gQCn9F8ACgAm
 AZaUe6jhH2iQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 19:28:29 -0700
IronPort-SDR: uvhGRG1O0rRJTVS3RJ97k0hyZgxHA6nBr3AONuOK53pHjdSBcOrQOtCLp5nLGoPQSY+xjLyBj5
 WWAvucfQGtSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,310,1580803200"; d="scan'208";a="271404410"
Received: from dpdk-zhirun.sh.intel.com ([10.67.119.121])
 by fmsmga004.fm.intel.com with ESMTP; 26 Mar 2020 19:28:27 -0700
From: yan.y.zhao@intel.com
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/vfio: let readonly flag take effect for mmaped regions
Date: Fri, 27 Mar 2020 11:19:34 +0000
Message-Id: <20200327111934.71066-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 134.134.136.24
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
Cc: pbonzini@redhat.com, alex.williamson@redhat.com,
 Yan Zhao <yan.y.zhao@intel.com>, Xin Zeng <xin.zeng@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yan Zhao <yan.y.zhao@intel.com>

currently, vfio regions without VFIO_REGION_INFO_FLAG_WRITE are only
read-only when VFIO_REGION_INFO_FLAG_MMAP is not set.

regions with flag VFIO_REGION_INFO_FLAG_READ | VFIO_REGION_INFO_FLAG_MMAP
are only read-only in host page table for qemu.

This patch sets corresponding ept page entries read-only for regions
with flag VFIO_REGION_INFO_FLAG_READ | VFIO_REGION_INFO_FLAG_MMAP.

accordingly, it ignores guest write when guest writes to the read-only
regions are trapped.

Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Xin Zeng <xin.zeng@intel.com>
---
 hw/vfio/common.c | 4 ++++
 memory.c         | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 0b3593b3c0..e901621ca0 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -971,6 +971,10 @@ int vfio_region_mmap(VFIORegion *region)
                                           name, region->mmaps[i].size,
                                           region->mmaps[i].mmap);
         g_free(name);
+
+        if (!(region->flags & VFIO_REGION_INFO_FLAG_WRITE)) {
+            memory_region_set_readonly(&region->mmaps[i].mem, true);
+        }
         memory_region_add_subregion(region->mem, region->mmaps[i].offset,
                                     &region->mmaps[i].mem);
 
diff --git a/memory.c b/memory.c
index 601b749906..4b1071dc74 100644
--- a/memory.c
+++ b/memory.c
@@ -1313,6 +1313,9 @@ static void memory_region_ram_device_write(void *opaque, hwaddr addr,
     MemoryRegion *mr = opaque;
 
     trace_memory_region_ram_device_write(get_cpu_index(), mr, addr, data, size);
+    if (mr->readonly) {
+        return;
+    }
 
     switch (size) {
     case 1:
-- 
2.17.1


