Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA30E37F235
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 06:31:19 +0200 (CEST)
Received: from localhost ([::1]:59974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh30I-0000ad-Tt
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 00:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sf-0007Ns-TQ; Thu, 13 May 2021 00:23:27 -0400
Received: from ozlabs.org ([203.11.71.1]:59095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sa-0004fV-LL; Thu, 13 May 2021 00:23:24 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fgdmt20C7z9t5K; Thu, 13 May 2021 14:22:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620879774;
 bh=7iIibLVOHHHUfKb3DCLDepDcRWzlmfVdSP3ke/Z3sgg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o0VQenuebJh4w8piXuE/18ODUR93nuiIOr6QFOA3YolVCHNkeZPua6OKBxZskU0Zy
 5h8TGJhliLPepZ9tPSQqB/cBsNxGRdmkbcAZaytgacjFzrVyGitVpBG4m90vFwo+jU
 67Cn9eCudW6IRbvD8YCqA02MxquJ3gugItK2kr5Q=
Date: Thu, 13 May 2021 14:14:28 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Subject: Re: [PATCH v4 10/31] target/ppc: Introduce gen_icount_io_start
Message-ID: <YJynpKES3pl7iXnj@yekko>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
 <20210512185441.3619828-11-matheus.ferst@eldorado.org.br>
 <18ff1d20-264e-125c-42ed-596f455ec5ad@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VkkVKHQof9J1zNlH"
Content-Disposition: inline
In-Reply-To: <18ff1d20-264e-125c-42ed-596f455ec5ad@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 luis.pires@eldorado.org.br, qemu-ppc@nongnu.org, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--VkkVKHQof9J1zNlH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 04:21:13PM -0300, Matheus K. Ferst wrote:
> On 12/05/2021 15:54, matheus.ferst@eldorado.org.br wrote:
> > From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> >=20
> > Create a function to handle the details for interacting with icount.
> >=20
> > Force the exit from the tb via DISAS_TOO_MANY, which allows chaining
> > to the next tb, where the code emitted for gen_tb_start() will
> > determine if we must exit.  We can thus remove any matching
> > conditional call to gen_stop_exception.
> >=20
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> > ---
> >   target/ppc/translate.c | 174 +++++++++--------------------------------
> >   1 file changed, 39 insertions(+), 135 deletions(-)
> >=20
> > diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> > index 1c02e21a56..f6410dc76c 100644
> > --- a/target/ppc/translate.c
> > +++ b/target/ppc/translate.c
> > @@ -301,6 +301,20 @@ static void gen_exception_nip(DisasContext *ctx, u=
int32_t excp,
> >       ctx->base.is_jmp =3D DISAS_NORETURN;
> >   }
> > +static void gen_icount_io_start(DisasContext *ctx)
> > +{
> > +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > +        gen_io_start();
> > +        /*
> > +         * An I/O instruction must be last in the TB.
> > +         * Chain to the next TB, and let the code from gen_tb_start
> > +         * decide if we need to return to the main loop.
> > +         * Doing this first also allows this value to be overridden.
> > +         */
> > +        ctx->base.is_jmp =3D DISAS_TOO_MANY;
> > +    }
> > +}
> > +
> >   /*
> >    * Tells the caller what is the appropriate exception to generate and=
 prepares
> >    * SPR registers for this exception.
> > @@ -538,24 +552,14 @@ static void spr_write_ureg(DisasContext *ctx, int=
 sprn, int gprn)
> >   #if !defined(CONFIG_USER_ONLY)
> >   static void spr_read_decr(DisasContext *ctx, int gprn, int sprn)
> >   {
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_io_start();
> > -    }
> > +    gen_icount_io_start(ctx);
> >       gen_helper_load_decr(cpu_gpr[gprn], cpu_env);
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_stop_exception(ctx);
> > -    }
> >   }
> >   static void spr_write_decr(DisasContext *ctx, int sprn, int gprn)
> >   {
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_io_start();
> > -    }
> > +    gen_icount_io_start(ctx);
> >       gen_helper_store_decr(cpu_env, cpu_gpr[gprn]);
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_stop_exception(ctx);
> > -    }
> >   }
> >   #endif
> > @@ -563,24 +567,14 @@ static void spr_write_decr(DisasContext *ctx, int=
 sprn, int gprn)
> >   /* Time base */
> >   static void spr_read_tbl(DisasContext *ctx, int gprn, int sprn)
> >   {
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_io_start();
> > -    }
> > +    gen_icount_io_start(ctx);
> >       gen_helper_load_tbl(cpu_gpr[gprn], cpu_env);
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_stop_exception(ctx);
> > -    }
> >   }
> >   static void spr_read_tbu(DisasContext *ctx, int gprn, int sprn)
> >   {
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_io_start();
> > -    }
> > +    gen_icount_io_start(ctx);
> >       gen_helper_load_tbu(cpu_gpr[gprn], cpu_env);
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_stop_exception(ctx);
> > -    }
> >   }
> >   ATTRIBUTE_UNUSED
> > @@ -598,24 +592,14 @@ static void spr_read_atbu(DisasContext *ctx, int =
gprn, int sprn)
> >   #if !defined(CONFIG_USER_ONLY)
> >   static void spr_write_tbl(DisasContext *ctx, int sprn, int gprn)
> >   {
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_io_start();
> > -    }
> > +    gen_icount_io_start(ctx);
> >       gen_helper_store_tbl(cpu_env, cpu_gpr[gprn]);
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_stop_exception(ctx);
> > -    }
> >   }
> >   static void spr_write_tbu(DisasContext *ctx, int sprn, int gprn)
> >   {
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_io_start();
> > -    }
> > +    gen_icount_io_start(ctx);
> >       gen_helper_store_tbu(cpu_env, cpu_gpr[gprn]);
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_stop_exception(ctx);
> > -    }
> >   }
> >   ATTRIBUTE_UNUSED
> > @@ -634,80 +618,45 @@ static void spr_write_atbu(DisasContext *ctx, int=
 sprn, int gprn)
> >   ATTRIBUTE_UNUSED
> >   static void spr_read_purr(DisasContext *ctx, int gprn, int sprn)
> >   {
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_io_start();
> > -    }
> > +    gen_icount_io_start(ctx);
> >       gen_helper_load_purr(cpu_gpr[gprn], cpu_env);
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_stop_exception(ctx);
> > -    }
> >   }
> >   static void spr_write_purr(DisasContext *ctx, int sprn, int gprn)
> >   {
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_io_start();
> > -    }
> > +    gen_icount_io_start(ctx);
> >       gen_helper_store_purr(cpu_env, cpu_gpr[gprn]);
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_stop_exception(ctx);
> > -    }
> >   }
> >   /* HDECR */
> >   static void spr_read_hdecr(DisasContext *ctx, int gprn, int sprn)
> >   {
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_io_start();
> > -    }
> > +    gen_icount_io_start(ctx);
> >       gen_helper_load_hdecr(cpu_gpr[gprn], cpu_env);
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_stop_exception(ctx);
> > -    }
> >   }
> >   static void spr_write_hdecr(DisasContext *ctx, int sprn, int gprn)
> >   {
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_io_start();
> > -    }
> > +    gen_icount_io_start(ctx);
> >       gen_helper_store_hdecr(cpu_env, cpu_gpr[gprn]);
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_stop_exception(ctx);
> > -    }
> >   }
> >   static void spr_read_vtb(DisasContext *ctx, int gprn, int sprn)
> >   {
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_io_start();
> > -    }
> > +    gen_icount_io_start(ctx);
> >       gen_helper_load_vtb(cpu_gpr[gprn], cpu_env);
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_stop_exception(ctx);
> > -    }
> >   }
> >   static void spr_write_vtb(DisasContext *ctx, int sprn, int gprn)
> >   {
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_io_start();
> > -    }
> > +    gen_icount_io_start(ctx);
> >       gen_helper_store_vtb(cpu_env, cpu_gpr[gprn]);
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_stop_exception(ctx);
> > -    }
> >   }
> >   static void spr_write_tbu40(DisasContext *ctx, int sprn, int gprn)
> >   {
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_io_start();
> > -    }
> > +    gen_icount_io_start(ctx);
> >       gen_helper_store_tbu40(cpu_env, cpu_gpr[gprn]);
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_stop_exception(ctx);
> > -    }
> >   }
> >   #endif
> > @@ -915,71 +864,41 @@ static void spr_write_601_ubatl(DisasContext *ctx=
, int sprn, int gprn)
> >   #if !defined(CONFIG_USER_ONLY)
> >   static void spr_read_40x_pit(DisasContext *ctx, int gprn, int sprn)
> >   {
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_io_start();
> > -    }
> > +    gen_icount_io_start(ctx);
> >       gen_helper_load_40x_pit(cpu_gpr[gprn], cpu_env);
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_stop_exception(ctx);
> > -    }
> >   }
> >   static void spr_write_40x_pit(DisasContext *ctx, int sprn, int gprn)
> >   {
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_io_start();
> > -    }
> > +    gen_icount_io_start(ctx);
> >       gen_helper_store_40x_pit(cpu_env, cpu_gpr[gprn]);
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_stop_exception(ctx);
> > -    }
> >   }
> >   static void spr_write_40x_dbcr0(DisasContext *ctx, int sprn, int gprn)
> >   {
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_io_start();
> > -    }
> > +    gen_icount_io_start(ctx);
> >       gen_store_spr(sprn, cpu_gpr[gprn]);
> >       gen_helper_store_40x_dbcr0(cpu_env, cpu_gpr[gprn]);
> >       /* We must stop translation as we may have rebooted */
> >       gen_stop_exception(ctx);
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_stop_exception(ctx);
> > -    }
> >   }
> >   static void spr_write_40x_sler(DisasContext *ctx, int sprn, int gprn)
> >   {
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_io_start();
> > -    }
> > +    gen_icount_io_start(ctx);
> >       gen_helper_store_40x_sler(cpu_env, cpu_gpr[gprn]);
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_stop_exception(ctx);
> > -    }
> >   }
> >   static void spr_write_booke_tcr(DisasContext *ctx, int sprn, int gprn)
> >   {
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_io_start();
> > -    }
> > +    gen_icount_io_start(ctx);
> >       gen_helper_store_booke_tcr(cpu_env, cpu_gpr[gprn]);
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_stop_exception(ctx);
> > -    }
> >   }
> >   static void spr_write_booke_tsr(DisasContext *ctx, int sprn, int gprn)
> >   {
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_io_start();
> > -    }
> > +    gen_icount_io_start(ctx);
> >       gen_helper_store_booke_tsr(cpu_env, cpu_gpr[gprn]);
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_stop_exception(ctx);
> > -    }
> >   }
> >   #endif
> > @@ -2863,18 +2782,13 @@ static void gen_darn(DisasContext *ctx)
> >       if (l > 2) {
> >           tcg_gen_movi_i64(cpu_gpr[rD(ctx->opcode)], -1);
> >       } else {
> > -        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -            gen_io_start();
> > -        }
> > +        gen_icount_io_start(ctx);
> >           if (l =3D=3D 0) {
> >               gen_helper_darn32(cpu_gpr[rD(ctx->opcode)]);
> >           } else {
> >               /* Return 64-bit random for both CRN and RRN */
> >               gen_helper_darn64(cpu_gpr[rD(ctx->opcode)]);
> >           }
> > -        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -            gen_stop_exception(ctx);
> > -        }
> >       }
> >   }
> >   #endif
> > @@ -5016,9 +4930,7 @@ static void gen_rfi(DisasContext *ctx)
> >       }
> >       /* Restore CPU state */
> >       CHK_SV;
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_io_start();
> > -    }
> > +    gen_icount_io_start(ctx);
> >       gen_update_cfar(ctx, ctx->cia);
> >       gen_helper_rfi(cpu_env);
> >       ctx->base.is_jmp =3D DISAS_EXIT;
> > @@ -5033,9 +4945,7 @@ static void gen_rfid(DisasContext *ctx)
> >   #else
> >       /* Restore CPU state */
> >       CHK_SV;
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_io_start();
> > -    }
> > +    gen_icount_io_start(ctx);
> >       gen_update_cfar(ctx, ctx->cia);
> >       gen_helper_rfid(cpu_env);
> >       ctx->base.is_jmp =3D DISAS_EXIT;
> > @@ -5050,9 +4960,7 @@ static void gen_rfscv(DisasContext *ctx)
> >   #else
> >       /* Restore CPU state */
> >       CHK_SV;
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_io_start();
> > -    }
> > +    gen_icount_io_start(ctx);
> >       gen_update_cfar(ctx, ctx->cia);
> >       gen_helper_rfscv(cpu_env);
> >       ctx->base.is_jmp =3D DISAS_EXIT;
> > @@ -5382,9 +5290,7 @@ static void gen_mtmsrd(DisasContext *ctx)
> >       CHK_SV;
> >   #if !defined(CONFIG_USER_ONLY)
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_io_start();
> > -    }
> > +    gen_icount_io_start(ctx);
> >       if (ctx->opcode & 0x00010000) {
> >           /* L=3D1 form only updates EE and RI */
> >           TCGv t0 =3D tcg_temp_new();
> > @@ -5419,9 +5325,7 @@ static void gen_mtmsr(DisasContext *ctx)
> >       CHK_SV;
> >   #if !defined(CONFIG_USER_ONLY)
> > -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> > -        gen_io_start();
> > -    }
> > +    gen_icount_io_start(ctx);
> >       if (ctx->opcode & 0x00010000) {
> >           /* L=3D1 form only updates EE and RI */
> >           TCGv t0 =3D tcg_temp_new();
> >=20
>=20
> Sorry, I somehow changed the author by mistake, which must be
> From: Richard Henderson <richard.henderson@linaro.org>

It turns out this no longer applies cleanly for me on ppc-for-6.1
anyway.  Please fix the attribution when you rebase for the next spin.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VkkVKHQof9J1zNlH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCcp6QACgkQbDjKyiDZ
s5IGQBAA2PROEObMNLA6AzR6g8NtV7D1qm22na9AY0x4RVcH+cFS3PIKxv3m4wYg
zhcxZ5QujW91Pni+iofKbl0HM/TOx8GPxiAtEd+HSZEO9By5JTZs0QmhONXVcxdr
Jq8AP/hqKyHxWC9+hadujbSj/OLRXfNTPgtUeDRxvrLcE4hDXn6lr8dLZ3Y6QweS
j/zGYSjNaJYi02Wq8u78wega9uHAUdyNuLM2X2/nYd2hiT52OeSazRjaicJckMcv
eTRwyUToji/4CspVp+tSi8K02Yfu+n1g3wzKd65445MzXyneeujr4dc3BFzdp/bW
UyzfAqs+G5QLM/3tRn48rQ+HhB2linSvro8SRPbafXgA6M3b21pbmlUHcrHJduvn
CHXbAZJQZR8XvNKi7//eNBYNAeE5XH3UjjtS25cQzYIVxOQ25XeqS7t2JNbTZubd
/+rN2jY+4ihF+JIOxKYVgEzdMVNBe/adpOwqpyQRbDG8kTJK6YQzemdAbR60NzzO
9sQmrmMA3Kd+U2LJAPEBWE4Wm3fWuf90vqxgdU++cKirNV+xZo5ZKpYpOxseKbbo
GEjD++ToOBlB5KswdjQem9tV7H5w8MaJl+0vqnElmUnOjAVHgyJX/SDwu64P/lSU
sNGjU8+IJSK8vglQhD3WbkO4D5ZhZwnK6aDWwgCSGEDzr8zTrzs=
=VE7Z
-----END PGP SIGNATURE-----

--VkkVKHQof9J1zNlH--

