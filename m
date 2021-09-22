Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E58414D8C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 17:56:39 +0200 (CEST)
Received: from localhost ([::1]:37516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT4bu-0002uu-N7
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 11:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mT4aS-0002BR-Pr
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 11:55:08 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:35529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mT4aQ-00057u-Oq
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 11:55:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Ulz2kA9pCISpkmcW9TwXErbR0EytoDwo3IkNaYx8woI=; b=osP1yvdkUt2IBjcytIkv+3JPK/
 9/OW3aAUfefnJUnCt7W8hkQVaVVeLXsomltxzW1WafaRpuLvNGzVyGUb6qTgJJ6ybVHklbtCir4st
 h4B4eCltIgVFyYS4kOUSISGOhZIRo4NkgMPMB9yjW0KOBpMjqmYb6WO1GcLH6+Ef8YJyJAu7/n04b
 Agh+pZwVD8JFnxXVeVVc0olAPthGqOdmMy2yO4aB28fuJcwUhDAOfNb9uvJXT+ry2tBEmziFNrXFr
 /dlrWrwmqR7clTCUP7TUbZkiZkrkKqEW8CoTee8h2Em8BTuTMiKNMAswQ+6UmOYTUVL2NxLFncpfM
 Gev5SXiijQubz+Fz0alARLVQ3Qn468xnh6Si0k44GdBpKyDcouDxvlTYvGpg+0Qx8F4SI0zBE0Nqg
 GeAp1URGg55QA5mKMOLy0sS+2bvelJmFYZiGg9NJhDv2TZF9NE2IV1caM3Dw1n7wnp7qTUFzCcRZo
 YLwPbyOp1QJtef0EjdYXIW5dUBsLzwSZdel2A8FSFgVtHvL9QnivJmceQwqIL7thmO2y86u57qqQ/
 BnvquAEaf/F7ekXNrqwembg1iE+Bgprrb3T2X0KUEJZhEHMB9m+y2OnMlKlbCzvr+pe2JlxO7DpoY
 fqyc55rXPZWICq3tjsj7Hu3Wb8dYwm+XgW9soksxM=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] 9pfs: fix wrong I/O block size in Rgetattr
Date: Wed, 22 Sep 2021 17:55:02 +0200
Message-ID: <5479323.DnaQ8grZgu@silver>
In-Reply-To: <a78b8af7-a61a-c9dc-181c-cccc307482eb@redhat.com>
References: <E1mT2Js-0000DW-OH@lizzy.crudebyte.com>
 <a78b8af7-a61a-c9dc-181c-cccc307482eb@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 22. September 2021 17:42:08 CEST Philippe Mathieu-Daud=E9 wrot=
e:
> On 9/22/21 15:13, Christian Schoenebeck wrote:
> > When client sent a 9p Tgetattr request then the wrong I/O block
> > size value was returned by 9p server; instead of host file
> > system's I/O block size it should rather return an I/O block
> > size according to 9p session's 'msize' value, because the value
> > returned to client should be an "optimum" block size for I/O
> > (i.e. to maximize performance), it should not reflect the actual
> > physical block size of the underlying storage media.
> >=20
> > The I/O block size of a host filesystem is typically 4k, so the
> > value returned was far too low for good 9p I/O performance.
> >=20
> > This patch adds stat_to_iounit() with a similar approach as the
> > existing get_iounit() function.
> >=20
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> >=20
> >   hw/9pfs/9p.c | 21 ++++++++++++++++++++-
> >   1 file changed, 20 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > index c857b31321..708b030474 100644
> > --- a/hw/9pfs/9p.c
> > +++ b/hw/9pfs/9p.c
> > @@ -1262,6 +1262,25 @@ static int coroutine_fn stat_to_v9stat(V9fsPDU
> > *pdu, V9fsPath *path,>=20
> >   #define P9_STATS_ALL           0x00003fffULL /* Mask for All fields
> >   above */>=20
> > +static int32_t stat_to_iounit(const V9fsPDU *pdu, const struct stat
> > *stbuf) +{
> > +    int32_t iounit =3D 0;
> > +    V9fsState *s =3D pdu->s;
> > +
> > +    /*
> > +     * iounit should be multiples of st_blksize (host filesystem block
> > size) +     * as well as less than (client msize - P9_IOHDRSZ)
> > +     */
> > +    if (stbuf->st_blksize) {
> > +        iounit =3D stbuf->st_blksize;
> > +        iounit *=3D (s->msize - P9_IOHDRSZ) / stbuf->st_blksize;
>=20
> Is that:
>=20
>    iounit =3D QEMU_ALIGN_DOWN(s->msize - P9_IOHDRSZ, stbuf->st_blksize);
>=20
> ?
>=20

Yes it is, thanks for the hint! :)

I actually just took the equivalent, already existing code from get_iounit(=
):
https://github.com/qemu/qemu/blob/2c3e83f92d93fbab071b8a96b8ab769b01902475/=
hw/9pfs/9p.c#L1880

Would it be OK to do that subsequently with cleanup patches? My plan was to
first address this with one patch, and addressing the cleanup issues
separately later on, because this patch is required for testing the followi=
ng
kernel patches:
https://lore.kernel.org/netdev/cover.1632156835.git.linux_oss@crudebyte.com/

And I wanted to keep things simple by only requiring one patch on QEMU side
for now.


> > +    }
> > +    if (!iounit) {
> > +        iounit =3D s->msize - P9_IOHDRSZ;
> > +    }
> > +    return iounit;
> > +}
> > +
> >=20
> >   static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
> >  =20
> >                                   V9fsStatDotl *v9lstat)
> >  =20
> >   {
> >=20
> > @@ -1273,7 +1292,7 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const
> > struct stat *stbuf,>=20
> >       v9lstat->st_gid =3D stbuf->st_gid;
> >       v9lstat->st_rdev =3D stbuf->st_rdev;
> >       v9lstat->st_size =3D stbuf->st_size;
> >=20
> > -    v9lstat->st_blksize =3D stbuf->st_blksize;
> > +    v9lstat->st_blksize =3D stat_to_iounit(pdu, stbuf);
> >=20
> >       v9lstat->st_blocks =3D stbuf->st_blocks;
> >       v9lstat->st_atime_sec =3D stbuf->st_atime;
> >       v9lstat->st_atime_nsec =3D stbuf->st_atim.tv_nsec;



