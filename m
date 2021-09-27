Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 314D0418E94
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 07:14:05 +0200 (CEST)
Received: from localhost ([::1]:57094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUixo-0006Ik-3N
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 01:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mUisg-00043G-7T; Mon, 27 Sep 2021 01:08:47 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:40525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mUisc-0000JJ-TK; Mon, 27 Sep 2021 01:08:44 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HHrJQ3rrJz4xZx; Mon, 27 Sep 2021 15:08:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632719318;
 bh=j6fM17bE1Wy0G6iB2I1Epg7qTZMFHwFkVlOk3uQ/Y0Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ux2iH7bvKSVdAcG7s7F9+Pnwk7eVoVU3RMaLAGz8+zaWH/sygT7Hw0rD2EhL1qNK0
 lHYq1MuRhRdOyiKKAGhGvnCc4LLnnpLDxpPzfhYGZzSddOpaqUUwT2vhscaOrJziag
 Kgnj9qj1lmeRdTqmlMHUFphDl4rxBa6AmfAhmx9w=
Date: Mon, 27 Sep 2021 15:08:34 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3 02/15] target/ppc: add user write access control for
 PMU SPRs
Message-ID: <YVFR0kOUJ2yA6+hg@yekko>
References: <20210903203116.80628-1-danielhb413@gmail.com>
 <20210903203116.80628-3-danielhb413@gmail.com>
 <YTbCnSz86hsUAF/+@yekko>
 <587d197b-25a4-c5c2-3c3c-4132ac4cdf6b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="51BIjM6AUQDCs2MS"
Content-Disposition: inline
In-Reply-To: <587d197b-25a4-c5c2-3c3c-4132ac4cdf6b@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--51BIjM6AUQDCs2MS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 23, 2021 at 11:39:14AM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 9/6/21 22:38, David Gibson wrote:
> > On Fri, Sep 03, 2021 at 05:31:03PM -0300, Daniel Henrique Barboza wrote:
> > > The PMU needs to enable writing of its uregs to userspace, otherwise
> > > Perf applications will not able to setup the counters correctly. This
> > > patch enables user space writing of all PMU uregs.
> > >=20
> > > MMCR0 is a special case because its userspace writing access is contr=
olled
> > > by MMCR0_PMCC bits. There are 4 configurations available (0b00, 0b01,
> > > 0b10 and 0b11) but for our purposes here we're handling only
> > > MMCR0_PMCC =3D 0b00. In this case, if userspace tries to write MMCR0,=
 a
> > > hypervisor emulation assistance interrupt occurs.
> > >=20
> > > This is being done by adding HFLAGS_PMCCCLEAR to hflags. This flag
> > > indicates if MMCR0_PMCC is cleared (0b00), and a new 'pmcc_clear' fla=
g in
> > > DisasContext allow us to use it in spr_write_MMCR0_ureg().
> > >=20
> > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > ---
> > >   target/ppc/cpu.h         |  1 +
> > >   target/ppc/cpu_init.c    | 18 +++++++-------
> > >   target/ppc/helper_regs.c |  3 +++
> > >   target/ppc/spr_tcg.h     |  3 ++-
> > >   target/ppc/translate.c   | 53 +++++++++++++++++++++++++++++++++++++=
++-
> > >   5 files changed, 67 insertions(+), 11 deletions(-)
> > >=20
> > > diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> > > index f68bb8d8aa..8dfbb62022 100644
> > > --- a/target/ppc/cpu.h
> > > +++ b/target/ppc/cpu.h
> > > @@ -616,6 +616,7 @@ enum {
> > >       HFLAGS_SE =3D 10,  /* MSR_SE -- from elsewhere on embedded ppc =
*/
> > >       HFLAGS_FP =3D 13,  /* MSR_FP */
> > >       HFLAGS_PR =3D 14,  /* MSR_PR */
> > > +    HFLAGS_PMCCCLEAR =3D 15, /* PMU MMCR0 PMCC equal to 0b00 */
> > >       HFLAGS_VSX =3D 23, /* MSR_VSX if cpu has VSX */
> > >       HFLAGS_VR =3D 25,  /* MSR_VR if cpu has VRE */
> > > diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> > > index 9efc6c2d87..bb5ea04c61 100644
> > > --- a/target/ppc/cpu_init.c
> > > +++ b/target/ppc/cpu_init.c
> > > @@ -6867,7 +6867,7 @@ static void register_book3s_pmu_sup_sprs(CPUPPC=
State *env)
> > >   static void register_book3s_pmu_user_sprs(CPUPPCState *env)
> > >   {
> > >       spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
> > > -                 &spr_read_MMCR0_ureg, SPR_NOACCESS,
> > > +                 &spr_read_MMCR0_ureg, &spr_write_MMCR0_ureg,
> > >                    &spr_read_ureg, &spr_write_ureg,
> > >                    0x00000000);
> > >       spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
> > > @@ -6875,31 +6875,31 @@ static void register_book3s_pmu_user_sprs(CPU=
PPCState *env)
> > >                    &spr_read_ureg, &spr_write_ureg,
> > >                    0x00000000);
> > >       spr_register(env, SPR_POWER_UMMCRA, "UMMCRA",
> > > -                 &spr_read_ureg, SPR_NOACCESS,
> > > +                 &spr_read_ureg, &spr_write_ureg,
> > >                    &spr_read_ureg, &spr_write_ureg,
> > >                    0x00000000);
> > >       spr_register(env, SPR_POWER_UPMC1, "UPMC1",
> > > -                 &spr_read_ureg, SPR_NOACCESS,
> > > +                 &spr_read_ureg, &spr_write_ureg,
> >=20
> > Surely this can't be write.  AFAICT spr_write_ureg() will
> > unconditionally allow full userspace write access.  That can't be
> > right - otherwise the OS could never safely use the PMU for itself.
>=20
> My assumption here was that the user mode SPRs (UMMCR* and UPMC*) were cr=
eated to
> allow userspace read/write of PMU regs, while the regular regs (MMCR* and=
 PMC*)
> are the supermode privileged SPRs that can't be written by userspace. At =
least this
> is my understanding from reading commit fd51ff6328e3d98158 that introduce=
d these
> userspace PMC regs.

Sure, but my point is that these registers are only userspace
accessible under certain conditions, IIUC.  spr_write_ureg() doesn't
test for those conditions, so it will *always* allow write access.

> The reason why these are marked as SPR_NOACCESS is because we didn't both=
ered
> writing into them from userspace because we had no PMU logic to work
> with.

[snip]
> > > diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> > > index b2ead144d1..0babde3131 100644
> > > --- a/target/ppc/translate.c
> > > +++ b/target/ppc/translate.c
> > > @@ -175,6 +175,7 @@ struct DisasContext {
> > >       bool spe_enabled;
> > >       bool tm_enabled;
> > >       bool gtse;
> > > +    bool pmcc_clear;
> > >       ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
> > >       int singlestep_enabled;
> > >       uint32_t flags;
> > > @@ -561,7 +562,56 @@ void spr_write_ureg(DisasContext *ctx, int sprn,=
 int gprn)
> > >   {
> > >       gen_store_spr(sprn + 0x10, cpu_gpr[gprn]);
> > >   }
> > > -#endif
> > > +
> > > +void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
> >=20
> >=20
> > Could you put this def in the PMU specific file, rather than the
> > enormous translate.c?
>=20
> Moving into the existing power8_pmu.c helper is annoying because, being a=
 helper file,
> there is no access to the whole DisasContext declaration (that is open co=
ded in
> translate.c), and other internal translate.c data like cpu_grp[].

Ah, right.  We should probably make that easier someday, but it's not
reasonbly in scope for this series.

> What I was able to do is create a new file in the target/ppc/translate/ d=
ir,
> power8-pmu-regs.c.impl, and moved all these declarations over there. At v=
ery least we're
> not overloading translate.c.

Ah, nice.

> Eldorado, is that ok with you guys? I'm aware that this dir was holding n=
ew
> decode-tree insns implementations but, in this case, it would hold old fo=
rmat
> spr_read/spr_write code.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--51BIjM6AUQDCs2MS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFRUdEACgkQbDjKyiDZ
s5L0MA/+N2IPA/J2YRI0sf6IaryTVOEgZCjOxuY0H+WBdDun+Snskx49/y9gSD1u
NfYOrCdzNKxavMhrvtFwWZSHpr3NrKs0Y/5Ci2/Wf0oPLAaXYBmtL14nFJaH1sXn
8L2tDOUSpgfFOjwU1bFbAM+2zDjCzSNLbiR+FnKm4AQaTMzsEMSxjgVBZ5Oelsfg
GY5iL9FdjJ7JzjaTEQh+lVS60DUsIE1DnFgI8bzNOyg3PcEJHRoS7oimE8NUD1fL
2rIIbcIbuXeBD1TBAgi95qTJCSfGdi+fNsodlq2P3pjW9EC3iTIpai7BRUSuHk8L
Y5ZEgHHIqcIH6BovyLOdjU5gbadklRGG7yUaseJlrBxZuk/yon8J74VG453XZoU3
sGEW4E/qyuiJx8x3FvizI2Ziv2pNoTEhsX+/bBGGrFRJG07vPLjsxt9Ck4B3hWnS
jVesg7DeNNsDSlsFLZcgH/a+tR8kpm4Kc1FZrXKJpsxqlqllKtZfBQVeP9rP9JRS
gDcrEGd/WVgfl3cICwsIk0Jbmh5KPNKfV3jkQ0Z7tv6rrN5yHo7PNl+XjPgI9Wh7
NriGzQ7/XXCSoO10R79DlWNR7L21NED434fWDszBmTySZ5uspTo4drHU96AC5bUO
pD8Xm6KzuNzc0/Y4y0qr70tv+clRHMqnR33RQeO8wWuDq1fTWt4=
=KmP7
-----END PGP SIGNATURE-----

--51BIjM6AUQDCs2MS--

