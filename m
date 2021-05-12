Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D79137BF85
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 16:13:39 +0200 (CEST)
Received: from localhost ([::1]:47120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgpcI-0000ZN-2C
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 10:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lgpXc-00047Z-0J; Wed, 12 May 2021 10:08:48 -0400
Received: from [201.28.113.2] (port=48830 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lgpXa-00081F-8a; Wed, 12 May 2021 10:08:47 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 11:08:38 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id AD12580139F;
 Wed, 12 May 2021 11:08:38 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/11] target/ppc: created ppc_{store,
 get}_vscr for generic vscr usage
Date: Wed, 12 May 2021 11:08:03 -0300
Message-Id: <20210512140813.112884-2-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 12 May 2021 14:08:38.0847 (UTC)
 FILETIME=[4E5234F0:01D74738]
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

Some functions unrelated to TCG use helper_m{t,f}vscr, so generic versions
of those functions were added to cpu.c, in preparation for compilation
without TCG

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/arch_dump.c  |  3 +--
 target/ppc/cpu.c        | 16 ++++++++++++++++
 target/ppc/cpu.h        |  2 ++
 target/ppc/cpu_init.c   |  2 +-
 target/ppc/gdbstub.c    |  4 ++--
 target/ppc/int_helper.c |  9 ++-------
 6 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
index 9ab04b2c38..9210e61ef4 100644
--- a/target/ppc/arch_dump.c
+++ b/target/ppc/arch_dump.c
@@ -17,7 +17,6 @@
 #include "elf.h"
 #include "sysemu/dump.h"
 #include "sysemu/kvm.h"
-#include "exec/helper-proto.h"
 
 #ifdef TARGET_PPC64
 #define ELFCLASS ELFCLASS64
@@ -176,7 +175,7 @@ static void ppc_write_elf_vmxregset(NoteFuncArg *arg, PowerPCCPU *cpu)
             vmxregset->avr[i].u64[1] = avr->u64[1];
         }
     }
-    vmxregset->vscr.u32[3] = cpu_to_dump32(s, helper_mfvscr(&cpu->env));
+    vmxregset->vscr.u32[3] = cpu_to_dump32(s, ppc_get_vscr(&cpu->env));
 }
 
 static void ppc_write_elf_vsxregset(NoteFuncArg *arg, PowerPCCPU *cpu)
diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index e501a7ff6f..cb794e9f4f 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "cpu-models.h"
+#include "fpu/softfloat-helpers.h"
 
 target_ulong cpu_read_xer(CPUPPCState *env)
 {
@@ -45,3 +46,18 @@ void cpu_write_xer(CPUPPCState *env, target_ulong xer)
                        (1ul << XER_OV) | (1ul << XER_CA) |
                        (1ul << XER_OV32) | (1ul << XER_CA32));
 }
+
+void ppc_store_vscr(CPUPPCState *env, uint32_t vscr)
+{
+    env->vscr = vscr & ~(1u << VSCR_SAT);
+    /* Which bit we set is completely arbitrary, but clear the rest.  */
+    env->vscr_sat.u64[0] = vscr & (1u << VSCR_SAT);
+    env->vscr_sat.u64[1] = 0;
+    set_flush_to_zero((vscr >> VSCR_NJ) & 1, &env->vec_status);
+}
+
+uint32_t ppc_get_vscr(CPUPPCState *env)
+{
+    uint32_t sat = (env->vscr_sat.u64[0] | env->vscr_sat.u64[1]) != 0;
+    return env->vscr | (sat << VSCR_SAT);
+}
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 98fcf1c4d6..f43ceec5cb 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2651,4 +2651,6 @@ static inline bool ppc_has_spr(PowerPCCPU *cpu, int spr)
 void dump_mmu(CPUPPCState *env);
 
 void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len);
+void ppc_store_vscr(CPUPPCState *env, uint32_t vscr);
+uint32_t ppc_get_vscr(CPUPPCState *env);
 #endif /* PPC_CPU_H */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index faece1dca2..b4a2d15c6a 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -55,7 +55,7 @@ static inline void vscr_init(CPUPPCState *env, uint32_t val)
 {
     /* Altivec always uses round-to-nearest */
     set_float_rounding_mode(float_round_nearest_even, &env->vec_status);
-    helper_mtvscr(env, val);
+    ppc_store_vscr(env, val);
 }
 
 /**
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index 94a7273ee0..9339e7eafe 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -498,7 +498,7 @@ static int gdb_get_avr_reg(CPUPPCState *env, GByteArray *buf, int n)
         return 16;
     }
     if (n == 32) {
-        gdb_get_reg32(buf, helper_mfvscr(env));
+        gdb_get_reg32(buf, ppc_get_vscr(env));
         mem_buf = gdb_get_reg_ptr(buf, 4);
         ppc_maybe_bswap_register(env, mem_buf, 4);
         return 4;
@@ -529,7 +529,7 @@ static int gdb_set_avr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
     }
     if (n == 32) {
         ppc_maybe_bswap_register(env, mem_buf, 4);
-        helper_mtvscr(env, ldl_p(mem_buf));
+        ppc_store_vscr(env, ldl_p(mem_buf));
         return 4;
     }
     if (n == 33) {
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index a44c2d90ea..41f8477d4b 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -462,17 +462,12 @@ SATCVT(sd, uw, int64_t, uint32_t, 0, UINT32_MAX)
 
 void helper_mtvscr(CPUPPCState *env, uint32_t vscr)
 {
-    env->vscr = vscr & ~(1u << VSCR_SAT);
-    /* Which bit we set is completely arbitrary, but clear the rest.  */
-    env->vscr_sat.u64[0] = vscr & (1u << VSCR_SAT);
-    env->vscr_sat.u64[1] = 0;
-    set_flush_to_zero((vscr >> VSCR_NJ) & 1, &env->vec_status);
+    ppc_store_vscr(env, vscr);
 }
 
 uint32_t helper_mfvscr(CPUPPCState *env)
 {
-    uint32_t sat = (env->vscr_sat.u64[0] | env->vscr_sat.u64[1]) != 0;
-    return env->vscr | (sat << VSCR_SAT);
+    return ppc_get_vscr(env);
 }
 
 static inline void set_vscr_sat(CPUPPCState *env)
-- 
2.17.1


