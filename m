Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D612387366
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 09:40:31 +0200 (CEST)
Received: from localhost ([::1]:33046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liuL8-00069F-7R
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 03:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1liuJy-0005Iu-6g
 for qemu-devel@nongnu.org; Tue, 18 May 2021 03:39:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1liuJv-0008OR-Vd
 for qemu-devel@nongnu.org; Tue, 18 May 2021 03:39:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621323554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gaQdE/7D917KrtUkzkrD8ApKA5AvqZksbV37bz5bPws=;
 b=hdxI7lkz1CC/fFx1z8CNuX+MMB5PKcwGzfyl5J9ZCw2sDD7lE/kxNU+IOpjjb+uvVKps4C
 IbqmiJpIzGcRkJHMJ3CXHb/pupwFPoL6gWJ2CAqKhWsC/Er9f/p1eLAxttJ8PCCF3ybkwL
 /rMbr52DCE7ag7y2dckr0Emp2qExArI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-wDEi5huEPrWiNuvxiHsr6Q-1; Tue, 18 May 2021 03:39:10 -0400
X-MC-Unique: wDEi5huEPrWiNuvxiHsr6Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27D21102CB8C;
 Tue, 18 May 2021 07:39:09 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-192.ams2.redhat.com [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 993475D762;
 Tue, 18 May 2021 07:38:46 +0000 (UTC)
Date: Tue, 18 May 2021 09:38:45 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: Re: [RFC PATCH] block/io.c: Flush parent for quorum in generic code
Message-ID: <YKNvBWMyX/kNIPbt@merkur.fritz.box>
References: <20210512074957.763711-1-chen.zhang@intel.com>
 <20210518083337.3308b069@gecko.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20210518083337.3308b069@gecko.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FOXlRFhqeugu+OIB"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Fam Zheng <fam@euphon.net>, qemu-block <qemu-block@nongnu.org>,
 qemu-dev <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Zhang Chen <chen.zhang@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Zhang Chen <zhangckid@gmail.com>, Minghao Yuan <meeho@qq.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--FOXlRFhqeugu+OIB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 18.05.2021 um 08:33 hat Lukas Straub geschrieben:
> On Wed, 12 May 2021 15:49:57 +0800
> Zhang Chen <chen.zhang@intel.com> wrote:
>=20
> > Fix the issue from this patch:
> > [PATCH] block: Flush all children in generic code
> > From 883833e29cb800b4d92b5d4736252f4004885191
> >=20
> > Quorum driver do not have the primary child.
> > It will caused guest block flush issue when use quorum and NBD.
> > The vm guest flushes failed=EF=BC=8Cand then guest filesystem is shutdo=
wn.
>=20
> Hi,
> I think the problem is rather that the quorum driver provides
> .bdrv_co_flush_to_disk (which predates .bdrv_co_flush) instead of
> .bdrv_co_flush. Can you try with the following patch instead?
>=20
> diff --git a/block/quorum.c b/block/quorum.c
> index cfc1436abb..f2c0805000 100644
> --- a/block/quorum.c
> +++ b/block/quorum.c
> @@ -1279,7 +1279,7 @@ static BlockDriver bdrv_quorum =3D {
>      .bdrv_dirname                       =3D quorum_dirname,
>      .bdrv_co_block_status               =3D quorum_co_block_status,
> =20
> -    .bdrv_co_flush_to_disk              =3D quorum_co_flush,
> +    .bdrv_co_flush                      =3D quorum_co_flush,
> =20
>      .bdrv_getlength                     =3D quorum_getlength,

Thanks, Lukas. This is exactly what I was going to suggest after having
a look at the code now.

The problem is not related to drivers not having a primary child in
general (though quorum might be the only one in this category at the
moment), but that quorum wants to override the default error handling
semantics with its voting mechanism.

Kevin

--FOXlRFhqeugu+OIB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmCjbwUACgkQfwmycsiP
L9ZTzxAAxBKKYn6hQRSQE49oxFLP71ekougUGAq1e3dw6qXcAOu/2s1A3ToNS1ze
jDuig6KP7Q6TWYxPgvYNyROfk27YiGiRrnC9bGtnUMZ3NQrn9KiVszsfc4RjVm6y
JBy4DREFPiXHCNh+EkRvGmnv6xw5fx2yv7JYhVF9Bu5t3yiLaUhOAQyzHf3Sn9L9
8pXBBYFN7TxIMrZ/nA1wYzIINcQjGO7xGsx78l282ORZTIRSo8pzIvrNyhMj3Lxx
dnfkeDIeN7BbJ/K5yePJCc7smzx6T4W9ZPSd9azzDru/ZaLfICFI1UKlbKCwrs0g
gzg74k5H9rx12YFsh65tLWplomgRPA2RL6jVQu+a0M1QxPTgH0ykZs3HeRFgquYh
K5bPopVeD7yObRJ8VIdrj8d0OzLHOGf+SGFK+WIf3MJV5KK7MqcO3zE+PlJ2qGwo
Iyd6TP6A8/KoW4WW7w3wNV1vWMrVmgtk1sSmzbsxX4ssDuv15xcFZbKDYMtfhgW/
hPs3+qDXD5MdrqPoU5Ig4B/Wrb+NDVIDFkku4ghebqYHy8HRC3UD3WbfRGqx7rNF
ZpIgIjHGLslUMJMWUYyaKq8MPuax2ZD5wPwyog923ilFIZ6C33J/nsSYoE7qZ2eT
u2VhEjGqwaysPV/EhlDTA84a+7ddBt5X8INIfPAQ+rkiiCuge4A=
=hlMO
-----END PGP SIGNATURE-----

--FOXlRFhqeugu+OIB--


