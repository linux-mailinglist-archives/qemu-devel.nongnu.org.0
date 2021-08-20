Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319B73F2C35
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 14:36:46 +0200 (CEST)
Received: from localhost ([::1]:48236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH3lM-0001jV-O8
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 08:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mH3j4-0000QW-0B
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 08:34:22 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:45826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mH3j2-0004QS-Gh
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 08:34:21 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170--3gadreXNrmajReCQOt8_A-1; Fri, 20 Aug 2021 08:34:15 -0400
X-MC-Unique: -3gadreXNrmajReCQOt8_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40B221008060;
 Fri, 20 Aug 2021 12:34:14 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.192.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77EED5278E;
 Fri, 20 Aug 2021 12:34:13 +0000 (UTC)
Date: Fri, 20 Aug 2021 14:34:11 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 2/2] hw/9pfs: use g_autofree in v9fs_walk() where possible
Message-ID: <20210820143411.0553aee5@bahia.lan>
In-Reply-To: <12832142.34yICVTDIk@silver>
References: <cover.1629208359.git.qemu_oss@crudebyte.com>
 <b51670d2a39399535a035f6bc77c3cbeed85edae.1629208359.git.qemu_oss@crudebyte.com>
 <20210820124031.6ea5e042@bahia.lan> <12832142.34yICVTDIk@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
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

On Fri, 20 Aug 2021 14:23:26 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Freitag, 20. August 2021 12:40:31 CEST Greg Kurz wrote:
> > On Tue, 17 Aug 2021 15:46:50 +0200
> >=20
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > Suggested-by: Greg Kurz <groug@kaod.org>
> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---
> > >=20
> > >  hw/9pfs/9p.c | 7 +++----
> > >  1 file changed, 3 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > > index 4d642ab12a..c857b31321 100644
> > > --- a/hw/9pfs/9p.c
> > > +++ b/hw/9pfs/9p.c
> > > @@ -1703,11 +1703,12 @@ static bool same_stat_id(const struct stat *a=
,
> > > const struct stat *b)>=20
> > >  static void coroutine_fn v9fs_walk(void *opaque)
> > >  {
> > > =20
> > >      int name_idx;
> > >=20
> > > -    V9fsQID *qids =3D NULL;
> > > +    g_autofree V9fsQID *qids =3D NULL;
> > >=20
> > >      int i, err =3D 0;
> > >      V9fsPath dpath, path, *pathes =3D NULL;
> > >      uint16_t nwnames;
> > >=20
> > > -    struct stat stbuf, fidst, *stbufs =3D NULL;
> > > +    struct stat stbuf, fidst;
> > > +    g_autofree struct stat *stbufs =3D NULL;
> > >=20
> > >      size_t offset =3D 7;
> > >      int32_t fid, newfid;
> > >      V9fsString *wnames =3D NULL;
> > >=20
> > > @@ -1872,8 +1873,6 @@ out_nofid:
> > >              v9fs_path_free(&pathes[name_idx]);
> > >         =20
> > >          }
> > >          g_free(wnames);
> > >=20
> > > -        g_free(qids);
> > > -        g_free(stbufs);
> > >=20
> > >          g_free(pathes);
> >=20
> > It seems that wnames and pathes could be converted to
> > g_autofree as well or I'm missing something ?
>=20
> Yeah, I mentioned that in the cover letter. Those two are omitted in this=
=20
> patch because they contain dynamically allocated memory per array element=
=20
> which need to be freed individually before freeing the array.
>=20
> So those two would probably require custom cleanup handlers.
>=20

The freeing of the individual elements is already handled in the loop above
the g_free() calls. The wnames and pathes pointers can thus be treated like
the other ones.

> >=20
> > Feel free to add my R-b with or without that extra change.
> >=20
> > Reviewed-by: Greg Kurz <groug@kaod.org>
>=20
> Thanks!
>=20
> >=20
> > >      }
> > > =20
> > >  }
>=20
> Best regards,
> Christian Schoenebeck
>=20
>=20


