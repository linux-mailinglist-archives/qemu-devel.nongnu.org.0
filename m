Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32351192F1F
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 18:24:45 +0100 (CET)
Received: from localhost ([::1]:39996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jH9li-0008Cn-7K
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 13:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59409)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jH9kk-0006vx-Tv
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 13:23:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jH9kj-0002k2-KS
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 13:23:42 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:24459)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jH9kj-0002jQ-Gr
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 13:23:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585157020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/8wyeUj06KXeS38TLcF04SKwHtzws1PB37ZwA+U4vxc=;
 b=EKxXx2OfZnN0uw6ONUqhym6d4TgGxFKJEtVGL1cjGSai0cuW/9J6apNFZGjLPWqn669o4W
 3RsO+kuZX/Ro/hpfQ8QuWNGLo0I+EUhX2W0nP/NUZaEyZClkWIryn7SQpy6iNGtaZv3exL
 ra4CCpYHZyuTVxjZzzjymVQRT1VTlGw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-FE4D07BMM9GbGoGBHbpZ2Q-1; Wed, 25 Mar 2020 13:23:38 -0400
X-MC-Unique: FE4D07BMM9GbGoGBHbpZ2Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0265107ACC4;
 Wed, 25 Mar 2020 17:23:37 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-184.ams2.redhat.com
 [10.36.113.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5970A6266E;
 Wed, 25 Mar 2020 17:23:36 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/2] Revert "mirror: Don't let an operation wait for itself"
Date: Wed, 25 Mar 2020 18:23:25 +0100
Message-Id: <20200325172326.22347-2-kwolf@redhat.com>
In-Reply-To: <20200325172326.22347-1-kwolf@redhat.com>
References: <20200325172326.22347-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 7e6c4ff792734e196c8ca82564c56b5e7c6288ca.

The fix was incomplete as it only protected against requests waiting for
themselves, but not against requests waiting for each other. We need a
different solution.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/mirror.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index 447051dbc6..393131b135 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -283,14 +283,11 @@ static int mirror_cow_align(MirrorBlockJob *s, int64_=
t *offset,
 }
=20
 static inline void coroutine_fn
-mirror_wait_for_any_operation(MirrorBlockJob *s, MirrorOp *self, bool acti=
ve)
+mirror_wait_for_any_operation(MirrorBlockJob *s, bool active)
 {
     MirrorOp *op;
=20
     QTAILQ_FOREACH(op, &s->ops_in_flight, next) {
-        if (self =3D=3D op) {
-            continue;
-        }
         /* Do not wait on pseudo ops, because it may in turn wait on
          * some other operation to start, which may in fact be the
          * caller of this function.  Since there is only one pseudo op
@@ -305,10 +302,10 @@ mirror_wait_for_any_operation(MirrorBlockJob *s, Mirr=
orOp *self, bool active)
 }
=20
 static inline void coroutine_fn
-mirror_wait_for_free_in_flight_slot(MirrorBlockJob *s, MirrorOp *self)
+mirror_wait_for_free_in_flight_slot(MirrorBlockJob *s)
 {
     /* Only non-active operations use up in-flight slots */
-    mirror_wait_for_any_operation(s, self, false);
+    mirror_wait_for_any_operation(s, false);
 }
=20
 /* Perform a mirror copy operation.
@@ -351,7 +348,7 @@ static void coroutine_fn mirror_co_read(void *opaque)
=20
     while (s->buf_free_count < nb_chunks) {
         trace_mirror_yield_in_flight(s, op->offset, s->in_flight);
-        mirror_wait_for_free_in_flight_slot(s, op);
+        mirror_wait_for_free_in_flight_slot(s);
     }
=20
     /* Now make a QEMUIOVector taking enough granularity-sized chunks
@@ -558,7 +555,7 @@ static uint64_t coroutine_fn mirror_iteration(MirrorBlo=
ckJob *s)
=20
         while (s->in_flight >=3D MAX_IN_FLIGHT) {
             trace_mirror_yield_in_flight(s, offset, s->in_flight);
-            mirror_wait_for_free_in_flight_slot(s, pseudo_op);
+            mirror_wait_for_free_in_flight_slot(s);
         }
=20
         if (s->ret < 0) {
@@ -612,7 +609,7 @@ static void mirror_free_init(MirrorBlockJob *s)
 static void coroutine_fn mirror_wait_for_all_io(MirrorBlockJob *s)
 {
     while (s->in_flight > 0) {
-        mirror_wait_for_free_in_flight_slot(s, NULL);
+        mirror_wait_for_free_in_flight_slot(s);
     }
 }
=20
@@ -809,7 +806,7 @@ static int coroutine_fn mirror_dirty_init(MirrorBlockJo=
b *s)
             if (s->in_flight >=3D MAX_IN_FLIGHT) {
                 trace_mirror_yield(s, UINT64_MAX, s->buf_free_count,
                                    s->in_flight);
-                mirror_wait_for_free_in_flight_slot(s, NULL);
+                mirror_wait_for_free_in_flight_slot(s);
                 continue;
             }
=20
@@ -962,7 +959,7 @@ static int coroutine_fn mirror_run(Job *job, Error **er=
rp)
         /* Do not start passive operations while there are active
          * writes in progress */
         while (s->in_active_write_counter) {
-            mirror_wait_for_any_operation(s, NULL, true);
+            mirror_wait_for_any_operation(s, true);
         }
=20
         if (s->ret < 0) {
@@ -988,7 +985,7 @@ static int coroutine_fn mirror_run(Job *job, Error **er=
rp)
             if (s->in_flight >=3D MAX_IN_FLIGHT || s->buf_free_count =3D=
=3D 0 ||
                 (cnt =3D=3D 0 && s->in_flight > 0)) {
                 trace_mirror_yield(s, cnt, s->buf_free_count, s->in_flight=
);
-                mirror_wait_for_free_in_flight_slot(s, NULL);
+                mirror_wait_for_free_in_flight_slot(s);
                 continue;
             } else if (cnt !=3D 0) {
                 delay_ns =3D mirror_iteration(s);
--=20
2.20.1


