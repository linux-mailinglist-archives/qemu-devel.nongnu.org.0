Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C48004A37B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 16:10:23 +0200 (CEST)
Received: from localhost ([::1]:58380 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdEoT-0000lL-VG
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 10:10:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59161)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hdEmT-00086A-67
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 10:08:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hdEmQ-0003UM-Mh
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 10:08:13 -0400
Received: from relay.sw.ru ([185.231.240.75]:35210)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hdEmQ-0003Nt-Fv; Tue, 18 Jun 2019 10:08:10 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hdEmL-0001ya-0C; Tue, 18 Jun 2019 17:08:05 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Tue, 18 Jun 2019 17:08:04 +0300
Message-Id: <20190618140804.59214-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH] blockdev: enable non-root nodes for
 transaction drive-backup source
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 armbru@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We forget to enable it for transaction .prepare, while it is already
enabled in do_drive_backup since commit a2d665c1bc362
    "blockdev: loosen restrictions on drive-backup source node"

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

Hmm, I've to add John by hand, get_maintainer.pl don't report him.
Shouldn't we include blockdev.c into Block Jobs in MAINTAINERS?
It definitely related to block jobs.

 blockdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/blockdev.c b/blockdev.c
index b5c0fd3c49..4ae81d687a 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1775,7 +1775,7 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
     assert(common->action->type == TRANSACTION_ACTION_KIND_DRIVE_BACKUP);
     backup = common->action->u.drive_backup.data;
 
-    bs = qmp_get_root_bs(backup->device, errp);
+    bs = bdrv_lookup_bs(backup->device, backup->device, errp);
     if (!bs) {
         return;
     }
-- 
2.18.0


