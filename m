Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 074BA4411D5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 02:33:55 +0100 (CET)
Received: from localhost ([::1]:41992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhMCw-0007CU-0F
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 21:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mhM7I-0004Wn-Jb; Sun, 31 Oct 2021 21:28:04 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:56111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mhM76-0001kG-IP; Sun, 31 Oct 2021 21:28:04 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HjFlM6QCdz4xbd; Mon,  1 Nov 2021 12:27:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1635730063;
 bh=kWAWs3mIlyM7PhiryAXsNIOJI4GBYjPSpwq8u1NwX+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UrS7/47PT2/F+cNwWAgLkH8XcVP9DgvrHB0jveMIBH872HYto6SSDsDjsXDcgCtM0
 ISPcXbw/HfpHFo17puI+dMImBHUgTveIw0TajBHe6KktAokgKntoT2BgdzkBFyV6jD
 OcpOnPShmTakcp8hiqYIiNC6RGlFe+ontiZqvcc4=
Date: Mon, 1 Nov 2021 11:16:59 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 07/34] target/ppc: Implement cntlzdm
Message-ID: <YX8x+1qf3V8RFFSB@yekko>
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
 <20211029202424.175401-8-matheus.ferst@eldorado.org.br>
 <65bd3052-fbe9-33ff-585c-b5259ebd46e0@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DjHSsOYz/eYKl+UG"
Content-Disposition: inline
In-Reply-To: <65bd3052-fbe9-33ff-585c-b5259ebd46e0@linaro.org>
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: lucas.castro@eldorado.org.br, qemu-devel@nongnu.org, groug@kaod.org,
 luis.pires@eldorado.org.br, qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--DjHSsOYz/eYKl+UG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 30, 2021 at 02:17:07PM -0700, Richard Henderson wrote:
> On 10/29/21 1:23 PM, matheus.ferst@eldorado.org.br wrote:
> > From: Luis Pires <luis.pires@eldorado.org.br>
> >=20
> > Implement the following PowerISA v3.1 instruction:
> > cntlzdm: Count Leading Zeros Doubleword Under Bit Mask
> >=20
> > Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> > Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
> > Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> > ---
> > v2:
> > - Inline implementation of cntlzdm
> > ---
> >   target/ppc/insn32.decode                   |  1 +
> >   target/ppc/translate/fixedpoint-impl.c.inc | 36 ++++++++++++++++++++++
> >   2 files changed, 37 insertions(+)
> >=20
> > diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> > index 9cb9fc00b8..221cb00dd6 100644
> > --- a/target/ppc/insn32.decode
> > +++ b/target/ppc/insn32.decode
> > @@ -203,6 +203,7 @@ ADDPCIS         010011 ..... ..... .......... 00010=
 .   @DX
> >   ## Fixed-Point Logical Instructions
> >   CFUGED          011111 ..... ..... ..... 0011011100 -   @X
> > +CNTLZDM         011111 ..... ..... ..... 0000111011 -   @X
> >   ### Float-Point Load Instructions
> > diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/tr=
anslate/fixedpoint-impl.c.inc
> > index 0d9c6e0996..c9e9ae35df 100644
> > --- a/target/ppc/translate/fixedpoint-impl.c.inc
> > +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> > @@ -413,3 +413,39 @@ static bool trans_CFUGED(DisasContext *ctx, arg_X =
*a)
> >   #endif
> >       return true;
> >   }
> > +
> > +#if defined(TARGET_PPC64)
> > +static void do_cntlzdm(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 mask)
> > +{
> > +    TCGv_i64 tmp;
> > +    TCGLabel *l1;
> > +
> > +    tmp =3D tcg_temp_local_new_i64();
> > +    l1 =3D gen_new_label();
> > +
> > +    tcg_gen_and_i64(tmp, src, mask);
> > +    tcg_gen_clzi_i64(tmp, tmp, 64);
> > +
> > +    tcg_gen_brcondi_i64(TCG_COND_EQ, tmp, 0, l1);
> > +
> > +    tcg_gen_subfi_i64(tmp, 64, tmp);
> > +    tcg_gen_shr_i64(tmp, mask, tmp);
> > +    tcg_gen_ctpop_i64(tmp, tmp);
> > +
> > +    gen_set_label(l1);
> > +
> > +    tcg_gen_mov_i64(dst, tmp);
>=20
> This works, but a form without brcond would be better (due to how poorly =
tcg
> handles basic blocks).
>=20
> How about
>=20
>     tcg_gen_clzi_i64(tmp, tmp, 0);
>=20
>     tcg_gen_xori_i64(tmp, tmp, 63);
>     tcg_gen_shr_i64(tmp, mask, tmp);
>     tcg_gen_shri_i64(tmp, tmp, 1);
>=20
>     tcg_gen_ctpop_i64(dst, tmp);

I've applied this to ppc-for-6.2.  You can make this improvement as a
followup if you want.

>=20
> The middle 3 operations perform a shift between [1-64], such that we are =
assured of 0 for 64.
>=20
> Either way,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>=20
>=20
> r~
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DjHSsOYz/eYKl+UG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmF/MfsACgkQbDjKyiDZ
s5KCtBAAtyZOcfi1jy8H1TvmP6+EZWSnN4tPj/TZBjoJYhV/PfIzDQB8tjNkfIPQ
HNHqOe174rqHXtO+96RxnyHfet/YdmUAu+vbvM/lywQ7cJ4wKA0ZSsJQsDEOkf+T
Cgi2mVxtzOI8HK0DWfLLiKrMxEqnLedJ/sJmKMJ8ClnT3G/sFs7VNLj7vsa2rNZh
VEVw/X3I+4qMK4K+dD2P939DXRZDFDsFS8CtU2Ea4LuUXkJeTkFlmtLX9wNkXPTo
Jq9cnzQUZXIEH3pMaA5AOZ7gTLojTb+QXGMi0sXwUEKkcB+q15KpAYcPKoxuqugS
opcoP45nGiFva5qyorvTLdbMR8//NYlU+dRqdU7VX1hhSw0TaoK1yFiT0lx/kJRI
WQ/RAqmtOr4ID1+AgxvBB+jWHsi8uxTHQkgYU1eMiPppoGfPQdfJcFrz/L99BK8P
9dYskXfoKbtBxaJM2+D7fJ7sf4hILKuue5twJ294Vg8rU8jlcjZvA+jQXYR3cdTl
JokV0kyYIliJvJt0D5CpgCHsmM3WoqXhXkjtlAtF2M3n3GTllNRyByN4Fm/Yqs1M
EwKyCRUP+PHwFs82NpRppapHwQ9pmqxA1N0mTbA2lGMh4sn5KCuF6gBz/qi/CD1h
COx2C8AV8sYCQ4mMgNvSUcqVTb2tqTuLkng/oF3tf5mFH3VRO1g=
=JN6U
-----END PGP SIGNATURE-----

--DjHSsOYz/eYKl+UG--

