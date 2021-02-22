Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31498321E19
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:30:03 +0100 (CET)
Received: from localhost ([::1]:46724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEF22-0000tV-53
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:30:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEEwa-00058K-5I
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:24:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEEwY-0006i9-Ip
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:24:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614014661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+D7cwbw4sGmsrJnIfNH4GS1AEEO5Q50bJiiUXcwPP9k=;
 b=DdZDdO7Wj0YcIuv79etSAXEqjJVNeaPSL1Iz+6WlXnS7ygou3aJOOTRt60fmolq+66mpAm
 Ojyc2TkxOLmyIWMniYfYZQ5QaCGZgMDgfEWQf+Tg/QT4cn365hdd4OtUdFivytg0/LA2Wq
 WpcqjBmrLOeGSRj0l73tnQAhxsUoOtw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-bALqOdTgP92Ai32IjxLDkg-1; Mon, 22 Feb 2021 12:24:17 -0500
X-MC-Unique: bALqOdTgP92Ai32IjxLDkg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49E89803F49;
 Mon, 22 Feb 2021 17:24:16 +0000 (UTC)
Received: from localhost (ovpn-112-255.ams2.redhat.com [10.36.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D037610013DB;
 Mon, 22 Feb 2021 17:24:12 +0000 (UTC)
Date: Mon, 22 Feb 2021 17:24:11 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jiahui Cen <cenjiahui@huawei.com>
Subject: Re: [PATCH v5 3/9] block-backend: Add device specific retry callback
Message-ID: <YDPoux9RqamFhVc1@stefanha-x1.localdomain>
References: <20210205101315.13042-1-cenjiahui@huawei.com>
 <20210205101315.13042-4-cenjiahui@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210205101315.13042-4-cenjiahui@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yUnGD42yxigjApPt"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

--yUnGD42yxigjApPt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 06:13:09PM +0800, Jiahui Cen wrote:
> Add retry_request_cb in BlockDevOps to do device specific retry action.
> Backend's timer would be registered only when the backend is set 'retry'
> on errors and the device supports retry action.
>=20
> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> ---
>  block/block-backend.c          | 8 ++++++++
>  include/sysemu/block-backend.h | 4 ++++
>  2 files changed, 12 insertions(+)
>=20
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 3a9d55cbe3..a8bfaf6e4a 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -995,6 +995,14 @@ void blk_set_dev_ops(BlockBackend *blk, const BlockD=
evOps *ops,
>      blk->dev_ops =3D ops;
>      blk->dev_opaque =3D opaque;
> =20
> +    if ((blk->on_read_error =3D=3D BLOCKDEV_ON_ERROR_RETRY ||
> +         blk->on_write_error =3D=3D BLOCKDEV_ON_ERROR_RETRY) &&
> +        ops->retry_request_cb) {
> +        blk->retry_timer =3D aio_timer_new(blk->ctx, QEMU_CLOCK_REALTIME=
,
> +                                         SCALE_MS, ops->retry_request_cb=
,
> +                                         opaque);
> +    }

I didn't see anything that handles AioContext changes. If the
BlockBackend is detached from the current AioContext and attached to a
different one, then it is necessary to delete the old timer and create
a new one.

Stefan

--yUnGD42yxigjApPt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAz6LsACgkQnKSrs4Gr
c8gdTgf/du858Qjil3nXk4hEDG0/2kb0SxWr1CSLe4HfGHNHLnMXn15PDAHX93t+
o6ffOz8PkUWqazd1F0VAAYF7BEU70eBwIq8Q/T4S7uss9BqeFTiBw3g9SRPr/bHI
9nRgTnyDnJ7PKW//H0QY/aWf4sZ6vjM2BPvlIA5LVcXNeBs2aiqPNoj2JFEyVATj
VAygHTq4WxtxVUMaE1SCxsrT2ZETMEDcUt1LwYMz7Isw7/qszC/GZ2FRjoVJGTvj
YCeBwjsiHmHdo+meoEpBSwF28var0aeQkDpTlicHllyyeumyFm7u6m3Jxmt76eUr
kFb2HxHZ4lTEgGMElRoxK/6d9FiyEA==
=8rfI
-----END PGP SIGNATURE-----

--yUnGD42yxigjApPt--


