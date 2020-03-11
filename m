Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A767B181CE0
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 16:51:38 +0100 (CET)
Received: from localhost ([::1]:54646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC3dx-00018V-Oc
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 11:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59925)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jC3VS-0003DK-K2
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jC3VQ-0003hi-G0
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:50 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:52094
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jC3VQ-0003gj-Cf
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583941368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TybeXpzKZnnidKvMeVUslFZhOOC2RpdS7pjktkiZCoI=;
 b=dNT8EPfUKBajmgJ7iFh9m+qr4xAz+9q8+Ldiy/nWmwcTzG312cT15jfDDqsvLIipy2JQ/A
 4TbfGPa1OGZ2LbNtRUZJt6fajN/0vp5/6a4nCAQfwQgWoMZ8jBAAJYtB0a8nIowNWsYnxO
 +AXHocP/WWcLYR+bboJrucnv7RB24rM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-I9RaoBGoMi-gzqyH7WMaQw-1; Wed, 11 Mar 2020 11:42:40 -0400
X-MC-Unique: I9RaoBGoMi-gzqyH7WMaQw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C36318017CC;
 Wed, 11 Mar 2020 15:42:39 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-234.ams2.redhat.com
 [10.36.117.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF6BC90519;
 Wed, 11 Mar 2020 15:42:36 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 10/13] block: introducing 'bdrv_co_delete_file' interface
Date: Wed, 11 Mar 2020 16:42:15 +0100
Message-Id: <20200311154218.15532-11-kwolf@redhat.com>
In-Reply-To: <20200311154218.15532-1-kwolf@redhat.com>
References: <20200311154218.15532-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

Adding to Block Drivers the capability of being able to clean up
its created files can be useful in certain situations. For the
LUKS driver, for instance, a failure in one of its authentication
steps can leave files in the host that weren't there before.

This patch adds the 'bdrv_co_delete_file' interface to block
drivers and add it to the 'file' driver in file-posix.c. The
implementation is given by 'raw_co_delete_file'.

Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20200130213907.2830642-2-danielhb413@gmail.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int.h |  4 ++++
 block/file-posix.c        | 23 +++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index d8d13700a9..ae9c4da4d0 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -314,6 +314,10 @@ struct BlockDriver {
      */
     int coroutine_fn (*bdrv_co_flush)(BlockDriverState *bs);
=20
+    /* Delete a created file. */
+    int coroutine_fn (*bdrv_co_delete_file)(BlockDriverState *bs,
+                                            Error **errp);
+
     /*
      * Flushes all data that was already written to the OS all the way dow=
n to
      * the disk (for example file-posix.c calls fsync()).
diff --git a/block/file-posix.c b/block/file-posix.c
index 0f77447a25..9bc3838b2a 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2445,6 +2445,28 @@ static int coroutine_fn raw_co_create_opts(const cha=
r *filename, QemuOpts *opts,
     return raw_co_create(&options, errp);
 }
=20
+static int coroutine_fn raw_co_delete_file(BlockDriverState *bs,
+                                           Error **errp)
+{
+    struct stat st;
+    int ret;
+
+    if (!(stat(bs->filename, &st) =3D=3D 0) || !S_ISREG(st.st_mode)) {
+        error_setg_errno(errp, ENOENT, "%s is not a regular file",
+                         bs->filename);
+        return -ENOENT;
+    }
+
+    ret =3D unlink(bs->filename);
+    if (ret < 0) {
+        ret =3D -errno;
+        error_setg_errno(errp, -ret, "Error when deleting file %s",
+                         bs->filename);
+    }
+
+    return ret;
+}
+
 /*
  * Find allocation range in @bs around offset @start.
  * May change underlying file descriptor's file offset.
@@ -3075,6 +3097,7 @@ BlockDriver bdrv_file =3D {
     .bdrv_co_block_status =3D raw_co_block_status,
     .bdrv_co_invalidate_cache =3D raw_co_invalidate_cache,
     .bdrv_co_pwrite_zeroes =3D raw_co_pwrite_zeroes,
+    .bdrv_co_delete_file =3D raw_co_delete_file,
=20
     .bdrv_co_preadv         =3D raw_co_preadv,
     .bdrv_co_pwritev        =3D raw_co_pwritev,
--=20
2.20.1


