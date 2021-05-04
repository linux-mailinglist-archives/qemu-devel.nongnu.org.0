Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E35A5372BB7
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 16:11:16 +0200 (CEST)
Received: from localhost ([::1]:47930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldvla-000244-Ov
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 10:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ldveJ-0006RK-NO; Tue, 04 May 2021 10:03:43 -0400
Received: from [201.28.113.2] (port=8857 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ldveD-0003SU-Vd; Tue, 04 May 2021 10:03:43 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 4 May 2021 11:02:31 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id C6C498012B4;
 Tue,  4 May 2021 11:02:31 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/5] target/ppc: renamed SPR registration functions
Date: Tue,  4 May 2021 11:01:54 -0300
Message-Id: <20210504140157.76066-3-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210504140157.76066-1-bruno.larsen@eldorado.org.br>
References: <20210504140157.76066-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 04 May 2021 14:02:32.0009 (UTC)
 FILETIME=[205D2B90:01D740EE]
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Renamed all gen_spr_* and gen_* functions specifically related to
registering SPRs to register_*_sprs and register_*, to avoid future
confusion with other TCG related code.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/translate_init.c.inc | 860 ++++++++++++++++----------------
 1 file changed, 430 insertions(+), 430 deletions(-)

diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index d5527c149f..4fac8a9950 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -842,7 +842,7 @@ static void _spr_register(CPUPPCState *env, int num, const char *name,
                      oea_read, oea_write, 0, ival)
 
 /* Generic PowerPC SPRs */
-static void gen_spr_generic(CPUPPCState *env)
+static void register_generic_sprs(CPUPPCState *env)
 {
     /* Integer processing */
     spr_register(env, SPR_XER, "XER",
@@ -887,7 +887,7 @@ static void gen_spr_generic(CPUPPCState *env)
 }
 
 /* SPR common to all non-embedded PowerPC, including 601 */
-static void gen_spr_ne_601(CPUPPCState *env)
+static void register_ne_601_sprs(CPUPPCState *env)
 {
     /* Exception processing */
     spr_register_kvm(env, SPR_DSISR, "DSISR",
@@ -906,7 +906,7 @@ static void gen_spr_ne_601(CPUPPCState *env)
 }
 
 /* Storage Description Register 1 */
-static void gen_spr_sdr1(CPUPPCState *env)
+static void register_sdr1_sprs(CPUPPCState *env)
 {
 #ifndef CONFIG_USER_ONLY
     if (env->has_hv_mode) {
@@ -929,7 +929,7 @@ static void gen_spr_sdr1(CPUPPCState *env)
 }
 
 /* BATs 0-3 */
-static void gen_low_BATs(CPUPPCState *env)
+static void register_low_BATs(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     spr_register(env, SPR_IBAT0U, "IBAT0U",
@@ -1001,7 +1001,7 @@ static void gen_low_BATs(CPUPPCState *env)
 }
 
 /* BATs 4-7 */
-static void gen_high_BATs(CPUPPCState *env)
+static void register_high_BATs(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     spr_register(env, SPR_IBAT4U, "IBAT4U",
@@ -1073,7 +1073,7 @@ static void gen_high_BATs(CPUPPCState *env)
 }
 
 /* Generic PowerPC time base */
-static void gen_tbl(CPUPPCState *env)
+static void register_tbl(CPUPPCState *env)
 {
     spr_register(env, SPR_VTBL,  "TBL",
                  &spr_read_tbl, SPR_NOACCESS,
@@ -1094,7 +1094,7 @@ static void gen_tbl(CPUPPCState *env)
 }
 
 /* Softare table search registers */
-static void gen_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways)
+static void register_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways)
 {
 #if !defined(CONFIG_USER_ONLY)
     env->nb_tlb = nb_tlbs;
@@ -1133,7 +1133,7 @@ static void gen_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways)
 }
 
 /* SPR common to MPC755 and G2 */
-static void gen_spr_G2_755(CPUPPCState *env)
+static void register_G2_755_sprs(CPUPPCState *env)
 {
     /* SGPRs */
     spr_register(env, SPR_SPRG4, "SPRG4",
@@ -1155,7 +1155,7 @@ static void gen_spr_G2_755(CPUPPCState *env)
 }
 
 /* SPR common to all 7xx PowerPC implementations */
-static void gen_spr_7xx(CPUPPCState *env)
+static void register_7xx_sprs(CPUPPCState *env)
 {
     /* Breakpoints */
     /* XXX : not implemented */
@@ -1353,7 +1353,7 @@ static void spr_write_iamr(DisasContext *ctx, int sprn, int gprn)
 }
 #endif /* CONFIG_USER_ONLY */
 
-static void gen_spr_amr(CPUPPCState *env)
+static void register_amr_sprs(CPUPPCState *env)
 {
 #ifndef CONFIG_USER_ONLY
     /*
@@ -1385,7 +1385,7 @@ static void gen_spr_amr(CPUPPCState *env)
 #endif /* !CONFIG_USER_ONLY */
 }
 
-static void gen_spr_iamr(CPUPPCState *env)
+static void register_iamr_sprs(CPUPPCState *env)
 {
 #ifndef CONFIG_USER_ONLY
     spr_register_kvm_hv(env, SPR_IAMR, "IAMR",
@@ -1406,7 +1406,7 @@ static void spr_read_thrm(DisasContext *ctx, int gprn, int sprn)
 }
 #endif /* !CONFIG_USER_ONLY */
 
-static void gen_spr_thrm(CPUPPCState *env)
+static void register_thrm_sprs(CPUPPCState *env)
 {
     /* Thermal management */
     /* XXX : not implemented */
@@ -1427,7 +1427,7 @@ static void gen_spr_thrm(CPUPPCState *env)
 }
 
 /* SPR specific to PowerPC 604 implementation */
-static void gen_spr_604(CPUPPCState *env)
+static void register_604_sprs(CPUPPCState *env)
 {
     /* Processor identification */
     spr_register(env, SPR_PIR, "PIR",
@@ -1480,7 +1480,7 @@ static void gen_spr_604(CPUPPCState *env)
 }
 
 /* SPR specific to PowerPC 603 implementation */
-static void gen_spr_603(CPUPPCState *env)
+static void register_603_sprs(CPUPPCState *env)
 {
     /* External access control */
     /* XXX : not implemented */
@@ -1498,7 +1498,7 @@ static void gen_spr_603(CPUPPCState *env)
 }
 
 /* SPR specific to PowerPC G2 implementation */
-static void gen_spr_G2(CPUPPCState *env)
+static void register_G2_sprs(CPUPPCState *env)
 {
     /* Memory base address */
     /* MBAR */
@@ -1550,7 +1550,7 @@ static void gen_spr_G2(CPUPPCState *env)
 }
 
 /* SPR specific to PowerPC 602 implementation */
-static void gen_spr_602(CPUPPCState *env)
+static void register_602_sprs(CPUPPCState *env)
 {
     /* ESA registers */
     /* XXX : not implemented */
@@ -1598,7 +1598,7 @@ static void gen_spr_602(CPUPPCState *env)
 }
 
 /* SPR specific to PowerPC 601 implementation */
-static void gen_spr_601(CPUPPCState *env)
+static void register_601_sprs(CPUPPCState *env)
 {
     /* Multiplication/division register */
     /* MQ */
@@ -1674,7 +1674,7 @@ static void gen_spr_601(CPUPPCState *env)
 #endif
 }
 
-static void gen_spr_74xx(CPUPPCState *env)
+static void register_74xx_sprs(CPUPPCState *env)
 {
     /* Processor identification */
     spr_register(env, SPR_PIR, "PIR",
@@ -1724,7 +1724,7 @@ static void gen_spr_74xx(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_l3_ctrl(CPUPPCState *env)
+static void register_l3_ctrl(CPUPPCState *env)
 {
     /* L3CR */
     /* XXX : not implemented */
@@ -1746,7 +1746,7 @@ static void gen_l3_ctrl(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_74xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways)
+static void register_74xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways)
 {
 #if !defined(CONFIG_USER_ONLY)
     env->nb_tlb = nb_tlbs;
@@ -1822,7 +1822,7 @@ static void spr_write_epsc(DisasContext *ctx, int sprn, int gprn)
 
 #endif
 
-static void gen_spr_usprg3(CPUPPCState *env)
+static void register_usprg3_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_USPRG3, "USPRG3",
                  &spr_read_ureg, SPR_NOACCESS,
@@ -1830,7 +1830,7 @@ static void gen_spr_usprg3(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_usprgh(CPUPPCState *env)
+static void register_usprgh_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_USPRG4, "USPRG4",
                  &spr_read_ureg, SPR_NOACCESS,
@@ -1851,7 +1851,7 @@ static void gen_spr_usprgh(CPUPPCState *env)
 }
 
 /* PowerPC BookE SPR */
-static void gen_spr_BookE(CPUPPCState *env, uint64_t ivor_mask)
+static void register_BookE_sprs(CPUPPCState *env, uint64_t ivor_mask)
 {
     const char *ivor_names[64] = {
         "IVOR0",  "IVOR1",  "IVOR2",  "IVOR3",
@@ -2027,7 +2027,7 @@ static void gen_spr_BookE(CPUPPCState *env, uint64_t ivor_mask)
                  0x00000000);
 }
 
-static inline uint32_t gen_tlbncfg(uint32_t assoc, uint32_t minsize,
+static inline uint32_t register_tlbncfg(uint32_t assoc, uint32_t minsize,
                                    uint32_t maxsize, uint32_t flags,
                                    uint32_t nentries)
 {
@@ -2038,7 +2038,7 @@ static inline uint32_t gen_tlbncfg(uint32_t assoc, uint32_t minsize,
 }
 
 /* BookE 2.06 storage control registers */
-static void gen_spr_BookE206(CPUPPCState *env, uint32_t mas_mask,
+static void register_BookE206_sprs(CPUPPCState *env, uint32_t mas_mask,
                              uint32_t *tlbncfg, uint32_t mmucfg)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -2126,11 +2126,11 @@ static void gen_spr_BookE206(CPUPPCState *env, uint32_t mas_mask,
     }
 #endif
 
-    gen_spr_usprgh(env);
+    register_usprgh_sprs(env);
 }
 
 /* SPR specific to PowerPC 440 implementation */
-static void gen_spr_440(CPUPPCState *env)
+static void register_440_sprs(CPUPPCState *env)
 {
     /* Cache control */
     /* XXX : not implemented */
@@ -2271,7 +2271,7 @@ static void gen_spr_440(CPUPPCState *env)
 }
 
 /* SPR shared between PowerPC 40x implementations */
-static void gen_spr_40x(CPUPPCState *env)
+static void register_40x_sprs(CPUPPCState *env)
 {
     /* Cache */
     /* not emulated, as QEMU do not emulate caches */
@@ -2326,7 +2326,7 @@ static void gen_spr_40x(CPUPPCState *env)
 }
 
 /* SPR specific to PowerPC 405 implementation */
-static void gen_spr_405(CPUPPCState *env)
+static void register_405_sprs(CPUPPCState *env)
 {
     /* MMU */
     spr_register(env, SPR_40x_PID, "PID",
@@ -2428,11 +2428,11 @@ static void gen_spr_405(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  spr_read_generic, &spr_write_generic,
                  0x00000000);
-    gen_spr_usprgh(env);
+    register_usprgh_sprs(env);
 }
 
 /* SPR shared between PowerPC 401 & 403 implementations */
-static void gen_spr_401_403(CPUPPCState *env)
+static void register_401_403_sprs(CPUPPCState *env)
 {
     /* Time base */
     spr_register(env, SPR_403_VTBL,  "TBL",
@@ -2460,7 +2460,7 @@ static void gen_spr_401_403(CPUPPCState *env)
 }
 
 /* SPR specific to PowerPC 401 implementation */
-static void gen_spr_401(CPUPPCState *env)
+static void register_401_sprs(CPUPPCState *env)
 {
     /* Debug interface */
     /* XXX : not implemented */
@@ -2502,9 +2502,9 @@ static void gen_spr_401(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_401x2(CPUPPCState *env)
+static void register_401x2_sprs(CPUPPCState *env)
 {
-    gen_spr_401(env);
+    register_401_sprs(env);
     spr_register(env, SPR_40x_PID, "PID",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -2516,7 +2516,7 @@ static void gen_spr_401x2(CPUPPCState *env)
 }
 
 /* SPR specific to PowerPC 403 implementation */
-static void gen_spr_403(CPUPPCState *env)
+static void register_403_sprs(CPUPPCState *env)
 {
     /* Debug interface */
     /* XXX : not implemented */
@@ -2552,7 +2552,7 @@ static void gen_spr_403(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_403_real(CPUPPCState *env)
+static void register_403_real_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_403_PBL1,  "PBL1",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -2572,7 +2572,7 @@ static void gen_spr_403_real(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_403_mmu(CPUPPCState *env)
+static void register_403_mmu_sprs(CPUPPCState *env)
 {
     /* MMU */
     spr_register(env, SPR_40x_PID, "PID",
@@ -2586,7 +2586,7 @@ static void gen_spr_403_mmu(CPUPPCState *env)
 }
 
 /* SPR specific to PowerPC compression coprocessor extension */
-static void gen_spr_compress(CPUPPCState *env)
+static void register_compress_sprs(CPUPPCState *env)
 {
     /* XXX : not implemented */
     spr_register(env, SPR_401_SKR, "SKR",
@@ -2595,7 +2595,7 @@ static void gen_spr_compress(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_5xx_8xx(CPUPPCState *env)
+static void register_5xx_8xx_sprs(CPUPPCState *env)
 {
     /* Exception processing */
     spr_register_kvm(env, SPR_DSISR, "DSISR",
@@ -2713,7 +2713,7 @@ static void gen_spr_5xx_8xx(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_5xx(CPUPPCState *env)
+static void register_5xx_sprs(CPUPPCState *env)
 {
     /* XXX : not implemented */
     spr_register(env, SPR_RCPU_MI_GRA, "MI_GRA",
@@ -2822,7 +2822,7 @@ static void gen_spr_5xx(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_8xx(CPUPPCState *env)
+static void register_8xx_sprs(CPUPPCState *env)
 {
     /* XXX : not implemented */
     spr_register(env, SPR_MPC_IC_CST, "IC_CST",
@@ -3557,9 +3557,9 @@ static bool ppc_cpu_interrupts_big_endian_lpcr(PowerPCCPU *cpu)
 
 static void init_proc_401(CPUPPCState *env)
 {
-    gen_spr_40x(env);
-    gen_spr_401_403(env);
-    gen_spr_401(env);
+    register_40x_sprs(env);
+    register_401_403_sprs(env);
+    register_401_sprs(env);
     init_excp_4xx_real(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -3603,10 +3603,10 @@ POWERPC_FAMILY(401)(ObjectClass *oc, void *data)
 
 static void init_proc_401x2(CPUPPCState *env)
 {
-    gen_spr_40x(env);
-    gen_spr_401_403(env);
-    gen_spr_401x2(env);
-    gen_spr_compress(env);
+    register_40x_sprs(env);
+    register_401_403_sprs(env);
+    register_401x2_sprs(env);
+    register_compress_sprs(env);
     /* Memory management */
 #if !defined(CONFIG_USER_ONLY)
     env->nb_tlb = 64;
@@ -3661,11 +3661,11 @@ POWERPC_FAMILY(401x2)(ObjectClass *oc, void *data)
 
 static void init_proc_401x3(CPUPPCState *env)
 {
-    gen_spr_40x(env);
-    gen_spr_401_403(env);
-    gen_spr_401(env);
-    gen_spr_401x2(env);
-    gen_spr_compress(env);
+    register_40x_sprs(env);
+    register_401_403_sprs(env);
+    register_401_sprs(env);
+    register_401x2_sprs(env);
+    register_compress_sprs(env);
     init_excp_4xx_softmmu(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -3714,10 +3714,10 @@ POWERPC_FAMILY(401x3)(ObjectClass *oc, void *data)
 
 static void init_proc_IOP480(CPUPPCState *env)
 {
-    gen_spr_40x(env);
-    gen_spr_401_403(env);
-    gen_spr_401x2(env);
-    gen_spr_compress(env);
+    register_40x_sprs(env);
+    register_401_403_sprs(env);
+    register_401x2_sprs(env);
+    register_compress_sprs(env);
     /* Memory management */
 #if !defined(CONFIG_USER_ONLY)
     env->nb_tlb = 64;
@@ -3772,10 +3772,10 @@ POWERPC_FAMILY(IOP480)(ObjectClass *oc, void *data)
 
 static void init_proc_403(CPUPPCState *env)
 {
-    gen_spr_40x(env);
-    gen_spr_401_403(env);
-    gen_spr_403(env);
-    gen_spr_403_real(env);
+    register_40x_sprs(env);
+    register_401_403_sprs(env);
+    register_403_sprs(env);
+    register_403_real_sprs(env);
     init_excp_4xx_real(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -3819,11 +3819,11 @@ POWERPC_FAMILY(403)(ObjectClass *oc, void *data)
 
 static void init_proc_403GCX(CPUPPCState *env)
 {
-    gen_spr_40x(env);
-    gen_spr_401_403(env);
-    gen_spr_403(env);
-    gen_spr_403_real(env);
-    gen_spr_403_mmu(env);
+    register_40x_sprs(env);
+    register_401_403_sprs(env);
+    register_403_sprs(env);
+    register_403_real_sprs(env);
+    register_403_mmu_sprs(env);
     /* Bus access control */
     /* not emulated, as QEMU never does speculative access */
     spr_register(env, SPR_40x_SGR, "SGR",
@@ -3887,9 +3887,9 @@ POWERPC_FAMILY(403GCX)(ObjectClass *oc, void *data)
 static void init_proc_405(CPUPPCState *env)
 {
     /* Time base */
-    gen_tbl(env);
-    gen_spr_40x(env);
-    gen_spr_405(env);
+    register_tbl(env);
+    register_40x_sprs(env);
+    register_405_sprs(env);
     /* Bus access control */
     /* not emulated, as QEMU never does speculative access */
     spr_register(env, SPR_40x_SGR, "SGR",
@@ -3953,10 +3953,10 @@ POWERPC_FAMILY(405)(ObjectClass *oc, void *data)
 static void init_proc_440EP(CPUPPCState *env)
 {
     /* Time base */
-    gen_tbl(env);
-    gen_spr_BookE(env, 0x000000000000FFFFULL);
-    gen_spr_440(env);
-    gen_spr_usprgh(env);
+    register_tbl(env);
+    register_BookE_sprs(env, 0x000000000000FFFFULL);
+    register_440_sprs(env);
+    register_usprgh_sprs(env);
     /* Processor identification */
     spr_register(env, SPR_BOOKE_PIR, "PIR",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -4095,10 +4095,10 @@ POWERPC_FAMILY(460EX)(ObjectClass *oc, void *data)
 static void init_proc_440GP(CPUPPCState *env)
 {
     /* Time base */
-    gen_tbl(env);
-    gen_spr_BookE(env, 0x000000000000FFFFULL);
-    gen_spr_440(env);
-    gen_spr_usprgh(env);
+    register_tbl(env);
+    register_BookE_sprs(env, 0x000000000000FFFFULL);
+    register_440_sprs(env);
+    register_usprgh_sprs(env);
     /* Processor identification */
     spr_register(env, SPR_BOOKE_PIR, "PIR",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -4178,10 +4178,10 @@ POWERPC_FAMILY(440GP)(ObjectClass *oc, void *data)
 static void init_proc_440x4(CPUPPCState *env)
 {
     /* Time base */
-    gen_tbl(env);
-    gen_spr_BookE(env, 0x000000000000FFFFULL);
-    gen_spr_440(env);
-    gen_spr_usprgh(env);
+    register_tbl(env);
+    register_BookE_sprs(env, 0x000000000000FFFFULL);
+    register_440_sprs(env);
+    register_usprgh_sprs(env);
     /* Processor identification */
     spr_register(env, SPR_BOOKE_PIR, "PIR",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -4261,10 +4261,10 @@ POWERPC_FAMILY(440x4)(ObjectClass *oc, void *data)
 static void init_proc_440x5(CPUPPCState *env)
 {
     /* Time base */
-    gen_tbl(env);
-    gen_spr_BookE(env, 0x000000000000FFFFULL);
-    gen_spr_440(env);
-    gen_spr_usprgh(env);
+    register_tbl(env);
+    register_BookE_sprs(env, 0x000000000000FFFFULL);
+    register_440_sprs(env);
+    register_usprgh_sprs(env);
     /* Processor identification */
     spr_register(env, SPR_BOOKE_PIR, "PIR",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -4400,9 +4400,9 @@ POWERPC_FAMILY(440x5wDFPU)(ObjectClass *oc, void *data)
 static void init_proc_MPC5xx(CPUPPCState *env)
 {
     /* Time base */
-    gen_tbl(env);
-    gen_spr_5xx_8xx(env);
-    gen_spr_5xx(env);
+    register_tbl(env);
+    register_5xx_8xx_sprs(env);
+    register_5xx_sprs(env);
     init_excp_MPC5xx(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -4444,9 +4444,9 @@ POWERPC_FAMILY(MPC5xx)(ObjectClass *oc, void *data)
 static void init_proc_MPC8xx(CPUPPCState *env)
 {
     /* Time base */
-    gen_tbl(env);
-    gen_spr_5xx_8xx(env);
-    gen_spr_8xx(env);
+    register_tbl(env);
+    register_5xx_8xx_sprs(env);
+    register_8xx_sprs(env);
     init_excp_MPC8xx(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -4488,12 +4488,12 @@ POWERPC_FAMILY(MPC8xx)(ObjectClass *oc, void *data)
 
 static void init_proc_G2(CPUPPCState *env)
 {
-    gen_spr_ne_601(env);
-    gen_spr_sdr1(env);
-    gen_spr_G2_755(env);
-    gen_spr_G2(env);
+    register_ne_601_sprs(env);
+    register_sdr1_sprs(env);
+    register_G2_755_sprs(env);
+    register_G2_sprs(env);
     /* Time base */
-    gen_tbl(env);
+    register_tbl(env);
     /* External access control */
     /* XXX : not implemented */
     spr_register(env, SPR_EAR, "EAR",
@@ -4517,9 +4517,9 @@ static void init_proc_G2(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
-    gen_high_BATs(env);
-    gen_6xx_7xx_soft_tlb(env, 64, 2);
+    register_low_BATs(env);
+    register_high_BATs(env);
+    register_6xx_7xx_soft_tlb(env, 64, 2);
     init_excp_G2(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -4567,12 +4567,12 @@ POWERPC_FAMILY(G2)(ObjectClass *oc, void *data)
 
 static void init_proc_G2LE(CPUPPCState *env)
 {
-    gen_spr_ne_601(env);
-    gen_spr_sdr1(env);
-    gen_spr_G2_755(env);
-    gen_spr_G2(env);
+    register_ne_601_sprs(env);
+    register_sdr1_sprs(env);
+    register_G2_755_sprs(env);
+    register_G2_sprs(env);
     /* Time base */
-    gen_tbl(env);
+    register_tbl(env);
     /* External access control */
     /* XXX : not implemented */
     spr_register(env, SPR_EAR, "EAR",
@@ -4597,9 +4597,9 @@ static void init_proc_G2LE(CPUPPCState *env)
                  0x00000000);
 
     /* Memory management */
-    gen_low_BATs(env);
-    gen_high_BATs(env);
-    gen_6xx_7xx_soft_tlb(env, 64, 2);
+    register_low_BATs(env);
+    register_high_BATs(env);
+    register_6xx_7xx_soft_tlb(env, 64, 2);
     init_excp_G2(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -4650,15 +4650,15 @@ POWERPC_FAMILY(G2LE)(ObjectClass *oc, void *data)
 static void init_proc_e200(CPUPPCState *env)
 {
     /* Time base */
-    gen_tbl(env);
-    gen_spr_BookE(env, 0x000000070000FFFFULL);
+    register_tbl(env);
+    register_BookE_sprs(env, 0x000000070000FFFFULL);
     /* XXX : not implemented */
     spr_register(env, SPR_BOOKE_SPEFSCR, "SPEFSCR",
                  &spr_read_spefscr, &spr_write_spefscr,
                  &spr_read_spefscr, &spr_write_spefscr,
                  0x00000000);
     /* Memory management */
-    gen_spr_BookE206(env, 0x0000005D, NULL, 0);
+    register_BookE206_sprs(env, 0x0000005D, NULL, 0);
     /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -4804,11 +4804,11 @@ POWERPC_FAMILY(e200)(ObjectClass *oc, void *data)
 
 static void init_proc_e300(CPUPPCState *env)
 {
-    gen_spr_ne_601(env);
-    gen_spr_sdr1(env);
-    gen_spr_603(env);
+    register_ne_601_sprs(env);
+    register_sdr1_sprs(env);
+    register_603_sprs(env);
     /* Time base */
-    gen_tbl(env);
+    register_tbl(env);
     /* hardware implementation registers */
     /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
@@ -4852,9 +4852,9 @@ static void init_proc_e300(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
-    gen_high_BATs(env);
-    gen_6xx_7xx_soft_tlb(env, 64, 2);
+    register_low_BATs(env);
+    register_high_BATs(env);
+    register_6xx_7xx_soft_tlb(env, 64, 2);
     init_excp_603(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -4950,11 +4950,11 @@ static void init_proc_e500(CPUPPCState *env, int version)
 #endif
 
     /* Time base */
-    gen_tbl(env);
+    register_tbl(env);
     /*
      * XXX The e500 doesn't implement IVOR7 and IVOR9, but doesn't
      *     complain when accessing them.
-     * gen_spr_BookE(env, 0x0000000F0000FD7FULL);
+     * register_BookE_sprs(env, 0x0000000F0000FD7FULL);
      */
     switch (version) {
     case fsl_e500v1:
@@ -4970,8 +4970,8 @@ static void init_proc_e500(CPUPPCState *env, int version)
         ivor_mask = 0x000003FF0000FFFFULL;
         break;
     }
-    gen_spr_BookE(env, ivor_mask);
-    gen_spr_usprg3(env);
+    register_BookE_sprs(env, ivor_mask);
+    register_usprg3_sprs(env);
     /* Processor identification */
     spr_register(env, SPR_BOOKE_PIR, "PIR",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -4989,17 +4989,17 @@ static void init_proc_e500(CPUPPCState *env, int version)
     env->id_tlbs = 0;
     switch (version) {
     case fsl_e500v1:
-        tlbncfg[0] = gen_tlbncfg(2, 1, 1, 0, 256);
-        tlbncfg[1] = gen_tlbncfg(16, 1, 9, TLBnCFG_AVAIL | TLBnCFG_IPROT, 16);
+        tlbncfg[0] = register_tlbncfg(2, 1, 1, 0, 256);
+        tlbncfg[1] = register_tlbncfg(16, 1, 9, TLBnCFG_AVAIL | TLBnCFG_IPROT, 16);
         break;
     case fsl_e500v2:
-        tlbncfg[0] = gen_tlbncfg(4, 1, 1, 0, 512);
-        tlbncfg[1] = gen_tlbncfg(16, 1, 12, TLBnCFG_AVAIL | TLBnCFG_IPROT, 16);
+        tlbncfg[0] = register_tlbncfg(4, 1, 1, 0, 512);
+        tlbncfg[1] = register_tlbncfg(16, 1, 12, TLBnCFG_AVAIL | TLBnCFG_IPROT, 16);
         break;
     case fsl_e500mc:
     case fsl_e5500:
-        tlbncfg[0] = gen_tlbncfg(4, 1, 1, 0, 512);
-        tlbncfg[1] = gen_tlbncfg(64, 1, 12, TLBnCFG_AVAIL | TLBnCFG_IPROT, 64);
+        tlbncfg[0] = register_tlbncfg(4, 1, 1, 0, 512);
+        tlbncfg[1] = register_tlbncfg(64, 1, 12, TLBnCFG_AVAIL | TLBnCFG_IPROT, 64);
         break;
     case fsl_e6500:
         mmucfg = 0x6510B45;
@@ -5036,7 +5036,7 @@ static void init_proc_e500(CPUPPCState *env, int version)
         cpu_abort(env_cpu(env), "Unknown CPU: " TARGET_FMT_lx "\n",
                   env->spr[SPR_PVR]);
     }
-    gen_spr_BookE206(env, 0x000000DF, tlbncfg, mmucfg);
+    register_BookE206_sprs(env, 0x000000DF, tlbncfg, mmucfg);
     /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -5394,9 +5394,9 @@ POWERPC_FAMILY(e6500)(ObjectClass *oc, void *data)
 
 static void init_proc_601(CPUPPCState *env)
 {
-    gen_spr_ne_601(env);
-    gen_spr_sdr1(env);
-    gen_spr_601(env);
+    register_ne_601_sprs(env);
+    register_sdr1_sprs(env);
+    register_601_sprs(env);
     /* Hardware implementation registers */
     /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
@@ -5510,11 +5510,11 @@ POWERPC_FAMILY(601v)(ObjectClass *oc, void *data)
 
 static void init_proc_602(CPUPPCState *env)
 {
-    gen_spr_ne_601(env);
-    gen_spr_sdr1(env);
-    gen_spr_602(env);
+    register_ne_601_sprs(env);
+    register_sdr1_sprs(env);
+    register_602_sprs(env);
     /* Time base */
-    gen_tbl(env);
+    register_tbl(env);
     /* hardware implementation registers */
     /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
@@ -5527,8 +5527,8 @@ static void init_proc_602(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
-    gen_6xx_7xx_soft_tlb(env, 64, 2);
+    register_low_BATs(env);
+    register_6xx_7xx_soft_tlb(env, 64, 2);
     init_excp_602(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -5580,11 +5580,11 @@ POWERPC_FAMILY(602)(ObjectClass *oc, void *data)
 
 static void init_proc_603(CPUPPCState *env)
 {
-    gen_spr_ne_601(env);
-    gen_spr_sdr1(env);
-    gen_spr_603(env);
+    register_ne_601_sprs(env);
+    register_sdr1_sprs(env);
+    register_603_sprs(env);
     /* Time base */
-    gen_tbl(env);
+    register_tbl(env);
     /* hardware implementation registers */
     /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
@@ -5597,8 +5597,8 @@ static void init_proc_603(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
-    gen_6xx_7xx_soft_tlb(env, 64, 2);
+    register_low_BATs(env);
+    register_6xx_7xx_soft_tlb(env, 64, 2);
     init_excp_603(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -5647,11 +5647,11 @@ POWERPC_FAMILY(603)(ObjectClass *oc, void *data)
 
 static void init_proc_603E(CPUPPCState *env)
 {
-    gen_spr_ne_601(env);
-    gen_spr_sdr1(env);
-    gen_spr_603(env);
+    register_ne_601_sprs(env);
+    register_sdr1_sprs(env);
+    register_603_sprs(env);
     /* Time base */
-    gen_tbl(env);
+    register_tbl(env);
     /* hardware implementation registers */
     /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
@@ -5664,8 +5664,8 @@ static void init_proc_603E(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
-    gen_6xx_7xx_soft_tlb(env, 64, 2);
+    register_low_BATs(env);
+    register_6xx_7xx_soft_tlb(env, 64, 2);
     init_excp_603(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -5714,11 +5714,11 @@ POWERPC_FAMILY(603E)(ObjectClass *oc, void *data)
 
 static void init_proc_604(CPUPPCState *env)
 {
-    gen_spr_ne_601(env);
-    gen_spr_sdr1(env);
-    gen_spr_604(env);
+    register_ne_601_sprs(env);
+    register_sdr1_sprs(env);
+    register_604_sprs(env);
     /* Time base */
-    gen_tbl(env);
+    register_tbl(env);
     /* Hardware implementation registers */
     /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
@@ -5726,7 +5726,7 @@ static void init_proc_604(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
+    register_low_BATs(env);
     init_excp_604(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -5778,9 +5778,9 @@ POWERPC_FAMILY(604)(ObjectClass *oc, void *data)
 
 static void init_proc_604E(CPUPPCState *env)
 {
-    gen_spr_ne_601(env);
-    gen_spr_sdr1(env);
-    gen_spr_604(env);
+    register_ne_601_sprs(env);
+    register_sdr1_sprs(env);
+    register_604_sprs(env);
     /* XXX : not implemented */
     spr_register(env, SPR_7XX_MMCR1, "MMCR1",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -5797,7 +5797,7 @@ static void init_proc_604E(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Time base */
-    gen_tbl(env);
+    register_tbl(env);
     /* Hardware implementation registers */
     /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
@@ -5810,7 +5810,7 @@ static void init_proc_604E(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
+    register_low_BATs(env);
     init_excp_604(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -5862,13 +5862,13 @@ POWERPC_FAMILY(604E)(ObjectClass *oc, void *data)
 
 static void init_proc_740(CPUPPCState *env)
 {
-    gen_spr_ne_601(env);
-    gen_spr_sdr1(env);
-    gen_spr_7xx(env);
+    register_ne_601_sprs(env);
+    register_sdr1_sprs(env);
+    register_7xx_sprs(env);
     /* Time base */
-    gen_tbl(env);
+    register_tbl(env);
     /* Thermal management */
-    gen_spr_thrm(env);
+    register_thrm_sprs(env);
     /* Hardware implementation registers */
     /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
@@ -5881,7 +5881,7 @@ static void init_proc_740(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
+    register_low_BATs(env);
     init_excp_7x0(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -5933,18 +5933,18 @@ POWERPC_FAMILY(740)(ObjectClass *oc, void *data)
 
 static void init_proc_750(CPUPPCState *env)
 {
-    gen_spr_ne_601(env);
-    gen_spr_sdr1(env);
-    gen_spr_7xx(env);
+    register_ne_601_sprs(env);
+    register_sdr1_sprs(env);
+    register_7xx_sprs(env);
     /* XXX : not implemented */
     spr_register(env, SPR_L2CR, "L2CR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
                  0x00000000);
     /* Time base */
-    gen_tbl(env);
+    register_tbl(env);
     /* Thermal management */
-    gen_spr_thrm(env);
+    register_thrm_sprs(env);
     /* Hardware implementation registers */
     /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
@@ -5957,7 +5957,7 @@ static void init_proc_750(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
+    register_low_BATs(env);
     /*
      * XXX: high BATs are also present but are known to be bugged on
      *      die version 1.x
@@ -6013,16 +6013,16 @@ POWERPC_FAMILY(750)(ObjectClass *oc, void *data)
 
 static void init_proc_750cl(CPUPPCState *env)
 {
-    gen_spr_ne_601(env);
-    gen_spr_sdr1(env);
-    gen_spr_7xx(env);
+    register_ne_601_sprs(env);
+    register_sdr1_sprs(env);
+    register_7xx_sprs(env);
     /* XXX : not implemented */
     spr_register(env, SPR_L2CR, "L2CR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
                  0x00000000);
     /* Time base */
-    gen_tbl(env);
+    register_tbl(env);
     /* Thermal management */
     /* Those registers are fake on 750CL */
     spr_register(env, SPR_THRM1, "THRM1",
@@ -6123,9 +6123,9 @@ static void init_proc_750cl(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
+    register_low_BATs(env);
     /* PowerPC 750cl has 8 DBATs and 8 IBATs */
-    gen_high_BATs(env);
+    register_high_BATs(env);
     init_excp_750cl(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -6216,18 +6216,18 @@ POWERPC_FAMILY(750cl)(ObjectClass *oc, void *data)
 
 static void init_proc_750cx(CPUPPCState *env)
 {
-    gen_spr_ne_601(env);
-    gen_spr_sdr1(env);
-    gen_spr_7xx(env);
+    register_ne_601_sprs(env);
+    register_sdr1_sprs(env);
+    register_7xx_sprs(env);
     /* XXX : not implemented */
     spr_register(env, SPR_L2CR, "L2CR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
                  0x00000000);
     /* Time base */
-    gen_tbl(env);
+    register_tbl(env);
     /* Thermal management */
-    gen_spr_thrm(env);
+    register_thrm_sprs(env);
     /* This register is not implemented but is present for compatibility */
     spr_register(env, SPR_SDA, "SDA",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -6245,9 +6245,9 @@ static void init_proc_750cx(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
+    register_low_BATs(env);
     /* PowerPC 750cx has 8 DBATs and 8 IBATs */
-    gen_high_BATs(env);
+    register_high_BATs(env);
     init_excp_750cx(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -6299,18 +6299,18 @@ POWERPC_FAMILY(750cx)(ObjectClass *oc, void *data)
 
 static void init_proc_750fx(CPUPPCState *env)
 {
-    gen_spr_ne_601(env);
-    gen_spr_sdr1(env);
-    gen_spr_7xx(env);
+    register_ne_601_sprs(env);
+    register_sdr1_sprs(env);
+    register_7xx_sprs(env);
     /* XXX : not implemented */
     spr_register(env, SPR_L2CR, "L2CR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
                  0x00000000);
     /* Time base */
-    gen_tbl(env);
+    register_tbl(env);
     /* Thermal management */
-    gen_spr_thrm(env);
+    register_thrm_sprs(env);
     /* XXX : not implemented */
     spr_register(env, SPR_750_THRM4, "THRM4",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -6333,9 +6333,9 @@ static void init_proc_750fx(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
+    register_low_BATs(env);
     /* PowerPC 750fx & 750gx has 8 DBATs and 8 IBATs */
-    gen_high_BATs(env);
+    register_high_BATs(env);
     init_excp_7x0(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -6387,18 +6387,18 @@ POWERPC_FAMILY(750fx)(ObjectClass *oc, void *data)
 
 static void init_proc_750gx(CPUPPCState *env)
 {
-    gen_spr_ne_601(env);
-    gen_spr_sdr1(env);
-    gen_spr_7xx(env);
+    register_ne_601_sprs(env);
+    register_sdr1_sprs(env);
+    register_7xx_sprs(env);
     /* XXX : not implemented (XXX: different from 750fx) */
     spr_register(env, SPR_L2CR, "L2CR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
                  0x00000000);
     /* Time base */
-    gen_tbl(env);
+    register_tbl(env);
     /* Thermal management */
-    gen_spr_thrm(env);
+    register_thrm_sprs(env);
     /* XXX : not implemented */
     spr_register(env, SPR_750_THRM4, "THRM4",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -6421,9 +6421,9 @@ static void init_proc_750gx(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
+    register_low_BATs(env);
     /* PowerPC 750fx & 750gx has 8 DBATs and 8 IBATs */
-    gen_high_BATs(env);
+    register_high_BATs(env);
     init_excp_7x0(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -6475,14 +6475,14 @@ POWERPC_FAMILY(750gx)(ObjectClass *oc, void *data)
 
 static void init_proc_745(CPUPPCState *env)
 {
-    gen_spr_ne_601(env);
-    gen_spr_sdr1(env);
-    gen_spr_7xx(env);
-    gen_spr_G2_755(env);
+    register_ne_601_sprs(env);
+    register_sdr1_sprs(env);
+    register_7xx_sprs(env);
+    register_G2_755_sprs(env);
     /* Time base */
-    gen_tbl(env);
+    register_tbl(env);
     /* Thermal management */
-    gen_spr_thrm(env);
+    register_thrm_sprs(env);
     /* Hardware implementation registers */
     /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
@@ -6500,9 +6500,9 @@ static void init_proc_745(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
-    gen_high_BATs(env);
-    gen_6xx_7xx_soft_tlb(env, 64, 2);
+    register_low_BATs(env);
+    register_high_BATs(env);
+    register_6xx_7xx_soft_tlb(env, 64, 2);
     init_excp_7x5(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -6551,12 +6551,12 @@ POWERPC_FAMILY(745)(ObjectClass *oc, void *data)
 
 static void init_proc_755(CPUPPCState *env)
 {
-    gen_spr_ne_601(env);
-    gen_spr_sdr1(env);
-    gen_spr_7xx(env);
-    gen_spr_G2_755(env);
+    register_ne_601_sprs(env);
+    register_sdr1_sprs(env);
+    register_7xx_sprs(env);
+    register_G2_755_sprs(env);
     /* Time base */
-    gen_tbl(env);
+    register_tbl(env);
     /* L2 cache control */
     /* XXX : not implemented */
     spr_register(env, SPR_L2CR, "L2CR",
@@ -6569,7 +6569,7 @@ static void init_proc_755(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Thermal management */
-    gen_spr_thrm(env);
+    register_thrm_sprs(env);
     /* Hardware implementation registers */
     /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
@@ -6587,9 +6587,9 @@ static void init_proc_755(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
-    gen_high_BATs(env);
-    gen_6xx_7xx_soft_tlb(env, 64, 2);
+    register_low_BATs(env);
+    register_high_BATs(env);
+    register_6xx_7xx_soft_tlb(env, 64, 2);
     init_excp_7x5(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -6638,13 +6638,13 @@ POWERPC_FAMILY(755)(ObjectClass *oc, void *data)
 
 static void init_proc_7400(CPUPPCState *env)
 {
-    gen_spr_ne_601(env);
-    gen_spr_sdr1(env);
-    gen_spr_7xx(env);
+    register_ne_601_sprs(env);
+    register_sdr1_sprs(env);
+    register_7xx_sprs(env);
     /* Time base */
-    gen_tbl(env);
+    register_tbl(env);
     /* 74xx specific SPR */
-    gen_spr_74xx(env);
+    register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
     /* XXX : not implemented */
     spr_register(env, SPR_UBAMR, "UBAMR",
@@ -6658,9 +6658,9 @@ static void init_proc_7400(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Thermal management */
-    gen_spr_thrm(env);
+    register_thrm_sprs(env);
     /* Memory management */
-    gen_low_BATs(env);
+    register_low_BATs(env);
     init_excp_7400(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -6718,13 +6718,13 @@ POWERPC_FAMILY(7400)(ObjectClass *oc, void *data)
 
 static void init_proc_7410(CPUPPCState *env)
 {
-    gen_spr_ne_601(env);
-    gen_spr_sdr1(env);
-    gen_spr_7xx(env);
+    register_ne_601_sprs(env);
+    register_sdr1_sprs(env);
+    register_7xx_sprs(env);
     /* Time base */
-    gen_tbl(env);
+    register_tbl(env);
     /* 74xx specific SPR */
-    gen_spr_74xx(env);
+    register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
     /* XXX : not implemented */
     spr_register(env, SPR_UBAMR, "UBAMR",
@@ -6732,7 +6732,7 @@ static void init_proc_7410(CPUPPCState *env)
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
     /* Thermal management */
-    gen_spr_thrm(env);
+    register_thrm_sprs(env);
     /* L2PMCR */
     /* XXX : not implemented */
     spr_register(env, SPR_L2PMCR, "L2PMCR",
@@ -6746,7 +6746,7 @@ static void init_proc_7410(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
+    register_low_BATs(env);
     init_excp_7400(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -6804,13 +6804,13 @@ POWERPC_FAMILY(7410)(ObjectClass *oc, void *data)
 
 static void init_proc_7440(CPUPPCState *env)
 {
-    gen_spr_ne_601(env);
-    gen_spr_sdr1(env);
-    gen_spr_7xx(env);
+    register_ne_601_sprs(env);
+    register_sdr1_sprs(env);
+    register_7xx_sprs(env);
     /* Time base */
-    gen_tbl(env);
+    register_tbl(env);
     /* 74xx specific SPR */
-    gen_spr_74xx(env);
+    register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
     /* XXX : not implemented */
     spr_register(env, SPR_UBAMR, "UBAMR",
@@ -6857,8 +6857,8 @@ static void init_proc_7440(CPUPPCState *env)
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
-    gen_74xx_soft_tlb(env, 128, 2);
+    register_low_BATs(env);
+    register_74xx_soft_tlb(env, 128, 2);
     init_excp_7450(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -6913,16 +6913,16 @@ POWERPC_FAMILY(7440)(ObjectClass *oc, void *data)
 
 static void init_proc_7450(CPUPPCState *env)
 {
-    gen_spr_ne_601(env);
-    gen_spr_sdr1(env);
-    gen_spr_7xx(env);
+    register_ne_601_sprs(env);
+    register_sdr1_sprs(env);
+    register_7xx_sprs(env);
     /* Time base */
-    gen_tbl(env);
+    register_tbl(env);
     /* 74xx specific SPR */
-    gen_spr_74xx(env);
+    register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
     /* Level 3 cache control */
-    gen_l3_ctrl(env);
+    register_l3_ctrl(env);
     /* L3ITCR1 */
     /* XXX : not implemented */
     spr_register(env, SPR_L3ITCR1, "L3ITCR1",
@@ -6992,8 +6992,8 @@ static void init_proc_7450(CPUPPCState *env)
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
-    gen_74xx_soft_tlb(env, 128, 2);
+    register_low_BATs(env);
+    register_74xx_soft_tlb(env, 128, 2);
     init_excp_7450(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -7048,13 +7048,13 @@ POWERPC_FAMILY(7450)(ObjectClass *oc, void *data)
 
 static void init_proc_7445(CPUPPCState *env)
 {
-    gen_spr_ne_601(env);
-    gen_spr_sdr1(env);
-    gen_spr_7xx(env);
+    register_ne_601_sprs(env);
+    register_sdr1_sprs(env);
+    register_7xx_sprs(env);
     /* Time base */
-    gen_tbl(env);
+    register_tbl(env);
     /* 74xx specific SPR */
-    gen_spr_74xx(env);
+    register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
     /* LDSTCR */
     /* XXX : not implemented */
@@ -7129,9 +7129,9 @@ static void init_proc_7445(CPUPPCState *env)
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
-    gen_high_BATs(env);
-    gen_74xx_soft_tlb(env, 128, 2);
+    register_low_BATs(env);
+    register_high_BATs(env);
+    register_74xx_soft_tlb(env, 128, 2);
     init_excp_7450(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -7186,16 +7186,16 @@ POWERPC_FAMILY(7445)(ObjectClass *oc, void *data)
 
 static void init_proc_7455(CPUPPCState *env)
 {
-    gen_spr_ne_601(env);
-    gen_spr_sdr1(env);
-    gen_spr_7xx(env);
+    register_ne_601_sprs(env);
+    register_sdr1_sprs(env);
+    register_7xx_sprs(env);
     /* Time base */
-    gen_tbl(env);
+    register_tbl(env);
     /* 74xx specific SPR */
-    gen_spr_74xx(env);
+    register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
     /* Level 3 cache control */
-    gen_l3_ctrl(env);
+    register_l3_ctrl(env);
     /* LDSTCR */
     /* XXX : not implemented */
     spr_register(env, SPR_LDSTCR, "LDSTCR",
@@ -7269,9 +7269,9 @@ static void init_proc_7455(CPUPPCState *env)
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
-    gen_high_BATs(env);
-    gen_74xx_soft_tlb(env, 128, 2);
+    register_low_BATs(env);
+    register_high_BATs(env);
+    register_74xx_soft_tlb(env, 128, 2);
     init_excp_7450(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -7326,16 +7326,16 @@ POWERPC_FAMILY(7455)(ObjectClass *oc, void *data)
 
 static void init_proc_7457(CPUPPCState *env)
 {
-    gen_spr_ne_601(env);
-    gen_spr_sdr1(env);
-    gen_spr_7xx(env);
+    register_ne_601_sprs(env);
+    register_sdr1_sprs(env);
+    register_7xx_sprs(env);
     /* Time base */
-    gen_tbl(env);
+    register_tbl(env);
     /* 74xx specific SPR */
-    gen_spr_74xx(env);
+    register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
     /* Level 3 cache control */
-    gen_l3_ctrl(env);
+    register_l3_ctrl(env);
     /* L3ITCR1 */
     /* XXX : not implemented */
     spr_register(env, SPR_L3ITCR1, "L3ITCR1",
@@ -7433,9 +7433,9 @@ static void init_proc_7457(CPUPPCState *env)
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
-    gen_high_BATs(env);
-    gen_74xx_soft_tlb(env, 128, 2);
+    register_low_BATs(env);
+    register_high_BATs(env);
+    register_74xx_soft_tlb(env, 128, 2);
     init_excp_7450(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -7490,13 +7490,13 @@ POWERPC_FAMILY(7457)(ObjectClass *oc, void *data)
 
 static void init_proc_e600(CPUPPCState *env)
 {
-    gen_spr_ne_601(env);
-    gen_spr_sdr1(env);
-    gen_spr_7xx(env);
+    register_ne_601_sprs(env);
+    register_sdr1_sprs(env);
+    register_7xx_sprs(env);
     /* Time base */
-    gen_tbl(env);
+    register_tbl(env);
     /* 74xx specific SPR */
-    gen_spr_74xx(env);
+    register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
     /* XXX : not implemented */
     spr_register(env, SPR_UBAMR, "UBAMR",
@@ -7572,9 +7572,9 @@ static void init_proc_e600(CPUPPCState *env)
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
-    gen_high_BATs(env);
-    gen_74xx_soft_tlb(env, 128, 2);
+    register_low_BATs(env);
+    register_high_BATs(env);
+    register_74xx_soft_tlb(env, 128, 2);
     init_excp_7450(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -7699,7 +7699,7 @@ static int check_pow_970(CPUPPCState *env)
     return 0;
 }
 
-static void gen_spr_970_hid(CPUPPCState *env)
+static void register_970_hid_sprs(CPUPPCState *env)
 {
     /* Hardware implementation registers */
     /* XXX : not implemented */
@@ -7717,7 +7717,7 @@ static void gen_spr_970_hid(CPUPPCState *env)
                  POWERPC970_HID5_INIT);
 }
 
-static void gen_spr_970_hior(CPUPPCState *env)
+static void register_970_hior_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_HIOR, "SPR_HIOR",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -7725,7 +7725,7 @@ static void gen_spr_970_hior(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_book3s_ctrl(CPUPPCState *env)
+static void register_book3s_ctrl_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_CTRL, "SPR_CTRL",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -7737,7 +7737,7 @@ static void gen_spr_book3s_ctrl(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_book3s_altivec(CPUPPCState *env)
+static void register_book3s_altivec_sprs(CPUPPCState *env)
 {
     if (!(env->insns_flags & PPC_ALTIVEC)) {
         return;
@@ -7750,7 +7750,7 @@ static void gen_spr_book3s_altivec(CPUPPCState *env)
 
 }
 
-static void gen_spr_book3s_dbg(CPUPPCState *env)
+static void register_book3s_dbg_sprs(CPUPPCState *env)
 {
     /*
      * TODO: different specs define different scopes for these,
@@ -7769,7 +7769,7 @@ static void gen_spr_book3s_dbg(CPUPPCState *env)
                      KVM_REG_PPC_DABRX, 0x00000000);
 }
 
-static void gen_spr_book3s_207_dbg(CPUPPCState *env)
+static void register_book3s_207_dbg_sprs(CPUPPCState *env)
 {
     spr_register_kvm_hv(env, SPR_DAWR, "DAWR",
                         SPR_NOACCESS, SPR_NOACCESS,
@@ -7788,7 +7788,7 @@ static void gen_spr_book3s_207_dbg(CPUPPCState *env)
                         KVM_REG_PPC_CIABR, 0x00000000);
 }
 
-static void gen_spr_970_dbg(CPUPPCState *env)
+static void register_970_dbg_sprs(CPUPPCState *env)
 {
     /* Breakpoints */
     spr_register(env, SPR_IABR, "IABR",
@@ -7797,7 +7797,7 @@ static void gen_spr_970_dbg(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_book3s_pmu_sup(CPUPPCState *env)
+static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
 {
     spr_register_kvm(env, SPR_POWER_MMCR0, "MMCR0",
                      SPR_NOACCESS, SPR_NOACCESS,
@@ -7845,7 +7845,7 @@ static void gen_spr_book3s_pmu_sup(CPUPPCState *env)
                      KVM_REG_PPC_SDAR, 0x00000000);
 }
 
-static void gen_spr_book3s_pmu_user(CPUPPCState *env)
+static void register_book3s_pmu_user_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
                  &spr_read_ureg, SPR_NOACCESS,
@@ -7893,7 +7893,7 @@ static void gen_spr_book3s_pmu_user(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_970_pmu_sup(CPUPPCState *env)
+static void register_970_pmu_sup_sprs(CPUPPCState *env)
 {
     spr_register_kvm(env, SPR_970_PMC7, "PMC7",
                      SPR_NOACCESS, SPR_NOACCESS,
@@ -7905,7 +7905,7 @@ static void gen_spr_970_pmu_sup(CPUPPCState *env)
                      KVM_REG_PPC_PMC8, 0x00000000);
 }
 
-static void gen_spr_970_pmu_user(CPUPPCState *env)
+static void register_970_pmu_user_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_970_UPMC7, "UPMC7",
                  &spr_read_ureg, SPR_NOACCESS,
@@ -7917,7 +7917,7 @@ static void gen_spr_970_pmu_user(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_power8_pmu_sup(CPUPPCState *env)
+static void register_power8_pmu_sup_sprs(CPUPPCState *env)
 {
     spr_register_kvm(env, SPR_POWER_MMCR2, "MMCR2",
                      SPR_NOACCESS, SPR_NOACCESS,
@@ -7953,7 +7953,7 @@ static void gen_spr_power8_pmu_sup(CPUPPCState *env)
                      KVM_REG_PPC_CSIGR, 0x00000000);
 }
 
-static void gen_spr_power8_pmu_user(CPUPPCState *env)
+static void register_power8_pmu_user_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_POWER_UMMCR2, "UMMCR2",
                  &spr_read_ureg, SPR_NOACCESS,
@@ -7965,7 +7965,7 @@ static void gen_spr_power8_pmu_user(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_power5p_ear(CPUPPCState *env)
+static void register_power5p_ear_sprs(CPUPPCState *env)
 {
     /* External access control */
     spr_register(env, SPR_EAR, "EAR",
@@ -7974,7 +7974,7 @@ static void gen_spr_power5p_ear(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_power5p_tb(CPUPPCState *env)
+static void register_power5p_tb_sprs(CPUPPCState *env)
 {
     /* TBU40 (High 40 bits of the Timebase register */
     spr_register_hv(env, SPR_TBU40, "TBU40",
@@ -8002,7 +8002,7 @@ static void spr_write_lpcr(DisasContext *ctx, int sprn, int gprn)
 }
 #endif /* !defined(CONFIG_USER_ONLY) */
 
-static void gen_spr_970_lpar(CPUPPCState *env)
+static void register_970_lpar_sprs(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     /*
@@ -8019,7 +8019,7 @@ static void gen_spr_970_lpar(CPUPPCState *env)
 #endif
 }
 
-static void gen_spr_power5p_lpar(CPUPPCState *env)
+static void register_power5p_lpar_sprs(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     /* Logical partitionning */
@@ -8035,7 +8035,7 @@ static void gen_spr_power5p_lpar(CPUPPCState *env)
 #endif
 }
 
-static void gen_spr_book3s_ids(CPUPPCState *env)
+static void register_book3s_ids_sprs(CPUPPCState *env)
 {
     /* FIXME: Will need to deal with thread vs core only SPRs */
 
@@ -8127,7 +8127,7 @@ static void gen_spr_book3s_ids(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_rmor(CPUPPCState *env)
+static void register_rmor_sprs(CPUPPCState *env)
 {
     spr_register_hv(env, SPR_RMOR, "RMOR",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -8136,7 +8136,7 @@ static void gen_spr_rmor(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_power8_ids(CPUPPCState *env)
+static void register_power8_ids_sprs(CPUPPCState *env)
 {
     /* Thread identification */
     spr_register(env, SPR_TIR, "TIR",
@@ -8145,7 +8145,7 @@ static void gen_spr_power8_ids(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_book3s_purr(CPUPPCState *env)
+static void register_book3s_purr_sprs(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     /* PURR & SPURR: Hack - treat these as aliases for the TB for now */
@@ -8162,7 +8162,7 @@ static void gen_spr_book3s_purr(CPUPPCState *env)
 #endif
 }
 
-static void gen_spr_power6_dbg(CPUPPCState *env)
+static void register_power6_dbg_sprs(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     spr_register(env, SPR_CFAR, "SPR_CFAR",
@@ -8172,7 +8172,7 @@ static void gen_spr_power6_dbg(CPUPPCState *env)
 #endif
 }
 
-static void gen_spr_power5p_common(CPUPPCState *env)
+static void register_power5p_common_sprs(CPUPPCState *env)
 {
     spr_register_kvm(env, SPR_PPR, "PPR",
                      &spr_read_generic, &spr_write_generic,
@@ -8180,7 +8180,7 @@ static void gen_spr_power5p_common(CPUPPCState *env)
                      KVM_REG_PPC_PPR, 0x00000000);
 }
 
-static void gen_spr_power6_common(CPUPPCState *env)
+static void register_power6_common_sprs(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     spr_register_kvm(env, SPR_DSCR, "SPR_DSCR",
@@ -8211,7 +8211,7 @@ static void spr_write_tar(DisasContext *ctx, int sprn, int gprn)
     spr_write_generic(ctx, sprn, gprn);
 }
 
-static void gen_spr_power8_tce_address_control(CPUPPCState *env)
+static void register_power8_tce_address_control_sprs(CPUPPCState *env)
 {
     spr_register_kvm(env, SPR_TAR, "TAR",
                      &spr_read_tar, &spr_write_tar,
@@ -8243,7 +8243,7 @@ static void spr_write_tm_upper32(DisasContext *ctx, int sprn, int gprn)
     spr_write_prev_upper32(ctx, sprn, gprn);
 }
 
-static void gen_spr_power8_tm(CPUPPCState *env)
+static void register_power8_tm_sprs(CPUPPCState *env)
 {
     spr_register_kvm(env, SPR_TFHAR, "TFHAR",
                      &spr_read_tm, &spr_write_tm,
@@ -8287,7 +8287,7 @@ static void spr_write_ebb_upper32(DisasContext *ctx, int sprn, int gprn)
     spr_write_prev_upper32(ctx, sprn, gprn);
 }
 
-static void gen_spr_power8_ebb(CPUPPCState *env)
+static void register_power8_ebb_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_BESCRS, "BESCRS",
                  &spr_read_ebb, &spr_write_ebb,
@@ -8320,7 +8320,7 @@ static void gen_spr_power8_ebb(CPUPPCState *env)
 }
 
 /* Virtual Time Base */
-static void gen_spr_vtb(CPUPPCState *env)
+static void register_vtb_sprs(CPUPPCState *env)
 {
     spr_register_kvm_hv(env, SPR_VTB, "VTB",
                         SPR_NOACCESS, SPR_NOACCESS,
@@ -8329,7 +8329,7 @@ static void gen_spr_vtb(CPUPPCState *env)
                         KVM_REG_PPC_VTB, 0x00000000);
 }
 
-static void gen_spr_power8_fscr(CPUPPCState *env)
+static void register_power8_fscr_sprs(CPUPPCState *env)
 {
 #if defined(CONFIG_USER_ONLY)
     target_ulong initval = 1ULL << FSCR_TAR;
@@ -8342,7 +8342,7 @@ static void gen_spr_power8_fscr(CPUPPCState *env)
                      KVM_REG_PPC_FSCR, initval);
 }
 
-static void gen_spr_power8_pspb(CPUPPCState *env)
+static void register_power8_pspb_sprs(CPUPPCState *env)
 {
     spr_register_kvm(env, SPR_PSPB, "PSPB",
                      SPR_NOACCESS, SPR_NOACCESS,
@@ -8350,7 +8350,7 @@ static void gen_spr_power8_pspb(CPUPPCState *env)
                      KVM_REG_PPC_PSPB, 0);
 }
 
-static void gen_spr_power8_dpdes(CPUPPCState *env)
+static void register_power8_dpdes_sprs(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     /* Directed Privileged Door-bell Exception State, used for IPI */
@@ -8362,7 +8362,7 @@ static void gen_spr_power8_dpdes(CPUPPCState *env)
 #endif
 }
 
-static void gen_spr_power8_ic(CPUPPCState *env)
+static void register_power8_ic_sprs(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     spr_register_hv(env, SPR_IC, "IC",
@@ -8373,7 +8373,7 @@ static void gen_spr_power8_ic(CPUPPCState *env)
 #endif
 }
 
-static void gen_spr_power8_book4(CPUPPCState *env)
+static void register_power8_book4_sprs(CPUPPCState *env)
 {
     /* Add a number of P8 book4 registers */
 #if !defined(CONFIG_USER_ONLY)
@@ -8392,7 +8392,7 @@ static void gen_spr_power8_book4(CPUPPCState *env)
 #endif
 }
 
-static void gen_spr_power7_book4(CPUPPCState *env)
+static void register_power7_book4_sprs(CPUPPCState *env)
 {
     /* Add a number of P7 book4 registers */
 #if !defined(CONFIG_USER_ONLY)
@@ -8407,7 +8407,7 @@ static void gen_spr_power7_book4(CPUPPCState *env)
 #endif
 }
 
-static void gen_spr_power8_rpr(CPUPPCState *env)
+static void register_power8_rpr_sprs(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     spr_register_hv(env, SPR_RPR, "RPR",
@@ -8418,7 +8418,7 @@ static void gen_spr_power8_rpr(CPUPPCState *env)
 #endif
 }
 
-static void gen_spr_power9_mmu(CPUPPCState *env)
+static void register_power9_mmu_sprs(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     /* Partition Table Control */
@@ -8438,13 +8438,13 @@ static void gen_spr_power9_mmu(CPUPPCState *env)
 
 static void init_proc_book3s_common(CPUPPCState *env)
 {
-    gen_spr_ne_601(env);
-    gen_tbl(env);
-    gen_spr_usprg3(env);
-    gen_spr_book3s_altivec(env);
-    gen_spr_book3s_pmu_sup(env);
-    gen_spr_book3s_pmu_user(env);
-    gen_spr_book3s_ctrl(env);
+    register_ne_601_sprs(env);
+    register_tbl(env);
+    register_usprg3_sprs(env);
+    register_book3s_altivec_sprs(env);
+    register_book3s_pmu_sup_sprs(env);
+    register_book3s_pmu_user_sprs(env);
+    register_book3s_ctrl_sprs(env);
     /*
      * Can't find information on what this should be on reset.  This
      * value is the one used by 74xx processors.
@@ -8456,17 +8456,17 @@ static void init_proc_970(CPUPPCState *env)
 {
     /* Common Registers */
     init_proc_book3s_common(env);
-    gen_spr_sdr1(env);
-    gen_spr_book3s_dbg(env);
+    register_sdr1_sprs(env);
+    register_book3s_dbg_sprs(env);
 
     /* 970 Specific Registers */
-    gen_spr_970_hid(env);
-    gen_spr_970_hior(env);
-    gen_low_BATs(env);
-    gen_spr_970_pmu_sup(env);
-    gen_spr_970_pmu_user(env);
-    gen_spr_970_lpar(env);
-    gen_spr_970_dbg(env);
+    register_970_hid_sprs(env);
+    register_970_hior_sprs(env);
+    register_low_BATs(env);
+    register_970_pmu_sup_sprs(env);
+    register_970_pmu_user_sprs(env);
+    register_970_lpar_sprs(env);
+    register_970_dbg_sprs(env);
 
     /* env variables */
     env->dcache_line_size = 128;
@@ -8529,19 +8529,19 @@ static void init_proc_power5plus(CPUPPCState *env)
 {
     /* Common Registers */
     init_proc_book3s_common(env);
-    gen_spr_sdr1(env);
-    gen_spr_book3s_dbg(env);
+    register_sdr1_sprs(env);
+    register_book3s_dbg_sprs(env);
 
     /* POWER5+ Specific Registers */
-    gen_spr_970_hid(env);
-    gen_spr_970_hior(env);
-    gen_low_BATs(env);
-    gen_spr_970_pmu_sup(env);
-    gen_spr_970_pmu_user(env);
-    gen_spr_power5p_common(env);
-    gen_spr_power5p_lpar(env);
-    gen_spr_power5p_ear(env);
-    gen_spr_power5p_tb(env);
+    register_970_hid_sprs(env);
+    register_970_hior_sprs(env);
+    register_low_BATs(env);
+    register_970_pmu_sup_sprs(env);
+    register_970_pmu_user_sprs(env);
+    register_power5p_common_sprs(env);
+    register_power5p_lpar_sprs(env);
+    register_power5p_ear_sprs(env);
+    register_power5p_tb_sprs(env);
 
     /* env variables */
     env->dcache_line_size = 128;
@@ -8608,21 +8608,21 @@ static void init_proc_POWER7(CPUPPCState *env)
 {
     /* Common Registers */
     init_proc_book3s_common(env);
-    gen_spr_sdr1(env);
-    gen_spr_book3s_dbg(env);
+    register_sdr1_sprs(env);
+    register_book3s_dbg_sprs(env);
 
     /* POWER7 Specific Registers */
-    gen_spr_book3s_ids(env);
-    gen_spr_rmor(env);
-    gen_spr_amr(env);
-    gen_spr_book3s_purr(env);
-    gen_spr_power5p_common(env);
-    gen_spr_power5p_lpar(env);
-    gen_spr_power5p_ear(env);
-    gen_spr_power5p_tb(env);
-    gen_spr_power6_common(env);
-    gen_spr_power6_dbg(env);
-    gen_spr_power7_book4(env);
+    register_book3s_ids_sprs(env);
+    register_rmor_sprs(env);
+    register_amr_sprs(env);
+    register_book3s_purr_sprs(env);
+    register_power5p_common_sprs(env);
+    register_power5p_lpar_sprs(env);
+    register_power5p_ear_sprs(env);
+    register_power5p_tb_sprs(env);
+    register_power6_common_sprs(env);
+    register_power6_dbg_sprs(env);
+    register_power7_book4_sprs(env);
 
     /* env variables */
     env->dcache_line_size = 128;
@@ -8754,34 +8754,34 @@ static void init_proc_POWER8(CPUPPCState *env)
 {
     /* Common Registers */
     init_proc_book3s_common(env);
-    gen_spr_sdr1(env);
-    gen_spr_book3s_207_dbg(env);
+    register_sdr1_sprs(env);
+    register_book3s_207_dbg_sprs(env);
 
     /* POWER8 Specific Registers */
-    gen_spr_book3s_ids(env);
-    gen_spr_rmor(env);
-    gen_spr_amr(env);
-    gen_spr_iamr(env);
-    gen_spr_book3s_purr(env);
-    gen_spr_power5p_common(env);
-    gen_spr_power5p_lpar(env);
-    gen_spr_power5p_ear(env);
-    gen_spr_power5p_tb(env);
-    gen_spr_power6_common(env);
-    gen_spr_power6_dbg(env);
-    gen_spr_power8_tce_address_control(env);
-    gen_spr_power8_ids(env);
-    gen_spr_power8_ebb(env);
-    gen_spr_power8_fscr(env);
-    gen_spr_power8_pmu_sup(env);
-    gen_spr_power8_pmu_user(env);
-    gen_spr_power8_tm(env);
-    gen_spr_power8_pspb(env);
-    gen_spr_power8_dpdes(env);
-    gen_spr_vtb(env);
-    gen_spr_power8_ic(env);
-    gen_spr_power8_book4(env);
-    gen_spr_power8_rpr(env);
+    register_book3s_ids_sprs(env);
+    register_rmor_sprs(env);
+    register_amr_sprs(env);
+    register_iamr_sprs(env);
+    register_book3s_purr_sprs(env);
+    register_power5p_common_sprs(env);
+    register_power5p_lpar_sprs(env);
+    register_power5p_ear_sprs(env);
+    register_power5p_tb_sprs(env);
+    register_power6_common_sprs(env);
+    register_power6_dbg_sprs(env);
+    register_power8_tce_address_control_sprs(env);
+    register_power8_ids_sprs(env);
+    register_power8_ebb_sprs(env);
+    register_power8_fscr_sprs(env);
+    register_power8_pmu_sup_sprs(env);
+    register_power8_pmu_user_sprs(env);
+    register_power8_tm_sprs(env);
+    register_power8_pspb_sprs(env);
+    register_power8_dpdes_sprs(env);
+    register_vtb_sprs(env);
+    register_power8_ic_sprs(env);
+    register_power8_book4_sprs(env);
+    register_power8_rpr_sprs(env);
 
     /* env variables */
     env->dcache_line_size = 128;
@@ -8951,33 +8951,33 @@ static void init_proc_POWER9(CPUPPCState *env)
 {
     /* Common Registers */
     init_proc_book3s_common(env);
-    gen_spr_book3s_207_dbg(env);
+    register_book3s_207_dbg_sprs(env);
 
     /* POWER8 Specific Registers */
-    gen_spr_book3s_ids(env);
-    gen_spr_amr(env);
-    gen_spr_iamr(env);
-    gen_spr_book3s_purr(env);
-    gen_spr_power5p_common(env);
-    gen_spr_power5p_lpar(env);
-    gen_spr_power5p_ear(env);
-    gen_spr_power5p_tb(env);
-    gen_spr_power6_common(env);
-    gen_spr_power6_dbg(env);
-    gen_spr_power8_tce_address_control(env);
-    gen_spr_power8_ids(env);
-    gen_spr_power8_ebb(env);
-    gen_spr_power8_fscr(env);
-    gen_spr_power8_pmu_sup(env);
-    gen_spr_power8_pmu_user(env);
-    gen_spr_power8_tm(env);
-    gen_spr_power8_pspb(env);
-    gen_spr_power8_dpdes(env);
-    gen_spr_vtb(env);
-    gen_spr_power8_ic(env);
-    gen_spr_power8_book4(env);
-    gen_spr_power8_rpr(env);
-    gen_spr_power9_mmu(env);
+    register_book3s_ids_sprs(env);
+    register_amr_sprs(env);
+    register_iamr_sprs(env);
+    register_book3s_purr_sprs(env);
+    register_power5p_common_sprs(env);
+    register_power5p_lpar_sprs(env);
+    register_power5p_ear_sprs(env);
+    register_power5p_tb_sprs(env);
+    register_power6_common_sprs(env);
+    register_power6_dbg_sprs(env);
+    register_power8_tce_address_control_sprs(env);
+    register_power8_ids_sprs(env);
+    register_power8_ebb_sprs(env);
+    register_power8_fscr_sprs(env);
+    register_power8_pmu_sup_sprs(env);
+    register_power8_pmu_user_sprs(env);
+    register_power8_tm_sprs(env);
+    register_power8_pspb_sprs(env);
+    register_power8_dpdes_sprs(env);
+    register_vtb_sprs(env);
+    register_power8_ic_sprs(env);
+    register_power8_book4_sprs(env);
+    register_power8_rpr_sprs(env);
+    register_power9_mmu_sprs(env);
 
     /* POWER9 Specific registers */
     spr_register_kvm(env, SPR_TIDR, "TIDR", NULL, NULL,
@@ -9169,31 +9169,31 @@ static void init_proc_POWER10(CPUPPCState *env)
 {
     /* Common Registers */
     init_proc_book3s_common(env);
-    gen_spr_book3s_207_dbg(env);
+    register_book3s_207_dbg_sprs(env);
 
     /* POWER8 Specific Registers */
-    gen_spr_book3s_ids(env);
-    gen_spr_amr(env);
-    gen_spr_iamr(env);
-    gen_spr_book3s_purr(env);
-    gen_spr_power5p_common(env);
-    gen_spr_power5p_lpar(env);
-    gen_spr_power5p_ear(env);
-    gen_spr_power6_common(env);
-    gen_spr_power6_dbg(env);
-    gen_spr_power8_tce_address_control(env);
-    gen_spr_power8_ids(env);
-    gen_spr_power8_ebb(env);
-    gen_spr_power8_fscr(env);
-    gen_spr_power8_pmu_sup(env);
-    gen_spr_power8_pmu_user(env);
-    gen_spr_power8_tm(env);
-    gen_spr_power8_pspb(env);
-    gen_spr_vtb(env);
-    gen_spr_power8_ic(env);
-    gen_spr_power8_book4(env);
-    gen_spr_power8_rpr(env);
-    gen_spr_power9_mmu(env);
+    register_book3s_ids_sprs(env);
+    register_amr_sprs(env);
+    register_iamr_sprs(env);
+    register_book3s_purr_sprs(env);
+    register_power5p_common_sprs(env);
+    register_power5p_lpar_sprs(env);
+    register_power5p_ear_sprs(env);
+    register_power6_common_sprs(env);
+    register_power6_dbg_sprs(env);
+    register_power8_tce_address_control_sprs(env);
+    register_power8_ids_sprs(env);
+    register_power8_ebb_sprs(env);
+    register_power8_fscr_sprs(env);
+    register_power8_pmu_sup_sprs(env);
+    register_power8_pmu_user_sprs(env);
+    register_power8_tm_sprs(env);
+    register_power8_pspb_sprs(env);
+    register_vtb_sprs(env);
+    register_power8_ic_sprs(env);
+    register_power8_book4_sprs(env);
+    register_power8_rpr_sprs(env);
+    register_power9_mmu_sprs(env);
 
     /* FIXME: Filter fields properly based on privilege level */
     spr_register_kvm_hv(env, SPR_PSSCR, "PSSCR", NULL, NULL, NULL, NULL,
@@ -9398,7 +9398,7 @@ static void init_ppc_proc(PowerPCCPU *cpu)
     env->tlb_type = TLB_NONE;
 #endif
     /* Register SPR common to all PowerPC implementations */
-    gen_spr_generic(env);
+    register_generic_sprs(env);
     spr_register(env, SPR_PVR, "PVR",
                  /* Linux permits userspace to read PVR */
 #if defined(CONFIG_LINUX_USER)
-- 
2.17.1


