Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 948183116DE
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:20:55 +0100 (CET)
Received: from localhost ([::1]:54498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8APG-0006l8-C6
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:20:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A3B-0002ch-FE
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:58:05 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:43154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A34-0003ai-2Z
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:58:05 -0500
Received: by mail-pg1-x533.google.com with SMTP id n10so5559515pgl.10
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xK5Dftj9uEZFD6bAh7tzhtmgVKApQzK0KsPnbDs5klE=;
 b=xKmOdqyVinxsjl3J4GKwhloxVrdIbems2Xs77z9Y6L26Q2tJWrb3DJqdWWMxkUg/5Y
 cF0qIRUz3QjttvVoWM9II+pn7f1wrIMzqTMRGa7m4rBVuVGHnryae/k4A7InPR3Ha1Fq
 oc3u+YUH4R/FkVfSd1KQJ0jlry97vnEbQeXGLvRGP4QQktsTADErko1noPFzAvTDFRtq
 9oXHrkhV3kVdsdLPkgEQy2T/EOlM3iEdFOexvNlJAfHdw9VpQPOQGfF3phw+KHXPgM3q
 vNvxX+AK+fmLo9D/6E8a4jXxufcMjAqiJEqd7v6ejMqmieM1NAifv+wl5HY1NAozRdCP
 Q1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xK5Dftj9uEZFD6bAh7tzhtmgVKApQzK0KsPnbDs5klE=;
 b=NKUyPduZ+tqNLhikM1ppUF3m9k5gYi3dhgXe/q9jBqL8rUsW+PuligCMHNYu3Ov1v2
 Si/JjQi4cKRnDwB4eXL0uw1kAPMAnktRiaJYMo5JWFD9huBgeNBMvqY2nDuiZnUbROw7
 q+yqrp6TY0Pt4yBfKHDrzSYO5SGSep08QbUZ/oNpUn56g5Cum6EBCKsczdhF+YzCZpYI
 yre1nLyb1nbnZi6/wtbkCVmUNSf3FCtfq+WLCkuhrW1ddndMt7QVxUEfd+IjY2Dc1hiQ
 q4HpQFfpgwBBlxrrcWRUH/H+fNh+CmYofZP6PJT8lSzz6RnKibqH4lJ7Y6QgpQPC+LhU
 EM/Q==
X-Gm-Message-State: AOAM530y88Rwh5awQdQziMxJskox8ZNZZ3FHHdSeLwQZgXLEFOXwAQwY
 +Pjf2xTQ6N1ZMhjr3Twi1+73th11bn5JB0SS
X-Google-Smtp-Source: ABdhPJx9DVQh/PDBQTDB2ZXtNNo6KjCG0ToKKuCEIqncqfRmdivRv09UXHHdhE3Cyk6CCp4R2n60fA==
X-Received: by 2002:aa7:9e8c:0:b029:1cb:1c04:bdc6 with SMTP id
 p12-20020aa79e8c0000b02901cb1c04bdc6mr6519245pfq.54.1612565875660; 
 Fri, 05 Feb 2021 14:57:55 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/46] cpu: Move cpu_exec_* to tcg_ops
Date: Fri,  5 Feb 2021 12:56:37 -1000
Message-Id: <20210205225650.1330794-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
[claudio: wrapped target code in CONFIG_TCG]
Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210204163931.7358-6-cfontana@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h           | 12 ++++++------
 accel/tcg/cpu-exec.c            | 12 ++++++------
 target/alpha/cpu.c              |  2 +-
 target/arm/cpu.c                |  2 +-
 target/arm/cpu64.c              |  5 ++++-
 target/arm/cpu_tcg.c            |  7 ++++++-
 target/avr/cpu.c                |  2 +-
 target/cris/cpu.c               |  2 +-
 target/hppa/cpu.c               |  2 +-
 target/i386/tcg/tcg-cpu.c       |  6 +++---
 target/lm32/cpu.c               |  2 +-
 target/m68k/cpu.c               |  2 +-
 target/microblaze/cpu.c         |  2 +-
 target/mips/cpu.c               |  2 +-
 target/nios2/cpu.c              |  2 +-
 target/openrisc/cpu.c           |  2 +-
 target/riscv/cpu.c              |  2 +-
 target/rx/cpu.c                 |  2 +-
 target/s390x/cpu.c              |  2 +-
 target/sh4/cpu.c                |  2 +-
 target/sparc/cpu.c              |  2 +-
 target/tilegx/cpu.c             |  2 +-
 target/unicore32/cpu.c          |  2 +-
 target/xtensa/cpu.c             |  2 +-
 target/ppc/translate_init.c.inc | 16 ++++++++++------
 25 files changed, 54 insertions(+), 42 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 8cf5585db7..532984e016 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -99,6 +99,12 @@ typedef struct TcgCpuOperations {
      */
     void (*synchronize_from_tb)(CPUState *cpu,
                                 const struct TranslationBlock *tb);
+    /** @cpu_exec_enter: Callback for cpu_exec preparation */
+    void (*cpu_exec_enter)(CPUState *cpu);
+    /** @cpu_exec_exit: Callback for cpu_exec cleanup */
+    void (*cpu_exec_exit)(CPUState *cpu);
+    /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
+    bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
 
 } TcgCpuOperations;
 
@@ -168,9 +174,6 @@ typedef struct TcgCpuOperations {
  * @gdb_get_dynamic_xml: Callback to return dynamically generated XML for the
  *   gdb stub. Returns a pointer to the XML contents for the specified XML file
  *   or NULL if the CPU doesn't have a dynamically generated content for it.
- * @cpu_exec_enter: Callback for cpu_exec preparation.
- * @cpu_exec_exit: Callback for cpu_exec cleanup.
- * @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec.
  * @disas_set_info: Setup architecture specific components of disassembly info
  * @adjust_watchpoint_address: Perform a target-specific adjustment to an
  * address before attempting to match it against watchpoints.
@@ -233,9 +236,6 @@ struct CPUClass {
     const char *gdb_core_xml_file;
     gchar * (*gdb_arch_name)(CPUState *cpu);
     const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
-    void (*cpu_exec_enter)(CPUState *cpu);
-    void (*cpu_exec_exit)(CPUState *cpu);
-    bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
 
     void (*disas_set_info)(CPUState *cpu, disassemble_info *info);
     vaddr (*adjust_watchpoint_address)(CPUState *cpu, vaddr addr, int len);
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 12b6a91d62..953f050698 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -262,8 +262,8 @@ static void cpu_exec_enter(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->cpu_exec_enter) {
-        cc->cpu_exec_enter(cpu);
+    if (cc->tcg_ops.cpu_exec_enter) {
+        cc->tcg_ops.cpu_exec_enter(cpu);
     }
 }
 
@@ -271,8 +271,8 @@ static void cpu_exec_exit(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->cpu_exec_exit) {
-        cc->cpu_exec_exit(cpu);
+    if (cc->tcg_ops.cpu_exec_exit) {
+        cc->tcg_ops.cpu_exec_exit(cpu);
     }
 }
 
@@ -655,8 +655,8 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
            True when it is, and we should restart on a new TB,
            and via longjmp via cpu_loop_exit.  */
         else {
-            if (cc->cpu_exec_interrupt &&
-                cc->cpu_exec_interrupt(cpu, interrupt_request)) {
+            if (cc->tcg_ops.cpu_exec_interrupt &&
+                cc->tcg_ops.cpu_exec_interrupt(cpu, interrupt_request)) {
                 if (need_replay_interrupt(interrupt_request)) {
                     replay_interrupt();
                 }
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index d66f0351a9..d9ced1635a 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -218,7 +218,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = alpha_cpu_class_by_name;
     cc->has_work = alpha_cpu_has_work;
     cc->do_interrupt = alpha_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = alpha_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = alpha_cpu_exec_interrupt;
     cc->dump_state = alpha_cpu_dump_state;
     cc->set_pc = alpha_cpu_set_pc;
     cc->gdb_read_register = alpha_cpu_gdb_read_register;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 140cb33f07..98a5a0c648 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2256,7 +2256,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = arm_cpu_class_by_name;
     cc->has_work = arm_cpu_has_work;
-    cc->cpu_exec_interrupt = arm_cpu_exec_interrupt;
     cc->dump_state = arm_cpu_dump_state;
     cc->set_pc = arm_cpu_set_pc;
     cc->gdb_read_register = arm_cpu_gdb_read_register;
@@ -2278,6 +2277,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->disas_set_info = arm_disas_set_info;
 #ifdef CONFIG_TCG
     cc->tcg_ops.initialize = arm_translate_init;
+    cc->tcg_ops.cpu_exec_interrupt = arm_cpu_exec_interrupt;
     cc->tcg_ops.synchronize_from_tb = arm_cpu_synchronize_from_tb;
     cc->tlb_fill = arm_cpu_tlb_fill;
     cc->debug_excp_handler = arm_debug_excp_handler;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 5e851028c5..a9a1cdb871 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -805,7 +805,10 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
 {
     CPUClass *cc = CPU_CLASS(oc);
 
-    cc->cpu_exec_interrupt = arm_cpu_exec_interrupt;
+#ifdef CONFIG_TCG
+    cc->tcg_ops.cpu_exec_interrupt = arm_cpu_exec_interrupt;
+#endif /* CONFIG_TCG */
+
     cc->gdb_read_register = aarch64_cpu_gdb_read_register;
     cc->gdb_write_register = aarch64_cpu_gdb_write_register;
     cc->gdb_num_core_regs = 34;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 98544db2df..f2e565166e 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -15,6 +15,7 @@
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
 
+#ifdef CONFIG_TCG
 static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
@@ -38,6 +39,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return ret;
 }
+#endif /* CONFIG_TCG */
 
 static void arm926_initfn(Object *obj)
 {
@@ -668,7 +670,10 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
     cc->do_interrupt = arm_v7m_cpu_do_interrupt;
 #endif
 
-    cc->cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt;
+#ifdef CONFIG_TCG
+    cc->tcg_ops.cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt;
+#endif /* CONFIG_TCG */
+
     cc->gdb_core_xml_file = "arm-m-profile.xml";
 }
 
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index a82fa9d7a8..499a98dcee 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -199,7 +199,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->has_work = avr_cpu_has_work;
     cc->do_interrupt = avr_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = avr_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = avr_cpu_exec_interrupt;
     cc->dump_state = avr_cpu_dump_state;
     cc->set_pc = avr_cpu_set_pc;
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index 4328f8e6c9..7489fc20c8 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -269,7 +269,7 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = cris_cpu_class_by_name;
     cc->has_work = cris_cpu_has_work;
     cc->do_interrupt = cris_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = cris_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = cris_cpu_exec_interrupt;
     cc->dump_state = cris_cpu_dump_state;
     cc->set_pc = cris_cpu_set_pc;
     cc->gdb_read_register = cris_cpu_gdb_read_register;
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 94ea3014a3..34c598230e 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -141,7 +141,7 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = hppa_cpu_class_by_name;
     cc->has_work = hppa_cpu_has_work;
     cc->do_interrupt = hppa_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = hppa_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = hppa_cpu_exec_interrupt;
     cc->dump_state = hppa_cpu_dump_state;
     cc->set_pc = hppa_cpu_set_pc;
     cc->tcg_ops.synchronize_from_tb = hppa_cpu_synchronize_from_tb;
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 874286de28..b7c485aa76 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -60,10 +60,10 @@ static void x86_cpu_synchronize_from_tb(CPUState *cs,
 void tcg_cpu_common_class_init(CPUClass *cc)
 {
     cc->do_interrupt = x86_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = x86_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = x86_cpu_exec_interrupt;
     cc->tcg_ops.synchronize_from_tb = x86_cpu_synchronize_from_tb;
-    cc->cpu_exec_enter = x86_cpu_exec_enter;
-    cc->cpu_exec_exit = x86_cpu_exec_exit;
+    cc->tcg_ops.cpu_exec_enter = x86_cpu_exec_enter;
+    cc->tcg_ops.cpu_exec_exit = x86_cpu_exec_exit;
     cc->tcg_ops.initialize = tcg_x86_init;
     cc->tlb_fill = x86_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index ef795b81a4..eea2d3e515 100644
--- a/target/lm32/cpu.c
+++ b/target/lm32/cpu.c
@@ -223,7 +223,7 @@ static void lm32_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = lm32_cpu_class_by_name;
     cc->has_work = lm32_cpu_has_work;
     cc->do_interrupt = lm32_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = lm32_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = lm32_cpu_exec_interrupt;
     cc->dump_state = lm32_cpu_dump_state;
     cc->set_pc = lm32_cpu_set_pc;
     cc->gdb_read_register = lm32_cpu_gdb_read_register;
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 3604ece49b..0d5f8e0dd8 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -466,7 +466,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     cc->class_by_name = m68k_cpu_class_by_name;
     cc->has_work = m68k_cpu_has_work;
     cc->do_interrupt = m68k_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = m68k_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = m68k_cpu_exec_interrupt;
     cc->dump_state = m68k_cpu_dump_state;
     cc->set_pc = m68k_cpu_set_pc;
     cc->gdb_read_register = m68k_cpu_gdb_read_register;
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index e40d1db88d..35b4b2eb9d 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -366,7 +366,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     cc->has_work = mb_cpu_has_work;
     cc->do_interrupt = mb_cpu_do_interrupt;
     cc->do_unaligned_access = mb_cpu_do_unaligned_access;
-    cc->cpu_exec_interrupt = mb_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = mb_cpu_exec_interrupt;
     cc->dump_state = mb_cpu_dump_state;
     cc->set_pc = mb_cpu_set_pc;
     cc->tcg_ops.synchronize_from_tb = mb_cpu_synchronize_from_tb;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 350f1c66c7..929f98a57a 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -677,7 +677,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->class_by_name = mips_cpu_class_by_name;
     cc->has_work = mips_cpu_has_work;
     cc->do_interrupt = mips_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = mips_cpu_exec_interrupt;
     cc->dump_state = mips_cpu_dump_state;
     cc->set_pc = mips_cpu_set_pc;
     cc->gdb_read_register = mips_cpu_gdb_read_register;
@@ -691,6 +690,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->disas_set_info = mips_cpu_disas_set_info;
 #ifdef CONFIG_TCG
     cc->tcg_ops.initialize = mips_tcg_init;
+    cc->tcg_ops.cpu_exec_interrupt = mips_cpu_exec_interrupt;
     cc->tcg_ops.synchronize_from_tb = mips_cpu_synchronize_from_tb;
     cc->tlb_fill = mips_cpu_tlb_fill;
 #endif
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index c28eb05ef0..b0d51f77f5 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -222,7 +222,7 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = nios2_cpu_class_by_name;
     cc->has_work = nios2_cpu_has_work;
     cc->do_interrupt = nios2_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = nios2_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = nios2_cpu_exec_interrupt;
     cc->dump_state = nios2_cpu_dump_state;
     cc->set_pc = nios2_cpu_set_pc;
     cc->disas_set_info = nios2_cpu_disas_set_info;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index a957f59e2e..48c416e138 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -187,7 +187,7 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = openrisc_cpu_class_by_name;
     cc->has_work = openrisc_cpu_has_work;
     cc->do_interrupt = openrisc_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = openrisc_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = openrisc_cpu_exec_interrupt;
     cc->dump_state = openrisc_cpu_dump_state;
     cc->set_pc = openrisc_cpu_set_pc;
     cc->gdb_read_register = openrisc_cpu_gdb_read_register;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1e9bd3c313..81ec7e6c99 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -594,7 +594,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->class_by_name = riscv_cpu_class_by_name;
     cc->has_work = riscv_cpu_has_work;
     cc->do_interrupt = riscv_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = riscv_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = riscv_cpu_exec_interrupt;
     cc->dump_state = riscv_cpu_dump_state;
     cc->set_pc = riscv_cpu_set_pc;
     cc->tcg_ops.synchronize_from_tb = riscv_cpu_synchronize_from_tb;
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 4e0de14eef..9493e9031a 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -187,7 +187,7 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
     cc->class_by_name = rx_cpu_class_by_name;
     cc->has_work = rx_cpu_has_work;
     cc->do_interrupt = rx_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = rx_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = rx_cpu_exec_interrupt;
     cc->dump_state = rx_cpu_dump_state;
     cc->set_pc = rx_cpu_set_pc;
     cc->tcg_ops.synchronize_from_tb = rx_cpu_synchronize_from_tb;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 890781e74c..53c2f6f89e 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -508,7 +508,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->get_crash_info = s390_cpu_get_crash_info;
     cc->write_elf64_note = s390_cpu_write_elf64_note;
 #ifdef CONFIG_TCG
-    cc->cpu_exec_interrupt = s390_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = s390_cpu_exec_interrupt;
     cc->debug_excp_handler = s390x_cpu_debug_excp_handler;
     cc->do_unaligned_access = s390x_cpu_do_unaligned_access;
 #endif
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 130debe074..b2d4e3648c 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -220,7 +220,7 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = superh_cpu_class_by_name;
     cc->has_work = superh_cpu_has_work;
     cc->do_interrupt = superh_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = superh_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = superh_cpu_exec_interrupt;
     cc->dump_state = superh_cpu_dump_state;
     cc->set_pc = superh_cpu_set_pc;
     cc->tcg_ops.synchronize_from_tb = superh_cpu_synchronize_from_tb;
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 0ae38eb496..139939494e 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -864,7 +864,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     cc->parse_features = sparc_cpu_parse_features;
     cc->has_work = sparc_cpu_has_work;
     cc->do_interrupt = sparc_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = sparc_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = sparc_cpu_exec_interrupt;
     cc->dump_state = sparc_cpu_dump_state;
 #if !defined(TARGET_SPARC64) && !defined(CONFIG_USER_ONLY)
     cc->memory_rw_debug = sparc_cpu_memory_rw_debug;
diff --git a/target/tilegx/cpu.c b/target/tilegx/cpu.c
index cd24d0eb9d..4c6176d26e 100644
--- a/target/tilegx/cpu.c
+++ b/target/tilegx/cpu.c
@@ -148,7 +148,7 @@ static void tilegx_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = tilegx_cpu_class_by_name;
     cc->has_work = tilegx_cpu_has_work;
     cc->do_interrupt = tilegx_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = tilegx_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = tilegx_cpu_exec_interrupt;
     cc->dump_state = tilegx_cpu_dump_state;
     cc->set_pc = tilegx_cpu_set_pc;
     cc->tlb_fill = tilegx_cpu_tlb_fill;
diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
index 226bf4226e..84c3419989 100644
--- a/target/unicore32/cpu.c
+++ b/target/unicore32/cpu.c
@@ -132,7 +132,7 @@ static void uc32_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = uc32_cpu_class_by_name;
     cc->has_work = uc32_cpu_has_work;
     cc->do_interrupt = uc32_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = uc32_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = uc32_cpu_exec_interrupt;
     cc->dump_state = uc32_cpu_dump_state;
     cc->set_pc = uc32_cpu_set_pc;
     cc->tlb_fill = uc32_cpu_tlb_fill;
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 5a6f5bf88b..42a5e4ebe8 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -195,7 +195,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = xtensa_cpu_class_by_name;
     cc->has_work = xtensa_cpu_has_work;
     cc->do_interrupt = xtensa_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = xtensa_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = xtensa_cpu_exec_interrupt;
     cc->dump_state = xtensa_cpu_dump_state;
     cc->set_pc = xtensa_cpu_set_pc;
     cc->gdb_read_register = xtensa_cpu_gdb_read_register;
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 189f27cd1c..2b0343686f 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10700,6 +10700,7 @@ static void ppc_cpu_reset(DeviceState *dev)
 }
 
 #ifndef CONFIG_USER_ONLY
+
 static bool ppc_cpu_is_big_endian(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
@@ -10710,6 +10711,7 @@ static bool ppc_cpu_is_big_endian(CPUState *cs)
     return !msr_le;
 }
 
+#ifdef CONFIG_TCG
 static void ppc_cpu_exec_enter(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
@@ -10731,7 +10733,9 @@ static void ppc_cpu_exec_exit(CPUState *cs)
         vhc->cpu_exec_exit(cpu->vhyp, cpu);
     }
 }
-#endif
+#endif /* CONFIG_TCG */
+
+#endif /* !CONFIG_USER_ONLY */
 
 static void ppc_cpu_instance_init(Object *obj)
 {
@@ -10842,7 +10846,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = ppc_cpu_class_by_name;
     cc->has_work = ppc_cpu_has_work;
     cc->do_interrupt = ppc_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = ppc_cpu_exec_interrupt;
     cc->dump_state = ppc_cpu_dump_state;
     cc->dump_statistics = ppc_cpu_dump_statistics;
     cc->set_pc = ppc_cpu_set_pc;
@@ -10879,12 +10882,13 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
 #endif
 #ifdef CONFIG_TCG
     cc->tcg_ops.initialize = ppc_translate_init;
+    cc->tcg_ops.cpu_exec_interrupt = ppc_cpu_exec_interrupt;
     cc->tlb_fill = ppc_cpu_tlb_fill;
-#endif
 #ifndef CONFIG_USER_ONLY
-    cc->cpu_exec_enter = ppc_cpu_exec_enter;
-    cc->cpu_exec_exit = ppc_cpu_exec_exit;
-#endif
+    cc->tcg_ops.cpu_exec_enter = ppc_cpu_exec_enter;
+    cc->tcg_ops.cpu_exec_exit = ppc_cpu_exec_exit;
+#endif /* !CONFIG_USER_ONLY */
+#endif /* CONFIG_TCG */
 
     cc->disas_set_info = ppc_disas_set_info;
 
-- 
2.25.1


