Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DE95107CF
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:00:49 +0200 (CEST)
Received: from localhost ([::1]:54762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQQa-00028k-JX
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:00:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPq3-0001sB-1W
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:23:04 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:37578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPq1-0005UD-0S
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:23:02 -0400
Received: by mail-pl1-x630.google.com with SMTP id b12so16231630plg.4
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EjEvoq47mgxbhwOkPjY+lzICTw8tSYJC5nzrZvKsO9E=;
 b=eUEwaLrbr0Gb8Ot2KghReSEr6GonJrQlWYyYTbuJGg7PYv4IE8KvHQkRCgy6tSep8e
 3jVXLQQIpxgqTZI67uP6u9UHwreMmBj6rJRqXqoyelPcbY7PM/3WtvUO4OXPAyrVPQhF
 4f2Fa//1P4wVvGnKfJN7ma6CNNM62ZZzTsOuxjbxnAOMgOlj1pTQ31U5sL51cYr5xe6q
 FJwp7KleYGV1e+0do+3HJyNXLpehDUDDX8rf8rtFhWnro0mbvDV4mVyaWPcHtQIqcLU2
 GtDRLh9btaxrNVyKtbpoG1tj2t++SzzJKHsil2j1xsUmUW869S5H3X2Nz/aetabps/ah
 LuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EjEvoq47mgxbhwOkPjY+lzICTw8tSYJC5nzrZvKsO9E=;
 b=16DuyG8dSSB0faM/AOiz0iGPqyWKmJ/l/FYYcfU/1KbYeJibCzCrjsm/0thWQtDjre
 0uI6uhwUPQWft6UXhAeCqcFO+xfbVt3yrYMK9W2F4CX2LuzWWxoJt9QFH1EGWnrpowZo
 t8kxNsxNisg569QLhLTMrZ1JN84AvFN1wpvrVAoI7eq2VS9bIoU64kgrP7B9U0mb4r4V
 WLs5Vr3p3vMzthyckTGibPE7d5T60l9CId2PYd7gWyd7wsdhvQzICMyJBJgi1klRe93S
 A0DO2fEt6w7zM5yvtnBhEoq/phtCJhlB5SWrbITPsdYLiX+HnxgxvPYbj3rYGf1DObXb
 t91Q==
X-Gm-Message-State: AOAM533jmEhfDzSB1G0qUwKuYsG6KGifK0uAKDtGZkwhvx15VSSqI1n+
 8wE4L4A27VqhJQvPxS+qrWpUUnX+M8VWHw==
X-Google-Smtp-Source: ABdhPJzezMrExOVyPz64mn0rHOwgy878TZdV5DHj5e8+k9x98I5AUrTv2hk1CrlQDzwqrGdgUyFarw==
X-Received: by 2002:a17:902:eb91:b0:15d:1f88:d993 with SMTP id
 q17-20020a170902eb9100b0015d1f88d993mr9128891plg.17.1650997379656; 
 Tue, 26 Apr 2022 11:22:59 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a636fc4000000b003983a01b896sm13585053pgc.90.2022.04.26.11.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:22:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 56/68] target/nios2: Implement Misaligned destination exception
Date: Tue, 26 Apr 2022 11:18:55 -0700
Message-Id: <20220426181907.103691-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Message-Id: <20220421151735.31996-53-richard.henderson@linaro.org>
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
index a3e87beba4..794b763d8a 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -197,11 +197,24 @@ static void gen_goto_tb(DisasContext *dc, int n, uint32_t dest)
 
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


