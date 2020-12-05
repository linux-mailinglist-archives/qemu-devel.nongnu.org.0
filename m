Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B542CFAEB
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 11:01:29 +0100 (CET)
Received: from localhost ([::1]:45080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klUNb-0008LR-Mm
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 05:01:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1klULK-0007Ku-2w; Sat, 05 Dec 2020 04:59:10 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:42049 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1klULG-0008AS-Kv; Sat, 05 Dec 2020 04:59:05 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cp4ls4cQzz9sWL; Sat,  5 Dec 2020 20:58:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607162329;
 bh=R5AK1LUhE9H+nR8tijOtMrMtYwFa+ZlsO/A5iAA9zf8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c8kx6ExK26OhHpPh2ofUcnx9ZKfUQ0tIFZ/vyQw7KmHfAPwm0XQ4H1NOCt5AUEw7i
 FPqw4lqNCmGbTMHMU+Hka94W9U9jHyG5hP8Fz3EJ3SBW87ACz67HsUNYv4z1kc00nV
 SIDl7sqXo8Y8TDmIRtsesizaz4kfxqQ43+djKuH0=
Date: Sat, 5 Dec 2020 20:56:48 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Gan Qixin <ganqixin@huawei.com>
Subject: Re: [PATCH 2/3] misc/mos6522: Use timer_free() in the finalize
 function to avoid memleak
Message-ID: <20201205095648.GB4783@yekko.fritz.box>
References: <20201204081209.360524-1-ganqixin@huawei.com>
 <20201204081209.360524-3-ganqixin@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="i0/AhcQY5QxfSsSZ"
Content-Disposition: inline
In-Reply-To: <20201204081209.360524-3-ganqixin@huawei.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, zhang.zhanghailiang@huawei.com,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Euler Robot <euler.robot@huawei.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--i0/AhcQY5QxfSsSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 04, 2020 at 04:12:08PM +0800, Gan Qixin wrote:
> When running device-introspect-test, a memory leak occurred in the mos652=
2_init
> function, this patch use timer_free() in the finalize function to fix it.
>=20
> ASAN shows memory leak stack:
>=20
> Direct leak of 96 byte(s) in 2 object(s) allocated from:
>     #0 0xfffd5fe9e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f=
0)
>     #1 0xfffd5f7b6800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
>     #2 0xaaae50303d0c in timer_new_full qemu/include/qemu/timer.h:523
>     #3 0xaaae50303d0c in timer_new qemu/include/qemu/timer.h:544
>     #4 0xaaae50303d0c in timer_new_ns qemu/include/qemu/timer.h:562
>     #5 0xaaae50303d0c in mos6522_init qemu/hw/misc/mos6522.c:490
>     #6 0xaaae50b77d70 in object_init_with_type qemu/qom/object.c:371
>     #7 0xaaae50b7ae84 in object_initialize_with_type qemu/qom/object.c:515
>     #8 0xaaae50b7b0f8 in object_new_with_type qemu/qom/object.c:729
>     #9 0xaaae50bb6d58 in qmp_device_list_properties qemu/qom/qom-qmp-cmds=
=2Ec:153
>     #10 0xaaae50d7e1dc in qmp_marshal_device_list_properties qemu/qapi/qa=
pi-commands-qdev.c:59
>     #11 0xaaae50dc87a0 in do_qmp_dispatch_bh qemu/qapi/qmp-dispatch.c:110
>     #12 0xaaae50d931a0 in aio_bh_call qemu/util/async.c:136
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
> Cc: David Gibson <david@gibson.dropbear.id.au>
> ---
>  hw/misc/mos6522.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> index ac4cd1d58e..0236eeece1 100644
> --- a/hw/misc/mos6522.c
> +++ b/hw/misc/mos6522.c
> @@ -490,6 +490,16 @@ static void mos6522_init(Object *obj)
>      s->timers[1].timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, mos6522_time=
r2, s);
>  }
> =20
> +static void mos6522_finalize(Object *obj)
> +{
> +    MOS6522State *s =3D MOS6522(obj);
> +
> +    timer_del(s->timers[0].timer);
> +    timer_free(s->timers[0].timer);
> +    timer_del(s->timers[1].timer);
> +    timer_free(s->timers[1].timer);
> +}
> +
>  static Property mos6522_properties[] =3D {
>      DEFINE_PROP_UINT64("frequency", MOS6522State, frequency, 0),
>      DEFINE_PROP_END_OF_LIST()
> @@ -519,6 +529,7 @@ static const TypeInfo mos6522_type_info =3D {
>      .parent =3D TYPE_SYS_BUS_DEVICE,
>      .instance_size =3D sizeof(MOS6522State),
>      .instance_init =3D mos6522_init,
> +    .instance_finalize =3D mos6522_finalize,
>      .abstract =3D true,
>      .class_size =3D sizeof(MOS6522DeviceClass),
>      .class_init =3D mos6522_class_init,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--i0/AhcQY5QxfSsSZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/LWWAACgkQbDjKyiDZ
s5KDUg/8C3ge52Pr+Q2YH0zDpUXC4CRhr+kBtDonfZfLl2xaEaf738l15e1xiWYW
T0emnvi9aAiqfB0nmdznLt3Bcgv1MBcPyMzPT5FvVE1k+DbHaqppE0Mm2J4N53eO
YNyURIgPbtDOh55PFY22tU+P7jveHYJ8XuhCeh9jaSxuieBVHR2cVzbBg/vo+4t6
Xmibe52FAfYsQDZSP5Z1iEHQy3C2FQeVsTdIOU2ESBsKaW+pzvRiDYx4McIcVz9D
FosLJvQwiz2/rSPBUlPEcgQ/EFG4Z9ng2RtmOBkTbrM1sFLt5Cs/cE5Efz+DhfQ0
9xyOB+EaRe+xxLaQ1lPfJ7D17ixajAI/2NJM2HmD+RrtA3Zm4CMezrm1fxBYsksy
CSrGE44gEXAP2vukZJMzRWPFI20rXgsAJDdpCIxg8deDP/3lglMPTutM/DKtybL0
kDRt17ZubtL6iP9q39m24fveZOarWzjA5rvzCkRV+glrfKFnvyOJmYhnTTn99nNE
8ciD5uJLBnnuDZWC9XnmRFj1O1uTsGsIR8teMviNAmlg4BNWTNZjOYUOmupSKTMI
/LEnNOhN961PAJrlL9jnitc+Jn/s85jvoLSmqU0XwNyh5i9NTH0+omv4OCiTV9Jj
lhf4o/Tp6go/Qj4I5aGZYBxx4vBVQEN8tycqZfDjFikOVZrEydI=
=tWzD
-----END PGP SIGNATURE-----

--i0/AhcQY5QxfSsSZ--

