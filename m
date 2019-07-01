Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9D32CF90
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 21:35:40 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41547 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVhsp-0004Pj-PP
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 15:35:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hVhn2-0000mm-BS
	for qemu-devel@nongnu.org; Tue, 28 May 2019 15:29:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hVhms-0000nY-UO
	for qemu-devel@nongnu.org; Tue, 28 May 2019 15:29:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51430)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hVhmR-0000Bd-9x; Tue, 28 May 2019 15:29:03 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 68F9981114;
	Tue, 28 May 2019 19:28:59 +0000 (UTC)
Received: from localhost (unknown [10.40.205.223])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 012F2611B4;
	Tue, 28 May 2019 19:28:58 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 28 May 2019 21:28:30 +0200
Message-Id: <20190528192847.2730-5-mreitz@redhat.com>
In-Reply-To: <20190528192847.2730-1-mreitz@redhat.com>
References: <20190528192847.2730-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 28 May 2019 19:28:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 04/21] qcow2-threads: qcow2_co_do_compress:
 protect queuing by mutex
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Drop dependence on AioContext lock.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190506142741.41731-5-vsementsov@virtuozzo.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2-threads.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/block/qcow2-threads.c b/block/qcow2-threads.c
index 5a39fdac69..50a9fdeec5 100644
--- a/block/qcow2-threads.c
+++ b/block/qcow2-threads.c
@@ -158,15 +158,19 @@ qcow2_co_do_compress(BlockDriverState *bs, void *de=
st, size_t dest_size,
         .func =3D func,
     };
=20
+    qemu_co_mutex_lock(&s->lock);
     while (s->nb_compress_threads >=3D MAX_COMPRESS_THREADS) {
-        qemu_co_queue_wait(&s->compress_wait_queue, NULL);
+        qemu_co_queue_wait(&s->compress_wait_queue, &s->lock);
     }
-
     s->nb_compress_threads++;
+    qemu_co_mutex_unlock(&s->lock);
+
     thread_pool_submit_co(pool, qcow2_compress_pool_func, &arg);
-    s->nb_compress_threads--;
=20
+    qemu_co_mutex_lock(&s->lock);
+    s->nb_compress_threads--;
     qemu_co_queue_next(&s->compress_wait_queue);
+    qemu_co_mutex_unlock(&s->lock);
=20
     return arg.ret;
 }
--=20
2.21.0


