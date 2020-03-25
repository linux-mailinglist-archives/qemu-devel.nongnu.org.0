Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C69F192D69
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 16:52:05 +0100 (CET)
Received: from localhost ([::1]:38666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jH8K3-0003lG-Uo
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 11:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46791)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <s.reiter@proxmox.com>) id 1jH8JL-0003IE-I3
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 11:51:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <s.reiter@proxmox.com>) id 1jH8JK-0006OR-Ez
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 11:51:19 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:62947)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <s.reiter@proxmox.com>)
 id 1jH8JH-0006Em-VF; Wed, 25 Mar 2020 11:51:16 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 9FA8242E95;
 Wed, 25 Mar 2020 16:51:11 +0100 (CET)
From: Stefan Reiter <s.reiter@proxmox.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH] backup: don't acquire aio_context in backup_clean
Date: Wed, 25 Mar 2020 16:50:55 +0100
Message-Id: <20200325155055.730633-1-s.reiter@proxmox.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <76edbead-7ccf-833b-a3f2-15dff7f0748c@virtuozzo.com>
References: <76edbead-7ccf-833b-a3f2-15dff7f0748c@virtuozzo.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, mreitz@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com, dietmar@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

backup_clean is only ever called as a handler via job_exit, which
already acquires the job's context. The job's context is guaranteed to
be the same as the one used by backup_top via backup_job_create.

Since the previous logic effectively acquired the lock twice, this
broke cleanup of backups for disks using IO threads, since the BDRV_POLL_=
WHILE
in bdrv_backup_top_drop -> bdrv_do_drained_begin would only release the l=
ock
once, thus deadlocking with the IO thread.

Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
---

This is a fix for the issue discussed in this part of the thread:
https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg07639.html
...not the original problem (core dump) posted by Dietmar.

I've still seen it occasionally hang during a backup abort. I'm trying to=
 figure
out why that happens, stack trace indicates a similar problem with the ma=
in
thread hanging at bdrv_do_drained_begin, though I have no clue why as of =
yet.

 block/backup.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 7430ca5883..a7a7dcaf4c 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -126,11 +126,7 @@ static void backup_abort(Job *job)
 static void backup_clean(Job *job)
 {
     BackupBlockJob *s =3D container_of(job, BackupBlockJob, common.job);
-    AioContext *aio_context =3D bdrv_get_aio_context(s->backup_top);
-
-    aio_context_acquire(aio_context);
     bdrv_backup_top_drop(s->backup_top);
-    aio_context_release(aio_context);
 }
=20
 void backup_do_checkpoint(BlockJob *job, Error **errp)
--=20
2.25.2



