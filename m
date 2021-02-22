Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89498321DEC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:17:54 +0100 (CET)
Received: from localhost ([::1]:49820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEEqH-0005U8-4A
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:17:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEElP-0007zj-Fo
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:12:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEElN-0003sF-Bg
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:12:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614013968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KhPAzn0NANGA1bhVWEGcQMT5jQFxoG1/vO/m/DXYYvY=;
 b=Mg2hbe6B/eIVDwIIm7j7e2/xZO0sBinmAVsnlZOq6MdMkWvRx5WydX6R5FKcFG9OSIJPOa
 XGINPE3dU1vTSNb3AWr/trDs2vgxSzVCfo2gwkq2hh4x7/0H3u3mGTLfx6tNMtCKOLkHiq
 5KPdxr3YVip6nNV3ElRN5+bwYLn0Bj4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-ih-WXyEjMsCzKnpoYHhBzA-1; Mon, 22 Feb 2021 12:12:45 -0500
X-MC-Unique: ih-WXyEjMsCzKnpoYHhBzA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F324380403A;
 Mon, 22 Feb 2021 17:12:43 +0000 (UTC)
Received: from localhost (ovpn-112-255.ams2.redhat.com [10.36.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97D1C5C1BD;
 Mon, 22 Feb 2021 17:12:43 +0000 (UTC)
Date: Mon, 22 Feb 2021 17:12:42 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jiahui Cen <cenjiahui@huawei.com>
Subject: Re: [PATCH v5 4/9] block-backend: Enable retry action on errors
Message-ID: <YDPmCtR8ZiKGeCz0@stefanha-x1.localdomain>
References: <20210205101315.13042-1-cenjiahui@huawei.com>
 <20210205101315.13042-5-cenjiahui@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210205101315.13042-5-cenjiahui@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kkkQer2FDE1gMbkO"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, zhang.zhanghailiang@huawei.com,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 fangying1@huawei.com, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--kkkQer2FDE1gMbkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 06:13:10PM +0800, Jiahui Cen wrote:
> Enable retry action when backend's retry timer is available. It would
> trigger the timer to do device specific retry action.
>=20
> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> ---
>  block/block-backend.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/block/block-backend.c b/block/block-backend.c
> index a8bfaf6e4a..ab75cb1971 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1803,6 +1803,9 @@ BlockErrorAction blk_get_error_action(BlockBackend =
*blk, bool is_read,
>          return BLOCK_ERROR_ACTION_REPORT;
>      case BLOCKDEV_ON_ERROR_IGNORE:
>          return BLOCK_ERROR_ACTION_IGNORE;
> +    case BLOCKDEV_ON_ERROR_RETRY:
> +        return (blk->retry_timer) ?
> +               BLOCK_ERROR_ACTION_RETRY : BLOCK_ERROR_ACTION_REPORT;
>      case BLOCKDEV_ON_ERROR_AUTO:
>      default:
>          abort();
> @@ -1850,6 +1853,12 @@ void blk_error_action(BlockBackend *blk, BlockErro=
rAction action,
>          qemu_system_vmstop_request_prepare();
>          send_qmp_error_event(blk, action, is_read, error);
>          qemu_system_vmstop_request(RUN_STATE_IO_ERROR);
> +    } else if (action =3D=3D BLOCK_ERROR_ACTION_RETRY) {
> +        if (!blk->quiesce_counter) {
> +            timer_mod(blk->retry_timer, qemu_clock_get_ms(QEMU_CLOCK_REA=
LTIME) +
> +                                        blk->retry_interval);

QEMU should not make any guest-visible changes while the guest is
stopped (vm_stop()). Please use QEMU_CLOCK_VIRTUAL so the timer does not
fire while the guest is stopped.

Stefan

--kkkQer2FDE1gMbkO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAz5goACgkQnKSrs4Gr
c8jEXgf+KUczBNEmTPYs11fQnhljJ0yAiHqifrq82swMgYh8q9K+jtKHqeIAgQzH
jO9A+ill7L6GlGMIWFYKuhTLYcLOuN+p3kg+Xwk36AMUEDk5hVC/jyfmn6UlIJUK
yTvoLtj0XJHFz2tPbvfK4gisxWrjTWLkZwgMqJjPmYwI90aJay9QTMHI3/MOjioN
uN4Jo0IBkvdkcxdutM6fzcfmPP5nBo9W/CaSzqILWBch8LK6I2/PvB8PEJ/DUoJa
jGkPv67/PPYDbAPpIzPhsTQp5HlMY4erLH+/R4B+AxoJ/qTQzJeR0eZvoHLIxPox
EbfSKxBtP8DVWTgynyW54NLgCIMvaw==
=4gGR
-----END PGP SIGNATURE-----

--kkkQer2FDE1gMbkO--


