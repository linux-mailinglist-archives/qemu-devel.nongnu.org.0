Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE0D3710FF
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 06:41:52 +0200 (CEST)
Received: from localhost ([::1]:33096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldQP1-0006sl-6D
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 00:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldQJQ-0007jv-TG; Mon, 03 May 2021 00:36:04 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47125 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldQJN-0002Gq-6k; Mon, 03 May 2021 00:36:04 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FYVXR19zZz9sW8; Mon,  3 May 2021 14:35:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620016551;
 bh=nNSHT0QUZJ8rlaWnnvvGjlowJtexwFGBkB/BiSJS2Tc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CDuw+qZdG4y3hrXJmCNM+LpypW7zpym2ombnIM+SmZK5Oxm3J61xz7G28jqUxSTnF
 ETt5gUwS7Q5LifCd7ZaFPwjSrOI+NlowqmN/7zKTTBgyBXhAxRbFRoCQ47QbNCi2c7
 8HGu38rKG8QRJ4mKE0HFCRuh/56iAJImIiubbiZk=
Date: Mon, 3 May 2021 14:34:21 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: Re: [RFC PATCH v2 2/2] hw/ppc: Moved TCG code to spapr_hcall_tcg
Message-ID: <YI99TaLqKsqBRRxJ@yekko>
References: <20210430184047.81653-1-lucas.araujo@eldorado.org.br>
 <20210430184047.81653-3-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/C35JDL39tzlhgUT"
Content-Disposition: inline
In-Reply-To: <20210430184047.81653-3-lucas.araujo@eldorado.org.br>
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 farosas@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/C35JDL39tzlhgUT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 03:40:47PM -0300, Lucas Mateus Castro (alqotel) wro=
te:
> Moved h_enter, remove_hpte, h_remove, h_bulk_remove,h_protect and
> h_read to spapr_hcall_tcg.c, added h_tcg_only to be used in a !TCG
> environment in spapr_hcall.c and changed build options to only build
> spapr_hcall_tcg.c when CONFIG_TCG is enabled.

This looks good.  I'd suggest the name 'spapr_softmmu.c' instead,
which more specifically describes what's special about these
functions.

h_resize_hpt_prepare(), h_resize_hpt_commit() and the functions they
depend on belong in the softmmu set as well.

> Added the function h_tcg_only to be used for hypercalls that should be
> called only in TCG environment but have been called in a TCG-less
> one.

Again, 'h_softmmu' would be a better name.

>=20
> Right now, a #ifndef is used to know if there is a need of a h_tcg_only
> function to be implemented and used as hypercalls, I initially thought
> of always having that option turned on and having spapr_hcall_tcg.c
> overwrite those hypercalls when TCG is enabled, but
> spapr_register_hypercalls checks if a hypercall already exists for that
> opcode so that wouldn't work, so if anyone has any suggestions I'm
> interested.

The ifdef is fine.  We don't want to litter the code with them, but a
few is fine.  Especially in this context where it's pretty clearly
just excluding some things from a simple list of calls.

>=20
> Also spapr_hcall_tcg.c only has 2 duplicated functions (valid_ptex and
> is_ram_address), what is the advised way to deal with these
> duplications?

valid_ptex() is only used by softmmu functions that are moving, so it
should travel with them, no need for duplication.  is_ram_address() is
also used by h_page_init() which is also needed in !TCG code.  So,
leave it in spapr_hcall.c and just export it for use in the TCG only
code.

>=20
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.b=
r>
> ---
>  hw/ppc/meson.build       |   3 +
>  hw/ppc/spapr_hcall.c     | 300 ++--------------------------------
>  hw/ppc/spapr_hcall_tcg.c | 343 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 363 insertions(+), 283 deletions(-)
>  create mode 100644 hw/ppc/spapr_hcall_tcg.c
>=20
> diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
> index 218631c883..3c7f2f08b7 100644
> --- a/hw/ppc/meson.build
> +++ b/hw/ppc/meson.build
> @@ -29,6 +29,9 @@ ppc_ss.add(when: 'CONFIG_PSERIES', if_true: files(
>    'spapr_numa.c',
>    'pef.c',
>  ))
> +ppc_ss.add(when: ['CONFIG_PSERIES', 'CONFIG_TCG'], if_true: files(
> +  'spapr_hcall_tcg.c'
> +))
>  ppc_ss.add(when: 'CONFIG_SPAPR_RNG', if_true: files('spapr_rng.c'))
>  ppc_ss.add(when: ['CONFIG_PSERIES', 'CONFIG_LINUX'], if_true: files(
>    'spapr_pci_vfio.c',
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 4b0ba69841..b37fbdc32e 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -22,6 +22,15 @@
>  #include "mmu-book3s-v3.h"
>  #include "hw/mem/memory-device.h"
> =20
> +#ifndef CONFIG_TCG
> +static target_ulong h_tcg_only(PowerPCCPU *cpu, SpaprMachineState *spapr,
> +                            target_ulong opcode, target_ulong *args)
> +{
> +    g_assert_not_reached();
> +    return 0;
> +}
> +#endif /* !CONFIG_TCG */
> +
>  static bool has_spr(PowerPCCPU *cpu, int spr)
>  {
>      /* We can test whether the SPR is defined by checking for a valid na=
me */
> @@ -55,284 +64,6 @@ static bool is_ram_address(SpaprMachineState *spapr, =
hwaddr addr)
>      return false;
>  }
> =20
> -static target_ulong h_enter(PowerPCCPU *cpu, SpaprMachineState *spapr,
> -                            target_ulong opcode, target_ulong *args)
> -{
> -    target_ulong flags =3D args[0];
> -    target_ulong ptex =3D args[1];
> -    target_ulong pteh =3D args[2];
> -    target_ulong ptel =3D args[3];
> -    unsigned apshift;
> -    target_ulong raddr;
> -    target_ulong slot;
> -    const ppc_hash_pte64_t *hptes;
> -
> -    apshift =3D ppc_hash64_hpte_page_shift_noslb(cpu, pteh, ptel);
> -    if (!apshift) {
> -        /* Bad page size encoding */
> -        return H_PARAMETER;
> -    }
> -
> -    raddr =3D (ptel & HPTE64_R_RPN) & ~((1ULL << apshift) - 1);
> -
> -    if (is_ram_address(spapr, raddr)) {
> -        /* Regular RAM - should have WIMG=3D0010 */
> -        if ((ptel & HPTE64_R_WIMG) !=3D HPTE64_R_M) {
> -            return H_PARAMETER;
> -        }
> -    } else {
> -        target_ulong wimg_flags;
> -        /* Looks like an IO address */
> -        /* FIXME: What WIMG combinations could be sensible for IO?
> -         * For now we allow WIMG=3D010x, but are there others? */
> -        /* FIXME: Should we check against registered IO addresses? */
> -        wimg_flags =3D (ptel & (HPTE64_R_W | HPTE64_R_I | HPTE64_R_M));
> -
> -        if (wimg_flags !=3D HPTE64_R_I &&
> -            wimg_flags !=3D (HPTE64_R_I | HPTE64_R_M)) {
> -            return H_PARAMETER;
> -        }
> -    }
> -
> -    pteh &=3D ~0x60ULL;
> -
> -    if (!valid_ptex(cpu, ptex)) {
> -        return H_PARAMETER;
> -    }
> -
> -    slot =3D ptex & 7ULL;
> -    ptex =3D ptex & ~7ULL;
> -
> -    if (likely((flags & H_EXACT) =3D=3D 0)) {
> -        hptes =3D ppc_hash64_map_hptes(cpu, ptex, HPTES_PER_GROUP);
> -        for (slot =3D 0; slot < 8; slot++) {
> -            if (!(ppc_hash64_hpte0(cpu, hptes, slot) & HPTE64_V_VALID)) {
> -                break;
> -            }
> -        }
> -        ppc_hash64_unmap_hptes(cpu, hptes, ptex, HPTES_PER_GROUP);
> -        if (slot =3D=3D 8) {
> -            return H_PTEG_FULL;
> -        }
> -    } else {
> -        hptes =3D ppc_hash64_map_hptes(cpu, ptex + slot, 1);
> -        if (ppc_hash64_hpte0(cpu, hptes, 0) & HPTE64_V_VALID) {
> -            ppc_hash64_unmap_hptes(cpu, hptes, ptex + slot, 1);
> -            return H_PTEG_FULL;
> -        }
> -        ppc_hash64_unmap_hptes(cpu, hptes, ptex, 1);
> -    }
> -
> -    spapr_store_hpte(cpu, ptex + slot, pteh | HPTE64_V_HPTE_DIRTY, ptel);
> -
> -    args[0] =3D ptex + slot;
> -    return H_SUCCESS;
> -}
> -
> -typedef enum {
> -    REMOVE_SUCCESS =3D 0,
> -    REMOVE_NOT_FOUND =3D 1,
> -    REMOVE_PARM =3D 2,
> -    REMOVE_HW =3D 3,
> -} RemoveResult;
> -
> -static RemoveResult remove_hpte(PowerPCCPU *cpu
> -                                , target_ulong ptex,
> -                                target_ulong avpn,
> -                                target_ulong flags,
> -                                target_ulong *vp, target_ulong *rp)
> -{
> -    const ppc_hash_pte64_t *hptes;
> -    target_ulong v, r;
> -
> -    if (!valid_ptex(cpu, ptex)) {
> -        return REMOVE_PARM;
> -    }
> -
> -    hptes =3D ppc_hash64_map_hptes(cpu, ptex, 1);
> -    v =3D ppc_hash64_hpte0(cpu, hptes, 0);
> -    r =3D ppc_hash64_hpte1(cpu, hptes, 0);
> -    ppc_hash64_unmap_hptes(cpu, hptes, ptex, 1);
> -
> -    if ((v & HPTE64_V_VALID) =3D=3D 0 ||
> -        ((flags & H_AVPN) && (v & ~0x7fULL) !=3D avpn) ||
> -        ((flags & H_ANDCOND) && (v & avpn) !=3D 0)) {
> -        return REMOVE_NOT_FOUND;
> -    }
> -    *vp =3D v;
> -    *rp =3D r;
> -    spapr_store_hpte(cpu, ptex, HPTE64_V_HPTE_DIRTY, 0);
> -    ppc_hash64_tlb_flush_hpte(cpu, ptex, v, r);
> -    return REMOVE_SUCCESS;
> -}
> -
> -static target_ulong h_remove(PowerPCCPU *cpu, SpaprMachineState *spapr,
> -                             target_ulong opcode, target_ulong *args)
> -{
> -    CPUPPCState *env =3D &cpu->env;
> -    target_ulong flags =3D args[0];
> -    target_ulong ptex =3D args[1];
> -    target_ulong avpn =3D args[2];
> -    RemoveResult ret;
> -
> -    ret =3D remove_hpte(cpu, ptex, avpn, flags,
> -                      &args[0], &args[1]);
> -
> -    switch (ret) {
> -    case REMOVE_SUCCESS:
> -        check_tlb_flush(env, true);
> -        return H_SUCCESS;
> -
> -    case REMOVE_NOT_FOUND:
> -        return H_NOT_FOUND;
> -
> -    case REMOVE_PARM:
> -        return H_PARAMETER;
> -
> -    case REMOVE_HW:
> -        return H_HARDWARE;
> -    }
> -
> -    g_assert_not_reached();
> -}
> -
> -#define H_BULK_REMOVE_TYPE             0xc000000000000000ULL
> -#define   H_BULK_REMOVE_REQUEST        0x4000000000000000ULL
> -#define   H_BULK_REMOVE_RESPONSE       0x8000000000000000ULL
> -#define   H_BULK_REMOVE_END            0xc000000000000000ULL
> -#define H_BULK_REMOVE_CODE             0x3000000000000000ULL
> -#define   H_BULK_REMOVE_SUCCESS        0x0000000000000000ULL
> -#define   H_BULK_REMOVE_NOT_FOUND      0x1000000000000000ULL
> -#define   H_BULK_REMOVE_PARM           0x2000000000000000ULL
> -#define   H_BULK_REMOVE_HW             0x3000000000000000ULL
> -#define H_BULK_REMOVE_RC               0x0c00000000000000ULL
> -#define H_BULK_REMOVE_FLAGS            0x0300000000000000ULL
> -#define   H_BULK_REMOVE_ABSOLUTE       0x0000000000000000ULL
> -#define   H_BULK_REMOVE_ANDCOND        0x0100000000000000ULL
> -#define   H_BULK_REMOVE_AVPN           0x0200000000000000ULL
> -#define H_BULK_REMOVE_PTEX             0x00ffffffffffffffULL
> -
> -#define H_BULK_REMOVE_MAX_BATCH        4
> -
> -static target_ulong h_bulk_remove(PowerPCCPU *cpu, SpaprMachineState *sp=
apr,
> -                                  target_ulong opcode, target_ulong *arg=
s)
> -{
> -    CPUPPCState *env =3D &cpu->env;
> -    int i;
> -    target_ulong rc =3D H_SUCCESS;
> -
> -    for (i =3D 0; i < H_BULK_REMOVE_MAX_BATCH; i++) {
> -        target_ulong *tsh =3D &args[i*2];
> -        target_ulong tsl =3D args[i*2 + 1];
> -        target_ulong v, r, ret;
> -
> -        if ((*tsh & H_BULK_REMOVE_TYPE) =3D=3D H_BULK_REMOVE_END) {
> -            break;
> -        } else if ((*tsh & H_BULK_REMOVE_TYPE) !=3D H_BULK_REMOVE_REQUES=
T) {
> -            return H_PARAMETER;
> -        }
> -
> -        *tsh &=3D H_BULK_REMOVE_PTEX | H_BULK_REMOVE_FLAGS;
> -        *tsh |=3D H_BULK_REMOVE_RESPONSE;
> -
> -        if ((*tsh & H_BULK_REMOVE_ANDCOND) && (*tsh & H_BULK_REMOVE_AVPN=
)) {
> -            *tsh |=3D H_BULK_REMOVE_PARM;
> -            return H_PARAMETER;
> -        }
> -
> -        ret =3D remove_hpte(cpu, *tsh & H_BULK_REMOVE_PTEX, tsl,
> -                          (*tsh & H_BULK_REMOVE_FLAGS) >> 26,
> -                          &v, &r);
> -
> -        *tsh |=3D ret << 60;
> -
> -        switch (ret) {
> -        case REMOVE_SUCCESS:
> -            *tsh |=3D (r & (HPTE64_R_C | HPTE64_R_R)) << 43;
> -            break;
> -
> -        case REMOVE_PARM:
> -            rc =3D H_PARAMETER;
> -            goto exit;
> -
> -        case REMOVE_HW:
> -            rc =3D H_HARDWARE;
> -            goto exit;
> -        }
> -    }
> - exit:
> -    check_tlb_flush(env, true);
> -
> -    return rc;
> -}
> -
> -static target_ulong h_protect(PowerPCCPU *cpu, SpaprMachineState *spapr,
> -                              target_ulong opcode, target_ulong *args)
> -{
> -    CPUPPCState *env =3D &cpu->env;
> -    target_ulong flags =3D args[0];
> -    target_ulong ptex =3D args[1];
> -    target_ulong avpn =3D args[2];
> -    const ppc_hash_pte64_t *hptes;
> -    target_ulong v, r;
> -
> -    if (!valid_ptex(cpu, ptex)) {
> -        return H_PARAMETER;
> -    }
> -
> -    hptes =3D ppc_hash64_map_hptes(cpu, ptex, 1);
> -    v =3D ppc_hash64_hpte0(cpu, hptes, 0);
> -    r =3D ppc_hash64_hpte1(cpu, hptes, 0);
> -    ppc_hash64_unmap_hptes(cpu, hptes, ptex, 1);
> -
> -    if ((v & HPTE64_V_VALID) =3D=3D 0 ||
> -        ((flags & H_AVPN) && (v & ~0x7fULL) !=3D avpn)) {
> -        return H_NOT_FOUND;
> -    }
> -
> -    r &=3D ~(HPTE64_R_PP0 | HPTE64_R_PP | HPTE64_R_N |
> -           HPTE64_R_KEY_HI | HPTE64_R_KEY_LO);
> -    r |=3D (flags << 55) & HPTE64_R_PP0;
> -    r |=3D (flags << 48) & HPTE64_R_KEY_HI;
> -    r |=3D flags & (HPTE64_R_PP | HPTE64_R_N | HPTE64_R_KEY_LO);
> -    spapr_store_hpte(cpu, ptex,
> -                     (v & ~HPTE64_V_VALID) | HPTE64_V_HPTE_DIRTY, 0);
> -    ppc_hash64_tlb_flush_hpte(cpu, ptex, v, r);
> -    /* Flush the tlb */
> -    check_tlb_flush(env, true);
> -    /* Don't need a memory barrier, due to qemu's global lock */
> -    spapr_store_hpte(cpu, ptex, v | HPTE64_V_HPTE_DIRTY, r);
> -    return H_SUCCESS;
> -}
> -
> -static target_ulong h_read(PowerPCCPU *cpu, SpaprMachineState *spapr,
> -                           target_ulong opcode, target_ulong *args)
> -{
> -    target_ulong flags =3D args[0];
> -    target_ulong ptex =3D args[1];
> -    int i, ridx, n_entries =3D 1;
> -    const ppc_hash_pte64_t *hptes;
> -
> -    if (!valid_ptex(cpu, ptex)) {
> -        return H_PARAMETER;
> -    }
> -
> -    if (flags & H_READ_4) {
> -        /* Clear the two low order bits */
> -        ptex &=3D ~(3ULL);
> -        n_entries =3D 4;
> -    }
> -
> -    hptes =3D ppc_hash64_map_hptes(cpu, ptex, n_entries);
> -    for (i =3D 0, ridx =3D 0; i < n_entries; i++) {
> -        args[ridx++] =3D ppc_hash64_hpte0(cpu, hptes, i);
> -        args[ridx++] =3D ppc_hash64_hpte1(cpu, hptes, i);
> -    }
> -    ppc_hash64_unmap_hptes(cpu, hptes, ptex, n_entries);
> -
> -    return H_SUCCESS;
> -}
> -
>  struct SpaprPendingHpt {
>      /* These fields are read-only after initialization */
>      int shift;
> @@ -2021,14 +1752,17 @@ target_ulong spapr_hypercall(PowerPCCPU *cpu, tar=
get_ulong opcode,
> =20
>  static void hypercall_register_types(void)
>  {
> +
> +#ifndef CONFIG_TCG
>      /* hcall-pft */
> -    spapr_register_hypercall(H_ENTER, h_enter);
> -    spapr_register_hypercall(H_REMOVE, h_remove);
> -    spapr_register_hypercall(H_PROTECT, h_protect);
> -    spapr_register_hypercall(H_READ, h_read);
> +    spapr_register_hypercall(H_ENTER, h_tcg_only);
> +    spapr_register_hypercall(H_REMOVE, h_tcg_only);
> +    spapr_register_hypercall(H_PROTECT, h_tcg_only);
> +    spapr_register_hypercall(H_READ, h_tcg_only);
> =20
>      /* hcall-bulk */
> -    spapr_register_hypercall(H_BULK_REMOVE, h_bulk_remove);
> +    spapr_register_hypercall(H_BULK_REMOVE, h_tcg_only);
> +#endif /* !CONFIG_TCG */
> =20
>      /* hcall-hpt-resize */
>      spapr_register_hypercall(H_RESIZE_HPT_PREPARE, h_resize_hpt_prepare);
> diff --git a/hw/ppc/spapr_hcall_tcg.c b/hw/ppc/spapr_hcall_tcg.c
> new file mode 100644
> index 0000000000..92ff24c8dc
> --- /dev/null
> +++ b/hw/ppc/spapr_hcall_tcg.c
> @@ -0,0 +1,343 @@
> +#include "qemu/osdep.h"
> +#include "qemu/cutils.h"
> +#include "qapi/error.h"
> +#include "sysemu/hw_accel.h"
> +#include "sysemu/runstate.h"
> +#include "qemu/log.h"
> +#include "qemu/main-loop.h"
> +#include "qemu/module.h"
> +#include "qemu/error-report.h"
> +#include "cpu.h"
> +#include "exec/exec-all.h"
> +#include "helper_regs.h"
> +#include "hw/ppc/spapr.h"
> +#include "hw/ppc/spapr_cpu_core.h"
> +#include "mmu-hash64.h"
> +#include "mmu-misc.h"
> +#include "cpu-models.h"
> +#include "trace.h"
> +#include "kvm_ppc.h"
> +#include "hw/ppc/fdt.h"
> +#include "hw/ppc/spapr_ovec.h"
> +#include "mmu-book3s-v3.h"
> +#include "hw/mem/memory-device.h"
> +
> +static inline bool valid_ptex(PowerPCCPU *cpu, target_ulong ptex)
> +{
> +    /*
> +     * hash value/pteg group index is normalized by HPT mask
> +     */
> +    if (((ptex & ~7ULL) / HPTES_PER_GROUP) & ~ppc_hash64_hpt_mask(cpu)) {
> +        return false;
> +    }
> +    return true;
> +}
> +
> +static bool is_ram_address(SpaprMachineState *spapr, hwaddr addr)
> +{
> +    MachineState *machine =3D MACHINE(spapr);
> +    DeviceMemoryState *dms =3D machine->device_memory;
> +
> +    if (addr < machine->ram_size) {
> +        return true;
> +    }
> +    if ((addr >=3D dms->base)
> +        && ((addr - dms->base) < memory_region_size(&dms->mr))) {
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
> +static target_ulong h_enter(PowerPCCPU *cpu, SpaprMachineState *spapr,
> +                            target_ulong opcode, target_ulong *args)
> +{
> +    target_ulong flags =3D args[0];
> +    target_ulong ptex =3D args[1];
> +    target_ulong pteh =3D args[2];
> +    target_ulong ptel =3D args[3];
> +    unsigned apshift;
> +    target_ulong raddr;
> +    target_ulong slot;
> +    const ppc_hash_pte64_t *hptes;
> +
> +    apshift =3D ppc_hash64_hpte_page_shift_noslb(cpu, pteh, ptel);
> +    if (!apshift) {
> +        /* Bad page size encoding */
> +        return H_PARAMETER;
> +    }
> +
> +    raddr =3D (ptel & HPTE64_R_RPN) & ~((1ULL << apshift) - 1);
> +
> +    if (is_ram_address(spapr, raddr)) {
> +        /* Regular RAM - should have WIMG=3D0010 */
> +        if ((ptel & HPTE64_R_WIMG) !=3D HPTE64_R_M) {
> +            return H_PARAMETER;
> +        }
> +    } else {
> +        target_ulong wimg_flags;
> +        /* Looks like an IO address */
> +        /* FIXME: What WIMG combinations could be sensible for IO?
> +         * For now we allow WIMG=3D010x, but are there others? */
> +        /* FIXME: Should we check against registered IO addresses? */
> +        wimg_flags =3D (ptel & (HPTE64_R_W | HPTE64_R_I | HPTE64_R_M));
> +
> +        if (wimg_flags !=3D HPTE64_R_I &&
> +            wimg_flags !=3D (HPTE64_R_I | HPTE64_R_M)) {
> +            return H_PARAMETER;
> +        }
> +    }
> +
> +    pteh &=3D ~0x60ULL;
> +
> +    if (!valid_ptex(cpu, ptex)) {
> +        return H_PARAMETER;
> +    }
> +
> +    slot =3D ptex & 7ULL;
> +    ptex =3D ptex & ~7ULL;
> +
> +    if (likely((flags & H_EXACT) =3D=3D 0)) {
> +        hptes =3D ppc_hash64_map_hptes(cpu, ptex, HPTES_PER_GROUP);
> +        for (slot =3D 0; slot < 8; slot++) {
> +            if (!(ppc_hash64_hpte0(cpu, hptes, slot) & HPTE64_V_VALID)) {
> +                break;
> +            }
> +        }
> +        ppc_hash64_unmap_hptes(cpu, hptes, ptex, HPTES_PER_GROUP);
> +        if (slot =3D=3D 8) {
> +            return H_PTEG_FULL;
> +        }
> +    } else {
> +        hptes =3D ppc_hash64_map_hptes(cpu, ptex + slot, 1);
> +        if (ppc_hash64_hpte0(cpu, hptes, 0) & HPTE64_V_VALID) {
> +            ppc_hash64_unmap_hptes(cpu, hptes, ptex + slot, 1);
> +            return H_PTEG_FULL;
> +        }
> +        ppc_hash64_unmap_hptes(cpu, hptes, ptex, 1);
> +    }
> +
> +    spapr_store_hpte(cpu, ptex + slot, pteh | HPTE64_V_HPTE_DIRTY, ptel);
> +
> +    args[0] =3D ptex + slot;
> +    return H_SUCCESS;
> +}
> +
> +typedef enum {
> +    REMOVE_SUCCESS =3D 0,
> +    REMOVE_NOT_FOUND =3D 1,
> +    REMOVE_PARM =3D 2,
> +    REMOVE_HW =3D 3,
> +} RemoveResult;
> +
> +static RemoveResult remove_hpte(PowerPCCPU *cpu
> +                                , target_ulong ptex,
> +                                target_ulong avpn,
> +                                target_ulong flags,
> +                                target_ulong *vp, target_ulong *rp)
> +{
> +    const ppc_hash_pte64_t *hptes;
> +    target_ulong v, r;
> +
> +    if (!valid_ptex(cpu, ptex)) {
> +        return REMOVE_PARM;
> +    }
> +
> +    hptes =3D ppc_hash64_map_hptes(cpu, ptex, 1);
> +    v =3D ppc_hash64_hpte0(cpu, hptes, 0);
> +    r =3D ppc_hash64_hpte1(cpu, hptes, 0);
> +    ppc_hash64_unmap_hptes(cpu, hptes, ptex, 1);
> +
> +    if ((v & HPTE64_V_VALID) =3D=3D 0 ||
> +        ((flags & H_AVPN) && (v & ~0x7fULL) !=3D avpn) ||
> +        ((flags & H_ANDCOND) && (v & avpn) !=3D 0)) {
> +        return REMOVE_NOT_FOUND;
> +    }
> +    *vp =3D v;
> +    *rp =3D r;
> +    spapr_store_hpte(cpu, ptex, HPTE64_V_HPTE_DIRTY, 0);
> +    ppc_hash64_tlb_flush_hpte(cpu, ptex, v, r);
> +    return REMOVE_SUCCESS;
> +}
> +
> +static target_ulong h_remove(PowerPCCPU *cpu, SpaprMachineState *spapr,
> +                             target_ulong opcode, target_ulong *args)
> +{
> +    CPUPPCState *env =3D &cpu->env;
> +    target_ulong flags =3D args[0];
> +    target_ulong ptex =3D args[1];
> +    target_ulong avpn =3D args[2];
> +    RemoveResult ret;
> +
> +    ret =3D remove_hpte(cpu, ptex, avpn, flags,
> +                      &args[0], &args[1]);
> +
> +    switch (ret) {
> +    case REMOVE_SUCCESS:
> +        check_tlb_flush(env, true);
> +        return H_SUCCESS;
> +
> +    case REMOVE_NOT_FOUND:
> +        return H_NOT_FOUND;
> +
> +    case REMOVE_PARM:
> +        return H_PARAMETER;
> +
> +    case REMOVE_HW:
> +        return H_HARDWARE;
> +    }
> +
> +    g_assert_not_reached();
> +}
> +
> +#define H_BULK_REMOVE_TYPE             0xc000000000000000ULL
> +#define   H_BULK_REMOVE_REQUEST        0x4000000000000000ULL
> +#define   H_BULK_REMOVE_RESPONSE       0x8000000000000000ULL
> +#define   H_BULK_REMOVE_END            0xc000000000000000ULL
> +#define H_BULK_REMOVE_CODE             0x3000000000000000ULL
> +#define   H_BULK_REMOVE_SUCCESS        0x0000000000000000ULL
> +#define   H_BULK_REMOVE_NOT_FOUND      0x1000000000000000ULL
> +#define   H_BULK_REMOVE_PARM           0x2000000000000000ULL
> +#define   H_BULK_REMOVE_HW             0x3000000000000000ULL
> +#define H_BULK_REMOVE_RC               0x0c00000000000000ULL
> +#define H_BULK_REMOVE_FLAGS            0x0300000000000000ULL
> +#define   H_BULK_REMOVE_ABSOLUTE       0x0000000000000000ULL
> +#define   H_BULK_REMOVE_ANDCOND        0x0100000000000000ULL
> +#define   H_BULK_REMOVE_AVPN           0x0200000000000000ULL
> +#define H_BULK_REMOVE_PTEX             0x00ffffffffffffffULL
> +
> +#define H_BULK_REMOVE_MAX_BATCH        4
> +
> +static target_ulong h_bulk_remove(PowerPCCPU *cpu, SpaprMachineState *sp=
apr,
> +                                  target_ulong opcode, target_ulong *arg=
s)
> +{
> +    CPUPPCState *env =3D &cpu->env;
> +    int i;
> +    target_ulong rc =3D H_SUCCESS;
> +
> +    for (i =3D 0; i < H_BULK_REMOVE_MAX_BATCH; i++) {
> +        target_ulong *tsh =3D &args[i*2];
> +        target_ulong tsl =3D args[i*2 + 1];
> +        target_ulong v, r, ret;
> +
> +        if ((*tsh & H_BULK_REMOVE_TYPE) =3D=3D H_BULK_REMOVE_END) {
> +            break;
> +        } else if ((*tsh & H_BULK_REMOVE_TYPE) !=3D H_BULK_REMOVE_REQUES=
T) {
> +            return H_PARAMETER;
> +        }
> +
> +        *tsh &=3D H_BULK_REMOVE_PTEX | H_BULK_REMOVE_FLAGS;
> +        *tsh |=3D H_BULK_REMOVE_RESPONSE;
> +
> +        if ((*tsh & H_BULK_REMOVE_ANDCOND) && (*tsh & H_BULK_REMOVE_AVPN=
)) {
> +            *tsh |=3D H_BULK_REMOVE_PARM;
> +            return H_PARAMETER;
> +        }
> +
> +        ret =3D remove_hpte(cpu, *tsh & H_BULK_REMOVE_PTEX, tsl,
> +                          (*tsh & H_BULK_REMOVE_FLAGS) >> 26,
> +                          &v, &r);
> +
> +        *tsh |=3D ret << 60;
> +
> +        switch (ret) {
> +        case REMOVE_SUCCESS:
> +            *tsh |=3D (r & (HPTE64_R_C | HPTE64_R_R)) << 43;
> +            break;
> +
> +        case REMOVE_PARM:
> +            rc =3D H_PARAMETER;
> +            goto exit;
> +
> +        case REMOVE_HW:
> +            rc =3D H_HARDWARE;
> +            goto exit;
> +        }
> +    }
> + exit:
> +    check_tlb_flush(env, true);
> +
> +    return rc;
> +}
> +
> +static target_ulong h_protect(PowerPCCPU *cpu, SpaprMachineState *spapr,
> +                              target_ulong opcode, target_ulong *args)
> +{
> +    CPUPPCState *env =3D &cpu->env;
> +    target_ulong flags =3D args[0];
> +    target_ulong ptex =3D args[1];
> +    target_ulong avpn =3D args[2];
> +    const ppc_hash_pte64_t *hptes;
> +    target_ulong v, r;
> +
> +    if (!valid_ptex(cpu, ptex)) {
> +        return H_PARAMETER;
> +    }
> +
> +    hptes =3D ppc_hash64_map_hptes(cpu, ptex, 1);
> +    v =3D ppc_hash64_hpte0(cpu, hptes, 0);
> +    r =3D ppc_hash64_hpte1(cpu, hptes, 0);
> +    ppc_hash64_unmap_hptes(cpu, hptes, ptex, 1);
> +
> +    if ((v & HPTE64_V_VALID) =3D=3D 0 ||
> +        ((flags & H_AVPN) && (v & ~0x7fULL) !=3D avpn)) {
> +        return H_NOT_FOUND;
> +    }
> +
> +    r &=3D ~(HPTE64_R_PP0 | HPTE64_R_PP | HPTE64_R_N |
> +           HPTE64_R_KEY_HI | HPTE64_R_KEY_LO);
> +    r |=3D (flags << 55) & HPTE64_R_PP0;
> +    r |=3D (flags << 48) & HPTE64_R_KEY_HI;
> +    r |=3D flags & (HPTE64_R_PP | HPTE64_R_N | HPTE64_R_KEY_LO);
> +    spapr_store_hpte(cpu, ptex,
> +                     (v & ~HPTE64_V_VALID) | HPTE64_V_HPTE_DIRTY, 0);
> +    ppc_hash64_tlb_flush_hpte(cpu, ptex, v, r);
> +    /* Flush the tlb */
> +    check_tlb_flush(env, true);
> +    /* Don't need a memory barrier, due to qemu's global lock */
> +    spapr_store_hpte(cpu, ptex, v | HPTE64_V_HPTE_DIRTY, r);
> +    return H_SUCCESS;
> +}
> +
> +static target_ulong h_read(PowerPCCPU *cpu, SpaprMachineState *spapr,
> +                           target_ulong opcode, target_ulong *args)
> +{
> +    target_ulong flags =3D args[0];
> +    target_ulong ptex =3D args[1];
> +    int i, ridx, n_entries =3D 1;
> +    const ppc_hash_pte64_t *hptes;
> +
> +    if (!valid_ptex(cpu, ptex)) {
> +        return H_PARAMETER;
> +    }
> +
> +    if (flags & H_READ_4) {
> +        /* Clear the two low order bits */
> +        ptex &=3D ~(3ULL);
> +        n_entries =3D 4;
> +    }
> +
> +    hptes =3D ppc_hash64_map_hptes(cpu, ptex, n_entries);
> +    for (i =3D 0, ridx =3D 0; i < n_entries; i++) {
> +        args[ridx++] =3D ppc_hash64_hpte0(cpu, hptes, i);
> +        args[ridx++] =3D ppc_hash64_hpte1(cpu, hptes, i);
> +    }
> +    ppc_hash64_unmap_hptes(cpu, hptes, ptex, n_entries);
> +
> +    return H_SUCCESS;
> +}
> +
> +
> +static void hypercall_register_types(void)
> +{
> +    /* hcall-pft */
> +    spapr_register_hypercall(H_ENTER, h_enter);
> +    spapr_register_hypercall(H_REMOVE, h_remove);
> +    spapr_register_hypercall(H_PROTECT, h_protect);
> +    spapr_register_hypercall(H_READ, h_read);
> +
> +    /* hcall-bulk */
> +    spapr_register_hypercall(H_BULK_REMOVE, h_bulk_remove);
> +}
> +
> +type_init(hypercall_register_types)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/C35JDL39tzlhgUT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCPfU0ACgkQbDjKyiDZ
s5K++g//QsDKhP9kt284JAi5KQ2iS2SJnSqdv4bgw3Oc7kXIder4+V934eE4Tgtd
mPDNdGltmv98BZSvq1wgPZN6IVICpqonTFXJ3os447KpGQ6JNFYPLB+TOMieKApN
ILdtHlPiUG2X8zSRVMOf3oSWWhvWAmEooUVjZTsSgjCHyFbkuiOJKCBNca7OlBZ6
zXgJ84EfhBFQOkRWpDZ5YD9u2pi7I8wkrpzmlAK17JGpYfXELOaNsEBhcr5T/ua0
sgvsjNtrZj/MpYer6e3wyohMy+VUs6WwTGBJV4IiQGRN2eyxhe/FvTXwmGQSSYAb
ayn+CwTY9ShCVUDZjXC8ezj/5IyObykv1yJBvx6FtyiVWghVl6Vw+4O9v+rc+gkK
7vHe88uJmWM+fQHPxrMSXm0SuQSgGeRZzj7g1NP98kiPhJuQLEIeH4bN/aoCAQqv
O47S+fhzq7H21u5iY0CChb2HzSgxSegpDESloWhTXGCecjb7u1u3ThKrqiBk16PT
gSl6Hqrc1Lb2SwVWvJabbz7mFJV2LuGEJx1M1MA5smJJNBHud4BzobjzAogUhpxZ
PV4tE5uVg43ooNqIPhBdvJwNP+QTnuiTzQvb9Tc/Dq7RX19p7Degqgp8K2A/SkEm
r6o9t39Sx35ZtgSx93RoQ0Kq3RXOED9VJ9vsjb5wJMddzBGJ+ew=
=UUDo
-----END PGP SIGNATURE-----

--/C35JDL39tzlhgUT--

