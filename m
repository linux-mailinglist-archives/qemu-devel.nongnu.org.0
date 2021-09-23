Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C88415A31
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 10:43:14 +0200 (CEST)
Received: from localhost ([::1]:59128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTKK1-0006Ug-Ez
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 04:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mTKI8-0005ja-Gj
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 04:41:16 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:45621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mTKI6-0004sF-Bd
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 04:41:16 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-Q7uipPnWN1Gba8LL1bOiDw-1; Thu, 23 Sep 2021 04:41:02 -0400
X-MC-Unique: Q7uipPnWN1Gba8LL1bOiDw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2893584A5E4;
 Thu, 23 Sep 2021 08:41:01 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 295DA19C59;
 Thu, 23 Sep 2021 08:40:59 +0000 (UTC)
Date: Thu, 23 Sep 2021 10:40:58 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH] 9pfs: fix wrong I/O block size in Rgetattr
Message-ID: <20210923104058.0c159390@bahia.huguette>
In-Reply-To: <5479323.DnaQ8grZgu@silver>
References: <E1mT2Js-0000DW-OH@lizzy.crudebyte.com>
 <a78b8af7-a61a-c9dc-181c-cccc307482eb@redhat.com>
 <5479323.DnaQ8grZgu@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

On Wed, 22 Sep 2021 17:55:02 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Mittwoch, 22. September 2021 17:42:08 CEST Philippe Mathieu-Daud=C3=A9=
 wrote:
> > On 9/22/21 15:13, Christian Schoenebeck wrote:
> > > When client sent a 9p Tgetattr request then the wrong I/O block
> > > size value was returned by 9p server; instead of host file
> > > system's I/O block size it should rather return an I/O block
> > > size according to 9p session's 'msize' value, because the value
> > > returned to client should be an "optimum" block size for I/O
> > > (i.e. to maximize performance), it should not reflect the actual
> > > physical block size of the underlying storage media.
> > >=20
> > > The I/O block size of a host filesystem is typically 4k, so the
> > > value returned was far too low for good 9p I/O performance.
> > >=20
> > > This patch adds stat_to_iounit() with a similar approach as the
> > > existing get_iounit() function.
> > >=20
> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---
> > >=20
> > >   hw/9pfs/9p.c | 21 ++++++++++++++++++++-
> > >   1 file changed, 20 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > > index c857b31321..708b030474 100644
> > > --- a/hw/9pfs/9p.c
> > > +++ b/hw/9pfs/9p.c
> > > @@ -1262,6 +1262,25 @@ static int coroutine_fn stat_to_v9stat(V9fsPDU
> > > *pdu, V9fsPath *path,>=20
> > >   #define P9_STATS_ALL           0x00003fffULL /* Mask for All fields
> > >   above */>=20
> > > +static int32_t stat_to_iounit(const V9fsPDU *pdu, const struct stat
> > > *stbuf) +{
> > > +    int32_t iounit =3D 0;
> > > +    V9fsState *s =3D pdu->s;
> > > +
> > > +    /*
> > > +     * iounit should be multiples of st_blksize (host filesystem blo=
ck
> > > size) +     * as well as less than (client msize - P9_IOHDRSZ)
> > > +     */
> > > +    if (stbuf->st_blksize) {
> > > +        iounit =3D stbuf->st_blksize;
> > > +        iounit *=3D (s->msize - P9_IOHDRSZ) / stbuf->st_blksize;
> >=20
> > Is that:
> >=20
> >    iounit =3D QEMU_ALIGN_DOWN(s->msize - P9_IOHDRSZ, stbuf->st_blksize)=
;
> >=20
> > ?
> >=20
>=20
> Yes it is, thanks for the hint! :)
>=20
> I actually just took the equivalent, already existing code from get_iouni=
t():
> https://github.com/qemu/qemu/blob/2c3e83f92d93fbab071b8a96b8ab769b0190247=
5/hw/9pfs/9p.c#L1880
>=20
> Would it be OK to do that subsequently with cleanup patches? My plan was =
to
> first address this with one patch, and addressing the cleanup issues
> separately later on, because this patch is required for testing the follo=
wing
> kernel patches:
> https://lore.kernel.org/netdev/cover.1632156835.git.linux_oss@crudebyte.c=
om/
>=20
> And I wanted to keep things simple by only requiring one patch on QEMU si=
de
> for now.
>=20

Fair enough and you're the maintainer anyway so this is your
call. :-)

Subsequent cleanup would be to switch to QEMU_ALIGN_DOWN() like
Philippe suggested but also to consolidate the logic in a common
helper in order to avoid the code duplication.

The patch is correct and simple enough to be merged as is :

Reviewed-by: Greg Kurz <groug@kaod.org>

>=20
> > > +    }
> > > +    if (!iounit) {
> > > +        iounit =3D s->msize - P9_IOHDRSZ;
> > > +    }
> > > +    return iounit;
> > > +}
> > > +
> > >=20
> > >   static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stb=
uf,
> > >  =20
> > >                                   V9fsStatDotl *v9lstat)
> > >  =20
> > >   {
> > >=20
> > > @@ -1273,7 +1292,7 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, co=
nst
> > > struct stat *stbuf,>=20
> > >       v9lstat->st_gid =3D stbuf->st_gid;
> > >       v9lstat->st_rdev =3D stbuf->st_rdev;
> > >       v9lstat->st_size =3D stbuf->st_size;
> > >=20
> > > -    v9lstat->st_blksize =3D stbuf->st_blksize;
> > > +    v9lstat->st_blksize =3D stat_to_iounit(pdu, stbuf);
> > >=20
> > >       v9lstat->st_blocks =3D stbuf->st_blocks;
> > >       v9lstat->st_atime_sec =3D stbuf->st_atime;
> > >       v9lstat->st_atime_nsec =3D stbuf->st_atim.tv_nsec;
>=20
>=20


