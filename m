Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DCB31A6C8
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 22:23:33 +0100 (CET)
Received: from localhost ([::1]:50324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAfuW-0001BF-4k
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 16:23:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAfmJ-00020n-3J
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 16:15:03 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:34767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAfmE-0003Sf-Ad
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 16:15:02 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N2m7Q-1ltW2E3JRk-0135ZY; Fri, 12 Feb 2021 22:14:55 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] m68k: MOVEC insn. should generate exception if wrong CR is
 accessed
Date: Fri, 12 Feb 2021 22:14:46 +0100
Message-Id: <20210212211448.413489-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210212211448.413489-1-laurent@vivier.eu>
References: <20210212211448.413489-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZKgHUd1/05UCojWuqupnIqAQnknAji7uZzT+LS34LpufDi2563i
 wdHj7MPiGzHFG/LelrPiNO9hTCBZJU5x4EqmEnFC60uW5uBJlBrg/iaAkgW9aWJWMSIFCxq
 i6Nw9n9EozykoujRaBEUMJLvoZSKBmxtgtHD0N02tob1RgBXHQtysb+PhOMU68W2/Jl6YAC
 6UFCTWj37lT/lZnFJ2opw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sHMdwdfE4fU=:+tkotKDKXltFtLRXkum+ZV
 0SCtj81wsRktogj76cX+rxR2mwRZSvKnMOIg+dEsfJnHHNZ+EZ2C0m8cy+K9jeuh+E2RqFF2X
 5h9owTbGYQx4/wAYmyz99QFYJlqnLywqmLYret90H0y1ruTq5IxfYJO6HM3sPK8UqNHAwZMx3
 nyPi3UlolTttuCGgOza6BhGaFQrsu3ZWFuc9hVocEi1NnSNXHn+Sc2XHI73lZc6ltM+e9i3f1
 rPq5gg4745v7on3hAG3cITYxdtyGTZqiBq1hR2hMsnP2qMpCUzym/Dx9Y6lypjTNf0XqloD1Z
 DqZrNYzbbOkRsJeKh4bnFtE/WwLygVQbm4jxOuI0eEWf6c5CzF4cBX4DVD/iWw6o7SYZAaluf
 wsJZ0Zg1bFgcU9qJYzEOqIerORzt7/afrcLc2dKijetlZQXnfZ/kPsfpxDrF01aK0MrJTfdTF
 SgMhGdI6sQ==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Message-Id: <fc0d0187478716f05d990949347071969b743151.1612137712.git.balaton@eik.bme.hu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/cpu.h       |   1 +
 target/m68k/cpu.c       |   1 +
 target/m68k/helper.c    | 188 ++++++++++++++++++++++++++++++----------
 target/m68k/translate.c |   2 +-
 4 files changed, 146 insertions(+), 46 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index ae34c9461503..5d2cb012e510 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -497,6 +497,7 @@ enum m68k_features {
     M68K_FEATURE_RTD,   /* RTD insn. (680[12346]0, and CPU32) */
     M68K_FEATURE_CHK2,  /* CHK2 insn. (680[2346]0, and CPU32) */
     M68K_FEATURE_MOVEP, /* MOVEP insn. (680[01234]0, and CPU32) */
+    M68K_FEATURE_MOVEC, /* MOVEC insn. (from 68010) */
 };
 
 static inline int m68k_feature(CPUM68KState *env, int feature)
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index d0f8bd44339c..ff3c4c1c9802 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -132,6 +132,7 @@ static void m68010_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_M68010);
     m68k_set_feature(env, M68K_FEATURE_RTD);
     m68k_set_feature(env, M68K_FEATURE_BKPT);
+    m68k_set_feature(env, M68K_FEATURE_MOVEC);
 }
 
 /*
diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 69acdc3b353c..1efd6e4f6555 100644
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
index 133a4049191e..ac936ebe8f14 100644
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
2.29.2


