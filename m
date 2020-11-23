Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303A52BFFCD
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 07:10:54 +0100 (CET)
Received: from localhost ([::1]:49522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh53s-0002WD-Ps
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 01:10:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh52D-0001Dr-VI; Mon, 23 Nov 2020 01:09:09 -0500
Received: from ozlabs.org ([203.11.71.1]:49841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh52B-0006aR-4v; Mon, 23 Nov 2020 01:09:09 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CfcDG0L39z9sTL; Mon, 23 Nov 2020 17:09:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606111742;
 bh=byXa/Z035928Iz6tgh1gHCwe3m4s27g4gspg5CryxRM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VXGT2zmMqVtbrk9LZ25qAaX0WBICeSMbv9tVZ3BGyD1i/2FRI9l/LjPYZkvv6lyJx
 HHCJb8/h6u9/CJ3fNSxQbCapVXAEbPnwdjNgoGQjJciosHjKFWFDARwvCE3p5w/+FG
 Q9Vd2qao/HCLZbMe+jZL73nYyNRt04xVtrxGMZQs=
Date: Mon, 23 Nov 2020 16:11:30 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0 4/9] spapr: Set compat mode in spapr_reset_vcpu()
Message-ID: <20201123051130.GL521467@yekko.fritz.box>
References: <20201120234208.683521-1-groug@kaod.org>
 <20201120234208.683521-5-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CgTrtGVSVGoxAIFj"
Content-Disposition: inline
In-Reply-To: <20201120234208.683521-5-groug@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--CgTrtGVSVGoxAIFj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2020 at 12:42:03AM +0100, Greg Kurz wrote:
> When it comes to resetting the compat mode of the vCPUS, there are
> two situations to consider:
> (1) machine reset should set the compat mode back to the machine default,
>     ie. spapr->max_compat_pvr
> (2) hot plugged vCPUs should set their compat mode to mach the boot vCPU,
>     ie. POWERPC_CPU(first_cpu)->compat_pvr
>=20
> This is currently handled in two separate places: globally for all vCPUs
> from the machine reset code for (1) and for each thread of a core from
> the hotplug path for (2).
>=20
> Since the machine reset code already resets all vCPUs, starting with boot
> vCPU, consolidate the logic in spapr_reset_vcpu(). Special case the boot
> vCPU so that it resets its compat mode back to the machine default. Any
> other vCPU just need to match the compat mode of the boot vCPU.
>=20
> Failing to set the compat mode during machine reset is a fatal error,
> but not for hot plugged vCPUs. This is arguable because if we've been
> able to set the boot vCPU compat mode at CAS or during machine reset,
> it should definitely not fail for other vCPUs. Since spapr_reset_vcpu()
> already has a fatal error path for kvm_check_mmu() failures, do the
> same for ppc_set_compat().
>=20
> This gets rid of an error path in spapr_core_plug(). It will allow
> further simplifications.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  hw/ppc/spapr.c          | 16 ----------------
>  hw/ppc/spapr_cpu_core.c | 13 +++++++++++++
>  2 files changed, 13 insertions(+), 16 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index f58f77389e8e..da7586f548df 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1606,8 +1606,6 @@ static void spapr_machine_reset(MachineState *machi=
ne)
>      spapr_ovec_cleanup(spapr->ov5_cas);
>      spapr->ov5_cas =3D spapr_ovec_new();
> =20
> -    ppc_set_compat_all(spapr->max_compat_pvr, &error_fatal);
> -
>      /*
>       * This is fixing some of the default configuration of the XIVE
>       * devices. To be called after the reset of the machine devices.
> @@ -3785,20 +3783,6 @@ static void spapr_core_plug(HotplugHandler *hotplu=
g_dev, DeviceState *dev,
> =20
>      core_slot->cpu =3D OBJECT(dev);
> =20
> -    /*
> -     * Set compatibility mode to match the boot CPU, which was either set
> -     * by the machine reset code or by CAS.
> -     */
> -    if (hotplugged) {
> -        for (i =3D 0; i < cc->nr_threads; i++) {
> -            if (ppc_set_compat(core->threads[i],
> -                               POWERPC_CPU(first_cpu)->compat_pvr,
> -                               errp) < 0) {
> -                return;
> -            }
> -        }
> -    }
> -
>      if (smc->pre_2_10_has_unused_icps) {
>          for (i =3D 0; i < cc->nr_threads; i++) {
>              cs =3D CPU(core->threads[i]);
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index 2f7dc3c23ded..17741a3fb77f 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -27,6 +27,7 @@
> =20
>  static void spapr_reset_vcpu(PowerPCCPU *cpu)
>  {
> +    PowerPCCPU *first_ppc_cpu =3D POWERPC_CPU(first_cpu);
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
>      PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> @@ -69,6 +70,18 @@ static void spapr_reset_vcpu(PowerPCCPU *cpu)
>      kvm_check_mmu(cpu, &error_fatal);
> =20
>      spapr_irq_cpu_intc_reset(spapr, cpu);
> +
> +    /*
> +     * The boot CPU is only reset during machine reset : reset its
> +     * compatibility mode to the machine default. For other CPUs,
> +     * either cold plugged or hot plugged, set the compatibility mode
> +     * to match the boot CPU, which was either set by the machine reset
> +     * code or by CAS.
> +     */
> +    ppc_set_compat(cpu,
> +                   cpu =3D=3D first_ppc_cpu ?
> +                   spapr->max_compat_pvr : first_ppc_cpu->compat_pvr,
> +                   &error_fatal);

This assumes that when it is called for a non-boot CPU, it has already
been called for the boot CPU..  Are we certain that's guaranteed by
the sequence of reset calls during a full machine reset?

>  }
> =20
>  void spapr_cpu_set_entry_state(PowerPCCPU *cpu, target_ulong nip,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--CgTrtGVSVGoxAIFj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+7RIEACgkQbDjKyiDZ
s5JStw/+M3zjFUBOemmtz9xIBsa6Iu0ykh4iNnSLm+ISNkNgoLjTQ02q7KR4bYWS
YvEAu+O9WklTMIQyPalqG6S839MXUKovlZYSgNhQGSvjmPyCMlJ3oeQlE+YR2RRk
JiXz2qEVt6wDlvxQHEJLw9RqJe4rrUk4SuAXm8dRQvvE8/uqt4gJQzfDBG4uQ0L3
62dw4TT/IVO6bLtdjlRokaDFStg2altTT4MCIepD4ItbYGOHoaWT0B2jNlCa67DA
hgcPpPJiruAerzbvVsCIg73frCc6opaHT2P7UVhyQh/6G1FOOj49vvy4RuUZ0Std
gosk5yFTIxrLs601n9GnJh7tRJQW9D0Oeweq5D6yir6X/flWCx2N9QlVrsbWpG4D
t03VvLc16IYunrK1HW4GEzl9SSDa913XuEalTIcs6MbX3iMdXUrdZl2z1u5ydlN9
qziV3yvmzDHhsxNJkIR2KBzCWO/+2JHswynJoKea8xFcT2iJ+Zw8XZDPrw+zNjCe
u60q4zJW7gib4zPxAvS9b4Pr604ip22cnGg3ZhxewKEzRXqD7BLFiolq5oTV8qsM
ie3ZV98DdGkvI/1glXfyYTpqP+lpaSYwA+Fec2+/I+r757DiSYi1edhrEwPBOKNt
jr8Zkk8gJMyLFM9DF0No3orD787k8RKcWEvC/ZAe63p5LUX+NmM=
=9Pqg
-----END PGP SIGNATURE-----

--CgTrtGVSVGoxAIFj--

