Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E353BA249
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 16:38:44 +0200 (CEST)
Received: from localhost ([::1]:53784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzKJX-0007Ha-Ae
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 10:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lzKI8-0005YH-A0
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 10:37:17 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:49084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lzKI4-0006Y7-CG
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 10:37:14 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-cSTZ1bPlOoS_nP-w4tkupQ-1; Fri, 02 Jul 2021 10:36:59 -0400
X-MC-Unique: cSTZ1bPlOoS_nP-w4tkupQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EB71100CF6E;
 Fri,  2 Jul 2021 14:36:58 +0000 (UTC)
Received: from bahia.lan (ovpn-112-151.ams2.redhat.com [10.36.112.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B01062BFFD;
 Fri,  2 Jul 2021 14:36:57 +0000 (UTC)
Date: Fri, 2 Jul 2021 16:36:56 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 7/7] 9pfs: reduce latency of Twalk
Message-ID: <20210702163656.2b6a8975@bahia.lan>
In-Reply-To: <1a6701674afc4f08d40396e3aa2631e18a4dbb33.1622821729.git.qemu_oss@crudebyte.com>
References: <cover.1622821729.git.qemu_oss@crudebyte.com>
 <1a6701674afc4f08d40396e3aa2631e18a4dbb33.1622821729.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
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

On Fri, 4 Jun 2021 17:38:31 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> As with previous performance optimization on Treaddir handling;
> reduce the overall latency, i.e. overall time spent on processing
> a Twalk request by reducing the amount of thread hops between the
> 9p server's main thread and fs worker thread(s).
>=20
> In fact this patch even reduces the thread hops for Twalk handling
> to its theoritical minimum of exactly 2 thread hops:
>=20
> main thread -> fs worker thread -> main thread
>=20
> This is achieved by doing all the required fs driver tasks altogether
> in a single v9fs_co_run_in_worker({ ... }); code block.
>=20
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  hw/9pfs/9p.c | 89 +++++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 70 insertions(+), 19 deletions(-)
>=20
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 7be07f2d68..2815257f42 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -1705,9 +1705,9 @@ static void coroutine_fn v9fs_walk(void *opaque)
>      int name_idx;
>      V9fsQID *qids =3D NULL;
>      int i, err =3D 0;
> -    V9fsPath dpath, path;
> +    V9fsPath dpath, path, *pathes =3D NULL;
>      uint16_t nwnames;
> -    struct stat stbuf;
> +    struct stat stbuf, fidst, *stbufs =3D NULL;
>      size_t offset =3D 7;
>      int32_t fid, newfid;
>      V9fsString *wnames =3D NULL;
> @@ -1733,6 +1733,8 @@ static void coroutine_fn v9fs_walk(void *opaque)
>      if (nwnames) {
>          wnames =3D g_new0(V9fsString, nwnames);
>          qids   =3D g_new0(V9fsQID, nwnames);
> +        stbufs =3D g_new0(struct stat, nwnames);
> +        pathes =3D g_new0(V9fsPath, nwnames);
>          for (i =3D 0; i < nwnames; i++) {
>              err =3D pdu_unmarshal(pdu, offset, "s", &wnames[i]);
>              if (err < 0) {
> @@ -1753,39 +1755,85 @@ static void coroutine_fn v9fs_walk(void *opaque)
> =20
>      v9fs_path_init(&dpath);
>      v9fs_path_init(&path);
> +    /*
> +     * Both dpath and path initially point to fidp.
> +     * Needed to handle request with nwnames =3D=3D 0
> +     */
> +    v9fs_path_copy(&dpath, &fidp->path);
> +    v9fs_path_copy(&path, &fidp->path);
> =20
> -    err =3D v9fs_co_lstat(pdu, &fidp->path, &stbuf);
> +    /*
> +     * To keep latency (i.e. overall execution time for processing this
> +     * Twalk client request) as small as possible, run all the required =
fs
> +     * driver code altogether inside the following block.
> +     */
> +    v9fs_co_run_in_worker({
> +        if (v9fs_request_cancelled(pdu)) {
> +            err =3D -EINTR;
> +            break;
> +        }
> +        err =3D s->ops->lstat(&s->ctx, &dpath, &fidst);
> +        if (err < 0) {
> +            err =3D -errno;
> +            break;
> +        }
> +        stbuf =3D fidst;
> +        for (name_idx =3D 0; name_idx < nwnames; name_idx++) {
> +            if (v9fs_request_cancelled(pdu)) {
> +                err =3D -EINTR;
> +                break;
> +            }
> +            if (!same_stat_id(&pdu->s->root_st, &stbuf) ||
> +                strcmp("..", wnames[name_idx].data))
> +            {
> +                err =3D s->ops->name_to_path(&s->ctx, &dpath,
> +                                        wnames[name_idx].data, &path);

It seems you could pass &pathes[name_idx] instead of &path and...

> +                if (err < 0) {
> +                    err =3D -errno;
> +                    break;
> +                }
> +                if (v9fs_request_cancelled(pdu)) {
> +                    err =3D -EINTR;
> +                    break;
> +                }
> +                err =3D s->ops->lstat(&s->ctx, &path, &stbuf);
> +                if (err < 0) {
> +                    err =3D -errno;
> +                    break;
> +                }
> +                stbufs[name_idx] =3D stbuf;
> +                v9fs_path_copy(&dpath, &path);
> +                v9fs_path_copy(&pathes[name_idx], &path);

... avoid a copy.

Also, I believe the path -> dpath could be avoided as well in
the existing code, but this is a separate cleanup.

> +            }
> +        }
> +    });
> +    /*
> +     * Handle all the rest of this Twalk request on main thread ...
> +     */
>      if (err < 0) {
>          goto out;
>      }
> -    err =3D stat_to_qid(pdu, &stbuf, &qid);
> +
> +    err =3D stat_to_qid(pdu, &fidst, &qid);
>      if (err < 0) {
>          goto out;
>      }
> +    stbuf =3D fidst;
> =20
> -    /*
> -     * Both dpath and path initially poin to fidp.
> -     * Needed to handle request with nwnames =3D=3D 0
> -     */
> +    /* reset dpath and path */
>      v9fs_path_copy(&dpath, &fidp->path);
>      v9fs_path_copy(&path, &fidp->path);
> +
>      for (name_idx =3D 0; name_idx < nwnames; name_idx++) {
>          if (!same_stat_id(&pdu->s->root_st, &stbuf) ||
> -            strcmp("..", wnames[name_idx].data)) {
> -            err =3D v9fs_co_name_to_path(pdu, &dpath, wnames[name_idx].d=
ata,
> -                                       &path);
> -            if (err < 0) {
> -                goto out;
> -            }
> -
> -            err =3D v9fs_co_lstat(pdu, &path, &stbuf);
> -            if (err < 0) {
> -                goto out;
> -            }
> +            strcmp("..", wnames[name_idx].data))
> +        {
> +            stbuf =3D stbufs[name_idx];
>              err =3D stat_to_qid(pdu, &stbuf, &qid);
>              if (err < 0) {
>                  goto out;
>              }
> +            v9fs_path_copy(&path, &pathes[name_idx]);
>              v9fs_path_copy(&dpath, &path);
>          }
>          memcpy(&qids[name_idx], &qid, sizeof(qid));
> @@ -1821,9 +1869,12 @@ out_nofid:
>      if (nwnames && nwnames <=3D P9_MAXWELEM) {
>          for (name_idx =3D 0; name_idx < nwnames; name_idx++) {
>              v9fs_string_free(&wnames[name_idx]);
> +            v9fs_path_free(&pathes[name_idx]);
>          }
>          g_free(wnames);
>          g_free(qids);
> +        g_free(stbufs);
> +        g_free(pathes);

All of these guys should be converted to g_autofree. Separate cleanup
again.

v9fs_walk() was already a bit hairy and the diffstat definitely
doesn't improve things... this being said, the change makes sense
and I haven't spotted anything wrong, so:

Reviewed-by: Greg Kurz <groug@kaod.org>

Improvements could be to :
- track the previous path with a V9fsPath * instead of copying
- have a separate path for the nwnames =3D=3D 0 case

>      }
>  }
> =20


