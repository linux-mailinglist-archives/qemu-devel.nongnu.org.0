Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2F64B462
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 10:52:33 +0200 (CEST)
Received: from localhost ([::1]:35922 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdWKW-0002RC-PI
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 04:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49119)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <yan.y.zhao@intel.com>) id 1hdWJP-0001vC-Uw
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 04:51:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yan.y.zhao@intel.com>) id 1hdWJM-0004qO-L9
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 04:51:23 -0400
Received: from mga01.intel.com ([192.55.52.88]:10317)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
 id 1hdWIm-0004Ry-HC
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 04:51:18 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jun 2019 01:50:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; d="scan'208";a="170503094"
Received: from joy-desktop.sh.intel.com ([10.239.13.126])
 by orsmga002.jf.intel.com with ESMTP; 19 Jun 2019 01:50:30 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: pbonzini@redhat.com
Date: Wed, 19 Jun 2019 16:49:45 +0800
Message-Id: <1560934185-14152-1-git-send-email-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.88
Subject: [Qemu-devel] [PATCH] memory: do not do out of bound notification
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

even if an entry overlaps with notifier's range, should not map/unmap
out of bound part in the entry.

This would cause problem in below case:
1. initially there are two notifiers with ranges
0-0xfedfffff, 0xfef00000-0xffffffffffffffff,
IOVAs from 0x3c000000 - 0x3c1fffff is in shadow page table.

2. in vfio, memory_region_register_iommu_notifier() is followed by
memory_region_iommu_replay(), which will first call address space unmap,
and walk and add back all entries in vtd shadow page table. e.g.
(1) for notifier 0-0xfedfffff,
    IOVAs from 0 - 0xffffffff get unmapped,
    and IOVAs from 0x3c000000 - 0x3c1fffff get mapped
(2) for notifier 0xfef00000-0xffffffffffffffff
    IOVAs from 0 - 0x7fffffffff get unmapped,
    but IOVAs from 0x3c000000 - 0x3c1fffff cannot get mapped back.

Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 memory.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/memory.c b/memory.c
index 07c8315..a6b9da6 100644
--- a/memory.c
+++ b/memory.c
@@ -1948,6 +1948,14 @@ void memory_region_notify_one(IOMMUNotifier *notifier,
         return;
     }
 
+    if (entry->iova < notifier->start) {
+        entry->iova = notifier->start;
+    }
+
+    if (entry->iova + entry->addr_mask > notifier->end) {
+        entry->addr_mask = notifier->end - entry->iova;
+    }
+
     if (entry->perm & IOMMU_RW) {
         printf("map %lx %lx\n", entry->iova, entry->iova + entry->addr_mask);
         request_flags = IOMMU_NOTIFIER_MAP;
-- 
2.7.4


