Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15488419D70
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:49:47 +0200 (CEST)
Received: from localhost ([::1]:53768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUul7-0004OM-38
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mUuSk-0004Vu-R9
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:30:46 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:52875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mUuSi-0000V8-U2
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:30:46 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-rzJYJqO-OASC1zeha0M8KQ-1; Mon, 27 Sep 2021 13:30:41 -0400
X-MC-Unique: rzJYJqO-OASC1zeha0M8KQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3033E1923763;
 Mon, 27 Sep 2021 17:30:40 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC53B652AF;
 Mon, 27 Sep 2021 17:30:24 +0000 (UTC)
Date: Mon, 27 Sep 2021 19:30:23 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 1/2] 9pfs: deduplicate iounit code
Message-ID: <20210927193023.57bc0143@bahia.huguette>
In-Reply-To: <4720290.jjg2aSD2dJ@silver>
References: <cover.1632758315.git.qemu_oss@crudebyte.com>
 <129bb71d5119e61d335f1e3107e472e4beea223a.1632758315.git.qemu_oss@crudebyte.com>
 <20210927182759.009875ef@bahia.huguette>
 <4720290.jjg2aSD2dJ@silver>
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
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 27 Sep 2021 18:50:12 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Montag, 27. September 2021 18:27:59 CEST Greg Kurz wrote:
> > On Mon, 27 Sep 2021 17:45:00 +0200
> >=20
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > Remove redundant code that translates host fileystem's block
> > > size into 9p client (guest side) block size.
> > >=20
> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---
> > >=20
> > >  hw/9pfs/9p.c | 42 ++++++++++++++++++++----------------------
> > >  1 file changed, 20 insertions(+), 22 deletions(-)
> > >=20
> > > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > > index 708b030474..c65584173a 100644
> > > --- a/hw/9pfs/9p.c
> > > +++ b/hw/9pfs/9p.c
> > > @@ -1262,18 +1262,26 @@ static int coroutine_fn stat_to_v9stat(V9fsPD=
U
> > > *pdu, V9fsPath *path,>=20
> > >  #define P9_STATS_ALL           0x00003fffULL /* Mask for All fields =
above
> > >  */>=20
> > > -static int32_t stat_to_iounit(const V9fsPDU *pdu, const struct stat
> > > *stbuf) +/**
> > > + * Convert host filesystem's block size into an appropriate block si=
ze
> > > for
> > > + * 9p client (guest OS side). The value returned suggests an "optimu=
m"
> > > block + * size for 9p I/O, i.e. to maximize performance.
> > > + *
> > > + * @pdu: 9p client request
> > > + * @blksize: host filesystem's block size
> > > + */
> > > +static int32_t blksize_to_iounit(const V9fsPDU *pdu, int32_t blksize=
)
> > >=20
> > >  {
> > > =20
> > >      int32_t iounit =3D 0;
> > >      V9fsState *s =3D pdu->s;
> > >     =20
> > >      /*
> > >=20
> > > -     * iounit should be multiples of st_blksize (host filesystem blo=
ck
> > > size) +     * iounit should be multiples of blksize (host filesystem
> > > block size)>=20
> > >       * as well as less than (client msize - P9_IOHDRSZ)
> > >       */
> > >=20
> > > -    if (stbuf->st_blksize) {
> > > -        iounit =3D stbuf->st_blksize;
> > > -        iounit *=3D (s->msize - P9_IOHDRSZ) / stbuf->st_blksize;
> > > +    if (blksize) {
> > > +        iounit =3D blksize;
> > > +        iounit *=3D (s->msize - P9_IOHDRSZ) / blksize;
> > >=20
> > >      }
> > >      if (!iounit) {
> > >     =20
> > >          iounit =3D s->msize - P9_IOHDRSZ;
> > >=20
> > > @@ -1281,6 +1289,11 @@ static int32_t stat_to_iounit(const V9fsPDU *p=
du,
> > > const struct stat *stbuf)>=20
> > >      return iounit;
> > > =20
> > >  }
> > >=20
> > > +static int32_t stat_to_iounit(const V9fsPDU *pdu, const struct stat
> > > *stbuf) +{
> > > +    return blksize_to_iounit(pdu, stbuf->st_blksize);
> > > +}
> > > +
> > >=20
> > >  static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbu=
f,
> > > =20
> > >                                  V9fsStatDotl *v9lstat)
> > > =20
> > >  {
> > >=20
> > > @@ -1899,23 +1912,8 @@ out_nofid:
> > >  static int32_t coroutine_fn get_iounit(V9fsPDU *pdu, V9fsPath *path)
> > >  {
> > > =20
> > >      struct statfs stbuf;
> > >=20
> > > -    int32_t iounit =3D 0;
> > > -    V9fsState *s =3D pdu->s;
> > > -
> > > -    /*
> > > -     * iounit should be multiples of f_bsize (host filesystem block =
size
> > > -     * and as well as less than (client msize - P9_IOHDRSZ))
> > > -     */
> > > -    if (!v9fs_co_statfs(pdu, path, &stbuf)) {
> > > -        if (stbuf.f_bsize) {
> > > -            iounit =3D stbuf.f_bsize;
> > > -            iounit *=3D (s->msize - P9_IOHDRSZ) / stbuf.f_bsize;
> > > -        }
> > > -    }
> > > -    if (!iounit) {
> > > -        iounit =3D s->msize - P9_IOHDRSZ;
> > > -    }
> > > -    return iounit;
> > > +    int err =3D v9fs_co_statfs(pdu, path, &stbuf);
> >=20
> > It is usually preferred to leave a blank line between declarations
> > and statements for easier reading. It isn't mandated in the coding
> > style but Markus consistently asks for it :-) Maybe you can fix
> > that before pushing to 9p.next ?
>=20
> In general: I adapt to whatever code style is preferred.
>=20
> I actually did run (like usual) scripts/checkpatch.pl and it did not comp=
lain.
>=20

Yes, this isn't enforced nor checked.

> So you mean it is preferred to split up declaration and definition due to=
 the=20
> function call involved? I.e. precisely:
>=20

Not splitting declaration and definitions but rather the declarations
from the actual code.

> static int32_t coroutine_fn get_iounit(V9fsPDU *pdu, V9fsPath *path)
> {
>     struct statfs stbuf;
>     int err;
>=20
>     err =3D v9fs_co_statfs(pdu, path, &stbuf);
>     return blksize_to_iounit(pdu, (err >=3D 0) ? stbuf.f_bsize : 0);
> }
>=20
> or rather :) ...
>=20
> static int32_t coroutine_fn get_iounit(V9fsPDU *pdu, V9fsPath *path)
> {
>     struct statfs stbuf;
>     int err =3D v9fs_co_statfs(pdu, path, &stbuf);
>=20
>     return blksize_to_iounit(pdu, (err >=3D 0) ? stbuf.f_bsize : 0);
> }
>=20
> We actually have mixed declaration/definition all over the place.
>=20

It is okay to have mixed declarations/definitions. Second one is fine :)

> >=20
> > Reviewed-by: Greg Kurz <groug@kaod.org>
> >=20
> > > +    return blksize_to_iounit(pdu, (err >=3D 0) ? stbuf.f_bsize : 0);
> > >=20
> > >  }
> > > =20
> > >  static void coroutine_fn v9fs_open(void *opaque)
>=20
>=20


