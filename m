Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4935DE20B3
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 18:36:21 +0200 (CEST)
Received: from localhost ([::1]:41324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNJcR-0002xw-0U
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 12:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41344)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iNIiB-0005we-0g
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:38:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iNIi9-0001Q7-RZ
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:38:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33297
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iNIi9-0001OS-Nj
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:38:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571845088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UY9iY5p/Fm47ON2SbT8P1GlSsHjIJza8oxl3Nd0ZVr8=;
 b=JO1FdaAQ5IOqtBjmZZ34DnmijVARWHrh4V4HsqljCDI4VA0+A1DpZ0Fp9lSkJ+mC1zlURH
 QekhEhRGhTvXfoZtAHKqdA7DW1VJAzjEXHjyGLIzarzYTRg6KH/a+rozCxWSMU13cJjAwI
 ruK4VKDvdMUDURzDmWe/IwoV25KR114=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-c0rlX4RVMNyWWMTBoGxBWQ-1; Wed, 23 Oct 2019 11:37:58 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64DEC800D54;
 Wed, 23 Oct 2019 15:37:54 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-192.ams2.redhat.com
 [10.36.117.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06DD4600CC;
 Wed, 23 Oct 2019 15:37:50 +0000 (UTC)
Date: Wed, 23 Oct 2019 17:37:49 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: Re: [PATCH 2/3] qcow2: Assert that qcow2_cache_get() callers hold
 s->lock
Message-ID: <20191023153749.GB6177@localhost.localdomain>
References: <20191023152620.13166-1-kwolf@redhat.com>
 <20191023152620.13166-3-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191023152620.13166-3-kwolf@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: c0rlX4RVMNyWWMTBoGxBWQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: psyhomb@gmail.com, michael@weiser.dinsnail.net, vsementsov@virtuozzo.com,
 den@virtuozzo.com, qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 dgilbert@redhat.com, mreitz@redhat.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.10.2019 um 17:26 hat Kevin Wolf geschrieben:
> qcow2_cache_do_get() requires that s->lock is locked because it can
> yield between picking a cache entry and actually taking ownership of it
> by setting offset and increasing the reference count.
>=20
> Add an assertion to make sure the caller really holds the lock. The
> function can be called outside of coroutine context, where bdrv_pread
> and flushes become synchronous operations. The lock cannot and need not
> be taken in this case.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Oops, this one was a bit too optimistic. :-)

I'm still running tests to see if any other code paths trigger the
assertion, but image creation calls this without the lock held (which is
harmless because nobody else knows about the image so there won't be
concurrent requests). The following patch is needed additionally to make
image creation work with the new assertion.

Kevin


diff --git a/block/qcow2.c b/block/qcow2.c
index 0bc69e6996..7761cf3e07 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3213,6 +3213,7 @@ qcow2_co_create(BlockdevCreateOptions *create_options=
, Error **errp)
     BlockBackend *blk =3D NULL;
     BlockDriverState *bs =3D NULL;
     BlockDriverState *data_bs =3D NULL;
+    BDRVQcow2State *s;
     QCowHeader *header;
     size_t cluster_size;
     int version;
@@ -3424,7 +3425,12 @@ qcow2_co_create(BlockdevCreateOptions *create_option=
s, Error **errp)
         goto out;
     }

+    s =3D blk_bs(blk)->opaque;
+
+    qemu_co_mutex_lock(&s->lock);
     ret =3D qcow2_alloc_clusters(blk_bs(blk), 3 * cluster_size);
+    qemu_co_mutex_unlock(&s->lock);
+
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Could not allocate clusters for qcow=
2 "
                          "header and refcount table");
@@ -3437,7 +3443,6 @@ qcow2_co_create(BlockdevCreateOptions *create_options=
, Error **errp)

     /* Set the external data file if necessary */
     if (data_bs) {
-        BDRVQcow2State *s =3D blk_bs(blk)->opaque;
         s->image_data_file =3D g_strdup(data_bs->filename);
     }


