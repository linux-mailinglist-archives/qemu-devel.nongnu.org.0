Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E96A957CB
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 09:04:12 +0200 (CEST)
Received: from localhost ([::1]:33792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzyBf-0007X4-3S
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 03:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42501)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1hzy8A-0005LW-JV
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:00:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hzy85-0002z8-Mg
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:00:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42080)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hzy85-0002y1-Ge
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:00:29 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D5B70195D837;
 Tue, 20 Aug 2019 07:00:28 +0000 (UTC)
Received: from 640k.localdomain.com (ovpn-112-20.ams2.redhat.com
 [10.36.112.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88DB49F70;
 Tue, 20 Aug 2019 07:00:17 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 08:59:25 +0200
Message-Id: <1566284395-30287-7-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1566284395-30287-1-git-send-email-pbonzini@redhat.com>
References: <1566284395-30287-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Tue, 20 Aug 2019 07:00:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 06/36] memory: assert on out of scope
 notification
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
Cc: Eric Auger <eric.auger@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yan Zhao <yan.y.zhao@intel.com>

It is wrong for an entry to have parts out of scope of notifier's range.
assert this condition.

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

Cc: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>

Message-Id: <1561432878-13754-1-git-send-email-yan.y.zhao@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 memory.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/memory.c b/memory.c
index 5d8c9a9..e42d63a 100644
--- a/memory.c
+++ b/memory.c
@@ -1942,16 +1942,18 @@ void memory_region_notify_one(IOMMUNotifier *notifier,
                               IOMMUTLBEntry *entry)
 {
     IOMMUNotifierFlag request_flags;
+    hwaddr entry_end = entry->iova + entry->addr_mask;
 
     /*
      * Skip the notification if the notification does not overlap
      * with registered range.
      */
-    if (notifier->start > entry->iova + entry->addr_mask ||
-        notifier->end < entry->iova) {
+    if (notifier->start > entry_end || notifier->end < entry->iova) {
         return;
     }
 
+    assert(entry->iova >= notifier->start && entry_end <= notifier->end);
+
     if (entry->perm & IOMMU_RW) {
         request_flags = IOMMU_NOTIFIER_MAP;
     } else {
-- 
1.8.3.1



