Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA74398396
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 09:50:03 +0200 (CEST)
Received: from localhost ([::1]:44904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loLda-0005bI-DQ
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 03:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loLYP-0004Lq-UR; Wed, 02 Jun 2021 03:44:44 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:42161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loLYM-0000Bb-7r; Wed, 02 Jun 2021 03:44:41 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fw1JB5v2Fz9sVt; Wed,  2 Jun 2021 17:44:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622619866;
 bh=J0xPy0vfXs+L80EZ3rsu1T32PTKQsxHjQlJteg+z3Wg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C17/Mrn3ZAtb3JQdbqrVRlEy3ID4l5dul88nZf3t840flFA2POoaPvVzvi2sQpFwl
 RmVM416+ORfSQft+LHt73HEw26M7HPMrp6Kzi3MUB3lyYPQLk1+d14QdRN/eFB+j/J
 cXCUy+iPIgvYSllfhfduoDPSurlN5FHhyErw60bY=
Date: Wed, 2 Jun 2021 17:37:52 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC PATCH 3/5] target/ppc: powerpc_excp: Consolidade TLB miss
 code
Message-ID: <YLc1UNDr8udn/r/5@yekko>
References: <20210601214649.785647-1-farosas@linux.ibm.com>
 <20210601214649.785647-4-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LZ2P8OD5EwrO+WVh"
Content-Disposition: inline
In-Reply-To: <20210601214649.785647-4-farosas@linux.ibm.com>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--LZ2P8OD5EwrO+WVh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 06:46:47PM -0300, Fabiano Rosas wrote:
> The only difference in the code for Instruction fetch, Data load and
> Data store TLB miss errors is that when called from an unsupported
> processor (i.e. not one of 602, 603, 603e, G2, 7x5 or 74xx), they
> abort with a message specific to the operation type (insn fetch, data
> load/store).
>=20
> If a processor does not support those interrupts we should not be
> registering them in init_excp_<proc> to begin with, so that error
> message would never be used.
>=20
> I'm leaving the message in for completeness, but making it generic and
> consolidating the three interrupts into the same case statement body.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Wow, what a mess that was.

Applied to ppc-for-6.1.

> ---
>  target/ppc/excp_helper.c | 37 ++-----------------------------------
>  1 file changed, 2 insertions(+), 35 deletions(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 9e3aae1c96..fd147e2a37 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -689,52 +689,20 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>                    "is not implemented yet !\n");
>          break;
>      case POWERPC_EXCP_IFTLB:     /* Instruction fetch TLB error         =
     */
> -        switch (excp_model) {
> -        case POWERPC_EXCP_602:
> -        case POWERPC_EXCP_603:
> -        case POWERPC_EXCP_603E:
> -        case POWERPC_EXCP_G2:
> -            goto tlb_miss_tgpr;
> -        case POWERPC_EXCP_7x5:
> -            goto tlb_miss;
> -        case POWERPC_EXCP_74xx:
> -            goto tlb_miss_74xx;
> -        default:
> -            cpu_abort(cs, "Invalid instruction TLB miss exception\n");
> -            break;
> -        }
> -        break;
>      case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                  =
     */
> -        switch (excp_model) {
> -        case POWERPC_EXCP_602:
> -        case POWERPC_EXCP_603:
> -        case POWERPC_EXCP_603E:
> -        case POWERPC_EXCP_G2:
> -            goto tlb_miss_tgpr;
> -        case POWERPC_EXCP_7x5:
> -            goto tlb_miss;
> -        case POWERPC_EXCP_74xx:
> -            goto tlb_miss_74xx;
> -        default:
> -            cpu_abort(cs, "Invalid data load TLB miss exception\n");
> -            break;
> -        }
> -        break;
>      case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                 =
     */
>          switch (excp_model) {
>          case POWERPC_EXCP_602:
>          case POWERPC_EXCP_603:
>          case POWERPC_EXCP_603E:
>          case POWERPC_EXCP_G2:
> -        tlb_miss_tgpr:
>              /* Swap temporary saved registers with GPRs */
>              if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
>                  new_msr |=3D (target_ulong)1 << MSR_TGPR;
>                  hreg_swap_gpr_tgpr(env);
>              }
> -            goto tlb_miss;
> +            /* fall through */
>          case POWERPC_EXCP_7x5:
> -        tlb_miss:
>  #if defined(DEBUG_SOFTWARE_TLB)
>              if (qemu_log_enabled()) {
>                  const char *es;
> @@ -769,7 +737,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>              msr |=3D ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
>              break;
>          case POWERPC_EXCP_74xx:
> -        tlb_miss_74xx:
>  #if defined(DEBUG_SOFTWARE_TLB)
>              if (qemu_log_enabled()) {
>                  const char *es;
> @@ -799,7 +766,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>              msr |=3D env->error_code; /* key bit */
>              break;
>          default:
> -            cpu_abort(cs, "Invalid data store TLB miss exception\n");
> +            cpu_abort(cs, "Invalid TLB miss exception\n");
>              break;
>          }
>          break;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--LZ2P8OD5EwrO+WVh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC3NVAACgkQbDjKyiDZ
s5JBXBAAxijIpg6qqYbeKGsZn5jVlnniOXZDsa6unIE8e9zI1SKZ4ZJu2C85P1+6
QnAaM6tXjp3yMtHqbW1GxPQjlVlBqfTz2h8YeLf71Xg93zbLpV2C8a3VdhpqcucI
09ZGQ4tJ0nWjzddZvilooDtHMPqnb1pfU3XOZWEFnVt5bqOHU8N+8KOKyVawpd8j
je1gUSydntQOWUBgX6zLSKK7clsDm11O/hyB4IFxy8cqIWoO4F7KOdizXfBK3zMe
TQc/hW13TJ36vLQxV3NcImq7mGAdIoJJGXcV1WKJt3M070su+TapBxehHYhRGKV+
Lj9mz4RPKAP9gqdfivI/96HOHJHUeR4c7lbtZRD0kHjdSwiM9/bhE9YFYMgfoNkv
+YCUzoTrB+9z4eC+c0F4k5i9mQzncanF05kKh7OTJBfT9deauxhHGqWL39CfGCgZ
fAmdBkXBz8I14yrISnJiZYrD+7qheBpsuK4mQ2Np4kogY8i431IZE75TUX4jQC1O
GgxaR6O9DyuHzynWPzA9bHW24uKRG+J5IVrA5R9VafCoPcFiKGqI7n3JkuxSFpqy
Bex4YkDMFuzqwr+VG/Pf8C0YFmCoio+9UewZs/BR0d8WMFP8ZTcgR9c77LLgboK3
PYmzmflEZVQv4syGYT5IlgFQmJhBoULP/dXT5L7EYwBF7dxB4xc=
=vsP2
-----END PGP SIGNATURE-----

--LZ2P8OD5EwrO+WVh--

