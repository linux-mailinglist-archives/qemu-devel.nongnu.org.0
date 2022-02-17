Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E754B9594
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 02:41:07 +0100 (CET)
Received: from localhost ([::1]:50194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKVn7-0005gT-GC
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 20:41:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKVeA-0002cG-UD; Wed, 16 Feb 2022 20:31:50 -0500
Received: from [2404:9400:2221:ea00::3] (port=51895 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKVe6-0002QF-3E; Wed, 16 Feb 2022 20:31:50 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jzck42lnjz4xv5; Thu, 17 Feb 2022 12:31:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1645061500;
 bh=NYhILMI93GejYAD2tdkqChu4nsLOhm24Gu8RGrQf2EM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Daz3+pX1T0GNk7Lpe/gbstFbmzJBvfWmJGAZfbGZNyg2DIsRS61xYbKTjxy4UgBIY
 FHQPkzZIl2c3Ab2wqXMA3wHSmGiKh/1hJhZcW01uNQZyKHY7U1hQMMkpBwUR97+kev
 gOIF6UbBNxqYfLjwsYlhmqtoLLC+vh4F5miOpM40=
Date: Thu, 17 Feb 2022 11:17:10 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 2/3] spapr: Add SPAPR_CAP_AIL_MODE_3 for AIL mode 3
 support for H_SET_MODE hcall
Message-ID: <Yg2UBtTXneXhDdHz@yekko>
References: <20220216063903.1782281-1-npiggin@gmail.com>
 <20220216063903.1782281-2-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8jhyMQNZHRGIimUf"
Content-Disposition: inline
In-Reply-To: <20220216063903.1782281-2-npiggin@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2404:9400:2221:ea00::3
 (failed)
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8jhyMQNZHRGIimUf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2022 at 04:39:02PM +1000, Nicholas Piggin wrote:
> The behaviour of the Address Translation Mode on Interrupt resource is
> not consistently supported by all CPU versions or all KVM versions:
> KVM-HV does not support mode 2, and does not support mode 3 on POWER7 or
> early POWER9 processesors. KVM PR only supports mode 0. TCG supports all
> modes (0, 2, 3). This leads to inconsistencies in guest behaviour and
> could cause problems migrating guests.
>=20
> This was not noticable for Linux guests for a long time because the
> kernel only uses modes 0 and 3, and it used to consider AIL-3 to be
> advisory in that it would always keep the AIL-0 vectors around. Recent
> Linux guests depend on the AIL mode working as specified in order to
> support the SCV facility interrupt. If AIL-3 can not be provided, then
> Linux must be given an error so it can disable the SCV facility, rather
> than silently failing.
>=20
> Add the ail-mode-3 capability to specify that AIL-3 is supported. AIL-0
> is implied as the baseline, and AIL-2 is no longer supported by spapr.
> AIL-2 is not known to be used by any software, but support in TCG could
> be restored with an ail-mode-2 capability quite easily if a regression
> is reported.
>=20
> Modify the H_SET_MODE Address Translation Mode on Interrupt resource
> handler to check capabilities and correctly return error if not
> supported.
>=20
> A heuristic is added for KVM to determine AIL-3 support before the
> introduction of a new KVM CAP, because blanket disabling AIL-3 has too
> much performance cost.
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

[snip]
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index dc93b99189..1338c41f8f 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -2563,6 +2563,35 @@ int kvmppc_has_cap_rpt_invalidate(void)
>      return cap_rpt_invalidate;
>  }
> =20
> +bool kvmppc_supports_ail_3(void)
> +{
> +    PowerPCCPUClass *pcc =3D kvm_ppc_get_host_cpu_class();
> +
> +    /*
> +     * KVM PR only supports AIL-0
> +     */
> +    if (kvmppc_is_pr(kvm_state)) {
> +        return 0;
> +    }
> +
> +    /*
> +     * KVM HV hosts support AIL-3 on POWER8 and above, except for radix
> +     * mode on some early POWER9s.
> +     */
> +    if (!(pcc->insns_flags2 & PPC2_ISA207S)) {
> +        return 0;
> +    }
> +
> +    /* These tests match the CPU_FTR_P9_RADIX_PREFETCH_BUG flag in Linux=
 */
> +    if (((pcc->pvr & 0xffffff00) =3D=3D CPU_POWERPC_POWER9_DD1) ||
> +        ((pcc->pvr & 0xffffff00) =3D=3D CPU_POWERPC_POWER9_DD20) ||
> +        ((pcc->pvr & 0xffffff00) =3D=3D CPU_POWERPC_POWER9_DD21)) {
> +        return 0;
> +    }

Deducing what KVM supports rather than getting it to tell us
explicitly with a cap is usually frowned upon.  However, given the
earlier discussion, I'm satisfied that this is the least bad available
option, at least for now.


> +
> +    return 1;
> +}
> +
>  PowerPCCPUClass *kvm_ppc_get_host_cpu_class(void)
>  {
>      uint32_t host_pvr =3D mfpvr();
> diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
> index ee9325bf9a..7bba26d1da 100644
> --- a/target/ppc/kvm_ppc.h
> +++ b/target/ppc/kvm_ppc.h
> @@ -73,6 +73,7 @@ int kvmppc_set_cap_nested_kvm_hv(int enable);
>  int kvmppc_get_cap_large_decr(void);
>  int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable);
>  int kvmppc_has_cap_rpt_invalidate(void);
> +bool kvmppc_supports_ail_3(void);
>  int kvmppc_enable_hwrng(void);
>  int kvmppc_put_books_sregs(PowerPCCPU *cpu);
>  PowerPCCPUClass *kvm_ppc_get_host_cpu_class(void);
> @@ -393,6 +394,11 @@ static inline int kvmppc_has_cap_rpt_invalidate(void)
>      return false;
>  }
> =20
> +static inline bool kvmppc_supports_ail_3(void)
> +{
> +    return false;
> +}
> +
>  static inline int kvmppc_enable_hwrng(void)
>  {
>      return -1;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8jhyMQNZHRGIimUf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmINk/8ACgkQgypY4gEw
YSLs7RAAwvRQnE4/oEobFRNp/vjCWYyWTvIqPQHhztN4KxmegRh2pJUoKlsIwMk+
6izv5wYC/YB/zaWTxUT4P8oTO7kpxgxkBofQscJzP/MwmAuP38kt1OM0yPNSQ7fz
1m3HpW0adsY6MFEKe/3OZpTcKpbmwveir3UclzPLEgAgSVSjih43lMoiu7bIBjke
ZU9AQnzVUWh4Ea1eDjoApjtYUpd3tmAkv94Ni+q+cNgTgZ/Qz5WFS/xHOSi56I1B
lXgJuq4GNfqAC1zZTkfhBDiNEJQFk0RgAUYjOmo+a/DTLoIUG8FQpzJHEJ7BlhFY
fXj3Y2QioFBDLYxIYvIE4vQOZW2oDcr6FtdYdqyI4SvZ5yU8cIsd8r4RtvQHUiS+
xg5/PWe3eLI4MUWq8zFpf78h/LRRPSb3OFidzbkEEfWQhC8JmVkd++Gfn8gcpybz
vMBGIQgbexkfTO7UvnfqjKrsROg7bkWcULDfZGbKPOEW8KLat6oExDBjvEqMuW9S
2KYmM/TtR9Ueb0k7andZ14Yg/JUrOnHdvTfBvSijOZ+5Zt/ey3uwfXDo6qLwp+rP
kwkmeGsR8mXR5omul9dGuXXkbCc8mBihEanavt1oV9yhcy9pd0DfMi9GqT2FMehz
mjqlbpv/I8JeVR1CpK2Z6wLZNF1FI2xjEy9qnOWbqbCkpKyb3tE=
=kEqy
-----END PGP SIGNATURE-----

--8jhyMQNZHRGIimUf--

