Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3BBC06D8
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 16:00:11 +0200 (CEST)
Received: from localhost ([::1]:51136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDqn3-00052P-Ov
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 10:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34675)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iDqD4-0003ur-CT
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:22:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iDqD2-0000Ri-0R
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:22:57 -0400
Received: from relay.sw.ru ([185.231.240.75]:49752)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iDqCw-0000IU-Pd; Fri, 27 Sep 2019 09:22:50 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iDpHx-0003za-Nm; Fri, 27 Sep 2019 15:23:57 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 2/9] block: reverse order for reopen commits
Date: Fri, 27 Sep 2019 15:23:48 +0300
Message-Id: <20190927122355.7344-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190927122355.7344-1-vsementsov@virtuozzo.com>
References: <20190927122355.7344-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's needed to fix reopening qcow2 with bitmaps to RW. Currently it
can't work, as qcow2 needs write access to file child, to mark bitmaps
in-image with IN_USE flag. But usually children goes after parents in
reopen queue and file child is still RO on qcow2 reopen commit. Reverse
reopen order to fix it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Acked-by: Max Reitz <mreitz@redhat.com>
Acked-by: John Snow <jsnow@redhat.com>
---
 block.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/block.c b/block.c
index 6a3b33f1ec..a2de16c8c7 100644
--- a/block.c
+++ b/block.c
@@ -3486,10 +3486,16 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
         bs_entry->perms_checked = true;
     }
 
-    /* If we reach this point, we have success and just need to apply the
-     * changes
+    /*
+     * If we reach this point, we have success and just need to apply the
+     * changes.
+     *
+     * Reverse order is used to comfort qcow2 driver: on commit it need to write
+     * IN_USE flag to the image, to mark bitmaps in the image as invalid. But
+     * children are usually goes after parents in reopen-queue, so go from last
+     * to first element.
      */
-    QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
+    QTAILQ_FOREACH_REVERSE(bs_entry, bs_queue, entry) {
         bdrv_reopen_commit(&bs_entry->state);
     }
 
-- 
2.21.0


