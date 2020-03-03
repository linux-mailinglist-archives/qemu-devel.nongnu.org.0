Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63718176D80
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 04:18:55 +0100 (CET)
Received: from localhost ([::1]:41356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8y57-0006Dz-VT
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 22:18:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59171)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yi.y.sun@linux.intel.com>) id 1j8y49-0005mS-ML
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 22:17:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yi.y.sun@linux.intel.com>) id 1j8y44-00013M-NE
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 22:17:53 -0500
Received: from mga14.intel.com ([192.55.52.115]:57394)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yi.y.sun@linux.intel.com>)
 id 1j8y44-0000k2-FC
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 22:17:48 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 19:16:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,509,1574150400"; d="scan'208";a="351722170"
Received: from yisun1-ubuntu.bj.intel.com ([10.238.156.100])
 by fmsmga001.fm.intel.com with ESMTP; 02 Mar 2020 19:16:40 -0800
From: Yi Sun <yi.y.sun@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] memory: remove assert to avoid unnecessary coredump
Date: Tue,  3 Mar 2020 11:11:14 +0800
Message-Id: <20200303031114.21111-1-yi.y.sun@linux.intel.com>
X-Mailer: git-send-email 2.15.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.115
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
Cc: pbonzini@redhat.com, yan.y.zhao@intel.com,
 Yi Sun <yi.y.sun@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is too strict to use assert to make qemu coredump if
the notification does not overlap with registered range.
Skip it is fine enough.

During test, we found such a case for vhost net device:
    memory_region_notify_one: entry->iova=0xfee00000, entry_end=0xfeffffff, notifier->start=0xfef00000, notifier->end=0xffffffffffffffff

Skip this notification but not coredump makes everything
work well.

Signed-off-by: Yi Sun <yi.y.sun@linux.intel.com>
---
 memory.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/memory.c b/memory.c
index 06484c2bff..62ad0f3377 100644
--- a/memory.c
+++ b/memory.c
@@ -1921,12 +1921,11 @@ void memory_region_notify_one(IOMMUNotifier *notifier,
      * Skip the notification if the notification does not overlap
      * with registered range.
      */
-    if (notifier->start > entry_end || notifier->end < entry->iova) {
+    if (notifier->start > entry_end || notifier->end < entry->iova ||
+        entry->iova < notifier->start || entry_end > notifier->end) {
         return;
     }
 
-    assert(entry->iova >= notifier->start && entry_end <= notifier->end);
-
     if (entry->perm & IOMMU_RW) {
         request_flags = IOMMU_NOTIFIER_MAP;
     } else {
-- 
2.15.1


