Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE9E5F1526
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 23:44:56 +0200 (CEST)
Received: from localhost ([::1]:47068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeNoV-0006pH-1B
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 17:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNXL-0007iC-Ke
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:27:11 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:34457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNXH-0005TC-Nd
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:27:11 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id i9so73831qvu.1
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 14:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=NSlhk7SgJVkwHakaDtBTkSg3oKeEyTlZf0cwFgre9N8=;
 b=gTVmC1lDipBqjudcO/EqZacGIDDRYQ4G2hT9GAF30ob1XlaZ3+yspKn427zs/m0IIr
 Tv7BJUoi6TE5XkULshkqlTC81C7KkDcSOloHawDfas8D62U/MlzixA1xqMM+Amu6uAsm
 ltv64rPbHFI8hnJUvJVn7X7vKRs2x8nzFogaZgw9VUK6/c58n0hGLu3WSiTmV3mQbYJ/
 WlWNiywm7+qafCXT3AGlXHyc5wXghvuyBpMle4t8zmUY3LKzdx7aAwvNmFpNaiQpYVEJ
 1uC2mtV55IPm/dKaP2pYE4I22Y+S9OgCv8FP2KS/3mAfxdKJMw8FIxSCdq6yef8fWQhe
 Vuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=NSlhk7SgJVkwHakaDtBTkSg3oKeEyTlZf0cwFgre9N8=;
 b=rMV6jqZhjttUYPuGckS7ajIva8mLvs6KUjyASVL1fkhqJmzfX8M+TcN8cwMW1ABrMN
 IlhUU2Y32J/LTuBkLi5JL4ee5XFUtTn/413kGAmZl8QtfngTpbXp8Y4jSJyR9Jfzwunj
 eMzHbK6WDWoO4tcC30XL5GRvlOFUBuiaBrE3QaTnlxEQXLCVvIWjKvbz5hypwJj0BH8u
 aRxI3J5GKFgXL9+IOPBkVAUdeMlUqzQW8h+isRbIsyq6/heM08XxklAr5trzZyv6zjvN
 1PpsYKFIRboIDDUIaPjeKlrRoh+QfkSXvtTggszyV2+CbsKtDIhdXyvNzQSBR74LEc0E
 jXxA==
X-Gm-Message-State: ACrzQf0R+8qrQwxGvng7vkqJpEOXGwtKbfZ/VB1UDHZbpT5G9plOAZFk
 vvA3nq/+uxvLXUCyZUto1ioLz1URmzOkEw==
X-Google-Smtp-Source: AMsMyM7pxm2v9ahJaI5chjteIh9lTjMU6RfGForfx0qmEFTCxgmCTetlsLqGW9BvlQBg5EyyKRpYww==
X-Received: by 2002:ad4:5d43:0:b0:4af:9350:440d with SMTP id
 jk3-20020ad45d43000000b004af9350440dmr8698941qvb.115.1664573226293; 
 Fri, 30 Sep 2022 14:27:06 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05620a28d200b006ce813bb306sm3696370qkp.125.2022.09.30.14.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 14:27:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linux.org,
	alex.bennee@linux.org
Subject: [PATCH v6 17/18] accel/tcg: Introduce tb_pc and log_pc
Date: Fri, 30 Sep 2022 14:26:21 -0700
Message-Id: <20220930212622.108363-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930212622.108363-1-richard.henderson@linaro.org>
References: <20220930212622.108363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The availability of tb->pc will shortly be conditional.
Introduce accessor functions to minimize ifdefs.

Pass around a known pc to places like tcg_gen_code,
where the caller must already have the value.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h                    |  6 ++++
 include/exec/exec-all.h                 |  6 ++++
 include/tcg/tcg.h                       |  2 +-
 accel/tcg/cpu-exec.c                    | 46 ++++++++++++++-----------
 accel/tcg/translate-all.c               | 37 +++++++++++---------
 target/arm/cpu.c                        |  4 +--
 target/avr/cpu.c                        |  2 +-
 target/hexagon/cpu.c                    |  2 +-
 target/hppa/cpu.c                       |  4 +--
 target/i386/tcg/tcg-cpu.c               |  2 +-
 target/loongarch/cpu.c                  |  2 +-
 target/microblaze/cpu.c                 |  2 +-
 target/mips/tcg/exception.c             |  2 +-
 target/mips/tcg/sysemu/special_helper.c |  2 +-
 target/openrisc/cpu.c                   |  2 +-
 target/riscv/cpu.c                      |  4 +--
 target/rx/cpu.c                         |  2 +-
 target/sh4/cpu.c                        |  4 +--
 target/sparc/cpu.c                      |  2 +-
 target/tricore/cpu.c                    |  2 +-
 tcg/tcg.c                               |  8 ++---
 21 files changed, 82 insertions(+), 61 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 3092bfa964..a3875a3b5a 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -18,4 +18,10 @@ G_NORETURN void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
 void page_init(void);
 void tb_htable_init(void);
 
+/* Return the current PC from CPU, which may be cached in TB. */
+static inline target_ulong log_pc(CPUState *cpu, const TranslationBlock *tb)
+{
+    return tb_pc(tb);
+}
+
 #endif /* ACCEL_TCG_INTERNAL_H */
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index b1b920a713..7ea6026ba9 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -570,6 +570,12 @@ struct TranslationBlock {
     uintptr_t jmp_dest[2];
 };
 
+/* Hide the read to avoid ifdefs for TARGET_TB_PCREL. */
+static inline target_ulong tb_pc(const TranslationBlock *tb)
+{
+    return tb->pc;
+}
+
 /* Hide the qatomic_read to make code a little easier on the eyes */
 static inline uint32_t tb_cflags(const TranslationBlock *tb)
 {
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 26a70526f1..d84bae6e3f 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -840,7 +840,7 @@ void tcg_register_thread(void);
 void tcg_prologue_init(TCGContext *s);
 void tcg_func_start(TCGContext *s);
 
-int tcg_gen_code(TCGContext *s, TranslationBlock *tb);
+int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start);
 
 void tcg_set_frame(TCGContext *s, TCGReg reg, intptr_t start, intptr_t size);
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 2d7e610ee2..8b3f8435fb 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -186,7 +186,7 @@ static bool tb_lookup_cmp(const void *p, const void *d)
     const TranslationBlock *tb = p;
     const struct tb_desc *desc = d;
 
-    if (tb->pc == desc->pc &&
+    if (tb_pc(tb) == desc->pc &&
         tb->page_addr[0] == desc->page_addr0 &&
         tb->cs_base == desc->cs_base &&
         tb->flags == desc->flags &&
@@ -271,12 +271,10 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
     return tb;
 }
 
-static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
-                                const TranslationBlock *tb)
+static void log_cpu_exec(target_ulong pc, CPUState *cpu,
+                         const TranslationBlock *tb)
 {
-    if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_CPU | CPU_LOG_EXEC))
-        && qemu_log_in_addr_range(pc)) {
-
+    if (qemu_log_in_addr_range(pc)) {
         qemu_log_mask(CPU_LOG_EXEC,
                       "Trace %d: %p [" TARGET_FMT_lx
                       "/" TARGET_FMT_lx "/%08x/%08x] %s\n",
@@ -400,7 +398,9 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
         return tcg_code_gen_epilogue;
     }
 
-    log_cpu_exec(pc, cpu, tb);
+    if (qemu_loglevel_mask(CPU_LOG_TB_CPU | CPU_LOG_EXEC)) {
+        log_cpu_exec(pc, cpu, tb);
+    }
 
     return tb->tc.ptr;
 }
@@ -423,7 +423,9 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
     TranslationBlock *last_tb;
     const void *tb_ptr = itb->tc.ptr;
 
-    log_cpu_exec(itb->pc, cpu, itb);
+    if (qemu_loglevel_mask(CPU_LOG_TB_CPU | CPU_LOG_EXEC)) {
+        log_cpu_exec(log_pc(cpu, itb), cpu, itb);
+    }
 
     qemu_thread_jit_execute();
     ret = tcg_qemu_tb_exec(env, tb_ptr);
@@ -447,16 +449,20 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
          * of the start of the TB.
          */
         CPUClass *cc = CPU_GET_CLASS(cpu);
-        qemu_log_mask_and_addr(CPU_LOG_EXEC, last_tb->pc,
-                               "Stopped execution of TB chain before %p ["
-                               TARGET_FMT_lx "] %s\n",
-                               last_tb->tc.ptr, last_tb->pc,
-                               lookup_symbol(last_tb->pc));
+
         if (cc->tcg_ops->synchronize_from_tb) {
             cc->tcg_ops->synchronize_from_tb(cpu, last_tb);
         } else {
             assert(cc->set_pc);
-            cc->set_pc(cpu, last_tb->pc);
+            cc->set_pc(cpu, tb_pc(last_tb));
+        }
+        if (qemu_loglevel_mask(CPU_LOG_EXEC)) {
+            target_ulong pc = log_pc(cpu, last_tb);
+            if (qemu_log_in_addr_range(pc)) {
+                qemu_log("Stopped execution of TB chain before %p ["
+                         TARGET_FMT_lx "] %s\n",
+                         last_tb->tc.ptr, pc, lookup_symbol(pc));
+            }
         }
     }
 
@@ -598,11 +604,8 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
 
     qemu_spin_unlock(&tb_next->jmp_lock);
 
-    qemu_log_mask_and_addr(CPU_LOG_EXEC, tb->pc,
-                           "Linking TBs %p [" TARGET_FMT_lx
-                           "] index %d -> %p [" TARGET_FMT_lx "]\n",
-                           tb->tc.ptr, tb->pc, n,
-                           tb_next->tc.ptr, tb_next->pc);
+    qemu_log_mask(CPU_LOG_EXEC, "Linking TBs %p index %d -> %p\n",
+                  tb->tc.ptr, n, tb_next->tc.ptr);
     return;
 
  out_unlock_next:
@@ -848,11 +851,12 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
 }
 
 static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
+                                    target_ulong pc,
                                     TranslationBlock **last_tb, int *tb_exit)
 {
     int32_t insns_left;
 
-    trace_exec_tb(tb, tb->pc);
+    trace_exec_tb(tb, pc);
     tb = cpu_tb_exec(cpu, tb, tb_exit);
     if (*tb_exit != TB_EXIT_REQUESTED) {
         *last_tb = tb;
@@ -1017,7 +1021,7 @@ int cpu_exec(CPUState *cpu)
                 tb_add_jump(last_tb, tb_exit, tb);
             }
 
-            cpu_loop_exec_tb(cpu, tb, &last_tb, &tb_exit);
+            cpu_loop_exec_tb(cpu, tb, pc, &last_tb, &tb_exit);
 
             /* Try to align the host and virtual clocks
                if the guest is in advance */
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 63ecc15236..13c964dcd8 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -299,7 +299,7 @@ static int encode_search(TranslationBlock *tb, uint8_t *block)
 
         for (j = 0; j < TARGET_INSN_START_WORDS; ++j) {
             if (i == 0) {
-                prev = (j == 0 ? tb->pc : 0);
+                prev = (j == 0 ? tb_pc(tb) : 0);
             } else {
                 prev = tcg_ctx->gen_insn_data[i - 1][j];
             }
@@ -327,7 +327,7 @@ static int encode_search(TranslationBlock *tb, uint8_t *block)
 static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
                                      uintptr_t searched_pc, bool reset_icount)
 {
-    target_ulong data[TARGET_INSN_START_WORDS] = { tb->pc };
+    target_ulong data[TARGET_INSN_START_WORDS] = { tb_pc(tb) };
     uintptr_t host_pc = (uintptr_t)tb->tc.ptr;
     CPUArchState *env = cpu->env_ptr;
     const uint8_t *p = tb->tc.ptr + tb->tc.size;
@@ -885,7 +885,7 @@ static bool tb_cmp(const void *ap, const void *bp)
     const TranslationBlock *a = ap;
     const TranslationBlock *b = bp;
 
-    return a->pc == b->pc &&
+    return tb_pc(a) == tb_pc(b) &&
         a->cs_base == b->cs_base &&
         a->flags == b->flags &&
         (tb_cflags(a) & ~CF_INVALID) == (tb_cflags(b) & ~CF_INVALID) &&
@@ -1013,9 +1013,10 @@ static void do_tb_invalidate_check(void *p, uint32_t hash, void *userp)
     TranslationBlock *tb = p;
     target_ulong addr = *(target_ulong *)userp;
 
-    if (!(addr + TARGET_PAGE_SIZE <= tb->pc || addr >= tb->pc + tb->size)) {
+    if (!(addr + TARGET_PAGE_SIZE <= tb_pc(tb) ||
+          addr >= tb_pc(tb) + tb->size)) {
         printf("ERROR invalidate: address=" TARGET_FMT_lx
-               " PC=%08lx size=%04x\n", addr, (long)tb->pc, tb->size);
+               " PC=%08lx size=%04x\n", addr, (long)tb_pc(tb), tb->size);
     }
 }
 
@@ -1034,11 +1035,11 @@ static void do_tb_page_check(void *p, uint32_t hash, void *userp)
     TranslationBlock *tb = p;
     int flags1, flags2;
 
-    flags1 = page_get_flags(tb->pc);
-    flags2 = page_get_flags(tb->pc + tb->size - 1);
+    flags1 = page_get_flags(tb_pc(tb));
+    flags2 = page_get_flags(tb_pc(tb) + tb->size - 1);
     if ((flags1 & PAGE_WRITE) || (flags2 & PAGE_WRITE)) {
         printf("ERROR page flags: PC=%08lx size=%04x f1=%x f2=%x\n",
-               (long)tb->pc, tb->size, flags1, flags2);
+               (long)tb_pc(tb), tb->size, flags1, flags2);
     }
 }
 
@@ -1169,7 +1170,7 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
 
     /* remove the TB from the hash list */
     phys_pc = tb->page_addr[0];
-    h = tb_hash_func(phys_pc, tb->pc, tb->flags, orig_cflags,
+    h = tb_hash_func(phys_pc, tb_pc(tb), tb->flags, orig_cflags,
                      tb->trace_vcpu_dstate);
     if (!qht_remove(&tb_ctx.htable, tb, h)) {
         return;
@@ -1301,7 +1302,7 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
     }
 
     /* add in the hash table */
-    h = tb_hash_func(phys_pc, tb->pc, tb->flags, tb->cflags,
+    h = tb_hash_func(phys_pc, tb_pc(tb), tb->flags, tb->cflags,
                      tb->trace_vcpu_dstate);
     qht_insert(&tb_ctx.htable, tb, h, &existing_tb);
 
@@ -1401,7 +1402,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     tcg_ctx->cpu = NULL;
     max_insns = tb->icount;
 
-    trace_translate_block(tb, tb->pc, tb->tc.ptr);
+    trace_translate_block(tb, pc, tb->tc.ptr);
 
     /* generate machine code */
     tb->jmp_reset_offset[0] = TB_JMP_RESET_OFFSET_INVALID;
@@ -1422,7 +1423,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     ti = profile_getclock();
 #endif
 
-    gen_code_size = tcg_gen_code(tcg_ctx, tb);
+    gen_code_size = tcg_gen_code(tcg_ctx, tb, pc);
     if (unlikely(gen_code_size < 0)) {
  error_return:
         switch (gen_code_size) {
@@ -1478,7 +1479,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM) &&
-        qemu_log_in_addr_range(tb->pc)) {
+        qemu_log_in_addr_range(pc)) {
         FILE *logfile = qemu_log_trylock();
         if (logfile) {
             int code_size, data_size;
@@ -1918,9 +1919,13 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
      */
     cpu->cflags_next_tb = curr_cflags(cpu) | CF_MEMI_ONLY | CF_LAST_IO | n;
 
-    qemu_log_mask_and_addr(CPU_LOG_EXEC, tb->pc,
-                           "cpu_io_recompile: rewound execution of TB to "
-                           TARGET_FMT_lx "\n", tb->pc);
+    if (qemu_loglevel_mask(CPU_LOG_EXEC)) {
+        target_ulong pc = log_pc(cpu, tb);
+        if (qemu_log_in_addr_range(pc)) {
+            qemu_log("cpu_io_recompile: rewound execution of TB to "
+                     TARGET_FMT_lx "\n", pc);
+        }
+    }
 
     cpu_loop_exit_noexc(cpu);
 }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index fa67ba6647..94ca6f163f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -84,9 +84,9 @@ void arm_cpu_synchronize_from_tb(CPUState *cs,
      * never possible for an AArch64 TB to chain to an AArch32 TB.
      */
     if (is_a64(env)) {
-        env->pc = tb->pc;
+        env->pc = tb_pc(tb);
     } else {
-        env->regs[15] = tb->pc;
+        env->regs[15] = tb_pc(tb);
     }
 }
 #endif /* CONFIG_TCG */
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 6900444d03..0d2861179d 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -54,7 +54,7 @@ static void avr_cpu_synchronize_from_tb(CPUState *cs,
     AVRCPU *cpu = AVR_CPU(cs);
     CPUAVRState *env = &cpu->env;
 
-    env->pc_w = tb->pc / 2; /* internally PC points to words */
+    env->pc_w = tb_pc(tb) / 2; /* internally PC points to words */
 }
 
 static void avr_cpu_reset(DeviceState *ds)
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 04a497db5e..fa6d722555 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -263,7 +263,7 @@ static void hexagon_cpu_synchronize_from_tb(CPUState *cs,
 {
     HexagonCPU *cpu = HEXAGON_CPU(cs);
     CPUHexagonState *env = &cpu->env;
-    env->gpr[HEX_REG_PC] = tb->pc;
+    env->gpr[HEX_REG_PC] = tb_pc(tb);
 }
 
 static bool hexagon_cpu_has_work(CPUState *cs)
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index e25d3db6d5..e677ca09d4 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -49,7 +49,7 @@ static void hppa_cpu_synchronize_from_tb(CPUState *cs,
     HPPACPU *cpu = HPPA_CPU(cs);
 
 #ifdef CONFIG_USER_ONLY
-    cpu->env.iaoq_f = tb->pc;
+    cpu->env.iaoq_f = tb_pc(tb);
     cpu->env.iaoq_b = tb->cs_base;
 #else
     /* Recover the IAOQ values from the GVA + PRIV.  */
@@ -59,7 +59,7 @@ static void hppa_cpu_synchronize_from_tb(CPUState *cs,
     int32_t diff = cs_base;
 
     cpu->env.iasq_f = iasq_f;
-    cpu->env.iaoq_f = (tb->pc & ~iasq_f) + priv;
+    cpu->env.iaoq_f = (tb_pc(tb) & ~iasq_f) + priv;
     if (diff) {
         cpu->env.iaoq_b = cpu->env.iaoq_f + diff;
     }
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index d3c2b8fb49..6cf14c83ff 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -51,7 +51,7 @@ static void x86_cpu_synchronize_from_tb(CPUState *cs,
 {
     X86CPU *cpu = X86_CPU(cs);
 
-    cpu->env.eip = tb->pc - tb->cs_base;
+    cpu->env.eip = tb_pc(tb) - tb->cs_base;
 }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 20a92ea56c..1722ed2a4d 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -317,7 +317,7 @@ static void loongarch_cpu_synchronize_from_tb(CPUState *cs,
     LoongArchCPU *cpu = LOONGARCH_CPU(cs);
     CPULoongArchState *env = &cpu->env;
 
-    env->pc = tb->pc;
+    env->pc = tb_pc(tb);
 }
 #endif /* CONFIG_TCG */
 
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 73af51769e..c10b8ac029 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -96,7 +96,7 @@ static void mb_cpu_synchronize_from_tb(CPUState *cs,
 {
     MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
 
-    cpu->env.pc = tb->pc;
+    cpu->env.pc = tb_pc(tb);
     cpu->env.iflags = tb->flags & IFLAGS_TB_MASK;
 }
 
diff --git a/target/mips/tcg/exception.c b/target/mips/tcg/exception.c
index 2bd77a61de..96e61170e6 100644
--- a/target/mips/tcg/exception.c
+++ b/target/mips/tcg/exception.c
@@ -82,7 +82,7 @@ void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb)
     MIPSCPU *cpu = MIPS_CPU(cs);
     CPUMIPSState *env = &cpu->env;
 
-    env->active_tc.PC = tb->pc;
+    env->active_tc.PC = tb_pc(tb);
     env->hflags &= ~MIPS_HFLAG_BMASK;
     env->hflags |= tb->flags & MIPS_HFLAG_BMASK;
 }
diff --git a/target/mips/tcg/sysemu/special_helper.c b/target/mips/tcg/sysemu/special_helper.c
index f4f8fe8afc..3c5f35c759 100644
--- a/target/mips/tcg/sysemu/special_helper.c
+++ b/target/mips/tcg/sysemu/special_helper.c
@@ -94,7 +94,7 @@ bool mips_io_recompile_replay_branch(CPUState *cs, const TranslationBlock *tb)
     CPUMIPSState *env = &cpu->env;
 
     if ((env->hflags & MIPS_HFLAG_BMASK) != 0
-        && env->active_tc.PC != tb->pc) {
+        && env->active_tc.PC != tb_pc(tb)) {
         env->active_tc.PC -= (env->hflags & MIPS_HFLAG_B16 ? 2 : 4);
         env->hflags &= ~MIPS_HFLAG_BMASK;
         return true;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 33cf717210..f6fd437785 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -43,7 +43,7 @@ static void openrisc_cpu_synchronize_from_tb(CPUState *cs,
 {
     OpenRISCCPU *cpu = OPENRISC_CPU(cs);
 
-    cpu->env.pc = tb->pc;
+    cpu->env.pc = tb_pc(tb);
 }
 
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6ca05c6eaf..e6d9c706bb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -482,9 +482,9 @@ static void riscv_cpu_synchronize_from_tb(CPUState *cs,
     RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
 
     if (xl == MXL_RV32) {
-        env->pc = (int32_t)tb->pc;
+        env->pc = (int32_t)tb_pc(tb);
     } else {
-        env->pc = tb->pc;
+        env->pc = tb_pc(tb);
     }
 }
 
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 134b4b6bb6..2f28099723 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -44,7 +44,7 @@ static void rx_cpu_synchronize_from_tb(CPUState *cs,
 {
     RXCPU *cpu = RX_CPU(cs);
 
-    cpu->env.pc = tb->pc;
+    cpu->env.pc = tb_pc(tb);
 }
 
 static bool rx_cpu_has_work(CPUState *cs)
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 4bafbf8596..a65a66de43 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -46,7 +46,7 @@ static void superh_cpu_synchronize_from_tb(CPUState *cs,
 {
     SuperHCPU *cpu = SUPERH_CPU(cs);
 
-    cpu->env.pc = tb->pc;
+    cpu->env.pc = tb_pc(tb);
     cpu->env.flags = tb->flags & TB_FLAG_ENVFLAGS_MASK;
 }
 
@@ -58,7 +58,7 @@ static bool superh_io_recompile_replay_branch(CPUState *cs,
     CPUSH4State *env = &cpu->env;
 
     if ((env->flags & ((DELAY_SLOT | DELAY_SLOT_CONDITIONAL))) != 0
-        && env->pc != tb->pc) {
+        && env->pc != tb_pc(tb)) {
         env->pc -= 2;
         env->flags &= ~(DELAY_SLOT | DELAY_SLOT_CONDITIONAL);
         return true;
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 1b2afb0cb8..1f9ef7afd8 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -705,7 +705,7 @@ static void sparc_cpu_synchronize_from_tb(CPUState *cs,
 {
     SPARCCPU *cpu = SPARC_CPU(cs);
 
-    cpu->env.pc = tb->pc;
+    cpu->env.pc = tb_pc(tb);
     cpu->env.npc = tb->cs_base;
 }
 
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 91b16bdefc..ab7a1e3a6d 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -55,7 +55,7 @@ static void tricore_cpu_synchronize_from_tb(CPUState *cs,
     TriCoreCPU *cpu = TRICORE_CPU(cs);
     CPUTriCoreState *env = &cpu->env;
 
-    env->PC = tb->pc;
+    env->PC = tb_pc(tb);
 }
 
 static void tricore_cpu_reset(DeviceState *dev)
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0f9cfe96f2..612a12f58f 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -4188,7 +4188,7 @@ int64_t tcg_cpu_exec_time(void)
 #endif
 
 
-int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
+int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
 {
 #ifdef CONFIG_PROFILER
     TCGProfile *prof = &s->prof;
@@ -4218,7 +4218,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
 
 #ifdef DEBUG_DISAS
     if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP)
-                 && qemu_log_in_addr_range(tb->pc))) {
+                 && qemu_log_in_addr_range(pc_start))) {
         FILE *logfile = qemu_log_trylock();
         if (logfile) {
             fprintf(logfile, "OP:\n");
@@ -4265,7 +4265,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
     if (s->nb_indirects > 0) {
 #ifdef DEBUG_DISAS
         if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP_IND)
-                     && qemu_log_in_addr_range(tb->pc))) {
+                     && qemu_log_in_addr_range(pc_start))) {
             FILE *logfile = qemu_log_trylock();
             if (logfile) {
                 fprintf(logfile, "OP before indirect lowering:\n");
@@ -4288,7 +4288,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
 
 #ifdef DEBUG_DISAS
     if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP_OPT)
-                 && qemu_log_in_addr_range(tb->pc))) {
+                 && qemu_log_in_addr_range(pc_start))) {
         FILE *logfile = qemu_log_trylock();
         if (logfile) {
             fprintf(logfile, "OP after optimization and liveness analysis:\n");
-- 
2.34.1


