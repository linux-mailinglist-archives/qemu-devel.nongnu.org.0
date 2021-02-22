Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8AA321DF7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:22:42 +0100 (CET)
Received: from localhost ([::1]:59626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEEuv-0001fT-CB
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:22:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEEpu-00069K-2p
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:17:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEEpr-0004g7-UL
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:17:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614014246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xKPOsxK8caD6mseLm1AgBoA2XrZTVXtEQuY9hjX4dwU=;
 b=Ba2lkA91r4ZO9b30Taz6eC3Q4GzhFSqdxSfaGljTcuQkItorMhr/boKaq/dROnmC2iIBTt
 UJG39HqbDCWElj+CDO+TJ9KZGppalDqo5qDLB0xRARL3z8qFg+DISwKZUWOhc5lNYi57dJ
 tavBNm3e8AcMViX2pFwFDTlNLHfpIQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-slCVfJd3MyWl0hav7InjhQ-1; Mon, 22 Feb 2021 12:17:21 -0500
X-MC-Unique: slCVfJd3MyWl0hav7InjhQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4612B8712C5;
 Mon, 22 Feb 2021 17:17:06 +0000 (UTC)
Received: from localhost (ovpn-112-255.ams2.redhat.com [10.36.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83B3A82E40;
 Mon, 22 Feb 2021 17:16:39 +0000 (UTC)
Date: Mon, 22 Feb 2021 17:16:38 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jiahui Cen <cenjiahui@huawei.com>
Subject: Re: [PATCH v5 6/9] block: Add error retry param setting
Message-ID: <YDPm9mkM8chYnPcX@stefanha-x1.localdomain>
References: <20210205101315.13042-1-cenjiahui@huawei.com>
 <20210205101315.13042-7-cenjiahui@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210205101315.13042-7-cenjiahui@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4g+7UQt+PAA1J0IT"
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
Cc: Kevin Wolf <kwolf@redhat.com>, zhang.zhanghailiang@huawei.com,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 fangying1@huawei.com, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--4g+7UQt+PAA1J0IT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 06:13:12PM +0800, Jiahui Cen wrote:
> @@ -581,6 +582,10 @@ static BlockBackend *blockdev_init(const char *file,=
 QDict *bs_opts,
>          }
>      }
> =20
> +    retry_interval =3D qemu_opt_get_number(opts, "retry_interval",
> +                                         BLOCK_BACKEND_DEFAULT_RETRY_INT=
ERVAL);
> +    retry_timeout =3D qemu_opt_get_number(opts, "retry_timeout", 0);

Please use "retry-interval" and "retry-timeout". "-" is used more often
for command-line parameters than "_".

--4g+7UQt+PAA1J0IT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAz5vYACgkQnKSrs4Gr
c8hvuAf/eDLfQrh54+Ce1b9JVLmqkjBmnpdVoJAG2krXPgLeGJB8EY5ByuSOuq12
MM9My/z2xqjAOXvLYnv7VxqoP5aXpo7o6HaBHGweKyVdGFPLkiNi1LPFM0og1Gs9
lWausxmWIGD65259sX0RcKI6bgGH4Bhx71/XUGR7vni3yBc/C05oltwYwUqJk1Tv
F3GOFwZ+kMgjTNCctYMy16HtIBMEZrcZ0l5RvQtkVin37hHMGVtUabGjoJXvQyEl
Fw3cK2DUx93iK8boKjrnHLQFotC+XK+amNNj9kNGfU0j4GQ19VgyTeSOSyejefga
fmjBUnhnbk8DYNsC4GzjK5px8Zilcg==
=BCIH
-----END PGP SIGNATURE-----

--4g+7UQt+PAA1J0IT--


