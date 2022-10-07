Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39885F7FB5
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 23:18:30 +0200 (CEST)
Received: from localhost ([::1]:48632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogujl-0004s4-BQ
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 17:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1oguhN-0003Mb-KT
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 17:16:07 -0400
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4]:37575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1oguh7-00063B-7R
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 17:16:00 -0400
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 WANG Xuerui <xen0n@gentoo.org>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, WANG Xuerui <xen0n@gentoo.org>
Subject: Re: [PATCH RESEND] linux-user: Fix struct statfs ABI on loongarch64
Date: Fri, 07 Oct 2022 23:15:33 +0200
Message-ID: <4766451.GXAFRqVoOG@pinacolada>
Organization: Gentoo Linux
In-Reply-To: <20221006100710.427252-1-xen0n@gentoo.org>
References: <20221006100710.427252-1-xen0n@gentoo.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1850213.tdWV9SEqCh";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
Received-SPF: pass client-ip=2001:470:ea4a:1:5054:ff:fec7:86e4;
 envelope-from=dilfridge@gentoo.org; helo=smtp.gentoo.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

--nextPart1850213.tdWV9SEqCh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: qemu-devel@nongnu.org
Date: Fri, 07 Oct 2022 23:15:33 +0200
Message-ID: <4766451.GXAFRqVoOG@pinacolada>
Organization: Gentoo Linux
In-Reply-To: <20221006100710.427252-1-xen0n@gentoo.org>
References: <20221006100710.427252-1-xen0n@gentoo.org>
MIME-Version: 1.0

Am Donnerstag, 6. Oktober 2022, 12:07:10 CEST schrieb WANG Xuerui:
> Previously the 32-bit version was incorrectly chosen, leading to funny
> but incorrect output from e.g. df(1). Simply select the version
> corresponding to the 64-bit asm-generic definition.
>=20
> For reference, this program should produce the same output no matter
> natively compiled or not, for loongarch64 or not:
>=20
> ```c
> #include <stdio.h>
> #include <sys/statfs.h>
>=20
> int main(int argc, const char *argv[])
> {
>   struct statfs b;
>   if (statfs(argv[0], &b))
>     return 1;
>=20
>   printf("f_type =3D 0x%lx\n", b.f_type);
>   printf("f_bsize =3D %ld\n", b.f_bsize);
>   printf("f_blocks =3D %ld\n", b.f_blocks);
>   printf("f_bfree =3D %ld\n", b.f_bfree);
>   printf("f_bavail =3D %ld\n", b.f_bavail);
>=20
>   return 0;
> }
>=20
> // Example output on my amd64 box, with the test binary residing on a
> // btrfs partition.
>=20
> // Native and emulated output after the fix:
> //
> // f_type =3D 0x9123683e
> // f_bsize =3D 4096
> // f_blocks =3D 268435456
> // f_bfree =3D 168406890
> // f_bavail =3D 168355058
>=20
> // Output before the fix, note the messed layout:
> //
> // f_type =3D 0x10009123683e
> // f_bsize =3D 723302085239504896
> // f_blocks =3D 168355058
> // f_bfree =3D 2250817541779750912
> // f_bavail =3D 1099229433104
> ```
>=20
> Fixes: 1f63019632 ("linux-user: Add LoongArch syscall support")
> Signed-off-by: WANG Xuerui <xen0n@gentoo.org>
> Cc: Song Gao <gaosong@loongson.cn>
> Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Cc: Andreas K. H=FCttel <dilfridge@gentoo.org>
> ---
>=20
> Resend with amended commit message to 100% clarify the example output
> are generated on my box and will differ for everyone else. Sorry for
> the noise.
>=20

Definitely fixes df.

Tested-by: Andreas K. Huettel <dilfridge@gentoo.org>

=2D-=20
Andreas K. H=FCttel
dilfridge@gentoo.org
Gentoo Linux developer
(council, toolchain, base-system, perl, libreoffice)
--nextPart1850213.tdWV9SEqCh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQKTBAABCgB9FiEE/Rnm0xsZLuTcY+rT3CsWIV7VQSoFAmNAlvVfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEZE
MTlFNkQzMUIxOTJFRTREQzYzRUFEM0RDMkIxNjIxNUVENTQxMkEACgkQ3CsWIV7V
QSqyvBAAyh9NHKNfY575zQkNA7zE/ytkHCtmxDR81KAYVhPiYkloqs1mv8rhKo8q
0CKt+fgK8GGtyQGW8auzEMLZ2vBRO7CWby2hlrMzmfIMMoiQYXhPjdFfG5aSs6qU
gesRE3+L1CuYQ+XR1/nGQSTdQoA3BLmQyX5UMxzssHCDKMVk/Rit3Mg21viVguMN
2a+yisQKxgPbLW55sheFYTUYSPL/HbbJncPyCah2FYWpM7kUJY+hR86V7DQt2gmd
/U+DMdmVfQ24xpvZO3sAt8VUm7jkfjg22opKNZdAlDkue+ortaOOMwgIzbVfmvzQ
RvM771Hc8swTqFbx+bDiD9XmUJKyrndDPA7kTtyczslCsIn4G1QKrGn4eiIEhZU6
ep9N4yNSwAeVuncj1InVtHIXh9X/FV448xQxO0rLJHOjlsXxWlvSSE7VM/0NJRyZ
e4/yYyZazuUMLQakLkwmCpSVy1N3sRurhYRKWbU7reA8+L5843Aj31OcDo3KMPjM
QWJJ9X5XaQNkEcZPur/wtbSd804DpCBfDlJ5XGEoTMAVil1qhD+RhOpHh7uXalHM
sG7EyURQ+ULxaqkmmkM+IfzUC8bs96UmuKQv90Rm6jTPLapQUKsS5gbFC3KF+16w
VpxPikI3luqgrh0dk5Ah3oATYIEuBlxM5+zaL3wwm1+urr7hDJg=
=yjXU
-----END PGP SIGNATURE-----

--nextPart1850213.tdWV9SEqCh--




