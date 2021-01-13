Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C562F4E82
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:27:44 +0100 (CET)
Received: from localhost ([::1]:45290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzi3j-00018R-27
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:27:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kzhrJ-0006Hs-ET
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:14:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kzhrH-0000LX-QF
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:14:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610550891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MpKH85yKQNUkh0PVzXsiBIMTmJvB0RgOq16jHp0zTlE=;
 b=eykkpsdafMlsLprhHY/eaUnQU+WbuUQ/hqlGaAPKuD3ZKKi/J3gTu25eBK329mxIOBOKyH
 cYs3U3NoY5eWuDMbqGTG/utmcMxvgQyeNDDlbGM+oGeSc7/NlDHXBFZgOLkXsvWMqE3R5H
 UmC/gjmy2ZBweKkCHpKA73ENTOCkWlw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73--KjzCIPFMaKeTtRK5z2MzQ-1; Wed, 13 Jan 2021 10:14:48 -0500
X-MC-Unique: -KjzCIPFMaKeTtRK5z2MzQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45CAF1005D6C
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 15:14:47 +0000 (UTC)
Received: from localhost (ovpn-115-141.ams2.redhat.com [10.36.115.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D825E5D9EF;
 Wed, 13 Jan 2021 15:14:43 +0000 (UTC)
Date: Wed, 13 Jan 2021 15:14:42 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 2/2] tracetool: fix "PRI" macro decoding
Message-ID: <20210113151442.GG255928@stefanha-x1.localdomain>
References: <20210105191721.120463-1-lvivier@redhat.com>
 <20210105191721.120463-3-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210105191721.120463-3-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="L+ofChggJdETEG3Y"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--L+ofChggJdETEG3Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 05, 2021 at 08:17:21PM +0100, Laurent Vivier wrote:
> macro is not reset after use, so the format decoded is always the
> one of the first "PRI" in the format string.
>=20
> For instance:
>=20
>   vhost_vdpa_set_config(void *dev, uint32_t offset, uint32_t size, \
>                         uint32_t flags) "dev: %p offset: %"PRIu32" \
>                         size: %"PRIu32" flags: 0x%"PRIx32
>=20
> generates:
>=20
>   printf("%d@%d vhost_vdpa_set_config dev: %p offset: %u size: %u \
>           flags: 0x%u\n", pid(), gettimeofday_ns(), dev, offset, \
>           size, flags)
>=20
> for the "flags" parameter, we can see a "0x%u" rather than a "0x%x"
> because the first macro was "PRIu32" (for offset).
>=20
> In the loop, macro becomes "PRIu32PRIu32PRIx32", and c_macro_to_format()
> returns always macro[3] ('u' in this case). This patch resets macro after
> the format has been decoded.
>=20
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  scripts/tracetool/format/log_stap.py | 1 +
>  1 file changed, 1 insertion(+)

Thanks, applied to my tracing tree:
https://gitlab.com/stefanha/qemu/commits/tracing

Stefan

--L+ofChggJdETEG3Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl//DmIACgkQnKSrs4Gr
c8ihIAgArjnvhU78o0Wii87f5jv7HadRRtHp5CGNVckAkl/BVvmCtFfBb4LrCe0Q
hwACilX4+lnwNcnlYdaV+1BSkSP2DPPf4BM5+307Cw7X02Y8EUP7mfi3PD9av3Z0
Q2g3St+kwA1I3IM27f0XTNzpCZVu8AM8QajJ4rYFtWrSTShMJDGkVfTnDv8j/MHt
hfjbCrFQ8VWefKe2Ap+LV3zwqoDwsgXlU3X6HFmR2H50utac/Y/1+Ed+zZbb7hHW
pRTCJva3tRstk/7yg7u7qXu1O5JNPkz59dP9IVmnW8iVMCBvaUzinDp1YpJ/NFCe
t4yt3SIpq6nRa7ltv0qZ0PKPKcyYsg==
=joCg
-----END PGP SIGNATURE-----

--L+ofChggJdETEG3Y--


