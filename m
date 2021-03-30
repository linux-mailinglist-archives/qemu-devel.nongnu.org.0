Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1344534F55B
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 02:11:47 +0200 (CEST)
Received: from localhost ([::1]:59872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lROSY-0007sp-3a
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 20:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lROLK-0004F9-IY; Tue, 30 Mar 2021 20:04:18 -0400
Received: from ozlabs.org ([203.11.71.1]:36801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lROLH-0002uY-3I; Tue, 30 Mar 2021 20:04:18 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F96493khDz9shn; Wed, 31 Mar 2021 11:04:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617149049;
 bh=lMeLc46oRwdFVM2Nou8iBYKbwRZ3LSWyy8K2UZyiTfs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cLoOphmQNQrp9BisxqgNN7zKGdJRwlKQTGW4RpTSaNP9N32HdALreGpCogPTwgvzr
 Utg6r9WEqFy0N8c7Q8PV/cottZqiJoqlNK8KKhdlT+7FY+JPEYDrwm3Nn21Q/rpkhX
 y70EQz+ecJzwr9Md8DFmAYBgN6d8pMxzd2o9HmpY=
Date: Wed, 31 Mar 2021 10:49:32 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH v2 3/3] ppc: Enable 2nd DAWR support on p10
Message-ID: <YGO5DMzDd+TxW83x@yekko.fritz.box>
References: <20210329041906.213991-1-ravi.bangoria@linux.ibm.com>
 <20210329041906.213991-4-ravi.bangoria@linux.ibm.com>
 <YGFf0WxO+LRU1ysI@yekko.fritz.box>
 <9abc9f1a-f855-e7bd-4b83-2884f6595172@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1g7/c8FFHzCbaxEg"
Content-Disposition: inline
In-Reply-To: <9abc9f1a-f855-e7bd-4b83-2884f6595172@linux.ibm.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: qemu-ppc@nongnu.org, mikey@neuling.org, kvm@vger.kernel.org, mst@redhat.com,
 mpe@ellerman.id.au, cohuck@redhat.com, qemu-devel@nongnu.org, paulus@samba.org,
 clg@kaod.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--1g7/c8FFHzCbaxEg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 29, 2021 at 07:04:24PM +0530, Ravi Bangoria wrote:
> Hi David,
>=20
> > > @@ -241,6 +241,31 @@ static void spapr_dt_pa_features(SpaprMachineSta=
te *spapr,
> > >           /* 60: NM atomic, 62: RNG */
> > >           0x80, 0x00, 0x80, 0x00, 0x00, 0x00, /* 60 - 65 */
> > >       };
> > > +    uint8_t pa_features_310[] =3D { 66, 0,
> > > +        /* 0: MMU|FPU|SLB|RUN|DABR|NX, 1: fri[nzpm]|DABRX|SPRG3|SLB0=
|PP110 */
> > > +        /* 2: VPM|DS205|PPR|DS202|DS206, 3: LSD|URG, SSO, 5: LE|CFAR=
|EB|LSQ */
> > > +        0xf6, 0x1f, 0xc7, 0xc0, 0x80, 0xf0, /* 0 - 5 */
> > > +        /* 6: DS207 */
> > > +        0x80, 0x00, 0x00, 0x00, 0x00, 0x00, /* 6 - 11 */
> > > +        /* 16: Vector */
> > > +        0x00, 0x00, 0x00, 0x00, 0x80, 0x00, /* 12 - 17 */
> > > +        /* 18: Vec. Scalar, 20: Vec. XOR, 22: HTM */
> > > +        0x80, 0x00, 0x80, 0x00, 0x00, 0x00, /* 18 - 23 */
> > > +        /* 24: Ext. Dec, 26: 64 bit ftrs, 28: PM ftrs */
> > > +        0x80, 0x00, 0x80, 0x00, 0x80, 0x00, /* 24 - 29 */
> > > +        /* 30: MMR, 32: LE atomic, 34: EBB + ext EBB */
> > > +        0x80, 0x00, 0x80, 0x00, 0xC0, 0x00, /* 30 - 35 */
> > > +        /* 36: SPR SO, 38: Copy/Paste, 40: Radix MMU */
> > > +        0x80, 0x00, 0x80, 0x00, 0x80, 0x00, /* 36 - 41 */
> > > +        /* 42: PM, 44: PC RA, 46: SC vec'd */
> > > +        0x80, 0x00, 0x80, 0x00, 0x80, 0x00, /* 42 - 47 */
> > > +        /* 48: SIMD, 50: QP BFP, 52: String */
> > > +        0x80, 0x00, 0x80, 0x00, 0x80, 0x00, /* 48 - 53 */
> > > +        /* 54: DecFP, 56: DecI, 58: SHA */
> > > +        0x80, 0x00, 0x80, 0x00, 0x80, 0x00, /* 54 - 59 */
> > > +        /* 60: NM atomic, 62: RNG, 64: DAWR1 */
> > > +        0x80, 0x00, 0x80, 0x00, 0x00, 0x00, /* 60 - 65 */
> > > +    };
> >=20
> > I don't see any point adding pa_features_310: it's identical to
> > pa_features_300, AFAICT.
>=20
> Sure. The only difference is in the comment part: /* ... 64: DAWR1  */
> I'll update pa_features_300 with something like:
>=20
>         /* ... 64: DAWR1 (ISA 3.1) */
>=20
> and reuse pa_features_300.
>=20
> [...]
>=20
> > > +static void cap_dawr1_apply(SpaprMachineState *spapr, uint8_t val,
> > > +                               Error **errp)
> > > +{
> > > +    if (!val) {
> > > +        return; /* Disable by default */
> > > +    }
> > > +
> > > +    if (tcg_enabled()) {
> > > +        error_setg(errp,
> > > +                "DAWR1 not supported in TCG. Try appending -machine =
cap-dawr1=3Doff");
> >=20
> > I don't love this.  Is anyone working on DAWR1 emulation for POWER10?
>=20
> No. Infact DAWR0 is also not enabled in TCG mode.

Huh.  Good point.

>=20
> [...]
>=20
> > >   static void gen_spr_970_dbg(CPUPPCState *env)
> > >   {
> > >       /* Breakpoints */
> > > @@ -8727,7 +8742,7 @@ static void init_proc_POWER8(CPUPPCState *env)
> > >       /* Common Registers */
> > >       init_proc_book3s_common(env);
> > >       gen_spr_sdr1(env);
> > > -    gen_spr_book3s_207_dbg(env);
> > > +    gen_spr_book3s_310_dbg(env);
> >=20
> > This should surely be in init_proc_POWER10, not init_proc_POWER8.
>=20
> Sure.
>=20
> Thanks for the review,
> Ravi
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1g7/c8FFHzCbaxEg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBjuQwACgkQbDjKyiDZ
s5JAhQ//UWKdv4Eg6tUDxKky6b7FYqMHNNskXbTpOLe7OpAhEpC7d+fR/nTnJ0oe
YmFKBXXbyHPbgiHN6A1yO6G5fo25ypDs0S0BPxBBpCYUH213Sg6Wn8rPK+ELafLQ
C97Wj5RTaRXjoT+zTWWcJLExJ0Lf+wD/ECQTHU6Ya586jOinYp4G6fkV+7WGTTBo
U3/QwBWJf4z73pzhs3UGdcPVRFhmF4nlxiqK773aqvR5OxHNvwe1jsGX1rwWt9sN
F1j7bd5hjGZ/NQ5R9V3vvUPZvuT6hLbZeeDfbAzLPj38HFfeNmSt9ppKqxJ12Dg4
53DoOb4Sm2wnH6VbCKCn8AgFD8FBhKM0meu0W7aYXwVXMP2aKFMOZRazXFHi5V+f
C3/RLs/8PJyb9ZvL/CZbTBEu6xiRYHRWhwf/yeEjZs2lHUO4X2M1TvlegBXU0IXs
0Idvh/u7Mqv7zPVcSFdi4nd6/6OuoDP2sTauBXGHtOjSlktrcUsWf6tjOLaVxiDQ
OO5KKu1bU1QX/qJx2AStRLziAGJ8nj/5uxDTsWHaRPfVdEnFhv7UrdyAVH+f/qn0
GBD1nMzpitj8jw2SfmL6E4MkFi/Y63WJrr0z8HDOyMikSnoQuh6CuUb9izB24SBJ
34jqUUXks29AHWLHCW9uwqe5RIVJLIMDlrG82Pv5GotnricMTi4=
=+xCs
-----END PGP SIGNATURE-----

--1g7/c8FFHzCbaxEg--

