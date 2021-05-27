Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2288A39248F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 03:50:25 +0200 (CEST)
Received: from localhost ([::1]:51200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm5AG-0000PC-5h
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 21:50:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lm58T-0005ym-4q; Wed, 26 May 2021 21:48:33 -0400
Received: from ozlabs.org ([203.11.71.1]:48797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lm58R-0001tF-4z; Wed, 26 May 2021 21:48:32 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fr9gz2Q6pz9sX5; Thu, 27 May 2021 11:48:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622080095;
 bh=BelHMlS/SLtQCxC1M8tK14ytaJaeZD5XQCqyjKvyFRk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kyY0xdT+drsn6gcbdlcx0xb89jCGcEDSJkuR+uwQAs/gU4gzoOqmE6HfvUx5uy4YQ
 7nckGNWTl1juq+vYpp76kCVTq8BWSIktdXKH6rmnbcWu9tKN2ExxsPPe+R1lxj8GB1
 OWj3fWcyiz5vG6tuJFWC+uuX3evUgMYdn0LjDELM=
Date: Thu, 27 May 2021 11:48:02 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 3/3] target/ppc: Synchronize with KVM's LPCR value
 when creating a vCPU
Message-ID: <YK76UtGC/3F5nTsA@yekko>
References: <20210526091626.3388262-1-npiggin@gmail.com>
 <20210526091626.3388262-4-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NYIJOMYgui/+pB19"
Content-Disposition: inline
In-Reply-To: <20210526091626.3388262-4-npiggin@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--NYIJOMYgui/+pB19
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2021 at 07:16:26PM +1000, Nicholas Piggin wrote:
> Despite the suggestion from the comment, LPCR value set by KVM does not
> get propagated to QEMU SPR values. Instead, the KVM LPCR register is set
> from the inital QEMU values, of which KVM allows the DPFD, ILE, TC, AIL,
> LD fields to be modified. For the most part these get fixed up, but at
> least the DPFD value set by KVM gets lost.
>=20
> Fix this by reading the KVM LPCR when initialising a vCPU and reading
> registers. The hack for setting the LPCR LD bit can be removed.
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Uh.. few things I want to straighten out before applying this.

> ---
>  hw/ppc/spapr_cpu_core.c |  9 ++++++---
>  target/ppc/kvm.c        | 34 ++++++++++++++++++++--------------
>  2 files changed, 26 insertions(+), 17 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index 4f316a6f9d..91193b4bba 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -40,9 +40,12 @@ static void spapr_reset_vcpu(PowerPCCPU *cpu)
> =20
>      lpcr =3D env->spr[SPR_LPCR];
> =20
> -    /* Set emulated LPCR to not send interrupts to hypervisor. Note that
> -     * under KVM, the actual HW LPCR will be set differently by KVM itse=
lf,
> -     * the settings below ensure proper operations with TCG in absence of
> +    /*
> +     * Set emulated LPCR to not send interrupts to hypervisor. Note that
> +     * under KVM, the actual HW LPCR will be set differently by KVM itse=
lf
> +     * and that gets loaded by kvm_arch_get_registers and kvm_arch_init_=
vcpu.
> +     *
> +     * The LPCR settings below ensure proper operations with TCG in abse=
nce of
>       * a real hypervisor.
>       *
>       * Disable Power-saving mode Exit Cause exceptions for the CPU, so
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 104a308abb..ec269e38f8 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -104,6 +104,7 @@ static bool kvmppc_is_pr(KVMState *ks)
>      return kvm_vm_check_extension(ks, KVM_CAP_PPC_GET_PVINFO) !=3D 0;
>  }
> =20
> +static void kvm_get_one_spr(CPUState *cs, uint64_t id, int spr);
>  static int kvm_ppc_register_host_cpu_type(void);
>  static void kvmppc_get_cpu_characteristics(KVMState *s);
>  static int kvmppc_get_dec_bits(void);
> @@ -477,6 +478,16 @@ int kvm_arch_init_vcpu(CPUState *cs)
>          return ret;
>      }
> =20
> +    /*
> +     * As explained in spapr_reset_vcpu, a KVM guest needs to synchronize
> +     * to the LPCR value set by KVM.
> +     */

We need this stuff before we do our first full
kvm_arch_get_registers(), so I guess we need this.

> +#ifdef TARGET_PPC64
> +    kvm_get_one_spr(cs, KVM_REG_PPC_LPCR_64, SPR_LPCR);
> +#else
> +    kvm_get_one_spr(cs, KVM_REG_PPC_LPCR, SPR_LPCR);

But, I don't think the LPCR is a thing on any 32-bit CPUs, so I don't
think we need this.  Certainly we only register the LPCR for POWER5+
and later.

> +#endif
> +
>      switch (cenv->mmu_model) {
>      case POWERPC_MMU_BOOKE206:
>          /* This target supports access to KVM's guest TLB */
> @@ -1307,6 +1318,7 @@ int kvm_arch_get_registers(CPUState *cs)
> =20
>          kvm_get_one_reg(cs, KVM_REG_PPC_TB_OFFSET, &env->tb_env->tb_offs=
et);
>          kvm_get_one_spr(cs, KVM_REG_PPC_DPDES, SPR_DPDES);
> +        kvm_get_one_spr(cs, KVM_REG_PPC_LPCR_64, SPR_LPCR);

This one however confuses me... as do several of the existing
kvm_get_one_spr() calls there.  AFAICT we should be getting all the
SPRs from KVM with code earlier in kvm_arch_get_registers().

       for (i =3D 0; i < 1024; i++) {
            uint64_t id =3D env->spr_cb[i].one_reg_id;

            if (id !=3D 0) {
                kvm_get_one_spr(cs, id, i);
            }
        }

So, I'm wondering if the other explicit calls to kvm_get_one_spr() are
just working around places where we haven't properly set the KVM reg
id at register_spr() time.

>  #endif
>      }
> =20
> @@ -2529,24 +2541,18 @@ int kvmppc_get_cap_large_decr(void)
> =20
>  int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable)
>  {
> +    CPUPPCState *env =3D &cpu->env;
>      CPUState *cs =3D CPU(cpu);
>      uint64_t lpcr;
> =20
> -    kvm_get_one_reg(cs, KVM_REG_PPC_LPCR_64, &lpcr);
> -    /* Do we need to modify the LPCR? */
> -    if (!!(lpcr & LPCR_LD) !=3D !!enable) {
> -        if (enable) {
> -            lpcr |=3D LPCR_LD;
> -        } else {
> -            lpcr &=3D ~LPCR_LD;
> -        }
> -        kvm_set_one_reg(cs, KVM_REG_PPC_LPCR_64, &lpcr);
> -        kvm_get_one_reg(cs, KVM_REG_PPC_LPCR_64, &lpcr);
> -
> -        if (!!(lpcr & LPCR_LD) !=3D !!enable) {
> -            return -1;
> -        }
> +    cpu_synchronize_state(cs);
> +    lpcr =3D env->spr[SPR_LPCR];
> +    if (enable) {
> +        lpcr |=3D LPCR_LD;
> +    } else {
> +        lpcr &=3D ~LPCR_LD;
>      }
> +    ppc_store_lpcr(cpu, lpcr);
> =20
>      return 0;
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--NYIJOMYgui/+pB19
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCu+lAACgkQbDjKyiDZ
s5L/0A//e0UydBfVjy+KeYe43U5FpigRjMbtpvxqubLGzluryARMIrf8yjZivBt5
/amAj1Tsx+GaihWKFAUNGHtC8XNG75GkZ95kJ5svqPNzxchjBam/30HDzGC7J7pw
ovdHjxEl1qPZz71JKs/4Byz+gEEyW4Xi/of5j56QYxJjuGEfzDjTy9ubtcTmw4wT
l/L6GjNwesOPCH3ceKK5IT3DUtyY8jzeIFd8tfc8+WkOLSUijz0ajL/zytlTq9Ao
o/cQjCMxB3tm2x+1JZQDLlkgprN6oLf/n8ex51CoEC0CA7N5ExK6smfJV2Bno+x1
kQvFyA8WcVz3xDrimqhy0y+9iaqKTbkxIfIh9fDLua+lGxaFhkhgKar5MBocrZxH
A4dr4O11SbQ1ZUWqrFjXPyDMm93GOcKSSOcWalXcuwZ5mMaGoC1GJqzhSyrpKzdT
LVPwSfhgwb/+rOu7yigOPoLl9EgEQmN9ljXTH/ccLWNwWBQ7T+qXMQkYMhFc3CaV
p4PgJUPhfetfXvyXj0SFjbcLrU1dsTvDT0OZAexsXg+rA/kQUSAhSW0bEW+MKZnZ
6kEYYNsUiBudbplZ6QhnOSNmRMgg+PXdH8feDzy/N/cx6gLDeOiQe2EDH2WVmQ5v
YwRWDEouckcZ3WDr0K/U99MXEWqqD8KWQgBSritBukXDz89kV3U=
=dV4w
-----END PGP SIGNATURE-----

--NYIJOMYgui/+pB19--

