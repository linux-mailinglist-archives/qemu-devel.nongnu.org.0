Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C254F37A2B5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:56:36 +0200 (CEST)
Received: from localhost ([::1]:48404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOBv-00012j-Sw
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgNhz-0000Jd-UN
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:25:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgNhy-0007kt-4n
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:25:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620721537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wue5+BJ4fAfzeGMDCXekZlOoOE/PN8k9ZZgnjldxlmo=;
 b=BndAwpJUeqWx5pHX51M3KkWY4V5HUR2DJaaOhTqNRrqspY8MRw6sQ5kuhW/3q10e3i+8w9
 ZjI1MH3JVVKnWYFiTjkUxWuo+A2FPs4LFlvuYhGreJLjSioHYor76nfJDmFbrIAcu0pw+H
 OJ1JI0fGWEpfViUb8sJV2K8j7xFy7qw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-OyRPVfLxNlyFGvUNHKUUiA-1; Tue, 11 May 2021 04:25:35 -0400
X-MC-Unique: OyRPVfLxNlyFGvUNHKUUiA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1C298014D8;
 Tue, 11 May 2021 08:25:33 +0000 (UTC)
Received: from localhost (ovpn-112-6.ams2.redhat.com [10.36.112.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 987726727F;
 Tue, 11 May 2021 08:25:33 +0000 (UTC)
Date: Tue, 11 May 2021 09:25:32 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] block/export: improve vu_blk_sect_range_ok()
Message-ID: <YJo/fGeyttorPzWQ@stefanha-x1.localdomain>
References: <20210331142727.391465-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210331142727.391465-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Zx+bFqE09OG4b6Ru"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Zx+bFqE09OG4b6Ru
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 03:27:27PM +0100, Stefan Hajnoczi wrote:
> The checks in vu_blk_sect_range_ok() assume VIRTIO_BLK_SECTOR_SIZE is
> equal to BDRV_SECTOR_SIZE. This is true, but let's add a
> QEMU_BUILD_BUG_ON() to make it explicit.
>=20
> We might as well check that the request buffer size is a multiple of
> VIRTIO_BLK_SECTOR_SIZE while we're at it.
>=20
> Suggested-by: Max Reitz <mreitz@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block/export/vhost-user-blk-server.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Ping for QEMU 6.1.

Stefan

>=20
> diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-us=
er-blk-server.c
> index fa06996d37..1862563336 100644
> --- a/block/export/vhost-user-blk-server.c
> +++ b/block/export/vhost-user-blk-server.c
> @@ -70,9 +70,16 @@ static void vu_blk_req_complete(VuBlkReq *req)
>  static bool vu_blk_sect_range_ok(VuBlkExport *vexp, uint64_t sector,
>                                   size_t size)
>  {
> -    uint64_t nb_sectors =3D size >> BDRV_SECTOR_BITS;
> +    uint64_t nb_sectors;
>      uint64_t total_sectors;
> =20
> +    if (size % VIRTIO_BLK_SECTOR_SIZE) {
> +        return false;
> +    }
> +
> +    nb_sectors =3D size >> VIRTIO_BLK_SECTOR_BITS;
> +
> +    QEMU_BUILD_BUG_ON(BDRV_SECTOR_SIZE !=3D VIRTIO_BLK_SECTOR_SIZE);
>      if (nb_sectors > BDRV_REQUEST_MAX_SECTORS) {
>          return false;
>      }
> --=20
> 2.30.2
>=20

--Zx+bFqE09OG4b6Ru
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCaP3wACgkQnKSrs4Gr
c8jZmwf/Wi1tB0+E35WVvE7tX9qLf/I7clWL3CoiqrsDUNe6yuG2F8QIOfr0pS9z
nQY4ej1rdCgmcCGchFIKwHzGpJ4tRnTl2PZRzZwaP7UJWGVaQU26OoBhF3H1GKaB
Ya97rUhtuIEF043nT70zVRXe3ZK/uZX++/abrXQ4/LA+invf9Rbt6Pwajxa2RZx4
f/vggYgUiHkYe95Wr76qnijc3Xe82g5ZTzlNkTch9U8O9/aacI+qOFB104kYOibd
nJBD79hbKUirVHhkG3ehvH/hJYPPsB7De+8B1sc9Y6EZDbohaxbajX+si1Y1GzRx
2woAd8bmqa67O9ceoT4Wo1b9qJl1/Q==
=Ilax
-----END PGP SIGNATURE-----

--Zx+bFqE09OG4b6Ru--


