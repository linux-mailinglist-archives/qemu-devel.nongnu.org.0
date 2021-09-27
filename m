Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213254198DE
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 18:29:48 +0200 (CEST)
Received: from localhost ([::1]:40888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUtVi-0007lZ-Oy
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 12:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mUtU7-0006nY-Dd
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:28:07 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:47354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mUtU5-00087Y-QL
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:28:07 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-cnWo98KqO_mjIURxtNYYrA-1; Mon, 27 Sep 2021 12:28:02 -0400
X-MC-Unique: cnWo98KqO_mjIURxtNYYrA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4ABD619200C8;
 Mon, 27 Sep 2021 16:28:01 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EE8A5D9D3;
 Mon, 27 Sep 2021 16:28:00 +0000 (UTC)
Date: Mon, 27 Sep 2021 18:27:59 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 1/2] 9pfs: deduplicate iounit code
Message-ID: <20210927182759.009875ef@bahia.huguette>
In-Reply-To: <129bb71d5119e61d335f1e3107e472e4beea223a.1632758315.git.qemu_oss@crudebyte.com>
References: <cover.1632758315.git.qemu_oss@crudebyte.com>
 <129bb71d5119e61d335f1e3107e472e4beea223a.1632758315.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

On Mon, 27 Sep 2021 17:45:00 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> Remove redundant code that translates host fileystem's block
> size into 9p client (guest side) block size.
>=20
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  hw/9pfs/9p.c | 42 ++++++++++++++++++++----------------------
>  1 file changed, 20 insertions(+), 22 deletions(-)
>=20
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 708b030474..c65584173a 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -1262,18 +1262,26 @@ static int coroutine_fn stat_to_v9stat(V9fsPDU *p=
du, V9fsPath *path,
>  #define P9_STATS_ALL           0x00003fffULL /* Mask for All fields abov=
e */
> =20
> =20
> -static int32_t stat_to_iounit(const V9fsPDU *pdu, const struct stat *stb=
uf)
> +/**
> + * Convert host filesystem's block size into an appropriate block size f=
or
> + * 9p client (guest OS side). The value returned suggests an "optimum" b=
lock
> + * size for 9p I/O, i.e. to maximize performance.
> + *
> + * @pdu: 9p client request
> + * @blksize: host filesystem's block size
> + */
> +static int32_t blksize_to_iounit(const V9fsPDU *pdu, int32_t blksize)
>  {
>      int32_t iounit =3D 0;
>      V9fsState *s =3D pdu->s;
> =20
>      /*
> -     * iounit should be multiples of st_blksize (host filesystem block s=
ize)
> +     * iounit should be multiples of blksize (host filesystem block size=
)
>       * as well as less than (client msize - P9_IOHDRSZ)
>       */
> -    if (stbuf->st_blksize) {
> -        iounit =3D stbuf->st_blksize;
> -        iounit *=3D (s->msize - P9_IOHDRSZ) / stbuf->st_blksize;
> +    if (blksize) {
> +        iounit =3D blksize;
> +        iounit *=3D (s->msize - P9_IOHDRSZ) / blksize;
>      }
>      if (!iounit) {
>          iounit =3D s->msize - P9_IOHDRSZ;
> @@ -1281,6 +1289,11 @@ static int32_t stat_to_iounit(const V9fsPDU *pdu, =
const struct stat *stbuf)
>      return iounit;
>  }
> =20
> +static int32_t stat_to_iounit(const V9fsPDU *pdu, const struct stat *stb=
uf)
> +{
> +    return blksize_to_iounit(pdu, stbuf->st_blksize);
> +}
> +
>  static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
>                                  V9fsStatDotl *v9lstat)
>  {
> @@ -1899,23 +1912,8 @@ out_nofid:
>  static int32_t coroutine_fn get_iounit(V9fsPDU *pdu, V9fsPath *path)
>  {
>      struct statfs stbuf;
> -    int32_t iounit =3D 0;
> -    V9fsState *s =3D pdu->s;
> -
> -    /*
> -     * iounit should be multiples of f_bsize (host filesystem block size
> -     * and as well as less than (client msize - P9_IOHDRSZ))
> -     */
> -    if (!v9fs_co_statfs(pdu, path, &stbuf)) {
> -        if (stbuf.f_bsize) {
> -            iounit =3D stbuf.f_bsize;
> -            iounit *=3D (s->msize - P9_IOHDRSZ) / stbuf.f_bsize;
> -        }
> -    }
> -    if (!iounit) {
> -        iounit =3D s->msize - P9_IOHDRSZ;
> -    }
> -    return iounit;
> +    int err =3D v9fs_co_statfs(pdu, path, &stbuf);

It is usually preferred to leave a blank line between declarations
and statements for easier reading. It isn't mandated in the coding
style but Markus consistently asks for it :-) Maybe you can fix
that before pushing to 9p.next ?

Reviewed-by: Greg Kurz <groug@kaod.org>

> +    return blksize_to_iounit(pdu, (err >=3D 0) ? stbuf.f_bsize : 0);
>  }
> =20
>  static void coroutine_fn v9fs_open(void *opaque)


