Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F3E488EAA
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 03:29:50 +0100 (CET)
Received: from localhost ([::1]:53692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6kRR-00054k-Ef
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 21:29:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n6kN2-0001kQ-FB; Sun, 09 Jan 2022 21:25:16 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=45911
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n6kMz-0004nR-BH; Sun, 09 Jan 2022 21:25:16 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JXHjC4xlnz4xtf; Mon, 10 Jan 2022 13:25:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1641781503;
 bh=xyKICyRCCfzOkFZE4XcUFeWAxv5JzwXsPH0D3cxp/Wk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OoWOxkBKfLpA9wnPhv+Xi+jPW7D2l3JmFwlRFYd4sSByQ/H9MLC1pCQ9YE672XoPX
 m2GgHSmUUp3a3UQpY2TyBoHmq70DIcjUUMzstDybYUKJL+L9IehiUvxCGOKJkrgKKC
 6qHO2efR6/0Tzq/WOKCEelLyHi88MsbL1sTBpBYQ=
Date: Mon, 10 Jan 2022 13:24:20 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v3 8/8] target/ppc: Set the correct endianness for
 powernv memory dumps
Message-ID: <YduY1BGU3Zar2Ft4@yekko>
References: <20220107222601.4101511-1-farosas@linux.ibm.com>
 <20220107222601.4101511-9-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+k04bdguh68ojdXY"
Content-Disposition: inline
In-Reply-To: <20220107222601.4101511-9-farosas@linux.ibm.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+k04bdguh68ojdXY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 07, 2022 at 07:26:01PM -0300, Fabiano Rosas wrote:
> We use the endianness of interrupts to determine which endianness to
> use for the guest kernel memory dump. For machines that support HILE
> (powernv8 and up) we have been always generating big endian dump
> files.
>=20
> This patch uses the HILE support recently added to
> ppc_interrupts_little_endian to fix the endianness of the dumps for
> powernv machines.
>=20
> Here are two dumps created at different moments:
>=20
> $ file skiboot.dump
> skiboot.dump: ELF 64-bit MSB core file, 64-bit PowerPC ...
>=20
> $ file kernel.dump
> kernel.dump: ELF 64-bit LSB core file, 64-bit PowerPC ...
>=20
> Suggested-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/arch_dump.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
> index 12cde198a3..993740897d 100644
> --- a/target/ppc/arch_dump.c
> +++ b/target/ppc/arch_dump.c
> @@ -237,7 +237,7 @@ int cpu_get_dump_info(ArchDumpInfo *info,
>      info->d_machine =3D PPC_ELF_MACHINE;
>      info->d_class =3D ELFCLASS;
> =20
> -    if (ppc_interrupts_little_endian(cpu, false)) {
> +    if (ppc_interrupts_little_endian(cpu, cpu->env.has_hv_mode)) {
>          info->d_endian =3D ELFDATA2LSB;
>      } else {
>          info->d_endian =3D ELFDATA2MSB;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+k04bdguh68ojdXY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHbmNIACgkQbDjKyiDZ
s5IB8A//YGAd6Ho0C9Dz0taP8Y6t5jk6wPBFTrDW/tmWOYTF53bqPJ3tjMvKyf/f
MQ+nx1FpUDEIS7du6Ig7xYXb4ZQmxAJjZ0uop4f+3Ki2ob2Z38ariOA/cjpb/S41
VG76b+LzTP1CmHsYRZJA9GAJpFHu894BcwFH5WK5488EtgafKxt9RvgW81I1PcNc
TJi9TDME7naxH2isbTJxUlaY18nfK+cWkzB8KhSKowgkkHhnukZKD9SklGkQ8jXV
Bp1bynovlMd5pzjNURepe6mCVtVJG8w7oAESTLbdAOHhAOdx/+8m+97W5gO81+RT
lMB7/hRCLmn+kDER4N/3Eu0Uoue9Bx78SLM+agxOQ09bS4Ft/m9l36PGKYJ/GLu3
pUZVb/r62/ZaF9pmtxSZShmz4zLfl19Ll99pQNkgROyTFn1vAjA19WQcBCcqN5J2
gCok2bVfSvgYGFuM8B6/55uCJK1eKuwLRU8xFqWyh6J8x702fsKzTkxvsHmlY9lM
FFwYGXO3lrRY0CiXvKsvqnPjS1M5Iv07fXB3Kx1b8wSisXpF7uk+o4K8WBBJYpVs
vtJIzOY6Jj8IwFgW53ggDjXWzzzbq5I982N2/7Ak3yj7viZJta6fc/2t7Br7++tT
oZ5k0Ivp/HlfXAowVCaP8ION3C2fDYBptkEace+RU7/JQrV5/Vs=
=qssd
-----END PGP SIGNATURE-----

--+k04bdguh68ojdXY--

