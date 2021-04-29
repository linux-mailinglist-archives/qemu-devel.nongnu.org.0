Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BF836EE81
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 19:01:07 +0200 (CEST)
Received: from localhost ([::1]:56978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcA2E-0002vI-9E
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 13:01:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lc9Re-0004om-6U; Thu, 29 Apr 2021 12:23:18 -0400
Received: from [201.28.113.2] (port=34399 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lc9RY-0004Gz-Vr; Thu, 29 Apr 2021 12:23:17 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 29 Apr 2021 13:21:39 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 307E08013C2;
 Thu, 29 Apr 2021 13:21:39 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/7] target/ttc: renamed SPR registration functions
Date: Thu, 29 Apr 2021 13:21:29 -0300
Message-Id: <20210429162130.2412-7-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
References: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 29 Apr 2021 16:21:39.0368 (UTC)
 FILETIME=[BBB65280:01D73D13]
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

Renamed all gen_spr_* and gen_* functions specifically related to
registering SPRs to register_*_sprs and register_*, to avoid future
confusion with other TCG related code.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/translate_init.c.inc | 860 ++++++++++++++++----------------
 1 file changed, 430 insertions(+), 430 deletions(-)

diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index f470a8533e..b329e953cb 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -165,7 +165,7 @@ static inline void _spr_register(CPUPPCState *env, int num,
 }
 
 /* Generic PowerPC SPRs */
-static void gen_spr_generic(CPUPPCState *env)
+static void register_generic_sprs(CPUPPCState *env)
 {
     /* Integer processing */
     spr_register(env, SPR_XER, "XER",
@@ -210,7 +210,7 @@ static void gen_spr_generic(CPUPPCState *env)
 }
 
 /* SPR common to all non-embedded PowerPC, including 601 */
-static void gen_spr_ne_601(CPUPPCState *env)
+static void register_ne_601_sprs(CPUPPCState *env)
 {
     /* Exception processing */
     spr_register_kvm(env, SPR_DSISR, "DSISR",
@@ -229,7 +229,7 @@ static void gen_spr_ne_601(CPUPPCState *env)
 }
 
 /* Storage Description Register 1 */
-static void gen_spr_sdr1(CPUPPCState *env)
+static void register_sdr1_sprs(CPUPPCState *env)
 {
 #ifndef CONFIG_USER_ONLY
     if (env->has_hv_mode) {
@@ -252,7 +252,7 @@ static void gen_spr_sdr1(CPUPPCState *env)
 }
 
 /* BATs 0-3 */
-static void gen_low_BATs(CPUPPCState *env)
+static void register_low_BATs(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     spr_register(env, SPR_IBAT0U, "IBAT0U",
@@ -324,7 +324,7 @@ static void gen_low_BATs(CPUPPCState *env)
 }
 
 /* BATs 4-7 */
-static void gen_high_BATs(CPUPPCState *env)
+static void register_high_BATs(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     spr_register(env, SPR_IBAT4U, "IBAT4U",
@@ -396,7 +396,7 @@ static void gen_high_BATs(CPUPPCState *env)
 }
 
 /* Generic PowerPC time base */
-static void gen_tbl(CPUPPCState *env)
+static void register_tbl(CPUPPCState *env)
 {
     spr_register(env, SPR_VTBL,  "TBL",
                  &spr_read_tbl, SPR_NOACCESS,
@@ -417,7 +417,7 @@ static void gen_tbl(CPUPPCState *env)
 }
 
 /* Softare table search registers */
-static void gen_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways)
+static void register_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways)
 {
 #if !defined(CONFIG_USER_ONLY)
     env->nb_tlb = nb_tlbs;
@@ -456,7 +456,7 @@ static void gen_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways)
 }
 
 /* SPR common to MPC755 and G2 */
-static void gen_spr_G2_755(CPUPPCState *env)
+static void register_G2_755_sprs(CPUPPCState *env)
 {
     /* SGPRs */
     spr_register(env, SPR_SPRG4, "SPRG4",
@@ -478,7 +478,7 @@ static void gen_spr_G2_755(CPUPPCState *env)
 }
 
 /* SPR common to all 7xx PowerPC implementations */
-static void gen_spr_7xx(CPUPPCState *env)
+static void register_7xx_sprs(CPUPPCState *env)
 {
     /* Breakpoints */
     /* XXX : not implemented */
@@ -578,7 +578,7 @@ static void gen_spr_7xx(CPUPPCState *env)
 
 #ifdef TARGET_PPC64
 
-static void gen_spr_amr(CPUPPCState *env)
+static void register_amr_sprs(CPUPPCState *env)
 {
 #ifndef CONFIG_USER_ONLY
     /*
@@ -610,7 +610,7 @@ static void gen_spr_amr(CPUPPCState *env)
 #endif /* !CONFIG_USER_ONLY */
 }
 
-static void gen_spr_iamr(CPUPPCState *env)
+static void register_iamr_sprs(CPUPPCState *env)
 {
 #ifndef CONFIG_USER_ONLY
     spr_register_kvm_hv(env, SPR_IAMR, "IAMR",
@@ -622,7 +622,7 @@ static void gen_spr_iamr(CPUPPCState *env)
 }
 #endif /* TARGET_PPC64 */
 
-static void gen_spr_thrm(CPUPPCState *env)
+static void register_thrm_sprs(CPUPPCState *env)
 {
     /* Thermal management */
     /* XXX : not implemented */
@@ -643,7 +643,7 @@ static void gen_spr_thrm(CPUPPCState *env)
 }
 
 /* SPR specific to PowerPC 604 implementation */
-static void gen_spr_604(CPUPPCState *env)
+static void register_604_sprs(CPUPPCState *env)
 {
     /* Processor identification */
     spr_register(env, SPR_PIR, "PIR",
@@ -696,7 +696,7 @@ static void gen_spr_604(CPUPPCState *env)
 }
 
 /* SPR specific to PowerPC 603 implementation */
-static void gen_spr_603(CPUPPCState *env)
+static void register_603_sprs(CPUPPCState *env)
 {
     /* External access control */
     /* XXX : not implemented */
@@ -714,7 +714,7 @@ static void gen_spr_603(CPUPPCState *env)
 }
 
 /* SPR specific to PowerPC G2 implementation */
-static void gen_spr_G2(CPUPPCState *env)
+static void register_G2_sprs(CPUPPCState *env)
 {
     /* Memory base address */
     /* MBAR */
@@ -766,7 +766,7 @@ static void gen_spr_G2(CPUPPCState *env)
 }
 
 /* SPR specific to PowerPC 602 implementation */
-static void gen_spr_602(CPUPPCState *env)
+static void register_602_sprs(CPUPPCState *env)
 {
     /* ESA registers */
     /* XXX : not implemented */
@@ -814,7 +814,7 @@ static void gen_spr_602(CPUPPCState *env)
 }
 
 /* SPR specific to PowerPC 601 implementation */
-static void gen_spr_601(CPUPPCState *env)
+static void register_601_sprs(CPUPPCState *env)
 {
     /* Multiplication/division register */
     /* MQ */
@@ -890,7 +890,7 @@ static void gen_spr_601(CPUPPCState *env)
 #endif
 }
 
-static void gen_spr_74xx(CPUPPCState *env)
+static void register_74xx_sprs(CPUPPCState *env)
 {
     /* Processor identification */
     spr_register(env, SPR_PIR, "PIR",
@@ -940,7 +940,7 @@ static void gen_spr_74xx(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_l3_ctrl(CPUPPCState *env)
+static void register_l3_ctrl(CPUPPCState *env)
 {
     /* L3CR */
     /* XXX : not implemented */
@@ -962,7 +962,7 @@ static void gen_l3_ctrl(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_74xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways)
+static void register_74xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways)
 {
 #if !defined(CONFIG_USER_ONLY)
     env->nb_tlb = nb_tlbs;
@@ -987,7 +987,7 @@ static void gen_74xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways)
 #endif
 }
 
-static void gen_spr_usprg3(CPUPPCState *env)
+static void register_usprg3_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_USPRG3, "USPRG3",
                  &spr_read_ureg, SPR_NOACCESS,
@@ -995,7 +995,7 @@ static void gen_spr_usprg3(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_usprgh(CPUPPCState *env)
+static void register_usprgh_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_USPRG4, "USPRG4",
                  &spr_read_ureg, SPR_NOACCESS,
@@ -1016,7 +1016,7 @@ static void gen_spr_usprgh(CPUPPCState *env)
 }
 
 /* PowerPC BookE SPR */
-static void gen_spr_BookE(CPUPPCState *env, uint64_t ivor_mask)
+static void register_BookE_sprs(CPUPPCState *env, uint64_t ivor_mask)
 {
     const char *ivor_names[64] = {
         "IVOR0",  "IVOR1",  "IVOR2",  "IVOR3",
@@ -1192,7 +1192,7 @@ static void gen_spr_BookE(CPUPPCState *env, uint64_t ivor_mask)
                  0x00000000);
 }
 
-static inline uint32_t gen_tlbncfg(uint32_t assoc, uint32_t minsize,
+static inline uint32_t register_tlbncfg(uint32_t assoc, uint32_t minsize,
                                    uint32_t maxsize, uint32_t flags,
                                    uint32_t nentries)
 {
@@ -1203,7 +1203,7 @@ static inline uint32_t gen_tlbncfg(uint32_t assoc, uint32_t minsize,
 }
 
 /* BookE 2.06 storage control registers */
-static void gen_spr_BookE206(CPUPPCState *env, uint32_t mas_mask,
+static void register_BookE206_sprs(CPUPPCState *env, uint32_t mas_mask,
                              uint32_t *tlbncfg, uint32_t mmucfg)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -1291,11 +1291,11 @@ static void gen_spr_BookE206(CPUPPCState *env, uint32_t mas_mask,
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
@@ -1436,7 +1436,7 @@ static void gen_spr_440(CPUPPCState *env)
 }
 
 /* SPR shared between PowerPC 40x implementations */
-static void gen_spr_40x(CPUPPCState *env)
+static void register_40x_sprs(CPUPPCState *env)
 {
     /* Cache */
     /* not emulated, as QEMU do not emulate caches */
@@ -1491,7 +1491,7 @@ static void gen_spr_40x(CPUPPCState *env)
 }
 
 /* SPR specific to PowerPC 405 implementation */
-static void gen_spr_405(CPUPPCState *env)
+static void register_405_sprs(CPUPPCState *env)
 {
     /* MMU */
     spr_register(env, SPR_40x_PID, "PID",
@@ -1593,11 +1593,11 @@ static void gen_spr_405(CPUPPCState *env)
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
@@ -1625,7 +1625,7 @@ static void gen_spr_401_403(CPUPPCState *env)
 }
 
 /* SPR specific to PowerPC 401 implementation */
-static void gen_spr_401(CPUPPCState *env)
+static void register_401_sprs(CPUPPCState *env)
 {
     /* Debug interface */
     /* XXX : not implemented */
@@ -1667,9 +1667,9 @@ static void gen_spr_401(CPUPPCState *env)
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
@@ -1681,7 +1681,7 @@ static void gen_spr_401x2(CPUPPCState *env)
 }
 
 /* SPR specific to PowerPC 403 implementation */
-static void gen_spr_403(CPUPPCState *env)
+static void register_403_sprs(CPUPPCState *env)
 {
     /* Debug interface */
     /* XXX : not implemented */
@@ -1717,7 +1717,7 @@ static void gen_spr_403(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_403_real(CPUPPCState *env)
+static void register_403_real_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_403_PBL1,  "PBL1",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -1737,7 +1737,7 @@ static void gen_spr_403_real(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_403_mmu(CPUPPCState *env)
+static void register_403_mmu_sprs(CPUPPCState *env)
 {
     /* MMU */
     spr_register(env, SPR_40x_PID, "PID",
@@ -1751,7 +1751,7 @@ static void gen_spr_403_mmu(CPUPPCState *env)
 }
 
 /* SPR specific to PowerPC compression coprocessor extension */
-static void gen_spr_compress(CPUPPCState *env)
+static void register_compress_sprs(CPUPPCState *env)
 {
     /* XXX : not implemented */
     spr_register(env, SPR_401_SKR, "SKR",
@@ -1760,7 +1760,7 @@ static void gen_spr_compress(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_5xx_8xx(CPUPPCState *env)
+static void register_5xx_8xx_sprs(CPUPPCState *env)
 {
     /* Exception processing */
     spr_register_kvm(env, SPR_DSISR, "DSISR",
@@ -1878,7 +1878,7 @@ static void gen_spr_5xx_8xx(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_5xx(CPUPPCState *env)
+static void register_5xx_sprs(CPUPPCState *env)
 {
     /* XXX : not implemented */
     spr_register(env, SPR_RCPU_MI_GRA, "MI_GRA",
@@ -1987,7 +1987,7 @@ static void gen_spr_5xx(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_8xx(CPUPPCState *env)
+static void register_8xx_sprs(CPUPPCState *env)
 {
     /* XXX : not implemented */
     spr_register(env, SPR_MPC_IC_CST, "IC_CST",
@@ -2722,9 +2722,9 @@ static bool ppc_cpu_interrupts_big_endian_lpcr(PowerPCCPU *cpu)
 
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
@@ -2768,10 +2768,10 @@ POWERPC_FAMILY(401)(ObjectClass *oc, void *data)
 
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
@@ -2826,11 +2826,11 @@ POWERPC_FAMILY(401x2)(ObjectClass *oc, void *data)
 
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
@@ -2879,10 +2879,10 @@ POWERPC_FAMILY(401x3)(ObjectClass *oc, void *data)
 
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
@@ -2937,10 +2937,10 @@ POWERPC_FAMILY(IOP480)(ObjectClass *oc, void *data)
 
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
@@ -2984,11 +2984,11 @@ POWERPC_FAMILY(403)(ObjectClass *oc, void *data)
 
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
@@ -3052,9 +3052,9 @@ POWERPC_FAMILY(403GCX)(ObjectClass *oc, void *data)
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
@@ -3118,10 +3118,10 @@ POWERPC_FAMILY(405)(ObjectClass *oc, void *data)
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
@@ -3260,10 +3260,10 @@ POWERPC_FAMILY(460EX)(ObjectClass *oc, void *data)
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
@@ -3343,10 +3343,10 @@ POWERPC_FAMILY(440GP)(ObjectClass *oc, void *data)
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
@@ -3426,10 +3426,10 @@ POWERPC_FAMILY(440x4)(ObjectClass *oc, void *data)
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
@@ -3565,9 +3565,9 @@ POWERPC_FAMILY(440x5wDFPU)(ObjectClass *oc, void *data)
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
@@ -3609,9 +3609,9 @@ POWERPC_FAMILY(MPC5xx)(ObjectClass *oc, void *data)
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
@@ -3653,12 +3653,12 @@ POWERPC_FAMILY(MPC8xx)(ObjectClass *oc, void *data)
 
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
@@ -3682,9 +3682,9 @@ static void init_proc_G2(CPUPPCState *env)
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
@@ -3732,12 +3732,12 @@ POWERPC_FAMILY(G2)(ObjectClass *oc, void *data)
 
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
@@ -3762,9 +3762,9 @@ static void init_proc_G2LE(CPUPPCState *env)
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
@@ -3815,15 +3815,15 @@ POWERPC_FAMILY(G2LE)(ObjectClass *oc, void *data)
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
@@ -3969,11 +3969,11 @@ POWERPC_FAMILY(e200)(ObjectClass *oc, void *data)
 
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
@@ -4017,9 +4017,9 @@ static void init_proc_e300(CPUPPCState *env)
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
@@ -4090,11 +4090,11 @@ static void init_proc_e500(CPUPPCState *env, int version)
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
@@ -4110,8 +4110,8 @@ static void init_proc_e500(CPUPPCState *env, int version)
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
@@ -4129,17 +4129,17 @@ static void init_proc_e500(CPUPPCState *env, int version)
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
@@ -4176,7 +4176,7 @@ static void init_proc_e500(CPUPPCState *env, int version)
         cpu_abort(env_cpu(env), "Unknown CPU: " TARGET_FMT_lx "\n",
                   env->spr[SPR_PVR]);
     }
-    gen_spr_BookE206(env, 0x000000DF, tlbncfg, mmucfg);
+    register_BookE206_sprs(env, 0x000000DF, tlbncfg, mmucfg);
     /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -4534,9 +4534,9 @@ POWERPC_FAMILY(e6500)(ObjectClass *oc, void *data)
 
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
@@ -4650,11 +4650,11 @@ POWERPC_FAMILY(601v)(ObjectClass *oc, void *data)
 
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
@@ -4667,8 +4667,8 @@ static void init_proc_602(CPUPPCState *env)
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
@@ -4720,11 +4720,11 @@ POWERPC_FAMILY(602)(ObjectClass *oc, void *data)
 
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
@@ -4737,8 +4737,8 @@ static void init_proc_603(CPUPPCState *env)
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
@@ -4787,11 +4787,11 @@ POWERPC_FAMILY(603)(ObjectClass *oc, void *data)
 
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
@@ -4804,8 +4804,8 @@ static void init_proc_603E(CPUPPCState *env)
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
@@ -4854,11 +4854,11 @@ POWERPC_FAMILY(603E)(ObjectClass *oc, void *data)
 
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
@@ -4866,7 +4866,7 @@ static void init_proc_604(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
+    register_low_BATs(env);
     init_excp_604(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -4918,9 +4918,9 @@ POWERPC_FAMILY(604)(ObjectClass *oc, void *data)
 
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
@@ -4937,7 +4937,7 @@ static void init_proc_604E(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Time base */
-    gen_tbl(env);
+    register_tbl(env);
     /* Hardware implementation registers */
     /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
@@ -4950,7 +4950,7 @@ static void init_proc_604E(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
+    register_low_BATs(env);
     init_excp_604(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -5002,13 +5002,13 @@ POWERPC_FAMILY(604E)(ObjectClass *oc, void *data)
 
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
@@ -5021,7 +5021,7 @@ static void init_proc_740(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
+    register_low_BATs(env);
     init_excp_7x0(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -5073,18 +5073,18 @@ POWERPC_FAMILY(740)(ObjectClass *oc, void *data)
 
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
@@ -5097,7 +5097,7 @@ static void init_proc_750(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
+    register_low_BATs(env);
     /*
      * XXX: high BATs are also present but are known to be bugged on
      *      die version 1.x
@@ -5153,16 +5153,16 @@ POWERPC_FAMILY(750)(ObjectClass *oc, void *data)
 
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
@@ -5263,9 +5263,9 @@ static void init_proc_750cl(CPUPPCState *env)
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
@@ -5356,18 +5356,18 @@ POWERPC_FAMILY(750cl)(ObjectClass *oc, void *data)
 
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
@@ -5385,9 +5385,9 @@ static void init_proc_750cx(CPUPPCState *env)
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
@@ -5439,18 +5439,18 @@ POWERPC_FAMILY(750cx)(ObjectClass *oc, void *data)
 
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
@@ -5473,9 +5473,9 @@ static void init_proc_750fx(CPUPPCState *env)
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
@@ -5527,18 +5527,18 @@ POWERPC_FAMILY(750fx)(ObjectClass *oc, void *data)
 
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
@@ -5561,9 +5561,9 @@ static void init_proc_750gx(CPUPPCState *env)
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
@@ -5615,14 +5615,14 @@ POWERPC_FAMILY(750gx)(ObjectClass *oc, void *data)
 
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
@@ -5640,9 +5640,9 @@ static void init_proc_745(CPUPPCState *env)
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
@@ -5691,12 +5691,12 @@ POWERPC_FAMILY(745)(ObjectClass *oc, void *data)
 
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
@@ -5709,7 +5709,7 @@ static void init_proc_755(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Thermal management */
-    gen_spr_thrm(env);
+    register_thrm_sprs(env);
     /* Hardware implementation registers */
     /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
@@ -5727,9 +5727,9 @@ static void init_proc_755(CPUPPCState *env)
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
@@ -5778,13 +5778,13 @@ POWERPC_FAMILY(755)(ObjectClass *oc, void *data)
 
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
@@ -5798,9 +5798,9 @@ static void init_proc_7400(CPUPPCState *env)
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
@@ -5858,13 +5858,13 @@ POWERPC_FAMILY(7400)(ObjectClass *oc, void *data)
 
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
@@ -5872,7 +5872,7 @@ static void init_proc_7410(CPUPPCState *env)
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
     /* Thermal management */
-    gen_spr_thrm(env);
+    register_thrm_sprs(env);
     /* L2PMCR */
     /* XXX : not implemented */
     spr_register(env, SPR_L2PMCR, "L2PMCR",
@@ -5886,7 +5886,7 @@ static void init_proc_7410(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Memory management */
-    gen_low_BATs(env);
+    register_low_BATs(env);
     init_excp_7400(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -5944,13 +5944,13 @@ POWERPC_FAMILY(7410)(ObjectClass *oc, void *data)
 
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
@@ -5997,8 +5997,8 @@ static void init_proc_7440(CPUPPCState *env)
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
@@ -6053,16 +6053,16 @@ POWERPC_FAMILY(7440)(ObjectClass *oc, void *data)
 
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
@@ -6132,8 +6132,8 @@ static void init_proc_7450(CPUPPCState *env)
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
@@ -6188,13 +6188,13 @@ POWERPC_FAMILY(7450)(ObjectClass *oc, void *data)
 
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
@@ -6269,9 +6269,9 @@ static void init_proc_7445(CPUPPCState *env)
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
@@ -6326,16 +6326,16 @@ POWERPC_FAMILY(7445)(ObjectClass *oc, void *data)
 
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
@@ -6409,9 +6409,9 @@ static void init_proc_7455(CPUPPCState *env)
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
@@ -6466,16 +6466,16 @@ POWERPC_FAMILY(7455)(ObjectClass *oc, void *data)
 
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
@@ -6573,9 +6573,9 @@ static void init_proc_7457(CPUPPCState *env)
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
@@ -6630,13 +6630,13 @@ POWERPC_FAMILY(7457)(ObjectClass *oc, void *data)
 
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
@@ -6712,9 +6712,9 @@ static void init_proc_e600(CPUPPCState *env)
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
@@ -6787,7 +6787,7 @@ static int check_pow_970(CPUPPCState *env)
     return 0;
 }
 
-static void gen_spr_970_hid(CPUPPCState *env)
+static void register_970_hid_sprs(CPUPPCState *env)
 {
     /* Hardware implementation registers */
     /* XXX : not implemented */
@@ -6805,7 +6805,7 @@ static void gen_spr_970_hid(CPUPPCState *env)
                  POWERPC970_HID5_INIT);
 }
 
-static void gen_spr_970_hior(CPUPPCState *env)
+static void register_970_hior_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_HIOR, "SPR_HIOR",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -6813,7 +6813,7 @@ static void gen_spr_970_hior(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_book3s_ctrl(CPUPPCState *env)
+static void register_book3s_ctrl_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_CTRL, "SPR_CTRL",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -6825,7 +6825,7 @@ static void gen_spr_book3s_ctrl(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_book3s_altivec(CPUPPCState *env)
+static void register_book3s_altivec_sprs(CPUPPCState *env)
 {
     if (!(env->insns_flags & PPC_ALTIVEC)) {
         return;
@@ -6838,7 +6838,7 @@ static void gen_spr_book3s_altivec(CPUPPCState *env)
 
 }
 
-static void gen_spr_book3s_dbg(CPUPPCState *env)
+static void register_book3s_dbg_sprs(CPUPPCState *env)
 {
     /*
      * TODO: different specs define different scopes for these,
@@ -6857,7 +6857,7 @@ static void gen_spr_book3s_dbg(CPUPPCState *env)
                      KVM_REG_PPC_DABRX, 0x00000000);
 }
 
-static void gen_spr_book3s_207_dbg(CPUPPCState *env)
+static void register_book3s_207_dbg_sprs(CPUPPCState *env)
 {
     spr_register_kvm_hv(env, SPR_DAWR, "DAWR",
                         SPR_NOACCESS, SPR_NOACCESS,
@@ -6876,7 +6876,7 @@ static void gen_spr_book3s_207_dbg(CPUPPCState *env)
                         KVM_REG_PPC_CIABR, 0x00000000);
 }
 
-static void gen_spr_970_dbg(CPUPPCState *env)
+static void register_970_dbg_sprs(CPUPPCState *env)
 {
     /* Breakpoints */
     spr_register(env, SPR_IABR, "IABR",
@@ -6885,7 +6885,7 @@ static void gen_spr_970_dbg(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_book3s_pmu_sup(CPUPPCState *env)
+static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
 {
     spr_register_kvm(env, SPR_POWER_MMCR0, "MMCR0",
                      SPR_NOACCESS, SPR_NOACCESS,
@@ -6933,7 +6933,7 @@ static void gen_spr_book3s_pmu_sup(CPUPPCState *env)
                      KVM_REG_PPC_SDAR, 0x00000000);
 }
 
-static void gen_spr_book3s_pmu_user(CPUPPCState *env)
+static void register_book3s_pmu_user_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
                  &spr_read_ureg, SPR_NOACCESS,
@@ -6981,7 +6981,7 @@ static void gen_spr_book3s_pmu_user(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_970_pmu_sup(CPUPPCState *env)
+static void register_970_pmu_sup_sprs(CPUPPCState *env)
 {
     spr_register_kvm(env, SPR_970_PMC7, "PMC7",
                      SPR_NOACCESS, SPR_NOACCESS,
@@ -6993,7 +6993,7 @@ static void gen_spr_970_pmu_sup(CPUPPCState *env)
                      KVM_REG_PPC_PMC8, 0x00000000);
 }
 
-static void gen_spr_970_pmu_user(CPUPPCState *env)
+static void register_970_pmu_user_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_970_UPMC7, "UPMC7",
                  &spr_read_ureg, SPR_NOACCESS,
@@ -7005,7 +7005,7 @@ static void gen_spr_970_pmu_user(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_power8_pmu_sup(CPUPPCState *env)
+static void register_power8_pmu_sup_sprs(CPUPPCState *env)
 {
     spr_register_kvm(env, SPR_POWER_MMCR2, "MMCR2",
                      SPR_NOACCESS, SPR_NOACCESS,
@@ -7041,7 +7041,7 @@ static void gen_spr_power8_pmu_sup(CPUPPCState *env)
                      KVM_REG_PPC_CSIGR, 0x00000000);
 }
 
-static void gen_spr_power8_pmu_user(CPUPPCState *env)
+static void register_power8_pmu_user_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_POWER_UMMCR2, "UMMCR2",
                  &spr_read_ureg, SPR_NOACCESS,
@@ -7053,7 +7053,7 @@ static void gen_spr_power8_pmu_user(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_power5p_ear(CPUPPCState *env)
+static void register_power5p_ear_sprs(CPUPPCState *env)
 {
     /* External access control */
     spr_register(env, SPR_EAR, "EAR",
@@ -7062,7 +7062,7 @@ static void gen_spr_power5p_ear(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_power5p_tb(CPUPPCState *env)
+static void register_power5p_tb_sprs(CPUPPCState *env)
 {
     /* TBU40 (High 40 bits of the Timebase register */
     spr_register_hv(env, SPR_TBU40, "TBU40",
@@ -7072,7 +7072,7 @@ static void gen_spr_power5p_tb(CPUPPCState *env)
                     0x00000000);
 }
 
-static void gen_spr_970_lpar(CPUPPCState *env)
+static void register_970_lpar_sprs(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     /*
@@ -7089,7 +7089,7 @@ static void gen_spr_970_lpar(CPUPPCState *env)
 #endif
 }
 
-static void gen_spr_power5p_lpar(CPUPPCState *env)
+static void register_power5p_lpar_sprs(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     /* Logical partitionning */
@@ -7105,7 +7105,7 @@ static void gen_spr_power5p_lpar(CPUPPCState *env)
 #endif
 }
 
-static void gen_spr_book3s_ids(CPUPPCState *env)
+static void register_book3s_ids_sprs(CPUPPCState *env)
 {
     /* FIXME: Will need to deal with thread vs core only SPRs */
 
@@ -7197,7 +7197,7 @@ static void gen_spr_book3s_ids(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_rmor(CPUPPCState *env)
+static void register_rmor_sprs(CPUPPCState *env)
 {
     spr_register_hv(env, SPR_RMOR, "RMOR",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -7206,7 +7206,7 @@ static void gen_spr_rmor(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_power8_ids(CPUPPCState *env)
+static void register_power8_ids_sprs(CPUPPCState *env)
 {
     /* Thread identification */
     spr_register(env, SPR_TIR, "TIR",
@@ -7215,7 +7215,7 @@ static void gen_spr_power8_ids(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_book3s_purr(CPUPPCState *env)
+static void register_book3s_purr_sprs(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     /* PURR & SPURR: Hack - treat these as aliases for the TB for now */
@@ -7232,7 +7232,7 @@ static void gen_spr_book3s_purr(CPUPPCState *env)
 #endif
 }
 
-static void gen_spr_power6_dbg(CPUPPCState *env)
+static void register_power6_dbg_sprs(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     spr_register(env, SPR_CFAR, "SPR_CFAR",
@@ -7242,7 +7242,7 @@ static void gen_spr_power6_dbg(CPUPPCState *env)
 #endif
 }
 
-static void gen_spr_power5p_common(CPUPPCState *env)
+static void register_power5p_common_sprs(CPUPPCState *env)
 {
     spr_register_kvm(env, SPR_PPR, "PPR",
                      &spr_read_generic, &spr_write_generic,
@@ -7250,7 +7250,7 @@ static void gen_spr_power5p_common(CPUPPCState *env)
                      KVM_REG_PPC_PPR, 0x00000000);
 }
 
-static void gen_spr_power6_common(CPUPPCState *env)
+static void register_power6_common_sprs(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     spr_register_kvm(env, SPR_DSCR, "SPR_DSCR",
@@ -7269,7 +7269,7 @@ static void gen_spr_power6_common(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_power8_tce_address_control(CPUPPCState *env)
+static void register_power8_tce_address_control_sprs(CPUPPCState *env)
 {
     spr_register_kvm(env, SPR_TAR, "TAR",
                      &spr_read_tar, &spr_write_tar,
@@ -7277,7 +7277,7 @@ static void gen_spr_power8_tce_address_control(CPUPPCState *env)
                      KVM_REG_PPC_TAR, 0x00000000);
 }
 
-static void gen_spr_power8_tm(CPUPPCState *env)
+static void register_power8_tm_sprs(CPUPPCState *env)
 {
     spr_register_kvm(env, SPR_TFHAR, "TFHAR",
                      &spr_read_tm, &spr_write_tm,
@@ -7297,7 +7297,7 @@ static void gen_spr_power8_tm(CPUPPCState *env)
                  0x00000000);
 }
 
-static void gen_spr_power8_ebb(CPUPPCState *env)
+static void register_power8_ebb_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_BESCRS, "BESCRS",
                  &spr_read_ebb, &spr_write_ebb,
@@ -7330,7 +7330,7 @@ static void gen_spr_power8_ebb(CPUPPCState *env)
 }
 
 /* Virtual Time Base */
-static void gen_spr_vtb(CPUPPCState *env)
+static void register_vtb_sprs(CPUPPCState *env)
 {
     spr_register_kvm_hv(env, SPR_VTB, "VTB",
                         SPR_NOACCESS, SPR_NOACCESS,
@@ -7339,7 +7339,7 @@ static void gen_spr_vtb(CPUPPCState *env)
                         KVM_REG_PPC_VTB, 0x00000000);
 }
 
-static void gen_spr_power8_fscr(CPUPPCState *env)
+static void register_power8_fscr_sprs(CPUPPCState *env)
 {
 #if defined(CONFIG_USER_ONLY)
     target_ulong initval = 1ULL << FSCR_TAR;
@@ -7352,7 +7352,7 @@ static void gen_spr_power8_fscr(CPUPPCState *env)
                      KVM_REG_PPC_FSCR, initval);
 }
 
-static void gen_spr_power8_pspb(CPUPPCState *env)
+static void register_power8_pspb_sprs(CPUPPCState *env)
 {
     spr_register_kvm(env, SPR_PSPB, "PSPB",
                      SPR_NOACCESS, SPR_NOACCESS,
@@ -7360,7 +7360,7 @@ static void gen_spr_power8_pspb(CPUPPCState *env)
                      KVM_REG_PPC_PSPB, 0);
 }
 
-static void gen_spr_power8_dpdes(CPUPPCState *env)
+static void register_power8_dpdes_sprs(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     /* Directed Privileged Door-bell Exception State, used for IPI */
@@ -7372,7 +7372,7 @@ static void gen_spr_power8_dpdes(CPUPPCState *env)
 #endif
 }
 
-static void gen_spr_power8_ic(CPUPPCState *env)
+static void register_power8_ic_sprs(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     spr_register_hv(env, SPR_IC, "IC",
@@ -7383,7 +7383,7 @@ static void gen_spr_power8_ic(CPUPPCState *env)
 #endif
 }
 
-static void gen_spr_power8_book4(CPUPPCState *env)
+static void register_power8_book4_sprs(CPUPPCState *env)
 {
     /* Add a number of P8 book4 registers */
 #if !defined(CONFIG_USER_ONLY)
@@ -7402,7 +7402,7 @@ static void gen_spr_power8_book4(CPUPPCState *env)
 #endif
 }
 
-static void gen_spr_power7_book4(CPUPPCState *env)
+static void register_power7_book4_sprs(CPUPPCState *env)
 {
     /* Add a number of P7 book4 registers */
 #if !defined(CONFIG_USER_ONLY)
@@ -7417,7 +7417,7 @@ static void gen_spr_power7_book4(CPUPPCState *env)
 #endif
 }
 
-static void gen_spr_power8_rpr(CPUPPCState *env)
+static void register_power8_rpr_sprs(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     spr_register_hv(env, SPR_RPR, "RPR",
@@ -7428,7 +7428,7 @@ static void gen_spr_power8_rpr(CPUPPCState *env)
 #endif
 }
 
-static void gen_spr_power9_mmu(CPUPPCState *env)
+static void register_power9_mmu_sprs(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     /* Partition Table Control */
@@ -7448,13 +7448,13 @@ static void gen_spr_power9_mmu(CPUPPCState *env)
 
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
@@ -7466,17 +7466,17 @@ static void init_proc_970(CPUPPCState *env)
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
@@ -7539,19 +7539,19 @@ static void init_proc_power5plus(CPUPPCState *env)
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
@@ -7618,21 +7618,21 @@ static void init_proc_POWER7(CPUPPCState *env)
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
@@ -7764,34 +7764,34 @@ static void init_proc_POWER8(CPUPPCState *env)
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
@@ -7961,33 +7961,33 @@ static void init_proc_POWER9(CPUPPCState *env)
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
@@ -8179,31 +8179,31 @@ static void init_proc_POWER10(CPUPPCState *env)
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
@@ -8408,7 +8408,7 @@ static void init_ppc_proc(PowerPCCPU *cpu)
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


