Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5D9399C9D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:32:00 +0200 (CEST)
Received: from localhost ([::1]:44606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loilj-0002IM-7e
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidA-0006kh-6z; Thu, 03 Jun 2021 04:23:09 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:35211 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loid7-0000AW-K6; Thu, 03 Jun 2021 04:23:07 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5n4JJrz9t0Y; Thu,  3 Jun 2021 18:22:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708557;
 bh=sqCwyIrI7iOl8C7DAP3r1xEzTl7gU0uU11MShIc36uU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g8K8jfb4OIRYoXdKhEcHo1Tl2Htm/BsIngVm3owVfj3kMro2ugAUngUIm+lNkgLls
 2XBhbQJ8kLIBDDXhllb8j5CN3JQdhao9DITkMOPnvxii1uiuyqwMuLzu2HWCh++k4S
 0CCjhUvfdORxz6QoK9RGaj6O2YUGPz1zkTwg0uBA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 24/42] target/ppc: overhauled and moved logic of storing fpscr
Date: Thu,  3 Jun 2021 18:22:13 +1000
Message-Id: <20210603082231.601214-25-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

Followed the suggested overhaul to store_fpscr logic, and moved it to
cpu.c where it can be accessed in !TCG builds.

The overhaul was suggested because storing a value to fpscr should
never raise an exception, so we could remove all the mess that happened
with POWERPC_EXCP_FP.

We also moved fpscr_set_rounding_mode into cpu.c as it could now be moved
there, and it is needed when a value for the fpscr is being stored
directly.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210527163522.23019-1-bruno.larsen@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.c        |  43 ++++++++
 target/ppc/cpu.h        |  12 +-
 target/ppc/fpu_helper.c | 238 +++-------------------------------------
 target/ppc/gdbstub.c    |   6 +-
 4 files changed, 65 insertions(+), 234 deletions(-)

diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index c8e87e30f1..19d67b5b07 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -25,6 +25,7 @@
 #include "fpu/softfloat-helpers.h"
 #include "mmu-hash64.h"
 #include "helper_regs.h"
+#include "sysemu/tcg.h"
 
 target_ulong cpu_read_xer(CPUPPCState *env)
 {
@@ -109,3 +110,45 @@ void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val)
     /* The gtse bit affects hflags */
     hreg_compute_hflags(env);
 }
+
+static inline void fpscr_set_rounding_mode(CPUPPCState *env)
+{
+    int rnd_type;
+
+    /* Set rounding mode */
+    switch (fpscr_rn) {
+    case 0:
+        /* Best approximation (round to nearest) */
+        rnd_type = float_round_nearest_even;
+        break;
+    case 1:
+        /* Smaller magnitude (round toward zero) */
+        rnd_type = float_round_to_zero;
+        break;
+    case 2:
+        /* Round toward +infinite */
+        rnd_type = float_round_up;
+        break;
+    default:
+    case 3:
+        /* Round toward -infinite */
+        rnd_type = float_round_down;
+        break;
+    }
+    set_float_rounding_mode(rnd_type, &env->fp_status);
+}
+
+void ppc_store_fpscr(CPUPPCState *env, target_ulong val)
+{
+    val &= ~(FP_VX | FP_FEX);
+    if (val & FPSCR_IX) {
+        val |= FP_VX;
+    }
+    if ((val >> FPSCR_XX) & (val >> FPSCR_XE) & 0x1f) {
+        val |= FP_FEX;
+    }
+    env->fpscr = val;
+    if (tcg_enabled()) {
+        fpscr_set_rounding_mode(env);
+    }
+}
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index b0934d9be4..b7ae4902e4 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -675,11 +675,11 @@ enum {
 #define fpscr_ni     (((env->fpscr) >> FPSCR_NI)     & 0x1)
 #define fpscr_rn     (((env->fpscr) >> FPSCR_RN0)    & 0x3)
 /* Invalid operation exception summary */
-#define fpscr_ix ((env->fpscr) & ((1 << FPSCR_VXSNAN) | (1 << FPSCR_VXISI)  | \
-                                  (1 << FPSCR_VXIDI)  | (1 << FPSCR_VXZDZ)  | \
-                                  (1 << FPSCR_VXIMZ)  | (1 << FPSCR_VXVC)   | \
-                                  (1 << FPSCR_VXSOFT) | (1 << FPSCR_VXSQRT) | \
-                                  (1 << FPSCR_VXCVI)))
+#define FPSCR_IX     ((1 << FPSCR_VXSNAN) | (1 << FPSCR_VXISI)  | \
+                      (1 << FPSCR_VXIDI)  | (1 << FPSCR_VXZDZ)  | \
+                      (1 << FPSCR_VXIMZ)  | (1 << FPSCR_VXVC)   | \
+                      (1 << FPSCR_VXSOFT) | (1 << FPSCR_VXSQRT) | \
+                      (1 << FPSCR_VXCVI))
 /* exception summary */
 #define fpscr_ex  (((env->fpscr) >> FPSCR_XX) & 0x1F)
 /* enabled exception summary */
@@ -1332,7 +1332,7 @@ void cpu_ppc_set_vhyp(PowerPCCPU *cpu, PPCVirtualHypervisor *vhyp);
 #endif
 #endif
 
-void store_fpscr(CPUPPCState *env, uint64_t arg, uint32_t mask);
+void ppc_store_fpscr(CPUPPCState *env, target_ulong val);
 void helper_hfscr_facility_check(CPUPPCState *env, uint32_t bit,
                                  const char *caller, uint32_t cause);
 
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index a4a283df2b..c4896cecc8 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -383,247 +383,35 @@ static inline void float_inexact_excp(CPUPPCState *env)
     }
 }
 
-static inline void fpscr_set_rounding_mode(CPUPPCState *env)
-{
-    int rnd_type;
-
-    /* Set rounding mode */
-    switch (fpscr_rn) {
-    case 0:
-        /* Best approximation (round to nearest) */
-        rnd_type = float_round_nearest_even;
-        break;
-    case 1:
-        /* Smaller magnitude (round toward zero) */
-        rnd_type = float_round_to_zero;
-        break;
-    case 2:
-        /* Round toward +infinite */
-        rnd_type = float_round_up;
-        break;
-    default:
-    case 3:
-        /* Round toward -infinite */
-        rnd_type = float_round_down;
-        break;
-    }
-    set_float_rounding_mode(rnd_type, &env->fp_status);
-}
-
 void helper_fpscr_clrbit(CPUPPCState *env, uint32_t bit)
 {
-    int prev;
-
-    prev = (env->fpscr >> bit) & 1;
-    env->fpscr &= ~(1 << bit);
-    if (prev == 1) {
-        switch (bit) {
-        case FPSCR_RN1:
-        case FPSCR_RN0:
-            fpscr_set_rounding_mode(env);
-            break;
-        case FPSCR_VXSNAN:
-        case FPSCR_VXISI:
-        case FPSCR_VXIDI:
-        case FPSCR_VXZDZ:
-        case FPSCR_VXIMZ:
-        case FPSCR_VXVC:
-        case FPSCR_VXSOFT:
-        case FPSCR_VXSQRT:
-        case FPSCR_VXCVI:
-            if (!fpscr_ix) {
-                /* Set VX bit to zero */
-                env->fpscr &= ~FP_VX;
-            }
-            break;
-        case FPSCR_OX:
-        case FPSCR_UX:
-        case FPSCR_ZX:
-        case FPSCR_XX:
-        case FPSCR_VE:
-        case FPSCR_OE:
-        case FPSCR_UE:
-        case FPSCR_ZE:
-        case FPSCR_XE:
-            if (!fpscr_eex) {
-                /* Set the FEX bit */
-                env->fpscr &= ~FP_FEX;
-            }
-            break;
-        default:
-            break;
-        }
+    uint32_t mask = 1u << bit;
+    if (env->fpscr & mask) {
+        ppc_store_fpscr(env, env->fpscr & ~(target_ulong)mask);
     }
 }
 
 void helper_fpscr_setbit(CPUPPCState *env, uint32_t bit)
 {
-    CPUState *cs = env_cpu(env);
-    int prev;
-
-    prev = (env->fpscr >> bit) & 1;
-    env->fpscr |= 1 << bit;
-    if (prev == 0) {
-        switch (bit) {
-        case FPSCR_VX:
-            env->fpscr |= FP_FX;
-            if (fpscr_ve) {
-                goto raise_ve;
-            }
-            break;
-        case FPSCR_OX:
-            env->fpscr |= FP_FX;
-            if (fpscr_oe) {
-                goto raise_oe;
-            }
-            break;
-        case FPSCR_UX:
-            env->fpscr |= FP_FX;
-            if (fpscr_ue) {
-                goto raise_ue;
-            }
-            break;
-        case FPSCR_ZX:
-            env->fpscr |= FP_FX;
-            if (fpscr_ze) {
-                goto raise_ze;
-            }
-            break;
-        case FPSCR_XX:
-            env->fpscr |= FP_FX;
-            if (fpscr_xe) {
-                goto raise_xe;
-            }
-            break;
-        case FPSCR_VXSNAN:
-        case FPSCR_VXISI:
-        case FPSCR_VXIDI:
-        case FPSCR_VXZDZ:
-        case FPSCR_VXIMZ:
-        case FPSCR_VXVC:
-        case FPSCR_VXSOFT:
-        case FPSCR_VXSQRT:
-        case FPSCR_VXCVI:
-            env->fpscr |= FP_VX;
-            env->fpscr |= FP_FX;
-            if (fpscr_ve != 0) {
-                goto raise_ve;
-            }
-            break;
-        case FPSCR_VE:
-            if (fpscr_vx != 0) {
-            raise_ve:
-                env->error_code = POWERPC_EXCP_FP;
-                if (fpscr_vxsnan) {
-                    env->error_code |= POWERPC_EXCP_FP_VXSNAN;
-                }
-                if (fpscr_vxisi) {
-                    env->error_code |= POWERPC_EXCP_FP_VXISI;
-                }
-                if (fpscr_vxidi) {
-                    env->error_code |= POWERPC_EXCP_FP_VXIDI;
-                }
-                if (fpscr_vxzdz) {
-                    env->error_code |= POWERPC_EXCP_FP_VXZDZ;
-                }
-                if (fpscr_vximz) {
-                    env->error_code |= POWERPC_EXCP_FP_VXIMZ;
-                }
-                if (fpscr_vxvc) {
-                    env->error_code |= POWERPC_EXCP_FP_VXVC;
-                }
-                if (fpscr_vxsoft) {
-                    env->error_code |= POWERPC_EXCP_FP_VXSOFT;
-                }
-                if (fpscr_vxsqrt) {
-                    env->error_code |= POWERPC_EXCP_FP_VXSQRT;
-                }
-                if (fpscr_vxcvi) {
-                    env->error_code |= POWERPC_EXCP_FP_VXCVI;
-                }
-                goto raise_excp;
-            }
-            break;
-        case FPSCR_OE:
-            if (fpscr_ox != 0) {
-            raise_oe:
-                env->error_code = POWERPC_EXCP_FP | POWERPC_EXCP_FP_OX;
-                goto raise_excp;
-            }
-            break;
-        case FPSCR_UE:
-            if (fpscr_ux != 0) {
-            raise_ue:
-                env->error_code = POWERPC_EXCP_FP | POWERPC_EXCP_FP_UX;
-                goto raise_excp;
-            }
-            break;
-        case FPSCR_ZE:
-            if (fpscr_zx != 0) {
-            raise_ze:
-                env->error_code = POWERPC_EXCP_FP | POWERPC_EXCP_FP_ZX;
-                goto raise_excp;
-            }
-            break;
-        case FPSCR_XE:
-            if (fpscr_xx != 0) {
-            raise_xe:
-                env->error_code = POWERPC_EXCP_FP | POWERPC_EXCP_FP_XX;
-                goto raise_excp;
-            }
-            break;
-        case FPSCR_RN1:
-        case FPSCR_RN0:
-            fpscr_set_rounding_mode(env);
-            break;
-        default:
-            break;
-        raise_excp:
-            /* Update the floating-point enabled exception summary */
-            env->fpscr |= FP_FEX;
-            /* We have to update Rc1 before raising the exception */
-            cs->exception_index = POWERPC_EXCP_PROGRAM;
-            break;
-        }
+    uint32_t mask = 1u << bit;
+    if (!(env->fpscr & mask)) {
+        ppc_store_fpscr(env, env->fpscr | mask);
     }
 }
 
-void helper_store_fpscr(CPUPPCState *env, uint64_t arg, uint32_t mask)
+void helper_store_fpscr(CPUPPCState *env, uint64_t val, uint32_t nibbles)
 {
-    CPUState *cs = env_cpu(env);
-    target_ulong prev, new;
+    target_ulong mask = 0;
     int i;
 
-    prev = env->fpscr;
-    new = (target_ulong)arg;
-    new &= ~(FP_FEX | FP_VX);
-    new |= prev & (FP_FEX | FP_VX);
+    /* TODO: push this extension back to translation time */
     for (i = 0; i < sizeof(target_ulong) * 2; i++) {
-        if (mask & (1 << i)) {
-            env->fpscr &= ~(0xFLL << (4 * i));
-            env->fpscr |= new & (0xFLL << (4 * i));
+        if (nibbles & (1 << i)) {
+            mask |= (target_ulong) 0xf << (4 * i);
         }
     }
-    /* Update VX and FEX */
-    if (fpscr_ix != 0) {
-        env->fpscr |= FP_VX;
-    } else {
-        env->fpscr &= ~FP_VX;
-    }
-    if ((fpscr_ex & fpscr_eex) != 0) {
-        env->fpscr |= FP_FEX;
-        cs->exception_index = POWERPC_EXCP_PROGRAM;
-        /* XXX: we should compute it properly */
-        env->error_code = POWERPC_EXCP_FP;
-    } else {
-        env->fpscr &= ~FP_FEX;
-    }
-    fpscr_set_rounding_mode(env);
-}
-
-void store_fpscr(CPUPPCState *env, uint64_t arg, uint32_t mask)
-{
-    helper_store_fpscr(env, arg, mask);
+    val = (val & mask) | (env->fpscr & ~mask);
+    ppc_store_fpscr(env, val);
 }
 
 static void do_float_check_status(CPUPPCState *env, uintptr_t raddr)
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index 308b98fc90..09ff1328d4 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -271,7 +271,7 @@ int ppc_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
             break;
         case 70:
             /* fpscr */
-            store_fpscr(env, ldtul_p(mem_buf), 0xffffffff);
+            ppc_store_fpscr(env, ldtul_p(mem_buf));
             break;
         }
     }
@@ -321,7 +321,7 @@ int ppc_cpu_gdb_write_register_apple(CPUState *cs, uint8_t *mem_buf, int n)
             break;
         case 70 + 32:
             /* fpscr */
-            store_fpscr(env, ldq_p(mem_buf), 0xffffffff);
+            ppc_store_fpscr(env, ldq_p(mem_buf));
             break;
         }
     }
@@ -474,7 +474,7 @@ static int gdb_set_float_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
     }
     if (n == 32) {
         ppc_maybe_bswap_register(env, mem_buf, 4);
-        store_fpscr(env, ldl_p(mem_buf), 0xffffffff);
+        ppc_store_fpscr(env, ldl_p(mem_buf));
         return 4;
     }
     return 0;
-- 
2.31.1


