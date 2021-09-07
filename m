Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2905F4021C4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 03:22:29 +0200 (CEST)
Received: from localhost ([::1]:39902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNPoi-00074l-4O
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 21:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNPlA-0004no-IA; Mon, 06 Sep 2021 21:18:48 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:38129 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNPl8-0007Cu-K2; Mon, 06 Sep 2021 21:18:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630977522;
 bh=qWH41vaz3kAk/ePRI/TOpFnC8Dt9k6Lg3GUe7Fx5nNs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m4vsj28BihP5DokuBhqcfELYf6s3LmMBzLsX4FUnK+bmXeLu5zd9sGQTPjHIIFdaC
 VqJGBjsgptaJi2xJHSvlBpSketHujlQLDtcvGzIa/HafazVozfBYKq4ev2+GUkKfUG
 OadN/HH5NAznW6MpK3zHxRGxQDyPizi/Fa7Gvbiw=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H3S8L526nz9shn; Tue,  7 Sep 2021 11:18:42 +1000 (AEST)
Date: Tue, 7 Sep 2021 11:12:35 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v4 2/5] spapr_numa.c: split FORM1 code into helpers
Message-ID: <YTa8g/j5FHonCPR8@yekko>
References: <20210827092455.125411-1-danielhb413@gmail.com>
 <20210827092455.125411-3-danielhb413@gmail.com>
 <YTaykCjgeonaGS2x@yekko>
 <e7436956-6bf6-a15d-b137-bdc1b09361a8@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="w6FG26qljlQsJcfF"
Content-Disposition: inline
In-Reply-To: <e7436956-6bf6-a15d-b137-bdc1b09361a8@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--w6FG26qljlQsJcfF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 06, 2021 at 09:50:36PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 9/6/21 9:30 PM, David Gibson wrote:
> > On Fri, Aug 27, 2021 at 06:24:52AM -0300, Daniel Henrique Barboza wrote:
> > > The upcoming FORM2 NUMA affinity will support asymmetric NUMA topolog=
ies
> > > and doesn't need be concerned with all the legacy support for older
> > > pseries FORM1 guests.
> > >=20
> > > We're also not going to calculate associativity domains based on numa
> > > distance (via spapr_numa_define_associativity_domains) since the
> > > distances will be written directly into new DT properties.
> > >=20
> > > Let's split FORM1 code into its own functions to allow for easier
> > > insertion of FORM2 logic later on.
> > >=20
> > > Reviewed-by: Greg Kurz <groug@kaod.org>
> > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > ---
> > >   hw/ppc/spapr_numa.c | 61 +++++++++++++++++++++++++++++-------------=
---
> > >   1 file changed, 39 insertions(+), 22 deletions(-)
> > >=20
> > > diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> > > index 779f18b994..04a86f9b5b 100644
> > > --- a/hw/ppc/spapr_numa.c
> > > +++ b/hw/ppc/spapr_numa.c
> > > @@ -155,6 +155,32 @@ static void spapr_numa_define_associativity_doma=
ins(SpaprMachineState *spapr)
> > >   }
> > > +/*
> > > + * Set NUMA machine state data based on FORM1 affinity semantics.
> > > + */
> > > +static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
> > > +                                           MachineState *machine)
> > > +{
> > > +    bool using_legacy_numa =3D spapr_machine_using_legacy_numa(spapr=
);
> > > +
> > > +    /*
> > > +     * Legacy NUMA guests (pseries-5.1 and older, or guests with only
> > > +     * 1 NUMA node) will not benefit from anything we're going to do
> > > +     * after this point.
> > > +     */
> > > +    if (using_legacy_numa) {
> > > +        return;
> > > +    }
> >=20
> > My only concern with this patch is that handling the
> > "using_legacy_numa" case might logically belong outside the FORM1
> > code.  I mean, I'm pretty sure using_legacy_numa implies FORM1 in
> > practice, but conceptually it seems like a more fundamental question
> > than the DT encoding of the NUMA information.
>=20
> I'll carry on this suggestion for the next spin, v6, given that the v5 I =
sent
> a few minutes ago is also verifying legacy numa in FORM1 code.

Ok.  I should note that I'm not saying what you have now is definitely
wrong, it just looks a bit odd to me.  If you have a rationale for
doing it this way, go ahead and tell me, rather than changing it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--w6FG26qljlQsJcfF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmE2vIMACgkQbDjKyiDZ
s5IG1w//Y+hnkGvpqgWE25NT16cMa7kHw6GlAoXlyZwpeUxOaSP5+OCnmyqxoh6B
ZswMK5vOmlkZXr93LEBljHUxqNB6MBRrInJsNfhduQjP8RQFmZP+ET9vEihegeL6
VqFP4tYw5IAXAdeBJIBV/vN0uQX6at15mFOvEvLqVlTtW99uqp5QMLZxpsmndFW/
LL4bEQDl/1/67kMWrW3amnLi1xf9gpaxmO8AZEklL2sjZe4RPhJuKFqIF8XLLHQX
NfTmiJ/WfDDN7beiGveugGQ9gwDOd3nI5uORmsn2K+lA6Z/LrTN3Cisa/l3Q6WRw
KyH7SrmfIxZY/0f2Nf34liKmOoRbzzcixn/5Z5V1lSeztvPw0dvqOPD3CPBN7BEQ
vgQJGnzhcnu+4H5JVkGjiL87s+V2aYvmhk7SHfwF+yS0+CDQgH5PeohSGUs/pVP+
QVyB1QVKqvNqkb5xD1R0txgAu5rLVCNzE/aV2I2SummTu14bfQla3ltVF9n5GQY5
5yiqJKjGTC1QfZK3C+JlvWc4Cl+o+Wdjljl3lqLABiPqxWmY3Y00qIMW6MQfz5SV
qPGlYWfWF26uIiDS4WhJg0N5C/hURw2KrHXKfaAkNKYeLd+1XWranVaivkpAjY52
KpIZ6lritaNCtrf/TBpcqtcKxY2BCVEZhML+67gJFvZH8/byn/A=
=wrDO
-----END PGP SIGNATURE-----

--w6FG26qljlQsJcfF--

