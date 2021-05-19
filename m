Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB96388558
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 05:34:53 +0200 (CEST)
Received: from localhost ([::1]:45004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljCyy-0005lh-EC
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 23:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljCuO-0006zu-VA; Tue, 18 May 2021 23:30:10 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:58049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljCuI-0006ho-2g; Tue, 18 May 2021 23:30:07 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlJK15Zc0z9sWp; Wed, 19 May 2021 13:29:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621394997;
 bh=1XE4jem83+4PKXf1ZEcEzvVDIooe0npqXWq2PaT1I8Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HT0J5IXvnJMoQEPo2U0xvb6ihTlLMRVhf8EUpkAbX9n57MEbM6nzjj9N/B2my8cT1
 06rDHAI6iGj8MAajrhO0oxJDJ0wC6kpMezElSVNwE75fRFsDmhNuPz6sNjIs6BUKO3
 RMRSDfumDebPkLz0V/hqOkIgV8QqTcF7S/3TIGZY=
Date: Wed, 19 May 2021 10:42:54 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Giuseppe Musacchio <thatlemon@gmail.com>
Subject: Re: [PATCH v2] target/ppc: Fix load endianness for lxvwsx/lxvdsx
Message-ID: <YKRfDozCgk8wlg6z@yekko>
References: <20210518133020.58927-1-thatlemon@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mLy0A6CYIaQN13je"
Content-Disposition: inline
In-Reply-To: <20210518133020.58927-1-thatlemon@gmail.com>
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
Cc: qemu-stable@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 pc@us.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--mLy0A6CYIaQN13je
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 18, 2021 at 03:30:20PM +0200, Giuseppe Musacchio wrote:
> TARGET_WORDS_BIGENDIAN may not match the machine endianness if that's a
> runtime-configurable parameter.
>=20
> Fixes: bcb0b7b1a1c05707304f80ca6f523d557816f85c
> Fixes: afae37d98ae991c0792c867dbd9f32f988044318
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/212
>=20
> Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>

That looks more like it.  Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/translate/vsx-impl.c.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
> index b817d31260..57a7f73bba 100644
> --- a/target/ppc/translate/vsx-impl.c.inc
> +++ b/target/ppc/translate/vsx-impl.c.inc
> @@ -139,7 +139,7 @@ static void gen_lxvwsx(DisasContext *ctx)
>      gen_addr_reg_index(ctx, EA);
> =20
>      data =3D tcg_temp_new_i32();
> -    tcg_gen_qemu_ld_i32(data, EA, ctx->mem_idx, MO_TEUL);
> +    tcg_gen_qemu_ld_i32(data, EA, ctx->mem_idx, DEF_MEMOP(MO_UL));
>      tcg_gen_gvec_dup_i32(MO_UL, vsr_full_offset(xT(ctx->opcode)), 16, 16=
, data);
> =20
>      tcg_temp_free(EA);
> @@ -162,7 +162,7 @@ static void gen_lxvdsx(DisasContext *ctx)
>      gen_addr_reg_index(ctx, EA);
> =20
>      data =3D tcg_temp_new_i64();
> -    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_TEQ);
> +    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, DEF_MEMOP(MO_Q));
>      tcg_gen_gvec_dup_i64(MO_Q, vsr_full_offset(xT(ctx->opcode)), 16, 16,=
 data);
> =20
>      tcg_temp_free(EA);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--mLy0A6CYIaQN13je
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCkXwwACgkQbDjKyiDZ
s5J5sw//R4AYRlBeKU32NMtMVu6UleGYjne/weadHka01coyUHMATh2904DTAhPw
n0M6fYBsoBwgQ0EzG5WcbH0HQ5fimqCxmdCluQl9zzlNrtjS2XMFXtmzHyZlbtpU
VGxyeZWEj8zWQd+rkcYlYRLbW87Ib4KdNdSB/CieMvcClls8wi99NXuWz6BSCWhF
NCS5nKaCZW3yjcNSV5ZbmTaL25ThBpAy0dyHghyHyQRKYoobnC1AOZ9FWd3sjLgj
PR517isFONvSwDEDruxQ5apRLt5pBQ23U08EuLh+7ZBjKfQu8LaWXULBfaMsWOy9
2FVSUAJ8mouc5EgYCciQlZuHgYTZPu08/pHSuV5aZABPEgduXstZti4geKQ2Y+dq
vkRL/Ajzto5MYY+LLwwvcEP5glk1Cv00uWdknT3akIgwFVG3jNx8aGI6CBypA90G
iTmaOUciyZacIz+r+Rv48DDqxx2rj65iqO4YC/o4+ZhlWl3YzY65diDQK1sXsOyW
fQs5TminHxWa2/XPMEaGcfabMo62JQTvdHEHbKVSUJKsUS0e10Jz57EV4pg+43VL
gdkfJG54yqyh0nZJ++n5ZVUyms8GlivX9SVqFSl+rPKQRHv1OfLKBtsGc43NTd8J
fOms+i5saBasT6X/WqqWgJQV/aELoukLKT02s+W0hgE2IYy+ALA=
=vkk9
-----END PGP SIGNATURE-----

--mLy0A6CYIaQN13je--

