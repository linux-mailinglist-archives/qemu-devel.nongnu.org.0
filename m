Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D2B411073
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 09:47:22 +0200 (CEST)
Received: from localhost ([::1]:41440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSE1J-000139-P8
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 03:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSDvx-0005D2-Vz; Mon, 20 Sep 2021 03:41:50 -0400
Received: from ozlabs.org ([203.11.71.1]:56155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSDvw-0005WP-2c; Mon, 20 Sep 2021 03:41:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632123703;
 bh=cqc+nOdB/PpqCczPWcKoHUJ1Uo5kGoSaHLoRfOs1oFQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=imdXSBcBMHP+dAT7oBcasyqC+rRFQDTxfJWo10geA/Uhg3nemitiXb5P2/pe0RXoT
 UwQd9l3RP2dPYSa1nrZ1IcGXMm9YCNS0OvOdr6nfUzs+sgboPx9DsUyq1wcEIWlEx3
 1LwGvWJLyxvlLrNDQylfSovohj7VbmxTggESCe/Y=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4HCc2H2J8gz9s5R; Mon, 20 Sep 2021 17:40:56 +1000 (AEST)
Date: Mon, 20 Sep 2021 17:40:41 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v2 0/2] Require hypervisor privilege for tlbie[l] when
 PSR=0 and HR=1.
Message-ID: <YUg6+bSxKT0AbKAw@yekko>
References: <20210917114751.206845-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bX5IFS7yLkMTW364"
Content-Disposition: inline
In-Reply-To: <20210917114751.206845-1-matheus.ferst@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: leandro.lupori@eldorado.org.br, danielhb413@gmail.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--bX5IFS7yLkMTW364
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 08:47:49AM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>=20
> While working on FreeBSD radix support, Leandro Lupori (CC'ed) noticed
> that the latest build still fails in KVM but works in TCG[1]. This
> difference occurs because the current implementation of "tlbiel" does
> not validate the instruction parameters and always check for supervisor
> privilege.
>=20
> This patch series partially address this problem by requiring hypervisor
> privilege for radix mode when PSR=3D0. The validation of other parameters
> can be done when we move storage control instructions to decodetree.
>=20
> [1] To reproduce the issue, grab an ISO from [2] run qemu as
>=20
> qemu-system-ppc64 -cpu power9 -m 2G \
>     -machine pseries,cap-cfpc=3Dbroken,cap-sbbc=3Dbroken,cap-ibs=3Dbroken=
,cap-ccf-assist=3Doff \
>     -boot d -vga none -nographic -cdrom FreeBSD-14.0-CURRENT-powerpc-*.iso
>=20
> or
>=20
> qemu-system-ppc64 -cpu power9 -m 2G -enable-kvm \
>     -machine pseries,cap-cfpc=3Dbroken,cap-sbbc=3Dbroken,cap-ibs=3Dbroken=
,cap-ccf-assist=3Doff \
>     -boot d -vga none -nographic -cdrom FreeBSD-14.0-CURRENT-powerpc-*.iso
>=20
> Stop the boot at the prompt and use
>=20
> OK set radix_mmu=3D1
> OK boot
>=20
> [2]
> https://download.freebsd.org/ftp/snapshots/powerpc/powerpc64/ISO-IMAGES/1=
4.0/

Applied to ppc-for-6.2, thanks.

>=20
> Matheus Ferst (2):
>   target/ppc: add LPCR[HR] to DisasContext and hflags
>   target/ppc: Check privilege level based on PSR and LPCR[HR] in
>     tlbie[l]
>=20
>  target/ppc/cpu.h         |  1 +
>  target/ppc/helper_regs.c |  3 +++
>  target/ppc/translate.c   | 28 +++++++++++++++++++++++-----
>  3 files changed, 27 insertions(+), 5 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bX5IFS7yLkMTW364
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFIOvkACgkQbDjKyiDZ
s5IMXg//e3whDvz7eq7OpwiZVYpu3lkwCVSx+shRLsA5jObqYVa6mzuOPsKHEY7w
Qi5o45n5/+gFUW9042qsJLluv7F7a2WLAWfP/MMplVmrEsqx2rgNxT42c2bFpJHJ
6O+ILSSQARz1W5tFHm25dOeST/7lVZiuxxHL3KT+jjvpNqH+eRXIJKXv4L8hx2vg
b7+GIZs6SaegR7cfeA+MRsRojpcXNMSlWMANy1c3/YWi7kE0KMped2mZ0hN+ng/8
NXH9f0fd6LQ/wuLKUZNRqDjmKLItpb7RGk/A8h46rNyuku05vUdNat24oEzu7pSe
/yR6eLqwsB8uXcR/jopqyFceD3jMuATN0GMdikJonUwcyTduMvGu0/Jmhib1JJLJ
iHJtvCCh4DScWMBZZ5qXDbzsB/whxpKbvQMLbhTwMIsLq3f9CO6+/aV2YC3DK+Kr
ufTpoS9kbXq4Yl+gIrM+Vsz/9HAdAsLjBkb3cYtYMHtlpOy+GmIKLROLenKBTqpp
Wl5PVuTcTg9x8usldmv5G6didQMekECwWYuLe0XoUiq21Z7L21/lC/0q0ljvOV9P
ogKSnfOsGgrmQLrh1uYkUWrXoEeDRdQC0aoNRX456T/+u2OKA36ba98cSXfhX1nC
Dhr8YoM0scpT2VcHM1dhpz+WXi0Kurwe+rlPuq223k8tIrkXJKM=
=bvLQ
-----END PGP SIGNATURE-----

--bX5IFS7yLkMTW364--

