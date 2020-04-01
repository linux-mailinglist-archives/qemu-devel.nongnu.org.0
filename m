Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2E419A6F4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Apr 2020 10:16:33 +0200 (CEST)
Received: from localhost ([::1]:48810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJYY3-0003Gx-Rd
	for lists+qemu-devel@lfdr.de; Wed, 01 Apr 2020 04:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35272)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <s.reiter@proxmox.com>) id 1jJYWs-0001rT-0w
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 04:15:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <s.reiter@proxmox.com>) id 1jJYWr-00070d-2L
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 04:15:17 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:34521)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <s.reiter@proxmox.com>)
 id 1jJYWo-0006hw-L2; Wed, 01 Apr 2020 04:15:14 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id A66F845930;
 Wed,  1 Apr 2020 10:15:10 +0200 (CEST)
From: Stefan Reiter <s.reiter@proxmox.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH v4 2/3] replication: acquire aio context before calling
 job_cancel_sync
Date: Wed,  1 Apr 2020 10:15:03 +0200
Message-Id: <20200401081504.200017-3-s.reiter@proxmox.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200401081504.200017-1-s.reiter@proxmox.com>
References: <20200401081504.200017-1-s.reiter@proxmox.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.186.127.180
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, slp@redhat.com,
 mreitz@redhat.com, stefanha@redhat.com, jsnow@redhat.com, dietmar@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

job_cancel_sync requires the job's lock to be held, all other callers
already do this (replication_stop, drive_backup_abort,
blockdev_backup_abort, job_cancel_sync_all, cancel_common).

Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
---
 block/replication.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/block/replication.c b/block/replication.c
index 413d95407d..17ddc31569 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -144,12 +144,18 @@ fail:
 static void replication_close(BlockDriverState *bs)
 {
     BDRVReplicationState *s =3D bs->opaque;
+    Job *commit_job;
+    AioContext *commit_ctx;
=20
     if (s->stage =3D=3D BLOCK_REPLICATION_RUNNING) {
         replication_stop(s->rs, false, NULL);
     }
     if (s->stage =3D=3D BLOCK_REPLICATION_FAILOVER) {
-        job_cancel_sync(&s->commit_job->job);
+        commit_job =3D &s->commit_job->job;
+        commit_ctx =3D commit_job->aio_context;
+        aio_context_acquire(commit_ctx);
+        job_cancel_sync(commit_job);
+        aio_context_release(commit_ctx);
     }
=20
     if (s->mode =3D=3D REPLICATION_MODE_SECONDARY) {
--=20
2.26.0



