Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DB3415EA0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 14:42:46 +0200 (CEST)
Received: from localhost ([::1]:54026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTO3p-0003WF-8k
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 08:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mTNzS-0001i4-O7
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 08:38:15 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:39119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mTNzK-0003Yc-BV
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 08:38:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=TH4iQRR0u8Oa6z7DwnnKpz/2YJ6JevzBianeSDfHqPo=; b=AFO+xCgSlqSIlv9+lvznT1gBAQ
 WfGPm427K881OU4vVIj6yPIxPhfFgW+G78X6x7+eF7bU/gQqn8THE5WCn/vovrPUUEAa8MlNWe28S
 KpUO0OGIUONRoDStxh2vM0mVkjmyFGR0mhidkOovPhJG8dRGW7Pg0XS7S3YilwnodqbO63EdXT3ky
 SzYVyY7FQZ7IhVBgohf90YaFDmEhV+mo9yiaXuZpUW2Vx4hdKtAgaBeOgOZ3dkJ+y+HreQ9Aw71eu
 72VKMNAvXUiIdKfW4BOKqRK1g1dTE4yfhVj31BBPl2WcBcfHczk73axHNKzoHuT45tgh9TEDprJ40
 HynMrko35q18Md2hyTIVJLTMMhpC2wBgKfW914SwBkrXmGuY5Ee5ikj0c4aow4bcXMoKkVkZNeq8B
 csQX8+S2KAMTjHCA5XsMiyfgiXlHG0YK7UQj28uwpNso/bMuNCn981ooYGTMLzoYAC7Itt1xO+x6f
 pMHOOV2htnc+EFW7b+ucdSLNQ8l+CgIezr8ABX3cWqDun1pczhRIOTLVQJ7penlN1P9Jg/bFgpSmo
 0dFoMy3SQ76eljxP7shjq9vB6pF9GZbTqtr4lptI/8lEe0x2rum9RPQkFO2t6bdkIGOCeo0UVqHov
 fjozPdhn0E3mCVyjmFuV7ktsmV75pEO8vim/vKee8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] 9pfs: fix wrong I/O block size in Rgetattr
Date: Thu, 23 Sep 2021 14:38:02 +0200
Message-ID: <3381432.ND75bl0XlW@silver>
In-Reply-To: <20210923104058.0c159390@bahia.huguette>
References: <E1mT2Js-0000DW-OH@lizzy.crudebyte.com>
 <5479323.DnaQ8grZgu@silver> <20210923104058.0c159390@bahia.huguette>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On Donnerstag, 23. September 2021 10:40:58 CEST Greg Kurz wrote:
> On Wed, 22 Sep 2021 17:55:02 +0200
>=20
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Mittwoch, 22. September 2021 17:42:08 CEST Philippe Mathieu-Daud=E9=
=20
wrote:
> > > On 9/22/21 15:13, Christian Schoenebeck wrote:
> > > > When client sent a 9p Tgetattr request then the wrong I/O block
> > > > size value was returned by 9p server; instead of host file
> > > > system's I/O block size it should rather return an I/O block
> > > > size according to 9p session's 'msize' value, because the value
> > > > returned to client should be an "optimum" block size for I/O
> > > > (i.e. to maximize performance), it should not reflect the actual
> > > > physical block size of the underlying storage media.
> > > >=20
> > > > The I/O block size of a host filesystem is typically 4k, so the
> > > > value returned was far too low for good 9p I/O performance.
> > > >=20
> > > > This patch adds stat_to_iounit() with a similar approach as the
> > > > existing get_iounit() function.
> > > >=20
> > > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > > ---
> > > >=20
> > > >   hw/9pfs/9p.c | 21 ++++++++++++++++++++-
> > > >   1 file changed, 20 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > > > index c857b31321..708b030474 100644
> > > > --- a/hw/9pfs/9p.c
> > > > +++ b/hw/9pfs/9p.c
> > > > @@ -1262,6 +1262,25 @@ static int coroutine_fn stat_to_v9stat(V9fsP=
DU
> > > > *pdu, V9fsPath *path,>
> > > >=20
> > > >   #define P9_STATS_ALL           0x00003fffULL /* Mask for All fiel=
ds
> > > >   above */>
> > > >=20
> > > > +static int32_t stat_to_iounit(const V9fsPDU *pdu, const struct stat
> > > > *stbuf) +{
> > > > +    int32_t iounit =3D 0;
> > > > +    V9fsState *s =3D pdu->s;
> > > > +
> > > > +    /*
> > > > +     * iounit should be multiples of st_blksize (host filesystem
> > > > block
> > > > size) +     * as well as less than (client msize - P9_IOHDRSZ)
> > > > +     */
> > > > +    if (stbuf->st_blksize) {
> > > > +        iounit =3D stbuf->st_blksize;
> > > > +        iounit *=3D (s->msize - P9_IOHDRSZ) / stbuf->st_blksize;
> > >=20
> > > Is that:
> > >    iounit =3D QEMU_ALIGN_DOWN(s->msize - P9_IOHDRSZ, stbuf->st_blksiz=
e);
> > >=20
> > > ?
> >=20
> > Yes it is, thanks for the hint! :)
> >=20
> > I actually just took the equivalent, already existing code from
> > get_iounit():
> > https://github.com/qemu/qemu/blob/2c3e83f92d93fbab071b8a96b8ab769b01902=
47
> > 5/hw/9pfs/9p.c#L1880
> >=20
> > Would it be OK to do that subsequently with cleanup patches? My plan was
> > to
> > first address this with one patch, and addressing the cleanup issues
> > separately later on, because this patch is required for testing the
> > following kernel patches:
> > https://lore.kernel.org/netdev/cover.1632156835.git.linux_oss@crudebyte=
=2Eco
> > m/
> >=20
> > And I wanted to keep things simple by only requiring one patch on QEMU
> > side
> > for now.
>=20
> Fair enough and you're the maintainer anyway so this is your
> call. :-)
>=20
> Subsequent cleanup would be to switch to QEMU_ALIGN_DOWN() like
> Philippe suggested but also to consolidate the logic in a common
> helper in order to avoid the code duplication.

It will include code deduplication as well, yes.

> The patch is correct and simple enough to be merged as is :
>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

> > > > +    }
> > > > +    if (!iounit) {
> > > > +        iounit =3D s->msize - P9_IOHDRSZ;
> > > > +    }
> > > > +    return iounit;
> > > > +}
> > > > +
> > > >=20
> > > >   static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat
> > > >   *stbuf,
> > > >  =20
> > > >                                   V9fsStatDotl *v9lstat)
> > > >  =20
> > > >   {
> > > >=20
> > > > @@ -1273,7 +1292,7 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu,
> > > > const
> > > > struct stat *stbuf,>
> > > >=20
> > > >       v9lstat->st_gid =3D stbuf->st_gid;
> > > >       v9lstat->st_rdev =3D stbuf->st_rdev;
> > > >       v9lstat->st_size =3D stbuf->st_size;
> > > >=20
> > > > -    v9lstat->st_blksize =3D stbuf->st_blksize;
> > > > +    v9lstat->st_blksize =3D stat_to_iounit(pdu, stbuf);
> > > >=20
> > > >       v9lstat->st_blocks =3D stbuf->st_blocks;
> > > >       v9lstat->st_atime_sec =3D stbuf->st_atime;
> > > >       v9lstat->st_atime_nsec =3D stbuf->st_atim.tv_nsec;



