Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7022614E4E6
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 22:38:37 +0100 (CET)
Received: from localhost ([::1]:39424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixHWG-0001Ar-DL
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 16:38:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56470)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1ixHQU-0008QG-Sm
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 16:32:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1ixHQT-0006Wp-Dd
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 16:32:38 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:46904
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1ixHQT-0006WK-8Y
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 16:32:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580419956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k9oak+DZwenPuEWJZV/Nh+OygvUsM7UqW0QjZl8vAKA=;
 b=CNU9l6R/fnpeyZoFmd2/hD2xKdJRz9Jx80f/kTjRXeoGh6nefbmpr1P/c9gprlmOR8bcnQ
 dtubWqW7c5rvIuzDe0G57lgKWdjFGB0OsZi3v7DH3TFsc+JDsfD9ShG63o+i5u4Q2wkQVI
 2qOnH4A38+Bww1zKT7frDo5Oqbm7whk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-FVHFyw5fNmOQgmaVLXV1Jg-1; Thu, 30 Jan 2020 16:32:34 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91D0413E7;
 Thu, 30 Jan 2020 21:32:33 +0000 (UTC)
Received: from localhost (unknown [10.36.118.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43E6987B2C;
 Thu, 30 Jan 2020 21:32:28 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/18] block: add trace events for io_uring
Date: Thu, 30 Jan 2020 21:31:08 +0000
Message-Id: <20200130213114.325157-13-stefanha@redhat.com>
In-Reply-To: <20200130213114.325157-1-stefanha@redhat.com>
References: <20200130213114.325157-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: FVHFyw5fNmOQgmaVLXV1Jg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
 qemu-block@nongnu.org, Julia Suvorova <jusual@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aarushi Mehta <mehta.aaru20@gmail.com>

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
Acked-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: 20200120141858.587874-10-stefanha@redhat.com
Message-Id: <20200120141858.587874-10-stefanha@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/io_uring.c   | 23 ++++++++++++++++++++---
 block/trace-events | 12 ++++++++++++
 2 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/block/io_uring.c b/block/io_uring.c
index bb433a685b..a5c0d16220 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -17,6 +17,7 @@
 #include "block/raw-aio.h"
 #include "qemu/coroutine.h"
 #include "qapi/error.h"
+#include "trace.h"
=20
 /* io_uring ring size */
 #define MAX_ENTRIES 128
@@ -85,6 +86,8 @@ static void luring_resubmit_short_read(LuringState *s, Lu=
ringAIOCB *luringcb,
     QEMUIOVector *resubmit_qiov;
     size_t remaining;
=20
+    trace_luring_resubmit_short_read(s, luringcb, nread);
+
     /* Update read position */
     luringcb->total_read =3D nread;
     remaining =3D luringcb->qiov->size - luringcb->total_read;
@@ -156,6 +159,7 @@ static void luring_process_completions(LuringState *s)
=20
         /* Change counters one-by-one because we can be nested. */
         s->io_q.in_flight--;
+        trace_luring_process_completion(s, luringcb, ret);
=20
         /* total_read is non-zero only for resubmitted read requests */
         total_bytes =3D ret + luringcb->total_read;
@@ -224,6 +228,7 @@ static int ioq_submit(LuringState *s)
             QSIMPLEQ_REMOVE_HEAD(&s->io_q.submit_queue, next);
         }
         ret =3D io_uring_submit(&s->ring);
+        trace_luring_io_uring_submit(s, ret);
         /* Prevent infinite loop if submission is refused */
         if (ret <=3D 0) {
             if (ret =3D=3D -EAGAIN) {
@@ -280,12 +285,15 @@ static void ioq_init(LuringQueue *io_q)
=20
 void luring_io_plug(BlockDriverState *bs, LuringState *s)
 {
+    trace_luring_io_plug(s);
     s->io_q.plugged++;
 }
=20
 void luring_io_unplug(BlockDriverState *bs, LuringState *s)
 {
     assert(s->io_q.plugged);
+    trace_luring_io_unplug(s, s->io_q.blocked, s->io_q.plugged,
+                           s->io_q.in_queue, s->io_q.in_flight);
     if (--s->io_q.plugged =3D=3D 0 &&
         !s->io_q.blocked && s->io_q.in_queue > 0) {
         ioq_submit(s);
@@ -306,6 +314,7 @@ void luring_io_unplug(BlockDriverState *bs, LuringState=
 *s)
 static int luring_do_submit(int fd, LuringAIOCB *luringcb, LuringState *s,
                             uint64_t offset, int type)
 {
+    int ret;
     struct io_uring_sqe *sqes =3D &luringcb->sqeq;
=20
     switch (type) {
@@ -329,11 +338,14 @@ static int luring_do_submit(int fd, LuringAIOCB *luri=
ngcb, LuringState *s,
=20
     QSIMPLEQ_INSERT_TAIL(&s->io_q.submit_queue, luringcb, next);
     s->io_q.in_queue++;
-
+    trace_luring_do_submit(s, s->io_q.blocked, s->io_q.plugged,
+                           s->io_q.in_queue, s->io_q.in_flight);
     if (!s->io_q.blocked &&
         (!s->io_q.plugged ||
          s->io_q.in_flight + s->io_q.in_queue >=3D MAX_ENTRIES)) {
-        return ioq_submit(s);
+        ret =3D ioq_submit(s);
+        trace_luring_do_submit_done(s, ret);
+        return ret;
     }
     return 0;
 }
@@ -348,8 +360,10 @@ int coroutine_fn luring_co_submit(BlockDriverState *bs=
, LuringState *s, int fd,
         .qiov       =3D qiov,
         .is_read    =3D (type =3D=3D QEMU_AIO_READ),
     };
-
+    trace_luring_co_submit(bs, s, &luringcb, fd, offset, qiov ? qiov->size=
 : 0,
+                           type);
     ret =3D luring_do_submit(fd, &luringcb, s, offset, type);
+
     if (ret < 0) {
         return ret;
     }
@@ -382,6 +396,8 @@ LuringState *luring_init(Error **errp)
     LuringState *s =3D g_new0(LuringState, 1);
     struct io_uring *ring =3D &s->ring;
=20
+    trace_luring_init_state(s, sizeof(*s));
+
     rc =3D io_uring_queue_init(MAX_ENTRIES, ring, 0);
     if (rc < 0) {
         error_setg_errno(errp, errno, "failed to init linux io_uring ring"=
);
@@ -398,4 +414,5 @@ void luring_cleanup(LuringState *s)
 {
     io_uring_queue_exit(&s->ring);
     g_free(s);
+    trace_luring_cleanup_state(s);
 }
diff --git a/block/trace-events b/block/trace-events
index 6ba86decca..1a7329b736 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -63,6 +63,18 @@ qmp_block_stream(void *bs) "bs %p"
 file_paio_submit(void *acb, void *opaque, int64_t offset, int count, int t=
ype) "acb %p opaque %p offset %"PRId64" count %d type %d"
 file_copy_file_range(void *bs, int src, int64_t src_off, int dst, int64_t =
dst_off, int64_t bytes, int flags, int64_t ret) "bs %p src_fd %d offset %"P=
RIu64" dst_fd %d offset %"PRIu64" bytes %"PRIu64" flags %d ret %"PRId64
=20
+#io_uring.c
+luring_init_state(void *s, size_t size) "s %p size %zu"
+luring_cleanup_state(void *s) "%p freed"
+luring_io_plug(void *s) "LuringState %p plug"
+luring_io_unplug(void *s, int blocked, int plugged, int queued, int inflig=
ht) "LuringState %p blocked %d plugged %d queued %d inflight %d"
+luring_do_submit(void *s, int blocked, int plugged, int queued, int inflig=
ht) "LuringState %p blocked %d plugged %d queued %d inflight %d"
+luring_do_submit_done(void *s, int ret) "LuringState %p submitted to kerne=
l %d"
+luring_co_submit(void *bs, void *s, void *luringcb, int fd, uint64_t offse=
t, size_t nbytes, int type) "bs %p s %p luringcb %p fd %d offset %" PRId64 =
" nbytes %zd type %d"
+luring_process_completion(void *s, void *aiocb, int ret) "LuringState %p l=
uringcb %p ret %d"
+luring_io_uring_submit(void *s, int ret) "LuringState %p ret %d"
+luring_resubmit_short_read(void *s, void *luringcb, int nread) "LuringStat=
e %p luringcb %p nread %d"
+
 # qcow2.c
 qcow2_add_task(void *co, void *bs, void *pool, const char *action, int clu=
ster_type, uint64_t file_cluster_offset, uint64_t offset, uint64_t bytes, v=
oid *qiov, size_t qiov_offset) "co %p bs %p pool %p: %s: cluster_type %d fi=
le_cluster_offset %" PRIu64 " offset %" PRIu64 " bytes %" PRIu64 " qiov %p =
qiov_offset %zu"
 qcow2_writev_start_req(void *co, int64_t offset, int bytes) "co %p offset =
0x%" PRIx64 " bytes %d"
--=20
2.24.1


