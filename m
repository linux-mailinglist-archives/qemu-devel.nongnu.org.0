Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AA732420D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 17:29:08 +0100 (CET)
Received: from localhost ([::1]:50432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEx2B-0003A3-Ql
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 11:29:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEx10-0002aF-Rk
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:27:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEx0z-0005qy-3f
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:27:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614184072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RCfoAa2YP1HhpmJWFy1X1J20goCTC0Dn/wyQbTypM+E=;
 b=PQAbU0NDOEbKZaEXQbcJcJgCANxDbzoW/OOZ/F2RwOSXsi8sq/e0nDXTQ6JyCE4ZMqLqMl
 SRmWM2UgFqpbOU7R+bp8lUG92c1jNGQftb/viZ9QBTVGoQtXeJmZ67VlWcYoa4LGMuKmQF
 UV4q/+17z7UYEOCEa0ZrKmC+Gv/oz3g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-CwvmxUK5Ngyakcc41JI3dQ-1; Wed, 24 Feb 2021 11:27:48 -0500
X-MC-Unique: CwvmxUK5Ngyakcc41JI3dQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7B9779EC2;
 Wed, 24 Feb 2021 16:27:46 +0000 (UTC)
Received: from localhost (ovpn-115-137.ams2.redhat.com [10.36.115.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5652F5D9D7;
 Wed, 24 Feb 2021 16:27:46 +0000 (UTC)
Date: Wed, 24 Feb 2021 16:27:45 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] block/file-posix: Optimize for macOS
Message-ID: <YDZ+gVgfvNejLfFQ@stefanha-x1.localdomain>
References: <20210219085148.90545-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210219085148.90545-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HjbZtUsiP4P6Dh5L"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--HjbZtUsiP4P6Dh5L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2021 at 05:51:48PM +0900, Akihiko Odaki wrote:
> This commit introduces "punch hole" operation and optimizes transfer
> block size for macOS.
>=20
> This commit introduces two additional members,
> discard_granularity and opt_io to BlockSizes type in
> include/block/block.h. Also, the members of the type are now
> optional. Set -1 to discard_granularity and 0 to other members
> for the default values.

I remember BlockSizes was added specifically for s390 DASD devices.
Normally QEMU does not automatically expose details of the underlying
hardware to the guest because it breaks live migration compatibility.

If a VM is running on host A where the value happens to be 512 bytes and
is migrated to host B where the value happens to be 4KB then:

1. The value reported to the guest by the storage device will change
   unexpectedly and the guest software is probably not prepared for this
   to happen.

2. I/O requests that violate the constraint imposed by host B's value
   will suddenly start failing and the VM may no longer be operational.

I think there was an argument that DASDs are passthrough devices and the
user always knows what they are doing, so we can ignore this problem for
DASDs.

This reasoning does not apply to POSIX files on macOS hosts, so I think
we need to figure out what to do here. The easiest option is not to
merge this patch series, but if this feature is important to you then we
need to think about how to extend the block size probing to be live
migration friendly or to change the QEMU command-line to support this
use case without unexpected live migration breakage.

CCing Kevin Wolf and Markus Armbruster.

> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  block/file-posix.c    | 40 ++++++++++++++++++++++++++++++++++++++--
>  block/nvme.c          |  2 ++
>  hw/block/block.c      | 12 ++++++++++--
>  include/block/block.h |  2 ++
>  4 files changed, 52 insertions(+), 4 deletions(-)
>=20
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 00cdaaa2d41..defbc04c8e7 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -44,6 +44,7 @@
>  #if defined(__APPLE__) && (__MACH__)
>  #include <paths.h>
>  #include <sys/param.h>
> +#include <sys/mount.h>
>  #include <IOKit/IOKitLib.h>
>  #include <IOKit/IOBSD.h>
>  #include <IOKit/storage/IOMediaBSDClient.h>
> @@ -1274,6 +1275,8 @@ static int hdev_probe_blocksizes(BlockDriverState *=
bs, BlockSizes *bsz)
>      if (check_for_dasd(s->fd) < 0) {
>          return -ENOTSUP;
>      }
> +    bsz->opt_io =3D 0;
> +    bsz->discard_granularity =3D -1;
>      ret =3D probe_logical_blocksize(s->fd, &bsz->log);
>      if (ret < 0) {
>          return ret;
> @@ -1568,6 +1571,7 @@ out:
>      }
>  }
> =20
> +G_GNUC_UNUSED
>  static int translate_err(int err)
>  {
>      if (err =3D=3D -ENODEV || err =3D=3D -ENOSYS || err =3D=3D -EOPNOTSU=
PP ||
> @@ -1777,16 +1781,27 @@ static int handle_aiocb_discard(void *opaque)
>              }
>          } while (errno =3D=3D EINTR);
> =20
> -        ret =3D -errno;
> +        ret =3D translate_err(-errno);
>  #endif
>      } else {
>  #ifdef CONFIG_FALLOCATE_PUNCH_HOLE
>          ret =3D do_fallocate(s->fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEE=
P_SIZE,
>                             aiocb->aio_offset, aiocb->aio_nbytes);
> +        ret =3D translate_err(-errno);
> +#elif defined(__APPLE__) && (__MACH__)
> +        fpunchhole_t fpunchhole;
> +        fpunchhole.fp_flags =3D 0;
> +        fpunchhole.reserved =3D 0;
> +        fpunchhole.fp_offset =3D aiocb->aio_offset;
> +        fpunchhole.fp_length =3D aiocb->aio_nbytes;
> +        if (fcntl(s->fd, F_PUNCHHOLE, &fpunchhole) =3D=3D -1) {
> +            ret =3D errno =3D=3D ENODEV ? -ENOTSUP : -errno;
> +        } else {
> +            ret =3D 0;
> +        }
>  #endif
>      }
> =20
> -    ret =3D translate_err(ret);
>      if (ret =3D=3D -ENOTSUP) {
>          s->has_discard =3D false;
>      }
> @@ -2095,6 +2110,26 @@ static int raw_co_flush_to_disk(BlockDriverState *=
bs)
>      return raw_thread_pool_submit(bs, handle_aiocb_flush, &acb);
>  }
> =20
> +static int raw_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz)
> +{
> +#if defined(__APPLE__) && (__MACH__)
> +    BDRVRawState *s =3D bs->opaque;
> +    struct statfs buf;
> +
> +    if (!fstatfs(s->fd, &buf)) {
> +        bsz->phys =3D 0;
> +        bsz->log =3D 0;
> +        bsz->opt_io =3D buf.f_iosize;
> +        bsz->discard_granularity =3D buf.f_bsize;
> +        return 0;
> +    }
> +
> +    return -errno;
> +#else
> +    return -ENOTSUP;
> +#endif
> +}
> +
>  static void raw_aio_attach_aio_context(BlockDriverState *bs,
>                                         AioContext *new_context)
>  {
> @@ -3229,6 +3264,7 @@ BlockDriver bdrv_file =3D {
>      .bdrv_refresh_limits =3D raw_refresh_limits,
>      .bdrv_io_plug =3D raw_aio_plug,
>      .bdrv_io_unplug =3D raw_aio_unplug,
> +    .bdrv_probe_blocksizes =3D raw_probe_blocksizes,
>      .bdrv_attach_aio_context =3D raw_aio_attach_aio_context,
> =20
>      .bdrv_co_truncate =3D raw_co_truncate,
> diff --git a/block/nvme.c b/block/nvme.c
> index 5a6fbacf4a5..6d84bbdb632 100644
> --- a/block/nvme.c
> +++ b/block/nvme.c
> @@ -983,6 +983,8 @@ static int nvme_probe_blocksizes(BlockDriverState *bs=
, BlockSizes *bsz)
>      uint32_t blocksize =3D nvme_get_blocksize(bs);
>      bsz->phys =3D blocksize;
>      bsz->log =3D blocksize;
> +    bsz->opt_io =3D 0;
> +    bsz->discard_granularity =3D -1;
>      return 0;
>  }
> =20
> diff --git a/hw/block/block.c b/hw/block/block.c
> index 1e34573da71..c907e5a7722 100644
> --- a/hw/block/block.c
> +++ b/hw/block/block.c
> @@ -70,19 +70,27 @@ bool blkconf_blocksizes(BlockConf *conf, Error **errp=
)
>      backend_ret =3D blk_probe_blocksizes(blk, &blocksizes);
>      /* fill in detected values if they are not defined via qemu command =
line */
>      if (!conf->physical_block_size) {
> -        if (!backend_ret) {
> +        if (!backend_ret && blocksizes.phys) {
>             conf->physical_block_size =3D blocksizes.phys;
>          } else {
>              conf->physical_block_size =3D BDRV_SECTOR_SIZE;
>          }
>      }
>      if (!conf->logical_block_size) {
> -        if (!backend_ret) {
> +        if (!backend_ret && blocksizes.log) {
>              conf->logical_block_size =3D blocksizes.log;
>          } else {
>              conf->logical_block_size =3D BDRV_SECTOR_SIZE;
>          }
>      }
> +    if (!backend_ret) {
> +        if (!conf->opt_io_size) {
> +            conf->opt_io_size =3D blocksizes.opt_io;
> +        }
> +        if (conf->discard_granularity =3D=3D -1) {
> +            conf->discard_granularity =3D blocksizes.discard_granularity=
;
> +        }
> +    }
> =20
>      if (conf->logical_block_size > conf->physical_block_size) {
>          error_setg(errp,
> diff --git a/include/block/block.h b/include/block/block.h
> index a193545b6ab..31bf3acacad 100644
> --- a/include/block/block.h
> +++ b/include/block/block.h
> @@ -91,6 +91,8 @@ typedef enum {
>  typedef struct BlockSizes {
>      uint32_t phys;
>      uint32_t log;
> +    uint32_t discard_granularity;
> +    uint32_t opt_io;
>  } BlockSizes;
> =20
>  typedef struct HDGeometry {
> --=20
> 2.24.3 (Apple Git-128)
>=20

--HjbZtUsiP4P6Dh5L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA2foEACgkQnKSrs4Gr
c8jPaQf6AySEDA/BLNzKkNgAZvb/ndACE8aNken6iI7lcSiQfk2tp0Njia1yE2QE
7Js1xzjmIlOAXtEqJUQq6HnOyv2G2SqZ66RcsE9uukzZwBIRi9yXGtQgUk/BoWz6
0xociJZVNbNihv5XEgWTLeXrfzbCrNYXyH67GhuiDiXEwPVAd7s9LApKnvI4SkbA
oJus40T1Y9NIFmcxim1U5Iu9esLuEa85JAhSczT/6seYPoAQ55Q/oyaakWMStGXE
lsO+OPgdr0Rn5f4tNGTiDLc7jC1HmzJF4HN7PDZ3jdFQ14OXm9qFdzKTcUKzZwLi
8k1KKX2uCEYfyLX3hb+ideLQHDZiww==
=HBnh
-----END PGP SIGNATURE-----

--HjbZtUsiP4P6Dh5L--


