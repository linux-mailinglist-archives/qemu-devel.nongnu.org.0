Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 289B0311702
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:28:49 +0100 (CET)
Received: from localhost ([::1]:48606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8AWu-0007ub-5v
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:28:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A3E-0002hn-WB
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:58:10 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:45839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A39-0003bp-5W
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:58:07 -0500
Received: by mail-pg1-x530.google.com with SMTP id o21so4168839pgn.12
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wqRDnPxC3RxnOxn5WTlMaueEc2xxzwe38jPVUhiL4JU=;
 b=hvDO1NxEbtnrvJz6f97C5g4S1XdJE7DjZOZ9eq6ed6W7SQiHxutwA5dyKbCncFKtjl
 rawgY+rDTmh3ke4CwCuzKn6hlRH/Xq+kQFyKlZlMcL5VRpc4AoLNBWCYcDxFlqdzcNK3
 dhe1kwlpNg59s3XdhT8Nsifr0utH9ZYJGnoMzwrOVpWgBrVsDz5QiZEjAnluYQXpJLc6
 JxrEAFUmMC7DPJ4nVCkZrdHRTSZvZEbjs3QeYXXOYqTAlU4RKBlwn1ypWfOt1ge1HGGW
 pIQPGNAO+lSJV4d4sAWj3HIAfRXIvcfyEf4x5v0uhgg4nIZTNcb/hcHjPHt2Rz9fQfpf
 w6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wqRDnPxC3RxnOxn5WTlMaueEc2xxzwe38jPVUhiL4JU=;
 b=ZWz0zRxMhwQOdrmjkdKVogaxS2rQ04JziBm2T/3bGLF83FaYkDafNn/AkrD874Me1e
 BEUm8I2kxtSnP/CxaTJMh+pwHopaqM2oCOtfOLkwFgIY/K5vh7ZI+DvnjWJPdBoTKSK9
 uaxW3qq+oCTSe44xTWaJPqRfFUm6MSVhjOEQSgfVBOw7GZYjElG+h+/BI0s8GtTH7l1z
 NZuSJACpgrgm9RnM4JEf7CnuyiRdX9CgQNv6t8HN6NmTxqa2m3e2D4xXUTHW2TmxSaik
 cJUdB1JFXpI20Y2yVkFmBL2YEtX3dANhiKspss5hwLQk+eS9TN8SKEsrGNbNYzI0+W4K
 AF8A==
X-Gm-Message-State: AOAM532+ls4YIz+iGNd/GeqyQsEU7Yh2UmRZIqBwaRQiBgJeOJeYxA95
 tNewCR/cOwPia/iYoaOFO368z2sQ2BqiRFfF
X-Google-Smtp-Source: ABdhPJz6R9nwmyu89DYwsDv1GtY3a4/d5xJUBascuFSWuns+1tRZ818VVFszyq+vXjUA/viK2LbNnQ==
X-Received: by 2002:aa7:864d:0:b029:1d5:ca12:f0e6 with SMTP id
 a13-20020aa7864d0000b02901d5ca12f0e6mr6503228pfo.58.1612565880160; 
 Fri, 05 Feb 2021 14:58:00 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/46] cpu: Move debug_excp_handler to tcg_ops
Date: Fri,  5 Feb 2021 12:56:39 -1000
Message-Id: <20210205225650.1330794-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210204163931.7358-8-cfontana@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h     | 4 ++--
 accel/tcg/cpu-exec.c      | 4 ++--
 target/arm/cpu.c          | 2 +-
 target/i386/tcg/tcg-cpu.c | 2 +-
 target/lm32/cpu.c         | 2 +-
 target/s390x/cpu.c        | 2 +-
 target/xtensa/cpu.c       | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 94236b68d7..ff82eae939 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -117,6 +117,8 @@ typedef struct TcgCpuOperations {
     bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
                      MMUAccessType access_type, int mmu_idx,
                      bool probe, uintptr_t retaddr);
+    /** @debug_excp_handler: Callback for handling debug exceptions */
+    void (*debug_excp_handler)(CPUState *cpu);
 
 } TcgCpuOperations;
 
@@ -161,7 +163,6 @@ typedef struct TcgCpuOperations {
  * @gdb_write_register: Callback for letting GDB write a register.
  * @debug_check_watchpoint: Callback: return true if the architectural
  *       watchpoint whose address has matched should really fire.
- * @debug_excp_handler: Callback for handling debug exceptions.
  * @write_elf64_note: Callback for writing a CPU-specific ELF note to a
  * 64-bit VM coredump.
  * @write_elf32_qemunote: Callback for writing a CPU- and QEMU-specific ELF
@@ -224,7 +225,6 @@ struct CPUClass {
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
     bool (*debug_check_watchpoint)(CPUState *cpu, CPUWatchpoint *wp);
-    void (*debug_excp_handler)(CPUState *cpu);
 
     int (*write_elf64_note)(WriteCoreDumpFunction f, CPUState *cpu,
                             int cpuid, void *opaque);
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 953f050698..e7e54fd75d 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -512,8 +512,8 @@ static inline void cpu_handle_debug_exception(CPUState *cpu)
         }
     }
 
-    if (cc->debug_excp_handler) {
-        cc->debug_excp_handler(cpu);
+    if (cc->tcg_ops.debug_excp_handler) {
+        cc->tcg_ops.debug_excp_handler(cpu);
     }
 }
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 27a16c1950..66ac210b0c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2280,7 +2280,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->tcg_ops.cpu_exec_interrupt = arm_cpu_exec_interrupt;
     cc->tcg_ops.synchronize_from_tb = arm_cpu_synchronize_from_tb;
     cc->tcg_ops.tlb_fill = arm_cpu_tlb_fill;
-    cc->debug_excp_handler = arm_debug_excp_handler;
+    cc->tcg_ops.debug_excp_handler = arm_debug_excp_handler;
     cc->debug_check_watchpoint = arm_debug_check_watchpoint;
     cc->do_unaligned_access = arm_cpu_do_unaligned_access;
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 85b69224a9..6c1ebbdcc6 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -67,6 +67,6 @@ void tcg_cpu_common_class_init(CPUClass *cc)
     cc->tcg_ops.initialize = tcg_x86_init;
     cc->tcg_ops.tlb_fill = x86_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
-    cc->debug_excp_handler = breakpoint_handler;
+    cc->tcg_ops.debug_excp_handler = breakpoint_handler;
 #endif
 }
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index 76dc728858..bbe1405e32 100644
--- a/target/lm32/cpu.c
+++ b/target/lm32/cpu.c
@@ -235,7 +235,7 @@ static void lm32_cpu_class_init(ObjectClass *oc, void *data)
 #endif
     cc->gdb_num_core_regs = 32 + 7;
     cc->gdb_stop_before_watchpoint = true;
-    cc->debug_excp_handler = lm32_debug_excp_handler;
+    cc->tcg_ops.debug_excp_handler = lm32_debug_excp_handler;
     cc->disas_set_info = lm32_cpu_disas_set_info;
     cc->tcg_ops.initialize = lm32_translate_init;
 }
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index ceee62ddca..8ade66178e 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -509,7 +509,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->write_elf64_note = s390_cpu_write_elf64_note;
 #ifdef CONFIG_TCG
     cc->tcg_ops.cpu_exec_interrupt = s390_cpu_exec_interrupt;
-    cc->debug_excp_handler = s390x_cpu_debug_excp_handler;
+    cc->tcg_ops.debug_excp_handler = s390x_cpu_debug_excp_handler;
     cc->do_unaligned_access = s390x_cpu_do_unaligned_access;
 #endif
 #endif
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index e764dbeb73..b6f13ceb32 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -207,7 +207,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     cc->get_phys_page_debug = xtensa_cpu_get_phys_page_debug;
     cc->do_transaction_failed = xtensa_cpu_do_transaction_failed;
 #endif
-    cc->debug_excp_handler = xtensa_breakpoint_handler;
+    cc->tcg_ops.debug_excp_handler = xtensa_breakpoint_handler;
     cc->disas_set_info = xtensa_cpu_disas_set_info;
     cc->tcg_ops.initialize = xtensa_translate_init;
     dc->vmsd = &vmstate_xtensa_cpu;
-- 
2.25.1


