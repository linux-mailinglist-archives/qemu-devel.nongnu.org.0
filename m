Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC0848A5B9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 03:36:37 +0100 (CET)
Received: from localhost ([::1]:37658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n771Y-0002A5-4R
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 21:36:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n76wx-0006Nv-QY; Mon, 10 Jan 2022 21:31:51 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=39211
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n76ws-000156-G7; Mon, 10 Jan 2022 21:31:50 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JXvpB2Fsgz4y4m; Tue, 11 Jan 2022 13:31:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1641868290;
 bh=bYcNb7NYVkf0nqbbkrVb1gEFSHQCFfId3VDeA4d50r4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I4Sp9o8jphUYifAEyB1WDrhbXUkmZwdJi2hTKCwz0j97OstE0eKvhr2O483fiSyLa
 Qn/dAxlHTJXTu36zg6V87+Q+akbfWjcvD8gdTKWJ3Tgn0grKjnc3LYC6IfwC3togaM
 jsmG+8d1xr1ytAKMQvIicfUPJsHyY21D6VbTSJ+E=
Date: Tue, 11 Jan 2022 13:31:21 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 8/8] target/ppc: 405: System call exception cleanup
Message-ID: <Ydzr+ecnNSik9N/C@yekko>
References: <20220110181546.4131853-1-farosas@linux.ibm.com>
 <20220110181546.4131853-9-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Af6bf6SZ/3I1J3Ak"
Content-Disposition: inline
In-Reply-To: <20220110181546.4131853-9-farosas@linux.ibm.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Af6bf6SZ/3I1J3Ak
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 10, 2022 at 03:15:46PM -0300, Fabiano Rosas wrote:
> There's no sc 1.
>=20
> We also only used env->nip because of the vhyp code, so change to
> 'vector' now.

I don't think this is right.  The point with the env->nip change is
changing the PC as it appeared *before* saving it to SRR0, so that
we'll eventually return to the right place.  'vector' is the address
for the interrupt vector itself.


>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  target/ppc/excp_helper.c | 23 +++--------------------
>  1 file changed, 3 insertions(+), 20 deletions(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index f7b9af5065..ab298d0d8f 100644
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
> @@ -518,30 +518,13 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int e=
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
> -        env->nip +=3D 4;
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
> +        vector +=3D 4;
>          break;
>      case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception=
     */
>      case POWERPC_EXCP_APU:       /* Auxiliary processor unavailable     =
     */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Af6bf6SZ/3I1J3Ak
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHc6/kACgkQbDjKyiDZ
s5LTqhAA2YRqVkqMQtKGTsG41OauAvLjRUEPb4cuJzvpVUizB73WRNu4ydyeh/JH
AbGPsGoRykrWXPvKbfGeQHckAhSD3iBdwsRCgBKY1rBKqnmQ0hRhxWqoc0SQrw0k
6TB5vIf3S9brRvfYVwWALL9cukycf28K2+iDMxMbvjtP/5WQLf3YOUiDhXsGLGl9
9Tmtnyaza6hjjjsb/XaDFSLD+GdVhhg9EUFU23Ao43EOqh2fLERzQIJ3k3Qr+MDr
CRCDny3DnHxHjHTcr4Tz2b6pK3RGmkDTZKK1SbUR2kwrteonVlJEnixR5KPeUGTE
4HZQ9clL06qiQzzjVnMk/R8+ngyfa3V9x6gMKdCCXjQS7yUH+0dcZHmObCrRAxfz
TcHWYp2m1nC33EQwzse30G/CD6pjdfH0eEbcyG3v5c+XwxrjjTnhc+5mYGyjoZrz
N3g489PsuFOjIsIT2rp9J9e/tevzA1FEc5slP4e/PNfZKnThZxnX4MYOEvQ5d/Bg
Zsz1Y8hOIPrmeZVf2Dj9zji2+LC3XEBcqKxizB8DlGCjNCdMKVahnCBfLFFBtl5Y
/03BhYlOLgza0PT1PH3kIbUgLSG07NJaVyNq4WZodJheQLzBwkuIMdqwnzqQ/pgL
zNMSJx2a4t3/zhKBAR1UJ2YwldQCz6CXJ/W4YC9o5iIWQ5A82pA=
=T7zg
-----END PGP SIGNATURE-----

--Af6bf6SZ/3I1J3Ak--

