Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D218309FAD
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 01:23:17 +0100 (CET)
Received: from localhost ([::1]:47470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Mzs-00068Q-OG
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 19:23:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6Mvh-0001pF-Rd
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 19:18:57 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:34434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6Mvd-0001AP-0y
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 19:18:57 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C4407746340;
 Mon,  1 Feb 2021 01:18:44 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 274A5746354; Mon,  1 Feb 2021 01:18:44 +0100 (CET)
Message-Id: <fc0d0187478716f05d990949347071969b743151.1612137712.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1612137712.git.balaton@eik.bme.hu>
References: <cover.1612137712.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 5/6] m68k: MOVEC insn. should generate exception if wrong CR
 is accessed
Date: Mon, 01 Feb 2021 01:01:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add CPU class detection for each CR type in the m68k_move_to/from helpers,
so that it throws and exception if an unsupported register is requested
for that CPU class.

Reclassified MOVEC insn. as only supported from 68010.

Signed-off-by: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 target/m68k/cpu.c       |   1 +
 target/m68k/cpu.h       |   1 +
 target/m68k/helper.c    | 188 ++++++++++++++++++++++++++++++----------
 target/m68k/translate.c |   2 +-
 4 files changed, 146 insertions(+), 46 deletions(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 5e7aec5b13..31f96df2a2 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -132,6 +132,7 @@ static void m68010_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_M68010);
     m68k_set_feature(env, M68K_FEATURE_RTD);
     m68k_set_feature(env, M68K_FEATURE_BKPT);
+    m68k_set_feature(env, M68K_FEATURE_MOVEC);
 }
 
 /*
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index ae34c94615..5d2cb012e5 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -497,6 +497,7 @@ enum m68k_features {
     M68K_FEATURE_RTD,   /* RTD insn. (680[12346]0, and CPU32) */
     M68K_FEATURE_CHK2,  /* CHK2 insn. (680[2346]0, and CPU32) */
     M68K_FEATURE_MOVEP, /* MOVEP insn. (680[01234]0, and CPU32) */
+    M68K_FEATURE_MOVEC, /* MOVEC insn. (from 68010) */
 };
 
 static inline int m68k_feature(CPUM68KState *env, int feature)
diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 69acdc3b35..1efd6e4f65 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -184,6 +184,14 @@ void HELPER(cf_movec_to)(CPUM68KState *env, uint32_t reg, uint32_t val)
     }
 }
 
+static void raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
+{
+    CPUState *cs = env_cpu(env);
+
+    cs->exception_index = tt;
+    cpu_loop_exit_restore(cs, raddr);
+}
+
 void HELPER(m68k_movec_to)(CPUM68KState *env, uint32_t reg, uint32_t val)
 {
     switch (reg) {
@@ -209,61 +217,104 @@ void HELPER(m68k_movec_to)(CPUM68KState *env, uint32_t reg, uint32_t val)
             env->cacr = val & 0x80008000;
         } else if (m68k_feature(env, M68K_FEATURE_M68060)) {
             env->cacr = val & 0xf8e0e000;
+        } else {
+            break;
         }
         m68k_switch_sp(env);
         return;
     /* MC680[46]0 */
     case M68K_CR_TC:
-        env->mmu.tcr = val;
-        return;
+        if (m68k_feature(env, M68K_FEATURE_M68040)
+         || m68k_feature(env, M68K_FEATURE_M68060)) {
+            env->mmu.tcr = val;
+            return;
+        }
+        break;
     /* MC68040 */
     case M68K_CR_MMUSR:
-        env->mmu.mmusr = val;
-        return;
+        if (m68k_feature(env, M68K_FEATURE_M68040)) {
+            env->mmu.mmusr = val;
+            return;
+        }
+        break;
     /* MC680[46]0 */
     case M68K_CR_SRP:
-        env->mmu.srp = val;
-        return;
-    case M68K_CR_URP:
-        env->mmu.urp = val;
-        return;
+        if (m68k_feature(env, M68K_FEATURE_M68040)
+         || m68k_feature(env, M68K_FEATURE_M68060)) {
+            env->mmu.srp = val;
+            return;
+        }
+        break;
     /* MC680[46]0 */
+    case M68K_CR_URP:
+        if (m68k_feature(env, M68K_FEATURE_M68040)
+         || m68k_feature(env, M68K_FEATURE_M68060)) {
+            env->mmu.urp = val;
+            return;
+        }
+        break;
+    /* MC680[12346]0 */
     case M68K_CR_USP:
         env->sp[M68K_USP] = val;
         return;
     /* MC680[234]0 */
     case M68K_CR_MSP:
-        env->sp[M68K_SSP] = val;
-        return;
+        if (m68k_feature(env, M68K_FEATURE_M68020)
+         || m68k_feature(env, M68K_FEATURE_M68030)
+         || m68k_feature(env, M68K_FEATURE_M68040)) {
+            env->sp[M68K_SSP] = val;
+            return;
+        }
+        break;
     /* MC680[234]0 */
     case M68K_CR_ISP:
-        env->sp[M68K_ISP] = val;
-        return;
+        if (m68k_feature(env, M68K_FEATURE_M68020)
+         || m68k_feature(env, M68K_FEATURE_M68030)
+         || m68k_feature(env, M68K_FEATURE_M68040)) {
+            env->sp[M68K_ISP] = val;
+            return;
+        }
+        break;
     /* MC68040/MC68LC040 */
-    case M68K_CR_ITT0:
-        env->mmu.ttr[M68K_ITTR0] = val;
-        return;
+    case M68K_CR_ITT0: /* MC68EC040 only: M68K_CR_IACR0 */
+        if (m68k_feature(env, M68K_FEATURE_M68040)) {
+            env->mmu.ttr[M68K_ITTR0] = val;
+            return;
+        }
+        break;
     /* MC68040/MC68LC040 */
-    case M68K_CR_ITT1:
-         env->mmu.ttr[M68K_ITTR1] = val;
-        return;
+    case M68K_CR_ITT1: /* MC68EC040 only: M68K_CR_IACR1 */
+        if (m68k_feature(env, M68K_FEATURE_M68040)) {
+            env->mmu.ttr[M68K_ITTR1] = val;
+            return;
+        }
+        break;
     /* MC68040/MC68LC040 */
-    case M68K_CR_DTT0:
-        env->mmu.ttr[M68K_DTTR0] = val;
-        return;
+    case M68K_CR_DTT0: /* MC68EC040 only: M68K_CR_DACR0 */
+        if (m68k_feature(env, M68K_FEATURE_M68040)) {
+            env->mmu.ttr[M68K_DTTR0] = val;
+            return;
+        }
+        break;
     /* MC68040/MC68LC040 */
-    case M68K_CR_DTT1:
-        env->mmu.ttr[M68K_DTTR1] = val;
-        return;
+    case M68K_CR_DTT1: /* MC68EC040 only: M68K_CR_DACR1 */
+        if (m68k_feature(env, M68K_FEATURE_M68040)) {
+            env->mmu.ttr[M68K_DTTR1] = val;
+            return;
+        }
+        break;
     /* Unimplemented Registers */
     case M68K_CR_CAAR:
     case M68K_CR_PCR:
     case M68K_CR_BUSCR:
-        break;
+        cpu_abort(env_cpu(env),
+                  "Unimplemented control register write 0x%x = 0x%x\n",
+                  reg, val);
     }
-    cpu_abort(env_cpu(env),
-              "Unimplemented control register write 0x%x = 0x%x\n",
-              reg, val);
+
+    /* Invalid control registers will generate an exception. */
+    raise_exception_ra(env, EXCP_ILLEGAL, 0);
+    return;
 }
 
 uint32_t HELPER(m68k_movec_from)(CPUM68KState *env, uint32_t reg)
@@ -280,48 +331,95 @@ uint32_t HELPER(m68k_movec_from)(CPUM68KState *env, uint32_t reg)
         return env->vbr;
     /* MC680[2346]0 */
     case M68K_CR_CACR:
-        return env->cacr;
+        if (m68k_feature(env, M68K_FEATURE_M68020)
+         || m68k_feature(env, M68K_FEATURE_M68030)
+         || m68k_feature(env, M68K_FEATURE_M68040)
+         || m68k_feature(env, M68K_FEATURE_M68060)) {
+            return env->cacr;
+        }
+        break;
     /* MC680[46]0 */
     case M68K_CR_TC:
-        return env->mmu.tcr;
+        if (m68k_feature(env, M68K_FEATURE_M68040)
+         || m68k_feature(env, M68K_FEATURE_M68060)) {
+            return env->mmu.tcr;
+        }
+        break;
     /* MC68040 */
     case M68K_CR_MMUSR:
-        return env->mmu.mmusr;
+        if (m68k_feature(env, M68K_FEATURE_M68040)) {
+            return env->mmu.mmusr;
+        }
+        break;
     /* MC680[46]0 */
     case M68K_CR_SRP:
-        return env->mmu.srp;
+        if (m68k_feature(env, M68K_FEATURE_M68040)
+         || m68k_feature(env, M68K_FEATURE_M68060)) {
+            return env->mmu.srp;
+        }
+        break;
+    /* MC68040/MC68LC040 */
+    case M68K_CR_URP:
+        if (m68k_feature(env, M68K_FEATURE_M68040)
+         || m68k_feature(env, M68K_FEATURE_M68060)) {
+            return env->mmu.urp;
+        }
+        break;
     /* MC680[46]0 */
     case M68K_CR_USP:
         return env->sp[M68K_USP];
     /* MC680[234]0 */
     case M68K_CR_MSP:
-        return env->sp[M68K_SSP];
+        if (m68k_feature(env, M68K_FEATURE_M68020)
+         || m68k_feature(env, M68K_FEATURE_M68030)
+         || m68k_feature(env, M68K_FEATURE_M68040)) {
+            return env->sp[M68K_SSP];
+        }
+        break;
     /* MC680[234]0 */
     case M68K_CR_ISP:
-        return env->sp[M68K_ISP];
-    /* MC68040/MC68LC040 */
-    case M68K_CR_URP:
-        return env->mmu.urp;
+        if (m68k_feature(env, M68K_FEATURE_M68020)
+         || m68k_feature(env, M68K_FEATURE_M68030)
+         || m68k_feature(env, M68K_FEATURE_M68040)) {
+            return env->sp[M68K_ISP];
+        }
+        break;
     /* MC68040/MC68LC040 */
     case M68K_CR_ITT0: /* MC68EC040 only: M68K_CR_IACR0 */
-        return env->mmu.ttr[M68K_ITTR0];
+        if (m68k_feature(env, M68K_FEATURE_M68040)) {
+            return env->mmu.ttr[M68K_ITTR0];
+        }
+        break;
     /* MC68040/MC68LC040 */
     case M68K_CR_ITT1: /* MC68EC040 only: M68K_CR_IACR1 */
-        return env->mmu.ttr[M68K_ITTR1];
+        if (m68k_feature(env, M68K_FEATURE_M68040)) {
+            return env->mmu.ttr[M68K_ITTR1];
+        }
+        break;
     /* MC68040/MC68LC040 */
     case M68K_CR_DTT0: /* MC68EC040 only: M68K_CR_DACR0 */
-        return env->mmu.ttr[M68K_DTTR0];
+        if (m68k_feature(env, M68K_FEATURE_M68040)) {
+            return env->mmu.ttr[M68K_DTTR0];
+        }
+        break;
     /* MC68040/MC68LC040 */
     case M68K_CR_DTT1: /* MC68EC040 only: M68K_CR_DACR1 */
-        return env->mmu.ttr[M68K_DTTR1];
+        if (m68k_feature(env, M68K_FEATURE_M68040)) {
+            return env->mmu.ttr[M68K_DTTR1];
+        }
+        break;
     /* Unimplemented Registers */
     case M68K_CR_CAAR:
     case M68K_CR_PCR:
     case M68K_CR_BUSCR:
-        break;
+        cpu_abort(env_cpu(env), "Unimplemented control register read 0x%x\n",
+                  reg);
     }
-    cpu_abort(env_cpu(env), "Unimplemented control register read 0x%x\n",
-              reg);
+
+    /* Invalid control registers will generate an exception. */
+    raise_exception_ra(env, EXCP_ILLEGAL, 0);
+
+    return 0;
 }
 
 void HELPER(set_macsr)(CPUM68KState *env, uint32_t val)
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 133a404919..ac936ebe8f 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -6010,7 +6010,7 @@ void register_m68k_insns (CPUM68KState *env)
     BASE(stop,      4e72, ffff);
     BASE(rte,       4e73, ffff);
     INSN(cf_movec,  4e7b, ffff, CF_ISA_A);
-    INSN(m68k_movec, 4e7a, fffe, M68000);
+    INSN(m68k_movec, 4e7a, fffe, MOVEC);
 #endif
     BASE(nop,       4e71, ffff);
     INSN(rtd,       4e74, ffff, RTD);
-- 
2.21.3


