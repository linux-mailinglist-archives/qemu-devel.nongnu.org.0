Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A93B2E77E9
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 11:59:31 +0100 (CET)
Received: from localhost ([::1]:33770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuZCU-0006Ur-Ho
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 05:59:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kuZB9-0004Yj-9X; Wed, 30 Dec 2020 05:58:07 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:60349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kuZB5-0007at-M1; Wed, 30 Dec 2020 05:58:07 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D5StZ2JDbz9sVq; Wed, 30 Dec 2020 21:57:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609325878;
 bh=0z/VZRESy/6tpJKe1H20BQF556tPCYFQW9FCKCySfkU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oWiWoTNMFrXS4I6q9yVuLvmUS5eLsLw/XkCBfg8M8Fu9tC3084BNvzyQiyCoRcGcT
 VbIUK2fyJDE+ly8LTckB/k6T83zObbCLTpwrGFX9RfVonxa3X7qTL7tvWQjdnLJNGb
 idWtw9+y3k/e132TayIBOLfehIYPeQSlxLNdz8LM=
Date: Wed, 30 Dec 2020 18:58:01 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v3 3/3] pnv: Fix reverse dependency on PCI express root
 ports
Message-ID: <20201230075801.GE5490@yekko.fritz.box>
References: <160883056791.253005.14924294027763955653.stgit@bahia.lan>
 <160883058299.253005.342913177952681375.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AsxXAMtlQ5JHofzM"
Content-Disposition: inline
In-Reply-To: <160883058299.253005.342913177952681375.stgit@bahia.lan>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--AsxXAMtlQ5JHofzM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 24, 2020 at 06:23:03PM +0100, Greg Kurz wrote:
> qemu-system-ppc64 built with --without-default-devices crashes:
>=20
> Type 'pnv-phb4-root-port' is missing its parent 'pcie-root-port-base'
> Aborted (core dumped)
>=20
> Have POWERNV to select PCIE_PORT. This is done through a
> new PCI_POWERNV config in hw/pci-host/Kconfig since POWERNV
> doesn't have a direct dependency on PCI. For this reason,
> PCI_EXPRESS and MSI_NONBROKEN are also moved under
> PCI_POWERNV.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> Reviewed-by: C=E9dric Le Goater <clg@kaod.org>

Applied, thanks.

> ---
>  hw/pci-host/Kconfig     |    5 +++++
>  hw/pci-host/meson.build |    2 +-
>  hw/ppc/Kconfig          |    3 +--
>  3 files changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
> index 036a61877a73..eb03f0489d08 100644
> --- a/hw/pci-host/Kconfig
> +++ b/hw/pci-host/Kconfig
> @@ -60,3 +60,8 @@ config PCI_BONITO
>      select PCI
>      select UNIMP
>      bool
> +
> +config PCI_POWERNV
> +    select PCI_EXPRESS
> +    select MSI_NONBROKEN
> +    select PCIE_PORT
> diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
> index e6d1b896848c..da9d1a9964a8 100644
> --- a/hw/pci-host/meson.build
> +++ b/hw/pci-host/meson.build
> @@ -23,7 +23,7 @@ pci_ss.add(when: 'CONFIG_VERSATILE_PCI', if_true: files=
('versatile.c'))
> =20
>  softmmu_ss.add_all(when: 'CONFIG_PCI', if_true: pci_ss)
> =20
> -specific_ss.add(when: 'CONFIG_POWERNV', if_true: files(
> +specific_ss.add(when: 'CONFIG_PCI_POWERNV', if_true: files(
>    'pnv_phb3.c',
>    'pnv_phb3_msi.c',
>    'pnv_phb3_pbcq.c',
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index a213994ebf5d..d11dc30509df 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -29,8 +29,7 @@ config POWERNV
>      select XICS
>      select XIVE
>      select FDT_PPC
> -    select PCI_EXPRESS
> -    select MSI_NONBROKEN
> +    select PCI_POWERNV
> =20
>  config PPC405
>      bool
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--AsxXAMtlQ5JHofzM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/sMwkACgkQbDjKyiDZ
s5L3jxAAp3VqB8Er3KQdJSXNnRFZiM/ZJjjMPfXp5zzq+G7rFK2ZXel/aZelG+Lu
sPpXLR+7pChnz2k0UmoePcmxrdPVt+iaL/PD9pd/I8bgFGH1kZna9Fm1bHJ9jXmF
d8n1TKl3ZMtuRJ8TpQEWNA06rLY0P4Ru8OcqyhPqzTKQ/KFi6pkHTZqmFrBD8T6a
a5cPQjPO85ZIrOa8yffedObEo61B6RNj/0G/x/TddmDYm1HLOdEo2zDUYN595r8N
0EDI6Nxv6i0yL/oODlwLbtYpc0tPhNXs9EMhf27ZlYn2OxJI+SJ9r0k1pKxB+yKT
D37RAkekWkYwrXFBiBwyiOU/qTAwb/wSkmzoUTX2coK5lQo8w/57CAeeZ4xIQURZ
6verCySW6NoLp/BCdnazP6NVDhDK0ZpqDs0U2rZ8TkL1lMSxe9EpKyqGX5KG/7Cx
3+vlNdsOp7vQgGVH+IRO9POX/CXL3w62jXINTKF8SvbGOdpiamU0rAIT9Z4X9svJ
wLU+y5oPlIUG32u7H8Mj4CFsGEgKYvHHXEWId/uCN46V9saOwTew/cdIksYkmXJz
daRAtWcF8Xr4MEq4D/ZYPoJpguCzG4NViRVF2R4ifTGK7uQHFTaMNzd/uEZu61QO
xArnVLJmT1tg2gI7SkTS9pBi3IyAro/E1J3lUiwmp/SqvzMpuIU=
=YtBH
-----END PGP SIGNATURE-----

--AsxXAMtlQ5JHofzM--

