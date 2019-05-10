Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2166519881
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 08:39:14 +0200 (CEST)
Received: from localhost ([127.0.0.1]:37752 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOzBZ-0008D8-Ab
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 02:39:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hOz7o-0005AP-Pu
	for qemu-devel@nongnu.org; Fri, 10 May 2019 02:35:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hOz7n-0004uF-AP
	for qemu-devel@nongnu.org; Fri, 10 May 2019 02:35:20 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:42589 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hOz7m-0004oW-Kz; Fri, 10 May 2019 02:35:19 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 450gSD1njjz9sD4; Fri, 10 May 2019 16:35:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1557470108;
	bh=e1qCbiYEA7h3sNT5f2cyRqokYftvC12FuCu7cuL0tPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lWNMRKW66z624J+o4FkXX7rDj2dCgMYR2+zNiiJYXOWH4rO0IArCHaxmnzFRLJ3Vn
	bIX3r7n9EnkHKcRn7w90i0LbLEf+/O0qX4F0LI772UqqwkEAng6tPCqallSaoY1qPk
	pkeOG5hktRfQ4itWa1VUXKt0ddH96d0x1b3XH/7I=
Date: Fri, 10 May 2019 16:28:34 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Message-ID: <20190510062834.GF20559@umbus.fritz.box>
References: <20190503055316.6441-1-sjitindarsingh@gmail.com>
	<20190503055316.6441-11-sjitindarsingh@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="E7i4zwmWs5DOuDSH"
Content-Disposition: inline
In-Reply-To: <20190503055316.6441-11-sjitindarsingh@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [QEMU-PPC] [PATCH 10/13] target/ppc: Implement
 hcall H_TLB_INVALIDATE
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: groug@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--E7i4zwmWs5DOuDSH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 03, 2019 at 03:53:13PM +1000, Suraj Jitindar Singh wrote:
> The hcall H_TLB_INVALIDATE is used by a guest acting as a nested
> hypervisor to perform partition scoped tlb invalidation since these
> instructions are hypervisor privileged.
>=20
> Check the arguments are valid and then invalidate the entire tlb since
> this is about all we can do in tcg.
>=20
> Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr_hcall.c   | 28 ++++++++++++++++++++++++++++
>  include/hw/ppc/spapr.h |  3 ++-
>  2 files changed, 30 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 68f3282214..a84d5e2163 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -2131,6 +2131,33 @@ void h_exit_nested(PowerPCCPU *cpu)
>      env->gpr[3] =3D trap;
>  }
> =20
> +static target_ulong h_nested_tlb_invalidate(PowerPCCPU *cpu,
> +                                            SpaprMachineState *spapr,
> +                                            target_ulong opcode,
> +                                            target_ulong *args)
> +{
> +    target_ulong instr =3D args[0];
> +    target_ulong rbval =3D args[2];
> +    int r, ric, prs, is;
> +
> +    if (spapr_get_cap(spapr, SPAPR_CAP_NESTED_KVM_HV) =3D=3D 0) {
> +        return H_FUNCTION;
> +    }
> +
> +    ric =3D (instr >> 18) & 0x3;
> +    prs =3D (instr >> 17) & 0x1;
> +    r =3D (instr >> 16) & 0x1;
> +    is =3D (rbval >> 10) & 0x3;
> +
> +    if ((!r) || (prs) || (ric =3D=3D 3) || (is =3D=3D 1) || ((!is) && (r=
ic =3D=3D 1 ||
> +                                                               ric =3D=
=3D 2)))
> +        return H_PARAMETER;
> +
> +    /* Invalidate everything, not much else we can do */
> +    cpu->env.tlb_need_flush =3D TLB_NEED_GLOBAL_FLUSH | TLB_NEED_LOCAL_F=
LUSH;
> +    return H_SUCCESS;
> +}
> +
>  static spapr_hcall_fn papr_hypercall_table[(MAX_HCALL_OPCODE / 4) + 1];
>  static spapr_hcall_fn kvmppc_hypercall_table[KVMPPC_HCALL_MAX - KVMPPC_H=
CALL_BASE + 1];
> =20
> @@ -2240,6 +2267,7 @@ static void hypercall_register_types(void)
>      /* Platform-specific hcalls used for nested HV KVM */
>      spapr_register_hypercall(H_SET_PARTITION_TABLE, h_set_partition_tabl=
e);
>      spapr_register_hypercall(H_ENTER_NESTED, h_enter_nested);
> +    spapr_register_hypercall(H_TLB_INVALIDATE, h_nested_tlb_invalidate);
> =20
>      /* Virtual Processor Home Node */
>      spapr_register_hypercall(H_HOME_NODE_ASSOCIATIVITY,
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 7083dea9ef..6a614c445f 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -504,7 +504,8 @@ struct SpaprMachineState {
>  /* Platform-specific hcalls used for nested HV KVM */
>  #define H_SET_PARTITION_TABLE   0xF800
>  #define H_ENTER_NESTED          0xF804
> -#define KVMPPC_HCALL_MAX        H_ENTER_NESTED
> +#define H_TLB_INVALIDATE        0xF808
> +#define KVMPPC_HCALL_MAX        H_TLB_INVALIDATE
> =20
>  typedef struct SpaprDeviceTreeUpdateHeader {
>      uint32_t version_id;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--E7i4zwmWs5DOuDSH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlzVGg8ACgkQbDjKyiDZ
s5J3fBAAgU4X4hN1Dnpr+Pkoveqtc5cfRB7vRlJT67NCbimkqesN9fN0F7qx1ADh
mLg7jg7EFEXY53ifLj8o8Hd77OySsiGIBxoeUPUXyYp0SjKRKdHgD6E7yDlMsc4+
KdfQgTYwjXLmS+r3ZHSCSRUwFxv3Zb3pUp7a8ZOVHVySA+H0Kr3mYQsXouUB58lB
r3oQuve0zelowRldJzHPyAktnP5AO3HvJZ2UnTZY5fV2SZKK3DvEvasMwANIOjnc
AYSO95shqPTp7xPT7NGdVQZeulq4B3JPLczzn1FbBy/ui0DQk1OxN5xvjbkXPsat
FKbKaj5OsLIOmcFdDUiWqa+icz5HTWsOk1JUT0pUHR57AqC571h6kuQorPrB9Cn/
J7ic8bPu0AzQ6FyyqLvMm/UGu4MQtpfBniCT7xBl/O+BOn6aEG4lsk71jK7rjH01
p/uk/xnLZ7AhkLkobxOZxyDG9uvfRY4U0AEeg7bVuRONYdXXjI3+xEFKWXUGk5Jr
jGrznS8aqjxqBLQdYZTNDe5vSDsW12gQfWYNOKMevxxr/WvDyV1f9pmLtuhtgO26
k7btVwI+jCRhgWAWTmeL1vdsCQxt4/bHJwEoXLrw342T0n/s+xXO0OBsRMZS8r4t
53MUWuwhuASpGoAJYtfx7fUIPtM3Yt9GkHkRoN7AEVBja57xtE8=
=El53
-----END PGP SIGNATURE-----

--E7i4zwmWs5DOuDSH--

