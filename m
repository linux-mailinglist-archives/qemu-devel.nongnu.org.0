Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5F134D5FF
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 19:26:59 +0200 (CEST)
Received: from localhost ([::1]:57270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQvfG-0003FR-92
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 13:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lQvdv-00029V-9c
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 13:25:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lQvds-00034n-Lb
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 13:25:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617038731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lHzTjEm/hdZpj/i5rpW99+yMc6Ou9hQXKNJFNFyo6mA=;
 b=e0Y+FNmTFYKQq54z/bk3wDUAdi1FaDTbnt9RxoHaJJSOPdTiiZLsmpAjCkR569aMXzfvVr
 w97AYADeRIQiNKOKTeN9wNFBkztg2QQzQCnfSCUcbLCjuPKVA3lYqQcD+4pkt4oi5g3ApB
 U+lYba3qBVatDAW45qk5NbqZtgSdoZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-962vfUymPUSwWVVr77BVKQ-1; Mon, 29 Mar 2021 13:25:18 -0400
X-MC-Unique: 962vfUymPUSwWVVr77BVKQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D297A1019639;
 Mon, 29 Mar 2021 17:25:15 +0000 (UTC)
Received: from localhost (ovpn-114-227.ams2.redhat.com [10.36.114.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACC835044F;
 Mon, 29 Mar 2021 17:25:10 +0000 (UTC)
Date: Mon, 29 Mar 2021 18:25:09 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [RFC 5/8] virtio-blk: Fix rollback path in
 virtio_blk_data_plane_start()
Message-ID: <YGINdeUQag8Z1ryw@stefanha-x1.localdomain>
References: <20210325150735.1098387-1-groug@kaod.org>
 <20210325150735.1098387-6-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210325150735.1098387-6-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Mcr6X0A+FfxzLeCE"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Mcr6X0A+FfxzLeCE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 04:07:32PM +0100, Greg Kurz wrote:
> When dataplane multiqueue support was added in QEMU 2.7, the path
> that would rollback guest notifiers assignment in case of error
> simply got dropped.
>=20
> Later on, when Error was added to blk_set_aio_context() in QEMU 4.1,
> another error path was introduced, but it ommits to rollback both
> host and guest notifiers.
>=20
> It seems cleaner to fix the rollback path in one go. The patch is
> simple enough that it can be adjusted if backported to a pre-4.1
> QEMU.
>=20
> Fixes: 51b04ac5c6a6 ("virtio-blk: dataplane multiqueue support")
> Cc: stefanha@redhat.com
> Fixes: 97896a4887a0 ("block: Add Error to blk_set_aio_context()")
> Cc: kwolf@redhat.com
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  hw/block/dataplane/virtio-blk.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--Mcr6X0A+FfxzLeCE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBiDXUACgkQnKSrs4Gr
c8gmywgAlCNl2HVIAS3ziPfwQzngivGn6i/UA70iNPLTPJ4iK/H0b+VWNedAsrOl
JjeIOPLXIq73ctnOQFeTXYFdvwFUR9ekUkxbLOOV1iD9nFmaGi3OxPCI3zqHYeZt
UNuMVGVRX0mJSUXQz/goifb8qkmW8mkNKpmhWRjfpg85VOQnYvVD9G3GcKJaONXM
kOhPIY0g7Ha7da16M1eD61Q5BSZrNdWP2vYWWkmEL9nhAUpqAAzFHyKGP/HumEc+
TiflsDZrnkVXCwt5Ubif6JiS0QOZJNLtUPcpwx1Ht6ieBaFlq8w9UD9HiyYq5NWr
g2VgDYePEON2HLsPW2yyw2/hBDJWmw==
=C2/w
-----END PGP SIGNATURE-----

--Mcr6X0A+FfxzLeCE--


