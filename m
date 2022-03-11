Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E9D4D65E6
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 17:18:18 +0100 (CET)
Received: from localhost ([::1]:45344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nShy5-0007bl-Ew
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 11:18:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nShwa-0005Yo-QG
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 11:16:45 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:52083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nShwY-0001UC-Ek
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 11:16:43 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-7btgcp5LOIeWyiBbHmeLew-1; Fri, 11 Mar 2022 11:16:38 -0500
X-MC-Unique: 7btgcp5LOIeWyiBbHmeLew-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED2921854E26;
 Fri, 11 Mar 2022 16:16:36 +0000 (UTC)
Received: from bahia (unknown [10.39.192.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 202F57B8E3;
 Fri, 11 Mar 2022 16:16:35 +0000 (UTC)
Date: Fri, 11 Mar 2022 17:16:34 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 4/6] 9pfs: refactor 'name_idx' -> 'nvalid' in v9fs_walk()
Message-ID: <20220311171634.2a085396@bahia>
In-Reply-To: <4831323.ZipVpMZSPQ@silver>
References: <cover.1646850707.git.qemu_oss@crudebyte.com>
 <00bee0f7a89147c90c672f07b9a1ebcd9180215b.1646850707.git.qemu_oss@crudebyte.com>
 <4831323.ZipVpMZSPQ@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On Thu, 10 Mar 2022 10:07:04 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Mittwoch, 9. M=C3=A4rz 2022 18:12:17 CET Christian Schoenebeck wrote:
> > The local variable 'name_idx' is used in two loops in function v9fs_wal=
k().
> > Let the first loop use its own variable 'nvalid' instead, which we will=
 use
> > in subsequent patches as the number of (requested) path components
> > successfully retrieved/walked by background I/O thread.

I think walked is clear enough.

> >=20
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> >  hw/9pfs/9p.c | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > index a6d6b3f835..6cdc566866 100644
> > --- a/hw/9pfs/9p.c
> > +++ b/hw/9pfs/9p.c
> > @@ -1764,7 +1764,7 @@ static bool same_stat_id(const struct stat *a, co=
nst
> > struct stat *b)
> >=20
> >  static void coroutine_fn v9fs_walk(void *opaque)
> >  {
> > -    int name_idx;
> > +    int name_idx, nvalid;
>=20
> Or rather renaming this nvalid -> nfetched?
>=20

or simply nwalked ?

Anyway,

Reviewed-by: Greg Kurz <groug@kaod.org>

> >      g_autofree V9fsQID *qids =3D NULL;
> >      int i, err =3D 0;
> >      V9fsPath dpath, path;
> > @@ -1842,17 +1842,17 @@ static void coroutine_fn v9fs_walk(void *opaque=
)
> >              break;
> >          }
> >          stbuf =3D fidst;
> > -        for (name_idx =3D 0; name_idx < nwnames; name_idx++) {
> > +        for (nvalid =3D 0; nvalid < nwnames; nvalid++) {
> >              if (v9fs_request_cancelled(pdu)) {
> >                  err =3D -EINTR;
> >                  break;
> >              }
> >              if (!same_stat_id(&pdu->s->root_st, &stbuf) ||
> > -                strcmp("..", wnames[name_idx].data))
> > +                strcmp("..", wnames[nvalid].data))
> >              {
> >                  err =3D s->ops->name_to_path(&s->ctx, &dpath,
> > -                                           wnames[name_idx].data,
> > -                                           &pathes[name_idx]);
> > +                                           wnames[nvalid].data,
> > +                                           &pathes[nvalid]);
> >                  if (err < 0) {
> >                      err =3D -errno;
> >                      break;
> > @@ -1861,13 +1861,13 @@ static void coroutine_fn v9fs_walk(void *opaque=
)
> >                      err =3D -EINTR;
> >                      break;
> >                  }
> > -                err =3D s->ops->lstat(&s->ctx, &pathes[name_idx], &stb=
uf);
> > +                err =3D s->ops->lstat(&s->ctx, &pathes[nvalid], &stbuf=
);
> >                  if (err < 0) {
> >                      err =3D -errno;
> >                      break;
> >                  }
> > -                stbufs[name_idx] =3D stbuf;
> > -                v9fs_path_copy(&dpath, &pathes[name_idx]);
> > +                stbufs[nvalid] =3D stbuf;
> > +                v9fs_path_copy(&dpath, &pathes[nvalid]);
> >              }
> >          }
> >      });
>=20
>=20


