Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93723370D89
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 17:02:36 +0200 (CEST)
Received: from localhost ([::1]:60356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldDcB-0001VK-L2
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 11:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKi-0001MU-EN
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:32 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:37407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKf-0005C7-9S
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:32 -0400
Received: by mail-pl1-x630.google.com with SMTP id h20so1463888plr.4
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 07:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pbV3d5UOp4zIucQ+jGGDM6Fy1q3YuNEMSA2V6e1mngs=;
 b=K6UEHiKPttOa69GtDHZjvKrFO2c6MFK1N2XzQlg/X1nl3F6L5Ejfnh/r4mctmHvZyT
 QTjAeZhZ/Cgr6/8EWg5KsJNCAG+Fjkq0F13yR9tTJw3IPfrMuXb/i0b7ls/Y7El3Qksm
 OB4cUaITaWHb05thyvxzZxRm4+hBpeY1mQ554PIw9u9Dyd4FmeYzd9PIZO8tiJL7HNzQ
 FMLXpsY4n+ceuYEwmos/emPJMpZca8ZFiNZ+WZQ6Cf2CYLnlyutvT93XCHmDz/kAnbci
 rQuGqfcG+nEYWyJEkhCGv45g4vtVwO5T1o5kL/gDaGGr0LwlXIC/HEQcv0JOUYdhK5ZE
 ACKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pbV3d5UOp4zIucQ+jGGDM6Fy1q3YuNEMSA2V6e1mngs=;
 b=f0zZcmfZCQtJ9h9PfuPC8VgJGSECieS5UchzXnvyOqKv5Vt3v5PPmfQAiqoOMglyUU
 hIC0hUL2XDgz14UjNLlVhOSRGwdgRNUhor7rvWWYgk3yOcjHecqJ6Gva3Fi1vNx5wh+p
 0Q8B5qFTVbXmuiLajmuPqYMtL11ENiKSVBzKTKjri21Y/KR4kor94ZATA5yA6m08AIPU
 hnOs/vQW8ARLYQxIvD01/g+Hrb2HmRyFZM1iz6+MuYSaMEdPW8ZznNbmpIaa55+z0Zty
 meZz+3u0FOqkOz05f+KM6cm+xOq+LC1sqN0Dcxo5TDXdUW5Z/6mjrSjQT6iIBvtYy736
 dogQ==
X-Gm-Message-State: AOAM530biyY6ZhLKmCkoaZ8L3YT4Sig8tUswh6dDLV5P8IwlPeYscmPH
 vB4Ba0Cjrlp86ehpxuPgsh+d6vGrHmgD5A==
X-Google-Smtp-Source: ABdhPJyUxUvqzOdAsygSkLXmYUksYCjBELQr1v8wW8ki3qz9JqwR6XW1lwSR9I5JHzbN5oYXz/FGXw==
X-Received: by 2002:a17:902:9a0a:b029:e6:bf00:8a36 with SMTP id
 v10-20020a1709029a0ab02900e6bf008a36mr15616210plp.51.1619966666504; 
 Sun, 02 May 2021 07:44:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w14sm6889110pff.94.2021.05.02.07.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 07:44:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 09/31] Hexagon (target/hexagon) use env_archcpu and env_cpu
Date: Sun,  2 May 2021 07:43:57 -0700
Message-Id: <20210502144419.1659844-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502144419.1659844-1-richard.henderson@linaro.org>
References: <20210502144419.1659844-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Remove hexagon_env_get_cpu and replace with env_archcpu
Replace CPU(hexagon_env_get_cpu(env)) with env_cpu(env)

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1617930474-31979-5-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/cpu.h          | 5 -----
 linux-user/hexagon/cpu_loop.c | 2 +-
 target/hexagon/cpu.c          | 4 ++--
 target/hexagon/op_helper.c    | 2 +-
 target/hexagon/translate.c    | 2 +-
 5 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index e04eac591c..2855dd3881 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -127,11 +127,6 @@ typedef struct HexagonCPU {
     target_ulong lldb_stack_adjust;
 } HexagonCPU;
 
-static inline HexagonCPU *hexagon_env_get_cpu(CPUHexagonState *env)
-{
-    return container_of(env, HexagonCPU, env);
-}
-
 #include "cpu_bits.h"
 
 #define cpu_signal_handler cpu_hexagon_signal_handler
diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c
index 9a68ca05c3..bc34f5d7c3 100644
--- a/linux-user/hexagon/cpu_loop.c
+++ b/linux-user/hexagon/cpu_loop.c
@@ -25,7 +25,7 @@
 
 void cpu_loop(CPUHexagonState *env)
 {
-    CPUState *cs = CPU(hexagon_env_get_cpu(env));
+    CPUState *cs = env_cpu(env);
     int trapnr, signum, sigcode;
     target_ulong sigaddr;
     target_ulong syscallnum;
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index c2fe357702..f044506d0f 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -71,7 +71,7 @@ const char * const hexagon_regnames[TOTAL_PER_THREAD_REGS] = {
  */
 static target_ulong adjust_stack_ptrs(CPUHexagonState *env, target_ulong addr)
 {
-    HexagonCPU *cpu = hexagon_env_get_cpu(env);
+    HexagonCPU *cpu = env_archcpu(env);
     target_ulong stack_adjust = cpu->lldb_stack_adjust;
     target_ulong stack_start = env->stack_start;
     target_ulong stack_size = 0x10000;
@@ -115,7 +115,7 @@ static void print_reg(FILE *f, CPUHexagonState *env, int regnum)
 
 static void hexagon_dump(CPUHexagonState *env, FILE *f)
 {
-    HexagonCPU *cpu = hexagon_env_get_cpu(env);
+    HexagonCPU *cpu = env_archcpu(env);
 
     if (cpu->lldb_compat) {
         /*
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index 5d35dfc8f3..7ac85549db 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -35,7 +35,7 @@ static void QEMU_NORETURN do_raise_exception_err(CPUHexagonState *env,
                                                  uint32_t exception,
                                                  uintptr_t pc)
 {
-    CPUState *cs = CPU(hexagon_env_get_cpu(env));
+    CPUState *cs = env_cpu(env);
     qemu_log_mask(CPU_LOG_INT, "%s: %d\n", __func__, exception);
     cs->exception_index = exception;
     cpu_loop_exit_restore(cs, pc);
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index f975d7a5a1..e235fdb315 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -585,7 +585,7 @@ static void hexagon_tr_translate_packet(DisasContextBase *dcbase, CPUState *cpu)
          * The CPU log is used to compare against LLDB single stepping,
          * so end the TLB after every packet.
          */
-        HexagonCPU *hex_cpu = hexagon_env_get_cpu(env);
+        HexagonCPU *hex_cpu = env_archcpu(env);
         if (hex_cpu->lldb_compat && qemu_loglevel_mask(CPU_LOG_TB_CPU)) {
             ctx->base.is_jmp = DISAS_TOO_MANY;
         }
-- 
2.25.1


