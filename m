Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC516493893
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 11:33:16 +0100 (CET)
Received: from localhost ([::1]:34688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA8HE-0003tA-12
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 05:33:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nA86b-0003O6-5K; Wed, 19 Jan 2022 05:22:18 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=47259
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nA86X-0007os-4G; Wed, 19 Jan 2022 05:22:16 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jf1sT1z6Fz4y4h; Wed, 19 Jan 2022 21:22:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1642587725;
 bh=m8n1wsdo6B6M+AiwBZxqgp7+Q0rcNZxPQ/yZqxM6F6M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Eo7m//3j/3lvdq8YlAFqi+pQAPG1gAnmavRSqvtgLYUpLZuAFD4RWeGwwW7PS3p2E
 PGqFqp0CpHAitDNXAku91iYvpcdJuhOvsBh1wY90hpOQ9f0oNRSUpIiAgCAs9nrG80
 kzuXM/mVLG7fMThznND99oLMHcp7l8PqIXAGtB3M=
Date: Wed, 19 Jan 2022 17:12:17 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v2 10/14] target/ppc: 405: Debug exception cleanup
Message-ID: <YeerwTGODlSF9EQa@yekko>
References: <20220118184448.852996-1-farosas@linux.ibm.com>
 <20220118184448.852996-11-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YwMSdBen9XodHzOO"
Content-Disposition: inline
In-Reply-To: <20220118184448.852996-11-farosas@linux.ibm.com>
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


--YwMSdBen9XodHzOO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2022 at 03:44:44PM -0300, Fabiano Rosas wrote:
> The current Debug exception dispatch is the BookE one, so it is
> different from the 405. We effectively don't support the 405 Debug
> exception.
>=20
> This patch removes the BookE code and moves the DEBUG into the "not
> implemented" block.
>=20
> Note that there is in theory a functional change here since we now
> abort when a Debug exception happens. However, given how it was never
> implemented, I don't believe this to have ever been dispatched for the
> 405.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/excp_helper.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index d263f20002..84ec7e094a 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -539,23 +539,13 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int e=
xcp)
>      case POWERPC_EXCP_DTLB:      /* Data TLB error                      =
     */
>      case POWERPC_EXCP_ITLB:      /* Instruction TLB error               =
     */
>          break;
> -    case POWERPC_EXCP_DEBUG:     /* Debug interrupt                     =
     */
> -        if (env->flags & POWERPC_FLAG_DE) {
> -            /* FIXME: choose one or the other based on CPU type */
> -            srr0 =3D SPR_BOOKE_DSRR0;
> -            srr1 =3D SPR_BOOKE_DSRR1;
> -
> -            env->spr[SPR_BOOKE_CSRR0] =3D env->nip;
> -            env->spr[SPR_BOOKE_CSRR1] =3D msr;
> -
> -            /* DBSR already modified by caller */
> -        } else {
> -            cpu_abort(cs, "Debug exception triggered on unsupported mode=
l\n");
> -        }
> -        break;
>      case POWERPC_EXCP_PIT:       /* Programmable interval timer interrup=
t    */
>          trace_ppc_excp_print("PIT");
>          break;
> +    case POWERPC_EXCP_DEBUG:     /* Debug interrupt                     =
     */
> +        cpu_abort(cs, "%s exception not implemented\n",
> +                  powerpc_excp_name(excp));
> +        break;
>      default:
>          cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
>          break;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YwMSdBen9XodHzOO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmHnq7oACgkQgypY4gEw
YSKXvg/9Fo/tZMsGW5KNDfiIPvfolJNCdn71uJp/PXlfDwFzhAPu/t/h9Y30850g
vA2BD514gGT4cpJylbH/vYTtwwXVsi5cggjkGeWRCb6dyFqC711VC6li+HSqj/n/
GYzfkV21Lwdh4ha0a3nXKi8byFYj0GYTmHzKX5d8TPPYUsvY6LMP10JgVJgjXnDN
TQ+ox735lfmYFSqUBRUMzS/UpakmJzWKtGXIA6DcGAnBwO49Yti+KBP3ZlEuEfdE
lmCFdv44sFt3I7DrxhzbGbI5xpMwkP57K9xY7n7eU6WSqP+jbhjXGqSHVYb0GdTJ
K5GgXnrJMwONN4SWHHCufCZwSiU6bDx/WK25jP/WStXKoQAUxyimMDqDwHKNtaPN
22IGuwyWxO0wS2/eT3go9nhm7+Il5vizZT30dlQiQkDhnXmYdT3cvYo2GIi4JCrR
VZasFcuBx9H8rwgu6GgEQxM+jDr33DYsLWTTSe2tu5Dy6vNWbNounSSHIuNJD29R
HW2S8+Bjp89YIEL7cXa2sgH/UKWLslJJfW+8Ja5piFL6tf6ZjTXBUHlWOghuWUrq
Y3Hv/dC+9JmGHXs1ggMWIpmAMHnZGAFahXueX+y01YPSVbJXuw56vQm2q0UNSa8l
z4S4RFGf3bAO72x0PFYcx56H0kkQ0vGnWpnmwP6QoC/q8+xcyrQ=
=WhgQ
-----END PGP SIGNATURE-----

--YwMSdBen9XodHzOO--

