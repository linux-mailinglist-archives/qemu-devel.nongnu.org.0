Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4844629D0D6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 16:49:59 +0100 (CET)
Received: from localhost ([::1]:57444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXni2-0001mZ-Ae
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 11:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kXnfN-0000Md-Oo
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 11:47:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kXnfL-000247-CF
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 11:47:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603900030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rz8j8C6W2bzUOXQgKe2ekdNR9YO2IP/ynZbns6b/Ta4=;
 b=bDptbOFDV8c0G6ZmQC/SmKHM9AavzY9wCEuJqLnykSzCnivA84W2RENcRWdVjLFTn5dmqI
 jPLcXCU4Vk9j66bii0EcM2vCPztc9uFJgmp8nmaK5TilYRMteAJWx+owK7Gm2PywsRUHUq
 2rpS3x4B0PQjp6U5iBbZ6qJmehNfQaA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-hBUjHnplMlqYOiEbofGvMg-1; Wed, 28 Oct 2020 11:47:07 -0400
X-MC-Unique: hBUjHnplMlqYOiEbofGvMg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA6EC1009E34;
 Wed, 28 Oct 2020 15:47:05 +0000 (UTC)
Received: from localhost (ovpn-114-6.ams2.redhat.com [10.36.114.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F37CF55785;
 Wed, 28 Oct 2020 15:47:01 +0000 (UTC)
Date: Wed, 28 Oct 2020 15:47:00 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 25/25] block/nvme: Fix use of write-only doorbells
 page on Aarch64 arch
Message-ID: <20201028154700.GR231368@stefanha-x1.localdomain>
References: <20201027135547.374946-1-philmd@redhat.com>
 <20201027135547.374946-26-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201027135547.374946-26-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qOEfHYdX8LquYLAx"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:50:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 qemu-block@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--qOEfHYdX8LquYLAx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2020 at 02:55:47PM +0100, Philippe Mathieu-Daud=E9 wrote:
> qemu_vfio_pci_map_bar() calls mmap(), and mmap(2) states:
>=20
>   'offset' must be a multiple of the page size as returned
>    by sysconf(_SC_PAGE_SIZE).
>=20
> In commit f68453237b9 we started to use an offset of 4K which
> broke this contract on Aarch64 arch.
>=20
> Fix by mapping at offset 0, and and accessing doorbells at offset=3D4K.
>=20
> Fixes: f68453237b9 ("block/nvme: Map doorbells pages write-only")
> Reported-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  block/nvme.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--qOEfHYdX8LquYLAx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+ZknQACgkQnKSrs4Gr
c8h2DwgAjNjz0K2OgrcklNmJdzhV4iGOeXuHA1531gHQq7o2LZ/jJpgbXdLL8FfS
+QgD57UcGpbqoik1md2ZwXY3r96DJGFiSUrmOd+ceAg9Z2IHeXJkqPfAv2W+mE7g
Pk6iKL9AAwhNeHErKYn4h/VamyWTK1bqPqOA/lY9/5AoS1g/aFLwXwKfHo3fRwIf
qxk0iOzUVncyiMKX2fz+OkoCRBHH0jchHWqEONkhuAQE59Hx1xEaVQEIBIZjCj6e
e644MUCQB3i/1pLNyxwKa+AbSdreOnpTLUlTvfNeN3JqTSwgGur3TOk/7DSjH9Dr
NZM+AWSXVe2BG7816OIGhBYL3qcieQ==
=hNtp
-----END PGP SIGNATURE-----

--qOEfHYdX8LquYLAx--


