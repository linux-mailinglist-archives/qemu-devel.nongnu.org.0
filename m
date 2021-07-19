Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E26143CCF73
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 10:51:53 +0200 (CEST)
Received: from localhost ([::1]:33348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5P09-0000O0-Vr
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 04:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m5Oyv-0007nt-5q
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 04:50:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m5Oys-0000VM-E4
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 04:50:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626684629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=olrENZkSMs06GLzL5MAfOgqQI+SwWRzoQwQtiWBhtck=;
 b=fIDC1XrR12r/QrQoS6GlJUvqKGK7z7prBAWsM8BcWnjBjJ5kps0bNT3bmLo3LmiWhl9elo
 ZwKloXJeSPNInMrRN+mHEmJGJLut93iEMUXqTkJ5qBOaje8En6SvkDTqYTj4o3l1571zBg
 IFgqTw61wHITOlSw5I8WswX8MoUKvyg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-rcnlMdCEP--Y4Z-Ir4NQAA-1; Mon, 19 Jul 2021 04:50:27 -0400
X-MC-Unique: rcnlMdCEP--Y4Z-Ir4NQAA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35A9F9127C;
 Mon, 19 Jul 2021 08:50:26 +0000 (UTC)
Received: from localhost (ovpn-114-60.ams2.redhat.com [10.36.114.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DBF75C1C5;
 Mon, 19 Jul 2021 08:50:24 +0000 (UTC)
Date: Mon, 19 Jul 2021 09:50:24 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v3 3/5] hw/nvme: fix out-of-bounds reads
Message-ID: <YPU80NCmYX4FHZ9Y@stefanha-x1.localdomain>
References: <20210714060125.994882-1-its@irrelevant.dk>
 <20210714060125.994882-4-its@irrelevant.dk>
MIME-Version: 1.0
In-Reply-To: <20210714060125.994882-4-its@irrelevant.dk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="S/ZuIQukCpEU2c2d"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.466, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--S/ZuIQukCpEU2c2d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 14, 2021 at 08:01:23AM +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> Peter noticed that mmio access may read into the NvmeParams member in
> the NvmeCtrl struct.
>=20
> Fix the bounds check.
>=20
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/nvme/ctrl.c | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--S/ZuIQukCpEU2c2d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmD1PM8ACgkQnKSrs4Gr
c8gt5AgAn4qaUHGZTvO2im7waD9sfsaXw98WcVpi8Swcsddqyhdi5W+7qvvgC8xT
O388o1T19li20/v/VNZ1tm/+BY2eo8BOxlb8ctgxGaMKKQCg8iU4ieGYOG+ROmFy
jbItDAKOiYUI7rnc+a9l0SCXwZ1kFDtOhkoVdvVnr1PIM40Qa7zXa21mcz9b0v4M
N1OGXJBUy4tc15iRXpe57Xk5LB2XPfOOf+PQP70b9tBP6YtdE/3o7bM/cs9Hibf6
fW4oFdP2HE9GK+o1oWnvYpc/RKUIqQA31QyqYeUTKeSp3l+XE2HC5bSkfyxHJDnT
AhVigvQeygbYzsmAPclSokYNeIz50w==
=yVH0
-----END PGP SIGNATURE-----

--S/ZuIQukCpEU2c2d--


