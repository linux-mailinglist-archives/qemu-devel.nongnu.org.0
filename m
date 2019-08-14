Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F228D67C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Aug 2019 16:47:18 +0200 (CEST)
Received: from localhost ([::1]:33002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxuYX-0005tX-MM
	for lists+qemu-devel@lfdr.de; Wed, 14 Aug 2019 10:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34156)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hxuUo-00043X-KF
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 10:43:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hxuUn-0002DN-E2
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 10:43:26 -0400
Received: from relay.sw.ru ([185.231.240.75]:49604)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hxuUi-0002AF-Pv; Wed, 14 Aug 2019 10:43:20 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hxuUf-0007hk-8L; Wed, 14 Aug 2019 17:43:17 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Wed, 14 Aug 2019 17:43:14 +0300
Message-Id: <20190814144315.89729-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190814144315.89729-1-vsementsov@virtuozzo.com>
References: <20190814144315.89729-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH 3/4] block/backup: use
 bdrv_dirty_bitmap_next_dirty
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

Use more effective search for next dirty byte. Trace point is dropped
to not introduce additional variable and logic only for trace point.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/backup.c     | 7 +++----
 block/trace-events | 1 -
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 07d751aea4..9bddea1b59 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -272,10 +272,9 @@ static int coroutine_fn backup_do_cow(BackupBlockJob *job,
     while (start < end) {
         int64_t dirty_end;
 
-        if (!bdrv_dirty_bitmap_get(job->copy_bitmap, start)) {
-            trace_backup_do_cow_skip(job, start);
-            start += job->cluster_size;
-            continue; /* already copied */
+        start = bdrv_dirty_bitmap_next_dirty(job->copy_bitmap, start, end);
+        if (start < 0) {
+            break;
         }
 
         if (job->initializing_bitmap) {
diff --git a/block/trace-events b/block/trace-events
index 04209f058d..7e46f7e036 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -40,7 +40,6 @@ mirror_yield_in_flight(void *s, int64_t offset, int in_flight) "s %p offset %" P
 # backup.c
 backup_do_cow_enter(void *job, int64_t start, int64_t offset, uint64_t bytes) "job %p start %" PRId64 " offset %" PRId64 " bytes %" PRIu64
 backup_do_cow_return(void *job, int64_t offset, uint64_t bytes, int ret) "job %p offset %" PRId64 " bytes %" PRIu64 " ret %d"
-backup_do_cow_skip(void *job, int64_t start) "job %p start %"PRId64
 backup_do_cow_skip_range(void *job, int64_t start, uint64_t bytes) "job %p start %"PRId64" bytes %"PRId64
 backup_do_cow_process(void *job, int64_t start) "job %p start %"PRId64
 backup_do_cow_read_fail(void *job, int64_t start, int ret) "job %p start %"PRId64" ret %d"
-- 
2.18.0


