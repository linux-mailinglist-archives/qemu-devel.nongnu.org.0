Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550794938BD
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 11:43:48 +0100 (CET)
Received: from localhost ([::1]:46730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA8RP-00048e-9Y
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 05:43:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nA86d-0003PV-CF; Wed, 19 Jan 2022 05:22:20 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:56671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nA86b-0007qJ-Jx; Wed, 19 Jan 2022 05:22:19 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jf1sT2BKRz4y4k; Wed, 19 Jan 2022 21:22:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1642587725;
 bh=nHh3Qo8Co/CbGMlfupy5gbVsecS5edFCfH8EWOktJmA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TwAz8xI0cbk1nCZY6Whrxxqnn2HlTpbjEcxYJdDWYpkJLFtVluSFoOdhgj+0oo5nG
 VchW2ym/qyyhZTa9/RySbcjuNaBWt9JdEum42OgA4ANkxQMYoyfj2KKUe7uuzG0nEr
 jSLIMnH1nYqiZZ5aIfd7kbXB0+0jDipkPkkZ2YaQ=
Date: Wed, 19 Jan 2022 17:15:24 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v2 13/14] target/ppc: 405: Program exception cleanup
Message-ID: <YeesfOoE9OYXBgUx@yekko>
References: <20220118184448.852996-1-farosas@linux.ibm.com>
 <20220118184448.852996-14-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OA4wSpjSg+wsZ3Aj"
Content-Disposition: inline
In-Reply-To: <20220118184448.852996-14-farosas@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--OA4wSpjSg+wsZ3Aj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2022 at 03:44:47PM -0300, Fabiano Rosas wrote:
> The 405 Program Interrupt does not set SRR1 with any diagnostic bits,
> just a clean copy of the MSR.
>=20
> We're using the BookE Exception Syndrome Register which is different
> from the 405.

Hrm.  We really do want to set the 40x ESR bits here, though.

>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  target/ppc/excp_helper.c | 16 ----------------
>  1 file changed, 16 deletions(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 13674a102f..2efec6d13b 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -484,30 +484,14 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int e=
xcp)
>                  env->error_code =3D 0;
>                  return;
>              }
> -
> -            /*
> -             * FP exceptions always have NIP pointing to the faulting
> -             * instruction, so always use store_next and claim we are
> -             * precise in the MSR.
> -             */
> -            msr |=3D 0x00100000;
> -            env->spr[SPR_BOOKE_ESR] =3D ESR_FP;
>              break;
>          case POWERPC_EXCP_INVAL:
>              trace_ppc_excp_inval(env->nip);
> -            msr |=3D 0x00080000;
> -            env->spr[SPR_BOOKE_ESR] =3D ESR_PIL;
>              break;
>          case POWERPC_EXCP_PRIV:
> -            msr |=3D 0x00040000;
> -            env->spr[SPR_BOOKE_ESR] =3D ESR_PPR;
> -            break;
>          case POWERPC_EXCP_TRAP:
> -            msr |=3D 0x00020000;
> -            env->spr[SPR_BOOKE_ESR] =3D ESR_PTR;
>              break;
>          default:
> -            /* Should never occur */
>              cpu_abort(cs, "Invalid program exception %d. Aborting\n",
>                        env->error_code);
>              break;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--OA4wSpjSg+wsZ3Aj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmHnrHMACgkQgypY4gEw
YSIXPBAA1mfxijn2tI/G3i1oNGZ+QPLsteRfC8LGLR/kQHa4mcyvhtRviCQO/1Zw
35CakqPHwWAxdzUmPKvOswV2xPrLkvGR/v9M1NHJE+SG7B39o7VpR4drXd+XujMi
LGcf5qFWu/oqcHPUH7fS6n+mM5Dwuer1cw6Xl68avL1oNDeB5r0RJZq8OkpNpK9M
+Sbf3XQ7pzZwbzT33UDx+Lj7m/KWao28KjoHp9b+/OsAXP57az2Te4RWfIzuo8Lh
tZlVUPrAe5mkuY9iVct8AA3ldoCdeYim7ATpuxoSqT1iI3a4d8j4cTw79yB4DcX3
xRvd1Xz4TtzcISz60y0fyERK1k3UKr0iswPRfBMYnmyOC7iPxi41IPM6NKURPB5I
geTz9r/dMhD9gsdxYmtKrOHhBD9a4IshNtWbVC2+PGbXfqRZlFrhBTUTzdvprDTo
z6oOvIn0qzXmY2JgvvjZPfO98y/+bPmKKSBZ8LmVOulMWx7rL97pbBFEzwmc10g8
+Wk9FxdfEargdndxGxwz3aqbA5iArHIQX/3nJu1WgIAgzPm7YGw5e5+tdp+BCdRQ
HeZ0caMebFJsiXNsNx7zFUCrnno3xZgkvpNXlnuftNJxrG3tVXMUnjPeNfrmXDYP
pIviR+6Tf5AJ9Qj7PTEGqlAnvvg45MpZuxJGZhVpxurlFNioeRk=
=p/MV
-----END PGP SIGNATURE-----

--OA4wSpjSg+wsZ3Aj--

