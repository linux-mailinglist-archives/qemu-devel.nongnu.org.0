Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530893725E6
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:41:41 +0200 (CEST)
Received: from localhost ([::1]:51528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldokW-0003OW-BA
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo0z-0006go-4s; Tue, 04 May 2021 01:54:37 -0400
Received: from ozlabs.org ([203.11.71.1]:36827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo0u-00059E-AB; Tue, 04 May 2021 01:54:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CP0mB7z9t0T; Tue,  4 May 2021 15:53:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107601;
 bh=U9GyzUbSH4St3uV5hHuWwRQqe01HWFvGg8Y2fjxAvJo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DxTFQB6UuPErgkaxdNKNKXhzix15+C828C4kbavMLcvyN9hQdufwt1RoKrhcfu3or
 OVUgNIc7Gn4WUdsV8fMH9LfF+n5lYPySo2QaZDOFYYV35dp8RaypYEVBfAsK9Iij3P
 FYdL9Us01BLUZSlN6PvtV4ynKQC+61hKfsWBd1o4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 37/46] target/ppc: code motion from translate_init.c.inc to
 gdbstub.c
Date: Tue,  4 May 2021 15:53:03 +1000
Message-Id: <20210504055312.306823-38-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

All the code related to gdb has been moved from translate_init.c.inc
file to the gdbstub.c file, where it makes more sense.

Version 4 fixes the omission of internal.h in gdbstub, mentioned in
<87sg3d2gf5.fsf@linux.ibm.com>, and the extra blank line.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20210426184706.48040-1-bruno.larsen@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/gdbstub.c            | 258 ++++++++++++++++++++++++++++++++
 target/ppc/internal.h           |   5 +
 target/ppc/translate_init.c.inc | 254 +------------------------------
 3 files changed, 264 insertions(+), 253 deletions(-)

diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index c28319fb97..94a7273ee0 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -20,6 +20,8 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/gdbstub.h"
+#include "exec/helper-proto.h"
+#include "internal.h"
 
 static int ppc_gdb_register_len_apple(int n)
 {
@@ -387,3 +389,259 @@ const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name)
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
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index d547448065..c401658e8d 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -215,4 +215,9 @@ void helper_compute_fprf_float128(CPUPPCState *env, float128 arg);
 void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                  MMUAccessType access_type,
                                  int mmu_idx, uintptr_t retaddr);
+
+/* gdbstub.c */
+void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *ppc);
+gchar *ppc_gdb_arch_name(CPUState *cs);
+
 #endif /* PPC_INTERNAL_H */
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 58473c4c09..9ab2c32cc4 100644
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
2.31.1


