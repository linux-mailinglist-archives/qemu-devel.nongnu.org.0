Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7E936BDD3
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 05:44:01 +0200 (CEST)
Received: from localhost ([::1]:44118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbEdk-0001OP-Kb
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 23:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lbEZI-000552-8M; Mon, 26 Apr 2021 23:39:24 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42355 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lbEZF-0005S7-3b; Mon, 26 Apr 2021 23:39:24 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FTnYw24q4z9sW4; Tue, 27 Apr 2021 13:39:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1619494756;
 bh=9sR40VAmkgqutTV4rDGH3fc4UU9AERcc4Zy0fj6W2eY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ESSfUu+KJSAEePs4jpr+j4MHVdT2EQ5zidYfOvhAzSu8R32MOwRQbum2xtObb39nk
 mpFOpDf75T80enIPwyWI0pG4FWqOP8JJrw04vpk2fACPriP0OFfJgHVt5A8kNWAfZW
 fSNoo1i+kkHq7zyqN7/JZJ3yVc+kZ/ollX4/aFM8=
Date: Tue, 27 Apr 2021 13:35:03 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC PATCH 3/4] target/ppc: Move SPR generation to separate file
Message-ID: <YIeGZ922R8xJftCA@yekko.fritz.box>
References: <20210423191807.77963-1-bruno.larsen@eldorado.org.br>
 <20210423191807.77963-4-bruno.larsen@eldorado.org.br>
 <87k0oo3g9m.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="z/k39wWIFvfRkyo/"
Content-Disposition: inline
In-Reply-To: <87k0oo3g9m.fsf@linux.ibm.com>
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
Cc: lucas.araujo@eldorado.org.br, qemu-devel@nongnu.org,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--z/k39wWIFvfRkyo/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 26, 2021 at 06:08:53PM -0300, Fabiano Rosas wrote:
> "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> writes:
>=20
> > This move is required to enable building without TCG.
> > All the logic related to registering SPRs specific to
> > some architectures or machines has been hidden in this
> > new file.
>=20
> Hm... I thought we ended up deciding to keep the gen_spr_<machine>
> functions in translate_init.c.inc (cpu_init.c). I don't strongly favour
> one way or the other, but one alternative would be to just rename the
> gen_spr_<machine> functions to add_sprs_<machine> or even
> register_<machine>_sprs and leave them where they are.

Right.  I think renaming these away from gen_*() is a good idea, to
avoid confusion with the other gen_*() functions which, well, generate
TCG code.

I don't think there's a lot of value in moving them out from
translate_init.  Honestly the more useful way to break up
translate_init would be by CPU family, rather than by SPR vs. non-SPR
setup

>=20
> > The idea of this final patch is to hide all SPR generation from
> > translate_init, but in an effort to simplify the RFC the 4
> > functions for not_implemented SPRs were created. They'll be
> > substituted by gen_spr_<machine>_misc in reusable ways for the
> > final patch.
>=20
> I'd expect this patch to be just a big removal of gen_spr* from
> translate_init.c.inc and their addition into spr_common.c. So any other
> prep work should come in separate patches ealier in the
> series. Specifically, at least one patch for the macro work and another
> for the refactoring of open coded spr_register calls into gen_spr_*
> functions.

Seconded.

>=20
> > another issue we ran into was vscr_init using static functions
> > means it has to be static, so we had to remove them from=20
> > gen_spr_74xx and gen_spr_book3s_altivec, and have them in
> > the init_procs instead.
>=20
> Looks like moving vscr_init out, along with a more detailed explanation
> of the issue could be in another preliminary change.
>=20
> >
> > Finally, SPR_NOACCESS had to be defined in internal.h, as it
> > is used by spr_common, translate_init and translate. If there
> > is a better solution, I'll be happy to implement it.
> >
> > As for the redundant code complaint this patch will get, it has only
> > been moved, so I don't know if I can remove that code
> >
> > Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> > ---
> >  target/ppc/internal.h           |  108 +
> >  target/ppc/meson.build          |    1 +
> >  target/ppc/spr_common.c         | 2943 ++++++++++++++++++++++
> >  target/ppc/translate_init.c.inc | 4031 ++-----------------------------
> >  4 files changed, 3314 insertions(+), 3769 deletions(-)
> >  create mode 100644 target/ppc/spr_common.c
> >
> > diff --git a/target/ppc/internal.h b/target/ppc/internal.h
> > index de78c23717..25df546eae 100644
> > --- a/target/ppc/internal.h
> > +++ b/target/ppc/internal.h
> > @@ -226,4 +226,112 @@ void destroy_ppc_opcodes(PowerPCCPU *cpu);
> >  void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *ppc);
> >  gchar *ppc_gdb_arch_name(CPUState *cs);
> > =20
> > +/* spr-common.c */
> > +#include "cpu.h"
> > +void gen_spr_generic(CPUPPCState *env);
>=20
> The fact that these are called gen_* is confusing since they don't
> really generate anything. They mostly just add SPRs to the list and
> register the SPR rw callbacks for TCG. Maybe we could rename them at the
> end of the series to something more clear.
>=20
> > +void gen_spr_ne_601(CPUPPCState *env);
> > +void gen_spr_sdr1(CPUPPCState *env);
> > +void gen_low_BATs(CPUPPCState *env);
> > +void gen_high_BATs(CPUPPCState *env);
> > +void gen_tbl(CPUPPCState *env);
> > +void gen_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways);
> > +void gen_spr_G2_755(CPUPPCState *env);
> > +void gen_spr_7xx(CPUPPCState *env);
> > +#ifdef TARGET_PPC64
> > +void gen_spr_amr(CPUPPCState *env);
> > +void gen_spr_iamr(CPUPPCState *env);
> > +#endif /* TARGET_PPC64 */
> > +void gen_spr_thrm(CPUPPCState *env);
> > +void gen_spr_604(CPUPPCState *env);
> > +void gen_spr_603(CPUPPCState *env);
> > +void gen_spr_G2(CPUPPCState *env);
> > +void gen_spr_602(CPUPPCState *env);
> > +void gen_spr_601(CPUPPCState *env);
> > +void gen_spr_74xx(CPUPPCState *env);
> > +void gen_l3_ctrl(CPUPPCState *env);
> > +void gen_74xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways);
> > +void gen_spr_not_implemented(CPUPPCState *env,
> > +                             int num, const char *name);
> > +void gen_spr_not_implemented_ureg(CPUPPCState *env,
> > +                                  int num, const char *name);
> > +void gen_spr_not_implemented_no_write(CPUPPCState *env,
> > +                                      int num, const char *name);
> > +void gen_spr_not_implemented_write_nop(CPUPPCState *env,
> > +                                       int num, const char *name);
> > +void gen_spr_PSSCR(CPUPPCState *env);
> > +void gen_spr_TIDR(CPUPPCState *env);
> > +void gen_spr_pvr(CPUPPCState *env, PowerPCCPUClass *pcc);
> > +void gen_spr_svr(CPUPPCState *env, PowerPCCPUClass *pcc);
> > +void gen_spr_pir(CPUPPCState *env);
> > +void gen_spr_spefscr(CPUPPCState *env);
> > +void gen_spr_l1fgc(CPUPPCState *env, int num, int initial_value);
> > +void gen_spr_hid0(CPUPPCState *env);
> > +void gen_spr_mas73(CPUPPCState *env);
> > +void gen_spr_mmucsr0(CPUPPCState *env);
> > +void gen_spr_l1csr0(CPUPPCState *env);
> > +void gen_spr_l1csr1(CPUPPCState *env);
> > +void gen_spr_l2csr0(CPUPPCState *env);
> > +void gen_spr_usprg3(CPUPPCState *env);
> > +void gen_spr_usprgh(CPUPPCState *env);
> > +void gen_spr_BookE(CPUPPCState *env, uint64_t ivor_mask);
> > +uint32_t gen_tlbncfg(uint32_t assoc, uint32_t minsize,
> > +                     uint32_t maxsize, uint32_t flags,
> > +                     uint32_t nentries);
> > +void gen_spr_BookE206(CPUPPCState *env, uint32_t mas_mask,
> > +                             uint32_t *tlbncfg, uint32_t mmucfg);
> > +void gen_spr_440(CPUPPCState *env);
> > +void gen_spr_440_misc(CPUPPCState *env);
> > +void gen_spr_40x(CPUPPCState *env);
> > +void gen_spr_405(CPUPPCState *env);
> > +void gen_spr_401_403(CPUPPCState *env);
> > +void gen_spr_401(CPUPPCState *env);
> > +void gen_spr_401x2(CPUPPCState *env);
> > +void gen_spr_403(CPUPPCState *env);
> > +void gen_spr_403_real(CPUPPCState *env);
> > +void gen_spr_403_mmu(CPUPPCState *env);
> > +void gen_spr_40x_bus_control(CPUPPCState *env);
> > +void gen_spr_compress(CPUPPCState *env);
> > +void gen_spr_5xx_8xx(CPUPPCState *env);
> > +void gen_spr_5xx(CPUPPCState *env);
> > +void gen_spr_8xx(CPUPPCState *env);
> > +void gen_spr_970_hid(CPUPPCState *env);
> > +void gen_spr_970_hior(CPUPPCState *env);
> > +void gen_spr_book3s_ctrl(CPUPPCState *env);
> > +void gen_spr_book3s_altivec(CPUPPCState *env);
> > +void gen_spr_book3s_dbg(CPUPPCState *env);
> > +void gen_spr_book3s_207_dbg(CPUPPCState *env);
> > +void gen_spr_970_dbg(CPUPPCState *env);
> > +void gen_spr_book3s_pmu_sup(CPUPPCState *env);
> > +void gen_spr_book3s_pmu_user(CPUPPCState *env);
> > +void gen_spr_970_pmu_sup(CPUPPCState *env);
> > +void gen_spr_970_pmu_user(CPUPPCState *env);
> > +void gen_spr_power8_pmu_sup(CPUPPCState *env);
> > +void gen_spr_power8_pmu_user(CPUPPCState *env);
> > +void gen_spr_power5p_ear(CPUPPCState *env);
> > +void gen_spr_power5p_tb(CPUPPCState *env);
> > +void gen_spr_970_lpar(CPUPPCState *env);
> > +void gen_spr_power5p_lpar(CPUPPCState *env);
> > +void gen_spr_book3s_ids(CPUPPCState *env);
> > +void gen_spr_rmor(CPUPPCState *env);
> > +void gen_spr_power8_ids(CPUPPCState *env);
> > +void gen_spr_book3s_purr(CPUPPCState *env);
> > +void gen_spr_power6_dbg(CPUPPCState *env);
> > +void gen_spr_power5p_common(CPUPPCState *env);
> > +void gen_spr_power6_common(CPUPPCState *env);
> > +void gen_spr_power8_tce_address_control(CPUPPCState *env);
> > +void gen_spr_power8_tm(CPUPPCState *env);
> > +void gen_spr_power8_ebb(CPUPPCState *env);
> > +void gen_spr_vtb(CPUPPCState *env);
> > +void gen_spr_power8_fscr(CPUPPCState *env);
> > +void gen_spr_power8_pspb(CPUPPCState *env);
> > +void gen_spr_power8_dpdes(CPUPPCState *env);
> > +void gen_spr_power8_ic(CPUPPCState *env);
> > +void gen_spr_power8_book4(CPUPPCState *env);
> > +void gen_spr_power7_book4(CPUPPCState *env);
> > +void gen_spr_power8_rpr(CPUPPCState *env);
> > +void gen_spr_power9_mmu(CPUPPCState *env);
>=20
> Maybe it would be better to rename spr_tcg.h to spr.h and move all of
> this in there?
>=20
> > +/* TODO: find better solution for gen_op_mfspr and gen_op_mtspr */
>=20
> What is the issue with these? I only see them being used in translate.c.
>=20
> > +void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
>=20
> This is a rw callback, it should not be here.
>=20
> > +#define SPR_NOACCESS (&spr_noaccess)
>=20
> If you're only adding this now, it means the previous patch is
> broken. As a general rule you should make sure every patch works. I know
> that for the RFC things might be a bit broken temporarily and that is ok
> but it is always a good idea to make sure every individual change is in
> the correct patch at least.
>=20
> > +
> >  #endif /* PPC_INTERNAL_H */
> > diff --git a/target/ppc/meson.build b/target/ppc/meson.build
> > index bbfef90e08..aaee5e7c0c 100644
> > --- a/target/ppc/meson.build
> > +++ b/target/ppc/meson.build
> > @@ -9,6 +9,7 @@ ppc_ss.add(files(
> >    'int_helper.c',
> >    'mem_helper.c',
> >    'misc_helper.c',
> > +  'spr_common.c',
> >    'timebase_helper.c',
> >    'translate.c',
> >  ))
> > diff --git a/target/ppc/spr_common.c b/target/ppc/spr_common.c
> > new file mode 100644
> > index 0000000000..e34f4fe9dc
> > --- /dev/null
> > +++ b/target/ppc/spr_common.c
> > @@ -0,0 +1,2943 @@
> > +
> > +#include "qemu/osdep.h"
> > +#include "disas/disas.h"
> > +#include "cpu.h"
> > +#include "fpu/softfloat.h"
> > +#include "cpu-models.h"
> > +#include "sysemu/hw_accel.h"
> > +#include "tcg/tcg-op.h"
> > +#include "tcg/tcg-op-gvec.h"
> > +#include "exec/translator.h"
> > +#include "internal.h"
> > +#include "exec/gen-icount.h"
> > +#include "spr_tcg.h"
> > +
> > +/*********************************************************************=
********/
> > +/* SPR definitions and registration */
> > +
> > +#ifdef CONFIG_TCG
> > +#ifdef CONFIG_USER_ONLY
> > +#define spr_register_kvm(env, num, name, uea_read, uea_write,         =
         \
> > +                         oea_read, oea_write, one_reg_id, initial_valu=
e)       \
> > +    _spr_register(env, num, name, uea_read, uea_write, initial_value)
> > +#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,      =
         \
> > +                            oea_read, oea_write, hea_read, hea_write, =
         \
> > +                            one_reg_id, initial_value)                =
         \
> > +    _spr_register(env, num, name, uea_read, uea_write, initial_value)
> > +#else /* CONFIG_USER_ONLY */
> > +#if !defined(CONFIG_KVM)
> > +#define spr_register_kvm(env, num, name, uea_read, uea_write,         =
         \
> > +                         oea_read, oea_write, one_reg_id, initial_valu=
e)       \
> > +    _spr_register(env, num, name, uea_read, uea_write,                =
         \
> > +                  oea_read, oea_write, oea_read, oea_write, initial_va=
lue)
> > +#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,      =
         \
> > +                            oea_read, oea_write, hea_read, hea_write, =
         \
> > +                            one_reg_id, initial_value)                =
         \
> > +    _spr_register(env, num, name, uea_read, uea_write,                =
         \
> > +                  oea_read, oea_write, hea_read, hea_write, initial_va=
lue)
> > +#else /* !CONFIG_KVM */
> > +#define spr_register_kvm(env, num, name, uea_read, uea_write,         =
         \
> > +                         oea_read, oea_write, one_reg_id, initial_valu=
e)       \
> > +    _spr_register(env, num, name, uea_read, uea_write,                =
         \
> > +                  oea_read, oea_write, oea_read, oea_write,           =
         \
> > +                  one_reg_id, initial_value)
> > +#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,      =
         \
> > +                            oea_read, oea_write, hea_read, hea_write, =
         \
> > +                            one_reg_id, initial_value)                =
         \
> > +    _spr_register(env, num, name, uea_read, uea_write,                =
         \
> > +                  oea_read, oea_write, hea_read, hea_write,           =
         \
> > +                  one_reg_id, initial_value)
> > +#endif /* !CONFIG_KVM */
> > +#endif /* CONFIG_USER_ONLY */
> > +#else /* CONFIG_TCG */
> > +#ifdef CONFIG_KVM /* sanity check */
> > +#define spr_register_kvm(env, num, name, uea_read, uea_write,         =
         \
> > +                         oea_read, oea_write, one_reg_id, initial_valu=
e)       \
> > +    _spr_register(env, num, name, one_reg_id, initial_value)
> > +#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,      =
         \
> > +                            oea_read, oea_write, hea_read, hea_write, =
         \
> > +                            one_reg_id, initial_value)                =
         \
> > +    _spr_register(env, num, name, one_reg_id, initial_value)
> > +#else /* CONFIG_KVM */
> > +#error "Either TCG or KVM should be configured"
> > +#endif /* CONFIG_KVM */
> > +#endif /*CONFIG_TCG */
> > +
> > +#define spr_register(env, num, name, uea_read, uea_write,             =
         \
> > +                     oea_read, oea_write, initial_value)              =
         \
> > +    spr_register_kvm(env, num, name, uea_read, uea_write,             =
         \
> > +                     oea_read, oea_write, 0, initial_value)
> > +
> > +#define spr_register_hv(env, num, name, uea_read, uea_write,          =
         \
> > +                        oea_read, oea_write, hea_read, hea_write,     =
         \
> > +                        initial_value)                                =
         \
> > +    spr_register_kvm_hv(env, num, name, uea_read, uea_write,          =
         \
> > +                        oea_read, oea_write, hea_read, hea_write,     =
         \
> > +                        0, initial_value)
>=20
> This change is crucial for this to work, we don't want it buried along
> with all of the code movement. It should be clearly described and in
> it's own patch at the top of the series.
>=20
> If you add this change, plus some #ifdef TCG around the spr callbacks,
> it should already be possible to compile this with disable-tcg. It would
> also make the series as a whole easier to understand.
>=20
> > +
> > +static inline void _spr_register(CPUPPCState *env, int num,
> > +                                 const char *name,
> > +#ifdef CONFIG_TCG
> > +                                 void (*uea_read)(DisasContext *ctx,
> > +                                                  int gprn, int sprn),
> > +                                 void (*uea_write)(DisasContext *ctx,
> > +                                                   int sprn, int gprn),
> > +#if !defined(CONFIG_USER_ONLY)
> > +
> > +                                 void (*oea_read)(DisasContext *ctx,
> > +                                                  int gprn, int sprn),
> > +                                 void (*oea_write)(DisasContext *ctx,
> > +                                                   int sprn, int gprn),
> > +                                 void (*hea_read)(DisasContext *opaque,
> > +                                                  int gprn, int sprn),
> > +                                 void (*hea_write)(DisasContext *opaqu=
e,
> > +                                                   int sprn, int gprn),
> > +#endif
> > +#endif
> > +#if defined(CONFIG_KVM)
> > +                                 uint64_t one_reg_id,
> > +#endif
> > +                                 target_ulong initial_value)
> > +{
> > +    ppc_spr_t *spr;
> > +
> > +    spr =3D &env->spr_cb[num];
> > +    if (spr->name !=3D NULL || env->spr[num] !=3D 0x00000000
> > +#ifdef CONFIG_TCG
> > +#if !defined(CONFIG_USER_ONLY)
> > +        || spr->oea_read !=3D NULL || spr->oea_write !=3D NULL
> > +#endif
> > +        || spr->uea_read !=3D NULL || spr->uea_write !=3D NULL
> > +#endif
> > +        ) {
> > +        printf("Error: Trying to register SPR %d (%03x) twice !\n", nu=
m, num);
> > +        exit(1);
> > +    }
> > +#if defined(PPC_DEBUG_SPR)
> > +    printf("*** register spr %d (%03x) %s val " TARGET_FMT_lx "\n", nu=
m, num,
> > +           name, initial_value);
> > +#endif
> > +    spr->name =3D name;
> > +#ifdef CONFIG_TCG
> > +    spr->uea_read =3D uea_read;
> > +    spr->uea_write =3D uea_write;
> > +#if !defined(CONFIG_USER_ONLY)
> > +    spr->oea_read =3D oea_read;
> > +    spr->oea_write =3D oea_write;
> > +    spr->hea_read =3D hea_read;
> > +    spr->hea_write =3D hea_write;
> > +#endif
> > +#endif
> > +#if defined(CONFIG_KVM)
> > +    spr->one_reg_id =3D one_reg_id,
> > +#endif
> > +    env->spr[num] =3D spr->default_value =3D initial_value;
> > +}
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--z/k39wWIFvfRkyo/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCHhmcACgkQbDjKyiDZ
s5KCZw/+IBaHOVF817cZL7sJs2R0iJH/fcrEvmXhjplg3FHtZ/pgD8WWI6ZOAZOG
J0fER1DmgWQE2vZdpUjhWEWpMaNkTr1Bye38xgstcwkM4RPFjhkXjHKZz2b7uIr5
YwOucj+kSyw6AtyBIoh/oAZb92kct/LtBPXJA+LLawVxpnYzqq5foUSQ3MdunkxR
1q30ixdyd0Wb/GfQ0v7XXhYzNeDVDT90HA3rv1oGALhJC+iuDq8CyIQP0zMSAfXS
pluuqtXCYKiPDjxamfp3YsNXVxHCXaqBcyAEd1st6lfJAgTzX0QT8qZk06NZSyVI
SC0oa+lS7ZgaAy4TLhaHo6QBSItDW14/N6Ma3x2r7p8JSqeW0hyxQFnY4/f+YdJ0
ska0awc/YDtOq2A8k3DKmse5OPnzUke15Eb0TBcDryt+eNp55vIaZjuUKG8FYx8C
/qgz5Hdz7d+hSKPjEn5XQTaOBEkSjhE2GCg02ZU9NR4v47fPH4ZsRoiLcXqfP03w
qmPDKxusWNkeLYcZMBWcXc9pJmbCdpf9pNYpC6r56Iewz43Jdnt/0BHZsEpgKE/z
2QokKoVJWYGS8O2U0B6ui/BPaXBELmm5341muqm6c6nVSvFQrVC4phXS4cQVWkTn
RkYWOQb40xDn8c7LjebCIVcC3E811RDoRxUQgM4yWnlSGiWjc1s=
=Xiy0
-----END PGP SIGNATURE-----

--z/k39wWIFvfRkyo/--

