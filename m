Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A2952B41A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 09:53:15 +0200 (CEST)
Received: from localhost ([::1]:46074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrEUc-0006JM-Cw
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 03:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cheptsov@ispras.ru>)
 id 1nrESr-0005F4-Oi
 for qemu-devel@nongnu.org; Wed, 18 May 2022 03:51:25 -0400
Received: from mail.ispras.ru ([83.149.199.84]:59458)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cheptsov@ispras.ru>)
 id 1nrESp-0001xr-LV
 for qemu-devel@nongnu.org; Wed, 18 May 2022 03:51:25 -0400
Received: from smtpclient.apple (unknown [77.37.166.174])
 by mail.ispras.ru (Postfix) with ESMTPSA id 83DDA407624C;
 Wed, 18 May 2022 07:51:14 +0000 (UTC)
Content-Type: multipart/signed;
 boundary="Apple-Mail=_3A63FEE9-65D6-4BC3-9E4D-1AD9749DC04B";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: [PATCH v2] net: fix multicast support with BSD (macOS) socket
 implementations
From: Vitaly Cheptsov <cheptsov@ispras.ru>
In-Reply-To: <20220518073945.24787-1-cheptsov@ispras.ru>
Date: Wed, 18 May 2022 10:51:14 +0300
Cc: Jason Wang <jasowang@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Message-Id: <FE7C1054-9CB6-43E6-86F9-4E6D73E6BD12@ispras.ru>
References: <20220518073945.24787-1-cheptsov@ispras.ru>
To: QEMU Developers <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3696.100.31)
Received-SPF: pass client-ip=83.149.199.84; envelope-from=cheptsov@ispras.ru;
 helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_3A63FEE9-65D6-4BC3-9E4D-1AD9749DC04B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

V2 version of the previous patch ensures to keep compatibility with =
non-Apple platforms to avoid any potential compatibility issues with =
e.g. Windows mentioned in the review.

> On 18 May 2022, at 10:39, Vitaly Cheptsov <cheptsov@ispras.ru> wrote:
>=20
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Daniel P. Berrange <berrange@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Vitaly Cheptsov <cheptsov@ispras.ru>
> ---
> net/socket.c | 18 ++++++++++++++++++
> 1 file changed, 18 insertions(+)
>=20
> diff --git a/net/socket.c b/net/socket.c
> index bfd8596250..583f788a22 100644
> --- a/net/socket.c
> +++ b/net/socket.c
> @@ -239,6 +239,22 @@ static int net_socket_mcast_create(struct =
sockaddr_in *mcastaddr,
>         return -1;
>     }
>=20
> +#ifdef __APPLE__
> +    val =3D 1;
> +    ret =3D qemu_setsockopt(fd, SOL_SOCKET, SO_REUSEPORT, &val, =
sizeof(val));
> +    if (ret < 0) {
> +        error_setg_errno(errp, errno,
> +                         "can't set socket option SO_REUSEPORT");
> +        goto fail;
> +    }
> +
> +    struct sockaddr_in bindaddr;
> +    memset(&bindaddr, 0, sizeof(bindaddr));
> +    bindaddr.sin_family =3D AF_INET;
> +    bindaddr.sin_addr.s_addr =3D htonl(INADDR_ANY);
> +    bindaddr.sin_port =3D mcastaddr->sin_port;
> +    ret =3D bind(fd, (struct sockaddr *)&bindaddr, sizeof(bindaddr));
> +#else
>     /* Allow multiple sockets to bind the same multicast ip and port =
by setting
>      * SO_REUSEADDR. This is the only situation where SO_REUSEADDR =
should be set
>      * on windows. Use socket_set_fast_reuse otherwise as it sets =
SO_REUSEADDR
> @@ -253,6 +269,8 @@ static int net_socket_mcast_create(struct =
sockaddr_in *mcastaddr,
>     }
>=20
>     ret =3D bind(fd, (struct sockaddr *)mcastaddr, =
sizeof(*mcastaddr));
> +#endif
> +
>     if (ret < 0) {
>         error_setg_errno(errp, errno, "can't bind ip=3D%s to socket",
>                          inet_ntoa(mcastaddr->sin_addr));
> --
> 2.32.1 (Apple Git-133)
>=20


--Apple-Mail=_3A63FEE9-65D6-4BC3-9E4D-1AD9749DC04B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEsLABAI5Y5VbvBdmpL8K2O86Eyz4FAmKEpXIACgkQL8K2O86E
yz6UZA/8DEFOR24NVm6IGf8m2Rbovw9lTL0rg2dULq/ouo9pb9nkpawbyN68t+lA
7fWawdOUzt1S7681NcmCioSB+ZI1YY5q1+CBMMIBx6EA7Sg7damIf3oC+LPLu8Xe
g1FSAS/ivUyFuE9On1n88lNbpbnRkYlI7d2BTNXNUzLmUS/RC2SVqum/6eNvZ9OR
gf5Oe36hiASp/NnOlKKc7NM1kUgDjm3LNycdaaqEq6icqTsNHCL8FzBZnr+vpXQx
P+EJxW0pX0sz4a9plZysOCZcsJ4YFmN7P5Jde87OCXVT8r9WzQX06VK6iNJOxQTo
xyU8AxbzZYGcYjcxpHcO0GU8i0v3B2eRgJjziN9EJpUjd5IMOBFguow30gpi4K8r
8SIILfAmWCjsaFrAPNV/7wgtMVc7l26zpuoNrjoS4zwB4rVdjEGc16bHQd7Y2+P8
AULM8xGc1tI9SG/c1MdbhQrb3/xthq7jMeH7zZQjZ+MtM4KDXmotgJG9FkwxoF0J
Y1UL04COIctfpS9C/lqOQYSsHLX7j3XINRkJUZxVk1M63wNjGnKml+PW1JM64NUM
fpQokthMibEVDQpeqcMgfnR+ochD7nz03JjB58XZIwgQcQkMwPBUL6+nAVFXlvta
ZOvdeE9/iID2GLk+xjEpXtQt6CnNUSFOBjIKl12rkddC5/1+qmc=
=jc6K
-----END PGP SIGNATURE-----

--Apple-Mail=_3A63FEE9-65D6-4BC3-9E4D-1AD9749DC04B--

