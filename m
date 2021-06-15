Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F7E3A74AB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 05:09:26 +0200 (CEST)
Received: from localhost ([::1]:47848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lszS9-0006zl-Aj
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 23:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lszQe-0004bw-Lx
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 23:07:52 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:33337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lszQb-00087R-7k
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 23:07:52 -0400
Received: by mail-pg1-x52d.google.com with SMTP id e20so10313144pgg.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 20:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t8wjCuyHEh6Y0B+SDsb16alVobYpy70dHGqNTIJsVXA=;
 b=E0SkBWBAbB0hQpke7xi4wTKrb0hTWtgKGnIC2qQn/xiX2LXwxfq+fWq5Aah/QurW1b
 h5q08+HDg68XukLPqbJtWqNOiHgSz/H1Ew533D1zztGLe/k0h/X1pav2/TWe0tx0B/9D
 mbrnAjN4ZoC5O0mo7QvH5wJgfege4PDVCXSUHHKwuJuFCzSEGOVZ+/lfRAIT0J8TWvuR
 aq8ctimylw9gCtm6zODj7okb5fHXhYEIk+fzFXMrC2nRuAKYppqTmqT9AoKG4sTt7orh
 093NWJroVCsZh+AoJfa+62LSoE7K4HopJdAhNHcSWpuyKgwYm7K+xRSYlb2093sh7Fgo
 rH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t8wjCuyHEh6Y0B+SDsb16alVobYpy70dHGqNTIJsVXA=;
 b=dWH1jRzrDPOhNPD5VwH/P3Frl/WBAa4CcmGUYXouzS0Eq5new6FF0Bwjqw+XJ0bNhF
 fErrWgyrbqSpeAGYX5D8B5adGl8Qd1+RSMNNuJw7OgIaGw9jZpYhoFkDlE4tNlkQFeoQ
 bXTRMO8N9ucgSUCMgJjGuMaggmUj1OZg7iJjJNJ8MkVLo7hLYYty+xY6PtxLSH6L4cgW
 rGl0z4kDAuXcS//PTOjzgEWbij4+ZYO1HdMQPE/nNI9Eh7yagDI+nrR7LytnWcjrXeqw
 O8wspvWqqlvlBySZWjWKce4rloIrZKfgGh/h5ROwGe9IeTSkb01fJd9sVTgNWL0Ko+cT
 0kAA==
X-Gm-Message-State: AOAM530WBKjsz+3X5kYIWwYRq93fpx+lBmhX19bOtamcdTwXA2BuHEZt
 NsjLZJbZWw/WFfP2+y7dEL4kMG6RrogbDg==
X-Google-Smtp-Source: ABdhPJxxV5Bb9WlCUmwu6IxNfnewhbI/OVnuUyL1a/cRGpxqMyV9sUKvZeVTWEAiYqpmlGwlN+xdFw==
X-Received: by 2002:aa7:8601:0:b029:2ec:d8a6:6b84 with SMTP id
 p1-20020aa786010000b02902ecd8a66b84mr2073015pfn.15.1623726467433; 
 Mon, 14 Jun 2021 20:07:47 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id w71sm7554666pfc.164.2021.06.14.20.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 20:07:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] target/s390x: Expose load_psw and get_psw_mask to cpu.h
Date: Mon, 14 Jun 2021 20:07:40 -0700
Message-Id: <20210615030744.1252385-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615030744.1252385-1-richard.henderson@linaro.org>
References: <20210615030744.1252385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: ruixin.bao@ibm.com, jonathan.albrecht@linux.vnet.ibm.com, cohuck@redhat.com,
 qemu-s390x@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename to s390_cpu_set_psw and s390_cpu_get_psw_mask at the
same time.  Adjust so that they compile for user-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/cpu.h         |  3 ++
 target/s390x/internal.h    |  5 ---
 target/s390x/cc_helper.c   |  2 +-
 target/s390x/excp_helper.c | 28 ++++++------
 target/s390x/helper.c      | 89 ++++++++++++++++++++------------------
 target/s390x/sigp.c        |  3 +-
 6 files changed, 69 insertions(+), 61 deletions(-)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 2464d4076c..b26ae8fff2 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -845,6 +845,9 @@ int s390_cpu_pv_mem_rw(S390CPU *cpu, unsigned int offset, void *hostbuf,
 int s390_cpu_restart(S390CPU *cpu);
 void s390_init_sigp(void);
 
+/* helper.c */
+void s390_cpu_set_psw(CPUS390XState *env, uint64_t mask, uint64_t addr);
+uint64_t s390_cpu_get_psw_mask(CPUS390XState *env);
 
 /* outside of target/s390x/ */
 S390CPU *s390_cpu_addr2state(uint16_t cpu_addr);
diff --git a/target/s390x/internal.h b/target/s390x/internal.h
index 11515bb617..4a18b74d10 100644
--- a/target/s390x/internal.h
+++ b/target/s390x/internal.h
@@ -235,10 +235,6 @@ int s390_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
 const char *cc_name(enum cc_op cc_op);
 uint32_t calc_cc(CPUS390XState *env, uint32_t cc_op, uint64_t src, uint64_t dst,
                  uint64_t vr);
-#ifndef CONFIG_USER_ONLY
-void load_psw(CPUS390XState *env, uint64_t mask, uint64_t addr);
-#endif /* CONFIG_USER_ONLY */
-
 
 /* cpu.c */
 #ifndef CONFIG_USER_ONLY
@@ -303,7 +299,6 @@ void s390_cpu_gdb_init(CPUState *cs);
 void s390_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 void do_restart_interrupt(CPUS390XState *env);
 #ifndef CONFIG_USER_ONLY
-uint64_t get_psw_mask(CPUS390XState *env);
 void s390_cpu_recompute_watchpoints(CPUState *cs);
 void s390x_tod_timer(void *opaque);
 void s390x_cpu_timer(void *opaque);
diff --git a/target/s390x/cc_helper.c b/target/s390x/cc_helper.c
index e7039d0d18..e7a74d66dd 100644
--- a/target/s390x/cc_helper.c
+++ b/target/s390x/cc_helper.c
@@ -509,7 +509,7 @@ uint32_t HELPER(calc_cc)(CPUS390XState *env, uint32_t cc_op, uint64_t src,
 #ifndef CONFIG_USER_ONLY
 void HELPER(load_psw)(CPUS390XState *env, uint64_t mask, uint64_t addr)
 {
-    load_psw(env, mask, addr);
+    s390_cpu_set_psw(env, mask, addr);
     cpu_loop_exit(env_cpu(env));
 }
 
diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
index 20625c2c8f..9c361428c8 100644
--- a/target/s390x/excp_helper.c
+++ b/target/s390x/excp_helper.c
@@ -252,7 +252,7 @@ static void do_program_interrupt(CPUS390XState *env)
 
     lowcore->pgm_ilen = cpu_to_be16(ilen);
     lowcore->pgm_code = cpu_to_be16(env->int_pgm_code);
-    lowcore->program_old_psw.mask = cpu_to_be64(get_psw_mask(env));
+    lowcore->program_old_psw.mask = cpu_to_be64(s390_cpu_get_psw_mask(env));
     lowcore->program_old_psw.addr = cpu_to_be64(env->psw.addr);
     mask = be64_to_cpu(lowcore->program_new_psw.mask);
     addr = be64_to_cpu(lowcore->program_new_psw.addr);
@@ -260,7 +260,7 @@ static void do_program_interrupt(CPUS390XState *env)
 
     cpu_unmap_lowcore(lowcore);
 
-    load_psw(env, mask, addr);
+    s390_cpu_set_psw(env, mask, addr);
 }
 
 static void do_svc_interrupt(CPUS390XState *env)
@@ -272,14 +272,14 @@ static void do_svc_interrupt(CPUS390XState *env)
 
     lowcore->svc_code = cpu_to_be16(env->int_svc_code);
     lowcore->svc_ilen = cpu_to_be16(env->int_svc_ilen);
-    lowcore->svc_old_psw.mask = cpu_to_be64(get_psw_mask(env));
+    lowcore->svc_old_psw.mask = cpu_to_be64(s390_cpu_get_psw_mask(env));
     lowcore->svc_old_psw.addr = cpu_to_be64(env->psw.addr + env->int_svc_ilen);
     mask = be64_to_cpu(lowcore->svc_new_psw.mask);
     addr = be64_to_cpu(lowcore->svc_new_psw.addr);
 
     cpu_unmap_lowcore(lowcore);
 
-    load_psw(env, mask, addr);
+    s390_cpu_set_psw(env, mask, addr);
 
     /* When a PER event is pending, the PER exception has to happen
        immediately after the SERVICE CALL one.  */
@@ -348,12 +348,12 @@ static void do_ext_interrupt(CPUS390XState *env)
 
     mask = be64_to_cpu(lowcore->external_new_psw.mask);
     addr = be64_to_cpu(lowcore->external_new_psw.addr);
-    lowcore->external_old_psw.mask = cpu_to_be64(get_psw_mask(env));
+    lowcore->external_old_psw.mask = cpu_to_be64(s390_cpu_get_psw_mask(env));
     lowcore->external_old_psw.addr = cpu_to_be64(env->psw.addr);
 
     cpu_unmap_lowcore(lowcore);
 
-    load_psw(env, mask, addr);
+    s390_cpu_set_psw(env, mask, addr);
 }
 
 static void do_io_interrupt(CPUS390XState *env)
@@ -373,7 +373,7 @@ static void do_io_interrupt(CPUS390XState *env)
     lowcore->subchannel_nr = cpu_to_be16(io->nr);
     lowcore->io_int_parm = cpu_to_be32(io->parm);
     lowcore->io_int_word = cpu_to_be32(io->word);
-    lowcore->io_old_psw.mask = cpu_to_be64(get_psw_mask(env));
+    lowcore->io_old_psw.mask = cpu_to_be64(s390_cpu_get_psw_mask(env));
     lowcore->io_old_psw.addr = cpu_to_be64(env->psw.addr);
     mask = be64_to_cpu(lowcore->io_new_psw.mask);
     addr = be64_to_cpu(lowcore->io_new_psw.addr);
@@ -381,7 +381,7 @@ static void do_io_interrupt(CPUS390XState *env)
     cpu_unmap_lowcore(lowcore);
     g_free(io);
 
-    load_psw(env, mask, addr);
+    s390_cpu_set_psw(env, mask, addr);
 }
 
 typedef struct MchkExtSaveArea {
@@ -457,14 +457,14 @@ static void do_mchk_interrupt(CPUS390XState *env)
     lowcore->clock_comp_save_area = cpu_to_be64(env->ckc >> 8);
 
     lowcore->mcic = cpu_to_be64(mcic);
-    lowcore->mcck_old_psw.mask = cpu_to_be64(get_psw_mask(env));
+    lowcore->mcck_old_psw.mask = cpu_to_be64(s390_cpu_get_psw_mask(env));
     lowcore->mcck_old_psw.addr = cpu_to_be64(env->psw.addr);
     mask = be64_to_cpu(lowcore->mcck_new_psw.mask);
     addr = be64_to_cpu(lowcore->mcck_new_psw.addr);
 
     cpu_unmap_lowcore(lowcore);
 
-    load_psw(env, mask, addr);
+    s390_cpu_set_psw(env, mask, addr);
 }
 
 void s390_cpu_do_interrupt(CPUState *cs)
@@ -592,9 +592,11 @@ void s390x_cpu_debug_excp_handler(CPUState *cs)
            and MVCS instrutions are not used.  */
         env->per_perc_atmid |= env->psw.mask & (PSW_MASK_ASC) >> 46;
 
-        /* Remove all watchpoints to re-execute the code.  A PER exception
-           will be triggered, it will call load_psw which will recompute
-           the watchpoints.  */
+        /*
+         * Remove all watchpoints to re-execute the code.  A PER exception
+         * will be triggered, it will call s390_cpu_set_psw which will
+         * recompute the watchpoints.
+         */
         cpu_watchpoint_remove_all(cs, BP_CPU);
         cpu_loop_exit_noexc(cs);
     }
diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index 7678994feb..d311903b94 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -104,44 +104,6 @@ void s390_handle_wait(S390CPU *cpu)
     }
 }
 
-void load_psw(CPUS390XState *env, uint64_t mask, uint64_t addr)
-{
-    uint64_t old_mask = env->psw.mask;
-
-    env->psw.addr = addr;
-    env->psw.mask = mask;
-
-    /* KVM will handle all WAITs and trigger a WAIT exit on disabled_wait */
-    if (!tcg_enabled()) {
-        return;
-    }
-    env->cc_op = (mask >> 44) & 3;
-
-    if ((old_mask ^ mask) & PSW_MASK_PER) {
-        s390_cpu_recompute_watchpoints(env_cpu(env));
-    }
-
-    if (mask & PSW_MASK_WAIT) {
-        s390_handle_wait(env_archcpu(env));
-    }
-}
-
-uint64_t get_psw_mask(CPUS390XState *env)
-{
-    uint64_t r = env->psw.mask;
-
-    if (tcg_enabled()) {
-        env->cc_op = calc_cc(env, env->cc_op, env->cc_src, env->cc_dst,
-                             env->cc_vr);
-
-        r &= ~PSW_MASK_CC;
-        assert(!(env->cc_op & ~3));
-        r |= (uint64_t)env->cc_op << 44;
-    }
-
-    return r;
-}
-
 LowCore *cpu_map_lowcore(CPUS390XState *env)
 {
     LowCore *lowcore;
@@ -168,7 +130,7 @@ void do_restart_interrupt(CPUS390XState *env)
 
     lowcore = cpu_map_lowcore(env);
 
-    lowcore->restart_old_psw.mask = cpu_to_be64(get_psw_mask(env));
+    lowcore->restart_old_psw.mask = cpu_to_be64(s390_cpu_get_psw_mask(env));
     lowcore->restart_old_psw.addr = cpu_to_be64(env->psw.addr);
     mask = be64_to_cpu(lowcore->restart_new_psw.mask);
     addr = be64_to_cpu(lowcore->restart_new_psw.addr);
@@ -176,7 +138,7 @@ void do_restart_interrupt(CPUS390XState *env)
     cpu_unmap_lowcore(lowcore);
     env->pending_int &= ~INTERRUPT_RESTART;
 
-    load_psw(env, mask, addr);
+    s390_cpu_set_psw(env, mask, addr);
 }
 
 void s390_cpu_recompute_watchpoints(CPUState *cs)
@@ -266,7 +228,7 @@ int s390_store_status(S390CPU *cpu, hwaddr addr, bool store_arch)
         sa->grs[i] = cpu_to_be64(cpu->env.regs[i]);
     }
     sa->psw.addr = cpu_to_be64(cpu->env.psw.addr);
-    sa->psw.mask = cpu_to_be64(get_psw_mask(&cpu->env));
+    sa->psw.mask = cpu_to_be64(s390_cpu_get_psw_mask(&cpu->env));
     sa->prefix = cpu_to_be32(cpu->env.psa);
     sa->fpc = cpu_to_be32(cpu->env.fpc);
     sa->todpr = cpu_to_be32(cpu->env.todpr);
@@ -323,8 +285,53 @@ int s390_store_adtl_status(S390CPU *cpu, hwaddr addr, hwaddr len)
     cpu_physical_memory_unmap(sa, len, 1, len);
     return 0;
 }
+#else
+/* For user-only, tcg is always enabled. */
+#define tcg_enabled() true
 #endif /* CONFIG_USER_ONLY */
 
+void s390_cpu_set_psw(CPUS390XState *env, uint64_t mask, uint64_t addr)
+{
+#ifndef CONFIG_USER_ONLY
+    uint64_t old_mask = env->psw.mask;
+#endif
+
+    env->psw.addr = addr;
+    env->psw.mask = mask;
+
+    /* KVM will handle all WAITs and trigger a WAIT exit on disabled_wait */
+    if (!tcg_enabled()) {
+        return;
+    }
+    env->cc_op = (mask >> 44) & 3;
+
+#ifndef CONFIG_USER_ONLY
+    if ((old_mask ^ mask) & PSW_MASK_PER) {
+        s390_cpu_recompute_watchpoints(env_cpu(env));
+    }
+
+    if (mask & PSW_MASK_WAIT) {
+        s390_handle_wait(env_archcpu(env));
+    }
+#endif
+}
+
+uint64_t s390_cpu_get_psw_mask(CPUS390XState *env)
+{
+    uint64_t r = env->psw.mask;
+
+    if (tcg_enabled()) {
+        env->cc_op = calc_cc(env, env->cc_op, env->cc_src, env->cc_dst,
+                             env->cc_vr);
+
+        r &= ~PSW_MASK_CC;
+        assert(!(env->cc_op & ~3));
+        r |= (uint64_t)env->cc_op << 44;
+    }
+
+    return r;
+}
+
 void s390_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     S390CPU *cpu = S390_CPU(cs);
diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
index c604f17710..c2d5cdf061 100644
--- a/target/s390x/sigp.c
+++ b/target/s390x/sigp.c
@@ -235,7 +235,8 @@ static void sigp_restart(CPUState *cs, run_on_cpu_data arg)
         cpu_synchronize_state(cs);
         /*
          * Set OPERATING (and unhalting) before loading the restart PSW.
-         * load_psw() will then properly halt the CPU again if necessary (TCG).
+         * s390_cpu_set_psw() will then properly halt the CPU again if
+         * necessary (TCG).
          */
         s390_cpu_set_state(S390_CPU_STATE_OPERATING, cpu);
         do_restart_interrupt(&cpu->env);
-- 
2.25.1


