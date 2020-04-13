Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D3E1A6321
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Apr 2020 08:40:54 +0200 (CEST)
Received: from localhost ([::1]:40884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jNsm4-0005zE-4V
	for lists+qemu-devel@lfdr.de; Mon, 13 Apr 2020 02:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33215)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yan.y.zhao@intel.com>) id 1jNskG-0003tD-7j
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 02:39:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yan.y.zhao@intel.com>) id 1jNskF-0006oh-94
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 02:39:00 -0400
Received: from mga02.intel.com ([134.134.136.20]:22314)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
 id 1jNskF-0006oV-1l
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 02:38:59 -0400
IronPort-SDR: MUgPNdSCkMn8RcPtjgAvzonZSDxQTiY4xhJDT6aVlszQThC/hDarRAF+EVopL5Wt47UkFVPUc6
 6Xda78/h9phA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2020 23:38:58 -0700
IronPort-SDR: e0Egk4H0cnnSkK68El48wiEPxDbxl+nT5PgLWwkjr3HJ4VSD/UX6l4cpG5xonVa1qhdTfJs5pO
 QcJ93h7/N/bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,377,1580803200"; d="scan'208";a="453062368"
Received: from dpdk-zhirun.sh.intel.com ([10.67.119.121])
 by fmsmga005.fm.intel.com with ESMTP; 12 Apr 2020 23:38:56 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] hw/vfio: let read-only flag take effect for mmap'd
 regions
Date: Mon, 13 Apr 2020 06:37:47 +0000
Message-Id: <20200413063747.84753-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200413063627.84608-1-yan.y.zhao@intel.com>
References: <20200413063627.84608-1-yan.y.zhao@intel.com>
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 134.134.136.20
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, Xin Zeng <xin.zeng@intel.com>,
 alex.williamson@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

along side setting host page table to be read-only, the memory regions
are also required to be read-only, so that when guest writes to the
read-only & mmap'd regions, vmexits would happen and region write handlers
are called.

Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Xin Zeng <xin.zeng@intel.com>
---
 hw/vfio/common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index fd6ee1fe3e..fc7618e041 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -977,6 +977,10 @@ int vfio_region_mmap(VFIORegion *region)
                                           name, region->mmaps[i].size,
                                           region->mmaps[i].mmap);
         g_free(name);
+
+        if (!(region->flags & VFIO_REGION_INFO_FLAG_WRITE)) {
+            memory_region_set_readonly(&region->mmaps[i].mem, true);
+        }
         memory_region_add_subregion(region->mem, region->mmaps[i].offset,
                                     &region->mmaps[i].mem);
 
-- 
2.17.1


