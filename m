Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7215C4AB348
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 03:03:08 +0100 (CET)
Received: from localhost ([::1]:39134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGtMw-0006BU-II
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 21:03:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nGtFO-0002ix-Fw; Sun, 06 Feb 2022 20:55:20 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:46945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nGtFJ-0006Mg-Bt; Sun, 06 Feb 2022 20:55:18 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JsTjg3Cxqz4xcZ; Mon,  7 Feb 2022 12:55:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644198903;
 bh=PShF5ti2TK8HgTdENjXYhthZk0M/fyO22Gq+VIfu23c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DJ8ekLMGj5sH9Ly2XVFxoorD/P+Zugz6Js/wd9TRWl1kTdzVxhEViNcXc1Vd9x1EA
 e9iYWEhUUlrGEFjPXH4ywf3p++ly+GrLmdTozTgwpFBeoexFlEUUQv6//7uPVpQYvg
 NuoL8V1/8AZ8Gi2EKjjmfL/FPXabjzfIta4uI9Zo=
Date: Mon, 7 Feb 2022 12:41:15 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH] spapr: Add SPAPR_CAP_AIL_MODES for supported AIL
 modes for H_SET_MODE hcall
Message-ID: <YgB4u+L0z6LhMU9n@yekko>
References: <20220129065007.103681-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QcyIItr93/ByiDix"
Content-Disposition: inline
In-Reply-To: <20220129065007.103681-1-npiggin@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--QcyIItr93/ByiDix
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 29, 2022 at 04:50:07PM +1000, Nicholas Piggin wrote:
> The behaviour of the Address Translation Mode on Interrupt resource is
> not consistently supported by all CPU versions or all KVM versions.  In
> particular KVM HV only supports mode 0 on POWER7 processors, and does
> not support mode 2 on any processors. KVM PR only supports mode 0. TCG
> can support all modes (0,2,3).
>=20
> This leads to inconsistencies in guest behaviour and could cause
> problems migrating guests.
>=20
> This was not too noticable for Linux guests for a long time because the
> kernel only used mode 0 or 3, and it used to consider AIL to be somewhat
> advisory (KVM would not always honor it either) and it kept both sets of
> interrupt vectors around.
>=20
> Recent Linux guests depend on the AIL mode working as defined by the ISA
> to support the SCV facility interrupt. If AIL mode 3 can not be provided,
> then Linux must be given an error so it can disable the SCV facility.
>=20
> Add the ail-modes capability which is a bitmap of the supported values
> for the H_SET_MODE Address Translation Mode on Interrupt resource. Add
> a new KVM CAP that exports the same thing, and provide defaults for PR
> and HV KVM that predate the cap.
> ---
>=20
> I just wanted to get some feedback on the approach before submitting a
> patch for the KVM cap.
>=20
> The reason I don't make that a boolean cap for AIL=3D3 is that future
> processors might implement new modes a guest would like to use even
> though it's not the nicest interface.

[snip]
>  SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] =3D {
>      [SPAPR_CAP_HTM] =3D {
>          .name =3D "htm",
> @@ -730,6 +802,15 @@ SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] =
=3D {
>          .type =3D "bool",
>          .apply =3D cap_rpt_invalidate_apply,
>      },
> +    [SPAPR_CAP_AIL_MODES] =3D {
> +        .name =3D "ail-modes",
> +        .description =3D "Bitmap of AIL (alternate interrupt location) m=
ode support",

A bitmap doesn't quite work as an spapr cap.  The general caps code
assumes that bigger is always better, or more precisely that migrating
=66rom an instance that has a lower value to one which has a higher
value is "good enough" to be compatible.  That's obviously not the
case for a bitmap.

I think to handle this properly within the limitations of papr caps,
you instead want a separate boolean cap for each supported AIL mode
(or at least for each AIL mode you want to have control over).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QcyIItr93/ByiDix
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIAeLIACgkQgypY4gEw
YSLdqQ//RVp0HXne3/BgKFesYNPvFNDVWURgaVnIcKIazcU/cHRIT6tyEsZCdJm2
UW5nQdEXO8/4Gc9EwiB1aQ9qKsG0zwpjM9veqoaXu5wjcTHunRqBp95m4cmydWDo
r7myL3+mN2S/kzW1iwP9uJio4ezbTQznKh+ojTw85QqUi5JJBHge8Bdw+2DL6Gf/
+pT/u9AcbQrZoiTo4oJAEw2XkRe/+2AmQvPdFTcinnJi/p+Rw82zILZAl8wqaLJe
2LZOBXQgXI43xSuzvPVzAarjlslhQb/V9x4AwdE+ebSwk6gaD2VoKdAtQfNOnegY
KjfhZuZZ/hYENqgXK3O68plod/XBeIpnHyIpXHRG3fDiMUe4/BHNwW6Ph6jWpnHV
3lSKJVGZ/oYebm7bTLLhmNjYPmliy9UbbaYznx3P4EoWE0I+TZPCQoDQ/416yJg+
u77++CaTd1xA0apBoxPObE3+kMWB4oP65UvOg15Zrl3q/hic6HwT43u3fcyEiSKk
OeZwkjRy/VC+vSuFZ8T98TtM5EFLoFG0j1SHMZTOT3L3reNFHCp7h85mIJ1wTNOb
9gnZDTRl1rnZCvpLe4otxn6g3Nz2PraneIgLVtaxP30KAj9tHLaQf+i1cVzDFLGs
/1AXgJqZjGUip6rIghwYeHLMwGY2g2VFOZRHQh0oJpvGgT0vGOE=
=ezqo
-----END PGP SIGNATURE-----

--QcyIItr93/ByiDix--

