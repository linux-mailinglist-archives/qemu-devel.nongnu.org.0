Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AB63BD79E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 15:19:45 +0200 (CEST)
Received: from localhost ([::1]:43434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0kzI-0003rS-L9
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 09:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m0kxP-0001x3-2T
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:17:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m0kxM-0007i0-LT
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625577462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e97GQ+IHODc9x35zVDACZpSYPSrt8xL1gpa9wmUDCpM=;
 b=KQYjpu5Pjf1JKAig40UVkOFgCKhEpHqVINXkzHLQz6GD++mSTWRDHWF8DyrweCBtSCre4k
 y5aKDgxwzmHMGQlLj2V3eNx5qjunRPRNMT60j4o1reSQ4qhDrfNv4jQ+SJu1lzX4VbvWHf
 j8NOIG2+IoaR+kq5BkLYMWz1STY6MjQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-FXygoYwuNouRd-cyK5cJxQ-1; Tue, 06 Jul 2021 09:17:38 -0400
X-MC-Unique: FXygoYwuNouRd-cyK5cJxQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 778361023F41;
 Tue,  6 Jul 2021 13:17:37 +0000 (UTC)
Received: from localhost (ovpn-115-23.ams2.redhat.com [10.36.115.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBEBA5D6A1;
 Tue,  6 Jul 2021 13:17:36 +0000 (UTC)
Date: Tue, 6 Jul 2021 14:17:35 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v5 1/3] block/file-posix: Optimize for macOS
Message-ID: <YORX7+meEPuaHi5o@stefanha-x1.localdomain>
References: <20210705130458.97642-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210705130458.97642-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aY+l2FPpLhLY9yyI"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 pkrempa@redhat.com, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Konstantin Nazarov <mail@knazarov.com>,
 shajnocz <shajnocz@redhat.com>, John Snow <jsnow@redhat.com>,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--aY+l2FPpLhLY9yyI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 05, 2021 at 10:04:56PM +0900, Akihiko Odaki wrote:
> This commit introduces "punch hole" operation and optimizes transfer
> block size for macOS.
>=20
> Thanks to Konstantin Nazarov for detailed analysis of a flaw in an
> old version of this change:
> https://gist.github.com/akihikodaki/87df4149e7ca87f18dc56807ec5a1bc5#gist=
comment-3654667
>=20
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  block/file-posix.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--aY+l2FPpLhLY9yyI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDkV+8ACgkQnKSrs4Gr
c8hUMgf+KaE3Wpa+A3Py3i72pgmo8WlhhlAskEK/01zspnBSj1/NiAlD2yhZTpPt
Ly75sFLLpqyHblSj8WYmvNvHdOKhOQaKOiky2TX8EvvylM+Wc2cBo41h+or+sTG3
efvuyTa8Z2FDAzjQD9FWsNc7KfEkGvP4uDLDdgsaY+EH7hA2q6d4vvsSsOkHz4v4
GEhzVN38iT/0OcBIZ8qha3S+6MEJXkmX3Xr461SVAmAwER6+4NDehGwE6TgcP9Xe
kJsPjY9fv8wz6C6pJXRh9hsDDxtoraq+SGR6zMPclvAVX3wARtyEOqA7vxV6wio3
2h8drAuuLeDcTbHBhRSDGvU9BD3c8Q==
=jkeB
-----END PGP SIGNATURE-----

--aY+l2FPpLhLY9yyI--


