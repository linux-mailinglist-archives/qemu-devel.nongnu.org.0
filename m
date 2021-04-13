Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D4D35E217
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 16:59:03 +0200 (CEST)
Received: from localhost ([::1]:57804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWKVK-0004f1-61
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 10:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lWKRv-0004B5-Dv
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 10:55:31 -0400
Received: from [201.28.113.2] (port=30593 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>) id 1lWKRq-0005lK-ER
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 10:55:29 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 13 Apr 2021 11:54:42 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 7A4068011B4;
 Tue, 13 Apr 2021 11:54:42 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/ppc: code motion from translate_init.c.inc to
 gdbstub.c
Date: Tue, 13 Apr 2021 11:54:27 -0300
Message-Id: <20210413145427.41749-1-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
X-OriginalArrivalTime: 13 Apr 2021 14:54:42.0649 (UTC)
 FILETIME=[EFB22C90:01D73074]
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
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All the code related to gdb has been moved from translate_init.c.inc
file to the gdbstub.c file, where it makes more sense.

Updated version, solving some missing parts of the patch and style choices.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu.h                |   6 +
 target/ppc/gdbstub.c            | 258 ++++++++++++++++++++++++++++++++
 target/ppc/translate_init.c.inc | 254 +------------------------------
 3 files changed, 265 insertions(+), 253 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index e73416da68..8017ecb33f 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2612,4 +2612,10 @@ static inline ppc_avr_t *cpu_avr_ptr(CPUPPCState *env, int i)
 void dump_mmu(CPUPPCState *env);
 
 void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len);
+
+/* gdbstub.c */
+void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *ppc);
+gchar *ppc_gdb_arch_name(CPUState *cs);
+
+
 #endif /* PPC_CPU_H */
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index c28319fb97..67e8a3175f 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/gdbstub.h"
+#include "exec/helper-proto.h"
 
 static int ppc_gdb_register_len_apple(int n)
 {
@@ -387,3 +388,260 @@ const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name)
     return NULL;
 }
 #endif
+
+static bool avr_need_swap(CPUPPCState *env)
+{
+#ifdef HOST_WORDS_BIGENDIAN
+    return msr_le;
+#else
+    return !msr_le;
+#endif
+}
+
+#if !defined(CONFIG_USER_ONLY)
+static int gdb_find_spr_idx(CPUPPCState *env, int n)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(env->spr_cb); i++) {
+        ppc_spr_t *spr = &env->spr_cb[i];
+
+        if (spr->name && spr->gdb_id == n) {
+            return i;
+        }
+    }
+    return -1;
+}
+
+static int gdb_get_spr_reg(CPUPPCState *env, GByteArray *buf, int n)
+{
+    int reg;
+    int len;
+
+    reg = gdb_find_spr_idx(env, n);
+    if (reg < 0) {
+        return 0;
+    }
+
+    len = TARGET_LONG_SIZE;
+    gdb_get_regl(buf, env->spr[reg]);
+    ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, len), len);
+    return len;
+}
+
+static int gdb_set_spr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
+{
+    int reg;
+    int len;
+
+    reg = gdb_find_spr_idx(env, n);
+    if (reg < 0) {
+        return 0;
+    }
+
+    len = TARGET_LONG_SIZE;
+    ppc_maybe_bswap_register(env, mem_buf, len);
+    env->spr[reg] = ldn_p(mem_buf, len);
+
+    return len;
+}
+#endif
+
+static int gdb_get_float_reg(CPUPPCState *env, GByteArray *buf, int n)
+{
+    uint8_t *mem_buf;
+    if (n < 32) {
+        gdb_get_reg64(buf, *cpu_fpr_ptr(env, n));
+        mem_buf = gdb_get_reg_ptr(buf, 8);
+        ppc_maybe_bswap_register(env, mem_buf, 8);
+        return 8;
+    }
+    if (n == 32) {
+        gdb_get_reg32(buf, env->fpscr);
+        mem_buf = gdb_get_reg_ptr(buf, 4);
+        ppc_maybe_bswap_register(env, mem_buf, 4);
+        return 4;
+    }
+    return 0;
+}
+
+static int gdb_set_float_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
+{
+    if (n < 32) {
+        ppc_maybe_bswap_register(env, mem_buf, 8);
+        *cpu_fpr_ptr(env, n) = ldq_p(mem_buf);
+        return 8;
+    }
+    if (n == 32) {
+        ppc_maybe_bswap_register(env, mem_buf, 4);
+        store_fpscr(env, ldl_p(mem_buf), 0xffffffff);
+        return 4;
+    }
+    return 0;
+}
+
+static int gdb_get_avr_reg(CPUPPCState *env, GByteArray *buf, int n)
+{
+    uint8_t *mem_buf;
+
+    if (n < 32) {
+        ppc_avr_t *avr = cpu_avr_ptr(env, n);
+        if (!avr_need_swap(env)) {
+            gdb_get_reg128(buf, avr->u64[0] , avr->u64[1]);
+        } else {
+            gdb_get_reg128(buf, avr->u64[1] , avr->u64[0]);
+        }
+        mem_buf = gdb_get_reg_ptr(buf, 16);
+        ppc_maybe_bswap_register(env, mem_buf, 8);
+        ppc_maybe_bswap_register(env, mem_buf + 8, 8);
+        return 16;
+    }
+    if (n == 32) {
+        gdb_get_reg32(buf, helper_mfvscr(env));
+        mem_buf = gdb_get_reg_ptr(buf, 4);
+        ppc_maybe_bswap_register(env, mem_buf, 4);
+        return 4;
+    }
+    if (n == 33) {
+        gdb_get_reg32(buf, (uint32_t)env->spr[SPR_VRSAVE]);
+        mem_buf = gdb_get_reg_ptr(buf, 4);
+        ppc_maybe_bswap_register(env, mem_buf, 4);
+        return 4;
+    }
+    return 0;
+}
+
+static int gdb_set_avr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
+{
+    if (n < 32) {
+        ppc_avr_t *avr = cpu_avr_ptr(env, n);
+        ppc_maybe_bswap_register(env, mem_buf, 8);
+        ppc_maybe_bswap_register(env, mem_buf + 8, 8);
+        if (!avr_need_swap(env)) {
+            avr->u64[0] = ldq_p(mem_buf);
+            avr->u64[1] = ldq_p(mem_buf + 8);
+        } else {
+            avr->u64[1] = ldq_p(mem_buf);
+            avr->u64[0] = ldq_p(mem_buf + 8);
+        }
+        return 16;
+    }
+    if (n == 32) {
+        ppc_maybe_bswap_register(env, mem_buf, 4);
+        helper_mtvscr(env, ldl_p(mem_buf));
+        return 4;
+    }
+    if (n == 33) {
+        ppc_maybe_bswap_register(env, mem_buf, 4);
+        env->spr[SPR_VRSAVE] = (target_ulong)ldl_p(mem_buf);
+        return 4;
+    }
+    return 0;
+}
+
+static int gdb_get_spe_reg(CPUPPCState *env, GByteArray *buf, int n)
+{
+    if (n < 32) {
+#if defined(TARGET_PPC64)
+        gdb_get_reg32(buf, env->gpr[n] >> 32);
+        ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, 4), 4);
+#else
+        gdb_get_reg32(buf, env->gprh[n]);
+#endif
+        return 4;
+    }
+    if (n == 32) {
+        gdb_get_reg64(buf, env->spe_acc);
+        ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, 8), 8);
+        return 8;
+    }
+    if (n == 33) {
+        gdb_get_reg32(buf, env->spe_fscr);
+        ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, 4), 4);
+        return 4;
+    }
+    return 0;
+}
+
+static int gdb_set_spe_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
+{
+    if (n < 32) {
+#if defined(TARGET_PPC64)
+        target_ulong lo = (uint32_t)env->gpr[n];
+        target_ulong hi;
+
+        ppc_maybe_bswap_register(env, mem_buf, 4);
+
+        hi = (target_ulong)ldl_p(mem_buf) << 32;
+        env->gpr[n] = lo | hi;
+#else
+        env->gprh[n] = ldl_p(mem_buf);
+#endif
+        return 4;
+    }
+    if (n == 32) {
+        ppc_maybe_bswap_register(env, mem_buf, 8);
+        env->spe_acc = ldq_p(mem_buf);
+        return 8;
+    }
+    if (n == 33) {
+        ppc_maybe_bswap_register(env, mem_buf, 4);
+        env->spe_fscr = ldl_p(mem_buf);
+        return 4;
+    }
+    return 0;
+}
+
+static int gdb_get_vsx_reg(CPUPPCState *env, GByteArray *buf, int n)
+{
+    if (n < 32) {
+        gdb_get_reg64(buf, *cpu_vsrl_ptr(env, n));
+        ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, 8), 8);
+        return 8;
+    }
+    return 0;
+}
+
+static int gdb_set_vsx_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
+{
+    if (n < 32) {
+        ppc_maybe_bswap_register(env, mem_buf, 8);
+        *cpu_vsrl_ptr(env, n) = ldq_p(mem_buf);
+        return 8;
+    }
+    return 0;
+}
+
+gchar *ppc_gdb_arch_name(CPUState *cs)
+{
+#if defined(TARGET_PPC64)
+    return g_strdup("powerpc:common64");
+#else
+    return g_strdup("powerpc:common");
+#endif
+}
+
+void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *pcc)
+{
+
+    if (pcc->insns_flags & PPC_FLOAT) {
+        gdb_register_coprocessor(cs, gdb_get_float_reg, gdb_set_float_reg,
+                                 33, "power-fpu.xml", 0);
+    }
+    if (pcc->insns_flags & PPC_ALTIVEC) {
+        gdb_register_coprocessor(cs, gdb_get_avr_reg, gdb_set_avr_reg,
+                                 34, "power-altivec.xml", 0);
+    }
+    if (pcc->insns_flags & PPC_SPE) {
+        gdb_register_coprocessor(cs, gdb_get_spe_reg, gdb_set_spe_reg,
+                                 34, "power-spe.xml", 0);
+    }
+    if (pcc->insns_flags2 & PPC2_VSX) {
+        gdb_register_coprocessor(cs, gdb_get_vsx_reg, gdb_set_vsx_reg,
+                                 32, "power-vsx.xml", 0);
+    }
+#ifndef CONFIG_USER_ONLY
+    gdb_register_coprocessor(cs, gdb_get_spr_reg, gdb_set_spr_reg,
+                             pcc->gdb_num_sprs, "power-spr.xml", 0);
+#endif
+}
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index c03a7c4f52..80fef0b90d 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -9895,230 +9895,6 @@ static void dump_ppc_insns(CPUPPCState *env)
     }
 }
 #endif
-
-static bool avr_need_swap(CPUPPCState *env)
-{
-#ifdef HOST_WORDS_BIGENDIAN
-    return msr_le;
-#else
-    return !msr_le;
-#endif
-}
-
-#if !defined(CONFIG_USER_ONLY)
-static int gdb_find_spr_idx(CPUPPCState *env, int n)
-{
-    int i;
-
-    for (i = 0; i < ARRAY_SIZE(env->spr_cb); i++) {
-        ppc_spr_t *spr = &env->spr_cb[i];
-
-        if (spr->name && spr->gdb_id == n) {
-            return i;
-        }
-    }
-    return -1;
-}
-
-static int gdb_get_spr_reg(CPUPPCState *env, GByteArray *buf, int n)
-{
-    int reg;
-    int len;
-
-    reg = gdb_find_spr_idx(env, n);
-    if (reg < 0) {
-        return 0;
-    }
-
-    len = TARGET_LONG_SIZE;
-    gdb_get_regl(buf, env->spr[reg]);
-    ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, len), len);
-    return len;
-}
-
-static int gdb_set_spr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
-{
-    int reg;
-    int len;
-
-    reg = gdb_find_spr_idx(env, n);
-    if (reg < 0) {
-        return 0;
-    }
-
-    len = TARGET_LONG_SIZE;
-    ppc_maybe_bswap_register(env, mem_buf, len);
-    env->spr[reg] = ldn_p(mem_buf, len);
-
-    return len;
-}
-#endif
-
-static int gdb_get_float_reg(CPUPPCState *env, GByteArray *buf, int n)
-{
-    uint8_t *mem_buf;
-    if (n < 32) {
-        gdb_get_reg64(buf, *cpu_fpr_ptr(env, n));
-        mem_buf = gdb_get_reg_ptr(buf, 8);
-        ppc_maybe_bswap_register(env, mem_buf, 8);
-        return 8;
-    }
-    if (n == 32) {
-        gdb_get_reg32(buf, env->fpscr);
-        mem_buf = gdb_get_reg_ptr(buf, 4);
-        ppc_maybe_bswap_register(env, mem_buf, 4);
-        return 4;
-    }
-    return 0;
-}
-
-static int gdb_set_float_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
-{
-    if (n < 32) {
-        ppc_maybe_bswap_register(env, mem_buf, 8);
-        *cpu_fpr_ptr(env, n) = ldq_p(mem_buf);
-        return 8;
-    }
-    if (n == 32) {
-        ppc_maybe_bswap_register(env, mem_buf, 4);
-        helper_store_fpscr(env, ldl_p(mem_buf), 0xffffffff);
-        return 4;
-    }
-    return 0;
-}
-
-static int gdb_get_avr_reg(CPUPPCState *env, GByteArray *buf, int n)
-{
-    uint8_t *mem_buf;
-
-    if (n < 32) {
-        ppc_avr_t *avr = cpu_avr_ptr(env, n);
-        if (!avr_need_swap(env)) {
-            gdb_get_reg128(buf, avr->u64[0] , avr->u64[1]);
-        } else {
-            gdb_get_reg128(buf, avr->u64[1] , avr->u64[0]);
-        }
-        mem_buf = gdb_get_reg_ptr(buf, 16);
-        ppc_maybe_bswap_register(env, mem_buf, 8);
-        ppc_maybe_bswap_register(env, mem_buf + 8, 8);
-        return 16;
-    }
-    if (n == 32) {
-        gdb_get_reg32(buf, helper_mfvscr(env));
-        mem_buf = gdb_get_reg_ptr(buf, 4);
-        ppc_maybe_bswap_register(env, mem_buf, 4);
-        return 4;
-    }
-    if (n == 33) {
-        gdb_get_reg32(buf, (uint32_t)env->spr[SPR_VRSAVE]);
-        mem_buf = gdb_get_reg_ptr(buf, 4);
-        ppc_maybe_bswap_register(env, mem_buf, 4);
-        return 4;
-    }
-    return 0;
-}
-
-static int gdb_set_avr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
-{
-    if (n < 32) {
-        ppc_avr_t *avr = cpu_avr_ptr(env, n);
-        ppc_maybe_bswap_register(env, mem_buf, 8);
-        ppc_maybe_bswap_register(env, mem_buf + 8, 8);
-        if (!avr_need_swap(env)) {
-            avr->u64[0] = ldq_p(mem_buf);
-            avr->u64[1] = ldq_p(mem_buf + 8);
-        } else {
-            avr->u64[1] = ldq_p(mem_buf);
-            avr->u64[0] = ldq_p(mem_buf + 8);
-        }
-        return 16;
-    }
-    if (n == 32) {
-        ppc_maybe_bswap_register(env, mem_buf, 4);
-        helper_mtvscr(env, ldl_p(mem_buf));
-        return 4;
-    }
-    if (n == 33) {
-        ppc_maybe_bswap_register(env, mem_buf, 4);
-        env->spr[SPR_VRSAVE] = (target_ulong)ldl_p(mem_buf);
-        return 4;
-    }
-    return 0;
-}
-
-static int gdb_get_spe_reg(CPUPPCState *env, GByteArray *buf, int n)
-{
-    if (n < 32) {
-#if defined(TARGET_PPC64)
-        gdb_get_reg32(buf, env->gpr[n] >> 32);
-        ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, 4), 4);
-#else
-        gdb_get_reg32(buf, env->gprh[n]);
-#endif
-        return 4;
-    }
-    if (n == 32) {
-        gdb_get_reg64(buf, env->spe_acc);
-        ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, 8), 8);
-        return 8;
-    }
-    if (n == 33) {
-        gdb_get_reg32(buf, env->spe_fscr);
-        ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, 4), 4);
-        return 4;
-    }
-    return 0;
-}
-
-static int gdb_set_spe_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
-{
-    if (n < 32) {
-#if defined(TARGET_PPC64)
-        target_ulong lo = (uint32_t)env->gpr[n];
-        target_ulong hi;
-
-        ppc_maybe_bswap_register(env, mem_buf, 4);
-
-        hi = (target_ulong)ldl_p(mem_buf) << 32;
-        env->gpr[n] = lo | hi;
-#else
-        env->gprh[n] = ldl_p(mem_buf);
-#endif
-        return 4;
-    }
-    if (n == 32) {
-        ppc_maybe_bswap_register(env, mem_buf, 8);
-        env->spe_acc = ldq_p(mem_buf);
-        return 8;
-    }
-    if (n == 33) {
-        ppc_maybe_bswap_register(env, mem_buf, 4);
-        env->spe_fscr = ldl_p(mem_buf);
-        return 4;
-    }
-    return 0;
-}
-
-static int gdb_get_vsx_reg(CPUPPCState *env, GByteArray *buf, int n)
-{
-    if (n < 32) {
-        gdb_get_reg64(buf, *cpu_vsrl_ptr(env, n));
-        ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, 8), 8);
-        return 8;
-    }
-    return 0;
-}
-
-static int gdb_set_vsx_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
-{
-    if (n < 32) {
-        ppc_maybe_bswap_register(env, mem_buf, 8);
-        *cpu_vsrl_ptr(env, n) = ldq_p(mem_buf);
-        return 8;
-    }
-    return 0;
-}
-
 static int ppc_fixup_cpu(PowerPCCPU *cpu)
 {
     CPUPPCState *env = &cpu->env;
@@ -10174,26 +9950,7 @@ static void ppc_cpu_realize(DeviceState *dev, Error **errp)
     }
     init_ppc_proc(cpu);
 
-    if (pcc->insns_flags & PPC_FLOAT) {
-        gdb_register_coprocessor(cs, gdb_get_float_reg, gdb_set_float_reg,
-                                 33, "power-fpu.xml", 0);
-    }
-    if (pcc->insns_flags & PPC_ALTIVEC) {
-        gdb_register_coprocessor(cs, gdb_get_avr_reg, gdb_set_avr_reg,
-                                 34, "power-altivec.xml", 0);
-    }
-    if (pcc->insns_flags & PPC_SPE) {
-        gdb_register_coprocessor(cs, gdb_get_spe_reg, gdb_set_spe_reg,
-                                 34, "power-spe.xml", 0);
-    }
-    if (pcc->insns_flags2 & PPC2_VSX) {
-        gdb_register_coprocessor(cs, gdb_get_vsx_reg, gdb_set_vsx_reg,
-                                 32, "power-vsx.xml", 0);
-    }
-#ifndef CONFIG_USER_ONLY
-    gdb_register_coprocessor(cs, gdb_get_spr_reg, gdb_set_spr_reg,
-                             pcc->gdb_num_sprs, "power-spr.xml", 0);
-#endif
+    ppc_gdb_init(cs, pcc);
     qemu_init_vcpu(cs);
 
     pcc->parent_realize(dev, errp);
@@ -10835,15 +10592,6 @@ static bool ppc_pvr_match_default(PowerPCCPUClass *pcc, uint32_t pvr)
     return pcc->pvr == pvr;
 }
 
-static gchar *ppc_gdb_arch_name(CPUState *cs)
-{
-#if defined(TARGET_PPC64)
-    return g_strdup("powerpc:common64");
-#else
-    return g_strdup("powerpc:common");
-#endif
-}
-
 static void ppc_disas_set_info(CPUState *cs, disassemble_info *info)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
-- 
2.17.1


