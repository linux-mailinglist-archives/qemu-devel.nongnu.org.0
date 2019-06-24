Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0571C5048E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 10:29:51 +0200 (CEST)
Received: from localhost ([::1]:48738 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfKMH-0000Ie-9k
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 04:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39183)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <yan.y.zhao@intel.com>) id 1hfKL5-0007uj-JC
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 04:28:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yan.y.zhao@intel.com>) id 1hfKL3-0007ys-JD
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 04:28:35 -0400
Received: from mga05.intel.com ([192.55.52.43]:5381)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
 id 1hfKL3-0007sY-Aq
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 04:28:33 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jun 2019 01:28:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,411,1557212400"; d="scan'208";a="359942961"
Received: from joy-desktop.sh.intel.com ([10.239.13.126])
 by fmsmga006.fm.intel.com with ESMTP; 24 Jun 2019 01:28:25 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: pbonzini@redhat.com
Date: Mon, 24 Jun 2019 16:26:21 +0800
Message-Id: <1561364781-6897-1-git-send-email-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.43
Subject: [Qemu-devel] [PATCH v2] memory: warning on out of scope notification
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
Cc: Auger Eric <eric.auger@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

if an entry has parts out of scope of notifier's range, print warning
message.

Out of scope mapping/unmapping would cause problem, as in below case:

1. initially there are two notifiers with ranges
0-0xfedfffff, 0xfef00000-0xffffffffffffffff,
IOVAs from 0x3c000000 - 0x3c1fffff is in shadow page table.

2. in vfio, memory_region_register_iommu_notifier() is followed by
memory_region_iommu_replay(), which will first call address space
unmap,
and walk and add back all entries in vtd shadow page table. e.g.
(1) for notifier 0-0xfedfffff,
    IOVAs from 0 - 0xffffffff get unmapped,
    and IOVAs from 0x3c000000 - 0x3c1fffff get mapped
(2) for notifier 0xfef00000-0xffffffffffffffff
    IOVAs from 0 - 0x7fffffffff get unmapped,
    but IOVAs from 0x3c000000 - 0x3c1fffff cannot get mapped back.

Cc: Auger Eric <eric.auger@redhat.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>

---
v2:
1. added a local variable entry_end (Auger Eric)
2. using PRIx64 as format for address range in warning message
(Auger Eric)

---
 memory.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/memory.c b/memory.c
index 0a089a7..3aacc09 100644
--- a/memory.c
+++ b/memory.c
@@ -1937,12 +1937,13 @@ void memory_region_notify_one(IOMMUNotifier *notifier,
                               IOMMUTLBEntry *entry)
 {
     IOMMUNotifierFlag request_flags;
+    hwaddr entry_end = entry->iova + entry->addr_mask;
 
     /*
      * Skip the notification if the notification does not overlap
      * with registered range.
      */
-    if (notifier->start > entry->iova + entry->addr_mask ||
+    if (notifier->start > entry_end ||
         notifier->end < entry->iova) {
         return;
     }
@@ -1953,6 +1954,16 @@ void memory_region_notify_one(IOMMUNotifier *notifier,
         request_flags = IOMMU_NOTIFIER_UNMAP;
     }
 
+    if (entry->iova < notifier->start ||
+            entry_end > notifier->end) {
+        warn_report("%s IOMMUTLBEntry 0x%" PRIx64 "-0x%" PRIx64
+                "outside of notifier scope 0x%" PRIx64 "-0x%" PRIx64,
+                (request_flags == IOMMU_NOTIFIER_MAP) ?
+                "Mapping" : "Unmapping",
+                entry->iova, entry->iova + entry->addr_mask,
+                notifier->start, notifier->end);
+    }
+
     if (notifier->notifier_flags & request_flags) {
         notifier->notify(notifier, entry);
     }
-- 
2.7.4


