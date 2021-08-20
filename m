Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB1B3F2A2C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 12:37:18 +0200 (CEST)
Received: from localhost ([::1]:54784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH1tl-0000pq-2N
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 06:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mH1sg-0008IN-18
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 06:36:10 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:60868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mH1sb-00026a-Dt
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 06:36:09 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-uPtbzTmqN0SEyMtuT4Alqg-1; Fri, 20 Aug 2021 06:35:53 -0400
X-MC-Unique: uPtbzTmqN0SEyMtuT4Alqg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F223B107ACF5;
 Fri, 20 Aug 2021 10:35:51 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.192.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AEA35278E;
 Fri, 20 Aug 2021 10:35:50 +0000 (UTC)
Date: Fri, 20 Aug 2021 12:35:49 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 1/2] hw/9pfs: avoid 'path' copy in v9fs_walk()
Message-ID: <20210820123549.4d5b353f@bahia.lan>
In-Reply-To: <7dacbecf25b2c9b4a0ce12d689a8a535f09a31e3.1629208359.git.qemu_oss@crudebyte.com>
References: <cover.1629208359.git.qemu_oss@crudebyte.com>
 <7dacbecf25b2c9b4a0ce12d689a8a535f09a31e3.1629208359.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Aug 2021 14:38:24 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> The v9fs_walk() function resolves all client submitted path nodes to the
> local 'pathes' array. Using a separate string scalar variable 'path'
> inside the background worker thread loop and copying that local 'path'
> string scalar variable subsequently to the 'pathes' array (at the end of
> each loop iteration) is not necessary.
>=20
> Instead simply resolve each path directly to the 'pathes' array and
> don't use the string scalar variable 'path' inside the fs worker thread
> loop at all.
>=20
> The only advantage of the 'path' scalar was that in case of an error
> the respective 'pathes' element would not be filled. Right now this is
> not an issue as the v9fs_walk() function returns as soon as any error
> occurs.
>=20
> Suggested-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

With this change, the path variable is no longer used at all in the
first loop. I see at least an extra possible cleanup : don't set
path before the first loop since it gets reset before the second
one. Maybe we can even get rid of path all the way ? I'll have
a look.

>  hw/9pfs/9p.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 2815257f42..4d642ab12a 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -1787,7 +1787,8 @@ static void coroutine_fn v9fs_walk(void *opaque)
>                  strcmp("..", wnames[name_idx].data))
>              {
>                  err =3D s->ops->name_to_path(&s->ctx, &dpath,
> -                                        wnames[name_idx].data, &path);
> +                                           wnames[name_idx].data,
> +                                           &pathes[name_idx]);
>                  if (err < 0) {
>                      err =3D -errno;
>                      break;
> @@ -1796,14 +1797,13 @@ static void coroutine_fn v9fs_walk(void *opaque)
>                      err =3D -EINTR;
>                      break;
>                  }
> -                err =3D s->ops->lstat(&s->ctx, &path, &stbuf);
> +                err =3D s->ops->lstat(&s->ctx, &pathes[name_idx], &stbuf=
);
>                  if (err < 0) {
>                      err =3D -errno;
>                      break;
>                  }
>                  stbufs[name_idx] =3D stbuf;
> -                v9fs_path_copy(&dpath, &path);
> -                v9fs_path_copy(&pathes[name_idx], &path);
> +                v9fs_path_copy(&dpath, &pathes[name_idx]);
>              }
>          }
>      });


