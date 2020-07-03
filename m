Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40452213E9E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 19:37:17 +0200 (CEST)
Received: from localhost ([::1]:34630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrPci-0002m5-9X
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 13:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1jrPbK-0000mq-6f; Fri, 03 Jul 2020 13:35:50 -0400
Received: from relay.sw.ru ([185.231.240.75]:42270 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1jrPbE-0006zG-HC; Fri, 03 Jul 2020 13:35:49 -0400
Received: from [192.168.15.23] (helo=iris.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <den@openvz.org>)
 id 1jrPb4-0006Ou-DJ; Fri, 03 Jul 2020 20:35:34 +0300
From: "Denis V. Lunev" <den@openvz.org>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/7] migration/savevm: respect qemu_fclose() error code in
 save_snapshot()
Date: Fri,  3 Jul 2020 20:35:32 +0300
Message-Id: <20200703173538.29296-2-den@openvz.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703173538.29296-1-den@openvz.org>
References: <20200703173538.29296-1-den@openvz.org>
Received-SPF: pass client-ip=185.231.240.75; envelope-from=den@openvz.org;
 helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 12:11:34
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Juan Quintela <quintela@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Denis Plotnikov <dplotnikov@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_fclose() could return error, f.e. if bdrv_co_flush() will return
the error.

This validation will become more important once we will start waiting of
asynchronous IO operations, started from bdrv_write_vmstate(), which are
coming soon.

Signed-off-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Max Reitz <mreitz@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>
CC: Fam Zheng <fam@euphon.net>
CC: Juan Quintela <quintela@redhat.com>
CC: Denis Plotnikov <dplotnikov@virtuozzo.com>
---
 migration/savevm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index b979ea6e7f..da3dead4e9 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2628,7 +2628,7 @@ int save_snapshot(const char *name, Error **errp)
 {
     BlockDriverState *bs, *bs1;
     QEMUSnapshotInfo sn1, *sn = &sn1, old_sn1, *old_sn = &old_sn1;
-    int ret = -1;
+    int ret = -1, ret2;
     QEMUFile *f;
     int saved_vm_running;
     uint64_t vm_state_size;
@@ -2712,10 +2712,14 @@ int save_snapshot(const char *name, Error **errp)
     }
     ret = qemu_savevm_state(f, errp);
     vm_state_size = qemu_ftell(f);
-    qemu_fclose(f);
+    ret2 = qemu_fclose(f);
     if (ret < 0) {
         goto the_end;
     }
+    if (ret2 < 0) {
+        ret = ret2;
+        goto the_end;
+    }
 
     /* The bdrv_all_create_snapshot() call that follows acquires the AioContext
      * for itself.  BDRV_POLL_WHILE() does not support nested locking because
-- 
2.17.1


