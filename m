Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B77309FA9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 01:21:05 +0100 (CET)
Received: from localhost ([::1]:41030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Mxk-00038C-Qi
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 19:21:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6Mvg-0001ow-9h
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 19:18:57 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:22805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6MvX-00017c-NN
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 19:18:56 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id AA4EC746397;
 Mon,  1 Feb 2021 01:18:44 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 13D87746344; Mon,  1 Feb 2021 01:18:44 +0100 (CET)
Message-Id: <2dfe32672ee6ddce4b54c6bcfce579d35abeaf51.1612137712.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1612137712.git.balaton@eik.bme.hu>
References: <cover.1612137712.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 1/6] m68k: improve cpu instantiation comments
Date: Mon, 01 Feb 2021 01:01:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>

Improvement in comments for the instantiation functions.
This is to highlight what each cpu class, in the 68000 series, contains
in terms of instructions/features.

Signed-off-by: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 target/m68k/cpu.c | 44 ++++++++++++++++++++++++++++++++++++++++++
 target/m68k/cpu.h | 49 ++++++++++++++++++++++++++++-------------------
 2 files changed, 73 insertions(+), 20 deletions(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index b811a0bdde..ccf1c490c0 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -103,6 +103,7 @@ static void m5206_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_CF_ISA_A);
 }
 
+/* Base feature set, including isns. for m68k family */
 static void m68000_cpu_initfn(Object *obj)
 {
     M68kCPU *cpu = M68K_CPU(obj);
@@ -135,6 +136,13 @@ static void m680x0_cpu_common(CPUM68KState *env)
     m68k_set_feature(env, M68K_FEATURE_MOVEP);
 }
 
+/*
+ * Adds BFCHG, BFCLR, BFEXTS, BFEXTU, BFFFO, BFINS, BFSET, BFTST, CAS, CAS2,
+ *      CHK2, CMP2, DIVSL, DIVUL, EXTB, PACK, TRAPcc, UNPK.
+ *
+ * 68020/30 only:
+ *      CALLM, cpBcc, cpDBcc, cpGEN, cpRESTORE, cpSAVE, cpScc, cpTRAPcc
+ */
 static void m68020_cpu_initfn(Object *obj)
 {
     M68kCPU *cpu = M68K_CPU(obj);
@@ -144,6 +152,14 @@ static void m68020_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_M68020);
 }
 
+/*
+ * Adds: PFLUSH (*5)
+ * 68030 Only: PFLUSHA (*5), PLOAD (*5), PMOVE
+ * 68030/40 Only: PTEST
+ *
+ * NOTES:
+ *  5. Not valid on MC68EC030
+ */
 static void m68030_cpu_initfn(Object *obj)
 {
     M68kCPU *cpu = M68K_CPU(obj);
@@ -153,6 +169,23 @@ static void m68030_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_M68030);
 }
 
+/*
+ * Adds: CINV, CPUSH
+ * Adds all with Note *2: FABS, FSABS, FDABS, FADD, FSADD, FDADD, FBcc, FCMP,
+ *                        FDBcc, FDIV, FSDIV, FDDIV, FMOVE, FSMOVE, FDMOVE,
+ *                        FMOVEM, FMUL, FSMUL, FDMUL, FNEG, FSNEG, FDNEG, FNOP,
+ *                        FRESTORE, FSAVE, FScc, FSQRT, FSSQRT, FDSQRT, FSUB,
+ *                        FSSUB, FDSUB, FTRAPcc, FTST
+ *
+ * Adds with Notes *2, and *3: FACOS, FASIN, FATAN, FATANH, FCOS, FCOSH, FETOX,
+ *                             FETOXM, FGETEXP, FGETMAN, FINT, FINTRZ, FLOG10,
+ *                             FLOG2, FLOGN, FLOGNP1, FMOD, FMOVECR, FREM,
+ *                             FSCALE, FSGLDIV, FSGLMUL, FSIN, FSINCOS, FSINH,
+ *                             FTAN, FTANH, FTENTOX, FTWOTOX
+ * NOTES:
+ * 2. Not applicable to the MC68EC040, MC68LC040, MC68EC060, and MC68LC060.
+ * 3. These are software-supported instructions on the MC68040 and MC68060.
+ */
 static void m68040_cpu_initfn(Object *obj)
 {
     M68kCPU *cpu = M68K_CPU(obj);
@@ -162,6 +195,17 @@ static void m68040_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_M68040);
 }
 
+/*
+ * Adds: PLPA
+ * Adds all with Note *2: CAS, CAS2, MULS, MULU, CHK2, CMP2, DIVS, DIVU
+ * All Fxxxx instructions are as per m68040 with exception to; FMOVEM NOTE3
+ *
+ * Does NOT implement MOVEP
+ *
+ * NOTES:
+ * 2. Not applicable to the MC68EC040, MC68LC040, MC68EC060, and MC68LC060.
+ * 3. These are software-supported instructions on the MC68040 and MC68060.
+ */
 static void m68060_cpu_initfn(Object *obj)
 {
     M68kCPU *cpu = M68K_CPU(obj);
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index de5b9875fe..1d59cbb3f4 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -450,39 +450,48 @@ void m68k_switch_sp(CPUM68KState *env);
 void do_m68k_semihosting(CPUM68KState *env, int nr);
 
 /*
+ * The 68000 family is defined in six main CPU classes, the 680[012346]0.
+ * Generally each successive CPU adds enhanced data/stack/instructions.
+ * However, some features are only common to one, or a few classes.
+ * The features covers those subsets of instructons.
+ *
+ * CPU32/32+ are basically 680010 compatible with some 68020 class instructons,
+ * and some additional CPU32 instructions. Mostly Supervisor state differences.
+ *
+ * The ColdFire core ISA is a RISC-style reduction of the 68000 series cpu.
  * There are 4 ColdFire core ISA revisions: A, A+, B and C.
  * Each feature covers the subset of instructions common to the
  * ISA revisions mentioned.
  */
 
 enum m68k_features {
-    M68K_FEATURE_M68000,
+    M68K_FEATURE_M68000,   /* Base m68k instruction set */
     M68K_FEATURE_M68020,
     M68K_FEATURE_M68030,
     M68K_FEATURE_M68040,
     M68K_FEATURE_M68060,
-    M68K_FEATURE_CF_ISA_A,
-    M68K_FEATURE_CF_ISA_B, /* (ISA B or C).  */
-    M68K_FEATURE_CF_ISA_APLUSC, /* BIT/BITREV, FF1, STRLDSR (ISA A+ or C).  */
-    M68K_FEATURE_BRAL, /* Long unconditional branch.  (ISA A+ or B).  */
+    M68K_FEATURE_CF_ISA_A, /* Base Coldfire set Rev A. */
+    M68K_FEATURE_CF_ISA_B, /* (ISA B or C). */
+    M68K_FEATURE_CF_ISA_APLUSC, /* BIT/BITREV, FF1, STRLDSR (ISA A+ or C). */
+    M68K_FEATURE_BRAL, /* BRA with Long branch. (680[2346]0, ISA A+ or B). */
     M68K_FEATURE_CF_FPU,
     M68K_FEATURE_CF_MAC,
     M68K_FEATURE_CF_EMAC,
-    M68K_FEATURE_CF_EMAC_B, /* Revision B EMAC (dual accumulate).  */
-    M68K_FEATURE_USP, /* User Stack Pointer.  (ISA A+, B or C).  */
-    M68K_FEATURE_EXT_FULL, /* 68020+ full extension word.  */
-    M68K_FEATURE_WORD_INDEX, /* word sized address index registers.  */
-    M68K_FEATURE_SCALED_INDEX, /* scaled address index registers.  */
-    M68K_FEATURE_LONG_MULDIV, /* 32 bit multiply/divide. */
-    M68K_FEATURE_QUAD_MULDIV, /* 64 bit multiply/divide. */
-    M68K_FEATURE_BCCL, /* Long conditional branches.  */
-    M68K_FEATURE_BITFIELD, /* Bit field insns.  */
-    M68K_FEATURE_FPU,
-    M68K_FEATURE_CAS,
-    M68K_FEATURE_BKPT,
-    M68K_FEATURE_RTD,
-    M68K_FEATURE_CHK2,
-    M68K_FEATURE_MOVEP,
+    M68K_FEATURE_CF_EMAC_B,   /* Revision B EMAC (dual accumulate). */
+    M68K_FEATURE_USP, /* User Stack Pointer. (680[012346]0, ISA A+, B or C).*/
+    M68K_FEATURE_EXT_FULL,    /* 68020+ full extension word. */
+    M68K_FEATURE_WORD_INDEX,  /* word sized address index registers. */
+    M68K_FEATURE_SCALED_INDEX, /* scaled address index registers. */
+    M68K_FEATURE_LONG_MULDIV, /* 32 bit mul/div. (680[2346]0, and CPU32) */
+    M68K_FEATURE_QUAD_MULDIV, /* 64 bit mul/div. (680[2346]0, and CPU32) */
+    M68K_FEATURE_BCCL,  /* Bcc with Long branches. (680[2346]0, and CPU32) */
+    M68K_FEATURE_BITFIELD, /* BFxxx Bit field insns. (680[2346]0) */
+    M68K_FEATURE_FPU,   /* fpu insn. (680[46]0) */
+    M68K_FEATURE_CAS,   /* CAS/CAS2[WL] insns. (680[2346]0) */
+    M68K_FEATURE_BKPT,  /* BKPT insn. (680[12346]0, and CPU32) */
+    M68K_FEATURE_RTD,   /* RTD insn. (680[12346]0, and CPU32) */
+    M68K_FEATURE_CHK2,  /* CHK2 insn. (680[2346]0, and CPU32) */
+    M68K_FEATURE_MOVEP, /* MOVEP insn. (680[01234]0, and CPU32) */
 };
 
 static inline int m68k_feature(CPUM68KState *env, int feature)
-- 
2.21.3


