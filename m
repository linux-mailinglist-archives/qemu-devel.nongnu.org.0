Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB200369AE8
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 21:29:37 +0200 (CEST)
Received: from localhost ([::1]:50040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la1Ue-00008B-Mv
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 15:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1la1KM-0002Jn-BJ; Fri, 23 Apr 2021 15:18:59 -0400
Received: from [201.28.113.2] (port=29815 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1la1KH-0008Dq-Pp; Fri, 23 Apr 2021 15:18:58 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 23 Apr 2021 16:18:33 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id E66D98013BA;
 Fri, 23 Apr 2021 16:18:32 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/4] target/ppc: Move SPR generation to separate file
Date: Fri, 23 Apr 2021 16:18:06 -0300
Message-Id: <20210423191807.77963-4-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210423191807.77963-1-bruno.larsen@eldorado.org.br>
References: <20210423191807.77963-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 23 Apr 2021 19:18:33.0186 (UTC)
 FILETIME=[738FEC20:01D73875]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This move is required to enable building without TCG.
All the logic related to registering SPRs specific to
some architectures or machines has been hidden in this
new file.

The idea of this final patch is to hide all SPR generation from
translate_init, but in an effort to simplify the RFC the 4
functions for not_implemented SPRs were created. They'll be
substituted by gen_spr_<machine>_misc in reusable ways for the
final patch.

another issue we ran into was vscr_init using static functions
means it has to be static, so we had to remove them from 
gen_spr_74xx and gen_spr_book3s_altivec, and have them in
the init_procs instead.

Finally, SPR_NOACCESS had to be defined in internal.h, as it
is used by spr_common, translate_init and translate. If there
is a better solution, I'll be happy to implement it.

As for the redundant code complaint this patch will get, it has only
been moved, so I don't know if I can remove that code

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/internal.h           |  108 +
 target/ppc/meson.build          |    1 +
 target/ppc/spr_common.c         | 2943 ++++++++++++++++++++++
 target/ppc/translate_init.c.inc | 4031 ++-----------------------------
 4 files changed, 3314 insertions(+), 3769 deletions(-)
 create mode 100644 target/ppc/spr_common.c

diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index de78c23717..25df546eae 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -226,4 +226,112 @@ void destroy_ppc_opcodes(PowerPCCPU *cpu);
 void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *ppc);
 gchar *ppc_gdb_arch_name(CPUState *cs);
 
+/* spr-common.c */
+#include "cpu.h"
+void gen_spr_generic(CPUPPCState *env);
+void gen_spr_ne_601(CPUPPCState *env);
+void gen_spr_sdr1(CPUPPCState *env);
+void gen_low_BATs(CPUPPCState *env);
+void gen_high_BATs(CPUPPCState *env);
+void gen_tbl(CPUPPCState *env);
+void gen_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways);
+void gen_spr_G2_755(CPUPPCState *env);
+void gen_spr_7xx(CPUPPCState *env);
+#ifdef TARGET_PPC64
+void gen_spr_amr(CPUPPCState *env);
+void gen_spr_iamr(CPUPPCState *env);
+#endif /* TARGET_PPC64 */
+void gen_spr_thrm(CPUPPCState *env);
+void gen_spr_604(CPUPPCState *env);
+void gen_spr_603(CPUPPCState *env);
+void gen_spr_G2(CPUPPCState *env);
+void gen_spr_602(CPUPPCState *env);
+void gen_spr_601(CPUPPCState *env);
+void gen_spr_74xx(CPUPPCState *env);
+void gen_l3_ctrl(CPUPPCState *env);
+void gen_74xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways);
+void gen_spr_not_implemented(CPUPPCState *env,
+                             int num, const char *name);
+void gen_spr_not_implemented_ureg(CPUPPCState *env,
+                                  int num, const char *name);
+void gen_spr_not_implemented_no_write(CPUPPCState *env,
+                                      int num, const char *name);
+void gen_spr_not_implemented_write_nop(CPUPPCState *env,
+                                       int num, const char *name);
+void gen_spr_PSSCR(CPUPPCState *env);
+void gen_spr_TIDR(CPUPPCState *env);
+void gen_spr_pvr(CPUPPCState *env, PowerPCCPUClass *pcc);
+void gen_spr_svr(CPUPPCState *env, PowerPCCPUClass *pcc);
+void gen_spr_pir(CPUPPCState *env);
+void gen_spr_spefscr(CPUPPCState *env);
+void gen_spr_l1fgc(CPUPPCState *env, int num, int initial_value);
+void gen_spr_hid0(CPUPPCState *env);
+void gen_spr_mas73(CPUPPCState *env);
+void gen_spr_mmucsr0(CPUPPCState *env);
+void gen_spr_l1csr0(CPUPPCState *env);
+void gen_spr_l1csr1(CPUPPCState *env);
+void gen_spr_l2csr0(CPUPPCState *env);
+void gen_spr_usprg3(CPUPPCState *env);
+void gen_spr_usprgh(CPUPPCState *env);
+void gen_spr_BookE(CPUPPCState *env, uint64_t ivor_mask);
+uint32_t gen_tlbncfg(uint32_t assoc, uint32_t minsize,
+                     uint32_t maxsize, uint32_t flags,
+                     uint32_t nentries);
+void gen_spr_BookE206(CPUPPCState *env, uint32_t mas_mask,
+                             uint32_t *tlbncfg, uint32_t mmucfg);
+void gen_spr_440(CPUPPCState *env);
+void gen_spr_440_misc(CPUPPCState *env);
+void gen_spr_40x(CPUPPCState *env);
+void gen_spr_405(CPUPPCState *env);
+void gen_spr_401_403(CPUPPCState *env);
+void gen_spr_401(CPUPPCState *env);
+void gen_spr_401x2(CPUPPCState *env);
+void gen_spr_403(CPUPPCState *env);
+void gen_spr_403_real(CPUPPCState *env);
+void gen_spr_403_mmu(CPUPPCState *env);
+void gen_spr_40x_bus_control(CPUPPCState *env);
+void gen_spr_compress(CPUPPCState *env);
+void gen_spr_5xx_8xx(CPUPPCState *env);
+void gen_spr_5xx(CPUPPCState *env);
+void gen_spr_8xx(CPUPPCState *env);
+void gen_spr_970_hid(CPUPPCState *env);
+void gen_spr_970_hior(CPUPPCState *env);
+void gen_spr_book3s_ctrl(CPUPPCState *env);
+void gen_spr_book3s_altivec(CPUPPCState *env);
+void gen_spr_book3s_dbg(CPUPPCState *env);
+void gen_spr_book3s_207_dbg(CPUPPCState *env);
+void gen_spr_970_dbg(CPUPPCState *env);
+void gen_spr_book3s_pmu_sup(CPUPPCState *env);
+void gen_spr_book3s_pmu_user(CPUPPCState *env);
+void gen_spr_970_pmu_sup(CPUPPCState *env);
+void gen_spr_970_pmu_user(CPUPPCState *env);
+void gen_spr_power8_pmu_sup(CPUPPCState *env);
+void gen_spr_power8_pmu_user(CPUPPCState *env);
+void gen_spr_power5p_ear(CPUPPCState *env);
+void gen_spr_power5p_tb(CPUPPCState *env);
+void gen_spr_970_lpar(CPUPPCState *env);
+void gen_spr_power5p_lpar(CPUPPCState *env);
+void gen_spr_book3s_ids(CPUPPCState *env);
+void gen_spr_rmor(CPUPPCState *env);
+void gen_spr_power8_ids(CPUPPCState *env);
+void gen_spr_book3s_purr(CPUPPCState *env);
+void gen_spr_power6_dbg(CPUPPCState *env);
+void gen_spr_power5p_common(CPUPPCState *env);
+void gen_spr_power6_common(CPUPPCState *env);
+void gen_spr_power8_tce_address_control(CPUPPCState *env);
+void gen_spr_power8_tm(CPUPPCState *env);
+void gen_spr_power8_ebb(CPUPPCState *env);
+void gen_spr_vtb(CPUPPCState *env);
+void gen_spr_power8_fscr(CPUPPCState *env);
+void gen_spr_power8_pspb(CPUPPCState *env);
+void gen_spr_power8_dpdes(CPUPPCState *env);
+void gen_spr_power8_ic(CPUPPCState *env);
+void gen_spr_power8_book4(CPUPPCState *env);
+void gen_spr_power7_book4(CPUPPCState *env);
+void gen_spr_power8_rpr(CPUPPCState *env);
+void gen_spr_power9_mmu(CPUPPCState *env);
+/* TODO: find better solution for gen_op_mfspr and gen_op_mtspr */
+void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
+#define SPR_NOACCESS (&spr_noaccess)
+
 #endif /* PPC_INTERNAL_H */
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index bbfef90e08..aaee5e7c0c 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -9,6 +9,7 @@ ppc_ss.add(files(
   'int_helper.c',
   'mem_helper.c',
   'misc_helper.c',
+  'spr_common.c',
   'timebase_helper.c',
   'translate.c',
 ))
diff --git a/target/ppc/spr_common.c b/target/ppc/spr_common.c
new file mode 100644
index 0000000000..e34f4fe9dc
--- /dev/null
+++ b/target/ppc/spr_common.c
@@ -0,0 +1,2943 @@
+
+#include "qemu/osdep.h"
+#include "disas/disas.h"
+#include "cpu.h"
+#include "fpu/softfloat.h"
+#include "cpu-models.h"
+#include "sysemu/hw_accel.h"
+#include "tcg/tcg-op.h"
+#include "tcg/tcg-op-gvec.h"
+#include "exec/translator.h"
+#include "internal.h"
+#include "exec/gen-icount.h"
+#include "spr_tcg.h"
+
+/*****************************************************************************/
+/* SPR definitions and registration */
+
+#ifdef CONFIG_TCG
+#ifdef CONFIG_USER_ONLY
+#define spr_register_kvm(env, num, name, uea_read, uea_write,                  \
+                         oea_read, oea_write, one_reg_id, initial_value)       \
+    _spr_register(env, num, name, uea_read, uea_write, initial_value)
+#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,               \
+                            oea_read, oea_write, hea_read, hea_write,          \
+                            one_reg_id, initial_value)                         \
+    _spr_register(env, num, name, uea_read, uea_write, initial_value)
+#else /* CONFIG_USER_ONLY */
+#if !defined(CONFIG_KVM)
+#define spr_register_kvm(env, num, name, uea_read, uea_write,                  \
+                         oea_read, oea_write, one_reg_id, initial_value)       \
+    _spr_register(env, num, name, uea_read, uea_write,                         \
+                  oea_read, oea_write, oea_read, oea_write, initial_value)
+#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,               \
+                            oea_read, oea_write, hea_read, hea_write,          \
+                            one_reg_id, initial_value)                         \
+    _spr_register(env, num, name, uea_read, uea_write,                         \
+                  oea_read, oea_write, hea_read, hea_write, initial_value)
+#else /* !CONFIG_KVM */
+#define spr_register_kvm(env, num, name, uea_read, uea_write,                  \
+                         oea_read, oea_write, one_reg_id, initial_value)       \
+    _spr_register(env, num, name, uea_read, uea_write,                         \
+                  oea_read, oea_write, oea_read, oea_write,                    \
+                  one_reg_id, initial_value)
+#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,               \
+                            oea_read, oea_write, hea_read, hea_write,          \
+                            one_reg_id, initial_value)                         \
+    _spr_register(env, num, name, uea_read, uea_write,                         \
+                  oea_read, oea_write, hea_read, hea_write,                    \
+                  one_reg_id, initial_value)
+#endif /* !CONFIG_KVM */
+#endif /* CONFIG_USER_ONLY */
+#else /* CONFIG_TCG */
+#ifdef CONFIG_KVM /* sanity check */
+#define spr_register_kvm(env, num, name, uea_read, uea_write,                  \
+                         oea_read, oea_write, one_reg_id, initial_value)       \
+    _spr_register(env, num, name, one_reg_id, initial_value)
+#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,               \
+                            oea_read, oea_write, hea_read, hea_write,          \
+                            one_reg_id, initial_value)                         \
+    _spr_register(env, num, name, one_reg_id, initial_value)
+#else /* CONFIG_KVM */
+#error "Either TCG or KVM should be configured"
+#endif /* CONFIG_KVM */
+#endif /*CONFIG_TCG */
+
+#define spr_register(env, num, name, uea_read, uea_write,                      \
+                     oea_read, oea_write, initial_value)                       \
+    spr_register_kvm(env, num, name, uea_read, uea_write,                      \
+                     oea_read, oea_write, 0, initial_value)
+
+#define spr_register_hv(env, num, name, uea_read, uea_write,                   \
+                        oea_read, oea_write, hea_read, hea_write,              \
+                        initial_value)                                         \
+    spr_register_kvm_hv(env, num, name, uea_read, uea_write,                   \
+                        oea_read, oea_write, hea_read, hea_write,              \
+                        0, initial_value)
+
+static inline void _spr_register(CPUPPCState *env, int num,
+                                 const char *name,
+#ifdef CONFIG_TCG
+                                 void (*uea_read)(DisasContext *ctx,
+                                                  int gprn, int sprn),
+                                 void (*uea_write)(DisasContext *ctx,
+                                                   int sprn, int gprn),
+#if !defined(CONFIG_USER_ONLY)
+
+                                 void (*oea_read)(DisasContext *ctx,
+                                                  int gprn, int sprn),
+                                 void (*oea_write)(DisasContext *ctx,
+                                                   int sprn, int gprn),
+                                 void (*hea_read)(DisasContext *opaque,
+                                                  int gprn, int sprn),
+                                 void (*hea_write)(DisasContext *opaque,
+                                                   int sprn, int gprn),
+#endif
+#endif
+#if defined(CONFIG_KVM)
+                                 uint64_t one_reg_id,
+#endif
+                                 target_ulong initial_value)
+{
+    ppc_spr_t *spr;
+
+    spr = &env->spr_cb[num];
+    if (spr->name != NULL || env->spr[num] != 0x00000000
+#ifdef CONFIG_TCG
+#if !defined(CONFIG_USER_ONLY)
+        || spr->oea_read != NULL || spr->oea_write != NULL
+#endif
+        || spr->uea_read != NULL || spr->uea_write != NULL
+#endif
+        ) {
+        printf("Error: Trying to register SPR %d (%03x) twice !\n", num, num);
+        exit(1);
+    }
+#if defined(PPC_DEBUG_SPR)
+    printf("*** register spr %d (%03x) %s val " TARGET_FMT_lx "\n", num, num,
+           name, initial_value);
+#endif
+    spr->name = name;
+#ifdef CONFIG_TCG
+    spr->uea_read = uea_read;
+    spr->uea_write = uea_write;
+#if !defined(CONFIG_USER_ONLY)
+    spr->oea_read = oea_read;
+    spr->oea_write = oea_write;
+    spr->hea_read = hea_read;
+    spr->hea_write = hea_write;
+#endif
+#endif
+#if defined(CONFIG_KVM)
+    spr->one_reg_id = one_reg_id,
+#endif
+    env->spr[num] = spr->default_value = initial_value;
+}
+
+/* Generic PowerPC SPRs */
+void gen_spr_generic(CPUPPCState *env)
+{
+    /* Integer processing */
+    spr_register(env, SPR_XER, "XER",
+                 &spr_read_xer, &spr_write_xer,
+                 &spr_read_xer, &spr_write_xer,
+                 0x00000000);
+    /* Branch control */
+    spr_register(env, SPR_LR, "LR",
+                 &spr_read_lr, &spr_write_lr,
+                 &spr_read_lr, &spr_write_lr,
+                 0x00000000);
+    spr_register(env, SPR_CTR, "CTR",
+                 &spr_read_ctr, &spr_write_ctr,
+                 &spr_read_ctr, &spr_write_ctr,
+                 0x00000000);
+    /* Interrupt processing */
+    spr_register(env, SPR_SRR0, "SRR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SRR1, "SRR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Processor control */
+    spr_register(env, SPR_SPRG0, "SPRG0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG1, "SPRG1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG2, "SPRG2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG3, "SPRG3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+/* SPR common to all non-embedded PowerPC, including 601 */
+void gen_spr_ne_601(CPUPPCState *env)
+{
+    /* Exception processing */
+    spr_register_kvm(env, SPR_DSISR, "DSISR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_DSISR, 0x00000000);
+    spr_register_kvm(env, SPR_DAR, "DAR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_DAR, 0x00000000);
+    /* Timer */
+    spr_register(env, SPR_DECR, "DECR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_decr, &spr_write_decr,
+                 0x00000000);
+}
+
+/* Storage Description Register 1 */
+void gen_spr_sdr1(CPUPPCState *env)
+{
+#ifndef CONFIG_USER_ONLY
+    if (env->has_hv_mode) {
+        /*
+         * SDR1 is a hypervisor resource on CPUs which have a
+         * hypervisor mode
+         */
+        spr_register_hv(env, SPR_SDR1, "SDR1",
+                        SPR_NOACCESS, SPR_NOACCESS,
+                        SPR_NOACCESS, SPR_NOACCESS,
+                        &spr_read_generic, &spr_write_sdr1,
+                        0x00000000);
+    } else {
+        spr_register(env, SPR_SDR1, "SDR1",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_sdr1,
+                     0x00000000);
+    }
+#endif
+}
+
+/* BATs 0-3 */
+void gen_low_BATs(CPUPPCState *env)
+{
+#if !defined(CONFIG_USER_ONLY)
+    spr_register(env, SPR_IBAT0U, "IBAT0U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat, &spr_write_ibatu,
+                 0x00000000);
+    spr_register(env, SPR_IBAT0L, "IBAT0L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat, &spr_write_ibatl,
+                 0x00000000);
+    spr_register(env, SPR_IBAT1U, "IBAT1U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat, &spr_write_ibatu,
+                 0x00000000);
+    spr_register(env, SPR_IBAT1L, "IBAT1L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat, &spr_write_ibatl,
+                 0x00000000);
+    spr_register(env, SPR_IBAT2U, "IBAT2U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat, &spr_write_ibatu,
+                 0x00000000);
+    spr_register(env, SPR_IBAT2L, "IBAT2L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat, &spr_write_ibatl,
+                 0x00000000);
+    spr_register(env, SPR_IBAT3U, "IBAT3U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat, &spr_write_ibatu,
+                 0x00000000);
+    spr_register(env, SPR_IBAT3L, "IBAT3L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat, &spr_write_ibatl,
+                 0x00000000);
+    spr_register(env, SPR_DBAT0U, "DBAT0U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat, &spr_write_dbatu,
+                 0x00000000);
+    spr_register(env, SPR_DBAT0L, "DBAT0L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat, &spr_write_dbatl,
+                 0x00000000);
+    spr_register(env, SPR_DBAT1U, "DBAT1U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat, &spr_write_dbatu,
+                 0x00000000);
+    spr_register(env, SPR_DBAT1L, "DBAT1L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat, &spr_write_dbatl,
+                 0x00000000);
+    spr_register(env, SPR_DBAT2U, "DBAT2U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat, &spr_write_dbatu,
+                 0x00000000);
+    spr_register(env, SPR_DBAT2L, "DBAT2L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat, &spr_write_dbatl,
+                 0x00000000);
+    spr_register(env, SPR_DBAT3U, "DBAT3U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat, &spr_write_dbatu,
+                 0x00000000);
+    spr_register(env, SPR_DBAT3L, "DBAT3L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat, &spr_write_dbatl,
+                 0x00000000);
+    env->nb_BATs += 4;
+#endif
+}
+
+/* BATs 4-7 */
+void gen_high_BATs(CPUPPCState *env)
+{
+#if !defined(CONFIG_USER_ONLY)
+    spr_register(env, SPR_IBAT4U, "IBAT4U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat_h, &spr_write_ibatu_h,
+                 0x00000000);
+    spr_register(env, SPR_IBAT4L, "IBAT4L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat_h, &spr_write_ibatl_h,
+                 0x00000000);
+    spr_register(env, SPR_IBAT5U, "IBAT5U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat_h, &spr_write_ibatu_h,
+                 0x00000000);
+    spr_register(env, SPR_IBAT5L, "IBAT5L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat_h, &spr_write_ibatl_h,
+                 0x00000000);
+    spr_register(env, SPR_IBAT6U, "IBAT6U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat_h, &spr_write_ibatu_h,
+                 0x00000000);
+    spr_register(env, SPR_IBAT6L, "IBAT6L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat_h, &spr_write_ibatl_h,
+                 0x00000000);
+    spr_register(env, SPR_IBAT7U, "IBAT7U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat_h, &spr_write_ibatu_h,
+                 0x00000000);
+    spr_register(env, SPR_IBAT7L, "IBAT7L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat_h, &spr_write_ibatl_h,
+                 0x00000000);
+    spr_register(env, SPR_DBAT4U, "DBAT4U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat_h, &spr_write_dbatu_h,
+                 0x00000000);
+    spr_register(env, SPR_DBAT4L, "DBAT4L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat_h, &spr_write_dbatl_h,
+                 0x00000000);
+    spr_register(env, SPR_DBAT5U, "DBAT5U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat_h, &spr_write_dbatu_h,
+                 0x00000000);
+    spr_register(env, SPR_DBAT5L, "DBAT5L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat_h, &spr_write_dbatl_h,
+                 0x00000000);
+    spr_register(env, SPR_DBAT6U, "DBAT6U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat_h, &spr_write_dbatu_h,
+                 0x00000000);
+    spr_register(env, SPR_DBAT6L, "DBAT6L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat_h, &spr_write_dbatl_h,
+                 0x00000000);
+    spr_register(env, SPR_DBAT7U, "DBAT7U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat_h, &spr_write_dbatu_h,
+                 0x00000000);
+    spr_register(env, SPR_DBAT7L, "DBAT7L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat_h, &spr_write_dbatl_h,
+                 0x00000000);
+    env->nb_BATs += 4;
+#endif
+}
+
+/* Generic PowerPC time base */
+void gen_tbl(CPUPPCState *env)
+{
+    spr_register(env, SPR_VTBL,  "TBL",
+                 &spr_read_tbl, SPR_NOACCESS,
+                 &spr_read_tbl, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_TBL,   "TBL",
+                 &spr_read_tbl, SPR_NOACCESS,
+                 &spr_read_tbl, &spr_write_tbl,
+                 0x00000000);
+    spr_register(env, SPR_VTBU,  "TBU",
+                 &spr_read_tbu, SPR_NOACCESS,
+                 &spr_read_tbu, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_TBU,   "TBU",
+                 &spr_read_tbu, SPR_NOACCESS,
+                 &spr_read_tbu, &spr_write_tbu,
+                 0x00000000);
+}
+
+/* Softare table search registers */
+void gen_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways)
+{
+#if !defined(CONFIG_USER_ONLY)
+    env->nb_tlb = nb_tlbs;
+    env->nb_ways = nb_ways;
+    env->id_tlbs = 1;
+    env->tlb_type = TLB_6XX;
+    spr_register(env, SPR_DMISS, "DMISS",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_DCMP, "DCMP",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_HASH1, "HASH1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_HASH2, "HASH2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_IMISS, "IMISS",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_ICMP, "ICMP",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_RPA, "RPA",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+#endif
+}
+
+/* SPR common to MPC755 and G2 */
+void gen_spr_G2_755(CPUPPCState *env)
+{
+    /* SGPRs */
+    spr_register(env, SPR_SPRG4, "SPRG4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG5, "SPRG5",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG6, "SPRG6",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG7, "SPRG7",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+/* SPR common to all 7xx PowerPC implementations */
+void gen_spr_7xx(CPUPPCState *env)
+{
+    /* Breakpoints */
+    /* XXX : not implemented */
+    spr_register_kvm(env, SPR_DABR, "DABR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_DABR, 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_IABR, "IABR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Cache management */
+    /* XXX : not implemented */
+    spr_register(env, SPR_ICTC, "ICTC",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Performance monitors */
+    /* XXX : not implemented */
+    spr_register(env, SPR_7XX_MMCR0, "MMCR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_7XX_MMCR1, "MMCR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_7XX_PMC1, "PMC1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_7XX_PMC2, "PMC2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_7XX_PMC3, "PMC3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_7XX_PMC4, "PMC4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_7XX_SIAR, "SIAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_7XX_UMMCR0, "UMMCR0",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_7XX_UMMCR1, "UMMCR1",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_7XX_UPMC1, "UPMC1",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_7XX_UPMC2, "UPMC2",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_7XX_UPMC3, "UPMC3",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_7XX_UPMC4, "UPMC4",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_7XX_USIAR, "USIAR",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    /* External access control */
+    /* XXX : not implemented */
+    spr_register(env, SPR_EAR, "EAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+#ifdef TARGET_PPC64
+
+void gen_spr_amr(CPUPPCState *env)
+{
+#ifndef CONFIG_USER_ONLY
+    /*
+     * Virtual Page Class Key protection
+     *
+     * The AMR is accessible either via SPR 13 or SPR 29.  13 is
+     * userspace accessible, 29 is privileged.  So we only need to set
+     * the kvm ONE_REG id on one of them, we use 29
+     */
+    spr_register(env, SPR_UAMR, "UAMR",
+                 &spr_read_generic, &spr_write_amr,
+                 &spr_read_generic, &spr_write_amr,
+                 0);
+    spr_register_kvm_hv(env, SPR_AMR, "AMR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_amr,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_AMR, 0);
+    spr_register_kvm_hv(env, SPR_UAMOR, "UAMOR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_uamor,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_UAMOR, 0);
+    spr_register_hv(env, SPR_AMOR, "AMOR",
+                    SPR_NOACCESS, SPR_NOACCESS,
+                    SPR_NOACCESS, SPR_NOACCESS,
+                    &spr_read_generic, &spr_write_generic,
+                    0);
+#endif /* !CONFIG_USER_ONLY */
+}
+
+void gen_spr_iamr(CPUPPCState *env)
+{
+#ifndef CONFIG_USER_ONLY
+    spr_register_kvm_hv(env, SPR_IAMR, "IAMR",
+                        SPR_NOACCESS, SPR_NOACCESS,
+                        &spr_read_generic, &spr_write_iamr,
+                        &spr_read_generic, &spr_write_generic,
+                        KVM_REG_PPC_IAMR, 0);
+#endif /* !CONFIG_USER_ONLY */
+}
+#endif /* TARGET_PPC64 */
+
+
+void gen_spr_thrm(CPUPPCState *env)
+{
+    /* Thermal management */
+    /* XXX : not implemented */
+    spr_register(env, SPR_THRM1, "THRM1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_thrm, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_THRM2, "THRM2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_thrm, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_THRM3, "THRM3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_thrm, &spr_write_generic,
+                 0x00000000);
+}
+
+/* SPR specific to PowerPC 604 implementation */
+void gen_spr_604(CPUPPCState *env)
+{
+    /* Processor identification */
+    spr_register(env, SPR_PIR, "PIR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_pir,
+                 0x00000000);
+    /* Breakpoints */
+    /* XXX : not implemented */
+    spr_register(env, SPR_IABR, "IABR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register_kvm(env, SPR_DABR, "DABR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_DABR, 0x00000000);
+    /* Performance counters */
+    /* XXX : not implemented */
+    spr_register(env, SPR_7XX_MMCR0, "MMCR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_7XX_PMC1, "PMC1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_7XX_PMC2, "PMC2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_7XX_SIAR, "SIAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_SDA, "SDA",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+    /* External access control */
+    /* XXX : not implemented */
+    spr_register(env, SPR_EAR, "EAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+/* SPR specific to PowerPC 603 implementation */
+void gen_spr_603(CPUPPCState *env)
+{
+    /* External access control */
+    /* XXX : not implemented */
+    spr_register(env, SPR_EAR, "EAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Breakpoints */
+    /* XXX : not implemented */
+    spr_register(env, SPR_IABR, "IABR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+}
+
+/* SPR specific to PowerPC G2 implementation */
+void gen_spr_G2(CPUPPCState *env)
+{
+    /* Memory base address */
+    /* MBAR */
+    /* XXX : not implemented */
+    spr_register(env, SPR_MBAR, "MBAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Exception processing */
+    spr_register(env, SPR_BOOKE_CSRR0, "CSRR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_CSRR1, "CSRR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Breakpoints */
+    /* XXX : not implemented */
+    spr_register(env, SPR_DABR, "DABR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_DABR2, "DABR2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_IABR, "IABR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_IABR2, "IABR2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_IBCR, "IBCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_DBCR, "DBCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+/* SPR specific to PowerPC 602 implementation */
+void gen_spr_602(CPUPPCState *env)
+{
+    /* ESA registers */
+    /* XXX : not implemented */
+    spr_register(env, SPR_SER, "SER",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_SEBR, "SEBR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_ESASRR, "ESASRR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Floating point status */
+    /* XXX : not implemented */
+    spr_register(env, SPR_SP, "SP",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_LT, "LT",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Watchdog timer */
+    /* XXX : not implemented */
+    spr_register(env, SPR_TCR, "TCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Interrupt base */
+    spr_register(env, SPR_IBR, "IBR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_IABR, "IABR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+/* SPR specific to PowerPC 601 implementation */
+void gen_spr_601(CPUPPCState *env)
+{
+    /* Multiplication/division register */
+    /* MQ */
+    spr_register(env, SPR_MQ, "MQ",
+                 &spr_read_generic, &spr_write_generic,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* RTC registers */
+    spr_register(env, SPR_601_RTCU, "RTCU",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, &spr_write_601_rtcu,
+                 0x00000000);
+    spr_register(env, SPR_601_VRTCU, "RTCU",
+                 &spr_read_601_rtcu, SPR_NOACCESS,
+                 &spr_read_601_rtcu, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_601_RTCL, "RTCL",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, &spr_write_601_rtcl,
+                 0x00000000);
+    spr_register(env, SPR_601_VRTCL, "RTCL",
+                 &spr_read_601_rtcl, SPR_NOACCESS,
+                 &spr_read_601_rtcl, SPR_NOACCESS,
+                 0x00000000);
+    /* Timer */
+#if 0 /* ? */
+    spr_register(env, SPR_601_UDECR, "UDECR",
+                 &spr_read_decr, SPR_NOACCESS,
+                 &spr_read_decr, SPR_NOACCESS,
+                 0x00000000);
+#endif
+    /* External access control */
+    /* XXX : not implemented */
+    spr_register(env, SPR_EAR, "EAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Memory management */
+#if !defined(CONFIG_USER_ONLY)
+    spr_register(env, SPR_IBAT0U, "IBAT0U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_601_ubat, &spr_write_601_ubatu,
+                 0x00000000);
+    spr_register(env, SPR_IBAT0L, "IBAT0L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_601_ubat, &spr_write_601_ubatl,
+                 0x00000000);
+    spr_register(env, SPR_IBAT1U, "IBAT1U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_601_ubat, &spr_write_601_ubatu,
+                 0x00000000);
+    spr_register(env, SPR_IBAT1L, "IBAT1L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_601_ubat, &spr_write_601_ubatl,
+                 0x00000000);
+    spr_register(env, SPR_IBAT2U, "IBAT2U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_601_ubat, &spr_write_601_ubatu,
+                 0x00000000);
+    spr_register(env, SPR_IBAT2L, "IBAT2L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_601_ubat, &spr_write_601_ubatl,
+                 0x00000000);
+    spr_register(env, SPR_IBAT3U, "IBAT3U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_601_ubat, &spr_write_601_ubatu,
+                 0x00000000);
+    spr_register(env, SPR_IBAT3L, "IBAT3L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_601_ubat, &spr_write_601_ubatl,
+                 0x00000000);
+    env->nb_BATs = 4;
+#endif
+}
+
+void gen_spr_74xx(CPUPPCState *env)
+{
+    /* Processor identification */
+    spr_register(env, SPR_PIR, "PIR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_pir,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_74XX_MMCR2, "MMCR2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_74XX_UMMCR2, "UMMCR2",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    /* XXX: not implemented */
+    spr_register(env, SPR_BAMR, "BAMR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MSSCR0, "MSSCR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Hardware implementation registers */
+    /* XXX : not implemented */
+    spr_register(env, SPR_HID0, "HID0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_HID1, "HID1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Altivec */
+    spr_register(env, SPR_VRSAVE, "VRSAVE",
+                 &spr_read_generic, &spr_write_generic,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_L2CR, "L2CR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, spr_access_nop,
+                 0x00000000);
+}
+
+void gen_l3_ctrl(CPUPPCState *env)
+{
+    /* L3CR */
+    /* XXX : not implemented */
+    spr_register(env, SPR_L3CR, "L3CR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* L3ITCR0 */
+    /* XXX : not implemented */
+    spr_register(env, SPR_L3ITCR0, "L3ITCR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* L3PM */
+    /* XXX : not implemented */
+    spr_register(env, SPR_L3PM, "L3PM",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+void gen_74xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways)
+{
+#if !defined(CONFIG_USER_ONLY)
+    env->nb_tlb = nb_tlbs;
+    env->nb_ways = nb_ways;
+    env->id_tlbs = 1;
+    env->tlb_type = TLB_6XX;
+    /* XXX : not implemented */
+    spr_register(env, SPR_PTEHI, "PTEHI",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_PTELO, "PTELO",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_TLBMISS, "TLBMISS",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+#endif
+}
+
+/* SPRs that were called directly from init_procs in cpu_init */
+/* This was a quick & dirty solution to get the RFC out */
+void gen_spr_not_implemented(CPUPPCState *env,
+                             int num, const char *name)
+{
+    spr_register(env, num, name,
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+void gen_spr_not_implemented_ureg(CPUPPCState *env,
+                                  int num, const char *name)
+{
+    spr_register(env, num, name,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+}
+
+void gen_spr_not_implemented_no_write(CPUPPCState *env,
+                                      int num, const char *name)
+{
+    spr_register(env, num, name,
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+}
+
+void gen_spr_not_implemented_write_nop(CPUPPCState *env,
+                                       int num, const char *name)
+{
+    spr_register(env, num, name,
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, spr_access_nop,
+                 0x00000000);
+}
+
+void gen_spr_PSSCR(CPUPPCState *env)
+{
+    /* FIXME: Filter fields properly based on privilege level */
+    spr_register_kvm_hv(env, SPR_PSSCR, "PSSCR", NULL, NULL, NULL, NULL,
+                        spr_read_generic, spr_write_generic,
+                        KVM_REG_PPC_PSSCR, 0);
+}
+
+void gen_spr_TIDR(CPUPPCState *env)
+{
+    spr_register_kvm(env, SPR_TIDR, "TIDR", NULL, NULL,
+                     spr_read_generic, spr_write_generic,
+                     KVM_REG_PPC_TIDR, 0);
+}
+
+void gen_spr_pvr(CPUPPCState *env, PowerPCCPUClass *pcc)
+{
+    spr_register(env, SPR_PVR, "PVR",
+                 /* Linux permits userspace to read PVR */
+#if defined(CONFIG_LINUX_USER)
+                 &spr_read_generic,
+#else
+                 SPR_NOACCESS,
+#endif
+                 SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 pcc->pvr);
+}
+
+void gen_spr_svr(CPUPPCState *env, PowerPCCPUClass *pcc)
+{
+    if (pcc->svr & POWERPC_SVR_E500) {
+        spr_register(env, SPR_E500_SVR, "SVR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, SPR_NOACCESS,
+                     pcc->svr & ~POWERPC_SVR_E500);
+    } else {
+        spr_register(env, SPR_SVR, "SVR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, SPR_NOACCESS,
+                     pcc->svr);
+    }
+}
+
+void gen_spr_pir(CPUPPCState *env)
+{
+    spr_register(env, SPR_BOOKE_PIR, "PIR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_pir,
+                 0x00000000);
+}
+
+void gen_spr_spefscr(CPUPPCState *env)
+{
+    spr_register(env, SPR_BOOKE_SPEFSCR, "SPEFSCR",
+                 &spr_read_spefscr, &spr_write_spefscr,
+                 &spr_read_spefscr, &spr_write_spefscr,
+                 0x00000000);
+}
+
+void gen_spr_l1fgc(CPUPPCState *env, int num, int inital_value)
+{
+    if (num == SPR_Exxx_L1CFG0) {
+        spr_register(env, SPR_Exxx_L1CFG0, "L1CFG0",
+                     &spr_read_generic, SPR_NOACCESS,
+                     &spr_read_generic, SPR_NOACCESS,
+                     inital_value);
+    } else if (num == SPR_Exxx_L1CFG1) {
+        spr_register(env, SPR_Exxx_L1CFG1, "L1CFG1",
+                     &spr_read_generic, SPR_NOACCESS,
+                     &spr_read_generic, SPR_NOACCESS,
+                     inital_value);
+    } else {
+        /* This should never be reached */
+        /* and this function will probably be removed later */
+    }
+}
+
+void gen_spr_hid0(CPUPPCState *env)
+{
+    spr_register(env, SPR_HID0, "HID0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_hid0_601,
+                 0x80010080);
+}
+
+void gen_spr_mas73(CPUPPCState *env)
+{
+    spr_register(env, SPR_BOOKE_MAS7_MAS3, "MAS7_MAS3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_mas73, &spr_write_mas73,
+                 0x00000000);
+}
+
+void gen_spr_mmucsr0(CPUPPCState *env)
+{
+    spr_register(env, SPR_MMUCSR0, "MMUCSR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_booke206_mmucsr0,
+                 0x00000000);
+}
+
+void gen_spr_l1csr0(CPUPPCState *env)
+{
+    spr_register(env, SPR_Exxx_L1CSR0, "L1CSR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_e500_l1csr0,
+                 0x00000000);
+}
+
+void gen_spr_l1csr1(CPUPPCState *env)
+{
+    spr_register(env, SPR_Exxx_L1CSR1, "L1CSR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_e500_l1csr1,
+                 0x00000000);
+}
+
+void gen_spr_l2csr0(CPUPPCState *env)
+{
+    spr_register(env, SPR_Exxx_L2CSR0, "L2CSR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_e500_l2csr0,
+                 0x00000000);
+}
+
+void gen_spr_usprg3(CPUPPCState *env)
+{
+    spr_register(env, SPR_USPRG3, "USPRG3",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+}
+
+void gen_spr_usprgh(CPUPPCState *env)
+{
+    spr_register(env, SPR_USPRG4, "USPRG4",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_USPRG5, "USPRG5",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_USPRG6, "USPRG6",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_USPRG7, "USPRG7",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+}
+
+/* PowerPC BookE SPR */
+void gen_spr_BookE(CPUPPCState *env, uint64_t ivor_mask)
+{
+    const char *ivor_names[64] = {
+        "IVOR0",  "IVOR1",  "IVOR2",  "IVOR3",
+        "IVOR4",  "IVOR5",  "IVOR6",  "IVOR7",
+        "IVOR8",  "IVOR9",  "IVOR10", "IVOR11",
+        "IVOR12", "IVOR13", "IVOR14", "IVOR15",
+        "IVOR16", "IVOR17", "IVOR18", "IVOR19",
+        "IVOR20", "IVOR21", "IVOR22", "IVOR23",
+        "IVOR24", "IVOR25", "IVOR26", "IVOR27",
+        "IVOR28", "IVOR29", "IVOR30", "IVOR31",
+        "IVOR32", "IVOR33", "IVOR34", "IVOR35",
+        "IVOR36", "IVOR37", "IVOR38", "IVOR39",
+        "IVOR40", "IVOR41", "IVOR42", "IVOR43",
+        "IVOR44", "IVOR45", "IVOR46", "IVOR47",
+        "IVOR48", "IVOR49", "IVOR50", "IVOR51",
+        "IVOR52", "IVOR53", "IVOR54", "IVOR55",
+        "IVOR56", "IVOR57", "IVOR58", "IVOR59",
+        "IVOR60", "IVOR61", "IVOR62", "IVOR63",
+    };
+#define SPR_BOOKE_IVORxx (-1)
+    int ivor_sprn[64] = {
+        SPR_BOOKE_IVOR0,  SPR_BOOKE_IVOR1,  SPR_BOOKE_IVOR2,  SPR_BOOKE_IVOR3,
+        SPR_BOOKE_IVOR4,  SPR_BOOKE_IVOR5,  SPR_BOOKE_IVOR6,  SPR_BOOKE_IVOR7,
+        SPR_BOOKE_IVOR8,  SPR_BOOKE_IVOR9,  SPR_BOOKE_IVOR10, SPR_BOOKE_IVOR11,
+        SPR_BOOKE_IVOR12, SPR_BOOKE_IVOR13, SPR_BOOKE_IVOR14, SPR_BOOKE_IVOR15,
+        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
+        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
+        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
+        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
+        SPR_BOOKE_IVOR32, SPR_BOOKE_IVOR33, SPR_BOOKE_IVOR34, SPR_BOOKE_IVOR35,
+        SPR_BOOKE_IVOR36, SPR_BOOKE_IVOR37, SPR_BOOKE_IVOR38, SPR_BOOKE_IVOR39,
+        SPR_BOOKE_IVOR40, SPR_BOOKE_IVOR41, SPR_BOOKE_IVOR42, SPR_BOOKE_IVORxx,
+        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
+        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
+        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
+        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
+        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
+    };
+    int i;
+
+    /* Interrupt processing */
+    spr_register(env, SPR_BOOKE_CSRR0, "CSRR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_CSRR1, "CSRR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Debug */
+    /* XXX : not implemented */
+    spr_register(env, SPR_BOOKE_IAC1, "IAC1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_BOOKE_IAC2, "IAC2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_BOOKE_DAC1, "DAC1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_BOOKE_DAC2, "DAC2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_BOOKE_DBCR0, "DBCR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_40x_dbcr0,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_BOOKE_DBCR1, "DBCR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_BOOKE_DBCR2, "DBCR2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_DSRR0, "DSRR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_DSRR1, "DSRR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_BOOKE_DBSR, "DBSR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_clear,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_DEAR, "DEAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_ESR, "ESR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_IVPR, "IVPR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_excp_prefix,
+                 0x00000000);
+    /* Exception vectors */
+    for (i = 0; i < 64; i++) {
+        if (ivor_mask & (1ULL << i)) {
+            if (ivor_sprn[i] == SPR_BOOKE_IVORxx) {
+                fprintf(stderr, "ERROR: IVOR %d SPR is not defined\n", i);
+                exit(1);
+            }
+            spr_register(env, ivor_sprn[i], ivor_names[i],
+                         SPR_NOACCESS, SPR_NOACCESS,
+                         &spr_read_generic, &spr_write_excp_vector,
+                         0x00000000);
+        }
+    }
+    spr_register(env, SPR_BOOKE_PID, "PID",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_booke_pid,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_TCR, "TCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_booke_tcr,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_TSR, "TSR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_booke_tsr,
+                 0x00000000);
+    /* Timer */
+    spr_register(env, SPR_DECR, "DECR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_decr, &spr_write_decr,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_DECAR, "DECAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, &spr_write_generic,
+                 0x00000000);
+    /* SPRGs */
+    spr_register(env, SPR_USPRG0, "USPRG0",
+                 &spr_read_generic, &spr_write_generic,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG4, "SPRG4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG5, "SPRG5",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG6, "SPRG6",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG7, "SPRG7",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_SPRG8, "SPRG8",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_SPRG9, "SPRG9",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+inline uint32_t gen_tlbncfg(uint32_t assoc, uint32_t minsize,
+                                   uint32_t maxsize, uint32_t flags,
+                                   uint32_t nentries)
+{
+    return (assoc << TLBnCFG_ASSOC_SHIFT) |
+           (minsize << TLBnCFG_MINSIZE_SHIFT) |
+           (maxsize << TLBnCFG_MAXSIZE_SHIFT) |
+           flags | nentries;
+}
+
+/* BookE 2.06 storage control registers */
+void gen_spr_BookE206(CPUPPCState *env, uint32_t mas_mask,
+                             uint32_t *tlbncfg, uint32_t mmucfg)
+{
+#if !defined(CONFIG_USER_ONLY)
+    const char *mas_names[8] = {
+        "MAS0", "MAS1", "MAS2", "MAS3", "MAS4", "MAS5", "MAS6", "MAS7",
+    };
+    int mas_sprn[8] = {
+        SPR_BOOKE_MAS0, SPR_BOOKE_MAS1, SPR_BOOKE_MAS2, SPR_BOOKE_MAS3,
+        SPR_BOOKE_MAS4, SPR_BOOKE_MAS5, SPR_BOOKE_MAS6, SPR_BOOKE_MAS7,
+    };
+    int i;
+
+    /* TLB assist registers */
+    /* XXX : not implemented */
+    for (i = 0; i < 8; i++) {
+        void (*uea_write)(DisasContext *ctx, int sprn, int gprn) =
+            &spr_write_generic32;
+        if (i == 2 && (mas_mask & (1 << i)) && (env->insns_flags & PPC_64B)) {
+            uea_write = &spr_write_generic;
+        }
+        if (mas_mask & (1 << i)) {
+            spr_register(env, mas_sprn[i], mas_names[i],
+                         SPR_NOACCESS, SPR_NOACCESS,
+                         &spr_read_generic, uea_write,
+                         0x00000000);
+        }
+    }
+    if (env->nb_pids > 1) {
+        /* XXX : not implemented */
+        spr_register(env, SPR_BOOKE_PID1, "PID1",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_booke_pid,
+                     0x00000000);
+    }
+    if (env->nb_pids > 2) {
+        /* XXX : not implemented */
+        spr_register(env, SPR_BOOKE_PID2, "PID2",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_booke_pid,
+                     0x00000000);
+    }
+
+    spr_register(env, SPR_BOOKE_EPLC, "EPLC",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_eplc,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_EPSC, "EPSC",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_epsc,
+                 0x00000000);
+
+    /* XXX : not implemented */
+    spr_register(env, SPR_MMUCFG, "MMUCFG",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 mmucfg);
+    switch (env->nb_ways) {
+    case 4:
+        spr_register(env, SPR_BOOKE_TLB3CFG, "TLB3CFG",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, SPR_NOACCESS,
+                     tlbncfg[3]);
+        /* Fallthru */
+    case 3:
+        spr_register(env, SPR_BOOKE_TLB2CFG, "TLB2CFG",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, SPR_NOACCESS,
+                     tlbncfg[2]);
+        /* Fallthru */
+    case 2:
+        spr_register(env, SPR_BOOKE_TLB1CFG, "TLB1CFG",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, SPR_NOACCESS,
+                     tlbncfg[1]);
+        /* Fallthru */
+    case 1:
+        spr_register(env, SPR_BOOKE_TLB0CFG, "TLB0CFG",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, SPR_NOACCESS,
+                     tlbncfg[0]);
+        /* Fallthru */
+    case 0:
+    default:
+        break;
+    }
+#endif
+
+    gen_spr_usprgh(env);
+}
+
+/* SPR specific to PowerPC 440 implementation */
+void gen_spr_440(CPUPPCState *env)
+{
+    /* Cache control */
+    /* XXX : not implemented */
+    spr_register(env, SPR_440_DNV0, "DNV0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_440_DNV1, "DNV1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_440_DNV2, "DNV2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_440_DNV3, "DNV3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_440_DTV0, "DTV0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_440_DTV1, "DTV1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_440_DTV2, "DTV2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_440_DTV3, "DTV3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_440_DVLIM, "DVLIM",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_440_INV0, "INV0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_440_INV1, "INV1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_440_INV2, "INV2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_440_INV3, "INV3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_440_ITV0, "ITV0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_440_ITV1, "ITV1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_440_ITV2, "ITV2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_440_ITV3, "ITV3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_440_IVLIM, "IVLIM",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Cache debug */
+    /* XXX : not implemented */
+    spr_register(env, SPR_BOOKE_DCDBTRH, "DCDBTRH",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_BOOKE_DCDBTRL, "DCDBTRL",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_BOOKE_ICDBDR, "ICDBDR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_BOOKE_ICDBTRH, "ICDBTRH",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_BOOKE_ICDBTRL, "ICDBTRL",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_440_DBDR, "DBDR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Processor control */
+    spr_register(env, SPR_4xx_CCR0, "CCR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_440_RSTCFG, "RSTCFG",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+    /* Storage control */
+    spr_register(env, SPR_440_MMUCR, "MMUCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+/* not sure what these SPRs are, but they were always together */
+void gen_spr_440_misc(CPUPPCState *env)
+{
+    /* Processor identification */
+    gen_spr_pir(env);
+    /* XXX : not implemented */
+    gen_spr_not_implemented(env, SPR_BOOKE_IAC3, "IAC3");
+    /* XXX : not implemented */
+    gen_spr_not_implemented(env, SPR_BOOKE_IAC4, "IAC4");
+    /* XXX : not implemented */
+    gen_spr_not_implemented(env, SPR_BOOKE_DVC1, "DVC1");
+    /* XXX : not implemented */
+    gen_spr_not_implemented(env, SPR_BOOKE_DVC2, "DVC2");
+}
+
+/* SPR shared between PowerPC 40x implementations */
+void gen_spr_40x(CPUPPCState *env)
+{
+    /* Cache */
+    /* not emulated, as QEMU do not emulate caches */
+    spr_register(env, SPR_40x_DCCR, "DCCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* not emulated, as QEMU do not emulate caches */
+    spr_register(env, SPR_40x_ICCR, "ICCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* not emulated, as QEMU do not emulate caches */
+    spr_register(env, SPR_BOOKE_ICDBDR, "ICDBDR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+    /* Exception */
+    spr_register(env, SPR_40x_DEAR, "DEAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_40x_ESR, "ESR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_40x_EVPR, "EVPR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_excp_prefix,
+                 0x00000000);
+    spr_register(env, SPR_40x_SRR2, "SRR2",
+                 &spr_read_generic, &spr_write_generic,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_40x_SRR3, "SRR3",
+                 &spr_read_generic, &spr_write_generic,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Timers */
+    spr_register(env, SPR_40x_PIT, "PIT",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_40x_pit, &spr_write_40x_pit,
+                 0x00000000);
+    spr_register(env, SPR_40x_TCR, "TCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_booke_tcr,
+                 0x00000000);
+    spr_register(env, SPR_40x_TSR, "TSR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_booke_tsr,
+                 0x00000000);
+}
+
+/* SPR specific to PowerPC 405 implementation */
+void gen_spr_405(CPUPPCState *env)
+{
+    /* MMU */
+    spr_register(env, SPR_40x_PID, "PID",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_4xx_CCR0, "CCR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00700000);
+    /* Debug interface */
+    /* XXX : not implemented */
+    spr_register(env, SPR_40x_DBCR0, "DBCR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_40x_dbcr0,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_405_DBCR1, "DBCR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_40x_DBSR, "DBSR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_clear,
+                 /* Last reset was system reset */
+                 0x00000300);
+    /* XXX : not implemented */
+    spr_register(env, SPR_40x_DAC1, "DAC1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_40x_DAC2, "DAC2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_405_DVC1, "DVC1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_405_DVC2, "DVC2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_40x_IAC1, "IAC1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_40x_IAC2, "IAC2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_405_IAC3, "IAC3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_405_IAC4, "IAC4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Storage control */
+    /* XXX: TODO: not implemented */
+    spr_register(env, SPR_405_SLER, "SLER",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_40x_sler,
+                 0x00000000);
+    spr_register(env, SPR_40x_ZPR, "ZPR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_405_SU0R, "SU0R",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* SPRG */
+    spr_register(env, SPR_USPRG0, "USPRG0",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_SPRG4, "SPRG4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG5, "SPRG5",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG6, "SPRG6",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG7, "SPRG7",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    gen_spr_usprgh(env);
+}
+
+/* SPR shared between PowerPC 401 & 403 implementations */
+void gen_spr_401_403(CPUPPCState *env)
+{
+    /* Time base */
+    spr_register(env, SPR_403_VTBL,  "TBL",
+                 &spr_read_tbl, SPR_NOACCESS,
+                 &spr_read_tbl, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_403_TBL,   "TBL",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, &spr_write_tbl,
+                 0x00000000);
+    spr_register(env, SPR_403_VTBU,  "TBU",
+                 &spr_read_tbu, SPR_NOACCESS,
+                 &spr_read_tbu, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_403_TBU,   "TBU",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, &spr_write_tbu,
+                 0x00000000);
+    /* Debug */
+    /* not emulated, as QEMU do not emulate caches */
+    spr_register(env, SPR_403_CDBCR, "CDBCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+/* SPR specific to PowerPC 401 implementation */
+void gen_spr_401(CPUPPCState *env)
+{
+    /* Debug interface */
+    /* XXX : not implemented */
+    spr_register(env, SPR_40x_DBCR0, "DBCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_40x_dbcr0,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_40x_DBSR, "DBSR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_clear,
+                 /* Last reset was system reset */
+                 0x00000300);
+    /* XXX : not implemented */
+    spr_register(env, SPR_40x_DAC1, "DAC",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_40x_IAC1, "IAC",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Storage control */
+    /* XXX: TODO: not implemented */
+    spr_register(env, SPR_405_SLER, "SLER",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_40x_sler,
+                 0x00000000);
+    /* not emulated, as QEMU never does speculative access */
+    spr_register(env, SPR_40x_SGR, "SGR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0xFFFFFFFF);
+    /* not emulated, as QEMU do not emulate caches */
+    spr_register(env, SPR_40x_DCWR, "DCWR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+void gen_spr_401x2(CPUPPCState *env)
+{
+    gen_spr_401(env);
+    spr_register(env, SPR_40x_PID, "PID",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_40x_ZPR, "ZPR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+/* SPR specific to PowerPC 403 implementation */
+void gen_spr_403(CPUPPCState *env)
+{
+    /* Debug interface */
+    /* XXX : not implemented */
+    spr_register(env, SPR_40x_DBCR0, "DBCR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_40x_dbcr0,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_40x_DBSR, "DBSR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_clear,
+                 /* Last reset was system reset */
+                 0x00000300);
+    /* XXX : not implemented */
+    spr_register(env, SPR_40x_DAC1, "DAC1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_40x_DAC2, "DAC2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_40x_IAC1, "IAC1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_40x_IAC2, "IAC2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+void gen_spr_403_real(CPUPPCState *env)
+{
+    spr_register(env, SPR_403_PBL1,  "PBL1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_403_pbr, &spr_write_403_pbr,
+                 0x00000000);
+    spr_register(env, SPR_403_PBU1,  "PBU1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_403_pbr, &spr_write_403_pbr,
+                 0x00000000);
+    spr_register(env, SPR_403_PBL2,  "PBL2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_403_pbr, &spr_write_403_pbr,
+                 0x00000000);
+    spr_register(env, SPR_403_PBU2,  "PBU2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_403_pbr, &spr_write_403_pbr,
+                 0x00000000);
+}
+
+void gen_spr_403_mmu(CPUPPCState *env)
+{
+    /* MMU */
+    spr_register(env, SPR_40x_PID, "PID",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_40x_ZPR, "ZPR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+void gen_spr_40x_bus_control(CPUPPCState *env)
+{
+    /* Bus access control */
+    /* not emulated, as QEMU never does speculative access */
+    gen_spr_not_implemented(env, SPR_40x_SGR, "SGR");
+    /* not emulated, as QEMU do not emulate caches */
+    gen_spr_not_implemented(env, SPR_40x_DCWR, "DCWR");
+}
+
+/* SPR specific to PowerPC compression coprocessor extension */
+void gen_spr_compress(CPUPPCState *env)
+{
+    /* XXX : not implemented */
+    spr_register(env, SPR_401_SKR, "SKR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+void gen_spr_5xx_8xx(CPUPPCState *env)
+{
+    /* Exception processing */
+    spr_register_kvm(env, SPR_DSISR, "DSISR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_DSISR, 0x00000000);
+    spr_register_kvm(env, SPR_DAR, "DAR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_DAR, 0x00000000);
+    /* Timer */
+    spr_register(env, SPR_DECR, "DECR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_decr, &spr_write_decr,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_EIE, "EIE",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_EID, "EID",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_NRI, "NRI",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_CMPA, "CMPA",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_CMPB, "CMPB",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_CMPC, "CMPC",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_CMPD, "CMPD",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_ECR, "ECR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_DER, "DER",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_COUNTA, "COUNTA",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_COUNTB, "COUNTB",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_CMPE, "CMPE",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_CMPF, "CMPF",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_CMPG, "CMPG",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_CMPH, "CMPH",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_LCTRL1, "LCTRL1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_LCTRL2, "LCTRL2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_BAR, "BAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_DPDR, "DPDR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_IMMR, "IMMR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+void gen_spr_5xx(CPUPPCState *env)
+{
+    /* XXX : not implemented */
+    spr_register(env, SPR_RCPU_MI_GRA, "MI_GRA",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_RCPU_L2U_GRA, "L2U_GRA",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_RPCU_BBCMCR, "L2U_BBCMCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_RCPU_L2U_MCR, "L2U_MCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_RCPU_MI_RBA0, "MI_RBA0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_RCPU_MI_RBA1, "MI_RBA1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_RCPU_MI_RBA2, "MI_RBA2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_RCPU_MI_RBA3, "MI_RBA3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_RCPU_L2U_RBA0, "L2U_RBA0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_RCPU_L2U_RBA1, "L2U_RBA1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_RCPU_L2U_RBA2, "L2U_RBA2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_RCPU_L2U_RBA3, "L2U_RBA3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_RCPU_MI_RA0, "MI_RA0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_RCPU_MI_RA1, "MI_RA1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_RCPU_MI_RA2, "MI_RA2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_RCPU_MI_RA3, "MI_RA3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_RCPU_L2U_RA0, "L2U_RA0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_RCPU_L2U_RA1, "L2U_RA1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_RCPU_L2U_RA2, "L2U_RA2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_RCPU_L2U_RA3, "L2U_RA3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_RCPU_FPECR, "FPECR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+void gen_spr_8xx(CPUPPCState *env)
+{
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_IC_CST, "IC_CST",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_IC_ADR, "IC_ADR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_IC_DAT, "IC_DAT",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_DC_CST, "DC_CST",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_DC_ADR, "DC_ADR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_DC_DAT, "DC_DAT",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_MI_CTR, "MI_CTR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_MI_AP, "MI_AP",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_MI_EPN, "MI_EPN",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_MI_TWC, "MI_TWC",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_MI_RPN, "MI_RPN",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_MI_DBCAM, "MI_DBCAM",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_MI_DBRAM0, "MI_DBRAM0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_MI_DBRAM1, "MI_DBRAM1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_MD_CTR, "MD_CTR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_MD_CASID, "MD_CASID",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_MD_AP, "MD_AP",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_MD_EPN, "MD_EPN",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_MD_TWB, "MD_TWB",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_MD_TWC, "MD_TWC",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_MD_RPN, "MD_RPN",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_MD_TW, "MD_TW",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_MD_DBCAM, "MD_DBCAM",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_MD_DBRAM0, "MD_DBRAM0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* XXX : not implemented */
+    spr_register(env, SPR_MPC_MD_DBRAM1, "MD_DBRAM1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+#if defined(TARGET_PPC64)
+#if defined(CONFIG_USER_ONLY)
+#define POWERPC970_HID5_INIT 0x00000080
+#else
+#define POWERPC970_HID5_INIT 0x00000000
+#endif
+
+void gen_spr_970_hid(CPUPPCState *env)
+{
+    /* Hardware implementation registers */
+    /* XXX : not implemented */
+    spr_register(env, SPR_HID0, "HID0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_clear,
+                 0x60000000);
+    spr_register(env, SPR_HID1, "HID1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_970_HID5, "HID5",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 POWERPC970_HID5_INIT);
+}
+
+void gen_spr_970_hior(CPUPPCState *env)
+{
+    spr_register(env, SPR_HIOR, "SPR_HIOR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_hior, &spr_write_hior,
+                 0x00000000);
+}
+
+void gen_spr_book3s_ctrl(CPUPPCState *env)
+{
+    spr_register(env, SPR_CTRL, "SPR_CTRL",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_UCTRL, "SPR_UCTRL",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+}
+
+void gen_spr_book3s_altivec(CPUPPCState *env)
+{
+    if (!(env->insns_flags & PPC_ALTIVEC)) {
+        return;
+    }
+
+    spr_register_kvm(env, SPR_VRSAVE, "VRSAVE",
+                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_VRSAVE, 0x00000000);
+
+}
+
+void gen_spr_book3s_dbg(CPUPPCState *env)
+{
+    /*
+     * TODO: different specs define different scopes for these,
+     * will have to address this:
+     * 970: super/write and super/read
+     * powerisa 2.03..2.04: hypv/write and super/read.
+     * powerisa 2.05 and newer: hypv/write and hypv/read.
+     */
+    spr_register_kvm(env, SPR_DABR, "DABR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_DABR, 0x00000000);
+    spr_register_kvm(env, SPR_DABRX, "DABRX",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_DABRX, 0x00000000);
+}
+
+void gen_spr_book3s_207_dbg(CPUPPCState *env)
+{
+    spr_register_kvm_hv(env, SPR_DAWR, "DAWR",
+                        SPR_NOACCESS, SPR_NOACCESS,
+                        SPR_NOACCESS, SPR_NOACCESS,
+                        &spr_read_generic, &spr_write_generic,
+                        KVM_REG_PPC_DAWR, 0x00000000);
+    spr_register_kvm_hv(env, SPR_DAWRX, "DAWRX",
+                        SPR_NOACCESS, SPR_NOACCESS,
+                        SPR_NOACCESS, SPR_NOACCESS,
+                        &spr_read_generic, &spr_write_generic,
+                        KVM_REG_PPC_DAWRX, 0x00000000);
+    spr_register_kvm_hv(env, SPR_CIABR, "CIABR",
+                        SPR_NOACCESS, SPR_NOACCESS,
+                        SPR_NOACCESS, SPR_NOACCESS,
+                        &spr_read_generic, &spr_write_generic,
+                        KVM_REG_PPC_CIABR, 0x00000000);
+}
+
+void gen_spr_970_dbg(CPUPPCState *env)
+{
+    /* Breakpoints */
+    spr_register(env, SPR_IABR, "IABR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+void gen_spr_book3s_pmu_sup(CPUPPCState *env)
+{
+    spr_register_kvm(env, SPR_POWER_MMCR0, "MMCR0",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_MMCR0, 0x00000000);
+    spr_register_kvm(env, SPR_POWER_MMCR1, "MMCR1",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_MMCR1, 0x00000000);
+    spr_register_kvm(env, SPR_POWER_MMCRA, "MMCRA",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_MMCRA, 0x00000000);
+    spr_register_kvm(env, SPR_POWER_PMC1, "PMC1",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_PMC1, 0x00000000);
+    spr_register_kvm(env, SPR_POWER_PMC2, "PMC2",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_PMC2, 0x00000000);
+    spr_register_kvm(env, SPR_POWER_PMC3, "PMC3",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_PMC3, 0x00000000);
+    spr_register_kvm(env, SPR_POWER_PMC4, "PMC4",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_PMC4, 0x00000000);
+    spr_register_kvm(env, SPR_POWER_PMC5, "PMC5",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_PMC5, 0x00000000);
+    spr_register_kvm(env, SPR_POWER_PMC6, "PMC6",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_PMC6, 0x00000000);
+    spr_register_kvm(env, SPR_POWER_SIAR, "SIAR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_SIAR, 0x00000000);
+    spr_register_kvm(env, SPR_POWER_SDAR, "SDAR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_SDAR, 0x00000000);
+}
+
+void gen_spr_book3s_pmu_user(CPUPPCState *env)
+{
+    spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_ureg,
+                 0x00000000);
+    spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_ureg,
+                 0x00000000);
+    spr_register(env, SPR_POWER_UMMCRA, "UMMCRA",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_ureg,
+                 0x00000000);
+    spr_register(env, SPR_POWER_UPMC1, "UPMC1",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_ureg,
+                 0x00000000);
+    spr_register(env, SPR_POWER_UPMC2, "UPMC2",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_ureg,
+                 0x00000000);
+    spr_register(env, SPR_POWER_UPMC3, "UPMC3",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_ureg,
+                 0x00000000);
+    spr_register(env, SPR_POWER_UPMC4, "UPMC4",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_ureg,
+                 0x00000000);
+    spr_register(env, SPR_POWER_UPMC5, "UPMC5",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_ureg,
+                 0x00000000);
+    spr_register(env, SPR_POWER_UPMC6, "UPMC6",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_ureg,
+                 0x00000000);
+    spr_register(env, SPR_POWER_USIAR, "USIAR",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_ureg,
+                 0x00000000);
+    spr_register(env, SPR_POWER_USDAR, "USDAR",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_ureg,
+                 0x00000000);
+}
+
+void gen_spr_970_pmu_sup(CPUPPCState *env)
+{
+    spr_register_kvm(env, SPR_970_PMC7, "PMC7",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_PMC7, 0x00000000);
+    spr_register_kvm(env, SPR_970_PMC8, "PMC8",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_PMC8, 0x00000000);
+}
+
+void gen_spr_970_pmu_user(CPUPPCState *env)
+{
+    spr_register(env, SPR_970_UPMC7, "UPMC7",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_ureg,
+                 0x00000000);
+    spr_register(env, SPR_970_UPMC8, "UPMC8",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_ureg,
+                 0x00000000);
+}
+
+void gen_spr_power8_pmu_sup(CPUPPCState *env)
+{
+    spr_register_kvm(env, SPR_POWER_MMCR2, "MMCR2",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_MMCR2, 0x00000000);
+    spr_register_kvm(env, SPR_POWER_MMCRS, "MMCRS",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_MMCRS, 0x00000000);
+    spr_register_kvm(env, SPR_POWER_SIER, "SIER",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_SIER, 0x00000000);
+    spr_register_kvm(env, SPR_POWER_SPMC1, "SPMC1",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_SPMC1, 0x00000000);
+    spr_register_kvm(env, SPR_POWER_SPMC2, "SPMC2",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_SPMC2, 0x00000000);
+    spr_register_kvm(env, SPR_TACR, "TACR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_TACR, 0x00000000);
+    spr_register_kvm(env, SPR_TCSCR, "TCSCR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_TCSCR, 0x00000000);
+    spr_register_kvm(env, SPR_CSIGR, "CSIGR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_CSIGR, 0x00000000);
+}
+
+void gen_spr_power8_pmu_user(CPUPPCState *env)
+{
+    spr_register(env, SPR_POWER_UMMCR2, "UMMCR2",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_ureg,
+                 0x00000000);
+    spr_register(env, SPR_POWER_USIER, "USIER",
+                 &spr_read_generic, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+void gen_spr_power5p_ear(CPUPPCState *env)
+{
+    /* External access control */
+    spr_register(env, SPR_EAR, "EAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+void gen_spr_power5p_tb(CPUPPCState *env)
+{
+    /* TBU40 (High 40 bits of the Timebase register */
+    spr_register_hv(env, SPR_TBU40, "TBU40",
+                    SPR_NOACCESS, SPR_NOACCESS,
+                    SPR_NOACCESS, SPR_NOACCESS,
+                    SPR_NOACCESS, &spr_write_tbu40,
+                    0x00000000);
+}
+
+void gen_spr_970_lpar(CPUPPCState *env)
+{
+#if !defined(CONFIG_USER_ONLY)
+    /*
+     * PPC970: HID4 covers things later controlled by the LPCR and
+     * RMOR in later CPUs, but with a different encoding.  We only
+     * support the 970 in "Apple mode" which has all hypervisor
+     * facilities disabled by strapping, so we can basically just
+     * ignore it
+     */
+    spr_register(env, SPR_970_HID4, "HID4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+#endif
+}
+
+void gen_spr_power5p_lpar(CPUPPCState *env)
+{
+#if !defined(CONFIG_USER_ONLY)
+    /* Logical partitionning */
+    spr_register_kvm_hv(env, SPR_LPCR, "LPCR",
+                        SPR_NOACCESS, SPR_NOACCESS,
+                        SPR_NOACCESS, SPR_NOACCESS,
+                        &spr_read_generic, &spr_write_lpcr,
+                        KVM_REG_PPC_LPCR, LPCR_LPES0 | LPCR_LPES1);
+    spr_register_hv(env, SPR_HDEC, "HDEC",
+                    SPR_NOACCESS, SPR_NOACCESS,
+                    SPR_NOACCESS, SPR_NOACCESS,
+                    &spr_read_hdecr, &spr_write_hdecr, 0);
+#endif
+}
+
+void gen_spr_book3s_ids(CPUPPCState *env)
+{
+    /* FIXME: Will need to deal with thread vs core only SPRs */
+
+    /* Processor identification */
+    spr_register_hv(env, SPR_PIR, "PIR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 &spr_read_generic, NULL,
+                 0x00000000);
+    spr_register_hv(env, SPR_HID0, "HID0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register_hv(env, SPR_TSCR, "TSCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register_hv(env, SPR_HMER, "HMER",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_hmer,
+                 0x00000000);
+    spr_register_hv(env, SPR_HMEER, "HMEER",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register_hv(env, SPR_TFMR, "TFMR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register_hv(env, SPR_LPIDR, "LPIDR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_lpidr,
+                 0x00000000);
+    spr_register_hv(env, SPR_HFSCR, "HFSCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register_hv(env, SPR_MMCRC, "MMCRC",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register_hv(env, SPR_MMCRH, "MMCRH",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register_hv(env, SPR_HSPRG0, "HSPRG0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register_hv(env, SPR_HSPRG1, "HSPRG1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register_hv(env, SPR_HSRR0, "HSRR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register_hv(env, SPR_HSRR1, "HSRR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register_hv(env, SPR_HDAR, "HDAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register_hv(env, SPR_HDSISR, "HDSISR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register_hv(env, SPR_HRMOR, "HRMOR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+void gen_spr_rmor(CPUPPCState *env)
+{
+    spr_register_hv(env, SPR_RMOR, "RMOR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+void gen_spr_power8_ids(CPUPPCState *env)
+{
+    /* Thread identification */
+    spr_register(env, SPR_TIR, "TIR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+}
+
+void gen_spr_book3s_purr(CPUPPCState *env)
+{
+#if !defined(CONFIG_USER_ONLY)
+    /* PURR & SPURR: Hack - treat these as aliases for the TB for now */
+    spr_register_kvm_hv(env, SPR_PURR,   "PURR",
+                        &spr_read_purr, SPR_NOACCESS,
+                        &spr_read_purr, SPR_NOACCESS,
+                        &spr_read_purr, &spr_write_purr,
+                        KVM_REG_PPC_PURR, 0x00000000);
+    spr_register_kvm_hv(env, SPR_SPURR,   "SPURR",
+                        &spr_read_purr, SPR_NOACCESS,
+                        &spr_read_purr, SPR_NOACCESS,
+                        &spr_read_purr, &spr_write_purr,
+                        KVM_REG_PPC_SPURR, 0x00000000);
+#endif
+}
+
+void gen_spr_power6_dbg(CPUPPCState *env)
+{
+#if !defined(CONFIG_USER_ONLY)
+    spr_register(env, SPR_CFAR, "SPR_CFAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_cfar, &spr_write_cfar,
+                 0x00000000);
+#endif
+}
+
+void gen_spr_power5p_common(CPUPPCState *env)
+{
+    spr_register_kvm(env, SPR_PPR, "PPR",
+                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_PPR, 0x00000000);
+}
+
+void gen_spr_power6_common(CPUPPCState *env)
+{
+#if !defined(CONFIG_USER_ONLY)
+    spr_register_kvm(env, SPR_DSCR, "SPR_DSCR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_DSCR, 0x00000000);
+#endif
+    /*
+     * Register PCR to report POWERPC_EXCP_PRIV_REG instead of
+     * POWERPC_EXCP_INVAL_SPR in userspace. Permit hypervisor access.
+     */
+    spr_register_hv(env, SPR_PCR, "PCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_pcr,
+                 0x00000000);
+}
+
+void gen_spr_power8_tce_address_control(CPUPPCState *env)
+{
+    spr_register_kvm(env, SPR_TAR, "TAR",
+                     &spr_read_tar, &spr_write_tar,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_TAR, 0x00000000);
+}
+
+void gen_spr_power8_tm(CPUPPCState *env)
+{
+    spr_register_kvm(env, SPR_TFHAR, "TFHAR",
+                     &spr_read_tm, &spr_write_tm,
+                     &spr_read_tm, &spr_write_tm,
+                     KVM_REG_PPC_TFHAR, 0x00000000);
+    spr_register_kvm(env, SPR_TFIAR, "TFIAR",
+                     &spr_read_tm, &spr_write_tm,
+                     &spr_read_tm, &spr_write_tm,
+                     KVM_REG_PPC_TFIAR, 0x00000000);
+    spr_register_kvm(env, SPR_TEXASR, "TEXASR",
+                     &spr_read_tm, &spr_write_tm,
+                     &spr_read_tm, &spr_write_tm,
+                     KVM_REG_PPC_TEXASR, 0x00000000);
+    spr_register(env, SPR_TEXASRU, "TEXASRU",
+                 &spr_read_tm_upper32, &spr_write_tm_upper32,
+                 &spr_read_tm_upper32, &spr_write_tm_upper32,
+                 0x00000000);
+}
+
+void gen_spr_power8_ebb(CPUPPCState *env)
+{
+    spr_register(env, SPR_BESCRS, "BESCRS",
+                 &spr_read_ebb, &spr_write_ebb,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_BESCRSU, "BESCRSU",
+                 &spr_read_ebb_upper32, &spr_write_ebb_upper32,
+                 &spr_read_prev_upper32, &spr_write_prev_upper32,
+                 0x00000000);
+    spr_register(env, SPR_BESCRR, "BESCRR",
+                 &spr_read_ebb, &spr_write_ebb,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_BESCRRU, "BESCRRU",
+                 &spr_read_ebb_upper32, &spr_write_ebb_upper32,
+                 &spr_read_prev_upper32, &spr_write_prev_upper32,
+                 0x00000000);
+    spr_register_kvm(env, SPR_EBBHR, "EBBHR",
+                     &spr_read_ebb, &spr_write_ebb,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_EBBHR, 0x00000000);
+    spr_register_kvm(env, SPR_EBBRR, "EBBRR",
+                     &spr_read_ebb, &spr_write_ebb,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_EBBRR, 0x00000000);
+    spr_register_kvm(env, SPR_BESCR, "BESCR",
+                     &spr_read_ebb, &spr_write_ebb,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_BESCR, 0x00000000);
+}
+
+/* Virtual Time Base */
+void gen_spr_vtb(CPUPPCState *env)
+{
+    spr_register_kvm_hv(env, SPR_VTB, "VTB",
+                        SPR_NOACCESS, SPR_NOACCESS,
+                        &spr_read_vtb, SPR_NOACCESS,
+                        &spr_read_vtb, &spr_write_vtb,
+                        KVM_REG_PPC_VTB, 0x00000000);
+}
+
+void gen_spr_power8_fscr(CPUPPCState *env)
+{
+#if defined(CONFIG_USER_ONLY)
+    target_ulong initval = 1ULL << FSCR_TAR;
+#else
+    target_ulong initval = 0;
+#endif
+    spr_register_kvm(env, SPR_FSCR, "FSCR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_FSCR, initval);
+}
+
+void gen_spr_power8_pspb(CPUPPCState *env)
+{
+    spr_register_kvm(env, SPR_PSPB, "PSPB",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic32,
+                     KVM_REG_PPC_PSPB, 0);
+}
+
+void gen_spr_power8_dpdes(CPUPPCState *env)
+{
+#if !defined(CONFIG_USER_ONLY)
+    /* Directed Privileged Door-bell Exception State, used for IPI */
+    spr_register_kvm_hv(env, SPR_DPDES, "DPDES",
+                        SPR_NOACCESS, SPR_NOACCESS,
+                        &spr_read_dpdes, SPR_NOACCESS,
+                        &spr_read_dpdes, &spr_write_dpdes,
+                        KVM_REG_PPC_DPDES, 0x00000000);
+#endif
+}
+
+void gen_spr_power8_ic(CPUPPCState *env)
+{
+#if !defined(CONFIG_USER_ONLY)
+    spr_register_hv(env, SPR_IC, "IC",
+                    SPR_NOACCESS, SPR_NOACCESS,
+                    &spr_read_generic, SPR_NOACCESS,
+                    &spr_read_generic, &spr_write_generic,
+                    0);
+#endif
+}
+
+void gen_spr_power8_book4(CPUPPCState *env)
+{
+    /* Add a number of P8 book4 registers */
+#if !defined(CONFIG_USER_ONLY)
+    spr_register_kvm(env, SPR_ACOP, "ACOP",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_ACOP, 0);
+    spr_register_kvm(env, SPR_BOOKS_PID, "PID",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_pidr,
+                     KVM_REG_PPC_PID, 0);
+    spr_register_kvm(env, SPR_WORT, "WORT",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_WORT, 0);
+#endif
+}
+
+void gen_spr_power7_book4(CPUPPCState *env)
+{
+    /* Add a number of P7 book4 registers */
+#if !defined(CONFIG_USER_ONLY)
+    spr_register_kvm(env, SPR_ACOP, "ACOP",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_ACOP, 0);
+    spr_register_kvm(env, SPR_BOOKS_PID, "PID",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_PID, 0);
+#endif
+}
+
+void gen_spr_power8_rpr(CPUPPCState *env)
+{
+#if !defined(CONFIG_USER_ONLY)
+    spr_register_hv(env, SPR_RPR, "RPR",
+                    SPR_NOACCESS, SPR_NOACCESS,
+                    SPR_NOACCESS, SPR_NOACCESS,
+                    &spr_read_generic, &spr_write_generic,
+                    0x00000103070F1F3F);
+#endif
+}
+
+void gen_spr_power9_mmu(CPUPPCState *env)
+{
+#if !defined(CONFIG_USER_ONLY)
+    /* Partition Table Control */
+    spr_register_kvm_hv(env, SPR_PTCR, "PTCR",
+                        SPR_NOACCESS, SPR_NOACCESS,
+                        SPR_NOACCESS, SPR_NOACCESS,
+                        &spr_read_generic, &spr_write_ptcr,
+                        KVM_REG_PPC_PTCR, 0x00000000);
+    /* Address Segment Descriptor Register */
+    spr_register_hv(env, SPR_ASDR, "ASDR",
+                    SPR_NOACCESS, SPR_NOACCESS,
+                    SPR_NOACCESS, SPR_NOACCESS,
+                    &spr_read_generic, &spr_write_generic,
+                    0x0000000000000000);
+#endif
+}
+#endif
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 604423bd7b..33e44f1363 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -54,2058 +54,6 @@ static inline void vscr_init(CPUPPCState *env, uint32_t val)
     helper_mtvscr(env, val);
 }
 
-#ifdef CONFIG_USER_ONLY
-#define spr_register_kvm(env, num, name, uea_read, uea_write,                  \
-                         oea_read, oea_write, one_reg_id, initial_value)       \
-    _spr_register(env, num, name, uea_read, uea_write, initial_value)
-#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,               \
-                            oea_read, oea_write, hea_read, hea_write,          \
-                            one_reg_id, initial_value)                         \
-    _spr_register(env, num, name, uea_read, uea_write, initial_value)
-#else
-#if !defined(CONFIG_KVM)
-#define spr_register_kvm(env, num, name, uea_read, uea_write,                  \
-                         oea_read, oea_write, one_reg_id, initial_value)       \
-    _spr_register(env, num, name, uea_read, uea_write,                         \
-                  oea_read, oea_write, oea_read, oea_write, initial_value)
-#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,               \
-                            oea_read, oea_write, hea_read, hea_write,          \
-                            one_reg_id, initial_value)                         \
-    _spr_register(env, num, name, uea_read, uea_write,                         \
-                  oea_read, oea_write, hea_read, hea_write, initial_value)
-#else
-#define spr_register_kvm(env, num, name, uea_read, uea_write,                  \
-                         oea_read, oea_write, one_reg_id, initial_value)       \
-    _spr_register(env, num, name, uea_read, uea_write,                         \
-                  oea_read, oea_write, oea_read, oea_write,                    \
-                  one_reg_id, initial_value)
-#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,               \
-                            oea_read, oea_write, hea_read, hea_write,          \
-                            one_reg_id, initial_value)                         \
-    _spr_register(env, num, name, uea_read, uea_write,                         \
-                  oea_read, oea_write, hea_read, hea_write,                    \
-                  one_reg_id, initial_value)
-#endif
-#endif
-
-#define spr_register(env, num, name, uea_read, uea_write,                      \
-                     oea_read, oea_write, initial_value)                       \
-    spr_register_kvm(env, num, name, uea_read, uea_write,                      \
-                     oea_read, oea_write, 0, initial_value)
-
-#define spr_register_hv(env, num, name, uea_read, uea_write,                   \
-                        oea_read, oea_write, hea_read, hea_write,              \
-                        initial_value)                                         \
-    spr_register_kvm_hv(env, num, name, uea_read, uea_write,                   \
-                        oea_read, oea_write, hea_read, hea_write,              \
-                        0, initial_value)
-
-static inline void _spr_register(CPUPPCState *env, int num,
-                                 const char *name,
-                                 void (*uea_read)(DisasContext *ctx,
-                                                  int gprn, int sprn),
-                                 void (*uea_write)(DisasContext *ctx,
-                                                   int sprn, int gprn),
-#if !defined(CONFIG_USER_ONLY)
-
-                                 void (*oea_read)(DisasContext *ctx,
-                                                  int gprn, int sprn),
-                                 void (*oea_write)(DisasContext *ctx,
-                                                   int sprn, int gprn),
-                                 void (*hea_read)(DisasContext *opaque,
-                                                  int gprn, int sprn),
-                                 void (*hea_write)(DisasContext *opaque,
-                                                   int sprn, int gprn),
-#endif
-#if defined(CONFIG_KVM)
-                                 uint64_t one_reg_id,
-#endif
-                                 target_ulong initial_value)
-{
-    ppc_spr_t *spr;
-
-    spr = &env->spr_cb[num];
-    if (spr->name != NULL || env->spr[num] != 0x00000000 ||
-#if !defined(CONFIG_USER_ONLY)
-        spr->oea_read != NULL || spr->oea_write != NULL ||
-#endif
-        spr->uea_read != NULL || spr->uea_write != NULL) {
-        printf("Error: Trying to register SPR %d (%03x) twice !\n", num, num);
-        exit(1);
-    }
-#if defined(PPC_DEBUG_SPR)
-    printf("*** register spr %d (%03x) %s val " TARGET_FMT_lx "\n", num, num,
-           name, initial_value);
-#endif
-    spr->name = name;
-    spr->uea_read = uea_read;
-    spr->uea_write = uea_write;
-#if !defined(CONFIG_USER_ONLY)
-    spr->oea_read = oea_read;
-    spr->oea_write = oea_write;
-    spr->hea_read = hea_read;
-    spr->hea_write = hea_write;
-#endif
-#if defined(CONFIG_KVM)
-    spr->one_reg_id = one_reg_id,
-#endif
-    env->spr[num] = spr->default_value = initial_value;
-}
-
-/* Generic PowerPC SPRs */
-static void gen_spr_generic(CPUPPCState *env)
-{
-    /* Integer processing */
-    spr_register(env, SPR_XER, "XER",
-                 &spr_read_xer, &spr_write_xer,
-                 &spr_read_xer, &spr_write_xer,
-                 0x00000000);
-    /* Branch control */
-    spr_register(env, SPR_LR, "LR",
-                 &spr_read_lr, &spr_write_lr,
-                 &spr_read_lr, &spr_write_lr,
-                 0x00000000);
-    spr_register(env, SPR_CTR, "CTR",
-                 &spr_read_ctr, &spr_write_ctr,
-                 &spr_read_ctr, &spr_write_ctr,
-                 0x00000000);
-    /* Interrupt processing */
-    spr_register(env, SPR_SRR0, "SRR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_SRR1, "SRR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Processor control */
-    spr_register(env, SPR_SPRG0, "SPRG0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_SPRG1, "SPRG1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_SPRG2, "SPRG2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_SPRG3, "SPRG3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-/* SPR common to all non-embedded PowerPC, including 601 */
-static void gen_spr_ne_601(CPUPPCState *env)
-{
-    /* Exception processing */
-    spr_register_kvm(env, SPR_DSISR, "DSISR",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_DSISR, 0x00000000);
-    spr_register_kvm(env, SPR_DAR, "DAR",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_DAR, 0x00000000);
-    /* Timer */
-    spr_register(env, SPR_DECR, "DECR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_decr, &spr_write_decr,
-                 0x00000000);
-}
-
-/* Storage Description Register 1 */
-static void gen_spr_sdr1(CPUPPCState *env)
-{
-#ifndef CONFIG_USER_ONLY
-    if (env->has_hv_mode) {
-        /*
-         * SDR1 is a hypervisor resource on CPUs which have a
-         * hypervisor mode
-         */
-        spr_register_hv(env, SPR_SDR1, "SDR1",
-                        SPR_NOACCESS, SPR_NOACCESS,
-                        SPR_NOACCESS, SPR_NOACCESS,
-                        &spr_read_generic, &spr_write_sdr1,
-                        0x00000000);
-    } else {
-        spr_register(env, SPR_SDR1, "SDR1",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_sdr1,
-                     0x00000000);
-    }
-#endif
-}
-
-/* BATs 0-3 */
-static void gen_low_BATs(CPUPPCState *env)
-{
-#if !defined(CONFIG_USER_ONLY)
-    spr_register(env, SPR_IBAT0U, "IBAT0U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat, &spr_write_ibatu,
-                 0x00000000);
-    spr_register(env, SPR_IBAT0L, "IBAT0L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat, &spr_write_ibatl,
-                 0x00000000);
-    spr_register(env, SPR_IBAT1U, "IBAT1U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat, &spr_write_ibatu,
-                 0x00000000);
-    spr_register(env, SPR_IBAT1L, "IBAT1L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat, &spr_write_ibatl,
-                 0x00000000);
-    spr_register(env, SPR_IBAT2U, "IBAT2U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat, &spr_write_ibatu,
-                 0x00000000);
-    spr_register(env, SPR_IBAT2L, "IBAT2L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat, &spr_write_ibatl,
-                 0x00000000);
-    spr_register(env, SPR_IBAT3U, "IBAT3U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat, &spr_write_ibatu,
-                 0x00000000);
-    spr_register(env, SPR_IBAT3L, "IBAT3L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat, &spr_write_ibatl,
-                 0x00000000);
-    spr_register(env, SPR_DBAT0U, "DBAT0U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat, &spr_write_dbatu,
-                 0x00000000);
-    spr_register(env, SPR_DBAT0L, "DBAT0L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat, &spr_write_dbatl,
-                 0x00000000);
-    spr_register(env, SPR_DBAT1U, "DBAT1U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat, &spr_write_dbatu,
-                 0x00000000);
-    spr_register(env, SPR_DBAT1L, "DBAT1L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat, &spr_write_dbatl,
-                 0x00000000);
-    spr_register(env, SPR_DBAT2U, "DBAT2U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat, &spr_write_dbatu,
-                 0x00000000);
-    spr_register(env, SPR_DBAT2L, "DBAT2L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat, &spr_write_dbatl,
-                 0x00000000);
-    spr_register(env, SPR_DBAT3U, "DBAT3U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat, &spr_write_dbatu,
-                 0x00000000);
-    spr_register(env, SPR_DBAT3L, "DBAT3L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat, &spr_write_dbatl,
-                 0x00000000);
-    env->nb_BATs += 4;
-#endif
-}
-
-/* BATs 4-7 */
-static void gen_high_BATs(CPUPPCState *env)
-{
-#if !defined(CONFIG_USER_ONLY)
-    spr_register(env, SPR_IBAT4U, "IBAT4U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat_h, &spr_write_ibatu_h,
-                 0x00000000);
-    spr_register(env, SPR_IBAT4L, "IBAT4L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat_h, &spr_write_ibatl_h,
-                 0x00000000);
-    spr_register(env, SPR_IBAT5U, "IBAT5U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat_h, &spr_write_ibatu_h,
-                 0x00000000);
-    spr_register(env, SPR_IBAT5L, "IBAT5L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat_h, &spr_write_ibatl_h,
-                 0x00000000);
-    spr_register(env, SPR_IBAT6U, "IBAT6U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat_h, &spr_write_ibatu_h,
-                 0x00000000);
-    spr_register(env, SPR_IBAT6L, "IBAT6L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat_h, &spr_write_ibatl_h,
-                 0x00000000);
-    spr_register(env, SPR_IBAT7U, "IBAT7U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat_h, &spr_write_ibatu_h,
-                 0x00000000);
-    spr_register(env, SPR_IBAT7L, "IBAT7L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat_h, &spr_write_ibatl_h,
-                 0x00000000);
-    spr_register(env, SPR_DBAT4U, "DBAT4U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat_h, &spr_write_dbatu_h,
-                 0x00000000);
-    spr_register(env, SPR_DBAT4L, "DBAT4L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat_h, &spr_write_dbatl_h,
-                 0x00000000);
-    spr_register(env, SPR_DBAT5U, "DBAT5U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat_h, &spr_write_dbatu_h,
-                 0x00000000);
-    spr_register(env, SPR_DBAT5L, "DBAT5L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat_h, &spr_write_dbatl_h,
-                 0x00000000);
-    spr_register(env, SPR_DBAT6U, "DBAT6U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat_h, &spr_write_dbatu_h,
-                 0x00000000);
-    spr_register(env, SPR_DBAT6L, "DBAT6L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat_h, &spr_write_dbatl_h,
-                 0x00000000);
-    spr_register(env, SPR_DBAT7U, "DBAT7U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat_h, &spr_write_dbatu_h,
-                 0x00000000);
-    spr_register(env, SPR_DBAT7L, "DBAT7L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat_h, &spr_write_dbatl_h,
-                 0x00000000);
-    env->nb_BATs += 4;
-#endif
-}
-
-/* Generic PowerPC time base */
-static void gen_tbl(CPUPPCState *env)
-{
-    spr_register(env, SPR_VTBL,  "TBL",
-                 &spr_read_tbl, SPR_NOACCESS,
-                 &spr_read_tbl, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_TBL,   "TBL",
-                 &spr_read_tbl, SPR_NOACCESS,
-                 &spr_read_tbl, &spr_write_tbl,
-                 0x00000000);
-    spr_register(env, SPR_VTBU,  "TBU",
-                 &spr_read_tbu, SPR_NOACCESS,
-                 &spr_read_tbu, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_TBU,   "TBU",
-                 &spr_read_tbu, SPR_NOACCESS,
-                 &spr_read_tbu, &spr_write_tbu,
-                 0x00000000);
-}
-
-/* Softare table search registers */
-static void gen_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways)
-{
-#if !defined(CONFIG_USER_ONLY)
-    env->nb_tlb = nb_tlbs;
-    env->nb_ways = nb_ways;
-    env->id_tlbs = 1;
-    env->tlb_type = TLB_6XX;
-    spr_register(env, SPR_DMISS, "DMISS",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_DCMP, "DCMP",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_HASH1, "HASH1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_HASH2, "HASH2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_IMISS, "IMISS",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_ICMP, "ICMP",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_RPA, "RPA",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-#endif
-}
-
-/* SPR common to MPC755 and G2 */
-static void gen_spr_G2_755(CPUPPCState *env)
-{
-    /* SGPRs */
-    spr_register(env, SPR_SPRG4, "SPRG4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_SPRG5, "SPRG5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_SPRG6, "SPRG6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_SPRG7, "SPRG7",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-/* SPR common to all 7xx PowerPC implementations */
-static void gen_spr_7xx(CPUPPCState *env)
-{
-    /* Breakpoints */
-    /* XXX : not implemented */
-    spr_register_kvm(env, SPR_DABR, "DABR",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_DABR, 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_IABR, "IABR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Cache management */
-    /* XXX : not implemented */
-    spr_register(env, SPR_ICTC, "ICTC",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Performance monitors */
-    /* XXX : not implemented */
-    spr_register(env, SPR_7XX_MMCR0, "MMCR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_7XX_MMCR1, "MMCR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_7XX_PMC1, "PMC1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_7XX_PMC2, "PMC2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_7XX_PMC3, "PMC3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_7XX_PMC4, "PMC4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_7XX_SIAR, "SIAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_7XX_UMMCR0, "UMMCR0",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_7XX_UMMCR1, "UMMCR1",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_7XX_UPMC1, "UPMC1",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_7XX_UPMC2, "UPMC2",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_7XX_UPMC3, "UPMC3",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_7XX_UPMC4, "UPMC4",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_7XX_USIAR, "USIAR",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    /* External access control */
-    /* XXX : not implemented */
-    spr_register(env, SPR_EAR, "EAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-#ifdef TARGET_PPC64
-
-static void gen_spr_amr(CPUPPCState *env)
-{
-#ifndef CONFIG_USER_ONLY
-    /*
-     * Virtual Page Class Key protection
-     *
-     * The AMR is accessible either via SPR 13 or SPR 29.  13 is
-     * userspace accessible, 29 is privileged.  So we only need to set
-     * the kvm ONE_REG id on one of them, we use 29
-     */
-    spr_register(env, SPR_UAMR, "UAMR",
-                 &spr_read_generic, &spr_write_amr,
-                 &spr_read_generic, &spr_write_amr,
-                 0);
-    spr_register_kvm_hv(env, SPR_AMR, "AMR",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_amr,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_AMR, 0);
-    spr_register_kvm_hv(env, SPR_UAMOR, "UAMOR",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_uamor,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_UAMOR, 0);
-    spr_register_hv(env, SPR_AMOR, "AMOR",
-                    SPR_NOACCESS, SPR_NOACCESS,
-                    SPR_NOACCESS, SPR_NOACCESS,
-                    &spr_read_generic, &spr_write_generic,
-                    0);
-#endif /* !CONFIG_USER_ONLY */
-}
-
-static void gen_spr_iamr(CPUPPCState *env)
-{
-#ifndef CONFIG_USER_ONLY
-    spr_register_kvm_hv(env, SPR_IAMR, "IAMR",
-                        SPR_NOACCESS, SPR_NOACCESS,
-                        &spr_read_generic, &spr_write_iamr,
-                        &spr_read_generic, &spr_write_generic,
-                        KVM_REG_PPC_IAMR, 0);
-#endif /* !CONFIG_USER_ONLY */
-}
-#endif /* TARGET_PPC64 */
-
-static void gen_spr_thrm(CPUPPCState *env)
-{
-    /* Thermal management */
-    /* XXX : not implemented */
-    spr_register(env, SPR_THRM1, "THRM1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_thrm, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_THRM2, "THRM2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_thrm, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_THRM3, "THRM3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_thrm, &spr_write_generic,
-                 0x00000000);
-}
-
-/* SPR specific to PowerPC 604 implementation */
-static void gen_spr_604(CPUPPCState *env)
-{
-    /* Processor identification */
-    spr_register(env, SPR_PIR, "PIR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_pir,
-                 0x00000000);
-    /* Breakpoints */
-    /* XXX : not implemented */
-    spr_register(env, SPR_IABR, "IABR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register_kvm(env, SPR_DABR, "DABR",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_DABR, 0x00000000);
-    /* Performance counters */
-    /* XXX : not implemented */
-    spr_register(env, SPR_7XX_MMCR0, "MMCR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_7XX_PMC1, "PMC1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_7XX_PMC2, "PMC2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_7XX_SIAR, "SIAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_SDA, "SDA",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-    /* External access control */
-    /* XXX : not implemented */
-    spr_register(env, SPR_EAR, "EAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-/* SPR specific to PowerPC 603 implementation */
-static void gen_spr_603(CPUPPCState *env)
-{
-    /* External access control */
-    /* XXX : not implemented */
-    spr_register(env, SPR_EAR, "EAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Breakpoints */
-    /* XXX : not implemented */
-    spr_register(env, SPR_IABR, "IABR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-}
-
-/* SPR specific to PowerPC G2 implementation */
-static void gen_spr_G2(CPUPPCState *env)
-{
-    /* Memory base address */
-    /* MBAR */
-    /* XXX : not implemented */
-    spr_register(env, SPR_MBAR, "MBAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Exception processing */
-    spr_register(env, SPR_BOOKE_CSRR0, "CSRR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_CSRR1, "CSRR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Breakpoints */
-    /* XXX : not implemented */
-    spr_register(env, SPR_DABR, "DABR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_DABR2, "DABR2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_IABR, "IABR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_IABR2, "IABR2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_IBCR, "IBCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_DBCR, "DBCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-/* SPR specific to PowerPC 602 implementation */
-static void gen_spr_602(CPUPPCState *env)
-{
-    /* ESA registers */
-    /* XXX : not implemented */
-    spr_register(env, SPR_SER, "SER",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_SEBR, "SEBR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_ESASRR, "ESASRR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Floating point status */
-    /* XXX : not implemented */
-    spr_register(env, SPR_SP, "SP",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_LT, "LT",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Watchdog timer */
-    /* XXX : not implemented */
-    spr_register(env, SPR_TCR, "TCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Interrupt base */
-    spr_register(env, SPR_IBR, "IBR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_IABR, "IABR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-/* SPR specific to PowerPC 601 implementation */
-static void gen_spr_601(CPUPPCState *env)
-{
-    /* Multiplication/division register */
-    /* MQ */
-    spr_register(env, SPR_MQ, "MQ",
-                 &spr_read_generic, &spr_write_generic,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* RTC registers */
-    spr_register(env, SPR_601_RTCU, "RTCU",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, &spr_write_601_rtcu,
-                 0x00000000);
-    spr_register(env, SPR_601_VRTCU, "RTCU",
-                 &spr_read_601_rtcu, SPR_NOACCESS,
-                 &spr_read_601_rtcu, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_601_RTCL, "RTCL",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, &spr_write_601_rtcl,
-                 0x00000000);
-    spr_register(env, SPR_601_VRTCL, "RTCL",
-                 &spr_read_601_rtcl, SPR_NOACCESS,
-                 &spr_read_601_rtcl, SPR_NOACCESS,
-                 0x00000000);
-    /* Timer */
-#if 0 /* ? */
-    spr_register(env, SPR_601_UDECR, "UDECR",
-                 &spr_read_decr, SPR_NOACCESS,
-                 &spr_read_decr, SPR_NOACCESS,
-                 0x00000000);
-#endif
-    /* External access control */
-    /* XXX : not implemented */
-    spr_register(env, SPR_EAR, "EAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Memory management */
-#if !defined(CONFIG_USER_ONLY)
-    spr_register(env, SPR_IBAT0U, "IBAT0U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_601_ubat, &spr_write_601_ubatu,
-                 0x00000000);
-    spr_register(env, SPR_IBAT0L, "IBAT0L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_601_ubat, &spr_write_601_ubatl,
-                 0x00000000);
-    spr_register(env, SPR_IBAT1U, "IBAT1U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_601_ubat, &spr_write_601_ubatu,
-                 0x00000000);
-    spr_register(env, SPR_IBAT1L, "IBAT1L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_601_ubat, &spr_write_601_ubatl,
-                 0x00000000);
-    spr_register(env, SPR_IBAT2U, "IBAT2U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_601_ubat, &spr_write_601_ubatu,
-                 0x00000000);
-    spr_register(env, SPR_IBAT2L, "IBAT2L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_601_ubat, &spr_write_601_ubatl,
-                 0x00000000);
-    spr_register(env, SPR_IBAT3U, "IBAT3U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_601_ubat, &spr_write_601_ubatu,
-                 0x00000000);
-    spr_register(env, SPR_IBAT3L, "IBAT3L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_601_ubat, &spr_write_601_ubatl,
-                 0x00000000);
-    env->nb_BATs = 4;
-#endif
-}
-
-static void gen_spr_74xx(CPUPPCState *env)
-{
-    /* Processor identification */
-    spr_register(env, SPR_PIR, "PIR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_pir,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_74XX_MMCR2, "MMCR2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_74XX_UMMCR2, "UMMCR2",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    /* XXX: not implemented */
-    spr_register(env, SPR_BAMR, "BAMR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MSSCR0, "MSSCR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Hardware implementation registers */
-    /* XXX : not implemented */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Altivec */
-    spr_register(env, SPR_VRSAVE, "VRSAVE",
-                 &spr_read_generic, &spr_write_generic,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_L2CR, "L2CR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, spr_access_nop,
-                 0x00000000);
-    /* Not strictly an SPR */
-    vscr_init(env, 0x00010000);
-}
-
-static void gen_l3_ctrl(CPUPPCState *env)
-{
-    /* L3CR */
-    /* XXX : not implemented */
-    spr_register(env, SPR_L3CR, "L3CR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* L3ITCR0 */
-    /* XXX : not implemented */
-    spr_register(env, SPR_L3ITCR0, "L3ITCR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* L3PM */
-    /* XXX : not implemented */
-    spr_register(env, SPR_L3PM, "L3PM",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-static void gen_74xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways)
-{
-#if !defined(CONFIG_USER_ONLY)
-    env->nb_tlb = nb_tlbs;
-    env->nb_ways = nb_ways;
-    env->id_tlbs = 1;
-    env->tlb_type = TLB_6XX;
-    /* XXX : not implemented */
-    spr_register(env, SPR_PTEHI, "PTEHI",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_PTELO, "PTELO",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_TLBMISS, "TLBMISS",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-#endif
-}
-
-static void gen_spr_usprg3(CPUPPCState *env)
-{
-    spr_register(env, SPR_USPRG3, "USPRG3",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-}
-
-static void gen_spr_usprgh(CPUPPCState *env)
-{
-    spr_register(env, SPR_USPRG4, "USPRG4",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_USPRG5, "USPRG5",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_USPRG6, "USPRG6",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_USPRG7, "USPRG7",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-}
-
-/* PowerPC BookE SPR */
-static void gen_spr_BookE(CPUPPCState *env, uint64_t ivor_mask)
-{
-    const char *ivor_names[64] = {
-        "IVOR0",  "IVOR1",  "IVOR2",  "IVOR3",
-        "IVOR4",  "IVOR5",  "IVOR6",  "IVOR7",
-        "IVOR8",  "IVOR9",  "IVOR10", "IVOR11",
-        "IVOR12", "IVOR13", "IVOR14", "IVOR15",
-        "IVOR16", "IVOR17", "IVOR18", "IVOR19",
-        "IVOR20", "IVOR21", "IVOR22", "IVOR23",
-        "IVOR24", "IVOR25", "IVOR26", "IVOR27",
-        "IVOR28", "IVOR29", "IVOR30", "IVOR31",
-        "IVOR32", "IVOR33", "IVOR34", "IVOR35",
-        "IVOR36", "IVOR37", "IVOR38", "IVOR39",
-        "IVOR40", "IVOR41", "IVOR42", "IVOR43",
-        "IVOR44", "IVOR45", "IVOR46", "IVOR47",
-        "IVOR48", "IVOR49", "IVOR50", "IVOR51",
-        "IVOR52", "IVOR53", "IVOR54", "IVOR55",
-        "IVOR56", "IVOR57", "IVOR58", "IVOR59",
-        "IVOR60", "IVOR61", "IVOR62", "IVOR63",
-    };
-#define SPR_BOOKE_IVORxx (-1)
-    int ivor_sprn[64] = {
-        SPR_BOOKE_IVOR0,  SPR_BOOKE_IVOR1,  SPR_BOOKE_IVOR2,  SPR_BOOKE_IVOR3,
-        SPR_BOOKE_IVOR4,  SPR_BOOKE_IVOR5,  SPR_BOOKE_IVOR6,  SPR_BOOKE_IVOR7,
-        SPR_BOOKE_IVOR8,  SPR_BOOKE_IVOR9,  SPR_BOOKE_IVOR10, SPR_BOOKE_IVOR11,
-        SPR_BOOKE_IVOR12, SPR_BOOKE_IVOR13, SPR_BOOKE_IVOR14, SPR_BOOKE_IVOR15,
-        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
-        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
-        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
-        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
-        SPR_BOOKE_IVOR32, SPR_BOOKE_IVOR33, SPR_BOOKE_IVOR34, SPR_BOOKE_IVOR35,
-        SPR_BOOKE_IVOR36, SPR_BOOKE_IVOR37, SPR_BOOKE_IVOR38, SPR_BOOKE_IVOR39,
-        SPR_BOOKE_IVOR40, SPR_BOOKE_IVOR41, SPR_BOOKE_IVOR42, SPR_BOOKE_IVORxx,
-        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
-        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
-        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
-        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
-        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
-    };
-    int i;
-
-    /* Interrupt processing */
-    spr_register(env, SPR_BOOKE_CSRR0, "CSRR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_CSRR1, "CSRR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Debug */
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_IAC1, "IAC1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_IAC2, "IAC2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_DAC1, "DAC1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_DAC2, "DAC2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_DBCR0, "DBCR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_40x_dbcr0,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_DBCR1, "DBCR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_DBCR2, "DBCR2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_DSRR0, "DSRR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_DSRR1, "DSRR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_DBSR, "DBSR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_clear,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_DEAR, "DEAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_ESR, "ESR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_IVPR, "IVPR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_excp_prefix,
-                 0x00000000);
-    /* Exception vectors */
-    for (i = 0; i < 64; i++) {
-        if (ivor_mask & (1ULL << i)) {
-            if (ivor_sprn[i] == SPR_BOOKE_IVORxx) {
-                fprintf(stderr, "ERROR: IVOR %d SPR is not defined\n", i);
-                exit(1);
-            }
-            spr_register(env, ivor_sprn[i], ivor_names[i],
-                         SPR_NOACCESS, SPR_NOACCESS,
-                         &spr_read_generic, &spr_write_excp_vector,
-                         0x00000000);
-        }
-    }
-    spr_register(env, SPR_BOOKE_PID, "PID",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_booke_pid,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_TCR, "TCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_booke_tcr,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_TSR, "TSR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_booke_tsr,
-                 0x00000000);
-    /* Timer */
-    spr_register(env, SPR_DECR, "DECR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_decr, &spr_write_decr,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_DECAR, "DECAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, &spr_write_generic,
-                 0x00000000);
-    /* SPRGs */
-    spr_register(env, SPR_USPRG0, "USPRG0",
-                 &spr_read_generic, &spr_write_generic,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_SPRG4, "SPRG4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_SPRG5, "SPRG5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_SPRG6, "SPRG6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_SPRG7, "SPRG7",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_SPRG8, "SPRG8",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_SPRG9, "SPRG9",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-static inline uint32_t gen_tlbncfg(uint32_t assoc, uint32_t minsize,
-                                   uint32_t maxsize, uint32_t flags,
-                                   uint32_t nentries)
-{
-    return (assoc << TLBnCFG_ASSOC_SHIFT) |
-           (minsize << TLBnCFG_MINSIZE_SHIFT) |
-           (maxsize << TLBnCFG_MAXSIZE_SHIFT) |
-           flags | nentries;
-}
-
-/* BookE 2.06 storage control registers */
-static void gen_spr_BookE206(CPUPPCState *env, uint32_t mas_mask,
-                             uint32_t *tlbncfg, uint32_t mmucfg)
-{
-#if !defined(CONFIG_USER_ONLY)
-    const char *mas_names[8] = {
-        "MAS0", "MAS1", "MAS2", "MAS3", "MAS4", "MAS5", "MAS6", "MAS7",
-    };
-    int mas_sprn[8] = {
-        SPR_BOOKE_MAS0, SPR_BOOKE_MAS1, SPR_BOOKE_MAS2, SPR_BOOKE_MAS3,
-        SPR_BOOKE_MAS4, SPR_BOOKE_MAS5, SPR_BOOKE_MAS6, SPR_BOOKE_MAS7,
-    };
-    int i;
-
-    /* TLB assist registers */
-    /* XXX : not implemented */
-    for (i = 0; i < 8; i++) {
-        void (*uea_write)(DisasContext *ctx, int sprn, int gprn) =
-            &spr_write_generic32;
-        if (i == 2 && (mas_mask & (1 << i)) && (env->insns_flags & PPC_64B)) {
-            uea_write = &spr_write_generic;
-        }
-        if (mas_mask & (1 << i)) {
-            spr_register(env, mas_sprn[i], mas_names[i],
-                         SPR_NOACCESS, SPR_NOACCESS,
-                         &spr_read_generic, uea_write,
-                         0x00000000);
-        }
-    }
-    if (env->nb_pids > 1) {
-        /* XXX : not implemented */
-        spr_register(env, SPR_BOOKE_PID1, "PID1",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_booke_pid,
-                     0x00000000);
-    }
-    if (env->nb_pids > 2) {
-        /* XXX : not implemented */
-        spr_register(env, SPR_BOOKE_PID2, "PID2",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_booke_pid,
-                     0x00000000);
-    }
-
-    spr_register(env, SPR_BOOKE_EPLC, "EPLC",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_eplc,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_EPSC, "EPSC",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_epsc,
-                 0x00000000);
-
-    /* XXX : not implemented */
-    spr_register(env, SPR_MMUCFG, "MMUCFG",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 mmucfg);
-    switch (env->nb_ways) {
-    case 4:
-        spr_register(env, SPR_BOOKE_TLB3CFG, "TLB3CFG",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, SPR_NOACCESS,
-                     tlbncfg[3]);
-        /* Fallthru */
-    case 3:
-        spr_register(env, SPR_BOOKE_TLB2CFG, "TLB2CFG",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, SPR_NOACCESS,
-                     tlbncfg[2]);
-        /* Fallthru */
-    case 2:
-        spr_register(env, SPR_BOOKE_TLB1CFG, "TLB1CFG",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, SPR_NOACCESS,
-                     tlbncfg[1]);
-        /* Fallthru */
-    case 1:
-        spr_register(env, SPR_BOOKE_TLB0CFG, "TLB0CFG",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, SPR_NOACCESS,
-                     tlbncfg[0]);
-        /* Fallthru */
-    case 0:
-    default:
-        break;
-    }
-#endif
-
-    gen_spr_usprgh(env);
-}
-
-/* SPR specific to PowerPC 440 implementation */
-static void gen_spr_440(CPUPPCState *env)
-{
-    /* Cache control */
-    /* XXX : not implemented */
-    spr_register(env, SPR_440_DNV0, "DNV0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_440_DNV1, "DNV1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_440_DNV2, "DNV2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_440_DNV3, "DNV3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_440_DTV0, "DTV0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_440_DTV1, "DTV1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_440_DTV2, "DTV2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_440_DTV3, "DTV3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_440_DVLIM, "DVLIM",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_440_INV0, "INV0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_440_INV1, "INV1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_440_INV2, "INV2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_440_INV3, "INV3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_440_ITV0, "ITV0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_440_ITV1, "ITV1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_440_ITV2, "ITV2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_440_ITV3, "ITV3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_440_IVLIM, "IVLIM",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Cache debug */
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_DCDBTRH, "DCDBTRH",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_DCDBTRL, "DCDBTRL",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_ICDBDR, "ICDBDR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_ICDBTRH, "ICDBTRH",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_ICDBTRL, "ICDBTRL",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_440_DBDR, "DBDR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Processor control */
-    spr_register(env, SPR_4xx_CCR0, "CCR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_440_RSTCFG, "RSTCFG",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-    /* Storage control */
-    spr_register(env, SPR_440_MMUCR, "MMUCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-/* SPR shared between PowerPC 40x implementations */
-static void gen_spr_40x(CPUPPCState *env)
-{
-    /* Cache */
-    /* not emulated, as QEMU do not emulate caches */
-    spr_register(env, SPR_40x_DCCR, "DCCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* not emulated, as QEMU do not emulate caches */
-    spr_register(env, SPR_40x_ICCR, "ICCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* not emulated, as QEMU do not emulate caches */
-    spr_register(env, SPR_BOOKE_ICDBDR, "ICDBDR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-    /* Exception */
-    spr_register(env, SPR_40x_DEAR, "DEAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_40x_ESR, "ESR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_40x_EVPR, "EVPR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_excp_prefix,
-                 0x00000000);
-    spr_register(env, SPR_40x_SRR2, "SRR2",
-                 &spr_read_generic, &spr_write_generic,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_40x_SRR3, "SRR3",
-                 &spr_read_generic, &spr_write_generic,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Timers */
-    spr_register(env, SPR_40x_PIT, "PIT",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_40x_pit, &spr_write_40x_pit,
-                 0x00000000);
-    spr_register(env, SPR_40x_TCR, "TCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_booke_tcr,
-                 0x00000000);
-    spr_register(env, SPR_40x_TSR, "TSR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_booke_tsr,
-                 0x00000000);
-}
-
-/* SPR specific to PowerPC 405 implementation */
-static void gen_spr_405(CPUPPCState *env)
-{
-    /* MMU */
-    spr_register(env, SPR_40x_PID, "PID",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_4xx_CCR0, "CCR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00700000);
-    /* Debug interface */
-    /* XXX : not implemented */
-    spr_register(env, SPR_40x_DBCR0, "DBCR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_40x_dbcr0,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_405_DBCR1, "DBCR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_40x_DBSR, "DBSR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_clear,
-                 /* Last reset was system reset */
-                 0x00000300);
-    /* XXX : not implemented */
-    spr_register(env, SPR_40x_DAC1, "DAC1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_40x_DAC2, "DAC2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_405_DVC1, "DVC1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_405_DVC2, "DVC2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_40x_IAC1, "IAC1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_40x_IAC2, "IAC2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_405_IAC3, "IAC3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_405_IAC4, "IAC4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Storage control */
-    /* XXX: TODO: not implemented */
-    spr_register(env, SPR_405_SLER, "SLER",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_40x_sler,
-                 0x00000000);
-    spr_register(env, SPR_40x_ZPR, "ZPR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_405_SU0R, "SU0R",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* SPRG */
-    spr_register(env, SPR_USPRG0, "USPRG0",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_SPRG4, "SPRG4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_SPRG5, "SPRG5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_SPRG6, "SPRG6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_SPRG7, "SPRG7",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    gen_spr_usprgh(env);
-}
-
-/* SPR shared between PowerPC 401 & 403 implementations */
-static void gen_spr_401_403(CPUPPCState *env)
-{
-    /* Time base */
-    spr_register(env, SPR_403_VTBL,  "TBL",
-                 &spr_read_tbl, SPR_NOACCESS,
-                 &spr_read_tbl, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_403_TBL,   "TBL",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, &spr_write_tbl,
-                 0x00000000);
-    spr_register(env, SPR_403_VTBU,  "TBU",
-                 &spr_read_tbu, SPR_NOACCESS,
-                 &spr_read_tbu, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_403_TBU,   "TBU",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, &spr_write_tbu,
-                 0x00000000);
-    /* Debug */
-    /* not emulated, as QEMU do not emulate caches */
-    spr_register(env, SPR_403_CDBCR, "CDBCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-/* SPR specific to PowerPC 401 implementation */
-static void gen_spr_401(CPUPPCState *env)
-{
-    /* Debug interface */
-    /* XXX : not implemented */
-    spr_register(env, SPR_40x_DBCR0, "DBCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_40x_dbcr0,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_40x_DBSR, "DBSR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_clear,
-                 /* Last reset was system reset */
-                 0x00000300);
-    /* XXX : not implemented */
-    spr_register(env, SPR_40x_DAC1, "DAC",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_40x_IAC1, "IAC",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Storage control */
-    /* XXX: TODO: not implemented */
-    spr_register(env, SPR_405_SLER, "SLER",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_40x_sler,
-                 0x00000000);
-    /* not emulated, as QEMU never does speculative access */
-    spr_register(env, SPR_40x_SGR, "SGR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0xFFFFFFFF);
-    /* not emulated, as QEMU do not emulate caches */
-    spr_register(env, SPR_40x_DCWR, "DCWR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-static void gen_spr_401x2(CPUPPCState *env)
-{
-    gen_spr_401(env);
-    spr_register(env, SPR_40x_PID, "PID",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_40x_ZPR, "ZPR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-/* SPR specific to PowerPC 403 implementation */
-static void gen_spr_403(CPUPPCState *env)
-{
-    /* Debug interface */
-    /* XXX : not implemented */
-    spr_register(env, SPR_40x_DBCR0, "DBCR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_40x_dbcr0,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_40x_DBSR, "DBSR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_clear,
-                 /* Last reset was system reset */
-                 0x00000300);
-    /* XXX : not implemented */
-    spr_register(env, SPR_40x_DAC1, "DAC1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_40x_DAC2, "DAC2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_40x_IAC1, "IAC1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_40x_IAC2, "IAC2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-static void gen_spr_403_real(CPUPPCState *env)
-{
-    spr_register(env, SPR_403_PBL1,  "PBL1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_403_pbr, &spr_write_403_pbr,
-                 0x00000000);
-    spr_register(env, SPR_403_PBU1,  "PBU1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_403_pbr, &spr_write_403_pbr,
-                 0x00000000);
-    spr_register(env, SPR_403_PBL2,  "PBL2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_403_pbr, &spr_write_403_pbr,
-                 0x00000000);
-    spr_register(env, SPR_403_PBU2,  "PBU2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_403_pbr, &spr_write_403_pbr,
-                 0x00000000);
-}
-
-static void gen_spr_403_mmu(CPUPPCState *env)
-{
-    /* MMU */
-    spr_register(env, SPR_40x_PID, "PID",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_40x_ZPR, "ZPR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-/* SPR specific to PowerPC compression coprocessor extension */
-static void gen_spr_compress(CPUPPCState *env)
-{
-    /* XXX : not implemented */
-    spr_register(env, SPR_401_SKR, "SKR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-static void gen_spr_5xx_8xx(CPUPPCState *env)
-{
-    /* Exception processing */
-    spr_register_kvm(env, SPR_DSISR, "DSISR",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_DSISR, 0x00000000);
-    spr_register_kvm(env, SPR_DAR, "DAR",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_DAR, 0x00000000);
-    /* Timer */
-    spr_register(env, SPR_DECR, "DECR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_decr, &spr_write_decr,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_EIE, "EIE",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_EID, "EID",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_NRI, "NRI",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_CMPA, "CMPA",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_CMPB, "CMPB",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_CMPC, "CMPC",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_CMPD, "CMPD",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_ECR, "ECR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_DER, "DER",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_COUNTA, "COUNTA",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_COUNTB, "COUNTB",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_CMPE, "CMPE",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_CMPF, "CMPF",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_CMPG, "CMPG",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_CMPH, "CMPH",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_LCTRL1, "LCTRL1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_LCTRL2, "LCTRL2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_BAR, "BAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_DPDR, "DPDR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_IMMR, "IMMR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-static void gen_spr_5xx(CPUPPCState *env)
-{
-    /* XXX : not implemented */
-    spr_register(env, SPR_RCPU_MI_GRA, "MI_GRA",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_RCPU_L2U_GRA, "L2U_GRA",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_RPCU_BBCMCR, "L2U_BBCMCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_RCPU_L2U_MCR, "L2U_MCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_RCPU_MI_RBA0, "MI_RBA0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_RCPU_MI_RBA1, "MI_RBA1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_RCPU_MI_RBA2, "MI_RBA2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_RCPU_MI_RBA3, "MI_RBA3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_RCPU_L2U_RBA0, "L2U_RBA0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_RCPU_L2U_RBA1, "L2U_RBA1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_RCPU_L2U_RBA2, "L2U_RBA2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_RCPU_L2U_RBA3, "L2U_RBA3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_RCPU_MI_RA0, "MI_RA0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_RCPU_MI_RA1, "MI_RA1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_RCPU_MI_RA2, "MI_RA2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_RCPU_MI_RA3, "MI_RA3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_RCPU_L2U_RA0, "L2U_RA0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_RCPU_L2U_RA1, "L2U_RA1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_RCPU_L2U_RA2, "L2U_RA2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_RCPU_L2U_RA3, "L2U_RA3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_RCPU_FPECR, "FPECR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-static void gen_spr_8xx(CPUPPCState *env)
-{
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_IC_CST, "IC_CST",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_IC_ADR, "IC_ADR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_IC_DAT, "IC_DAT",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_DC_CST, "DC_CST",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_DC_ADR, "DC_ADR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_DC_DAT, "DC_DAT",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_MI_CTR, "MI_CTR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_MI_AP, "MI_AP",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_MI_EPN, "MI_EPN",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_MI_TWC, "MI_TWC",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_MI_RPN, "MI_RPN",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_MI_DBCAM, "MI_DBCAM",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_MI_DBRAM0, "MI_DBRAM0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_MI_DBRAM1, "MI_DBRAM1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_MD_CTR, "MD_CTR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_MD_CASID, "MD_CASID",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_MD_AP, "MD_AP",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_MD_EPN, "MD_EPN",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_MD_TWB, "MD_TWB",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_MD_TWC, "MD_TWC",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_MD_RPN, "MD_RPN",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_MD_TW, "MD_TW",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_MD_DBCAM, "MD_DBCAM",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_MD_DBRAM0, "MD_DBRAM0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MPC_MD_DBRAM1, "MD_DBRAM1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
 /*
  * AMR     => SPR 29 (Power 2.04)
  * CTRL    => SPR 136 (Power 2.04)
@@ -2979,17 +927,7 @@ static void init_proc_403GCX(CPUPPCState *env)
     gen_spr_403(env);
     gen_spr_403_real(env);
     gen_spr_403_mmu(env);
-    /* Bus access control */
-    /* not emulated, as QEMU never does speculative access */
-    spr_register(env, SPR_40x_SGR, "SGR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0xFFFFFFFF);
-    /* not emulated, as QEMU do not emulate caches */
-    spr_register(env, SPR_40x_DCWR, "DCWR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_40x_bus_control(env);
     /* Memory management */
 #if !defined(CONFIG_USER_ONLY)
     env->nb_tlb = 64;
@@ -3045,17 +983,7 @@ static void init_proc_405(CPUPPCState *env)
     gen_tbl(env);
     gen_spr_40x(env);
     gen_spr_405(env);
-    /* Bus access control */
-    /* not emulated, as QEMU never does speculative access */
-    spr_register(env, SPR_40x_SGR, "SGR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0xFFFFFFFF);
-    /* not emulated, as QEMU do not emulate caches */
-    spr_register(env, SPR_40x_DCWR, "DCWR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_40x_bus_control(env);
     /* Memory management */
 #if !defined(CONFIG_USER_ONLY)
     env->nb_tlb = 64;
@@ -3112,49 +1040,13 @@ static void init_proc_440EP(CPUPPCState *env)
     gen_spr_BookE(env, 0x000000000000FFFFULL);
     gen_spr_440(env);
     gen_spr_usprgh(env);
-    /* Processor identification */
-    spr_register(env, SPR_BOOKE_PIR, "PIR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_pir,
-                 0x00000000);
+    gen_spr_440_misc(env);
     /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_IAC3, "IAC3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_BOOKE_MCSR, "MCSR");
+    gen_spr_not_implemented(env, SPR_BOOKE_MCSRR0, "MCSRR0");
+    gen_spr_not_implemented(env, SPR_BOOKE_MCSRR1, "MCSRR1");
     /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_IAC4, "IAC4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_DVC1, "DVC1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_DVC2, "DVC2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_MCSR, "MCSR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_MCSRR0, "MCSRR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_MCSRR1, "MCSRR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_440_CCR1, "CCR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_440_CCR1, "CCR1");
     /* Memory management */
 #if !defined(CONFIG_USER_ONLY)
     env->nb_tlb = 64;
@@ -3254,31 +1146,7 @@ static void init_proc_440GP(CPUPPCState *env)
     gen_spr_BookE(env, 0x000000000000FFFFULL);
     gen_spr_440(env);
     gen_spr_usprgh(env);
-    /* Processor identification */
-    spr_register(env, SPR_BOOKE_PIR, "PIR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_pir,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_IAC3, "IAC3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_IAC4, "IAC4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_DVC1, "DVC1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_DVC2, "DVC2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_440_misc(env);
     /* Memory management */
 #if !defined(CONFIG_USER_ONLY)
     env->nb_tlb = 64;
@@ -3337,31 +1205,7 @@ static void init_proc_440x4(CPUPPCState *env)
     gen_spr_BookE(env, 0x000000000000FFFFULL);
     gen_spr_440(env);
     gen_spr_usprgh(env);
-    /* Processor identification */
-    spr_register(env, SPR_BOOKE_PIR, "PIR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_pir,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_IAC3, "IAC3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_IAC4, "IAC4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_DVC1, "DVC1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_DVC2, "DVC2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_440_misc(env);
     /* Memory management */
 #if !defined(CONFIG_USER_ONLY)
     env->nb_tlb = 64;
@@ -3420,49 +1264,13 @@ static void init_proc_440x5(CPUPPCState *env)
     gen_spr_BookE(env, 0x000000000000FFFFULL);
     gen_spr_440(env);
     gen_spr_usprgh(env);
-    /* Processor identification */
-    spr_register(env, SPR_BOOKE_PIR, "PIR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_pir,
-                 0x00000000);
+    gen_spr_440_misc(env);
     /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_IAC3, "IAC3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_BOOKE_MCSR, "MCSR");
+    gen_spr_not_implemented(env, SPR_BOOKE_MCSRR0, "MCSRR0");
+    gen_spr_not_implemented(env, SPR_BOOKE_MCSRR1, "MCSRR1");
     /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_IAC4, "IAC4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_DVC1, "DVC1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_DVC2, "DVC2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_MCSR, "MCSR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_MCSRR0, "MCSRR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_MCSRR1, "MCSRR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_440_CCR1, "CCR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_440_CCR1, "CCR1");
     /* Memory management */
 #if !defined(CONFIG_USER_ONLY)
     env->nb_tlb = 64;
@@ -3651,26 +1459,14 @@ static void init_proc_G2(CPUPPCState *env)
     gen_tbl(env);
     /* External access control */
     /* XXX : not implemented */
-    spr_register(env, SPR_EAR, "EAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_EAR, "EAR");
     /* Hardware implementation register */
     /* XXX : not implemented */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID0, "HID0");
     /* XXX : not implemented */
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID1, "HID1");
     /* XXX : not implemented */
-    spr_register(env, SPR_HID2, "HID2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID2, "HID2");
     /* Memory management */
     gen_low_BATs(env);
     gen_high_BATs(env);
@@ -3730,26 +1526,14 @@ static void init_proc_G2LE(CPUPPCState *env)
     gen_tbl(env);
     /* External access control */
     /* XXX : not implemented */
-    spr_register(env, SPR_EAR, "EAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_EAR, "EAR");
     /* Hardware implementation register */
     /* XXX : not implemented */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID0, "HID0");
     /* XXX : not implemented */
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID1, "HID1");
     /* XXX : not implemented */
-    spr_register(env, SPR_HID2, "HID2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID2, "HID2");
 
     /* Memory management */
     gen_low_BATs(env);
@@ -3808,95 +1592,41 @@ static void init_proc_e200(CPUPPCState *env)
     gen_tbl(env);
     gen_spr_BookE(env, 0x000000070000FFFFULL);
     /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_SPEFSCR, "SPEFSCR",
-                 &spr_read_spefscr, &spr_write_spefscr,
-                 &spr_read_spefscr, &spr_write_spefscr,
-                 0x00000000);
+    gen_spr_spefscr(env);
     /* Memory management */
     gen_spr_BookE206(env, 0x0000005D, NULL, 0);
     /* XXX : not implemented */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID0, "HID0");
     /* XXX : not implemented */
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID1, "HID1");
     /* XXX : not implemented */
-    spr_register(env, SPR_Exxx_ALTCTXCR, "ALTCTXCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_Exxx_ALTCTXCR, "ALTCTXCR");
     /* XXX : not implemented */
-    spr_register(env, SPR_Exxx_BUCSR, "BUCSR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_Exxx_BUCSR, "BUCSR");
     /* XXX : not implemented */
-    spr_register(env, SPR_Exxx_CTXCR, "CTXCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_Exxx_CTXCR, "CTXCR");
     /* XXX : not implemented */
-    spr_register(env, SPR_Exxx_DBCNT, "DBCNT",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_Exxx_DBCNT, "DBCNT");
     /* XXX : not implemented */
-    spr_register(env, SPR_Exxx_DBCR3, "DBCR3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_Exxx_DBCR3, "DBCR3");
     /* XXX : not implemented */
-    spr_register(env, SPR_Exxx_L1CFG0, "L1CFG0",
-                 &spr_read_generic, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
+    gen_spr_l1fgc(env, SPR_Exxx_L1CFG0, 0x00000000);
     /* XXX : not implemented */
-    spr_register(env, SPR_Exxx_L1CSR0, "L1CSR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_Exxx_L1CSR0, "L1CSR0");
     /* XXX : not implemented */
-    spr_register(env, SPR_Exxx_L1FINV0, "L1FINV0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_Exxx_L1FINV0, "L1FINV0");
     /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_TLB0CFG, "TLB0CFG",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_BOOKE_TLB0CFG, "TLB0CFG");
     /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_TLB1CFG, "TLB1CFG",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_BOOKE_TLB1CFG, "TLB1CFG");
     /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_IAC3, "IAC3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_BOOKE_IAC3, "IAC3");
     /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_IAC4, "IAC4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_BOOKE_IAC4, "IAC4");
     /* XXX : not implemented */
-    spr_register(env, SPR_MMUCSR0, "MMUCSR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000); /* TOFIX */
-    spr_register(env, SPR_BOOKE_DSRR0, "DSRR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_DSRR1, "DSRR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_MMUCSR0, "MMUCSR0"); /* TOFIX */
+    gen_spr_not_implemented(env, SPR_BOOKE_DSRR0, "DSRR0");
+    gen_spr_not_implemented(env, SPR_BOOKE_DSRR1, "DSRR1");
 #if !defined(CONFIG_USER_ONLY)
     env->nb_tlb = 64;
     env->nb_ways = 1;
@@ -3966,46 +1696,22 @@ static void init_proc_e300(CPUPPCState *env)
     gen_tbl(env);
     /* hardware implementation registers */
     /* XXX : not implemented */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID0, "HID0");
     /* XXX : not implemented */
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID1, "HID1");
     /* XXX : not implemented */
-    spr_register(env, SPR_HID2, "HID2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID2, "HID2");
     /* Breakpoints */
     /* XXX : not implemented */
-    spr_register(env, SPR_DABR, "DABR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_DABR, "DABR");
     /* XXX : not implemented */
-    spr_register(env, SPR_DABR2, "DABR2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_DABR2, "DABR2");
     /* XXX : not implemented */
-    spr_register(env, SPR_IABR2, "IABR2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_IABR2, "IABR2");
     /* XXX : not implemented */
-    spr_register(env, SPR_IBCR, "IBCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_IBCR, "IBCR");
     /* XXX : not implemented */
-    spr_register(env, SPR_DBCR, "DBCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_DBCR, "DBCR");
     /* Memory management */
     gen_low_BATs(env);
     gen_high_BATs(env);
@@ -4103,15 +1809,9 @@ static void init_proc_e500(CPUPPCState *env, int version)
     gen_spr_BookE(env, ivor_mask);
     gen_spr_usprg3(env);
     /* Processor identification */
-    spr_register(env, SPR_BOOKE_PIR, "PIR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_pir,
-                 0x00000000);
+    gen_spr_pir(env);
     /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_SPEFSCR, "SPEFSCR",
-                 &spr_read_spefscr, &spr_write_spefscr,
-                 &spr_read_spefscr, &spr_write_spefscr,
-                 0x00000000);
+    gen_spr_spefscr(env);
 #if !defined(CONFIG_USER_ONLY)
     /* Memory management */
     env->nb_pids = 3;
@@ -4168,111 +1868,45 @@ static void init_proc_e500(CPUPPCState *env, int version)
     }
     gen_spr_BookE206(env, 0x000000DF, tlbncfg, mmucfg);
     /* XXX : not implemented */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_Exxx_BBEAR, "BBEAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_Exxx_BBTAR, "BBTAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_Exxx_MCAR, "MCAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_MCSR, "MCSR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_Exxx_NPIDR, "NPIDR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_Exxx_BUCSR, "BUCSR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_Exxx_L1CFG0, "L1CFG0",
-                 &spr_read_generic, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 l1cfg0);
-    spr_register(env, SPR_Exxx_L1CFG1, "L1CFG1",
-                 &spr_read_generic, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 l1cfg1);
-    spr_register(env, SPR_Exxx_L1CSR0, "L1CSR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_e500_l1csr0,
-                 0x00000000);
-    spr_register(env, SPR_Exxx_L1CSR1, "L1CSR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_e500_l1csr1,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID0, "HID0");
+    /* XXX : not implemented */
+    gen_spr_not_implemented(env, SPR_HID1, "HID1");
+    /* XXX : not implemented */
+    gen_spr_not_implemented(env, SPR_Exxx_BBEAR, "BBEAR");
+    /* XXX : not implemented */
+    gen_spr_not_implemented(env, SPR_Exxx_BBTAR, "BBTAR");
+    /* XXX : not implemented */
+    gen_spr_not_implemented(env, SPR_Exxx_MCAR, "MCAR");
+    /* XXX : not implemented */
+    gen_spr_not_implemented(env, SPR_BOOKE_MCSR, "MCSR");
+    /* XXX : not implemented */
+    gen_spr_not_implemented(env, SPR_Exxx_NPIDR, "NPIDR");
+    /* XXX : not implemented */
+    gen_spr_not_implemented(env, SPR_Exxx_BUCSR, "BUCSR");
+    /* XXX : not implemented */
+    gen_spr_l1fgc(env, SPR_Exxx_L1CFG0, l1cfg0);
+    gen_spr_l1fgc(env, SPR_Exxx_L1CFG1, l1cfg1);
+    gen_spr_l1csr0(env);
+    gen_spr_l1csr1(env);
     if (version != fsl_e500v1 && version != fsl_e500v2) {
-        spr_register(env, SPR_Exxx_L2CSR0, "L2CSR0",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_e500_l2csr0,
-                     0x00000000);
+        gen_spr_l2csr0(env);
     }
-    spr_register(env, SPR_BOOKE_MCSRR0, "MCSRR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_MCSRR1, "MCSRR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_MMUCSR0, "MMUCSR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_booke206_mmucsr0,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_EPR, "EPR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_BOOKE_MCSRR0, "MCSRR0");
+    gen_spr_not_implemented(env, SPR_BOOKE_MCSRR1, "MCSRR1");
+    gen_spr_mmucsr0(env);
+    gen_spr_not_implemented_no_write(env, SPR_BOOKE_EPR, "EPR");
     /* XXX better abstract into Emb.xxx features */
     if ((version == fsl_e5500) || (version == fsl_e6500)) {
-        spr_register(env, SPR_BOOKE_EPCR, "EPCR",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     0x00000000);
-        spr_register(env, SPR_BOOKE_MAS7_MAS3, "MAS7_MAS3",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_mas73, &spr_write_mas73,
-                     0x00000000);
+        gen_spr_not_implemented(env, SPR_BOOKE_EPCR, "EPCR");
+        gen_spr_mas73(env);
         ivpr_mask = (target_ulong)~0xFFFFULL;
     }
 
     if (version == fsl_e6500) {
         /* Thread identification */
-        spr_register(env, SPR_TIR, "TIR",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, SPR_NOACCESS,
-                     0x00000000);
-        spr_register(env, SPR_BOOKE_TLB0PS, "TLB0PS",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, SPR_NOACCESS,
-                     0x00000004);
-        spr_register(env, SPR_BOOKE_TLB1PS, "TLB1PS",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, SPR_NOACCESS,
-                     0x7FFFFFFC);
+        gen_spr_not_implemented_no_write(env, SPR_TIR, "TIR");
+        gen_spr_not_implemented_no_write(env, SPR_BOOKE_TLB0PS, "TLB0PS");
+        gen_spr_not_implemented_no_write(env, SPR_BOOKE_TLB1PS, "TLB1PS");
     }
 
 #if !defined(CONFIG_USER_ONLY)
@@ -4529,25 +2163,13 @@ static void init_proc_601(CPUPPCState *env)
     gen_spr_601(env);
     /* Hardware implementation registers */
     /* XXX : not implemented */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_hid0_601,
-                 0x80010080);
+    gen_spr_hid0(env);
     /* XXX : not implemented */
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+        gen_spr_not_implemented(env, SPR_HID1, "HID1");
     /* XXX : not implemented */
-    spr_register(env, SPR_601_HID2, "HID2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+        gen_spr_not_implemented(env, SPR_601_HID2, "HID2");
     /* XXX : not implemented */
-    spr_register(env, SPR_601_HID5, "HID5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+        gen_spr_not_implemented(env, SPR_601_HID5, "HID5");
     /* Memory management */
     init_excp_601(env);
     /*
@@ -4600,10 +2222,7 @@ static void init_proc_601v(CPUPPCState *env)
 {
     init_proc_601(env);
     /* XXX : not implemented */
-    spr_register(env, SPR_601_HID15, "HID15",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_601_HID15, "HID15");
 }
 
 POWERPC_FAMILY(601v)(ObjectClass *oc, void *data)
@@ -4647,15 +2266,9 @@ static void init_proc_602(CPUPPCState *env)
     gen_tbl(env);
     /* hardware implementation registers */
     /* XXX : not implemented */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID0, "HID0");
     /* XXX : not implemented */
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID1, "HID1");
     /* Memory management */
     gen_low_BATs(env);
     gen_6xx_7xx_soft_tlb(env, 64, 2);
@@ -4717,15 +2330,9 @@ static void init_proc_603(CPUPPCState *env)
     gen_tbl(env);
     /* hardware implementation registers */
     /* XXX : not implemented */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID0, "HID0");
     /* XXX : not implemented */
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID1, "HID1");
     /* Memory management */
     gen_low_BATs(env);
     gen_6xx_7xx_soft_tlb(env, 64, 2);
@@ -4784,15 +2391,9 @@ static void init_proc_603E(CPUPPCState *env)
     gen_tbl(env);
     /* hardware implementation registers */
     /* XXX : not implemented */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID0, "HID0");
     /* XXX : not implemented */
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID1, "HID1");
     /* Memory management */
     gen_low_BATs(env);
     gen_6xx_7xx_soft_tlb(env, 64, 2);
@@ -4851,10 +2452,7 @@ static void init_proc_604(CPUPPCState *env)
     gen_tbl(env);
     /* Hardware implementation registers */
     /* XXX : not implemented */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID0, "HID0");
     /* Memory management */
     gen_low_BATs(env);
     init_excp_604(env);
@@ -4912,33 +2510,18 @@ static void init_proc_604E(CPUPPCState *env)
     gen_spr_sdr1(env);
     gen_spr_604(env);
     /* XXX : not implemented */
-    spr_register(env, SPR_7XX_MMCR1, "MMCR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_7XX_MMCR1, "MMCR1");
     /* XXX : not implemented */
-    spr_register(env, SPR_7XX_PMC3, "PMC3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_7XX_PMC3, "PMC3");
     /* XXX : not implemented */
-    spr_register(env, SPR_7XX_PMC4, "PMC4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_7XX_PMC4, "PMC4");
     /* Time base */
     gen_tbl(env);
     /* Hardware implementation registers */
     /* XXX : not implemented */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID0, "HID0");
     /* XXX : not implemented */
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID1, "HID1");
     /* Memory management */
     gen_low_BATs(env);
     init_excp_604(env);
@@ -5001,15 +2584,9 @@ static void init_proc_740(CPUPPCState *env)
     gen_spr_thrm(env);
     /* Hardware implementation registers */
     /* XXX : not implemented */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID0, "HID0");
     /* XXX : not implemented */
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID1, "HID1");
     /* Memory management */
     gen_low_BATs(env);
     init_excp_7x0(env);
@@ -5067,25 +2644,16 @@ static void init_proc_750(CPUPPCState *env)
     gen_spr_sdr1(env);
     gen_spr_7xx(env);
     /* XXX : not implemented */
-    spr_register(env, SPR_L2CR, "L2CR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, spr_access_nop,
-                 0x00000000);
+    gen_spr_not_implemented_write_nop(env, SPR_L2CR, "L2CR");
     /* Time base */
     gen_tbl(env);
     /* Thermal management */
     gen_spr_thrm(env);
     /* Hardware implementation registers */
     /* XXX : not implemented */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID0, "HID0");
     /* XXX : not implemented */
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID1, "HID1");
     /* Memory management */
     gen_low_BATs(env);
     /*
@@ -5147,111 +2715,48 @@ static void init_proc_750cl(CPUPPCState *env)
     gen_spr_sdr1(env);
     gen_spr_7xx(env);
     /* XXX : not implemented */
-    spr_register(env, SPR_L2CR, "L2CR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, spr_access_nop,
-                 0x00000000);
+    gen_spr_not_implemented_write_nop(env, SPR_L2CR, "L2CR");
     /* Time base */
     gen_tbl(env);
     /* Thermal management */
     /* Those registers are fake on 750CL */
-    spr_register(env, SPR_THRM1, "THRM1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_THRM2, "THRM2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_THRM3, "THRM3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_THRM1, "THRM1");
+    gen_spr_not_implemented(env, SPR_THRM2, "THRM2");
+    gen_spr_not_implemented(env, SPR_THRM3, "THRM3");
     /* XXX: not implemented */
-    spr_register(env, SPR_750_TDCL, "TDCL",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_750_TDCH, "TDCH",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_750_TDCL, "TDCL");
+    gen_spr_not_implemented(env, SPR_750_TDCH, "TDCH");
     /* DMA */
     /* XXX : not implemented */
-    spr_register(env, SPR_750_WPAR, "WPAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_750_DMAL, "DMAL",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_750_DMAU, "DMAU",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_750_WPAR, "WPAR");
+    gen_spr_not_implemented(env, SPR_750_DMAL, "DMAL");
+    gen_spr_not_implemented(env, SPR_750_DMAU, "DMAU");
     /* Hardware implementation registers */
     /* XXX : not implemented */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID0, "HID0");
     /* XXX : not implemented */
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID1, "HID1");
     /* XXX : not implemented */
-    spr_register(env, SPR_750CL_HID2, "HID2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_750CL_HID2, "HID2");
     /* XXX : not implemented */
-    spr_register(env, SPR_750CL_HID4, "HID4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_750CL_HID4, "HID4");
     /* Quantization registers */
     /* XXX : not implemented */
-    spr_register(env, SPR_750_GQR0, "GQR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_750_GQR0, "GQR0");
     /* XXX : not implemented */
-    spr_register(env, SPR_750_GQR1, "GQR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_750_GQR1, "GQR1");
     /* XXX : not implemented */
-    spr_register(env, SPR_750_GQR2, "GQR2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_750_GQR2, "GQR2");
     /* XXX : not implemented */
-    spr_register(env, SPR_750_GQR3, "GQR3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_750_GQR3, "GQR3");
     /* XXX : not implemented */
-    spr_register(env, SPR_750_GQR4, "GQR4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_750_GQR4, "GQR4");
     /* XXX : not implemented */
-    spr_register(env, SPR_750_GQR5, "GQR5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_750_GQR5, "GQR5");
     /* XXX : not implemented */
-    spr_register(env, SPR_750_GQR6, "GQR6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_750_GQR6, "GQR6");
     /* XXX : not implemented */
-    spr_register(env, SPR_750_GQR7, "GQR7",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_750_GQR7, "GQR7");
     /* Memory management */
     gen_low_BATs(env);
     /* PowerPC 750cl has 8 DBATs and 8 IBATs */
@@ -5350,30 +2855,18 @@ static void init_proc_750cx(CPUPPCState *env)
     gen_spr_sdr1(env);
     gen_spr_7xx(env);
     /* XXX : not implemented */
-    spr_register(env, SPR_L2CR, "L2CR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, spr_access_nop,
-                 0x00000000);
+    gen_spr_not_implemented_write_nop(env, SPR_L2CR, "L2CR");
     /* Time base */
     gen_tbl(env);
     /* Thermal management */
     gen_spr_thrm(env);
     /* This register is not implemented but is present for compatibility */
-    spr_register(env, SPR_SDA, "SDA",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_SDA, "SDA");
     /* Hardware implementation registers */
     /* XXX : not implemented */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID0, "HID0");
     /* XXX : not implemented */
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID1, "HID1");
     /* Memory management */
     gen_low_BATs(env);
     /* PowerPC 750cx has 8 DBATs and 8 IBATs */
@@ -5433,35 +2926,20 @@ static void init_proc_750fx(CPUPPCState *env)
     gen_spr_sdr1(env);
     gen_spr_7xx(env);
     /* XXX : not implemented */
-    spr_register(env, SPR_L2CR, "L2CR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, spr_access_nop,
-                 0x00000000);
+    gen_spr_not_implemented_write_nop(env, SPR_L2CR, "L2CR");
     /* Time base */
     gen_tbl(env);
     /* Thermal management */
     gen_spr_thrm(env);
     /* XXX : not implemented */
-    spr_register(env, SPR_750_THRM4, "THRM4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_750_THRM4, "THRM4");
     /* Hardware implementation registers */
     /* XXX : not implemented */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID0, "HID0");
     /* XXX : not implemented */
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID1, "HID1");
     /* XXX : not implemented */
-    spr_register(env, SPR_750FX_HID2, "HID2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_750FX_HID2, "HID2");
     /* Memory management */
     gen_low_BATs(env);
     /* PowerPC 750fx & 750gx has 8 DBATs and 8 IBATs */
@@ -5521,35 +2999,20 @@ static void init_proc_750gx(CPUPPCState *env)
     gen_spr_sdr1(env);
     gen_spr_7xx(env);
     /* XXX : not implemented (XXX: different from 750fx) */
-    spr_register(env, SPR_L2CR, "L2CR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, spr_access_nop,
-                 0x00000000);
+    gen_spr_not_implemented_write_nop(env, SPR_L2CR, "L2CR");
     /* Time base */
     gen_tbl(env);
     /* Thermal management */
     gen_spr_thrm(env);
     /* XXX : not implemented */
-    spr_register(env, SPR_750_THRM4, "THRM4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_750_THRM4, "THRM4");
     /* Hardware implementation registers */
     /* XXX : not implemented (XXX: different from 750fx) */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID0, "HID0");
     /* XXX : not implemented */
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID1, "HID1");
     /* XXX : not implemented (XXX: different from 750fx) */
-    spr_register(env, SPR_750FX_HID2, "HID2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_750FX_HID2, "HID2");
     /* Memory management */
     gen_low_BATs(env);
     /* PowerPC 750fx & 750gx has 8 DBATs and 8 IBATs */
@@ -5615,20 +3078,11 @@ static void init_proc_745(CPUPPCState *env)
     gen_spr_thrm(env);
     /* Hardware implementation registers */
     /* XXX : not implemented */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID0, "HID0");
     /* XXX : not implemented */
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID1, "HID1");
     /* XXX : not implemented */
-    spr_register(env, SPR_HID2, "HID2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID2, "HID2");
     /* Memory management */
     gen_low_BATs(env);
     gen_high_BATs(env);
@@ -5689,33 +3143,18 @@ static void init_proc_755(CPUPPCState *env)
     gen_tbl(env);
     /* L2 cache control */
     /* XXX : not implemented */
-    spr_register(env, SPR_L2CR, "L2CR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, spr_access_nop,
-                 0x00000000);
+    gen_spr_not_implemented_write_nop(env, SPR_L2CR, "L2CR");
     /* XXX : not implemented */
-    spr_register(env, SPR_L2PMCR, "L2PMCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_L2PMCR, "L2PMCR");
     /* Thermal management */
     gen_spr_thrm(env);
     /* Hardware implementation registers */
     /* XXX : not implemented */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID0, "HID0");
     /* XXX : not implemented */
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID1, "HID1");
     /* XXX : not implemented */
-    spr_register(env, SPR_HID2, "HID2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_HID2, "HID2");
     /* Memory management */
     gen_low_BATs(env);
     gen_high_BATs(env);
@@ -5775,17 +3214,12 @@ static void init_proc_7400(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* XXX : not implemented */
-    spr_register(env, SPR_UBAMR, "UBAMR",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
+    gen_spr_not_implemented_ureg(env, SPR_UBAMR, "UBAMR");
     /* XXX: this seems not implemented on all revisions. */
     /* XXX : not implemented */
-    spr_register(env, SPR_MSSCR1, "MSSCR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_MSSCR1, "MSSCR1");
     /* Thermal management */
     gen_spr_thrm(env);
     /* Memory management */
@@ -5854,25 +3288,17 @@ static void init_proc_7410(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* XXX : not implemented */
-    spr_register(env, SPR_UBAMR, "UBAMR",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
+    gen_spr_not_implemented_ureg(env, SPR_UBAMR, "UBAMR");
     /* Thermal management */
     gen_spr_thrm(env);
     /* L2PMCR */
     /* XXX : not implemented */
-    spr_register(env, SPR_L2PMCR, "L2PMCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_L2PMCR, "L2PMCR");
     /* LDSTDB */
     /* XXX : not implemented */
-    spr_register(env, SPR_LDSTDB, "LDSTDB",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_LDSTDB, "LDSTDB");
     /* Memory management */
     gen_low_BATs(env);
     init_excp_7400(env);
@@ -5939,50 +3365,27 @@ static void init_proc_7440(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* XXX : not implemented */
-    spr_register(env, SPR_UBAMR, "UBAMR",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
+    gen_spr_not_implemented_ureg(env, SPR_UBAMR, "UBAMR");
     /* LDSTCR */
     /* XXX : not implemented */
-    spr_register(env, SPR_LDSTCR, "LDSTCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_LDSTCR, "LDSTCR");
     /* ICTRL */
     /* XXX : not implemented */
-    spr_register(env, SPR_ICTRL, "ICTRL",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_ICTRL, "ICTRL");
     /* MSSSR0 */
     /* XXX : not implemented */
-    spr_register(env, SPR_MSSSR0, "MSSSR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_MSSSR0, "MSSSR0");
     /* PMC */
     /* XXX : not implemented */
-    spr_register(env, SPR_7XX_PMC5, "PMC5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_7XX_PMC5, "PMC5");
     /* XXX : not implemented */
-    spr_register(env, SPR_7XX_UPMC5, "UPMC5",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
+    gen_spr_not_implemented_ureg(env, SPR_7XX_UPMC5, "UPMC5");
     /* XXX : not implemented */
-    spr_register(env, SPR_7XX_PMC6, "PMC6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_7XX_PMC6, "PMC6");
     /* XXX : not implemented */
-    spr_register(env, SPR_7XX_UPMC6, "UPMC6",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
+    gen_spr_not_implemented_ureg(env, SPR_7XX_UPMC6, "UPMC6");
     /* Memory management */
     gen_low_BATs(env);
     gen_74xx_soft_tlb(env, 128, 2);
@@ -6047,76 +3450,41 @@ static void init_proc_7450(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* Level 3 cache control */
     gen_l3_ctrl(env);
     /* L3ITCR1 */
     /* XXX : not implemented */
-    spr_register(env, SPR_L3ITCR1, "L3ITCR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_L3ITCR1, "L3ITCR1");
     /* L3ITCR2 */
     /* XXX : not implemented */
-    spr_register(env, SPR_L3ITCR2, "L3ITCR2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_L3ITCR2, "L3ITCR2");
     /* L3ITCR3 */
     /* XXX : not implemented */
-    spr_register(env, SPR_L3ITCR3, "L3ITCR3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_L3ITCR3, "L3ITCR3");
     /* L3OHCR */
     /* XXX : not implemented */
-    spr_register(env, SPR_L3OHCR, "L3OHCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_L3OHCR, "L3OHCR");
     /* XXX : not implemented */
-    spr_register(env, SPR_UBAMR, "UBAMR",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
+    gen_spr_not_implemented_ureg(env, SPR_UBAMR, "UBAMR");
     /* LDSTCR */
     /* XXX : not implemented */
-    spr_register(env, SPR_LDSTCR, "LDSTCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_LDSTCR, "LDSTCR");
     /* ICTRL */
     /* XXX : not implemented */
-    spr_register(env, SPR_ICTRL, "ICTRL",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_ICTRL, "ICTRL");
     /* MSSSR0 */
     /* XXX : not implemented */
-    spr_register(env, SPR_MSSSR0, "MSSSR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_MSSSR0, "MSSSR0");
     /* PMC */
     /* XXX : not implemented */
-    spr_register(env, SPR_7XX_PMC5, "PMC5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_7XX_PMC5, "PMC5");
     /* XXX : not implemented */
-    spr_register(env, SPR_7XX_UPMC5, "UPMC5",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
+    gen_spr_not_implemented_ureg(env, SPR_7XX_UPMC5, "UPMC5");
     /* XXX : not implemented */
-    spr_register(env, SPR_7XX_PMC6, "PMC6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_7XX_PMC6, "PMC6");
     /* XXX : not implemented */
-    spr_register(env, SPR_7XX_UPMC6, "UPMC6",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
+    gen_spr_not_implemented_ureg(env, SPR_7XX_UPMC6, "UPMC6");
     /* Memory management */
     gen_low_BATs(env);
     gen_74xx_soft_tlb(env, 128, 2);
@@ -6181,78 +3549,34 @@ static void init_proc_7445(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* LDSTCR */
     /* XXX : not implemented */
-    spr_register(env, SPR_LDSTCR, "LDSTCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_LDSTCR, "LDSTCR");
     /* ICTRL */
     /* XXX : not implemented */
-    spr_register(env, SPR_ICTRL, "ICTRL",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_ICTRL, "ICTRL");
     /* MSSSR0 */
     /* XXX : not implemented */
-    spr_register(env, SPR_MSSSR0, "MSSSR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_MSSSR0, "MSSSR0");
     /* PMC */
     /* XXX : not implemented */
-    spr_register(env, SPR_7XX_PMC5, "PMC5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_7XX_PMC5, "PMC5");
     /* XXX : not implemented */
-    spr_register(env, SPR_7XX_UPMC5, "UPMC5",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
+    gen_spr_not_implemented_ureg(env, SPR_7XX_UPMC5, "UPMC5");
     /* XXX : not implemented */
-    spr_register(env, SPR_7XX_PMC6, "PMC6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_7XX_PMC6, "PMC6");
     /* XXX : not implemented */
-    spr_register(env, SPR_7XX_UPMC6, "UPMC6",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
+    gen_spr_not_implemented_ureg(env, SPR_7XX_UPMC6, "UPMC6");
     /* SPRGs */
-    spr_register(env, SPR_SPRG4, "SPRG4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG4, "USPRG4",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_SPRG5, "SPRG5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG5, "USPRG5",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_SPRG6, "SPRG6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG6, "USPRG6",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_SPRG7, "SPRG7",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG7, "USPRG7",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_SPRG4, "SPRG4");
+    gen_spr_not_implemented_ureg(env, SPR_USPRG4, "USPRG4");
+    gen_spr_not_implemented(env, SPR_SPRG5, "SPRG5");
+    gen_spr_not_implemented_ureg(env, SPR_USPRG5, "USPRG5");
+    gen_spr_not_implemented(env, SPR_SPRG6, "SPRG6");
+    gen_spr_not_implemented_ureg(env, SPR_USPRG6, "USPRG6");
+    gen_spr_not_implemented(env, SPR_SPRG7, "SPRG7");
+    gen_spr_not_implemented_ureg(env, SPR_USPRG7, "USPRG7");
     /* Memory management */
     gen_low_BATs(env);
     gen_high_BATs(env);
@@ -6318,80 +3642,36 @@ static void init_proc_7455(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* Level 3 cache control */
     gen_l3_ctrl(env);
     /* LDSTCR */
     /* XXX : not implemented */
-    spr_register(env, SPR_LDSTCR, "LDSTCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_LDSTCR, "LDSTCR");
     /* ICTRL */
     /* XXX : not implemented */
-    spr_register(env, SPR_ICTRL, "ICTRL",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_ICTRL, "ICTRL");
     /* MSSSR0 */
     /* XXX : not implemented */
-    spr_register(env, SPR_MSSSR0, "MSSSR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_MSSSR0, "MSSSR0");
     /* PMC */
     /* XXX : not implemented */
-    spr_register(env, SPR_7XX_PMC5, "PMC5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_7XX_PMC5, "PMC5");
     /* XXX : not implemented */
-    spr_register(env, SPR_7XX_UPMC5, "UPMC5",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
+    gen_spr_not_implemented_ureg(env, SPR_7XX_UPMC5, "UPMC5");
     /* XXX : not implemented */
-    spr_register(env, SPR_7XX_PMC6, "PMC6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_7XX_PMC6, "PMC6");
     /* XXX : not implemented */
-    spr_register(env, SPR_7XX_UPMC6, "UPMC6",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
+    gen_spr_not_implemented_ureg(env, SPR_7XX_UPMC6, "UPMC6");
     /* SPRGs */
-    spr_register(env, SPR_SPRG4, "SPRG4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG4, "USPRG4",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_SPRG5, "SPRG5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG5, "USPRG5",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_SPRG6, "SPRG6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG6, "USPRG6",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_SPRG7, "SPRG7",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG7, "USPRG7",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_SPRG4, "SPRG4");
+    gen_spr_not_implemented_ureg(env, SPR_USPRG4, "USPRG4");
+    gen_spr_not_implemented(env, SPR_SPRG5, "SPRG5");
+    gen_spr_not_implemented_ureg(env, SPR_USPRG5, "USPRG5");
+    gen_spr_not_implemented(env, SPR_SPRG6, "SPRG6");
+    gen_spr_not_implemented_ureg(env, SPR_USPRG6, "USPRG6");
+    gen_spr_not_implemented(env, SPR_SPRG7, "SPRG7");
+    gen_spr_not_implemented_ureg(env, SPR_USPRG7, "USPRG7");
     /* Memory management */
     gen_low_BATs(env);
     gen_high_BATs(env);
@@ -6457,104 +3737,48 @@ static void init_proc_7457(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* Level 3 cache control */
     gen_l3_ctrl(env);
     /* L3ITCR1 */
     /* XXX : not implemented */
-    spr_register(env, SPR_L3ITCR1, "L3ITCR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_L3ITCR1, "L3ITCR1");
     /* L3ITCR2 */
     /* XXX : not implemented */
-    spr_register(env, SPR_L3ITCR2, "L3ITCR2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_L3ITCR2, "L3ITCR2");
     /* L3ITCR3 */
     /* XXX : not implemented */
-    spr_register(env, SPR_L3ITCR3, "L3ITCR3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_L3ITCR3, "L3ITCR3");
     /* L3OHCR */
     /* XXX : not implemented */
-    spr_register(env, SPR_L3OHCR, "L3OHCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_L3OHCR, "L3OHCR");
     /* LDSTCR */
     /* XXX : not implemented */
-    spr_register(env, SPR_LDSTCR, "LDSTCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_LDSTCR, "LDSTCR");
     /* ICTRL */
     /* XXX : not implemented */
-    spr_register(env, SPR_ICTRL, "ICTRL",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_ICTRL, "ICTRL");
     /* MSSSR0 */
     /* XXX : not implemented */
-    spr_register(env, SPR_MSSSR0, "MSSSR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_MSSSR0, "MSSSR0");
     /* PMC */
     /* XXX : not implemented */
-    spr_register(env, SPR_7XX_PMC5, "PMC5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_7XX_PMC5, "PMC5");
     /* XXX : not implemented */
-    spr_register(env, SPR_7XX_UPMC5, "UPMC5",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
+    gen_spr_not_implemented_ureg(env, SPR_7XX_UPMC5, "UPMC5");
     /* XXX : not implemented */
-    spr_register(env, SPR_7XX_PMC6, "PMC6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_7XX_PMC6, "PMC6");
     /* XXX : not implemented */
-    spr_register(env, SPR_7XX_UPMC6, "UPMC6",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
+    gen_spr_not_implemented_ureg(env, SPR_7XX_UPMC6, "UPMC6");
     /* SPRGs */
-    spr_register(env, SPR_SPRG4, "SPRG4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG4, "USPRG4",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_SPRG5, "SPRG5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG5, "USPRG5",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_SPRG6, "SPRG6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG6, "USPRG6",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_SPRG7, "SPRG7",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG7, "USPRG7",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_SPRG4, "SPRG4");
+    gen_spr_not_implemented_ureg(env, SPR_USPRG4, "USPRG4");
+    gen_spr_not_implemented(env, SPR_SPRG5, "SPRG5");
+    gen_spr_not_implemented_ureg(env, SPR_USPRG5, "USPRG5");
+    gen_spr_not_implemented(env, SPR_SPRG6, "SPRG6");
+    gen_spr_not_implemented_ureg(env, SPR_USPRG6, "USPRG6");
+    gen_spr_not_implemented(env, SPR_SPRG7, "SPRG7");
+    gen_spr_not_implemented_ureg(env, SPR_USPRG7, "USPRG7");
     /* Memory management */
     gen_low_BATs(env);
     gen_high_BATs(env);
@@ -6620,79 +3844,34 @@ static void init_proc_e600(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* XXX : not implemented */
-    spr_register(env, SPR_UBAMR, "UBAMR",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_LDSTCR, "LDSTCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_ICTRL, "ICTRL",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_MSSSR0, "MSSSR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_7XX_PMC5, "PMC5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_7XX_UPMC5, "UPMC5",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_7XX_PMC6, "PMC6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_7XX_UPMC6, "UPMC6",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
+    gen_spr_not_implemented_ureg(env, SPR_LDSTCR, "LDSTCR");
+    gen_spr_not_implemented_ureg(env, SPR_UBAMR, "UBAMR");
+    /* XXX : not implemented */
+    gen_spr_not_implemented(env, SPR_LDSTCR, "LDSTCR");
+    gen_spr_not_implemented(env, SPR_LDSTCR, "LDSTCR");
+    /* XXX : not implemented */
+    gen_spr_not_implemented(env, SPR_ICTRL, "ICTRL");
+    /* XXX : not implemented */
+    gen_spr_not_implemented(env, SPR_MSSSR0, "MSSSR0");
+    /* XXX : not implemented */
+    gen_spr_not_implemented(env, SPR_7XX_PMC5, "PMC5");
+    /* XXX : not implemented */
+    gen_spr_not_implemented(env, SPR_7XX_UPMC5, "UPMC5");
+    /* XXX : not implemented */
+    gen_spr_not_implemented(env, SPR_7XX_PMC6, "PMC6");
+    /* XXX : not implemented */
+    gen_spr_not_implemented(env, SPR_7XX_UPMC6, "UPMC6");
     /* SPRGs */
-    spr_register(env, SPR_SPRG4, "SPRG4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG4, "USPRG4",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_SPRG5, "SPRG5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG5, "USPRG5",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_SPRG6, "SPRG6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG6, "USPRG6",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_SPRG7, "SPRG7",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG7, "USPRG7",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
+    gen_spr_not_implemented(env, SPR_SPRG4, "SPRG4");
+    gen_spr_not_implemented_ureg(env, SPR_USPRG4, "USPRG4");
+    gen_spr_not_implemented(env, SPR_SPRG5, "SPRG5");
+    gen_spr_not_implemented_ureg(env, SPR_USPRG5, "USPRG5");
+    gen_spr_not_implemented(env, SPR_SPRG6, "SPRG6");
+    gen_spr_not_implemented_ureg(env, SPR_USPRG6, "USPRG6");
+    gen_spr_not_implemented(env, SPR_SPRG7, "SPRG7");
+    gen_spr_not_implemented_ureg(env, SPR_USPRG7, "USPRG7");
     /* Memory management */
     gen_low_BATs(env);
     gen_high_BATs(env);
@@ -6763,676 +3942,17 @@ static int check_pow_970(CPUPPCState *env)
     return 0;
 }
 
-static void gen_spr_970_hid(CPUPPCState *env)
-{
-    /* Hardware implementation registers */
-    /* XXX : not implemented */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_clear,
-                 0x60000000);
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_970_HID5, "HID5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 POWERPC970_HID5_INIT);
-}
-
-static void gen_spr_970_hior(CPUPPCState *env)
-{
-    spr_register(env, SPR_HIOR, "SPR_HIOR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_hior, &spr_write_hior,
-                 0x00000000);
-}
-
-static void gen_spr_book3s_ctrl(CPUPPCState *env)
-{
-    spr_register(env, SPR_CTRL, "SPR_CTRL",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_UCTRL, "SPR_UCTRL",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-}
-
-static void gen_spr_book3s_altivec(CPUPPCState *env)
-{
-    if (!(env->insns_flags & PPC_ALTIVEC)) {
-        return;
-    }
-
-    spr_register_kvm(env, SPR_VRSAVE, "VRSAVE",
-                     &spr_read_generic, &spr_write_generic,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_VRSAVE, 0x00000000);
-
-    /*
-     * Can't find information on what this should be on reset.  This
-     * value is the one used by 74xx processors.
-     */
-    vscr_init(env, 0x00010000);
-}
-
-static void gen_spr_book3s_dbg(CPUPPCState *env)
-{
-    /*
-     * TODO: different specs define different scopes for these,
-     * will have to address this:
-     * 970: super/write and super/read
-     * powerisa 2.03..2.04: hypv/write and super/read.
-     * powerisa 2.05 and newer: hypv/write and hypv/read.
-     */
-    spr_register_kvm(env, SPR_DABR, "DABR",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_DABR, 0x00000000);
-    spr_register_kvm(env, SPR_DABRX, "DABRX",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_DABRX, 0x00000000);
-}
-
-static void gen_spr_book3s_207_dbg(CPUPPCState *env)
-{
-    spr_register_kvm_hv(env, SPR_DAWR, "DAWR",
-                        SPR_NOACCESS, SPR_NOACCESS,
-                        SPR_NOACCESS, SPR_NOACCESS,
-                        &spr_read_generic, &spr_write_generic,
-                        KVM_REG_PPC_DAWR, 0x00000000);
-    spr_register_kvm_hv(env, SPR_DAWRX, "DAWRX",
-                        SPR_NOACCESS, SPR_NOACCESS,
-                        SPR_NOACCESS, SPR_NOACCESS,
-                        &spr_read_generic, &spr_write_generic,
-                        KVM_REG_PPC_DAWRX, 0x00000000);
-    spr_register_kvm_hv(env, SPR_CIABR, "CIABR",
-                        SPR_NOACCESS, SPR_NOACCESS,
-                        SPR_NOACCESS, SPR_NOACCESS,
-                        &spr_read_generic, &spr_write_generic,
-                        KVM_REG_PPC_CIABR, 0x00000000);
-}
-
-static void gen_spr_970_dbg(CPUPPCState *env)
-{
-    /* Breakpoints */
-    spr_register(env, SPR_IABR, "IABR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-static void gen_spr_book3s_pmu_sup(CPUPPCState *env)
-{
-    spr_register_kvm(env, SPR_POWER_MMCR0, "MMCR0",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_MMCR0, 0x00000000);
-    spr_register_kvm(env, SPR_POWER_MMCR1, "MMCR1",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_MMCR1, 0x00000000);
-    spr_register_kvm(env, SPR_POWER_MMCRA, "MMCRA",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_MMCRA, 0x00000000);
-    spr_register_kvm(env, SPR_POWER_PMC1, "PMC1",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_PMC1, 0x00000000);
-    spr_register_kvm(env, SPR_POWER_PMC2, "PMC2",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_PMC2, 0x00000000);
-    spr_register_kvm(env, SPR_POWER_PMC3, "PMC3",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_PMC3, 0x00000000);
-    spr_register_kvm(env, SPR_POWER_PMC4, "PMC4",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_PMC4, 0x00000000);
-    spr_register_kvm(env, SPR_POWER_PMC5, "PMC5",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_PMC5, 0x00000000);
-    spr_register_kvm(env, SPR_POWER_PMC6, "PMC6",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_PMC6, 0x00000000);
-    spr_register_kvm(env, SPR_POWER_SIAR, "SIAR",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_SIAR, 0x00000000);
-    spr_register_kvm(env, SPR_POWER_SDAR, "SDAR",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_SDAR, 0x00000000);
-}
-
-static void gen_spr_book3s_pmu_user(CPUPPCState *env)
-{
-    spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, &spr_write_ureg,
-                 0x00000000);
-    spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, &spr_write_ureg,
-                 0x00000000);
-    spr_register(env, SPR_POWER_UMMCRA, "UMMCRA",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, &spr_write_ureg,
-                 0x00000000);
-    spr_register(env, SPR_POWER_UPMC1, "UPMC1",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, &spr_write_ureg,
-                 0x00000000);
-    spr_register(env, SPR_POWER_UPMC2, "UPMC2",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, &spr_write_ureg,
-                 0x00000000);
-    spr_register(env, SPR_POWER_UPMC3, "UPMC3",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, &spr_write_ureg,
-                 0x00000000);
-    spr_register(env, SPR_POWER_UPMC4, "UPMC4",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, &spr_write_ureg,
-                 0x00000000);
-    spr_register(env, SPR_POWER_UPMC5, "UPMC5",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, &spr_write_ureg,
-                 0x00000000);
-    spr_register(env, SPR_POWER_UPMC6, "UPMC6",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, &spr_write_ureg,
-                 0x00000000);
-    spr_register(env, SPR_POWER_USIAR, "USIAR",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, &spr_write_ureg,
-                 0x00000000);
-    spr_register(env, SPR_POWER_USDAR, "USDAR",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, &spr_write_ureg,
-                 0x00000000);
-}
-
-static void gen_spr_970_pmu_sup(CPUPPCState *env)
-{
-    spr_register_kvm(env, SPR_970_PMC7, "PMC7",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_PMC7, 0x00000000);
-    spr_register_kvm(env, SPR_970_PMC8, "PMC8",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_PMC8, 0x00000000);
-}
-
-static void gen_spr_970_pmu_user(CPUPPCState *env)
-{
-    spr_register(env, SPR_970_UPMC7, "UPMC7",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, &spr_write_ureg,
-                 0x00000000);
-    spr_register(env, SPR_970_UPMC8, "UPMC8",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, &spr_write_ureg,
-                 0x00000000);
-}
-
-static void gen_spr_power8_pmu_sup(CPUPPCState *env)
-{
-    spr_register_kvm(env, SPR_POWER_MMCR2, "MMCR2",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_MMCR2, 0x00000000);
-    spr_register_kvm(env, SPR_POWER_MMCRS, "MMCRS",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_MMCRS, 0x00000000);
-    spr_register_kvm(env, SPR_POWER_SIER, "SIER",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_SIER, 0x00000000);
-    spr_register_kvm(env, SPR_POWER_SPMC1, "SPMC1",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_SPMC1, 0x00000000);
-    spr_register_kvm(env, SPR_POWER_SPMC2, "SPMC2",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_SPMC2, 0x00000000);
-    spr_register_kvm(env, SPR_TACR, "TACR",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_TACR, 0x00000000);
-    spr_register_kvm(env, SPR_TCSCR, "TCSCR",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_TCSCR, 0x00000000);
-    spr_register_kvm(env, SPR_CSIGR, "CSIGR",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_CSIGR, 0x00000000);
-}
-
-static void gen_spr_power8_pmu_user(CPUPPCState *env)
-{
-    spr_register(env, SPR_POWER_UMMCR2, "UMMCR2",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, &spr_write_ureg,
-                 0x00000000);
-    spr_register(env, SPR_POWER_USIER, "USIER",
-                 &spr_read_generic, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-static void gen_spr_power5p_ear(CPUPPCState *env)
-{
-    /* External access control */
-    spr_register(env, SPR_EAR, "EAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-static void gen_spr_power5p_tb(CPUPPCState *env)
-{
-    /* TBU40 (High 40 bits of the Timebase register */
-    spr_register_hv(env, SPR_TBU40, "TBU40",
-                    SPR_NOACCESS, SPR_NOACCESS,
-                    SPR_NOACCESS, SPR_NOACCESS,
-                    SPR_NOACCESS, &spr_write_tbu40,
-                    0x00000000);
-}
-
-static void gen_spr_970_lpar(CPUPPCState *env)
-{
-#if !defined(CONFIG_USER_ONLY)
-    /*
-     * PPC970: HID4 covers things later controlled by the LPCR and
-     * RMOR in later CPUs, but with a different encoding.  We only
-     * support the 970 in "Apple mode" which has all hypervisor
-     * facilities disabled by strapping, so we can basically just
-     * ignore it
-     */
-    spr_register(env, SPR_970_HID4, "HID4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-#endif
-}
-
-static void gen_spr_power5p_lpar(CPUPPCState *env)
-{
-#if !defined(CONFIG_USER_ONLY)
-    /* Logical partitionning */
-    spr_register_kvm_hv(env, SPR_LPCR, "LPCR",
-                        SPR_NOACCESS, SPR_NOACCESS,
-                        SPR_NOACCESS, SPR_NOACCESS,
-                        &spr_read_generic, &spr_write_lpcr,
-                        KVM_REG_PPC_LPCR, LPCR_LPES0 | LPCR_LPES1);
-    spr_register_hv(env, SPR_HDEC, "HDEC",
-                    SPR_NOACCESS, SPR_NOACCESS,
-                    SPR_NOACCESS, SPR_NOACCESS,
-                    &spr_read_hdecr, &spr_write_hdecr, 0);
-#endif
-}
-
-static void gen_spr_book3s_ids(CPUPPCState *env)
-{
-    /* FIXME: Will need to deal with thread vs core only SPRs */
-
-    /* Processor identification */
-    spr_register_hv(env, SPR_PIR, "PIR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 &spr_read_generic, NULL,
-                 0x00000000);
-    spr_register_hv(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register_hv(env, SPR_TSCR, "TSCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register_hv(env, SPR_HMER, "HMER",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_hmer,
-                 0x00000000);
-    spr_register_hv(env, SPR_HMEER, "HMEER",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register_hv(env, SPR_TFMR, "TFMR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register_hv(env, SPR_LPIDR, "LPIDR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_lpidr,
-                 0x00000000);
-    spr_register_hv(env, SPR_HFSCR, "HFSCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register_hv(env, SPR_MMCRC, "MMCRC",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register_hv(env, SPR_MMCRH, "MMCRH",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register_hv(env, SPR_HSPRG0, "HSPRG0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register_hv(env, SPR_HSPRG1, "HSPRG1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register_hv(env, SPR_HSRR0, "HSRR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register_hv(env, SPR_HSRR1, "HSRR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register_hv(env, SPR_HDAR, "HDAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register_hv(env, SPR_HDSISR, "HDSISR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register_hv(env, SPR_HRMOR, "HRMOR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-static void gen_spr_rmor(CPUPPCState *env)
-{
-    spr_register_hv(env, SPR_RMOR, "RMOR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-static void gen_spr_power8_ids(CPUPPCState *env)
-{
-    /* Thread identification */
-    spr_register(env, SPR_TIR, "TIR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-}
-
-static void gen_spr_book3s_purr(CPUPPCState *env)
-{
-#if !defined(CONFIG_USER_ONLY)
-    /* PURR & SPURR: Hack - treat these as aliases for the TB for now */
-    spr_register_kvm_hv(env, SPR_PURR,   "PURR",
-                        &spr_read_purr, SPR_NOACCESS,
-                        &spr_read_purr, SPR_NOACCESS,
-                        &spr_read_purr, &spr_write_purr,
-                        KVM_REG_PPC_PURR, 0x00000000);
-    spr_register_kvm_hv(env, SPR_SPURR,   "SPURR",
-                        &spr_read_purr, SPR_NOACCESS,
-                        &spr_read_purr, SPR_NOACCESS,
-                        &spr_read_purr, &spr_write_purr,
-                        KVM_REG_PPC_SPURR, 0x00000000);
-#endif
-}
-
-static void gen_spr_power6_dbg(CPUPPCState *env)
-{
-#if !defined(CONFIG_USER_ONLY)
-    spr_register(env, SPR_CFAR, "SPR_CFAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_cfar, &spr_write_cfar,
-                 0x00000000);
-#endif
-}
-
-static void gen_spr_power5p_common(CPUPPCState *env)
-{
-    spr_register_kvm(env, SPR_PPR, "PPR",
-                     &spr_read_generic, &spr_write_generic,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_PPR, 0x00000000);
-}
-
-static void gen_spr_power6_common(CPUPPCState *env)
-{
-#if !defined(CONFIG_USER_ONLY)
-    spr_register_kvm(env, SPR_DSCR, "SPR_DSCR",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_DSCR, 0x00000000);
-#endif
-    /*
-     * Register PCR to report POWERPC_EXCP_PRIV_REG instead of
-     * POWERPC_EXCP_INVAL_SPR in userspace. Permit hypervisor access.
-     */
-    spr_register_hv(env, SPR_PCR, "PCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_pcr,
-                 0x00000000);
-}
-
-static void gen_spr_power8_tce_address_control(CPUPPCState *env)
-{
-    spr_register_kvm(env, SPR_TAR, "TAR",
-                     &spr_read_tar, &spr_write_tar,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_TAR, 0x00000000);
-}
-
-static void gen_spr_power8_tm(CPUPPCState *env)
-{
-    spr_register_kvm(env, SPR_TFHAR, "TFHAR",
-                     &spr_read_tm, &spr_write_tm,
-                     &spr_read_tm, &spr_write_tm,
-                     KVM_REG_PPC_TFHAR, 0x00000000);
-    spr_register_kvm(env, SPR_TFIAR, "TFIAR",
-                     &spr_read_tm, &spr_write_tm,
-                     &spr_read_tm, &spr_write_tm,
-                     KVM_REG_PPC_TFIAR, 0x00000000);
-    spr_register_kvm(env, SPR_TEXASR, "TEXASR",
-                     &spr_read_tm, &spr_write_tm,
-                     &spr_read_tm, &spr_write_tm,
-                     KVM_REG_PPC_TEXASR, 0x00000000);
-    spr_register(env, SPR_TEXASRU, "TEXASRU",
-                 &spr_read_tm_upper32, &spr_write_tm_upper32,
-                 &spr_read_tm_upper32, &spr_write_tm_upper32,
-                 0x00000000);
-}
-
-static void gen_spr_power8_ebb(CPUPPCState *env)
-{
-    spr_register(env, SPR_BESCRS, "BESCRS",
-                 &spr_read_ebb, &spr_write_ebb,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BESCRSU, "BESCRSU",
-                 &spr_read_ebb_upper32, &spr_write_ebb_upper32,
-                 &spr_read_prev_upper32, &spr_write_prev_upper32,
-                 0x00000000);
-    spr_register(env, SPR_BESCRR, "BESCRR",
-                 &spr_read_ebb, &spr_write_ebb,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BESCRRU, "BESCRRU",
-                 &spr_read_ebb_upper32, &spr_write_ebb_upper32,
-                 &spr_read_prev_upper32, &spr_write_prev_upper32,
-                 0x00000000);
-    spr_register_kvm(env, SPR_EBBHR, "EBBHR",
-                     &spr_read_ebb, &spr_write_ebb,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_EBBHR, 0x00000000);
-    spr_register_kvm(env, SPR_EBBRR, "EBBRR",
-                     &spr_read_ebb, &spr_write_ebb,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_EBBRR, 0x00000000);
-    spr_register_kvm(env, SPR_BESCR, "BESCR",
-                     &spr_read_ebb, &spr_write_ebb,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_BESCR, 0x00000000);
-}
-
-/* Virtual Time Base */
-static void gen_spr_vtb(CPUPPCState *env)
-{
-    spr_register_kvm_hv(env, SPR_VTB, "VTB",
-                        SPR_NOACCESS, SPR_NOACCESS,
-                        &spr_read_vtb, SPR_NOACCESS,
-                        &spr_read_vtb, &spr_write_vtb,
-                        KVM_REG_PPC_VTB, 0x00000000);
-}
-
-static void gen_spr_power8_fscr(CPUPPCState *env)
-{
-#if defined(CONFIG_USER_ONLY)
-    target_ulong initval = 1ULL << FSCR_TAR;
-#else
-    target_ulong initval = 0;
-#endif
-    spr_register_kvm(env, SPR_FSCR, "FSCR",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_FSCR, initval);
-}
-
-static void gen_spr_power8_pspb(CPUPPCState *env)
-{
-    spr_register_kvm(env, SPR_PSPB, "PSPB",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic32,
-                     KVM_REG_PPC_PSPB, 0);
-}
-
-static void gen_spr_power8_dpdes(CPUPPCState *env)
-{
-#if !defined(CONFIG_USER_ONLY)
-    /* Directed Privileged Door-bell Exception State, used for IPI */
-    spr_register_kvm_hv(env, SPR_DPDES, "DPDES",
-                        SPR_NOACCESS, SPR_NOACCESS,
-                        &spr_read_dpdes, SPR_NOACCESS,
-                        &spr_read_dpdes, &spr_write_dpdes,
-                        KVM_REG_PPC_DPDES, 0x00000000);
-#endif
-}
-
-static void gen_spr_power8_ic(CPUPPCState *env)
-{
-#if !defined(CONFIG_USER_ONLY)
-    spr_register_hv(env, SPR_IC, "IC",
-                    SPR_NOACCESS, SPR_NOACCESS,
-                    &spr_read_generic, SPR_NOACCESS,
-                    &spr_read_generic, &spr_write_generic,
-                    0);
-#endif
-}
-
-static void gen_spr_power8_book4(CPUPPCState *env)
-{
-    /* Add a number of P8 book4 registers */
-#if !defined(CONFIG_USER_ONLY)
-    spr_register_kvm(env, SPR_ACOP, "ACOP",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_ACOP, 0);
-    spr_register_kvm(env, SPR_BOOKS_PID, "PID",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_pidr,
-                     KVM_REG_PPC_PID, 0);
-    spr_register_kvm(env, SPR_WORT, "WORT",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_WORT, 0);
-#endif
-}
-
-static void gen_spr_power7_book4(CPUPPCState *env)
-{
-    /* Add a number of P7 book4 registers */
-#if !defined(CONFIG_USER_ONLY)
-    spr_register_kvm(env, SPR_ACOP, "ACOP",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_ACOP, 0);
-    spr_register_kvm(env, SPR_BOOKS_PID, "PID",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_PID, 0);
-#endif
-}
-
-static void gen_spr_power8_rpr(CPUPPCState *env)
-{
-#if !defined(CONFIG_USER_ONLY)
-    spr_register_hv(env, SPR_RPR, "RPR",
-                    SPR_NOACCESS, SPR_NOACCESS,
-                    SPR_NOACCESS, SPR_NOACCESS,
-                    &spr_read_generic, &spr_write_generic,
-                    0x00000103070F1F3F);
-#endif
-}
-
-static void gen_spr_power9_mmu(CPUPPCState *env)
-{
-#if !defined(CONFIG_USER_ONLY)
-    /* Partition Table Control */
-    spr_register_kvm_hv(env, SPR_PTCR, "PTCR",
-                        SPR_NOACCESS, SPR_NOACCESS,
-                        SPR_NOACCESS, SPR_NOACCESS,
-                        &spr_read_generic, &spr_write_ptcr,
-                        KVM_REG_PPC_PTCR, 0x00000000);
-    /* Address Segment Descriptor Register */
-    spr_register_hv(env, SPR_ASDR, "ASDR",
-                    SPR_NOACCESS, SPR_NOACCESS,
-                    SPR_NOACCESS, SPR_NOACCESS,
-                    &spr_read_generic, &spr_write_generic,
-                    0x0000000000000000);
-#endif
-}
-
 static void init_proc_book3s_common(CPUPPCState *env)
 {
     gen_spr_ne_601(env);
     gen_tbl(env);
     gen_spr_usprg3(env);
     gen_spr_book3s_altivec(env);
+    /*
+     * Can't find information on what this should be on reset.  This
+     * value is the one used by 74xx processors.
+     */
+    vscr_init(env, 0x00010000);
     gen_spr_book3s_pmu_sup(env);
     gen_spr_book3s_pmu_user(env);
     gen_spr_book3s_ctrl(env);
@@ -7966,14 +4486,9 @@ static void init_proc_POWER9(CPUPPCState *env)
     gen_spr_power9_mmu(env);
 
     /* POWER9 Specific registers */
-    spr_register_kvm(env, SPR_TIDR, "TIDR", NULL, NULL,
-                     spr_read_generic, spr_write_generic,
-                     KVM_REG_PPC_TIDR, 0);
+    gen_spr_TIDR(env);
 
-    /* FIXME: Filter fields properly based on privilege level */
-    spr_register_kvm_hv(env, SPR_PSSCR, "PSSCR", NULL, NULL, NULL, NULL,
-                        spr_read_generic, spr_write_generic,
-                        KVM_REG_PPC_PSSCR, 0);
+    gen_spr_PSSCR(env);
 
     /* env variables */
     env->dcache_line_size = 128;
@@ -8181,10 +4696,7 @@ static void init_proc_POWER10(CPUPPCState *env)
     gen_spr_power8_rpr(env);
     gen_spr_power9_mmu(env);
 
-    /* FIXME: Filter fields properly based on privilege level */
-    spr_register_kvm_hv(env, SPR_PSSCR, "PSSCR", NULL, NULL, NULL, NULL,
-                        spr_read_generic, spr_write_generic,
-                        KVM_REG_PPC_PSSCR, 0);
+    gen_spr_PSSCR(env);
 
     /* env variables */
     env->dcache_line_size = 128;
@@ -8385,29 +4897,10 @@ static void init_ppc_proc(PowerPCCPU *cpu)
 #endif
     /* Register SPR common to all PowerPC implementations */
     gen_spr_generic(env);
-    spr_register(env, SPR_PVR, "PVR",
-                 /* Linux permits userspace to read PVR */
-#if defined(CONFIG_LINUX_USER)
-                 &spr_read_generic,
-#else
-                 SPR_NOACCESS,
-#endif
-                 SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 pcc->pvr);
+    gen_spr_pvr(env, pcc);
     /* Register SVR if it's defined to anything else than POWERPC_SVR_NONE */
     if (pcc->svr != POWERPC_SVR_NONE) {
-        if (pcc->svr & POWERPC_SVR_E500) {
-            spr_register(env, SPR_E500_SVR, "SVR",
-                         SPR_NOACCESS, SPR_NOACCESS,
-                         &spr_read_generic, SPR_NOACCESS,
-                         pcc->svr & ~POWERPC_SVR_E500);
-        } else {
-            spr_register(env, SPR_SVR, "SVR",
-                         SPR_NOACCESS, SPR_NOACCESS,
-                         &spr_read_generic, SPR_NOACCESS,
-                         pcc->svr);
-        }
+        gen_spr_svr(env, pcc);
     }
     /* PowerPC implementation specific initialisations (SPRs, timers, ...) */
     (*pcc->init_proc)(env);
-- 
2.17.1


