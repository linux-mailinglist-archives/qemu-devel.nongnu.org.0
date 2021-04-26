Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0C136BB0A
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 23:10:21 +0200 (CEST)
Received: from localhost ([::1]:54948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb8Ul-0002EK-QS
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 17:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lb8Tk-0001iF-1f; Mon, 26 Apr 2021 17:09:16 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:27324
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lb8Td-0005MK-VV; Mon, 26 Apr 2021 17:09:15 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13QL2ghM127445; Mon, 26 Apr 2021 17:08:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=tmPqo12cJkvzHCy5p9/tQkU9eW+Fr6jre8nO3RGArMo=;
 b=Nwwn6CteAO3bcjNgJpK1bPSkPUYeP/LfQZ2GtLwhxMSP0s8S6kEPE3X9e+PHVl9gR3Ox
 bHlry6Aw/FFQ59hu02aElcjipFOr66LJaX0UMYL4k1Bq3+DYTKyzRnXjTEMYpsQPAOMw
 AC+ZJg8SCVIxvPIonGCmbWlfxC/G0xmw8zO9YI/szL3c2DvvXaipDhsRiyTSRemEYwlB
 dnfGauIay3FqBtbaY6tUBO+cYITmnYyQKHOM3LORaL5abUEFMsdyufIE8C+YHvYH2QAI
 J0Lo7roJEjyEJSjBkpXw2Mkj3cJDcPpJbOj56i7wcLV2FZBxRZ/8ckQjbNLTE8FYm1Gs Ew== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3864ytr9xr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 17:08:59 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13QL7HKI012546;
 Mon, 26 Apr 2021 21:08:57 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 384ay98xe0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 21:08:57 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13QL8uws28049842
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Apr 2021 21:08:56 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C991EC605A;
 Mon, 26 Apr 2021 21:08:56 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 065B6C605F;
 Mon, 26 Apr 2021 21:08:55 +0000 (GMT)
Received: from localhost (unknown [9.163.28.241])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 26 Apr 2021 21:08:55 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 3/4] target/ppc: Move SPR generation to separate file
In-Reply-To: <20210423191807.77963-4-bruno.larsen@eldorado.org.br>
References: <20210423191807.77963-1-bruno.larsen@eldorado.org.br>
 <20210423191807.77963-4-bruno.larsen@eldorado.org.br>
Date: Mon, 26 Apr 2021 18:08:53 -0300
Message-ID: <87k0oo3g9m.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KXo0G0QX60SeCMDtbtyLGl7o6vDmGrR3
X-Proofpoint-ORIG-GUID: KXo0G0QX60SeCMDtbtyLGl7o6vDmGrR3
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-26_09:2021-04-26,
 2021-04-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104260162
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lucas.araujo@eldorado.org.br, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org, "Bruno Larsen
 \(billionai\)" <bruno.larsen@eldorado.org.br>, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> writes:

> This move is required to enable building without TCG.
> All the logic related to registering SPRs specific to
> some architectures or machines has been hidden in this
> new file.

Hm... I thought we ended up deciding to keep the gen_spr_<machine>
functions in translate_init.c.inc (cpu_init.c). I don't strongly favour
one way or the other, but one alternative would be to just rename the
gen_spr_<machine> functions to add_sprs_<machine> or even
register_<machine>_sprs and leave them where they are.

> The idea of this final patch is to hide all SPR generation from
> translate_init, but in an effort to simplify the RFC the 4
> functions for not_implemented SPRs were created. They'll be
> substituted by gen_spr_<machine>_misc in reusable ways for the
> final patch.

I'd expect this patch to be just a big removal of gen_spr* from
translate_init.c.inc and their addition into spr_common.c. So any other
prep work should come in separate patches ealier in the
series. Specifically, at least one patch for the macro work and another
for the refactoring of open coded spr_register calls into gen_spr_*
functions.

> another issue we ran into was vscr_init using static functions
> means it has to be static, so we had to remove them from 
> gen_spr_74xx and gen_spr_book3s_altivec, and have them in
> the init_procs instead.

Looks like moving vscr_init out, along with a more detailed explanation
of the issue could be in another preliminary change.

>
> Finally, SPR_NOACCESS had to be defined in internal.h, as it
> is used by spr_common, translate_init and translate. If there
> is a better solution, I'll be happy to implement it.
>
> As for the redundant code complaint this patch will get, it has only
> been moved, so I don't know if I can remove that code
>
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  target/ppc/internal.h           |  108 +
>  target/ppc/meson.build          |    1 +
>  target/ppc/spr_common.c         | 2943 ++++++++++++++++++++++
>  target/ppc/translate_init.c.inc | 4031 ++-----------------------------
>  4 files changed, 3314 insertions(+), 3769 deletions(-)
>  create mode 100644 target/ppc/spr_common.c
>
> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
> index de78c23717..25df546eae 100644
> --- a/target/ppc/internal.h
> +++ b/target/ppc/internal.h
> @@ -226,4 +226,112 @@ void destroy_ppc_opcodes(PowerPCCPU *cpu);
>  void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *ppc);
>  gchar *ppc_gdb_arch_name(CPUState *cs);
>  
> +/* spr-common.c */
> +#include "cpu.h"
> +void gen_spr_generic(CPUPPCState *env);

The fact that these are called gen_* is confusing since they don't
really generate anything. They mostly just add SPRs to the list and
register the SPR rw callbacks for TCG. Maybe we could rename them at the
end of the series to something more clear.

> +void gen_spr_ne_601(CPUPPCState *env);
> +void gen_spr_sdr1(CPUPPCState *env);
> +void gen_low_BATs(CPUPPCState *env);
> +void gen_high_BATs(CPUPPCState *env);
> +void gen_tbl(CPUPPCState *env);
> +void gen_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways);
> +void gen_spr_G2_755(CPUPPCState *env);
> +void gen_spr_7xx(CPUPPCState *env);
> +#ifdef TARGET_PPC64
> +void gen_spr_amr(CPUPPCState *env);
> +void gen_spr_iamr(CPUPPCState *env);
> +#endif /* TARGET_PPC64 */
> +void gen_spr_thrm(CPUPPCState *env);
> +void gen_spr_604(CPUPPCState *env);
> +void gen_spr_603(CPUPPCState *env);
> +void gen_spr_G2(CPUPPCState *env);
> +void gen_spr_602(CPUPPCState *env);
> +void gen_spr_601(CPUPPCState *env);
> +void gen_spr_74xx(CPUPPCState *env);
> +void gen_l3_ctrl(CPUPPCState *env);
> +void gen_74xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways);
> +void gen_spr_not_implemented(CPUPPCState *env,
> +                             int num, const char *name);
> +void gen_spr_not_implemented_ureg(CPUPPCState *env,
> +                                  int num, const char *name);
> +void gen_spr_not_implemented_no_write(CPUPPCState *env,
> +                                      int num, const char *name);
> +void gen_spr_not_implemented_write_nop(CPUPPCState *env,
> +                                       int num, const char *name);
> +void gen_spr_PSSCR(CPUPPCState *env);
> +void gen_spr_TIDR(CPUPPCState *env);
> +void gen_spr_pvr(CPUPPCState *env, PowerPCCPUClass *pcc);
> +void gen_spr_svr(CPUPPCState *env, PowerPCCPUClass *pcc);
> +void gen_spr_pir(CPUPPCState *env);
> +void gen_spr_spefscr(CPUPPCState *env);
> +void gen_spr_l1fgc(CPUPPCState *env, int num, int initial_value);
> +void gen_spr_hid0(CPUPPCState *env);
> +void gen_spr_mas73(CPUPPCState *env);
> +void gen_spr_mmucsr0(CPUPPCState *env);
> +void gen_spr_l1csr0(CPUPPCState *env);
> +void gen_spr_l1csr1(CPUPPCState *env);
> +void gen_spr_l2csr0(CPUPPCState *env);
> +void gen_spr_usprg3(CPUPPCState *env);
> +void gen_spr_usprgh(CPUPPCState *env);
> +void gen_spr_BookE(CPUPPCState *env, uint64_t ivor_mask);
> +uint32_t gen_tlbncfg(uint32_t assoc, uint32_t minsize,
> +                     uint32_t maxsize, uint32_t flags,
> +                     uint32_t nentries);
> +void gen_spr_BookE206(CPUPPCState *env, uint32_t mas_mask,
> +                             uint32_t *tlbncfg, uint32_t mmucfg);
> +void gen_spr_440(CPUPPCState *env);
> +void gen_spr_440_misc(CPUPPCState *env);
> +void gen_spr_40x(CPUPPCState *env);
> +void gen_spr_405(CPUPPCState *env);
> +void gen_spr_401_403(CPUPPCState *env);
> +void gen_spr_401(CPUPPCState *env);
> +void gen_spr_401x2(CPUPPCState *env);
> +void gen_spr_403(CPUPPCState *env);
> +void gen_spr_403_real(CPUPPCState *env);
> +void gen_spr_403_mmu(CPUPPCState *env);
> +void gen_spr_40x_bus_control(CPUPPCState *env);
> +void gen_spr_compress(CPUPPCState *env);
> +void gen_spr_5xx_8xx(CPUPPCState *env);
> +void gen_spr_5xx(CPUPPCState *env);
> +void gen_spr_8xx(CPUPPCState *env);
> +void gen_spr_970_hid(CPUPPCState *env);
> +void gen_spr_970_hior(CPUPPCState *env);
> +void gen_spr_book3s_ctrl(CPUPPCState *env);
> +void gen_spr_book3s_altivec(CPUPPCState *env);
> +void gen_spr_book3s_dbg(CPUPPCState *env);
> +void gen_spr_book3s_207_dbg(CPUPPCState *env);
> +void gen_spr_970_dbg(CPUPPCState *env);
> +void gen_spr_book3s_pmu_sup(CPUPPCState *env);
> +void gen_spr_book3s_pmu_user(CPUPPCState *env);
> +void gen_spr_970_pmu_sup(CPUPPCState *env);
> +void gen_spr_970_pmu_user(CPUPPCState *env);
> +void gen_spr_power8_pmu_sup(CPUPPCState *env);
> +void gen_spr_power8_pmu_user(CPUPPCState *env);
> +void gen_spr_power5p_ear(CPUPPCState *env);
> +void gen_spr_power5p_tb(CPUPPCState *env);
> +void gen_spr_970_lpar(CPUPPCState *env);
> +void gen_spr_power5p_lpar(CPUPPCState *env);
> +void gen_spr_book3s_ids(CPUPPCState *env);
> +void gen_spr_rmor(CPUPPCState *env);
> +void gen_spr_power8_ids(CPUPPCState *env);
> +void gen_spr_book3s_purr(CPUPPCState *env);
> +void gen_spr_power6_dbg(CPUPPCState *env);
> +void gen_spr_power5p_common(CPUPPCState *env);
> +void gen_spr_power6_common(CPUPPCState *env);
> +void gen_spr_power8_tce_address_control(CPUPPCState *env);
> +void gen_spr_power8_tm(CPUPPCState *env);
> +void gen_spr_power8_ebb(CPUPPCState *env);
> +void gen_spr_vtb(CPUPPCState *env);
> +void gen_spr_power8_fscr(CPUPPCState *env);
> +void gen_spr_power8_pspb(CPUPPCState *env);
> +void gen_spr_power8_dpdes(CPUPPCState *env);
> +void gen_spr_power8_ic(CPUPPCState *env);
> +void gen_spr_power8_book4(CPUPPCState *env);
> +void gen_spr_power7_book4(CPUPPCState *env);
> +void gen_spr_power8_rpr(CPUPPCState *env);
> +void gen_spr_power9_mmu(CPUPPCState *env);

Maybe it would be better to rename spr_tcg.h to spr.h and move all of
this in there?

> +/* TODO: find better solution for gen_op_mfspr and gen_op_mtspr */

What is the issue with these? I only see them being used in translate.c.

> +void spr_noaccess(DisasContext *ctx, int gprn, int sprn);

This is a rw callback, it should not be here.

> +#define SPR_NOACCESS (&spr_noaccess)

If you're only adding this now, it means the previous patch is
broken. As a general rule you should make sure every patch works. I know
that for the RFC things might be a bit broken temporarily and that is ok
but it is always a good idea to make sure every individual change is in
the correct patch at least.

> +
>  #endif /* PPC_INTERNAL_H */
> diff --git a/target/ppc/meson.build b/target/ppc/meson.build
> index bbfef90e08..aaee5e7c0c 100644
> --- a/target/ppc/meson.build
> +++ b/target/ppc/meson.build
> @@ -9,6 +9,7 @@ ppc_ss.add(files(
>    'int_helper.c',
>    'mem_helper.c',
>    'misc_helper.c',
> +  'spr_common.c',
>    'timebase_helper.c',
>    'translate.c',
>  ))
> diff --git a/target/ppc/spr_common.c b/target/ppc/spr_common.c
> new file mode 100644
> index 0000000000..e34f4fe9dc
> --- /dev/null
> +++ b/target/ppc/spr_common.c
> @@ -0,0 +1,2943 @@
> +
> +#include "qemu/osdep.h"
> +#include "disas/disas.h"
> +#include "cpu.h"
> +#include "fpu/softfloat.h"
> +#include "cpu-models.h"
> +#include "sysemu/hw_accel.h"
> +#include "tcg/tcg-op.h"
> +#include "tcg/tcg-op-gvec.h"
> +#include "exec/translator.h"
> +#include "internal.h"
> +#include "exec/gen-icount.h"
> +#include "spr_tcg.h"
> +
> +/*****************************************************************************/
> +/* SPR definitions and registration */
> +
> +#ifdef CONFIG_TCG
> +#ifdef CONFIG_USER_ONLY
> +#define spr_register_kvm(env, num, name, uea_read, uea_write,                  \
> +                         oea_read, oea_write, one_reg_id, initial_value)       \
> +    _spr_register(env, num, name, uea_read, uea_write, initial_value)
> +#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,               \
> +                            oea_read, oea_write, hea_read, hea_write,          \
> +                            one_reg_id, initial_value)                         \
> +    _spr_register(env, num, name, uea_read, uea_write, initial_value)
> +#else /* CONFIG_USER_ONLY */
> +#if !defined(CONFIG_KVM)
> +#define spr_register_kvm(env, num, name, uea_read, uea_write,                  \
> +                         oea_read, oea_write, one_reg_id, initial_value)       \
> +    _spr_register(env, num, name, uea_read, uea_write,                         \
> +                  oea_read, oea_write, oea_read, oea_write, initial_value)
> +#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,               \
> +                            oea_read, oea_write, hea_read, hea_write,          \
> +                            one_reg_id, initial_value)                         \
> +    _spr_register(env, num, name, uea_read, uea_write,                         \
> +                  oea_read, oea_write, hea_read, hea_write, initial_value)
> +#else /* !CONFIG_KVM */
> +#define spr_register_kvm(env, num, name, uea_read, uea_write,                  \
> +                         oea_read, oea_write, one_reg_id, initial_value)       \
> +    _spr_register(env, num, name, uea_read, uea_write,                         \
> +                  oea_read, oea_write, oea_read, oea_write,                    \
> +                  one_reg_id, initial_value)
> +#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,               \
> +                            oea_read, oea_write, hea_read, hea_write,          \
> +                            one_reg_id, initial_value)                         \
> +    _spr_register(env, num, name, uea_read, uea_write,                         \
> +                  oea_read, oea_write, hea_read, hea_write,                    \
> +                  one_reg_id, initial_value)
> +#endif /* !CONFIG_KVM */
> +#endif /* CONFIG_USER_ONLY */
> +#else /* CONFIG_TCG */
> +#ifdef CONFIG_KVM /* sanity check */
> +#define spr_register_kvm(env, num, name, uea_read, uea_write,                  \
> +                         oea_read, oea_write, one_reg_id, initial_value)       \
> +    _spr_register(env, num, name, one_reg_id, initial_value)
> +#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,               \
> +                            oea_read, oea_write, hea_read, hea_write,          \
> +                            one_reg_id, initial_value)                         \
> +    _spr_register(env, num, name, one_reg_id, initial_value)
> +#else /* CONFIG_KVM */
> +#error "Either TCG or KVM should be configured"
> +#endif /* CONFIG_KVM */
> +#endif /*CONFIG_TCG */
> +
> +#define spr_register(env, num, name, uea_read, uea_write,                      \
> +                     oea_read, oea_write, initial_value)                       \
> +    spr_register_kvm(env, num, name, uea_read, uea_write,                      \
> +                     oea_read, oea_write, 0, initial_value)
> +
> +#define spr_register_hv(env, num, name, uea_read, uea_write,                   \
> +                        oea_read, oea_write, hea_read, hea_write,              \
> +                        initial_value)                                         \
> +    spr_register_kvm_hv(env, num, name, uea_read, uea_write,                   \
> +                        oea_read, oea_write, hea_read, hea_write,              \
> +                        0, initial_value)

This change is crucial for this to work, we don't want it buried along
with all of the code movement. It should be clearly described and in
it's own patch at the top of the series.

If you add this change, plus some #ifdef TCG around the spr callbacks,
it should already be possible to compile this with disable-tcg. It would
also make the series as a whole easier to understand.

> +
> +static inline void _spr_register(CPUPPCState *env, int num,
> +                                 const char *name,
> +#ifdef CONFIG_TCG
> +                                 void (*uea_read)(DisasContext *ctx,
> +                                                  int gprn, int sprn),
> +                                 void (*uea_write)(DisasContext *ctx,
> +                                                   int sprn, int gprn),
> +#if !defined(CONFIG_USER_ONLY)
> +
> +                                 void (*oea_read)(DisasContext *ctx,
> +                                                  int gprn, int sprn),
> +                                 void (*oea_write)(DisasContext *ctx,
> +                                                   int sprn, int gprn),
> +                                 void (*hea_read)(DisasContext *opaque,
> +                                                  int gprn, int sprn),
> +                                 void (*hea_write)(DisasContext *opaque,
> +                                                   int sprn, int gprn),
> +#endif
> +#endif
> +#if defined(CONFIG_KVM)
> +                                 uint64_t one_reg_id,
> +#endif
> +                                 target_ulong initial_value)
> +{
> +    ppc_spr_t *spr;
> +
> +    spr = &env->spr_cb[num];
> +    if (spr->name != NULL || env->spr[num] != 0x00000000
> +#ifdef CONFIG_TCG
> +#if !defined(CONFIG_USER_ONLY)
> +        || spr->oea_read != NULL || spr->oea_write != NULL
> +#endif
> +        || spr->uea_read != NULL || spr->uea_write != NULL
> +#endif
> +        ) {
> +        printf("Error: Trying to register SPR %d (%03x) twice !\n", num, num);
> +        exit(1);
> +    }
> +#if defined(PPC_DEBUG_SPR)
> +    printf("*** register spr %d (%03x) %s val " TARGET_FMT_lx "\n", num, num,
> +           name, initial_value);
> +#endif
> +    spr->name = name;
> +#ifdef CONFIG_TCG
> +    spr->uea_read = uea_read;
> +    spr->uea_write = uea_write;
> +#if !defined(CONFIG_USER_ONLY)
> +    spr->oea_read = oea_read;
> +    spr->oea_write = oea_write;
> +    spr->hea_read = hea_read;
> +    spr->hea_write = hea_write;
> +#endif
> +#endif
> +#if defined(CONFIG_KVM)
> +    spr->one_reg_id = one_reg_id,
> +#endif
> +    env->spr[num] = spr->default_value = initial_value;
> +}

