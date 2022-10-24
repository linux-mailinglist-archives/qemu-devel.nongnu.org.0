Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C0760AE00
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:43:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxSS-0003Gs-5n; Mon, 24 Oct 2022 09:25:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSK-0003FK-5X
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:28 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSG-0003x6-Ji
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:27 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-13b103a3e5dso11838394fac.2
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7hCgNQMpOajbfDDqbMwdSH+6jBKQutGWCbpGwjxiCrc=;
 b=DQCAEQB4oD2ss2MfDt/18sj2dPTsvmBXZG6nyCQ70XO9N/pP4gA+gx0X6dFG9DQIkQ
 NLrRH+S7daPY2yeLCIE4He/TdLg3w5qg40q5f4rpTiHPumxXsGZtffSXIj7+woweY41F
 kvuXEnq+yRGT/P5vDScEQAopcDxIl7d6wLeuvDHlcQElWJP7T7uBgVnh0JoKbgtWNkMh
 4PPnR+RnfTad6ptc/1ObI+//9q0W2aMf2dJXFPtDhtD9SWncKL5+n4GcNIPLce8XmpBG
 JjCTsQhRiGYSZ1J8pa6Q/ARyQUr8Moq2CrQaXXLXQC2+m3yra7Tw1Fs+h/cR2k7P8GOY
 W2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7hCgNQMpOajbfDDqbMwdSH+6jBKQutGWCbpGwjxiCrc=;
 b=ndYuOgrbXdlbLWZECQjc3j58s/Y+adxWQB4n7vmfuWT2HFVlbJqo/PM7h2V1SGA37P
 IshW/OvTp+oIyNGFXUC9s4QB21iv6VoY4tlJ0y9mZFATSy8yPBW1eWnxN0yTh46H+RZc
 xfZ/VMRzEiRYYrjkXdvDgtCXOagIjZuHPf4L0GLRAN4mVz0JvXP5aoX4SQ8tPey6XgMJ
 rwY/6JWHX8Eh7tLjvL81bwJ7aQtuoWdEcBudnl1g7yERf9dCs2+M+Ht6B0nE1HGWb2Pn
 ORQNszSG+q6b6YxSBEJpCp3eRuivJpwubHIBOxoAOB977llnsJhKIqi1kykDB84Y8pc6
 kyFg==
X-Gm-Message-State: ACrzQf0L+9RXQoFjHVZvQqWIfPy9HMkjJ2zQ7AWG6dfCeLFYu6UYQHEz
 on7D2qQm4WXn4agK3uOrpqQ13yRPixXsnQ==
X-Google-Smtp-Source: AMsMyM5FBFGdKXAxDaOQdFYfJPTYq0EV6XNdXmrz5FxuK/8ZE/u7RCZH+lYtd6nOuEvMHZsP4dRmuQ==
X-Received: by 2002:a17:90b:3a8b:b0:20d:b254:e30e with SMTP id
 om11-20020a17090b3a8b00b0020db254e30emr38796571pjb.206.1666617911987; 
 Mon, 24 Oct 2022 06:25:11 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.25.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:25:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/29] accel/tcg: Add restore_state_to_opc to TCGCPUOps
Date: Mon, 24 Oct 2022 23:24:30 +1000
Message-Id: <20221024132459.3229709-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x36.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add a tcg_ops hook to replace the restore_state_to_opc
function call.  Because these generic hooks cannot depend
on target-specific types, temporarily, copy the current
target_ulong data[] into uint64_t d64[].

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h       |  2 +-
 include/hw/core/tcg-cpu-ops.h | 11 +++++++++++
 accel/tcg/translate-all.c     | 24 ++++++++++++++++++++++--
 3 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index e5f8b224a5..a772e8cbdc 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -40,7 +40,7 @@ typedef ram_addr_t tb_page_addr_t;
 #endif
 
 void restore_state_to_opc(CPUArchState *env, TranslationBlock *tb,
-                          target_ulong *data);
+                          target_ulong *data) __attribute__((weak));
 
 /**
  * cpu_restore_state:
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 78c6c6635d..20e3c0ffbb 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -31,6 +31,17 @@ struct TCGCPUOps {
      * function to restore all the state, and register it here.
      */
     void (*synchronize_from_tb)(CPUState *cpu, const TranslationBlock *tb);
+    /**
+     * @restore_state_to_opc: Synchronize state from INDEX_op_start_insn
+     *
+     * This is called when we unwind state in the middle of a TB,
+     * usually before raising an exception.  Set all part of the CPU
+     * state which are tracked insn-by-insn in the target-specific
+     * arguments to start_insn, passed as @data.
+     */
+    void (*restore_state_to_opc)(CPUState *cpu, const TranslationBlock *tb,
+                                 const uint64_t *data);
+
     /** @cpu_exec_enter: Callback for cpu_exec preparation */
     void (*cpu_exec_enter)(CPUState *cpu);
     /** @cpu_exec_exit: Callback for cpu_exec cleanup */
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 4ed75a13e1..19cd23e9a0 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -329,7 +329,6 @@ static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
 {
     target_ulong data[TARGET_INSN_START_WORDS];
     uintptr_t host_pc = (uintptr_t)tb->tc.ptr;
-    CPUArchState *env = cpu->env_ptr;
     const uint8_t *p = tb->tc.ptr + tb->tc.size;
     int i, j, num_insns = tb->icount;
 #ifdef CONFIG_PROFILER
@@ -368,7 +367,20 @@ static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
            and shift if to the number of actually executed instructions */
         cpu_neg(cpu)->icount_decr.u16.low += num_insns - i;
     }
-    restore_state_to_opc(env, tb, data);
+
+    {
+        const struct TCGCPUOps *ops = cpu->cc->tcg_ops;
+        __typeof(ops->restore_state_to_opc) restore = ops->restore_state_to_opc;
+        if (restore) {
+            uint64_t d64[TARGET_INSN_START_WORDS];
+            for (i = 0; i < TARGET_INSN_START_WORDS; ++i) {
+                d64[i] = data[i];
+            }
+            restore(cpu, tb, d64);
+        } else {
+            restore_state_to_opc(cpu->env_ptr, tb, data);
+        }
+    }
 
 #ifdef CONFIG_PROFILER
     qatomic_set(&prof->restore_time,
@@ -380,6 +392,14 @@ static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
 
 bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
 {
+    /*
+     * The pc update associated with restore without exit will
+     * break the relative pc adjustments performed by TARGET_TB_PCREL.
+     */
+    if (TARGET_TB_PCREL) {
+        assert(will_exit);
+    }
+
     /*
      * The host_pc has to be in the rx region of the code buffer.
      * If it is not we will not be able to resolve it here.
-- 
2.34.1


