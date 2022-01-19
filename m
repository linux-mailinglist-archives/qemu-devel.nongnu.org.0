Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD6C4938B8
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 11:43:30 +0100 (CET)
Received: from localhost ([::1]:45568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA8R7-0003LK-7l
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 05:43:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nA86a-0003Np-RO; Wed, 19 Jan 2022 05:22:18 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:44955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nA86X-0007oq-3a; Wed, 19 Jan 2022 05:22:16 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jf1sT1m7Rz4y4f; Wed, 19 Jan 2022 21:22:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1642587725;
 bh=ipxvLIaYk0K0YfMud1oWBBmFwCGOLeS9HZCkplUFIM4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JFY+D5yz3rd3f6gAL3KI1t0/uHmykODbgTHpagfx29bwai/019zy2nkkBSGM/x4tG
 tAY1vXphwIWE7k2FgRmSHeDf9cD30dPTO/uqlqEN6T7vuZ0QTxYuGqVMwvw0u53o0M
 WoJc2oV6XavzSD5W+1V0q9SY81f9VrpEJ8hYPyvQ=
Date: Wed, 19 Jan 2022 17:09:21 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v2 08/14] target/ppc: 405: System call exception cleanup
Message-ID: <YeerEWyGu5j+Akeb@yekko>
References: <20220118184448.852996-1-farosas@linux.ibm.com>
 <20220118184448.852996-9-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Zw6UiCHbOjy1DL4Y"
Content-Disposition: inline
In-Reply-To: <20220118184448.852996-9-farosas@linux.ibm.com>
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


--Zw6UiCHbOjy1DL4Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2022 at 03:44:42PM -0300, Fabiano Rosas wrote:
> There's no sc 1.

No... but what exactly should and will happen if you attempt to
execute an "sc 1" on 40x.  Will it be treated as an "sc 0", or will it
cause a 0x700?  If it's a 0x700, better double check that that is
generated at translation time, if you're removing the check on level
here.

>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  target/ppc/excp_helper.c | 21 ++-------------------
>  1 file changed, 2 insertions(+), 19 deletions(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 8fae8aa0be..9a6f8365d6 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -398,7 +398,7 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int exc=
p)
>      CPUPPCState *env =3D &cpu->env;
>      int excp_model =3D env->excp_model;
>      target_ulong msr, new_msr, vector;
> -    int srr0, srr1, lev =3D -1;
> +    int srr0, srr1;
> =20
>      if (excp <=3D POWERPC_EXCP_NONE || excp >=3D POWERPC_EXCP_NB) {
>          cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
> @@ -521,30 +521,13 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int e=
xcp)
>          }
>          break;
>      case POWERPC_EXCP_SYSCALL:   /* System call exception               =
     */
> -        lev =3D env->error_code;
> -
> -        if ((lev =3D=3D 1) && cpu->vhyp) {
> -            dump_hcall(env);
> -        } else {
> -            dump_syscall(env);
> -        }
> +        dump_syscall(env);
> =20
>          /*
>           * We need to correct the NIP which in this case is supposed
>           * to point to the next instruction
>           */
>          env->nip +=3D 4;
> -
> -        /* "PAPR mode" built-in hypercall emulation */
> -        if ((lev =3D=3D 1) && cpu->vhyp) {
> -            PPCVirtualHypervisorClass *vhc =3D
> -                PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
> -            vhc->hypercall(cpu->vhyp, cpu);
> -            return;
> -        }
> -        if (lev =3D=3D 1) {
> -            new_msr |=3D (target_ulong)MSR_HVB;
> -        }
>          break;
>      case POWERPC_EXCP_FIT:       /* Fixed-interval timer interrupt      =
     */
>          trace_ppc_excp_print("FIT");

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Zw6UiCHbOjy1DL4Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmHnqwgACgkQgypY4gEw
YSK4xw/+P8YLk6uMzq5PYNzkrxMnJanRi1xVwIlFjlYe4FGl77q7wmmGzELJqkzF
ncqPesZEksA8ugomltbOgjWos3ixE49s8C5qqi6oeWMxHwF5i/Kx6TY8WkvN2I20
KLuJ2+pEk+JscniGcwwnOH6nuRLlqm6xAGimdBjTpQM4GL0/fl+t3WvTleTybsxb
3B40kldDE0i78Wgrawl7/AWSr89cKJwbmOQc4ziY0BWfKen2CU4B22QtUEaQemGh
9j/GeDcbFbghhuXfCJB4oeAwApb0+kYyz4H5Mibsk+ycblBRhIsXPjr7quX7+Qgh
ukIRNNhGvct0/1rLHhjx14jJl0L04TJE0lW2O8gjF/NoKEXkC7hEf7y9aB+vMjnF
4EPtGN6iyJCK5lX2cE0ARW33+T2RB2HidMr+k75JB50SxFfuUhPG58bis2vYGBVl
iPvlrRuBpB42YgMIydSDkEPtW4VBXofnYyD+1fQ06eql/c1Uurxo0bP6qFh8GSDf
DNDq4HkECPPK18mAAQpp+XIKygqXRmbPdiNOyVxsjGLchgJMn2A16Znk5GX6UOnA
k8Zr1X52W5Yyi32Wtfb/OvvyD4zpNp9+dcKiCYNgpUFdyzdV92t+4u/kNoil485h
JWrSX9Oljh8gmRjxt6QVPHsKbOBx6bQV/HOsp+G0FrMvpnY1lgo=
=WfiO
-----END PGP SIGNATURE-----

--Zw6UiCHbOjy1DL4Y--

