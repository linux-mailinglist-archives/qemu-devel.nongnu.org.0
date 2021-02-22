Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8225321D68
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 17:50:38 +0100 (CET)
Received: from localhost ([::1]:34192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEEPt-0007lD-3b
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 11:50:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEEOV-0007DI-QI
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:49:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEEOQ-0008En-Su
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:49:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614012545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V3Xf8Ump7kwgi78xHLVqnyeorXuxcY33bex3l8nhihk=;
 b=SpFvQn16vPnutPsCWdjajuTX1AK5L9QAhMkcAGpHGa+BmhMsZSKMenEh8W24lHqiCggOA+
 q82k8R/XLJuBH0CnrQ1TcMMYnMNxJvaHmXrOphP52CDLAWl4Q/SdGK8stNgTBw/cHzAHYJ
 0hzWouumAYlVP5x+ga2w/1V+jpGuLsQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-e9z6vuRaPkOff77PgwOtAA-1; Mon, 22 Feb 2021 11:49:03 -0500
X-MC-Unique: e9z6vuRaPkOff77PgwOtAA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 034E4107ACE4;
 Mon, 22 Feb 2021 16:49:02 +0000 (UTC)
Received: from localhost (ovpn-112-255.ams2.redhat.com [10.36.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8882B5C255;
 Mon, 22 Feb 2021 16:49:01 +0000 (UTC)
Date: Mon, 22 Feb 2021 16:49:00 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] virtio-blk: Respect discard granularity
Message-ID: <YDPgfPiXQ9fNmGlq@stefanha-x1.localdomain>
References: <20210219101919.91069-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210219101919.91069-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GhlpzjCy1XSnRxbk"
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
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--GhlpzjCy1XSnRxbk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2021 at 07:19:19PM +0900, Akihiko Odaki wrote:
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  hw/block/virtio-blk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index bac2d6fa2b2..692fd17b0e0 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -965,7 +965,7 @@ static void virtio_blk_update_config(VirtIODevice *vd=
ev, uint8_t *config)
>          virtio_stl_p(vdev, &blkcfg.max_discard_sectors,
>                       s->conf.max_discard_sectors);
>          virtio_stl_p(vdev, &blkcfg.discard_sector_alignment,
> -                     blk_size >> BDRV_SECTOR_BITS);
> +                     conf->discard_granularity >> BDRV_SECTOR_BITS);

Please handle the -1 default value like this:

  uint32_t discard_granularity =3D conf->discard_granularity;
  if (conf->discard_granularity =3D=3D -1) {
      discard_granularity =3D BDRV_SECTOR_SIZE;
  }

I noticed this when comparing the blk_size and discard_granularity
values when I run QEMU:

  $ qemu-system-x86_64 -M accel=3Dkvm -m 1G -cpu host -drive if=3Dvirtio,fi=
le=3Dtest.img,format=3Draw
  blk_size 512
  discard_granularity 4294967295

Also, please add a compat prop in hw/core/machine.c to ensure that
existing machine types are unaffected by this change. This can be done
by adding DEFINE_PROP_BOOL("report-discard-granularity", ...) in
hw/block/virtio-blk.c and then setting it to false for existing machine
types in hw/core/machine.c. Then new machine types benefit from the new
feature but existing machine types will be unchanged (eliminating the
risk of live migration/snapshot incompatibilities when the device
unexpectedly changes behavior while the guest is running).

Stefan

--GhlpzjCy1XSnRxbk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAz4HwACgkQnKSrs4Gr
c8igwAf/XRx0ijYZnQ1JkTx9g/vlUAL8UtHiEIbs9zT0CsqwPjrde5fITDB/BNiY
mBukPEU51rKsgZ9oMA9iIOz9Ys1EX4bTu/2D4JF3onEBmsSBk9WZmby/kk1huHsv
CB5HY4q+BsAj9Enuoc3vntyiqB5kuD/k7nkQO7MPO0ls06pr5wCLAH+p4iLwDFiP
ypIJjuEABxkSs2qbQ9W6VZ+pnYK1fkoj7si+w9foohlPleP5ITGEGc+xA85ZL/mX
WGnfwN7cB/GeGFzJR75/OobJ5s5f9e13btMgep7+qV4MTEdyiTZrIzvgtklziJI4
fdVTFdfArIniL3YPhINjxWAZF2K3Kw==
=3t8x
-----END PGP SIGNATURE-----

--GhlpzjCy1XSnRxbk--


