Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B00B399878
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 05:13:56 +0200 (CEST)
Received: from localhost ([::1]:53298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lodnv-0002y0-KF
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 23:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lodmr-0001Pp-Ga; Wed, 02 Jun 2021 23:12:49 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:41395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lodmp-00045e-4q; Wed, 02 Jun 2021 23:12:49 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FwWD862MRz9sVb; Thu,  3 Jun 2021 13:12:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622689960;
 bh=VR8V6EpXEbrDoJaWpwZ9ZI5HQ/qRh2xuBvGGEh1m6CU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kr6LD6KYUbLzLisGHamfsY9Z9gxUeMV0LW5juRqwz+bY2Ougf859uqPlFRo1Kuz2e
 BWy0bIGOTqRSn6XBSJIWc0uVFAbpWyh+duamitYqlsJsNzeTRA3MsM8LZof8DrCgHV
 jL9PBUV2RLh5UZuvOk3oQXlrmob9y/A6lnZBNnsk=
Date: Thu, 3 Jun 2021 11:01:44 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Luis Pires <luis.pires@eldorado.org.br>
Subject: Re: [PATCH v2] target/ppc: fix single-step exception regression
Message-ID: <YLgp+DFTGHyS9FIG@yekko>
References: <20210602125103.332793-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hh6KlBAzPyULnPp6"
Content-Disposition: inline
In-Reply-To: <20210602125103.332793-1-luis.pires@eldorado.org.br>
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
Cc: matheus.ferst@eldorado.org.br, richard.henderson@linaro.org,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--hh6KlBAzPyULnPp6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 02, 2021 at 09:51:03AM -0300, Luis Pires wrote:
> Commit 6086c75 (target/ppc: Replace POWERPC_EXCP_BRANCH with
> DISAS_NORETURN) broke the generation of exceptions when
> CPU_SINGLE_STEP or CPU_BRANCH_STEP were set, due to nip always being
> reset to the address of the current instruction.
> This fix leaves nip untouched when generating the exception.
>=20
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
> Reported-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
> v2:
>  - Removed incorrect nip update from ppc_tr_tb_stop()
>=20
>  target/ppc/translate.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index ea200f9637..14a0bb7168 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -4646,8 +4646,7 @@ static void gen_lookup_and_goto_ptr(DisasContext *c=
tx)
>          if (sse & GDBSTUB_SINGLE_STEP) {
>              gen_debug_exception(ctx);
>          } else if (sse & (CPU_SINGLE_STEP | CPU_BRANCH_STEP)) {
> -            uint32_t excp =3D gen_prep_dbgex(ctx);
> -            gen_exception(ctx, excp);
> +            gen_helper_raise_exception(cpu_env, tcg_constant_i32(gen_pre=
p_dbgex(ctx)));
>          } else {
>              tcg_gen_exit_tb(NULL, 0);
>          }
> @@ -9128,7 +9127,7 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase=
, CPUState *cs)
>          }
>          /* else CPU_SINGLE_STEP... */
>          if (nip <=3D 0x100 || nip > 0xf00) {
> -            gen_exception(ctx, gen_prep_dbgex(ctx));
> +            gen_helper_raise_exception(cpu_env, tcg_constant_i32(gen_pre=
p_dbgex(ctx)));
>              return;
>          }
>      }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hh6KlBAzPyULnPp6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC4KfYACgkQbDjKyiDZ
s5JT/xAA4vLCMizm8nRIcfd8+HYsTLVkyp76+ZKpKlDVT1QvK+Qr+iF+Ht4QXgFT
VTiA9ZdTJkkkIVcd12D0BBiXCH0ycg3SkFRKo8abs4lhADVJH5MhLi7kcsi1GMI6
Z+PGsiBh7YTZyeUYB4hAh3/xiVTRJLMn2bT2vtlZyG8doWUJvFM+4HC8rJisBO/h
vRc4zP8YGezSIbr7MA4FPTyVxg9IDrzLBGWZ04e+g9pPlmRSccITkCqU+T96wTPY
jy1GM3ZVHDQqLyAlwAkjf3+eE7Xd5YugaVxuh2DPl1TogvB00p24x4DXOdGgcMg8
AZoHbo+OoDAoRuO3Rqw3qx0iU2bSV6NE+qwbTKofSPKAAw86SkrSF3NWNPeUAPcL
fHhXlOm1/CXVdkcaaPUeTvFWXR4XUhAE9JLgAA7sT2cHytf8ofqLnQQ0aFksggj+
3lkv33kgBJYj9U4DJMf5EYNYTMwbNL16aof7GoFsOlG95U3/KkiFS+ws+ZxL04XO
3tV8+6jwskxsUMiK5pmNPTXKqokPrPSv34ZwUiwHBadPbGbf4JHWaiUA/CYg5IOR
VXksQ0cP2Rg1XEQPjgNhieLFFJt8H2whIEXVxHLJGYei8PqADcobHHJ5l/uBWRTN
aozWFY7aWCgXT4sHW88Qx4gh948N/W1XJGx4mv0SfUotyDOngig=
=oBMg
-----END PGP SIGNATURE-----

--hh6KlBAzPyULnPp6--

