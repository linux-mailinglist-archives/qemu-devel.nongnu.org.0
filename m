Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B547DE94
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 17:15:13 +0200 (CEST)
Received: from localhost ([::1]:56648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htCnQ-00038k-Nr
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 11:15:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35009)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1htClA-0001Os-Sr
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 11:12:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1htCl9-0006PJ-Un
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 11:12:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:27411)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1htCl0-0006LJ-VG; Thu, 01 Aug 2019 11:12:45 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DBA18C0B934C;
 Thu,  1 Aug 2019 15:12:39 +0000 (UTC)
Received: from localhost (ovpn-204-187.brq.redhat.com [10.40.204.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72CDA60852;
 Thu,  1 Aug 2019 15:12:39 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Thu,  1 Aug 2019 17:12:34 +0200
Message-Id: <20190801151235.8434-2-mreitz@redhat.com>
In-Reply-To: <20190801151235.8434-1-mreitz@redhat.com>
References: <20190801151235.8434-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 01 Aug 2019 15:12:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-4.1 1/2] backup: Copy only dirty areas
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The backup job must only copy areas that the copy_bitmap reports as
dirty.  This is always the case when using traditional non-offloading
backup, because it copies each cluster separately.  When offloading the
copy operation, we sometimes copy more than one cluster at a time, but
we only check whether the first one is dirty.

Therefore, whenever copy offloading is possible, the backup job
currently produces wrong output when the guest writes to an area of
which an inner part has already been backed up, because that inner part
will be re-copied.

Fixes: 9ded4a0114968e98b41494fc035ba14f84cdf700
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/backup.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 715e1d3be8..1ee271f9f1 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -202,22 +202,31 @@ static int coroutine_fn backup_do_cow(BackupBlockJo=
b *job,
     cow_request_begin(&cow_request, job, start, end);
=20
     while (start < end) {
+        int64_t dirty_end;
+
         if (!hbitmap_get(job->copy_bitmap, start)) {
             trace_backup_do_cow_skip(job, start);
             start +=3D job->cluster_size;
             continue; /* already copied */
         }
=20
+        dirty_end =3D hbitmap_next_zero(job->copy_bitmap, start, (end - =
start));
+        if (dirty_end < 0) {
+            dirty_end =3D end;
+        }
+
         trace_backup_do_cow_process(job, start);
=20
         if (job->use_copy_range) {
-            ret =3D backup_cow_with_offload(job, start, end, is_write_no=
tifier);
+            ret =3D backup_cow_with_offload(job, start, dirty_end,
+                                          is_write_notifier);
             if (ret < 0) {
                 job->use_copy_range =3D false;
             }
         }
         if (!job->use_copy_range) {
-            ret =3D backup_cow_with_bounce_buffer(job, start, end, is_wr=
ite_notifier,
+            ret =3D backup_cow_with_bounce_buffer(job, start, dirty_end,
+                                                is_write_notifier,
                                                 error_is_read, &bounce_b=
uffer);
         }
         if (ret < 0) {
--=20
2.21.0


