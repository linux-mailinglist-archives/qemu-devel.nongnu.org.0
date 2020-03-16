Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085DE18637D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 03:59:22 +0100 (CET)
Received: from localhost ([::1]:33494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDfyK-0004gC-Np
	for lists+qemu-devel@lfdr.de; Sun, 15 Mar 2020 22:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52438)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1jDfqP-00037A-77
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 22:51:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1jDfqN-00041W-SI
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 22:51:09 -0400
Received: from ozlabs.org ([203.11.71.1]:59515)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1jDfqM-0003WF-Tb; Sun, 15 Mar 2020 22:51:07 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48ggm50brBz9sQt; Mon, 16 Mar 2020 13:51:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1584327061;
 bh=+NHN9v+RFw/gG/kVnFG1yF+mUl7irsuxrgtyDaCX2dw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CFSoU2J5Ig75FqftLoSvzmnKtJTYqW/Sxo6cJE1hkbHXlMuRYmLNioMIg6hdNHQij
 JjmiU0a7stDyENIOSKl4HI1hNtBwdSyNgqeOvrpvqivL6hhBeqMUbKhZ/jrVEi7DrS
 mjRvqhe5RdRf3hYvvXef4UE1kmuEW79hKZo5r+Mk=
Date: Mon, 16 Mar 2020 13:22:36 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu] spapr/rtas: Reserve space for RTAS blob and log
Message-ID: <20200316022236.GB2013@umbus.fritz.box>
References: <20200316011841.99970-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Content-Disposition: inline
In-Reply-To: <20200316011841.99970-1-aik@ozlabs.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2020 at 12:18:41PM +1100, Alexey Kardashevskiy wrote:
> At the moment SLOF reserves space for RTAS and instantiates the RTAS blob
> which is 20 bytes binary blob calling an hypercall. The rest of the RTAS
> area is a log which SLOF has no idea about but QEMU does.
>=20
> This moves RTAS sizing to QEMU and this overrides the size from SLOF.
> The only remaining problem is that SLOF copies the number of bytes it
> reserved (2KB for now) so QEMU needs to reserve at least this much;
> SLOF will be fixed separately to check that rtas-size from QEMU is
> enough for those 20 bytes the H_RTAS hcall.
>=20
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Applied to ppc-for-5.0, thanks.

> ---
>  include/hw/ppc/spapr.h | 1 +
>  hw/ppc/spapr.c         | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 2015e37ac5c8..35b489a54929 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -736,6 +736,7 @@ void spapr_load_rtas(SpaprMachineState *spapr, void *=
fdt, hwaddr addr);
>  #define SPAPR_IS_PCI_LIOBN(liobn)   (!!((liobn) & 0x80000000))
>  #define SPAPR_PCI_DMA_WINDOW_NUM(liobn) ((liobn) & 0xff)
> =20
> +#define RTAS_SIZE               2048
>  #define RTAS_ERROR_LOG_MAX      2048
> =20
>  /* Offset from rtas-base where error log is placed */
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 64bc8b83e91e..d3db3ec56e9c 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -967,6 +967,7 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, v=
oid *fdt)
>      _FDT(fdt_setprop(fdt, rtas, "ibm,max-associativity-domains",
>                       maxdomains, sizeof(maxdomains)));
> =20
> +    _FDT(fdt_setprop_cell(fdt, rtas, "rtas-size", RTAS_SIZE));
>      _FDT(fdt_setprop_cell(fdt, rtas, "rtas-error-log-max",
>                            RTAS_ERROR_LOG_MAX));
>      _FDT(fdt_setprop_cell(fdt, rtas, "rtas-event-scan-rate",

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5u4uwACgkQbDjKyiDZ
s5LRLg/6ArmOG9RbAjIuVHD0eFwU7X37A9znb/CvwwEg8bwzM/N39AJotC35fWVc
x+B66i675srYxtzHzUxnB+3MpsYqym36LHfUN8AhDAGpCVwRE+u3a8L7phCy+/GR
MVIlsCY1b2+KZ61yGZL/cVly/5EFayNfzQX4J40752AOk50Hnb/fZdKzR6fHQoyC
5nRKJOz4oEayw0H7oYe8alC7cxFVS2aBRFZ+NJQD35vxY7ObeESYPSWXFz9JDdeM
crVfgB9XEcT4/QSe9uwXc5gBKxqieIOefPoUK20eKBZfVcrVwJ7TPa/AJ3QBJZmP
fJ77NFzxMhM31d8f/mwDFiWJCtY2aos3Y0s7I85Jq29pTjS90hu8oRBd8Oer9gK6
UcqGXqGb7F0dS525un95QBdoQQeyW8SnB8Jld/hjXIKVE976GxyGSaZD1OKl4fyG
7+7fncn5o6DbEswfNqMg+owgkAj2qymOSBTeH4HpEPIvPHNrdEOaNmx9yO8rV12x
twho+8VIGpezJdox0hDiGKas0RcVCYpEtuz/OKXkYdlc2Go+GGO1vgp5nl/uh5Fl
6bF88i1jAoRIGoW595X2RINRz0+HFcF/U9VZ59L33iUYTStvQKYKif2q4xuC/xGZ
Ig/tNz05qQ20/p8nb9bxZTMZcMBxicyT5H34oGS7dRD5CmaW+CM=
=p7hP
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--

