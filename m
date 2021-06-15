Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4123A7686
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 07:34:10 +0200 (CEST)
Received: from localhost ([::1]:39396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt1iD-0008Nr-Vr
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 01:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lt1hI-0007NF-2B; Tue, 15 Jun 2021 01:33:12 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:45333 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lt1hF-0008Ji-6V; Tue, 15 Jun 2021 01:33:11 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G3xmc4wpqz9sW7; Tue, 15 Jun 2021 15:33:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623735184;
 bh=vYpAW2pqTeeu8dyg+P+DxnOfjolNlO5IVLUWnMvMUHs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jvJ7Uo49Ca0QvmVvMxsCV2lQjUx3GUP/mCF2ljz/0NxhMXHJxzvqeu8TnUjXDeSn8
 iGYedetxmJwmJK8TM8hKAMQg8hOeIO9BabX9vxfIa+wQp3G4+XKkl394HAZz3RRVFu
 7hmbyEwflXY74dYiO07sP9QpphFPihCb33m7S4CA=
Date: Tue, 15 Jun 2021 14:02:04 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [RFC PATCH 3/8] spapr_numa.c: wait for CAS before writing rtas DT
Message-ID: <YMgmPDrr7oJFGME1@yekko>
References: <20210615013309.2833323-1-danielhb413@gmail.com>
 <20210615013309.2833323-4-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TDOjTuplJMm+tFcH"
Content-Disposition: inline
In-Reply-To: <20210615013309.2833323-4-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: aneesh.kumar@linux.ibm.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--TDOjTuplJMm+tFcH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 14, 2021 at 10:33:04PM -0300, Daniel Henrique Barboza wrote:
> spapr_numa_write_rtas_dt() is called from spapr_dt_rtas(), which in
> turned is called by spapr_build_fdt(). spapr_build_fdt() is called in
> two places: spapr_machine_reset() and do_client_architecture_support().
> When called in machine_reset() we're writing RTAS nodes with NUMA
> artifacts without going through CAS first.
>=20
> This is not an issue because we always write the same thing in DT, since
> we support just FORM1 NUMA affinity. With the upcoming FORM2 support,
> we're now reliant on guest choice to decide what to write.
>=20
> Instead of taking a guess (e.g. default to FORM1, switch to FORM2 if
> guest chooses it), postpone the writing of
> ibm,associativity-reference-points and ibm,max-associativity-domains
> until we're sure what was negotiated with the guest.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

I think it makes sense to fold this in with 1/8 moving the calculation
itself until after CAS.

This does make a (theoretical) functional change - it means that NUMA
information is not available before CAS, which it was before.  I think
that's very unlikely to break anything, but I wonder if we should make
it dependent on the machine version just to be safe.

> ---
>  hw/ppc/spapr_numa.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index 04a86f9b5b..e1a7f80076 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -379,6 +379,10 @@ static void spapr_numa_FORM1_write_rtas_dt(SpaprMach=
ineState *spapr,
>   */
>  void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int r=
tas)
>  {
> +    if (spapr_ovec_empty(spapr->ov5_cas)) {
> +        return;
> +    }
> +
>      spapr_numa_FORM1_write_rtas_dt(spapr, fdt, rtas);
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TDOjTuplJMm+tFcH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDIJjwACgkQbDjKyiDZ
s5J3vBAAsvZ1DXK1ItRbi5M8PmuqKivqRBkcLGxc+5JPGg7t8r19xgkZwlARqI1w
05KPQaHV10XcEFDhmin3+Qu5nUMsdD1NPIqNluNp63zLtjgdLbgCOwY+jLq93d/N
2iwWqTVm6M6JqQWefcy3SujkRBbb6LB3V8iNCTueJjt7LnTzpJCa98rXhf4u0Fb+
yoTEPDAlaAcj2Bk42eoNFCBP7RoL4HgA5oj2szW4SWnJ5dnHx9kR+NxMST436XvB
XXOkiv7ETJg8DKtRh2A1ZlBB2p4RuR/39VBqM6nkjcpU9a9ALZ00jTM/uVjDKgig
jPXQf4lDPGIa8n9uUGDzYx2+1uY+ZsDo6pWF8Udyk7t0keqEnCH16Uy0CedkduAE
qifyXnGClEZ8ola1Ftdpcpym5Y7GUHAgauAPtBhkjwsu2t92VvIVWhgoSIUZGNdj
lc+dtoFQzhWCfbfy3oluFCXZ8Hw1y6ZxDkbDoU2sfnyh7TDb3f9jjvXf86DE/22p
EvI73tclUcxiS5nd9nnJ3tIhWcyBINyfljlZrRx/4Z4KgdG/4FRZuYuXRqOib2Yd
V8tFAbjLqRPtCElUAfHY4mYH6B0zUT2hNIxvBt5avV3siDJx05u/x6ftCjn7PIz+
OMMUk+GqvsTMH9kdk3zWFIjtjwMjpNFoenBQcVs4pHDSlteWBf4=
=di0A
-----END PGP SIGNATURE-----

--TDOjTuplJMm+tFcH--

