Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A791E2EB1BB
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:48:01 +0100 (CET)
Received: from localhost ([::1]:54018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqR6-0004BH-Mx
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:48:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0P-0002LN-VH
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:26 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:53553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0G-0006Si-2F
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:23 -0500
Received: by mail-pj1-x1032.google.com with SMTP id iq13so16020pjb.3
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WOv0DhjzP/B7La9rWc03ge4Cn12SIZcALeoyhKgugW0=;
 b=bddzTZls8/NOZGX6+HM4yK/WY+k+OtOEWXPmKjJk/zXWz6RwI/IDMwlaah6iTNiHou
 f99xd9W0K/RbWCIiCQabDr00FZdVllRo9638dPFi3wimCTwJ/BzJYGWAlBfNFew+8YcU
 5l0xw9GAjTJ298ntMKI2QOgEpdQe30MzmAdJoBDDLQq1bh8c5hcQYBJE2dtEhqjUb5q+
 Kc7JWky5HHD462s1y4+/WbwxsE/1XOZsrbx+qQTsIdKCQT8NKMGaVlGg6Iu6h9Qz4Jii
 0IzzivhuEoszC+KljVLPzpaXYPcdtnmHlWZFMLJry+pJ98oEBJLAZVU6yP/SeFvsoeeX
 XLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WOv0DhjzP/B7La9rWc03ge4Cn12SIZcALeoyhKgugW0=;
 b=CfuMTHsS1ChUpIQbkV/g7pyhyH/mLl3yI//4zgmHbii7t2uUUVvr9FFdDAZR9/+soe
 e5bFVlxOF+fUd8ii80Vt8U9IZat3w7oucJ2oFh2zD4Itqrszp3yMqqHJwfcd9pvVx+pj
 ObmyEvj96Plrunq7cnyRfvu0O5cG8YHhAkXQalNK5vXBxY4VjgsuVeuuB8ejduN/Q9DZ
 2NW/X7tCyZLYv0mRRyPRtUO+O/fU2T1Snr9fH3Yl4u1XNKnVsMoqSMktdWhYMb82LSeu
 3wS/gVVLbNoJemqYydt2PYo1J8orwE6g9uNwem9o9S7ECrv/Py6m1CKIMMb+NLX0cgwM
 1AiA==
X-Gm-Message-State: AOAM532fieaQSP+NIkPLNRdEqzQnXKQs+6Z/NEyrIUgA+96p3nUurWAG
 pWmmzXE9EtxcPFJzQJu/MJlI1FAyEbL8CA==
X-Google-Smtp-Source: ABdhPJzsfaCmWM8oiu0uv8Iwaq27DvazPBaUcXvfik2MS7C9aJgxP1zGKR1oamcQHNQb3hS0MgRFVQ==
X-Received: by 2002:a17:90b:78d:: with SMTP id l13mr255747pjz.51.1609867211249; 
 Tue, 05 Jan 2021 09:20:11 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/43] tcg: Introduce tcg_splitwx_to_{rx,rw}
Date: Tue,  5 Jan 2021 07:19:15 -1000
Message-Id: <20210105171950.415486-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add two helper functions, using a global variable to hold
the displacement.  The displacement is currently always 0,
so no change in behaviour.

Begin using the functions in tcg common code only.

Reviewed-by: Joelle van Dyne <j@getutm.app>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-runtime.h   |  2 +-
 include/disas/disas.h     |  2 +-
 include/exec/exec-all.h   |  2 +-
 include/exec/log.h        |  2 +-
 include/tcg/tcg.h         | 26 ++++++++++++++----
 accel/tcg/cpu-exec.c      |  2 +-
 accel/tcg/tcg-runtime.c   |  2 +-
 accel/tcg/translate-all.c | 33 +++++++++++------------
 disas.c                   |  4 ++-
 tcg/tcg.c                 | 56 ++++++++++++++++++++++++++++++++++-----
 tcg/tci.c                 |  5 ++--
 tcg/tcg-pool.c.inc        |  6 ++++-
 accel/tcg/trace-events    |  2 +-
 13 files changed, 104 insertions(+), 40 deletions(-)

diff --git a/accel/tcg/tcg-runtime.h b/accel/tcg/tcg-runtime.h
index 2e36d6eb0c..91a5b7e85f 100644
--- a/accel/tcg/tcg-runtime.h
+++ b/accel/tcg/tcg-runtime.h
@@ -24,7 +24,7 @@ DEF_HELPER_FLAGS_1(clrsb_i64, TCG_CALL_NO_RWG_SE, i64, i64)
 DEF_HELPER_FLAGS_1(ctpop_i32, TCG_CALL_NO_RWG_SE, i32, i32)
 DEF_HELPER_FLAGS_1(ctpop_i64, TCG_CALL_NO_RWG_SE, i64, i64)
 
-DEF_HELPER_FLAGS_1(lookup_tb_ptr, TCG_CALL_NO_WG_SE, ptr, env)
+DEF_HELPER_FLAGS_1(lookup_tb_ptr, TCG_CALL_NO_WG_SE, cptr, env)
 
 DEF_HELPER_FLAGS_1(exit_atomic, TCG_CALL_NO_WG, noreturn, env)
 
diff --git a/include/disas/disas.h b/include/disas/disas.h
index 36c33f6f19..d363e95ede 100644
--- a/include/disas/disas.h
+++ b/include/disas/disas.h
@@ -7,7 +7,7 @@
 #include "cpu.h"
 
 /* Disassemble this for me please... (debugging). */
-void disas(FILE *out, void *code, unsigned long size);
+void disas(FILE *out, const void *code, unsigned long size);
 void target_disas(FILE *out, CPUState *cpu, target_ulong code,
                   target_ulong size);
 
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index fab573da06..2e5b4bba48 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -448,7 +448,7 @@ int probe_access_flags(CPUArchState *env, target_ulong addr,
  * Note: the address of search data can be obtained by adding @size to @ptr.
  */
 struct tb_tc {
-    void *ptr;    /* pointer to the translated code */
+    const void *ptr;    /* pointer to the translated code */
     size_t size;
 };
 
diff --git a/include/exec/log.h b/include/exec/log.h
index e02fff5de1..3c7fa65ead 100644
--- a/include/exec/log.h
+++ b/include/exec/log.h
@@ -56,7 +56,7 @@ static inline void log_target_disas(CPUState *cpu, target_ulong start,
     rcu_read_unlock();
 }
 
-static inline void log_disas(void *code, unsigned long size)
+static inline void log_disas(const void *code, unsigned long size)
 {
     QemuLogFile *logfile;
     rcu_read_lock();
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index ef571b6f3e..b769e868bc 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -678,6 +678,7 @@ struct TCGContext {
 extern TCGContext tcg_init_ctx;
 extern __thread TCGContext *tcg_ctx;
 extern void *tcg_code_gen_epilogue;
+extern uintptr_t tcg_splitwx_diff;
 extern TCGv_env cpu_env;
 
 static inline bool in_code_gen_buffer(const void *p)
@@ -691,6 +692,21 @@ static inline bool in_code_gen_buffer(const void *p)
     return (size_t)(p - s->code_gen_buffer) <= s->code_gen_buffer_size;
 }
 
+#ifdef CONFIG_DEBUG_TCG
+const void *tcg_splitwx_to_rx(void *rw);
+void *tcg_splitwx_to_rw(const void *rx);
+#else
+static inline const void *tcg_splitwx_to_rx(void *rw)
+{
+    return rw ? rw + tcg_splitwx_diff : NULL;
+}
+
+static inline void *tcg_splitwx_to_rw(const void *rx)
+{
+    return rx ? (void *)rx - tcg_splitwx_diff : NULL;
+}
+#endif
+
 static inline size_t temp_idx(TCGTemp *ts)
 {
     ptrdiff_t n = ts - tcg_ctx->temps;
@@ -1111,7 +1127,7 @@ static inline TCGLabel *arg_label(TCGArg i)
  * correct result.
  */
 
-static inline ptrdiff_t tcg_ptr_byte_diff(void *a, void *b)
+static inline ptrdiff_t tcg_ptr_byte_diff(const void *a, const void *b)
 {
     return a - b;
 }
@@ -1125,9 +1141,9 @@ static inline ptrdiff_t tcg_ptr_byte_diff(void *a, void *b)
  * to the destination address.
  */
 
-static inline ptrdiff_t tcg_pcrel_diff(TCGContext *s, void *target)
+static inline ptrdiff_t tcg_pcrel_diff(TCGContext *s, const void *target)
 {
-    return tcg_ptr_byte_diff(target, s->code_ptr);
+    return tcg_ptr_byte_diff(target, tcg_splitwx_to_rx(s->code_ptr));
 }
 
 /**
@@ -1233,9 +1249,9 @@ static inline unsigned get_mmuidx(TCGMemOpIdx oi)
 #define TB_EXIT_REQUESTED 3
 
 #ifdef CONFIG_TCG_INTERPRETER
-uintptr_t tcg_qemu_tb_exec(CPUArchState *env, void *tb_ptr);
+uintptr_t tcg_qemu_tb_exec(CPUArchState *env, const void *tb_ptr);
 #else
-typedef uintptr_t tcg_prologue_fn(CPUArchState *env, void *tb_ptr);
+typedef uintptr_t tcg_prologue_fn(CPUArchState *env, const void *tb_ptr);
 extern tcg_prologue_fn *tcg_qemu_tb_exec;
 #endif
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8689c54499..e01045f66c 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -150,7 +150,7 @@ static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, TranslationBlock *itb)
     uintptr_t ret;
     TranslationBlock *last_tb;
     int tb_exit;
-    uint8_t *tb_ptr = itb->tc.ptr;
+    const void *tb_ptr = itb->tc.ptr;
 
     qemu_log_mask_and_addr(CPU_LOG_EXEC, itb->pc,
                            "Trace %d: %p ["
diff --git a/accel/tcg/tcg-runtime.c b/accel/tcg/tcg-runtime.c
index f85dfefeab..d736f4ff55 100644
--- a/accel/tcg/tcg-runtime.c
+++ b/accel/tcg/tcg-runtime.c
@@ -145,7 +145,7 @@ uint64_t HELPER(ctpop_i64)(uint64_t arg)
     return ctpop64(arg);
 }
 
-void *HELPER(lookup_tb_ptr)(CPUArchState *env)
+const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
 {
     CPUState *cpu = env_cpu(env);
     TranslationBlock *tb;
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 9f5879b63f..224821943b 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -269,9 +269,9 @@ static uint8_t *encode_sleb128(uint8_t *p, target_long val)
 
 /* Decode a signed leb128 sequence at *PP; increment *PP past the
    decoded value.  Return the decoded value.  */
-static target_long decode_sleb128(uint8_t **pp)
+static target_long decode_sleb128(const uint8_t **pp)
 {
-    uint8_t *p = *pp;
+    const uint8_t *p = *pp;
     target_long val = 0;
     int byte, shift = 0;
 
@@ -342,7 +342,7 @@ static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
     target_ulong data[TARGET_INSN_START_WORDS] = { tb->pc };
     uintptr_t host_pc = (uintptr_t)tb->tc.ptr;
     CPUArchState *env = cpu->env_ptr;
-    uint8_t *p = tb->tc.ptr + tb->tc.size;
+    const uint8_t *p = tb->tc.ptr + tb->tc.size;
     int i, j, num_insns = tb->icount;
 #ifdef CONFIG_PROFILER
     TCGProfile *prof = &tcg_ctx->prof;
@@ -393,7 +393,7 @@ void tb_destroy(TranslationBlock *tb)
 bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
 {
     /*
-     * The host_pc has to be in the region of the code buffer.
+     * The host_pc has to be in the rx region of the code buffer.
      * If it is not we will not be able to resolve it here.
      * The two cases where host_pc will not be correct are:
      *
@@ -402,7 +402,7 @@ bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
      *
      * Either way we need return early as we can't resolve it here.
      */
-    if (in_code_gen_buffer((const void *)host_pc)) {
+    if (in_code_gen_buffer((const void *)(host_pc - tcg_splitwx_diff))) {
         TranslationBlock *tb = tcg_tb_lookup(host_pc);
         if (tb) {
             cpu_restore_state_from_tb(cpu, tb, host_pc, will_exit);
@@ -1712,7 +1712,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     }
 
     gen_code_buf = tcg_ctx->code_gen_ptr;
-    tb->tc.ptr = gen_code_buf;
+    tb->tc.ptr = tcg_splitwx_to_rx(gen_code_buf);
     tb->pc = pc;
     tb->cs_base = cs_base;
     tb->flags = flags;
@@ -1806,15 +1806,19 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM) &&
         qemu_log_in_addr_range(tb->pc)) {
         FILE *logfile = qemu_log_lock();
-        int code_size, data_size = 0;
+        int code_size, data_size;
+        const tcg_target_ulong *rx_data_gen_ptr;
         size_t chunk_start;
         int insn = 0;
 
         if (tcg_ctx->data_gen_ptr) {
-            code_size = tcg_ctx->data_gen_ptr - tb->tc.ptr;
+            rx_data_gen_ptr = tcg_splitwx_to_rx(tcg_ctx->data_gen_ptr);
+            code_size = (const void *)rx_data_gen_ptr - tb->tc.ptr;
             data_size = gen_code_size - code_size;
         } else {
+            rx_data_gen_ptr = 0;
             code_size = gen_code_size;
+            data_size = 0;
         }
 
         /* Dump header and the first instruction */
@@ -1849,16 +1853,9 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
         if (data_size) {
             int i;
             qemu_log("  data: [size=%d]\n", data_size);
-            for (i = 0; i < data_size; i += sizeof(tcg_target_ulong)) {
-                if (sizeof(tcg_target_ulong) == 8) {
-                    qemu_log("0x%08" PRIxPTR ":  .quad  0x%016" PRIx64 "\n",
-                             (uintptr_t)tcg_ctx->data_gen_ptr + i,
-                             *(uint64_t *)(tcg_ctx->data_gen_ptr + i));
-                } else {
-                    qemu_log("0x%08" PRIxPTR ":  .long  0x%08x\n",
-                             (uintptr_t)tcg_ctx->data_gen_ptr + i,
-                             *(uint32_t *)(tcg_ctx->data_gen_ptr + i));
-                }
+            for (i = 0; i < data_size / sizeof(tcg_target_ulong); i++) {
+                qemu_log("0x%08" PRIxPTR ":  .quad  0x%" TCG_PRIlx "\n",
+                         (uintptr_t)&rx_data_gen_ptr[i], rx_data_gen_ptr[i]);
             }
         }
         qemu_log("\n");
diff --git a/disas.c b/disas.c
index 7c18d7d2a7..de1de7be94 100644
--- a/disas.c
+++ b/disas.c
@@ -299,8 +299,10 @@ char *plugin_disas(CPUState *cpu, uint64_t addr, size_t size)
 }
 
 /* Disassemble this for me please... (debugging). */
-void disas(FILE *out, void *code, unsigned long size)
+void disas(FILE *out, const void *ccode, unsigned long size)
 {
+    /* TODO: Push constness through the disas backends. */
+    void *code = (void *)ccode;
     uintptr_t pc;
     int count;
     CPUDebug s;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 12f598cc18..7bf441979d 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -162,6 +162,7 @@ static TCGContext **tcg_ctxs;
 static unsigned int n_tcg_ctxs;
 TCGv_env cpu_env = 0;
 void *tcg_code_gen_epilogue;
+uintptr_t tcg_splitwx_diff;
 
 #ifndef CONFIG_TCG_INTERPRETER
 tcg_prologue_fn *tcg_qemu_tb_exec;
@@ -406,8 +407,9 @@ static void tcg_region_trees_init(void)
     }
 }
 
-static struct tcg_region_tree *tc_ptr_to_region_tree(void *p)
+static struct tcg_region_tree *tc_ptr_to_region_tree(const void *cp)
 {
+    void *p = tcg_splitwx_to_rw(cp);
     size_t region_idx;
 
     if (p < region.start_aligned) {
@@ -701,6 +703,7 @@ void tcg_region_init(void)
     size_t region_size;
     size_t n_regions;
     size_t i;
+    uintptr_t splitwx_diff;
 
     n_regions = tcg_n_regions();
 
@@ -731,6 +734,7 @@ void tcg_region_init(void)
     region.end -= page_size;
 
     /* set guard pages */
+    splitwx_diff = tcg_splitwx_diff;
     for (i = 0; i < region.n; i++) {
         void *start, *end;
         int rc;
@@ -738,6 +742,10 @@ void tcg_region_init(void)
         tcg_region_bounds(i, &start, &end);
         rc = qemu_mprotect_none(end, page_size);
         g_assert(!rc);
+        if (splitwx_diff) {
+            rc = qemu_mprotect_none(end + splitwx_diff, page_size);
+            g_assert(!rc);
+        }
     }
 
     tcg_region_trees_init();
@@ -752,6 +760,29 @@ void tcg_region_init(void)
 #endif
 }
 
+#ifdef CONFIG_DEBUG_TCG
+const void *tcg_splitwx_to_rx(void *rw)
+{
+    /* Pass NULL pointers unchanged. */
+    if (rw) {
+        g_assert(in_code_gen_buffer(rw));
+        rw += tcg_splitwx_diff;
+    }
+    return rw;
+}
+
+void *tcg_splitwx_to_rw(const void *rx)
+{
+    /* Pass NULL pointers unchanged. */
+    if (rx) {
+        rx -= tcg_splitwx_diff;
+        /* Assert that we end with a pointer in the rw region. */
+        g_assert(in_code_gen_buffer(rx));
+    }
+    return (void *)rx;
+}
+#endif /* CONFIG_DEBUG_TCG */
+
 static void alloc_tcg_plugin_context(TCGContext *s)
 {
 #ifdef CONFIG_PLUGIN
@@ -1061,8 +1092,15 @@ void tcg_prologue_init(TCGContext *s)
     s->code_buf = buf0;
     s->data_gen_ptr = NULL;
 
+    /*
+     * The region trees are not yet configured, but tcg_splitwx_to_rx
+     * needs the bounds for an assert.
+     */
+    region.start = buf0;
+    region.end = buf0 + total_size;
+
 #ifndef CONFIG_TCG_INTERPRETER
-    tcg_qemu_tb_exec = (tcg_prologue_fn *)buf0;
+    tcg_qemu_tb_exec = (tcg_prologue_fn *)tcg_splitwx_to_rx(buf0);
 #endif
 
     /* Compute a high-water mark, at which we voluntarily flush the buffer
@@ -1087,7 +1125,7 @@ void tcg_prologue_init(TCGContext *s)
 
     buf1 = s->code_ptr;
 #ifndef CONFIG_TCG_INTERPRETER
-    flush_idcache_range((uintptr_t)buf0, (uintptr_t)buf0,
+    flush_idcache_range((uintptr_t)tcg_splitwx_to_rx(buf0), (uintptr_t)buf0,
                         tcg_ptr_byte_diff(buf1, buf0));
 #endif
 
@@ -4231,8 +4269,13 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
 
     tcg_reg_alloc_start(s);
 
-    s->code_buf = tb->tc.ptr;
-    s->code_ptr = tb->tc.ptr;
+    /*
+     * Reset the buffer pointers when restarting after overflow.
+     * TODO: Move this into translate-all.c with the rest of the
+     * buffer management.  Having only this done here is confusing.
+     */
+    s->code_buf = tcg_splitwx_to_rw(tb->tc.ptr);
+    s->code_ptr = s->code_buf;
 
 #ifdef TCG_TARGET_NEED_LDST_LABELS
     QSIMPLEQ_INIT(&s->ldst_labels);
@@ -4337,7 +4380,8 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
 
 #ifndef CONFIG_TCG_INTERPRETER
     /* flush instruction cache */
-    flush_idcache_range((uintptr_t)s->code_buf, (uintptr_t)s->code_buf,
+    flush_idcache_range((uintptr_t)tcg_splitwx_to_rx(s->code_buf),
+                        (uintptr_t)s->code_buf,
                         tcg_ptr_byte_diff(s->code_ptr, s->code_buf));
 #endif
 
diff --git a/tcg/tci.c b/tcg/tci.c
index d996eb7cf8..262a2b39ce 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -475,9 +475,10 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
 #endif
 
 /* Interpret pseudo code in tb. */
-uintptr_t tcg_qemu_tb_exec(CPUArchState *env, void *v_tb_ptr)
+uintptr_t tcg_qemu_tb_exec(CPUArchState *env, const void *v_tb_ptr)
 {
-    uint8_t *tb_ptr = v_tb_ptr;
+    /* TODO: Propagate const through this file. */
+    uint8_t *tb_ptr = (uint8_t *)v_tb_ptr;
     tcg_target_ulong regs[TCG_TARGET_NB_REGS];
     long tcg_temps[CPU_TEMP_BUF_NLONGS];
     uintptr_t sp_value = (uintptr_t)(tcg_temps + CPU_TEMP_BUF_NLONGS);
diff --git a/tcg/tcg-pool.c.inc b/tcg/tcg-pool.c.inc
index 82cbcc89bd..90c2e63b7f 100644
--- a/tcg/tcg-pool.c.inc
+++ b/tcg/tcg-pool.c.inc
@@ -140,6 +140,8 @@ static int tcg_out_pool_finalize(TCGContext *s)
 
     for (; p != NULL; p = p->next) {
         size_t size = sizeof(tcg_target_ulong) * p->nlong;
+        uintptr_t value;
+
         if (!l || l->nlong != p->nlong || memcmp(l->data, p->data, size)) {
             if (unlikely(a > s->code_gen_highwater)) {
                 return -1;
@@ -148,7 +150,9 @@ static int tcg_out_pool_finalize(TCGContext *s)
             a += size;
             l = p;
         }
-        if (!patch_reloc(p->label, p->rtype, (intptr_t)a - size, p->addend)) {
+
+        value = (uintptr_t)tcg_splitwx_to_rx(a) - size;
+        if (!patch_reloc(p->label, p->rtype, value, p->addend)) {
             return -2;
         }
     }
diff --git a/accel/tcg/trace-events b/accel/tcg/trace-events
index 385b9f749b..6eefb37f5d 100644
--- a/accel/tcg/trace-events
+++ b/accel/tcg/trace-events
@@ -7,4 +7,4 @@ exec_tb_nocache(void *tb, uintptr_t pc) "tb:%p pc=0x%"PRIxPTR
 exec_tb_exit(void *last_tb, unsigned int flags) "tb:%p flags=0x%x"
 
 # translate-all.c
-translate_block(void *tb, uintptr_t pc, uint8_t *tb_code) "tb:%p, pc:0x%"PRIxPTR", tb_code:%p"
+translate_block(void *tb, uintptr_t pc, const void *tb_code) "tb:%p, pc:0x%"PRIxPTR", tb_code:%p"
-- 
2.25.1


