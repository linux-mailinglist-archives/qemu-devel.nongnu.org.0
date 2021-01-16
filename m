Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D032F8ECB
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 19:59:21 +0100 (CET)
Received: from localhost ([::1]:52910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0qnA-0002ph-7l
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 13:59:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1l0qlo-00029n-JN
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 13:57:56 -0500
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4]:43993
 helo=smtp.gentoo.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1l0qlm-0005h5-8B
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 13:57:56 -0500
From: Andreas =?ISO-8859-1?Q?K=2E_H=FCttel?= <dilfridge@gentoo.org>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v1 1/1] linux-user/signal: Decode waitid si_code
Date: Sat, 16 Jan 2021 20:57:41 +0200
Message-ID: <18309429.fSG56mABFh@farino>
Organization: Gentoo Linux
In-Reply-To: <1a4df1b5638d73b64200add175be9d69013418d8.1608401453.git.alistair.francis@wdc.com>
References: <1a4df1b5638d73b64200add175be9d69013418d8.1608401453.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2080420.hkbZ0PkbqX";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
Received-SPF: pass client-ip=2001:470:ea4a:1:5054:ff:fec7:86e4;
 envelope-from=dilfridge@gentoo.org; helo=smtp.gentoo.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--nextPart2080420.hkbZ0PkbqX
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Andreas =?ISO-8859-1?Q?K=2E_H=FCttel?= <dilfridge@gentoo.org>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v1 1/1] linux-user/signal: Decode waitid si_code
Date: Sat, 16 Jan 2021 20:57:41 +0200
Message-ID: <18309429.fSG56mABFh@farino>
Organization: Gentoo Linux
In-Reply-To: <1a4df1b5638d73b64200add175be9d69013418d8.1608401453.git.alistair.francis@wdc.com>
References: <1a4df1b5638d73b64200add175be9d69013418d8.1608401453.git.alistair.francis@wdc.com>

Am Samstag, 19. Dezember 2020, 20:11:13 EET schrieb Alistair Francis:
> When mapping the host waitid status to the target status we previously
> just used decoding information in the status value. This doesn't follow
> what the waitid documentation describes, which instead suggests using
> the si_code value for the decoding. This results in the incorrect values
> seen when calling waitid. This is especially apparent on RV32 where all
> wait calls use waitid (see the bug case).
>=20
> This patch uses the si_code value to map the waitid status.
>=20
> Buglink: https://bugs.launchpad.net/qemu/+bug/1906193
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Tested-by: Andreas K. H=FCttel <dilfridge@gentoo.org>


> ---
>  linux-user/signal.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>=20
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 73de934c65..b6c9326521 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -305,6 +305,7 @@ static inline void
> host_to_target_siginfo_noswap(target_siginfo_t *tinfo, int sig =3D
> host_to_target_signal(info->si_signo);
>      int si_code =3D info->si_code;
>      int si_type;
> +    int status =3D info->si_status;
>      tinfo->si_signo =3D sig;
>      tinfo->si_errno =3D 0;
>      tinfo->si_code =3D info->si_code;
> @@ -349,8 +350,29 @@ static inline void
> host_to_target_siginfo_noswap(target_siginfo_t *tinfo, case TARGET_SIGCHL=
D:
>              tinfo->_sifields._sigchld._pid =3D info->si_pid;
>              tinfo->_sifields._sigchld._uid =3D info->si_uid;
> -            tinfo->_sifields._sigchld._status
> -                =3D host_to_target_waitstatus(info->si_status);
> +
> +            /*
> +             * Map host to target signal numbers for the waitid family of
> +             * syscalls. This is similar to the functionality in
> +             * host_to_target_waitstatus() except we use the si_code to
> +             * determine the operation.
> +             */
> +            switch (info->si_code) {
> +            case CLD_KILLED:
> +            case CLD_DUMPED:
> +                tinfo->_sifields._sigchld._status =3D
> +                    host_to_target_signal(WTERMSIG(status)) |
> +                                          (status & ~0x7f);
> +                break;
> +            case CLD_STOPPED:
> +                tinfo->_sifields._sigchld._status =3D
> +                (host_to_target_signal(WSTOPSIG(status)) << 8) |
> +                    (status & 0xff);
> +                break;
> +            default:
> +                tinfo->_sifields._sigchld._status =3D status;
> +            }
> +
>              tinfo->_sifields._sigchld._utime =3D info->si_utime;
>              tinfo->_sifields._sigchld._stime =3D info->si_stime;
>              si_type =3D QEMU_SI_CHLD;


=2D-=20
Andreas K. H=FCttel
dilfridge@gentoo.org
Gentoo Linux developer=20
(council, qa, toolchain, base-system, perl, libreoffice)
--nextPart2080420.hkbZ0PkbqX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQKTBAABCgB9FiEE2dlecvcVU8/ThuQ/jJJgxvbXoxAFAmADNyVfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEQ5
RDk1RTcyRjcxNTUzQ0ZEMzg2RTQzRjhDOTI2MEM2RjZEN0EzMTAACgkQjJJgxvbX
oxBY9hAArdgCo4zcqOmyMk+PRj/X5jAsVGkNlMe/AwI4RRnlZs3bCu8NsYxWvzlN
snUSejgueTXr2cPs+gPtlmy4xUeu5Ea/5RlXaAYyLN/x8LhHit4eYtEGZI3eGCL7
b1LYmRPBirLhsmESdL2fhbJeyXQ1hPtENWYP0L5cYcccMPkJTbu9Xstd78OX/6Wd
U1X10Yu28SjusPTg9qpxa1U22RVgH2Wq7zRU5Tgvdz2+hQJvEc4ZaF82kWf4NfKz
Unc7Nk8G/3YC9A1n0xqp/yosPANiEM5Dm0MlhVlLvfB7GBebR9oU019Z4Y/V6ZMb
7HcjrquCbrWxSw/zTuNVzkWZOeme0aQ4fYvcdMJf2uhFd/tBK69779REKLpJLdWx
z48Ueu3c+VGQ2NgdmJVqWUKAQ14Vw2EmUdfhRZk1U5H4WgHTDYjQF8jzm4MxyN4G
g+ZGxYpQ/TYk25yHe1WldGuADDUK8XPrFFK2jK8twbv/o14BFs/uYNVw7kQMi5hc
UuePosTi2ABhP+o+LDrnvDaccczgpp8MEEr4qluLwxZoaiHMOvr1xavrfSzZSkyD
EvdUZ6AVgPJDpE2Lwtlxze+TWOq/NKkrHfabQ8j2Q1CXcpBQmfPIdg3boX7/QVsC
FHpg5hV5xvcEf8LoiFwywD+0/2q18fzVojsNUddSKNFnBDKXNZo=
=4mAL
-----END PGP SIGNATURE-----

--nextPart2080420.hkbZ0PkbqX--




