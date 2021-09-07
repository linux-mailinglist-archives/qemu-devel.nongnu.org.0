Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0224021BE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 03:09:08 +0200 (CEST)
Received: from localhost ([::1]:57318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNPbn-0007cj-N6
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 21:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNPXD-0004o2-C1; Mon, 06 Sep 2021 21:04:23 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33269 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNPXA-0005xB-79; Mon, 06 Sep 2021 21:04:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630976655;
 bh=Fr3ORmeVRDCjNFKE0kHrtDc1J42zk1dY6ZzFiNp5k5s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Irje2jGNOGW62FEVrvuJn4nQ/IdTiCsvUOsFZ5PohDjdDK+99WjlIig33jW+xTs6q
 SEyWBk6va3HONs29QHIe5Othlqa9/29FbySSORKBb1JjWplXhG8NVh/v+27C+eEIzB
 YN6l0TzlvmKroZ8uzzUL0MBZeFnxlY0Ft2MJQcFA=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H3Rqg0BLdz9sjJ; Tue,  7 Sep 2021 11:04:14 +1000 (AEST)
Date: Tue, 7 Sep 2021 11:04:09 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v5 4/4] spapr: move FORM1 verifications to
 do_client_architecture_support()
Message-ID: <YTa6if+0ww3H437j@yekko>
References: <20210907002527.412013-1-danielhb413@gmail.com>
 <20210907002527.412013-5-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Xfs03rSRlXkG7HLn"
Content-Disposition: inline
In-Reply-To: <20210907002527.412013-5-danielhb413@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


--Xfs03rSRlXkG7HLn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 06, 2021 at 09:25:27PM -0300, Daniel Henrique Barboza wrote:
> FORM2 NUMA affinity is prepared to deal with empty (memory/cpu less)
> NUMA nodes. This is used by the DAX KMEM driver to locate a PAPR SCM
> device that has a different latency than the original NUMA node from the
> regular memory. FORM2 is also enable to deal with asymmetric NUMA
> distances gracefully, something that our FORM1 implementation doesn't
> do.
>=20
> Move these FORM1 verifications to a new function and wait until after
> CAS, when we're sure that we're sticking with FORM1, to enforce them.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr.c              | 33 -------------------------
>  hw/ppc/spapr_hcall.c        |  6 +++++
>  hw/ppc/spapr_numa.c         | 49 ++++++++++++++++++++++++++++++++-----
>  include/hw/ppc/spapr_numa.h |  1 +
>  4 files changed, 50 insertions(+), 39 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 8d98e3b08a..c974c07fb8 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -2797,39 +2797,6 @@ static void spapr_machine_init(MachineState *machi=
ne)
>      /* init CPUs */
>      spapr_init_cpus(spapr);
> =20
> -    /*
> -     * check we don't have a memory-less/cpu-less NUMA node
> -     * Firmware relies on the existing memory/cpu topology to provide the
> -     * NUMA topology to the kernel.
> -     * And the linux kernel needs to know the NUMA topology at start
> -     * to be able to hotplug CPUs later.
> -     */
> -    if (machine->numa_state->num_nodes) {
> -        for (i =3D 0; i < machine->numa_state->num_nodes; ++i) {
> -            /* check for memory-less node */
> -            if (machine->numa_state->nodes[i].node_mem =3D=3D 0) {
> -                CPUState *cs;
> -                int found =3D 0;
> -                /* check for cpu-less node */
> -                CPU_FOREACH(cs) {
> -                    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> -                    if (cpu->node_id =3D=3D i) {
> -                        found =3D 1;
> -                        break;
> -                    }
> -                }
> -                /* memory-less and cpu-less node */
> -                if (!found) {
> -                    error_report(
> -                       "Memory-less/cpu-less nodes are not supported (no=
de %d)",
> -                                 i);
> -                    exit(1);
> -                }
> -            }
> -        }
> -
> -    }
> -
>      spapr->gpu_numa_id =3D spapr_numa_initial_nvgpu_numa_id(machine);
> =20
>      if ((!kvm_enabled() || kvmppc_has_cap_mmu_radix()) &&
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 7efbe93f4b..27ee713600 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1202,9 +1202,15 @@ target_ulong do_client_architecture_support(PowerP=
CCPU *cpu,
>       * If the guest chooses FORM2 we need to reset the associativity
>       * information - it is being defaulted to FORM1 during
>       * spapr_machine_reset().
> +     *
> +     * If we're sure that we'll be using FORM1, verify now if we have
> +     * a configuration or condition that is not available for FORM1
> +     * (namely asymmetric NUMA topologies and empty NUMA nodes).
>       */
>      if (spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
>          spapr_numa_associativity_reset(spapr);
> +    } else {
> +        spapr_numa_check_FORM1_constraints(MACHINE(spapr));

Couldn't you put this call into one of the existing FORM1 functions?

>      }
> =20
>      /*
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index ca276e16cb..0c57d03184 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -155,6 +155,49 @@ static void spapr_numa_define_associativity_domains(=
SpaprMachineState *spapr)
> =20
>  }
> =20
> +void spapr_numa_check_FORM1_constraints(MachineState *machine)
> +{
> +    int i;
> +
> +    if (!spapr_numa_is_symmetrical(machine)) {
> +        error_report("Asymmetrical NUMA topologies aren't supported "
> +                     "in the pSeries machine");

Error message needs an update since they are now possible with FORM2.

> +        exit(EXIT_FAILURE);
> +    }
> +
> +    /*
> +     * check we don't have a memory-less/cpu-less NUMA node
> +     * Firmware relies on the existing memory/cpu topology to provide the
> +     * NUMA topology to the kernel.
> +     * And the linux kernel needs to know the NUMA topology at start
> +     * to be able to hotplug CPUs later.
> +     */
> +    if (machine->numa_state->num_nodes) {
> +        for (i =3D 0; i < machine->numa_state->num_nodes; ++i) {
> +            /* check for memory-less node */
> +            if (machine->numa_state->nodes[i].node_mem =3D=3D 0) {
> +                CPUState *cs;
> +                int found =3D 0;
> +                /* check for cpu-less node */
> +                CPU_FOREACH(cs) {
> +                    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> +                    if (cpu->node_id =3D=3D i) {
> +                        found =3D 1;
> +                        break;
> +                    }
> +                }
> +                /* memory-less and cpu-less node */
> +                if (!found) {
> +                    error_report(
> +                       "Memory-less/cpu-less nodes are not supported (no=
de %d)",
> +                                 i);
> +                    exit(EXIT_FAILURE);
> +                }
> +            }
> +        }
> +    }
> +}
> +
>  /*
>   * Set NUMA machine state data based on FORM1 affinity semantics.
>   */
> @@ -172,12 +215,6 @@ static void spapr_numa_FORM1_affinity_init(SpaprMach=
ineState *spapr,
>          return;
>      }
> =20
> -    if (!spapr_numa_is_symmetrical(machine)) {
> -        error_report("Asymmetrical NUMA topologies aren't supported "
> -                     "in the pSeries machine");
> -        exit(EXIT_FAILURE);
> -    }
> -
>      spapr_numa_define_associativity_domains(spapr);
>  }
> =20
> diff --git a/include/hw/ppc/spapr_numa.h b/include/hw/ppc/spapr_numa.h
> index 0e457bba57..b5a19cb3f1 100644
> --- a/include/hw/ppc/spapr_numa.h
> +++ b/include/hw/ppc/spapr_numa.h
> @@ -25,5 +25,6 @@ int spapr_numa_fixup_cpu_dt(SpaprMachineState *spapr, v=
oid *fdt,
>  int spapr_numa_write_assoc_lookup_arrays(SpaprMachineState *spapr, void =
*fdt,
>                                           int offset);
>  unsigned int spapr_numa_initial_nvgpu_numa_id(MachineState *machine);
> +void spapr_numa_check_FORM1_constraints(MachineState *machine);
> =20
>  #endif /* HW_SPAPR_NUMA_H */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Xfs03rSRlXkG7HLn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmE2uokACgkQbDjKyiDZ
s5Jd4g//Yndj6rTHe6CiBZ8+K1ziMeSjQAiHRPvNAsJ+zwktp/6x/dNFjZaHK1c+
NmqMYFKZHC3R3qTPCO9dXYz4TiT5UavHtkNB2jZqo3dFuyO/uEyku+DyC7sFRDrj
7sg+jrBdV/QxP1js08xjS7k9VvSWWXo/APvExBIUwL3tklzqQxsY7iIBTlbfQiIK
E1bjcD0QX4t/MON0C3cgc4831xTb+s76/pTfR7iUrSAkI1VKv9Z2M8Qd3NPjAzF1
24GfM+isAAKncBtdyjLDayrUrwbgbotVw0U122guqpRM9O4aMEJI/gQmyC0LETdO
3j5UJs3Apkcz4CePm02fUpMz62E0J0vcUFVptFZVCkYpMyHXkH645taPFq6cu7vG
G00TQ8KB7bd4e2Yhc6VhHphBFp58mF1gnX3+FsyfcREmez/PizsUVgdIYJqgtYho
3gKOLWhzzMsCE3bL1kJ/yjZwXDa7GoIA+bLCezVpmRlN5ARzNBvnmn1+eoxiwVYw
R8wLP7sR42Gs6nGLdEJqWmqjw0hq1KeqWYsXzz0u6tJjUarkPYsVLmJNFIzvUHhq
EqLxakrkuyw8oa7xeohAOJFVh25HeUQwSL9xNjrXTf9Elcy2eC2tYBsifL6T5zzh
DO/rnD7UExljfGuJalxddJg2efQO80LdG5A3qTakNXmARCW/uzA=
=2EWU
-----END PGP SIGNATURE-----

--Xfs03rSRlXkG7HLn--

