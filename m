Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FBA4938B1
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 11:38:19 +0100 (CET)
Received: from localhost ([::1]:39092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA8M6-0006v0-2k
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 05:38:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nA86e-0003PW-0K; Wed, 19 Jan 2022 05:22:20 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=54363
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nA86c-0007qI-4F; Wed, 19 Jan 2022 05:22:19 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jf1sT23p0z4y4j; Wed, 19 Jan 2022 21:22:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1642587725;
 bh=+DPsVOa18yX9tnwZ15vWrletNfi8D11Kht2AqlnBK60=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cIkvZtQy85h+7LkfZlEvwI33vgxe3DvKZqpO/glIhINU7bRGxn/PV4adG2uD9vNxT
 zTsLwB+4otr3R89j6p5bu070h11CQN5eobp75uYI6MJOqDYRSqD42jOpoHs4tHrUWf
 S2fM1lf0hOJmHAXS0778DuxSq1efiRfa50A2E8yg=
Date: Wed, 19 Jan 2022 17:13:31 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v2 11/14] target/ppc: 405: Data Storage exception cleanup
Message-ID: <YeesC7891UZQS3v+@yekko>
References: <20220118184448.852996-1-farosas@linux.ibm.com>
 <20220118184448.852996-12-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KpfpE+KpqcFRe9YU"
Content-Disposition: inline
In-Reply-To: <20220118184448.852996-12-farosas@linux.ibm.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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


--KpfpE+KpqcFRe9YU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2022 at 03:44:45PM -0300, Fabiano Rosas wrote:
> The 405 has no DSISR or DAR, so convert the trace entry to
> trace_ppc_excp_print.

I think it would be preferable to show ESR and DEAR here, which are
very loosely equivalent to DSISR and DAR on 40x.  Might want to create
a new trace point explicitly for this so the terminology is clear as well.

>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  target/ppc/excp_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 84ec7e094a..e4e513322c 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -465,7 +465,7 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int exc=
p)
>          srr1 =3D SPR_40x_SRR3;
>          break;
>      case POWERPC_EXCP_DSI:       /* Data storage exception              =
     */
> -        trace_ppc_excp_dsi(env->spr[SPR_DSISR], env->spr[SPR_DAR]);
> +        trace_ppc_excp_print("DSI");
>          break;
>      case POWERPC_EXCP_ISI:       /* Instruction storage exception       =
     */
>          trace_ppc_excp_isi(msr, env->nip);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--KpfpE+KpqcFRe9YU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmHnrAMACgkQgypY4gEw
YSKH2hAAu8WErMZsu3nWfbpQGQiKCq3aI7+Il2QV3k3pL+79e7soI5eKoRgTa4oG
Kx77MWq0J3GRUBtfWQVAfGpATv9jQNuGStqv/CEUaxuNnror3QC4QueV82maAMme
bgVUai45XJh8AHFi8hz/wFKsQ2cW7+/0Xx49/8LiKxY7IdPwNr5ZgzAwQANW7MbM
/FNj73coXBN3Y4rfkPYY0OdTF3jSzZDdVUU3EhmIHbSFlr4xUnLrDEdWXg1AO0c9
gvIdYRF/X2jAERVBSwfXCW/ANDKgqvhAdav+qQMxDo8O8aUO9LPazOiQKH1SBwVt
Mc08PsBcjP9iYXQsmfjA1nQa5gYfSuy5pQ2rw0LzvnymlQcjIbpPjOJPA3sdGpfi
uPIUELZm1u935G+cY5nFsjWK4rZhlFhLAC4SbihxKTuCjKMcvQnggN7qNktQWiQE
AkD7lf9kvocMTuFc0RMq9pwwUxXrUnlvNYzmS8+9Gtw6056/NA+7dNLYk3yVAbda
b5XVveLMsysfP80gYYAh9JWRxDogJbf3Yy3jm4NsA0Gc8ZY5qnnJZ89i1jbDXw1k
7DmGq6ZDjqDMNmpg0zakmwSUfQ+i2fwvViRuXrEadBSDZZQZ89Vn7PNriETVXBUB
6mKYtL3nh0TyhIE6dNzZa1erQ87uXZth667ilSYp22lPrsz8XOs=
=ND8+
-----END PGP SIGNATURE-----

--KpfpE+KpqcFRe9YU--

