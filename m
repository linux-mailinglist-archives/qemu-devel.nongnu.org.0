Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A3650A561
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:28:44 +0200 (CEST)
Received: from localhost ([::1]:51904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZff-0004wc-3d
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYd5-0005Yt-Sa
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:21:59 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:43641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYd3-00078l-W2
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:21:59 -0400
Received: by mail-il1-x131.google.com with SMTP id d3so3238245ilr.10
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hSpQoqfOsfIL8GnTDIMnUWFXCpFtmFqOPwLqzke7L4Y=;
 b=wGCUMdS5dZwITWSpdBiP5W2R6Obi1SjXLazcXORtL2ZQ/nMbxMg6YNIjjPkMlIPCdr
 oyMhpOgbPxp9uWJNcAyTRe9VnoM3NQSnzvMAvjrGv1Y4Vi2IF9gQUHPCB4EmG/PgB2qo
 oFjWv5jt2Cfhf+ItvMIFqr19301sOK3GBIngxkJWpYH5zL1trxolu4MpX8kJ2Tcm84Nd
 3AZv6ArwjA+Br/uEEkzgFO5WG7X67ttlYsqdOVRIp7xnotureZvoJ+F4CMObXougV9sh
 Tzft5i+siVpBzv9Y0cHHo7/hUfMXJHU/yIUq/avj/hDydA6FTagjDu1bVTw2uiGXQ+ZY
 aNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hSpQoqfOsfIL8GnTDIMnUWFXCpFtmFqOPwLqzke7L4Y=;
 b=7/I63XXCNePbPpz0ZtsqK07fcq6OJZH2gbYxay4N5O807ub9Rf77Dk2uyCkvXvJ1J5
 2lLaqCaGkGJ3cHAV5oFV9YlWejMQBvhosloNuyeAyzplr1d9wz5RwhKhGi1sL4Co1uxT
 wfI0Ioq/eMI8GMBlRK2nB7+hKDOjufFrVif9XKfJqMHoaYtaVTFeps+r+lhjS1+CgBdR
 /iVWFu4w7co4yjspnxRScwkYlYX8HxnsMnahiSkTMmqK+9+RIMZohJ0rV6ZbmadDxyJU
 2O8npVuJv1YV+1Uuzuc4Qi3Bb8rmx+5xI/d7rpPpb2MQXiGykpqFxuBEwxb0XdruWUha
 Yi2A==
X-Gm-Message-State: AOAM533X7vRICA6g6rORm416/n8OpqzCrGW2y1opCXukxW1eY0p9faGF
 JzfH7rotpKj3UUPFxUaEGmV/tM+QESW8Pw==
X-Google-Smtp-Source: ABdhPJxNVzp7N60YACG81u5IAOGX69FtWLYJE4gBe7Tq6epZb5Dta2PQRWklqLrDmNL3KF/YYV7W/g==
X-Received: by 2002:a05:6e02:1708:b0:2cb:fec7:93d3 with SMTP id
 u8-20020a056e02170800b002cbfec793d3mr75596ill.99.1650554516390; 
 Thu, 21 Apr 2022 08:21:56 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a926e01000000b002cc52449a19sm3985402ilc.35.2022.04.21.08.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:21:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 52/64] target/nios2: Implement Misaligned destination
 exception
Date: Thu, 21 Apr 2022 08:17:23 -0700
Message-Id: <20220421151735.31996-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Indirect branches, plus eret and bret optionally raise
an exception when branching to a misaligned address.
The exception is required when an mmu is enabled, but
enable it always because the fallback behaviour is not
documented (though presumably it discards low bits).

For the purposes of the linux-user cpu loop, if EXCP_UNALIGN
(misaligned data) were to arrive, it would be treated the
same as EXCP_UNALIGND (misaligned destination).  See the
!defined(CONFIG_NIOS2_ALIGNMENT_TRAP) block in kernel/traps.c.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c |  6 ++++++
 target/nios2/op_helper.c    |  9 ++++++++-
 target/nios2/translate.c    | 15 ++++++++++++++-
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 11ecb71843..30a27f252b 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -42,6 +42,12 @@ void cpu_loop(CPUNios2State *env)
             force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->pc);
             break;
 
+        case EXCP_UNALIGN:
+        case EXCP_UNALIGND:
+            force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN,
+                            env->ctrl[CR_BADADDR]);
+            break;
+
         case EXCP_TRAP:
             /*
              * TODO: This advance should be done in the translator, as
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index a19b504b0e..38a71a1f2d 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -64,6 +64,13 @@ uint32_t helper_divu(CPUNios2State *env, uint32_t num, uint32_t den)
 void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
 {
     Nios2CPU *cpu = env_archcpu(env);
+    CPUState *cs = env_cpu(env);
+
+    if (unlikely(new_pc & 3)) {
+        env->ctrl[CR_BADADDR] = new_pc;
+        cs->exception_index = EXCP_UNALIGND;
+        cpu_loop_exit_restore(cs, GETPC());
+    }
 
     /*
      * Both estatus and bstatus have no constraints on write;
@@ -74,6 +81,6 @@ void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
 
     env->ctrl[CR_STATUS] = new_status;
     env->pc = new_pc;
-    cpu_loop_exit(env_cpu(env));
+    cpu_loop_exit(cs);
 }
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index f0f5c6843a..827d957719 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -191,11 +191,24 @@ static void gen_goto_tb(DisasContext *dc, int n, uint32_t dest)
 
 static void gen_jumpr(DisasContext *dc, int regno, bool is_call)
 {
-    tcg_gen_mov_tl(cpu_pc, load_gpr(dc, regno));
+    TCGLabel *l = gen_new_label();
+    TCGv test = tcg_temp_new();
+    TCGv dest = load_gpr(dc, regno);
+
+    tcg_gen_andi_tl(test, dest, 3);
+    tcg_gen_brcondi_tl(TCG_COND_NE, test, 0, l);
+    tcg_temp_free(test);
+
+    tcg_gen_mov_tl(cpu_pc, dest);
     if (is_call) {
         tcg_gen_movi_tl(dest_gpr(dc, R_RA), dc->base.pc_next);
     }
     tcg_gen_lookup_and_goto_ptr();
+
+    gen_set_label(l);
+    tcg_gen_st_tl(dest, cpu_env, offsetof(CPUNios2State, ctrl[CR_BADADDR]));
+    t_gen_helper_raise_exception(dc, EXCP_UNALIGND);
+
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
-- 
2.34.1


