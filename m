Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB9114A968
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 19:05:01 +0100 (CET)
Received: from localhost ([::1]:49172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iw8ku-0004uh-Ca
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 13:05:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55053)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iw8ca-0002KN-NG
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 12:56:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iw8cY-0002tj-KN
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 12:56:24 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58715
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iw8cY-0002rt-Ce
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 12:56:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580147780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fYWMYUOprsn2KuNX5E6MISeuolECeTpsS8tGXI6Bhos=;
 b=SuD+FO6DfG23TnL/zT2HQYIgYDtKoQaBI6x23DW9CabI3JZnOuILuSdorFsRM8fRRxjuSB
 /KBb0CoSWGZD3mq4oyCTjDPCLdqc9N0RNJQZRR20xFHxlkKCftvWDRoL1asEPzQLi1mDX1
 1jtGW+uHtQ6prlGuvkFxDTbhawY7K3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-1IgjyjGEOSGdQkKz_Q1zRg-1; Mon, 27 Jan 2020 12:56:16 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCCDF107ACC5;
 Mon, 27 Jan 2020 17:56:15 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-108.ams2.redhat.com
 [10.36.117.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6B60863C0;
 Mon, 27 Jan 2020 17:56:14 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 08/13] blockdev: Acquire AioContext on dirty bitmap functions
Date: Mon, 27 Jan 2020 18:55:54 +0100
Message-Id: <20200127175559.18173-9-kwolf@redhat.com>
In-Reply-To: <20200127175559.18173-1-kwolf@redhat.com>
References: <20200127175559.18173-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 1IgjyjGEOSGdQkKz_Q1zRg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sergio Lopez <slp@redhat.com>

Dirty map addition and removal functions are not acquiring to BDS
AioContext, while they may call to code that expects it to be
acquired.

This may trigger a crash with a stack trace like this one:

 #0  0x00007f0ef146370f in __GI_raise (sig=3Dsig@entry=3D6)
     at ../sysdeps/unix/sysv/linux/raise.c:50
 #1  0x00007f0ef144db25 in __GI_abort () at abort.c:79
 #2  0x0000565022294dce in error_exit
     (err=3D<optimized out>, msg=3Dmsg@entry=3D0x56502243a730 <__func__.163=
50> "qemu_mutex_unlock_impl") at util/qemu-thread-posix.c:36
 #3  0x00005650222950ba in qemu_mutex_unlock_impl
     (mutex=3Dmutex@entry=3D0x5650244b0240, file=3Dfile@entry=3D0x565022439=
adf "util/async.c", line=3Dline@entry=3D526) at util/qemu-thread-posix.c:10=
8
 #4  0x0000565022290029 in aio_context_release
     (ctx=3Dctx@entry=3D0x5650244b01e0) at util/async.c:526
 #5  0x000056502221cd08 in bdrv_can_store_new_dirty_bitmap
     (bs=3Dbs@entry=3D0x5650244dc820, name=3Dname@entry=3D0x56502481d360 "b=
itmap1", granularity=3Dgranularity@entry=3D65536, errp=3Derrp@entry=3D0x7ff=
f22831718)
     at block/dirty-bitmap.c:542
 #6  0x000056502206ae53 in qmp_block_dirty_bitmap_add
     (errp=3D0x7fff22831718, disabled=3Dfalse, has_disabled=3D<optimized ou=
t>, persistent=3D<optimized out>, has_persistent=3Dtrue, granularity=3D6553=
6, has_granularity=3D<optimized out>, name=3D0x56502481d360 "bitmap1", node=
=3D<optimized out>) at blockdev.c:2894
 #7  0x000056502206ae53 in qmp_block_dirty_bitmap_add
     (node=3D<optimized out>, name=3D0x56502481d360 "bitmap1", has_granular=
ity=3D<optimized out>, granularity=3D<optimized out>, has_persistent=3Dtrue=
, persistent=3D<optimized out>, has_disabled=3Dfalse, disabled=3Dfalse, err=
p=3D0x7fff22831718) at blockdev.c:2856
 #8  0x00005650221847a3 in qmp_marshal_block_dirty_bitmap_add
     (args=3D<optimized out>, ret=3D<optimized out>, errp=3D0x7fff22831798)
     at qapi/qapi-commands-block-core.c:651
 #9  0x0000565022247e6c in do_qmp_dispatch
     (errp=3D0x7fff22831790, allow_oob=3D<optimized out>, request=3D<optimi=
zed out>, cmds=3D0x565022b32d60 <qmp_commands>) at qapi/qmp-dispatch.c:132
 #10 0x0000565022247e6c in qmp_dispatch
     (cmds=3D0x565022b32d60 <qmp_commands>, request=3D<optimized out>, allo=
w_oob=3D<optimized out>) at qapi/qmp-dispatch.c:175
 #11 0x0000565022166061 in monitor_qmp_dispatch
     (mon=3D0x56502450faa0, req=3D<optimized out>) at monitor/qmp.c:145
 #12 0x00005650221666fa in monitor_qmp_bh_dispatcher
     (data=3D<optimized out>) at monitor/qmp.c:234
 #13 0x000056502228f866 in aio_bh_call (bh=3D0x56502440eae0)
     at util/async.c:117
 #14 0x000056502228f866 in aio_bh_poll (ctx=3Dctx@entry=3D0x56502440d7a0)
     at util/async.c:117
 #15 0x0000565022292c54 in aio_dispatch (ctx=3D0x56502440d7a0)
     at util/aio-posix.c:459
 #16 0x000056502228f742 in aio_ctx_dispatch
     (source=3D<optimized out>, callback=3D<optimized out>, user_data=3D<op=
timized out>) at util/async.c:260
 #17 0x00007f0ef5ce667d in g_main_dispatch (context=3D0x56502449aa40)
     at gmain.c:3176
 #18 0x00007f0ef5ce667d in g_main_context_dispatch
     (context=3Dcontext@entry=3D0x56502449aa40) at gmain.c:3829
 #19 0x0000565022291d08 in glib_pollfds_poll () at util/main-loop.c:219
 #20 0x0000565022291d08 in os_host_main_loop_wait
     (timeout=3D<optimized out>) at util/main-loop.c:242
 #21 0x0000565022291d08 in main_loop_wait (nonblocking=3D<optimized out>)
     at util/main-loop.c:518
 #22 0x00005650220743c1 in main_loop () at vl.c:1828
 #23 0x0000565021f20a72 in main
     (argc=3D<optimized out>, argv=3D<optimized out>, envp=3D<optimized out=
>)
     at vl.c:4504

Fix this by acquiring the AioContext at qmp_block_dirty_bitmap_add()
and qmp_block_dirty_bitmap_add().

RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=3D1782175
Signed-off-by: Sergio Lopez <slp@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 blockdev.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 1dacbc20ec..d4ef6cd452 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2984,6 +2984,7 @@ void qmp_block_dirty_bitmap_add(const char *node, con=
st char *name,
 {
     BlockDriverState *bs;
     BdrvDirtyBitmap *bitmap;
+    AioContext *aio_context;
=20
     if (!name || name[0] =3D=3D '\0') {
         error_setg(errp, "Bitmap name cannot be empty");
@@ -2995,11 +2996,14 @@ void qmp_block_dirty_bitmap_add(const char *node, c=
onst char *name,
         return;
     }
=20
+    aio_context =3D bdrv_get_aio_context(bs);
+    aio_context_acquire(aio_context);
+
     if (has_granularity) {
         if (granularity < 512 || !is_power_of_2(granularity)) {
             error_setg(errp, "Granularity must be power of 2 "
                              "and at least 512");
-            return;
+            goto out;
         }
     } else {
         /* Default to cluster size, if available: */
@@ -3017,12 +3021,12 @@ void qmp_block_dirty_bitmap_add(const char *node, c=
onst char *name,
     if (persistent &&
         !bdrv_can_store_new_dirty_bitmap(bs, name, granularity, errp))
     {
-        return;
+        goto out;
     }
=20
     bitmap =3D bdrv_create_dirty_bitmap(bs, granularity, name, errp);
     if (bitmap =3D=3D NULL) {
-        return;
+        goto out;
     }
=20
     if (disabled) {
@@ -3030,6 +3034,9 @@ void qmp_block_dirty_bitmap_add(const char *node, con=
st char *name,
     }
=20
     bdrv_dirty_bitmap_set_persistence(bitmap, persistent);
+
+out:
+    aio_context_release(aio_context);
 }
=20
 static BdrvDirtyBitmap *do_block_dirty_bitmap_remove(
@@ -3038,21 +3045,27 @@ static BdrvDirtyBitmap *do_block_dirty_bitmap_remov=
e(
 {
     BlockDriverState *bs;
     BdrvDirtyBitmap *bitmap;
+    AioContext *aio_context;
=20
     bitmap =3D block_dirty_bitmap_lookup(node, name, &bs, errp);
     if (!bitmap || !bs) {
         return NULL;
     }
=20
+    aio_context =3D bdrv_get_aio_context(bs);
+    aio_context_acquire(aio_context);
+
     if (bdrv_dirty_bitmap_check(bitmap, BDRV_BITMAP_BUSY | BDRV_BITMAP_RO,
                                 errp)) {
+        aio_context_release(aio_context);
         return NULL;
     }
=20
     if (bdrv_dirty_bitmap_get_persistence(bitmap) &&
         bdrv_remove_persistent_dirty_bitmap(bs, name, errp) < 0)
     {
-            return NULL;
+        aio_context_release(aio_context);
+        return NULL;
     }
=20
     if (release) {
@@ -3063,6 +3076,7 @@ static BdrvDirtyBitmap *do_block_dirty_bitmap_remove(
         *bitmap_bs =3D bs;
     }
=20
+    aio_context_release(aio_context);
     return release ? NULL : bitmap;
 }
=20
--=20
2.20.1


