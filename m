Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9F23116FF
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:25:39 +0100 (CET)
Received: from localhost ([::1]:40306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8ATq-0004Mb-8n
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:25:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A39-0002ZC-KV
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:58:03 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:41555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A33-0003Zd-7d
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:58:03 -0500
Received: by mail-pl1-x632.google.com with SMTP id a16so4310622plh.8
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ta7Xa7xkFMBbNPIy/284vzcbT6wt5OS9JI8O+IndJkY=;
 b=ywOC30BA8Y6mWuYiHXZlrCc4ohYsNSJBsN0Mj4sRHb/BP5kDbNnk6fBaABpx08bw90
 dn3ah6zWUXT1ad4dVyYJu4DQbT6MV1dwyVkbDbfcgCN+Wm/WdZtBk5h6Lvf9mLdxZFaM
 vyK8rpV7HZLbprNtmNtYfBU9AxMcOnmjb0KIu19+NiuYlQ/2SlLcyO6nf/gM8iXvpmKB
 OBRUVh2U8KTvQunQ/dt6idRv3b/Pq2G2t8qQkS/S+a23lsVEOIKu5rAkNxo74V1S2Er4
 7lZRlqk1xpvV6aOWMMaooNGclePwy77f3P5bSWf8hxIR3uuXTjRxbkas9STSjaNU/HDc
 /m4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ta7Xa7xkFMBbNPIy/284vzcbT6wt5OS9JI8O+IndJkY=;
 b=gr5ilHhZDmkvX4adInGSd5+pRiJwriK2CQf9uej1s9DxgBuxjRjCBoDF1Y7/YcMIs/
 wJ9IjT/XNFusJ0rabhuEgbgmgbg+F1W9kmhC0CNCeaTaFNMGi6JGvC8XF41sQSpuWzPd
 S1OHyWzEIFfQzGXqiBx9iR5Wn8IDDtTxFVmkurLsHSVTiW2o1HwiPRHtVoSsAmXgoKFZ
 ElcA+vZzkPtACf3Sgj+hL0ElTM4LbI/X1gzP9LQXOmeAWEXki4BU6gSyhtVN+cLCIW1f
 C0ZFBYCC5rUrXy1UDOAvqO69kTz+IYsOc+UILKiCBIs/X0i2a64aFvwPUIQ5NWmuHJRk
 V44Q==
X-Gm-Message-State: AOAM531cu9J90k6GrxvyUyXY7FoeMxYBfKlcRpVdcrY9e5F/h/WTNmie
 wKZw/6TGSblUivt9tmYlR9mp89X4K0UUHWvB
X-Google-Smtp-Source: ABdhPJyBxA7Uf1RaQZFIAy/vaTslCSFWVWscLbMxUL/VcgbiF6GT3PoqVNV+2ifWTSnUkUojclqHhA==
X-Received: by 2002:a17:90a:9905:: with SMTP id
 b5mr5989914pjp.195.1612565873558; 
 Fri, 05 Feb 2021 14:57:53 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/46] cpu: Move synchronize_from_tb() to tcg_ops
Date: Fri,  5 Feb 2021 12:56:36 -1000
Message-Id: <20210205225650.1330794-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
[claudio: wrapped target code in CONFIG_TCG, reworded comments]
Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210204163931.7358-5-cfontana@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h     | 22 +++++++++++++---------
 accel/tcg/cpu-exec.c      |  4 ++--
 target/arm/cpu.c          |  4 +++-
 target/avr/cpu.c          |  2 +-
 target/hppa/cpu.c         |  2 +-
 target/i386/tcg/tcg-cpu.c |  2 +-
 target/microblaze/cpu.c   |  2 +-
 target/mips/cpu.c         |  4 +++-
 target/riscv/cpu.c        |  2 +-
 target/rx/cpu.c           |  2 +-
 target/sh4/cpu.c          |  2 +-
 target/sparc/cpu.c        |  2 +-
 target/tricore/cpu.c      |  2 +-
 13 files changed, 30 insertions(+), 22 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index d0b17dcc4c..8cf5585db7 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -86,6 +86,19 @@ typedef struct TcgCpuOperations {
      * Called when the first CPU is realized.
      */
     void (*initialize)(void);
+    /**
+     * @synchronize_from_tb: Synchronize state from a TCG #TranslationBlock
+     *
+     * This is called when we abandon execution of a TB before starting it,
+     * and must set all parts of the CPU state which the previous TB in the
+     * chain may not have updated.
+     * By default, when this is NULL, a call is made to @set_pc(tb->pc).
+     *
+     * If more state needs to be restored, the target must implement a
+     * function to restore all the state, and register it here.
+     */
+    void (*synchronize_from_tb)(CPUState *cpu,
+                                const struct TranslationBlock *tb);
 
 } TcgCpuOperations;
 
@@ -119,13 +132,6 @@ typedef struct TcgCpuOperations {
  *       If the target behaviour here is anything other than "set
  *       the PC register to the value passed in" then the target must
  *       also implement the synchronize_from_tb hook.
- * @synchronize_from_tb: Callback for synchronizing state from a TCG
- *       #TranslationBlock. This is called when we abandon execution
- *       of a TB before starting it, and must set all parts of the CPU
- *       state which the previous TB in the chain may not have updated.
- *       This always includes at least the program counter; some targets
- *       will need to do more. If this hook is not implemented then the
- *       default is to call @set_pc(tb->pc).
  * @tlb_fill: Callback for handling a softmmu tlb miss or user-only
  *       address fault.  For system mode, if the access is valid, call
  *       tlb_set_page and return true; if the access is invalid, and
@@ -202,8 +208,6 @@ struct CPUClass {
     void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
                                Error **errp);
     void (*set_pc)(CPUState *cpu, vaddr value);
-    void (*synchronize_from_tb)(CPUState *cpu,
-                                const struct TranslationBlock *tb);
     bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
                      MMUAccessType access_type, int mmu_idx,
                      bool probe, uintptr_t retaddr);
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5628a156d1..12b6a91d62 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -213,8 +213,8 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
                                TARGET_FMT_lx "] %s\n",
                                last_tb->tc.ptr, last_tb->pc,
                                lookup_symbol(last_tb->pc));
-        if (cc->synchronize_from_tb) {
-            cc->synchronize_from_tb(cpu, last_tb);
+        if (cc->tcg_ops.synchronize_from_tb) {
+            cc->tcg_ops.synchronize_from_tb(cpu, last_tb);
         } else {
             assert(cc->set_pc);
             cc->set_pc(cpu, last_tb->pc);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index fa4d4ba4eb..140cb33f07 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -54,6 +54,7 @@ static void arm_cpu_set_pc(CPUState *cs, vaddr value)
     }
 }
 
+#ifdef CONFIG_TCG
 static void arm_cpu_synchronize_from_tb(CPUState *cs,
                                         const TranslationBlock *tb)
 {
@@ -70,6 +71,7 @@ static void arm_cpu_synchronize_from_tb(CPUState *cs,
         env->regs[15] = tb->pc;
     }
 }
+#endif /* CONFIG_TCG */
 
 static bool arm_cpu_has_work(CPUState *cs)
 {
@@ -2257,7 +2259,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->cpu_exec_interrupt = arm_cpu_exec_interrupt;
     cc->dump_state = arm_cpu_dump_state;
     cc->set_pc = arm_cpu_set_pc;
-    cc->synchronize_from_tb = arm_cpu_synchronize_from_tb;
     cc->gdb_read_register = arm_cpu_gdb_read_register;
     cc->gdb_write_register = arm_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
@@ -2277,6 +2278,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->disas_set_info = arm_disas_set_info;
 #ifdef CONFIG_TCG
     cc->tcg_ops.initialize = arm_translate_init;
+    cc->tcg_ops.synchronize_from_tb = arm_cpu_synchronize_from_tb;
     cc->tlb_fill = arm_cpu_tlb_fill;
     cc->debug_excp_handler = arm_debug_excp_handler;
     cc->debug_check_watchpoint = arm_debug_check_watchpoint;
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index fb66695fbb..a82fa9d7a8 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -208,7 +208,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->vmsd = &vms_avr_cpu;
     cc->disas_set_info = avr_cpu_disas_set_info;
     cc->tcg_ops.initialize = avr_cpu_tcg_init;
-    cc->synchronize_from_tb = avr_cpu_synchronize_from_tb;
+    cc->tcg_ops.synchronize_from_tb = avr_cpu_synchronize_from_tb;
     cc->gdb_read_register = avr_cpu_gdb_read_register;
     cc->gdb_write_register = avr_cpu_gdb_write_register;
     cc->gdb_num_core_regs = 35;
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 80e3081631..94ea3014a3 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -144,7 +144,7 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
     cc->cpu_exec_interrupt = hppa_cpu_exec_interrupt;
     cc->dump_state = hppa_cpu_dump_state;
     cc->set_pc = hppa_cpu_set_pc;
-    cc->synchronize_from_tb = hppa_cpu_synchronize_from_tb;
+    cc->tcg_ops.synchronize_from_tb = hppa_cpu_synchronize_from_tb;
     cc->gdb_read_register = hppa_cpu_gdb_read_register;
     cc->gdb_write_register = hppa_cpu_gdb_write_register;
     cc->tlb_fill = hppa_cpu_tlb_fill;
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index d90502a0cc..874286de28 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -61,7 +61,7 @@ void tcg_cpu_common_class_init(CPUClass *cc)
 {
     cc->do_interrupt = x86_cpu_do_interrupt;
     cc->cpu_exec_interrupt = x86_cpu_exec_interrupt;
-    cc->synchronize_from_tb = x86_cpu_synchronize_from_tb;
+    cc->tcg_ops.synchronize_from_tb = x86_cpu_synchronize_from_tb;
     cc->cpu_exec_enter = x86_cpu_exec_enter;
     cc->cpu_exec_exit = x86_cpu_exec_exit;
     cc->tcg_ops.initialize = tcg_x86_init;
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index f2978ca726..e40d1db88d 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -369,7 +369,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     cc->cpu_exec_interrupt = mb_cpu_exec_interrupt;
     cc->dump_state = mb_cpu_dump_state;
     cc->set_pc = mb_cpu_set_pc;
-    cc->synchronize_from_tb = mb_cpu_synchronize_from_tb;
+    cc->tcg_ops.synchronize_from_tb = mb_cpu_synchronize_from_tb;
     cc->gdb_read_register = mb_cpu_gdb_read_register;
     cc->gdb_write_register = mb_cpu_gdb_write_register;
     cc->tlb_fill = mb_cpu_tlb_fill;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index b96c3d5969..350f1c66c7 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -257,6 +257,7 @@ static void mips_cpu_set_pc(CPUState *cs, vaddr value)
     }
 }
 
+#ifdef CONFIG_TCG
 static void mips_cpu_synchronize_from_tb(CPUState *cs,
                                          const TranslationBlock *tb)
 {
@@ -267,6 +268,7 @@ static void mips_cpu_synchronize_from_tb(CPUState *cs,
     env->hflags &= ~MIPS_HFLAG_BMASK;
     env->hflags |= tb->flags & MIPS_HFLAG_BMASK;
 }
+#endif /* CONFIG_TCG */
 
 static bool mips_cpu_has_work(CPUState *cs)
 {
@@ -678,7 +680,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->cpu_exec_interrupt = mips_cpu_exec_interrupt;
     cc->dump_state = mips_cpu_dump_state;
     cc->set_pc = mips_cpu_set_pc;
-    cc->synchronize_from_tb = mips_cpu_synchronize_from_tb;
     cc->gdb_read_register = mips_cpu_gdb_read_register;
     cc->gdb_write_register = mips_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
@@ -690,6 +691,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->disas_set_info = mips_cpu_disas_set_info;
 #ifdef CONFIG_TCG
     cc->tcg_ops.initialize = mips_tcg_init;
+    cc->tcg_ops.synchronize_from_tb = mips_cpu_synchronize_from_tb;
     cc->tlb_fill = mips_cpu_tlb_fill;
 #endif
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 60d0b43153..1e9bd3c313 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -597,7 +597,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->cpu_exec_interrupt = riscv_cpu_exec_interrupt;
     cc->dump_state = riscv_cpu_dump_state;
     cc->set_pc = riscv_cpu_set_pc;
-    cc->synchronize_from_tb = riscv_cpu_synchronize_from_tb;
+    cc->tcg_ops.synchronize_from_tb = riscv_cpu_synchronize_from_tb;
     cc->gdb_read_register = riscv_cpu_gdb_read_register;
     cc->gdb_write_register = riscv_cpu_gdb_write_register;
     cc->gdb_num_core_regs = 33;
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index cdcab49c8a..4e0de14eef 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -190,7 +190,7 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
     cc->cpu_exec_interrupt = rx_cpu_exec_interrupt;
     cc->dump_state = rx_cpu_dump_state;
     cc->set_pc = rx_cpu_set_pc;
-    cc->synchronize_from_tb = rx_cpu_synchronize_from_tb;
+    cc->tcg_ops.synchronize_from_tb = rx_cpu_synchronize_from_tb;
     cc->gdb_read_register = rx_cpu_gdb_read_register;
     cc->gdb_write_register = rx_cpu_gdb_write_register;
     cc->get_phys_page_debug = rx_cpu_get_phys_page_debug;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index b86753cda5..130debe074 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -223,7 +223,7 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     cc->cpu_exec_interrupt = superh_cpu_exec_interrupt;
     cc->dump_state = superh_cpu_dump_state;
     cc->set_pc = superh_cpu_set_pc;
-    cc->synchronize_from_tb = superh_cpu_synchronize_from_tb;
+    cc->tcg_ops.synchronize_from_tb = superh_cpu_synchronize_from_tb;
     cc->gdb_read_register = superh_cpu_gdb_read_register;
     cc->gdb_write_register = superh_cpu_gdb_write_register;
     cc->tlb_fill = superh_cpu_tlb_fill;
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 3ab71e9d00..0ae38eb496 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -870,7 +870,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     cc->memory_rw_debug = sparc_cpu_memory_rw_debug;
 #endif
     cc->set_pc = sparc_cpu_set_pc;
-    cc->synchronize_from_tb = sparc_cpu_synchronize_from_tb;
+    cc->tcg_ops.synchronize_from_tb = sparc_cpu_synchronize_from_tb;
     cc->gdb_read_register = sparc_cpu_gdb_read_register;
     cc->gdb_write_register = sparc_cpu_gdb_write_register;
     cc->tlb_fill = sparc_cpu_tlb_fill;
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index bf135af40f..09cc6a0e62 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -162,7 +162,7 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
 
     cc->dump_state = tricore_cpu_dump_state;
     cc->set_pc = tricore_cpu_set_pc;
-    cc->synchronize_from_tb = tricore_cpu_synchronize_from_tb;
+    cc->tcg_ops.synchronize_from_tb = tricore_cpu_synchronize_from_tb;
     cc->get_phys_page_debug = tricore_cpu_get_phys_page_debug;
     cc->tcg_ops.initialize = tricore_tcg_init;
     cc->tlb_fill = tricore_cpu_tlb_fill;
-- 
2.25.1


