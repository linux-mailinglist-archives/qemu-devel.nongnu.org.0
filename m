Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66DBD2897
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 14:00:52 +0200 (CEST)
Received: from localhost ([::1]:36840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIX7h-00006F-UC
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 08:00:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51727)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iIWqr-0006Ss-NA
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 07:43:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iIWqq-000881-GV
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 07:43:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34052)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iIWqn-00086z-3c; Thu, 10 Oct 2019 07:43:21 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5DD6C18C8902;
 Thu, 10 Oct 2019 11:43:20 +0000 (UTC)
Received: from localhost (unknown [10.36.118.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 053E760A9F;
 Thu, 10 Oct 2019 11:43:19 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 08/36] block/backup: split shareable copying part from
 backup_do_cow
Date: Thu, 10 Oct 2019 13:42:32 +0200
Message-Id: <20191010114300.7746-9-mreitz@redhat.com>
In-Reply-To: <20191010114300.7746-1-mreitz@redhat.com>
References: <20191010114300.7746-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Thu, 10 Oct 2019 11:43:20 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Split copying logic which will be shared with backup-top filter.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190920142056.12778-4-vsementsov@virtuozzo.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/backup.c | 47 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 99177f03f8..98d7f7a905 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -248,26 +248,18 @@ static int64_t backup_bitmap_reset_unallocated(Back=
upBlockJob *s,
     return ret;
 }
=20
-static int coroutine_fn backup_do_cow(BackupBlockJob *job,
-                                      int64_t offset, uint64_t bytes,
-                                      bool *error_is_read,
-                                      bool is_write_notifier)
+static int coroutine_fn backup_do_copy(BackupBlockJob *job,
+                                       int64_t start, uint64_t bytes,
+                                       bool *error_is_read,
+                                       bool is_write_notifier)
 {
-    CowRequest cow_request;
     int ret =3D 0;
-    int64_t start, end; /* bytes */
+    int64_t end =3D bytes + start; /* bytes */
     void *bounce_buffer =3D NULL;
     int64_t status_bytes;
=20
-    qemu_co_rwlock_rdlock(&job->flush_rwlock);
-
-    start =3D QEMU_ALIGN_DOWN(offset, job->cluster_size);
-    end =3D QEMU_ALIGN_UP(bytes + offset, job->cluster_size);
-
-    trace_backup_do_cow_enter(job, start, offset, bytes);
-
-    wait_for_overlapping_requests(job, start, end);
-    cow_request_begin(&cow_request, job, start, end);
+    assert(QEMU_IS_ALIGNED(start, job->cluster_size));
+    assert(QEMU_IS_ALIGNED(end, job->cluster_size));
=20
     while (start < end) {
         int64_t dirty_end;
@@ -326,6 +318,31 @@ static int coroutine_fn backup_do_cow(BackupBlockJob=
 *job,
         qemu_vfree(bounce_buffer);
     }
=20
+    return ret;
+}
+
+static int coroutine_fn backup_do_cow(BackupBlockJob *job,
+                                      int64_t offset, uint64_t bytes,
+                                      bool *error_is_read,
+                                      bool is_write_notifier)
+{
+    CowRequest cow_request;
+    int ret =3D 0;
+    int64_t start, end; /* bytes */
+
+    qemu_co_rwlock_rdlock(&job->flush_rwlock);
+
+    start =3D QEMU_ALIGN_DOWN(offset, job->cluster_size);
+    end =3D QEMU_ALIGN_UP(bytes + offset, job->cluster_size);
+
+    trace_backup_do_cow_enter(job, start, offset, bytes);
+
+    wait_for_overlapping_requests(job, start, end);
+    cow_request_begin(&cow_request, job, start, end);
+
+    ret =3D backup_do_copy(job, start, end - start, error_is_read,
+                         is_write_notifier);
+
     cow_request_end(&cow_request);
=20
     trace_backup_do_cow_return(job, offset, bytes, ret);
--=20
2.21.0


